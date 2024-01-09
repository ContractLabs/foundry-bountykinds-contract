# Bountykinds Contracts

## Overall system design
![Overall](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/main/assets/overall-system.png)

## Roles:
All the roles used in the contract can be found in [this](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/main/src/oz-custom/libraries/Roles.sol)
### Rights of roles:
- Admin: Has the right to grant or revoke roles on Authority, manage roles on ERC20, and set limits on Treasury.
- Operator: Has the right to manage user statuses.
- Upgrader: Has the right to upgrade contracts.
- Minter: Has the right to mint ERC20, NFT, and RNFT.
- Pauser: Has the right to pause and unpause contracts.
- Proxy: A role for contracts that can call specific functions on other contracts, such as redeemTicket on Gacha, redeem on INO, and safeMint and safeMintBatch on NFT contracts.
- Signer: Has the right to sign signatures.
- Treasurer: Has the right to update prices, update payments, and withdraw funds from the Treasury.

## Authority
Manage system access roles

## Treasury
The treasury that holds native token, ERC20 token, NFT, RNFT.

## Payment Gateway
Used when users deposit native tokens, ERC-20, ERC-721 to play gacha, purchase in-game items, buy NFTs, etc.

## Marketplace
Marketplace for buying and selling NFT & items with YU.

## NFT

## RNFT
Allows users to rent NFTs.

## INO (Initial NFT Offerings)
Operator create a campaign then users can purchase NFT tickets during a campaign. 

## Gacha
Allow users to purchase lottery tickets (via a payment gateway) and claim rewards by signing and sending an NFT. If they win, the API returns the result for the contract to reward the user.

## NotifyGate
Allow users to deposit tokens and request the server to perform a specific action.

## Multicall
- Used for batch execution for functions not supporting batch execution on the contract.
- Currently, the Multicall is being used to blacklist a large number of addresses across ERC20 tokens (YU, FFE), and Authority.

## Deployment
### Deployed contract
All the deployed contracts can be found in [this](https://github.com/ContractLabs/foundry-bountykinds-contract)
### Deploy contract
- Implement a deployment script in the **script** folder. Then, use `run.sh` to execute the deployment script. 
- You can find examples of deployments in this [this repo](https://github.com/tasibii/boundry) or in the [foundry docs](https://book.getfoundry.sh/forge/deploying).
### Check storage slot collision
To check for collision in storage slots, use `run-check-storage.sh`.
### Debug
- To debug a transaction, use `run.sh` to execute the `Debug.s.sol` script. 
- Ensure that debug parameters exist in `.env.debug`.


## Issues
### Mint NFT
- After minting a batch on NFT Character (RNFT), you must ensure that the result of typeIdTrackers has not been minted before. 
- If typeIdTrackers results are minted and have an owner, use `fixTokenIdTrackers` to set a new typeIdTrackers by increasing typeIdTrackers by 1. If not fixed, claiming rewards on Gacha will revert.
### Multicall 
- This contract can be used in multiple purposes. 
- You can found usage contract in [this](https://github.com/tasibii/bulticall)
- Example: 
    - Multiple blacklist/unblacklist address
    - Multiple grant/revoke role (if this contract have role admin in Authority)
    - etc.
### Deploy
- Ensure that your RPC URL is optimal during deployment.
- If you encounter this error: `Error: Transaction dropped from the mempool` consider changing your RPC in `foundry.toml`.
- Be careful when upgrading contract logic. Ensure there is no storage slot collision; otherwise, resolving issues may be challenging. Good luck!
