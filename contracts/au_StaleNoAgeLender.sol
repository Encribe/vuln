// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Pattern: Chainlink latestRoundData
// read without any check on updatedAt or the answer (a recurring Code4rena and
// Sherlock finding, e.g. "Chainlink oracle data could be stale").
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

contract StaleNoAgeLender {
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
        (, int256 answer,,,) = feed.latestRoundData();
        return uint256(answer);
    }

    function borrow(uint256 amount) external {
        uint256 value = collateralEth[msg.sender] * price() / 1e8;
        require((debt[msg.sender] + amount) * 2 <= value, "undercollateralized");
        debt[msg.sender] += amount;
        require(debtToken.transfer(msg.sender, amount));
    }
}
