// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

contract CrowdFundingWithDeadline {

    // The valueof the states will start from 0
    // Ongoing is 0, Succeeded is 2 etc
    enum State {Ongoing, Failed, Succeeded, PaidOut}
    
    // name of the project
    string public name;
    // amount in Wei
    uint public targetAmount;
    // eopch end time
    uint public fundingDeadline;
    address public beneficiary;
    // state of teh contract
    State public state;

    constructor(
        // using memory since this value will be copied to a storage variable later and is hence needed only at initialization
        string memory contractName,
        uint targetAmountEth,
        uint durationInMin,
        address beneficiaryAddress
    )

    public{
        name = contractName;
        targetAmount = targetAmountEth * 1 ether;// 1 ether = 1e18 Wei
        fundingDeadline = currentTime() + durationInMin * 1 minutes;
        beneficiary = beneficiaryAddress;
        state = State.Ongoing;
    }

    function currentTime() internal view returns(uint){
        return block.timestamp; // 'now' is depraecated
    }


}