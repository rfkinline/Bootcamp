pragma solidity 0.5.12;
// SPDX-License-Identifier: UNLICENSED 

contract Week6Day1{
// arrays ---------------------------------------------
    string[] public people=["John","Ana","Jose"];

// change value in array
    function setPerson (string memory newPerson, uint index) public {
        people [index] = newPerson;
    }
    
// add value to array 
    function addPerson (string memory newPerson) public {
        people.push(newPerson);
    }
// display content of array    
    function getPerson (uint index) public view returns (string memory){
        return people [index];
    }  
// end arrays ---------------------------------------------    
    

// struct (object or data structure) ---------------------------------------------
    struct Persons {
        uint id;
        string name;
        uint age;
        uint height;
        address walletAddress;
    }

    Persons[] public peoples;
    
    function addPerson(string memory name, uint age, uint height, address walletAddress) public{
        walletAddress = msg.sender;
        peoples.push(Persons(peoples.length, name, age, height, walletAddress));
    }
// struct ---------------------------------------------
}




