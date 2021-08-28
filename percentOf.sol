// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Divide {

    address private owner;
    uint256 firstNumber;
    uint256 SecondNumber;
   

    
    modifier onlyOwner() {
     require(msg.sender == owner, "ERROR This is not an Owner");
        _;
    }
  
    constructor() {
        owner = msg.sender; 
    }


   // find the percentage of second number in first number.
    // Formula is  30/45 × 100 = 66.67%
    //The function returns the percentage defined in the second argument of the first
   //argument passed.
    

     function getPercent(uint firstNumber, uint SecondNumber) public pure returns(uint percent) {
        uint denominator = SecondNumber * 1000;
        require(denominator > SecondNumber);  
        uint temp = denominator / firstNumber + 5; 
        return temp / 10;
    }
  

 
}
