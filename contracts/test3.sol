pragma solidity ^0.5.0;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC20/IERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.4.0/contracts/token/ERC20/SafeERC20.sol";


import "./erc20/IERC20.sol";
import "./erc20/SafeERC20.sol";

contract Test3 {

    using SafeERC20 for IERC20;

    function tokenAllowAll(address asset, address allowee) public {
        IERC20 token = IERC20(asset);

        if (token.allowance(address(this), allowee) != uint256(-1)) {
            token.safeApprove(allowee, uint256(-1));
        }
    }
}