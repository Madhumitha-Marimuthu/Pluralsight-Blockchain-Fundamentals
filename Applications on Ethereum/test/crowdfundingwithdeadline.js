// Using the test contract with overridden method for getCurrentTime for testing
const CrowdFundingWithDeadline = artifacts.require("TestCrowdFundingWithDeadline");

contract("CrowdFundingWithDeadline", (accounts) => {
    
    let contract;
    let contractCreator = accounts[0];
    let beneficiary = accounts[1];

    const ONE_ETH = 1000000000000000000;

    beforeEach(async function(){
       contract = await CrowdFundingWithDeadline
       .new(
           'testFundingContract',
           1,
           10,
           beneficiary,
            // additional details
           {
            from: contractCreator,
            gas: 2000000
           }
       );
    });

    it('is contract initialized', async function() {
        // for all public fields in the contract, solidity creates an access method called 'call'
        let campaignName = await contract.name.call();
        expect(campaignName).to.equal('testFundingContract')

        let targetAmount = await contract.targetAmount.call();
        // targetAmount.toNumber() does not work
        expect(Number(targetAmount)).to.equal(ONE_ETH);

        let actualBeneficiary = await contract.beneficiary.call()
        expect(actualBeneficiary).to.equal(beneficiary)

        let actualState = await contract.state.call()
        // actualState.valueOf() does not work
        expect(actualState.toString()).to.equal('0')
        // alternate reference to enum -
        // expect(actualState.toString()).to.equal(CrowdFundingWithDeadline.State.Ongoing.toString())
        
        // check the deadline
        let actualDeadline = await contract.fundingDeadline.call();
        expect(Number(actualDeadline)).to.equal(600);

    })

    it('are funds contributed', async function(){
        await contract.contribute({
            value: ONE_ETH,
            from: contractCreator
        })

        // for basic types, Solidity creates a getter for the fields
        // for mappings, the getter takes in a parameter for the key
        let contributed = await contract
            .amounts
            .call(contractCreator);
        expect(Number(contributed)).to.equal(ONE_ETH);

    })
    
})