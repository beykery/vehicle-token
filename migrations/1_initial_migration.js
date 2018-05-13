var Migrations = artifacts.require("./Migrations.sol");
var Vehicle = artifacts.require("./Vehicle.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Vehicle, "smartvin", "smartvin");
};
