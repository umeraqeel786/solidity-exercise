// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract AddNumber {

    address private owner;
    uint256 a;
    uint256 b;
    uint256 c;
  
    
    modifier onlyOwner() {
     require(msg.sender == owner, "ERROR This is not an Owner");
        _;
    }
  
    constructor() {
        owner = msg.sender; 
    }

    
    function Add(uint256 a, uint256 b) public onlyOwner  {
        c = a+b;
       
    }

  
  function Check_Ans() public view returns(uint256){
      return c;
  }
 
}
