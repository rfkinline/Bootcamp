pragma solidity 0.5.12;

contract ERC20 {
    
// underscore to show that a variable is private    
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply; 
    address public owner;
    
    mapping (address => uint256) private _balances;
 
    constructor(string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
    
    function name() public view returns (string memory){
        return _name;
    }
    
    function symbol() public view returns (string memory){
        return _symbol;
    }
    
    function decimals() public view returns (uint8){
        return _decimals;
    }
    
    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }
    
    function balanceOf(address account) public view returns (uint256){
        return _balances[account];
    }

    function mint(address account, uint256 amount) public {
    // the 0 addess is non-existant and it is often used to burn tokens
        require(msg.sender == owner);
        require(account != address(0), "mint to the zero address");

        _totalSupply = _totalSupply + amount;
        _balances[account] = _balances[account] + amount;
    }

    function transfer(address recipient, uint256 amount) public returns (bool){
        require(recipient != address(0), "transfer to the zero address");
        require(_balances[msg.sender] >= amount, "Insufficient balance");

        _balances[msg.sender] = _balances[msg.sender] -  amount;
        _balances[recipient] = _balances[recipient] + amount;
        return true;
    }    
}