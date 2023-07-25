// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Bondage is ReentrancyGuard {
    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => mapping(address => Deposit)) public deposits;
    uint256 public constant lockPeriod = 12 hours;

    function deposit(IERC20 token, uint256 amount) external nonReentrant {
        require(token.balanceOf(msg.sender) >= amount, "Insufficient balance");
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        Deposit storage userDeposit = deposits[address(token)][msg.sender];
        userDeposit.amount += amount;
        userDeposit.unlockTime = block.timestamp + lockPeriod;
    }

    function withdraw(IERC20 token) external nonReentrant {
        Deposit storage userDeposit = deposits[address(token)][msg.sender];
        require(block.timestamp >= userDeposit.unlockTime, "Tokens are still locked");
        uint256 amount = userDeposit.amount;
        userDeposit.amount = 0;

        require(token.transfer(msg.sender, amount), "Transfer failed");
    }
}

        token.transfer(msg.sender, amount);
    }
}
