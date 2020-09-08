pragma solidity 0.5.12;

contract HelloWorld{
    struct Person {
        string name;
        uint age;
        uint height;
        bool senior;
    }
    
    mapping(address => Person) private people;

    function addPerson(string memory name, uint age, uint height, bool senior) public{
        address creator = msg.sender;
        people[creator] = Person(name, age, height, senior);
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


