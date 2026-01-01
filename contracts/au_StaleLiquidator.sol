// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Pattern: liquidation priced from a
// Chainlink answer of unchecked age, so a stale low price lets anyone seize
// healthy collateral.
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

contract StaleLiquidator {
    AggregatorV3Interface public immutable feed;
    IERC20 public immutable debtToken;
    mapping(address => uint256) public collateralEth;
    mapping(address => uint256) public debt;

    constructor(AggregatorV3Interface _feed, IERC20 _debtToken) {
        feed = _feed;
        debtToken = _debtToken;
    }

    function open(uint256 amount) external payable {
        collateralEth[msg.sender] += msg.value;
        debt[msg.sender] += amount;
        require(healthy(msg.sender), "undercollateralized");
        require(debtToken.transfer(msg.sender, amount));
    }

    function healthy(address who) public view returns (bool) {
        (, int256 answer,, uint256 updatedAt,) = feed.latestRoundData();
        updatedAt;
        require(answer > 0);
        return collateralEth[who] * uint256(answer) / 1e8 >= debt[who] * 2;
    }

    function liquidate(address who) external {
        require(!healthy(who), "healthy");
        require(debtToken.transferFrom(msg.sender, address(this), debt[who]));
        uint256 seized = collateralEth[who];
        collateralEth[who] = 0;
        debt[who] = 0;
        (bool ok,) = payable(msg.sender).call{value: seized}("");
        require(ok);
    }
}
