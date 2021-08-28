pragma solidity >=0.7.0 <0.9.0;

contract Token_Address {
    
   
  
    
    struct Address {
       
        address tokenAddress;
    }
    
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
