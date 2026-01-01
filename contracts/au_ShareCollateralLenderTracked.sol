// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark: the fixed form of
// au_ShareCollateralLender. The vault prices shares from internally tracked
// assets, so a donation does not change the collateral value.
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract TrackedVault {
    IERC20 public immutable asset;
    uint256 public totalSupply;
    uint256 public totalAssets;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(IERC20 _asset) { asset = _asset; }

    function deposit(uint256 amount) external returns (uint256 shares) {
        shares = totalSupply == 0 ? amount : amount * totalSupply / totalAssets;
        totalSupply += shares;
        totalAssets += amount;
        balanceOf[msg.sender] += shares;
        require(asset.transferFrom(msg.sender, address(this), amount));
    }

    function transfer(address to, uint256 shares) external returns (bool) {
        balanceOf[msg.sender] -= shares;
        balanceOf[to] += shares;
        return true;
    }

    function approve(address spender, uint256 shares) external returns (bool) {
        allowance[msg.sender][spender] = shares;
        return true;
    }

    function transferFrom(address from, address to, uint256 shares) external returns (bool) {
        allowance[from][msg.sender] -= shares;
        balanceOf[from] -= shares;
        balanceOf[to] += shares;
        return true;
    }

    function convertToAssets(uint256 shares) public view returns (uint256) {
        return totalSupply == 0 ? shares : shares * totalAssets / totalSupply;
    }
}

contract ShareCollateralLenderTracked {
    TrackedVault public immutable vault;
    IERC20 public immutable loanAsset;
    mapping(address => uint256) public sharesOf;
    mapping(address => uint256) public debt;

    constructor(TrackedVault _vault, IERC20 _loanAsset) {
        vault = _vault;
        loanAsset = _loanAsset;
    }

    function depositShares(uint256 shares) external {
        require(vault.transferFrom(msg.sender, address(this), shares));
        sharesOf[msg.sender] += shares;
    }

    function borrow(uint256 amount) external {
        uint256 value = vault.convertToAssets(sharesOf[msg.sender]);
        require((debt[msg.sender] + amount) * 2 <= value, "undercollateralized");
        debt[msg.sender] += amount;
        require(loanAsset.transfer(msg.sender, amount));
    }
}
