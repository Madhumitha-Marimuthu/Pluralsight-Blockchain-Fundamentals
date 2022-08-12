// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
// pragma solidity ^0.4.22;

contract HelloWorld {

  // 
  // the storage location must be specified for return variable also
  // "memory" is temporary; lifetime is limited to a function call; store variables; nonpersistent 
  // "calldata" is allocated by the caller; can be used only in function declaration params; immutable; 
  // "storage" state variable. stored on the blockchain
  
  // state mutability modifiers
  // "pure" - return static data
  // "view" - view data from contract state

  // Typical function declaration 
  // function functionname() <visibility-specifier> <modifier> returns (type) {
  // return typevalue;
  // }
  // https://www.w3schools.io/blockchain/solidity-function/
  function SayHello() public pure returns (string memory) 
  {
    return "Hello World !!";
  }
}
