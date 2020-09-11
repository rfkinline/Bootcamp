import './Assignment Week 6 Day 2 PeopleUdate.sol';
pragma solidity 0.5.12;

contract Destroyable is Peoples {
    address public owner;
    
  function destroy() public onlyOwner {
    address payable receiver = msg.sender;
    selfdestruct(receiver);
  }
}
