pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";

contract BaseOperations  is Ownable   {
 
 
 
 address private owner;
    uint256 a;
    uint256 b;
    uint256 c;
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

 struct Address {
       
        address tokenAddress;
    }

//Add
    
    function Add(uint256 a, uint256 b) public onlyOwner view returns (uint256) {
      
       return a +b;
    }

 
 
 //Divide

    
    function Divide(uint256 firstNumber , uint256 SecondNumber) public onlyOwner view returns(uint Ans, uint remainder){
     require(firstNumber > SecondNumber, "ERROR");
      Ans  = firstNumber / SecondNumber;
        remainder = firstNumber - SecondNumber * Ans;
   }
   
   
   //Multiply 
     function mul(uint256 firstNumber , uint256 SecondNumber) internal returns (uint256){
          for (uint j=1; j<=  SecondNumber;  j ++) {  
          Ans += firstNumber;        
      }
      return Ans;
     }
     
     
     function Multiply(uint256 firstNumber, uint256 SecondNumber) public onlyOwner  returns (uint256) {
     mul( firstNumber ,  SecondNumber);
     
     }
    
   
  
  function Check_Mul_Ans() public view returns(uint256){
      return Ans;

  }
  
  
  // getPercent
  
   function getPercent(uint firstNumber, uint SecondNumber) public pure returns(uint percent) {
        uint denominator = SecondNumber * 1000;
        require(denominator > SecondNumber);  
        uint temp = denominator / firstNumber + 5; 
        return temp / 10;
    }

// addAddresses

    mapping(bytes32 => Address[]) tokenSymbol;
   

    function addAddresses(bytes32 _name, address _tokenAddress) public {
        Address memory myTokenAddress = Address(_tokenAddress);
        tokenSymbol[_name].push(myTokenAddress);
    }

    
    function getAddress(bytes32 _name)  public view   returns (address[] memory addresss)
    {
        uint256 length = tokenSymbol[_name].length;
        addresss = new address[](length);

        for (uint256 i = 0; i < length; i++) {
            addresss[i] = tokenSymbol[_name][i].tokenAddress;
        }
    }

   
    function stringToBytes32(string memory source)
        public
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
    


}
