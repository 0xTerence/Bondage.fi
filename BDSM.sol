// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeLock {
    struct TokenLock {
        uint256 time;
        uint256 amount;
    }

    mapping(address => mapping(address => TokenLock)) public tokenLocks;

    function deposit(IERC20 token, uint256 amount, uint256 time) public {
        require(amount > 0, "Amount must be greater than 0");
        require(time > block.timestamp, "Time must be in the future");

        token.transferFrom(msg.sender, address(this), amount);

        tokenLocks[msg.sender][address(token)] = TokenLock({
            time: time,
            amount: amount
        });
    }

    function withdraw(IERC20 token) public {
        require(tokenLocks[msg.sender][address(token)].amount > 0, "No tokens to withdraw");
        require(block.timestamp > tokenLocks[msg.sender][address(token)].time, "Tokens are still locked");

        uint256 amount = tokenLocks[msg.sender][address(token)].amount;
        tokenLocks[msg.sender][address(token)].amount = 0;

        token.transfer(msg.sender, amount);
    }
}
