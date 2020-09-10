pragma solidity 0.5.12;

contract People{ 
 
    struct Person{
        string name;
        uint age;
        uint height;
        bool senior;
    }
 
    address internal owner; 

    modifier onlyOwner(){require(msg.sender == owner);_;}
 
    constructor() public{owner = msg.sender;}
    uint public balance; 
 
    mapping(address => Person) internal people;
    address[] private creators;
 
 
    function createPerson(string memory name, uint age, uint height) internal{
        require(age < 140, "Age needs to be below 140");
        balance += msg.value;
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        if(age >= 60){newPerson.senior=true;} else{newPerson.senior=false;}
        insertPerson(newPerson);
        creators.push(msg.sender);
     }
 
    function insertPerson(Person memory newPerson) internal {
         address creator = msg.sender;
         people[creator] = newPerson;
     }
     
    function getPerson() public view returns(string memory name, uint age, uint height, bool senior){
         return(people[msg.sender].name, people[msg.sender].age, people[msg.sender].height, people[msg.sender].senior);
     }
 
    function deletePerson(address creator) internal {
         delete people[creator];
         assert(people[creator].age == 0);
     }
    
    function getCreator(uint index) public view onlyOwner returns(address) {
        return creators[index];
    }

    function withdrawAll() public onlyOwner returns(uint){
        uint toTransfer = balance;
        balance = 0;
        msg.sender.transfer (toTransfer);
        return toTransfer;
    }

}