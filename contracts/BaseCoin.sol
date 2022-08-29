// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BaseCoin is ERC20 {
    address private _owner;

    constructor(
        address sender,
        uint256 initialSupply_,
        string memory name_,
        string memory symbol_ 
     )payable  ERC20(name_, symbol_ )   {
        _owner = sender;
        _mint(_owner, initialSupply_);
    }

    function getOwner() external view returns (address) {
        return _owner;
    }

    function getContract() external view returns (address) {
        return address(this);
    }

    function changeOwner(address _newOwner)
        external
        OnlyOwner
        returns (address)
    {
        _owner = _newOwner;
        return (_newOwner);
    }

    /**
     * owner modifier
     */
    modifier OnlyOwner() {
        require((msg.sender == _owner), "Sorry only Owner.");
        _;
    }
}
