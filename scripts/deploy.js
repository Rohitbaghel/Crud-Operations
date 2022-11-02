// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Crud = await hre.ethers.getContractFactory("crud");
  const crud = await Crud.deploy();

  await crud.deployed();

  const response = await crud.create(
    "ap",
    "ao@gmail.com",
    21,
    "0x811508Ef1c38Bb0738C4DF46AebdeB4e5750f23F"
  );

  const getTotalNumberOfEmployees = await crud.totalEmployees();

  const employee = await crud.employees(0);
  console.log(employee);

  // await crud.updateEmployee("aashu", "rohit@gmail.com");
  //  const employee2 = await crud.employees(0);
   console.log(getTotalNumberOfEmployees);

  // const Updatelist = await crud.DeleteEmployee('op')
  // await crud.DeleteEmployee('aashu')
  // console.log(await crud.getAllData());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
