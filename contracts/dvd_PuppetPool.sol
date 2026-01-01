// SPDX-License-Identifier: MIT
// Adapted from Damn Vulnerable DeFi v4 src/puppet/PuppetPool.sol (MIT):
// OpenZeppelin ReentrancyGuard and Address are replaced by inline
// equivalents and DamnValuableToken by a minimal IERC20, the pool logic is unchanged.
pragma solidity =0.8.25;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract PuppetPool {
    uint256 public constant DEPOSIT_FACTOR = 2;

    address public immutable uniswapPair;
    IERC20 public immutable token;

    mapping(address => uint256) public deposits;
    bool private entered;

    error NotEnoughCollateral();
    error TransferFailed();

    event Borrowed(address indexed account, address recipient, uint256 depositRequired, uint256 borrowAmount);

    modifier nonReentrant() {
        require(!entered);
        entered = true;
        _;
        entered = false;
    }

    constructor(address tokenAddress, address uniswapPairAddress) {
        token = IERC20(tokenAddress);
        uniswapPair = uniswapPairAddress;
    }

    // Allows borrowing tokens by first depositing two times their value in ETH
    function borrow(uint256 amount, address recipient) external payable nonReentrant {
        uint256 depositRequired = calculateDepositRequired(amount);

        if (msg.value < depositRequired) {
            revert NotEnoughCollateral();
        }

        if (msg.value > depositRequired) {
            unchecked {
                (bool ok,) = payable(msg.sender).call{value: msg.value - depositRequired}("");
                require(ok);
            }
        }

        unchecked {
            deposits[msg.sender] += depositRequired;
        }

        // Fails if the pool doesn't have enough tokens in liquidity
        if (!token.transfer(recipient, amount)) {
            revert TransferFailed();
        }

        emit Borrowed(msg.sender, recipient, depositRequired, amount);
    }

    function calculateDepositRequired(uint256 amount) public view returns (uint256) {
        return amount * _computeOraclePrice() * DEPOSIT_FACTOR / 10 ** 18;
    }

    function _computeOraclePrice() private view returns (uint256) {
        // calculates the price of the token in wei according to Uniswap pair
        return uniswapPair.balance * (10 ** 18) / token.balanceOf(uniswapPair);
    }
}
