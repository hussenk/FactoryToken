// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./BaseCoin.sol";

contract Factory {
    address payable private _owner;
    uint256 private _fee = 1 * 10**18; //1
    address[] public tokens;
    address payable _factory;

    constructor() {
        _owner = payable(msg.sender);
        _factory = payable(address(this));
    }

    // // Function to receive Ether. msg.data must be empty
    // receive() external payable {}

    // // Fallback function is called when msg.data is not empty
    // fallback() external payable {}

    function getFactoryOwner() external view returns (address) {
        return _owner;
    }

    function getFactoryAddress() external view returns (address) {
        return _factory;
    }

    function countOfCreatedTokens() external view returns (uint256) {
        return tokens.length;
    }

    function getFactoryBalance() external view OnlyOwner returns (uint256) {
        return address(_factory).balance;
    }

    function setFee(uint256 fee_) external OnlyOwner returns (uint256) {
        _fee = fee_;
        return _fee;
    }

    function getFee() external view returns (uint256) {
        return _fee;
    }

    /**
     * owner modifier
     */
    modifier OnlyOwner() {
        require((msg.sender == _owner), "Sorry only Owner.");
        _;
    }

    function factoryGenerate(
        string memory name_,
        string memory symbol_,
        uint256 totalSuppl_
    ) external payable returns (address) {
        require(msg.value >= _fee, "you need send more money");
        // _factory.transfer(msg.value);
        // payable(msg.sender).transfer(msg.value);
        BaseCoin bc = new BaseCoin(msg.sender, totalSuppl_, symbol_, name_);
        tokens.push(bc.getContract());
        return bc.getContract();
    }

    function withdrawable(uint256 amount_) external OnlyOwner {
        payable(_owner).transfer(amount_);
    }
}
