// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// this contract is an interface to an external conttract
// "abstract" is since this contract has an unimplemented function 
abstract contract IScoreStore{
  // GetScore is the only function of the external contract that will be used by this contract
  // "virtual" needs to be added since the function does not have an implementation
  function GetScore(string memory name) public virtual returns (int);
}

contract MyGame {
  constructor() public { 
  }

  function ShowScore(string memory name) public returns (int){
    IScoreStore scoreStore = IScoreStore(0xFAC39A1012E40afA5bD443c000CCD6a34B2a0C21);
    return scoreStore.GetScore(name);

  }
}
