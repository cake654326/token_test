pragma solidity ^0.5.0;

import "./token_cx.sol";

// import "IERC20.sol";
import "./Address.sol";
// import "./SafeMath.sol";

// import "SafeERC20.sol";
// import @openzeppelin/contracts/token/ERC20/SafeERC20.sol
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/SafeERC20.sol";
// import “https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol 1”;


contract Test {
    using Address for address;
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    uint256 internal _totalSupply;
    mapping(address => uint256) internal _balances;

    constructor() public {
        _totalSupply = 1 * 10 ** 18;
        _balances[msg.sender] = _totalSupply;
    }
    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }
    
    function hh_approve(address yAddr , address _spender, uint256 _value) public returns (bool success) {
        IERC20 y = IERC20(yAddr);
        //approve(address _spender, uint256 _value) 
        return y.approve( _spender ,  _value ) ;
        // return true;
    }
    
    function sign_transfer(address yAddr , address _spender, uint256 _value , uint256 amount ) public returns (bool success) {
        IERC20 y = IERC20(yAddr);
        //approve(address _spender, uint256 _value) 
        y.approve( _spender ,  _value ) ;
        
        //transfer(address _to, uint256 _value)
        y.transfer(_spender , amount);
        return true;
    }
    
    

    function withdraw(address yAddr,uint256 amount) public {
        _totalSupply = _totalSupply.sub(amount);
        _balances[msg.sender] = _balances[msg.sender].sub(amount);
        IERC20 y = IERC20(yAddr);
        y.safeTransfer(msg.sender, amount);
    }
}