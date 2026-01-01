// SPDX-License-Identifier: MIT
// Derived fix of Damn Vulnerable DeFi v4 PuppetPool.sol (MIT): the token price
// comes from a Chainlink feed with freshness checks instead of the Uniswap V1
// pair balances that one swap can move.
pragma solidity =0.8.25;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
}

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract PuppetPoolChainlink {
    uint256 public constant DEPOSIT_FACTOR = 2;
    uint256 public constant HEARTBEAT = 1 hours;

    AggregatorV3Interface public immutable priceFeed; // token price in wei, 18 decimals
    IERC20 public immutable token;
    mapping(address => uint256) public deposits;
    bool private entered;

    error NotEnoughCollateral();
    error TransferFailed();

    modifier nonReentrant() {
        require(!entered);
        entered = true;
        _;
        entered = false;
    }

    constructor(address tokenAddress, AggregatorV3Interface feed) {
        token = IERC20(tokenAddress);
        priceFeed = feed;
    }

    function borrow(uint256 amount, address recipient) external payable nonReentrant {
        uint256 depositRequired = calculateDepositRequired(amount);
        if (msg.value < depositRequired) revert NotEnoughCollateral();
        deposits[msg.sender] += depositRequired;
        if (msg.value > depositRequired) {
            (bool ok,) = payable(msg.sender).call{value: msg.value - depositRequired}("");
            require(ok);
        }
        if (!token.transfer(recipient, amount)) revert TransferFailed();
    }

    function calculateDepositRequired(uint256 amount) public view returns (uint256) {
        return amount * _oraclePrice() * DEPOSIT_FACTOR / 10 ** 18;
    }

    function _oraclePrice() private view returns (uint256) {
        (uint80 roundId, int256 answer,, uint256 updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();
        require(answer > 0 && answeredInRound >= roundId, "bad round");
        require(updatedAt != 0 && block.timestamp - updatedAt <= HEARTBEAT, "stale");
        return uint256(answer);
    }
}
