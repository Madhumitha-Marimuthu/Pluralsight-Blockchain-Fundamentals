// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract CrowdFunding {
    uint deadline = 1660976984; // Saturday, 20 August 2022 06:29:44
    
    function checkDeadline() public view returns (bool) 
    {
        // use block time instead since system time can be different for nodes executing the contract
        uint currentTime = block.timestamp;
        // the blocktime is set by the miner
        // but the blockc time is not absolutely precise
        // there are limits set by the network that cant be violated by the miner

        // console.log();
        if (currentTime < deadline)
            return false;
        return true;
    }

    function blockDifficulty() public view returns (uint){
        return block.difficulty; // difficulty of the current block
        // other available fields are : 
        // block.gaslimit of current block
        // block.number  of current block
        // block.coinbase - miner address
    }

    function timeFields(uint mins) public pure returns (uint){
        uint oneSecond = 1 seconds;
        uint oneMinute = 1 minutes;
        uint oneHour = 1 hours;
        uint oneDay = 1 days;
        uint oneWeek = 1 weeks;

        uint inSeconds = mins * 1 seconds;
        return inSeconds;
    }

    function ethereumUnits(uint eth) public pure returns (uint){
        // units available are
        uint test = eth * 1 wei;

        return eth * 1 ether;
    }

    enum State {
        NotStarted,
        Started,
        Ended
    }

    function useEnum() public pure{
        
        State state = State.NotStarted;
        require (state == State.Started);

        
    }

    function currentTime() internal view returns(uint){
        return block.timestamp; // 'now' is depraecated
    }
}
