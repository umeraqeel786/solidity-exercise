// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Divide {

    address private owner;
    uint256 firstNumber;
    uint256 SecondNumber;
    uint256 Ans;
    uint256 remainder;
    
    modifier onlyOwner() {
     require(msg.sender == owner, "ERROR This is not an Owner");
        _;
    }
  
    constructor() {
        owner = msg.sender; 
    }



    function First_No(uint x) public {
        
        firstNumber = x;
    }
    function Second_No(uint y) public {
        
        SecondNumber = y;
    }
    
    
    function getResult() public onlyOwner view returns(uint Ans, uint remainder){
     require(firstNumber > SecondNumber, "ERROR");
      Ans  = firstNumber / SecondNumber;
        remainder = firstNumber - SecondNumber * Ans;
   }

  

 
}
