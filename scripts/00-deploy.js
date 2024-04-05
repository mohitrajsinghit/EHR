const { ethers } = require("hardhat");
async function main() {
  // console.log("Deploying smart contract...");
  // const Medical = await ethers.getContractFactory("healthrecordsystem");
  // const account = await ethers.getSigners();
  // const medical = await Medical.connect(account[1]).deploy();
  const medical = await ethers.deployContract("healthrecordsystem")
  await medical.waitForDeployment();
  console.log(`Medical is deployed in address ${medical.target}`);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
