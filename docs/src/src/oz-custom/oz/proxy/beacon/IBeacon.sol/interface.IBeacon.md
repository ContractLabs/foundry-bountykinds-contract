# IBeacon
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/proxy/beacon/IBeacon.sol)

*This is the interface that {BeaconProxy} expects of its beacon.*


## Functions
### implementation

*Must return an address that can be used as a delegate call target.
{BeaconProxy} will check that this address is a contract.*


```solidity
function implementation() external view returns (address);
```

## Errors
### UpgradeableBeacon__ImplementationIsNotAContract

```solidity
error UpgradeableBeacon__ImplementationIsNotAContract();
```

