//var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var ExistenceStorage = artifacts.require("./Existence.sol");


module.exports = function(deployer) {
  deployer.deploy(ExistenceStorage);

};
