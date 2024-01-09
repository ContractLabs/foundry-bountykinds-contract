# IERC1822ProxiableUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/interfaces/draft-IERC1822Upgradeable.sol)

*ERC1822: Universal Upgradeable Proxy Standard (UUPS) documents a method
for upgradeability through a simplified
proxy whose upgrades are fully controlled by the current implementation.*


## Functions
### proxiableUUID

*Returns the storage slot that the proxiable contract assumes is
being used to store the implementation
address.
IMPORTANT: A proxy pointing at a proxiable contract should not be
considered proxiable itself, because this risks
bricking a proxy that upgrades to it, by delegating to itself until out
of gas. Thus it is critical that this
function revert if invoked through a proxy.*


```solidity
function proxiableUUID() external view returns (bytes32);
```

