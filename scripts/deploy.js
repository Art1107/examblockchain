async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    const RegisterDisaster = await ethers.getContractFactory("RegisterDisaster");
    const registerDisaster = await RegisterDisaster.deploy();

    console.log("RegisterDisaster contract deployed to:", registerDisaster.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
