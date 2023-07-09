// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SPBridge.sol";
import "../src/MockToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CounterTest is Test {
    SPBridge public spBridge;
    MockToken public mockToken;
    function setUp() public {
        spBridge = new SPBridge();
        mockToken = new MockToken();
    }

    function testLockUnlock() public {
        uint256 amount = 1000000;
        mockToken.mint(address(this), amount);
        mockToken.approve(address(spBridge), amount);
        spBridge.lock(address(mockToken), amount);
        
        assertEq(mockToken.balanceOf(address(spBridge)), amount);
        assertEq(mockToken.balanceOf(address(this)), 0);

        spBridge.unlock(address(mockToken), amount);

        assertEq(mockToken.balanceOf(address(this)), amount);
        assertEq(mockToken.balanceOf(address(spBridge)), 0);
        (,uint256 counter) = spBridge.tokenToUser(address(mockToken), address(this));
        assertEq(counter, 1);
    }
}
