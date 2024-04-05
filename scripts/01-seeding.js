const { ethers } = require("hardhat");
const config = require("../src/config.json");
async function main(){
    const { chainId } = await ethers.provider.getNetwork();
    console.log(`Using ChainId ${chainId}`);
    const medical = await ethers.getContractAt(
        "healthrecordsystem",
        config[chainId].healthrecordsystem.address
    );
    console.log(
        `Health Record smart contract is fetched at address ${medical.target}`
    );
    
    
    let receipt = await medical.getRecordId.call()
    console.log(receipt)
    // console.log(`Record added with id ${await medical.}`);
}

main()
.then(() => process.exit(0))
.catch((error) => {

    console.log(error);
    process.exit(1);

});