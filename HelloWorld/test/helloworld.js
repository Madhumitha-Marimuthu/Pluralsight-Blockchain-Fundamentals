const HelloWorld = artifacts.require("HelloWorld");

contract("HelloWorld", (accounts) => {
    it("call the SayHello function", async () => {
      const helloWorldInstance = await HelloWorld.deployed();
      const message = await helloWorldInstance.SayHello.call();
  
      assert.equal(message.valueOf(), "Hello World !!", "Incorrect message returned by the function");
    });
  });