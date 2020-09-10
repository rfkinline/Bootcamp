pragma solidity 0.5.12;

contract HelloWorld{

    struct Person {
      string name;
      uint age;
      uint height;
      bool senior;
    }
    
    uint public balance;
    address public owner;
    address[] private creators;
    
    modifier costs(uint cost){
// before execution check if user has enough money
       require(msg.value >= cost);
       _;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller needs to be owner");
        _;  //this means: continue the execution
    }
    
    mapping (address => Person) private people;
    
    event PersonUpdated(string oldName, uint oldAge, uint oldHeight, bool oldSenior, string newName, uint newAge, uint newHeight, bool newSenior);

//    function createPerson(string memory name, uint age, uint height) public payable costs(1 ether) {            this when the costs are charged through modifier
    function createPerson(string memory name, uint age, uint height) public payable {
        balance += msg.value;
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
// different values depending on age
        if(age >= 65){require(msg.value >= 1 ether); newPerson.senior = true;}else{require(msg.value >= 2 ether); newPerson.senior = false;}
        address creator = msg.sender;
        people[creator] = newPerson;
    }

    function getPerson() public view returns(string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;
        return (people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }
    function updatePerson (string memory name, uint age, uint height) public {
        Person memory oldPerson = people[msg.sender];
        people[msg.sender].name =  name;
        people[msg.sender].age =  age;
        people[msg.sender].height =  height;
        if (age>=65){people[msg.sender].senior=true;}else{people[msg.sender].senior = false;}
        emit PersonUpdated(oldPerson.name, oldPerson.age, oldPerson.height,oldPerson.senior, 
                            name, age, height, people[msg.sender].senior);
    }
    
    function getCreator(uint index) public view onlyOwner returns (address) {
        return creators[index];
    }
    
    function withdrawAll () public onlyOwner returns(uint){
        uint toTransfer = balance;
        balance = 0;
    // with SEND you have to handle potential errors. custom error handling
        if(msg.sender.send(toTransfer)){
            // success
            return toTransfer;
        }
        else{
            balance = toTransfer;
            return 0;
        }
    }
    
// transfer will handle errors
//    function withdrawAll () public onlyOwner returns(uint){
//        uint toTransfer = balance;
//        balance = 0;
//        msg.sender.transfer(toTransfer);
//        return toTransfer;
//    }
}

