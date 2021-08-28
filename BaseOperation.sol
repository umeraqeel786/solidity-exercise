pragma solidity >=0.7.0 <0.9.0;


import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";

contract BaseOperations  is  Ownable {
 
 
 address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

   
    constructor() {
        _setOwner(_msgSender());
    }
 function owner() public view virtual returns (address) {
        return _owner;
    }
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual onlyOwner {
        _setOwner(address(0));
    }
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _setOwner(newOwner);
    }

    function _setOwner(address newOwner) private {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }

}
