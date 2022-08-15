// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./BaseCoin.sol";

contract Factory {
    address private _owner;
    constructor() {
        _owner = msg.sender;
    }

    function getOwner() external view returns (address) {
        return _owner;
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
        string memory sampel_,
        uint256 totalSuppl_
    ) public returns (address) {
        BaseCoin bc = new BaseCoin(totalSuppl_, sampel_, name_);
        return bc.getContract();
    }
}
