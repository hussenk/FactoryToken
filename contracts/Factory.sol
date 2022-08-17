// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./BaseCoin.sol";

contract Factory {
    address private _owner;
    address[] public tokens;

    constructor() {
        _owner = msg.sender;
    }

    function getFactoryOwner() external view returns (address) {
        return _owner;
    }

    function countOfCreatedTokens() external view returns(uint) {
        return tokens.length;
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
        BaseCoin bc = new BaseCoin(msg.sender, totalSuppl_, sampel_, name_);
        tokens.push(bc.getContract());
        return bc.getContract();
    }
}
