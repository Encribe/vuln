// SPDX-License-Identifier: MIT
// Authored for the solbend class benchmark. Pattern: a lender values vault
// shares at the vault's balanceOf-based share price, which a direct donation
// to the vault inflates (the shape of the 2022-2023 ERC4626 collateral
// incidents, e.g. Hundred Finance and the Sonne Finance donation).
pragma solidity ^0.8.20;

interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract DonationVault {
    IERC20 public immutable asset;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(IERC20 _asset) { asset = _asset; }

    function deposit(uint256 amount) external returns (uint256 shares) {
        uint256 held = asset.balanceOf(address(this));
        shares = totalSupply == 0 ? amount : amount * totalSupply / held;
        totalSupply += shares;
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
        return totalSupply == 0 ? shares : shares * asset.balanceOf(address(this)) / totalSupply;
    }
}

contract ShareCollateralLender {
    DonationVault public immutable vault;
    IERC20 public immutable loanAsset;
    mapping(address => uint256) public sharesOf;
    mapping(address => uint256) public debt;

    constructor(DonationVault _vault, IERC20 _loanAsset) {
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
