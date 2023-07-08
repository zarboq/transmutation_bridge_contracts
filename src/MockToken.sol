pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockToken is Ownable, ERC20("Mock", "MOCK") {

    function mint(address _account, uint256 _amount) external {
        _mint(_account, _amount);
    }
}