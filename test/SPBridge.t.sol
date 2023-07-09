// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SPBridge.sol";
import "../src/MockToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CounterTest is Test {
    SPBridge public spBridge;
    function setUp() public {
        spBridge = new SPBridge();
    }

    function testLockUnlock() public {
        spBridge.lock{value: 5}();
        
        assertEq(address(spBridge).balance, 5);
        
    }
}
