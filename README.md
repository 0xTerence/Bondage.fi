# Bondage Finance
### paperhandsprotection 🔒 

removing the ability to fumble a bag

bondage as a service

Shitcoin lockers as a service

~ forced left curvature ~

An adapted implementation of Curve's voting-escrow with additional features outlined below.

Lock delegation Users may delegate ther lock to another user whereby they give the delegatee control over their lock expiration and balance. Both users, the delegator and the delegatee, need to have an active lock in place at the time of delegation. Moreover, the delegatee's lock expiration needs to be longer than the delegator's.

Oracle based lock quitting A non-expired lock may be quitted by the lock owner automatically at predetermined values. The lock cannot be delegated at the time of quitting and the quitter pays a penalty proportional to the remaining lock duration.

Optimistic SmartWallet approval SmartWallets (contracts) can create a lock without being approved first. However, the bToken owner maintains a Blocklist where SmartWallets may be blocked from further interacting with the system. The Blocklist only allows the owner to block contracts but not EOAs. Blocked SmartWallets may still undelegate (if delegated prior to the blocking) and quit their lock (by paying the penalty) or withdraw once the lock expired.

⚠️ Requirements
This contract has been amended from a singular specific Token and is still not safe for using with other tokens. Specifically, the following is a non-exhaustive list of unsafe usages that have been amended. Bondage is for volatile, inherently worthless or valueless tokens in many cases.:

Contract does support Token with maxSupply>2^128-10^[decimals]
Contract does support fee-on-transfer Token
Contract does support Token with decimals<6

ℹ️ Source
Curve Finance: Original concept and implementation in Vyper (Source)
mStable: Forking Curve's Vyper contract and porting to Solidity including math tests (Source)
veTokens


users deposit erc20 tokens in Bondage Finance to receive veTokens

all tokens are locked for a period of 12h from time of deposit in protocol, within those 12 hours, bToken holders vote to extend or reduce timelock
> timelock voting affects all veTokens, beginning immediately after the conclusion of h12

> voting cycles operate on 4 hour rolling window, 3 cycles per initial 12h

### roadmap 
launch Bondage fi

implement oracle based unlocks (ie all bTokens unlock at 5x)

implement auto take profit (5x, 10x, 100x)

distribute BDSM, earn during timelock duration

introduce pool based timelocks

introduce pool voting with BDSM

nft lock implementation

