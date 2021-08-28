// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract MultiplyNumber {

    address private owner;
    uint256 firstNumber;
    uint256 SecondNumber;
    uint256 Ans;
  
    
    modifier onlyOwner() {
     require(msg.sender == owner, "ERROR This is not an Owner");
        _;
    }
  
    constructor() {
        owner = msg.sender; 
    }



     function mul(uint256 firstNumber , uint256 SecondNumber) internal returns (uint256){
          for (uint j=1; j<=  SecondNumber;  j ++) {  
          Ans += firstNumber;        
      }
      return Ans;
     }
     
     
     function Multiply(uint256 firstNumber, uint256 SecondNumber) public onlyOwner  {
     mul( firstNumber ,  SecondNumber);
     }
    
   

  
  function Check_Ans() public view returns(uint256){
      return Ans;
  }
 
}
