// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BaseCoin is ERC20 {
    address private _owner;

    constructor(
        uint256 _initialSupply,
        string memory _name,
        string memory _sampel
    ) ERC20(_name, _sampel) {
        _owner = msg.sender;
        _mint(_owner, _initialSupply);
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
