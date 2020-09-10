import "./People.sol";
pragma solidity 0.5.12;

contract Workers is People{
    
    event isFired(address workerAddress);
    
    mapping (address => uint) public salary; 
    
    function createWorker(string memory name, uint age, uint height, uint workerSalary, address workerAddress) public onlyOwner payable {
        require(msg.value >= 1 ether);   
// ager requirement
        require(age <= 75, "Worker should not be over 75 years.");
// worker not allowed to be his boss
        require(msg.sender != workerAddress); 
        createPerson(name, age, height); 
        salary[workerAddress] = workerSalary; 
    }

// fire function    
    function firedWorker(address workerAddress) public onlyOwner{
        deletePerson(workerAddress);
        delete salary[workerAddress];
    }
}