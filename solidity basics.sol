pragma solidity 0.5.12;

contract HelloWorld{
// variables
    // public = everybody can execute the function
    // private = only from within the contract (that also excludes Remix)
    // internal = p limits a functions visibility to the contract and all contracts that inherit from it.
    // external = only other contracts can execute functions
    string public message = "Hello World";
    uint public number = 123;
    bool public isHappy = true;
    address public contractCreator = 0x89b0A44b793209b4006FC203580866d331b7750F;

    function getNumber (uint index) public view returns (uint){
        return numbers[index];
    }

    function getMessage() public view returns (string memory){
        return message;
    }
    function setMessage (string memory newMessage) public {
        message = newMessage;
    }

// arrays ---------------------------------------------
    uint[] public numbers=[1,2,4,6];
    uint[4] public numbersmax=[1,2,4,6];   // [4] indicates maximum number in array
    string[] public animal = ["dog", "cat"];
    
// change value in array
    function setNumber (uint newNumber, uint index) public {
        numbers [index] = newNumber;
    }
    
// add value to array 
    function addNumber (uint newNumber) public {
        numbers.push(newNumber);
    }
// end arrays ---------------------------------------------    
    

// struct (object or data structure) ---------------------------------------------
    struct Person {
        uint id;
        string name;
        uint age;
        uint height;
    }

    Person[] public people;
    
    function addPerson(string memory name, uint age, uint height) public{
// people.person will be used as id when adding a person
        people.push(Person(people.length, name, age, height));
    }
// end struct ---------------------------------------------
}

