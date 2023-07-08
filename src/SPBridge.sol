// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/interfaces/IERC20";

contract SPBridge {

    struct UserInfo {
        uint256 amount;
        uint32 counter;
    }

    // counter used on L2 to check if funds have been unstaked between two operations
    mapping(address => UserInfo) public tokenToUser;

    function lock(address _token, uint256 _amount) external {
        
    }

    function unlock(address _token, uint256 _amount) external {

        
        UserInfo storage user = tokenToUser[_token];
        user.counter += 1;
        user.amount -= _amount;
    }
}
