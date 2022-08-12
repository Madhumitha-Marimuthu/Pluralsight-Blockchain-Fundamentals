const CrowdFunding = artifacts.require("CrowdFunding");

contract("CrowdFunding", (accounts) => {
    it("deadline not passed", async () => {
      const crowdFundingInstance = await CrowdFunding.deployed();
      const message = await crowdFundingInstance.checkDeadline.call();
  
      assert.equal(message.valueOf(), false, "deadline should not have passed");
    });

    it("check block difficulty", async() => {
        const crowdFundingInstance = await CrowdFunding.deployed();
        const response = await crowdFundingInstance.blockDifficulty.call();

        console.log(response);

        // assert.
    })
  });