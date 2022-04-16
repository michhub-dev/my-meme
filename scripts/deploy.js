const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();
  
    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());
  
    const memeContractFactory = await hre.ethers.getContractFactory("MemeContract");
    const memeContract = await memeContractFactory.deploy();
    await memeContract.deployed();
  
    console.log("memePortal address: ", memeContract.address);
  };
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();  