// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SPBridge is ReentrancyGuard {

    struct UserInfo {
        uint256 amount;
        uint256 timestamp;
    }

    // counter used on L2 to check if funds have been unstaked between two operations
    mapping(address => UserInfo) public users;

    function lock() payable external nonReentrant() {
        UserInfo storage user = users[msg.sender];
        user.amount += msg.value;
        user.timestamp = block.timestamp;
    }
}
