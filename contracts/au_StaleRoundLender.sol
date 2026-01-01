// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Pattern: the answer is checked to
// be positive but its age is never compared with a heartbeat, so a feed that
// stopped updating keeps pricing collateral.
pragma solidity ^0.8.20;

interface AggregatorV3Interface {
    function decimals() external view returns (uint8);
    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract StaleRoundLender {
    AggregatorV3Interface public immutable feed;
    IERC20 public immutable debtToken;
    mapping(address => uint256) public collateralEth;
    mapping(address => uint256) public debt;

    constructor(AggregatorV3Interface _feed, IERC20 _debtToken) {
        feed = _feed;
        debtToken = _debtToken;
    }

    function deposit() external payable {
        collateralEth[msg.sender] += msg.value;
    }

    function price() public view returns (uint256) {
        (uint80 roundId, int256 answer,,, uint80 answeredInRound) = feed.latestRoundData();
        require(answer > 0, "bad answer");
        require(answeredInRound >= roundId, "round");
        return uint256(answer);
    }

    function borrow(uint256 amount) external {
        uint256 value = collateralEth[msg.sender] * price() / 1e8;
        require((debt[msg.sender] + amount) * 2 <= value, "undercollateralized");
        debt[msg.sender] += amount;
        require(debtToken.transfer(msg.sender, amount));
    }
}
