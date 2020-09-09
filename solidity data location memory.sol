pragma solidity 0.5.12;

contract HelloWorld{
// storage: what is stored permanently. Not for variables. As long as the contract lives. Is more expensive than memory
// memory: for strings and struct. only saved during function execution
// stack: local variables like uint. only saved during function execution


// struct (object or data structure) ---------------------------------------------
    struct Person {
        string name;
        uint age;
        uint height;
        bool senior;
    }

// will be called only at time of creation. Needed for the require
    address public owner;
    
//modifiers will be colled beofer a function
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller needs to be owner");
        _;  //this means: continue the execution
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    mapping(address => Person) private people;
    
// only the owner can list the address
    address[] private creators;
    function getCreator(uint index) public view onlyOwner returns (address) {
        return creators[index];
    }

    function addPerson(string memory name, uint age, uint height, bool senior) public{
// everything after the require will be executed if condition is met
        require (age < 150, "Age needs to be under 150");
        address creator = msg.sender;
        people [creator]  = Person (name, age, height, senior);
// add the address of the creator to a list
        creators.push(msg.sender);
// abi.encoded will create a hexadecimal string: reason: that way the content can be compared. keccak256 will hash the string
        assert (keccak256(abi.encodePacked(people[msg.sender].name, people[msg.sender].age, people[msg.sender].height, people[msg.sender].senior)) ==  
                keccak256(abi.encodePacked(people[creator].name, people[creator].age, people[creator].height, people[creator].senior)));
    }
    
    function getPerson() public view returns (address creator, string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;
        return (creator, people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }

    function deletePerson(address creator) public onlyOwner {
            delete people[creator];
// check age = 150
        assert(people[creator].age == 0);
    }
}
