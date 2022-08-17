// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

import "./CrowdFundingWithDeadline.sol";

// This contract will be used to test the contract by setting the time. 
// Will be used only for testing.
contract TestCrowdFundingWithDeadline is CrowdFundingWithDeadline{
    uint time;

    // using the same constructor as the parent contract
    // The compiler asks to mark the parent contract as abstract when a method of the parent is not implemented in the child contract
    constructor(
        string memory contractName,
        uint targetAmountEth,
        uint durationInMin,
        address beneficiaryAddress
    )
    CrowdFundingWithDeadline(contractName, targetAmountEth,
    durationInMin, beneficiaryAddress)
    {
        // this constructor merely invokes the constructor of the parent contract
    }

    // use 'override' keyword for overriden functions
    function currentTime() internal override view returns(uint){
        return time;
    }
    
}