pragma solidity 0.5.12;

contract HelloWorld{
    struct Person {
        string name;
        uint age;
        uint height;
        bool senior;
    }

// events create a log of events in our contract. they are called through emit and visible in the log 
    event personDeleted (string name, bool senior, address deletedBy);
    
    address public owner;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller needs to be owner");
        _;  //this means: continue the execution
    }
    
    constructor() public {
        owner = msg.sender;
    }
    

    mapping(address => Person) private people;
    
    address[] private creators;
    function getCreator(uint index) public view onlyOwner returns (address) {
        return creators[index];
    }

    function addPerson(string memory name, uint age, uint height, bool senior) public{
        require (age < 150, "Age needs to be under 150");
        address creator = msg.sender;
        people [creator]  = Person (name, age, height, senior);
        creators.push(msg.sender);
        assert (keccak256(abi.encodePacked(people[msg.sender].name, people[msg.sender].age, people[msg.sender].height, people[msg.sender].senior)) ==  
                keccak256(abi.encodePacked(people[creator].name, people[creator].age, people[creator].height, people[creator].senior)));
    }
    
    function getPerson() public view returns (address creator, string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;
        return (creator, people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }

    function deletePerson(address creator) public onlyOwner {
// these values need to be saved as they are used in the emit AFTER the deletion 
        string memory name = people[creator].name;
        bool senior = people[creator].senior;
        delete people[creator];

        emit personDeleted(name, senior, msg.sender);
        assert(people[creator].age == 0);
    }
}
