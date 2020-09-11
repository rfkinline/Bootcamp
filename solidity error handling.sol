pragma solidity 0.7.0;
// SPDX-License-Identifier: UNLICENSED

contract HelloWorld{
// require: check for enough GWEI and balance for transaction, check inputs somebody using your function,  example: require(msg.sender == owner)
// assert(): check for internal errors and check for invariants. Therefore an assert error should be unusual


// struct (object or data structure) ---------------------------------------------
    struct Person {
        string name;
        uint age;
        uint height;
        bool senior;
    }

// constructor is the function that runs whenever the contractor is created. It wilkl run only once. it cannot be called manually
    address public owner;
    constructor() public {
        owner = msg.sender;
    }
    
    mapping(address => Person) private people;
    
// only the owner can list the address
    address[] private creators;
    function getCreator(uint index) public view returns (address) {
        require(msg.sender == owner);
        return creators[index];
    }

    function addPerson(string memory name, uint age, uint height, bool senior) public{
// everything after the require will be executed if condition is met
        require (age < 150, "Age needs to be under 150");
        address creator = msg.sender;
        people[creator] = Person(name, age, height, senior);
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

    function deletePerson(address creator) public {
        require(msg.sender == owner, "Caller needs to be owner");
            delete people[creator];
// check age = 150
        assert(people[creator].age == 0);
    }
}
