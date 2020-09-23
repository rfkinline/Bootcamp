const HelloWorld = artifacts.require("HelloWorld");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(HelloWorld).then(function(instance){
      instance.addPerson("Bob",122,22,true).then(function(){
        instance.getPerson().then(function(instance){
            console.log("Current message: " + people);
        }).catch(function(err){
            console.log("error: "+ err);
        });
      });.catch(function(err){
        console.log("Deply Failed: "+ err);
  });
};

// 1) deploy, then change message, then check message

// network = rinkeby,... for if then procedures (if testnetwork, then.,..)

// we will send 1mil GWEI from the first account in ganache
// instance.addPerson("Bob",122,22,true, {value:1000000, from: accounts[0]}).then(function(){
// value:1000000, from: accounts[0]

