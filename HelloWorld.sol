// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
// pragma solidity ^0.4.22;

contract HelloWorld {

  // the storage location must be specified for return variable also
  // "memory" is temporary; lifetime is limited to a function call; store variables; nonpersistent 
  // "calldata" is allocated by the caller; can be used only in function declaration params; immutable; 
  function SayHello() public returns (string memory) 
  {
    return "Hello World !";
  }
}
