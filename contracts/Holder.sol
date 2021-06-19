pragma solidity ^0.5.0;

import "./erc20/IERC20.sol";
import "./erc20/SafeERC20.sol";

contract Recipient {
    IERC20 private _token;

    event DoneStuff(address from, address to, uint256 amount);

    constructor (address token) public {
        _token = IERC20(token);
    }

    function doStuff() external {
        address from = msg.sender;
        address to = address(this);
        uint256 amount = 1e18;

        _token.transferFrom(from, to, amount);
        emit DoneStuff(from, to, amount);
    }
}

contract Holder {
    function approveOtherContract(IERC20 token, address recipient) public {
        token.approve(recipient, 1e18);
    }

    function doStuff(Recipient recipient) public {
        recipient.doStuff();
    }
}