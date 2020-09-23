pragma solidity 0.5.12;

// Mapping is like a better array. A better data structure where we don't have to remember a position in an array or have to look through an entire array to find a person.

contract HelloWorld{
    struct Person {
        string name;
        uint age;
        uint height;
        bool senior;
    }
    
    // address = key type and it points to Person. We give mapping an address and it gives me a Person back. Name of mapping is people
    mapping(address => Person) private people;

// there are two ways to give a mapping the address:

//  function add Person(address creator, string memory name, uint age, uint height, bool senior) public{   // problem: I as a user can input any address
        function addPerson(string memory name, uint age, uint height, bool senior) public{
        address creator = msg.sender;

// this is how things are added to the mapping. With an array I needed .push
        people[creator] = Person(name, age, height, senior);
// the id from the previous array is not needed anymore        
        if(age > 65){
            people[creator].senior=true;
        }
//        else if(age<3){
//            infant = true;
//        }
        else{
            people[creator].senior=false;
        }
    }
    
    function getPerson() public view returns (string memory name, uint age, uint height, bool senior){
        address creator = msg.sender;

        return (people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }
    
}


