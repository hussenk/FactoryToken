// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

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

    

}
