const main = async () => {
    // grab the wallet address of the contract owner and a random wallet address 
    const [owner, randomPerson] = await hre.ethers.getSigners(); 

    // compile our contract and generate the necessary files in the artifacts directory 
    const memeContractFactory = await hre.ethers.getContractFactory("MemeContract");

    //  Hardhat will create a local Ethereum network just for this contract
    const memeContract = await memeContractFactory.deploy({
        value: hre.ethers.utils.parseEther("0.1"), 
    });

    // wait until the contract is officially deployed to our local blockchain
    await memeContract.deployed();

    // waveContract.address  will give us the address of the deployed contract
    console.log("Contract deployed to: ", memeContract.address);

   // to see the address of the person deploying our contract
    console.log("Contract deployed by: ", owner.address);

    // get contract balance
    let contractBalance = await hre.ethers.provider.getBalance(
        memeContract.address
    );
    console.log("Contract balance", hre.ethers.utils.formatEther(
        contractBalance
    )); 

let memeCount;

// call the function to grab the # of total memes
memeCount = await memeContract.getTotalMemes();

// do the meme 
let memeTxn = await memeContract.meme("Hey yo friends, i'm back!");
await memeTxn.wait(); 

//  grab the memeCount one more time to see if it changed
memeCount = await memeContract.getTotalMemes();

memeTxn = await memeContract.connect(randomPerson).meme(); 
await memeTxn.wait(); 

memeCount = await memeContract.getTotalMemes(); 

};

const runMain = async () => {
    try {
        await main();
        process.exit(0); //exit node process without error
    } catch (error) {
        console.log(error); 
        process.exit(1); //exit node process while indicating 'uncaught fatal exception' error
    }
    
};

runMain();