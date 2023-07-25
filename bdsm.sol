// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BDSM is ERC20 {
    constructor() ERC20("BDSM Token", "BDSM") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }
}
