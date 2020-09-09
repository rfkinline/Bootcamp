pragma solidity 0.5.12;

contract HelloWorld{

    struct Person {
      string name;
      uint age;
      uint height;
      bool senior;
    }

    mapping (address => Person) private people;
    
    event PersonUpdated(string oldName, uint oldAge, uint oldHeight, bool oldSenior, string newName, uint newAge, uint newHeight, bool newSenior);

    function createPerson(string memory name, uint age, uint height) public {
        Person memory newPerson;
        newPerson.name = name;
        newPerson.age = age;
        newPerson.height = height;
        if(age >= 65){newPerson.senior = true;}else{newPerson.senior = false;}
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

}
