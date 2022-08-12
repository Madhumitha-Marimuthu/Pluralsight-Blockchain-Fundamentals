const CrowdFundingWithDeadline = artifacts.require("CrowdFundingWithDeadline");

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

    it('contract is initialized', async function() {
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
        expect(actualState.toString()).to.equal(CrowdFundingWithDeadline.State.Ongoing.toString())

    })
    
})