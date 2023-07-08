// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SPBridge {

    struct UserInfo {
        uint256 amount;
        uint32 counter;
    }

    // counter used on L2 to check if funds have been unstaked between two operations
    mapping(address => mapping(address => UserInfo)) public tokenToUser;

    function lock(address _token, uint256 _amount) external {
        IERC20(_token).transferFrom(msg.sender, address(this), _amount);
        UserInfo storage user = tokenToUser[_token][msg.sender];
        user.amount += _amount;
    }

    function unlock(address _token, uint256 _amount) external {
        UserInfo storage user = tokenToUser[_token][msg.sender];
        user.counter += 1;
        user.amount -= _amount;
        IERC20(_token).transfer(msg.sender, _amount);
    }
}
