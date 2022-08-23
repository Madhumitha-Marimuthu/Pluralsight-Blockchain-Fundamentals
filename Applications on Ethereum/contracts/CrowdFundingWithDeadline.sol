// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

contract CrowdFundingWithDeadline {

    // The valueof the states will start from 0
    // Ongoing is 0, Succeeded is 2 etc
    // This cant be directly accessed from a child contract. Why ?
    enum State {Ongoing, Failed, Succeeded, PaidOut}
    
    // Contract identification fields
    // name of the project
    string public name;
    // amount in Wei
    uint public targetAmount;
    // eopch end time
    uint public fundingDeadline;
    address public beneficiary;
    // state of the contract
    // by default the value will be the first declared member of the enum ie Ongoing
    State public state;

    // Contract functional fields
    // map to track amount pledged
    mapping(address => uint) public amounts;
    // funding achieved or not ?
    bool public collected;
    // total amount collected
    uint totalCollected;
    
    // modifier to verify the state of the contract
    modifier inState(State expectedState){
        require(state == expectedState, "Contract is in invalid state");
        // continues with the execution of the method
        _;
    }

    // constructors do not need visibility modifiers like public.
    constructor(
        // using memory since this value will be copied to a storage variable later and is hence needed only at initialization
        string memory contractName,
        uint targetAmountEth,
        uint durationInMin,
        address beneficiaryAddress
    )
    
    {
        name = contractName;
        targetAmount = targetAmountEth * 1 ether;// 1 ether = 1e18 Wei
        fundingDeadline = currentTime() + durationInMin * 1 minutes;
        beneficiary = beneficiaryAddress;
        state = State.Ongoing;
    }

    // ading 'virtual' keyword since this method can be overriden
    function currentTime() internal virtual view returns(uint){
        return block.timestamp; // 'now' is depraecated
    }

    // This method expects the contract to be in "Ongoing" status
    // Custom modifiers should be after standard modifiers like 'public'
    // Functions and addresses declared payable can receive ether into the contract
    function contribute() public payable inState(State.Ongoing) returns(uint) {
        amounts[msg.sender] += msg.value;
        totalCollected += msg.value;

        // check if target funding is achieved
        if(totalCollected == targetAmount) {
            // set collected flag to true
            collected = true;
            // comment to test remix online commit
        }
    }

    


}