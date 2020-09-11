pragma solidity 0.7.0;
import "Safemath.sol";

// uint8 8 bits in size. biggest number is 255. from 0

contract underflow{
// include "using ...", change all uint8 to uint 256 when doing calculations; when no calculation is done, then this change is not needed, change calculatios from + to .add

    using SafeMath for uint256;    // to avid overflow use SafeMath
    uint256 n = 0;
    function add() public returns (uint256){
        n = n.add(1);
        return n;
    }
    function substract() public returns (uint256){
        n = n.sub(1);
        return n;
    }

// Calculation without SafeMath    
    contract underflow{
    uint8 n = 0;
    function add() public returns (uint8){
        n += 1;
        return n;
    }
    function substract() public returns (uint8){
        n -= 1;
        return n;
    }
    
}