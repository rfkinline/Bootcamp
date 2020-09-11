pragma solidity 0.5.12;

contract Unsafe {
    mapping (address => uint256) private balance;
    function withdrawAll() public {
        uint256 toWithdraw = _balance[msg.sender];
        (bool success,) = msg.sender.call.value(toWithdraw)("");
        if (success){_balance[msg.sender]=0;}
    }    
}
contract Safe {
 // Follow the follwing pattern: Check - Effects - Interactions   
    mapping (address => uint256) private balance;
    function withdrawAll() public {
        require(balance[msg.sender]>0);    // Check 
        uint256 toWithdraw = balance[msg.sender];
        balance[msg.sender]=0;   // Effect . This was before the if clause. No we need to do something in case of failure of transfer
        (bool success,) = msg.sender.call.value(toWithdraw)("");
        if(!success){balance[msg.sender]=toWithdraw;}  // this is needed when transfer fails        
    }    
}

contract SafeBest {
 // Follow the follwing pattern: Check - Effects - Interactions   
    mapping (address => uint256) private balance;
    function withdrawAll() public {
        require(balance[msg.sender]>0);    // Check 
        uint256 toWithdraw = balance[msg.sender];
        balance[msg.sender]=0;   // Effect . This was before the if clause. No we need to do something in case of failure of transfer
        msg.sender.transfer(toWithdraw);
    }    
}