// SPDX-License-Identifier: MIT
pragma solidity >=0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SmartToken is ERC20 {
    uint256 initialSupply = 1000 * (10**uint256(decimals()));
    constructor() ERC20("BRToken", "BRT") {
        _mint(msg.sender, initialSupply);
    }
}