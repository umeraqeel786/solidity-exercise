pragma solidity >=0.7.0 <0.9.0;

contract Token_Address {
    
   
  
    
    struct Address {
       
        address tokenAddress;
    }
    
    mapping(bytes32 => Address[]) tokenSymbol;



//As Name type in bytes so first we need to covert our name to bytes 
//below is function  that convert the stringToBytes

    function addAddresses(bytes32 _name, address _tokenAddress) public {
        Address memory myTokenAddress = Address(_tokenAddress);
        tokenSymbol[_name].push(myTokenAddress);
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
