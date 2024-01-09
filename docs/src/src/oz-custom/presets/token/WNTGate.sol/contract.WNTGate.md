# WNTGate
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/presets/token/WNTGate.sol)

**Inherits:**
[IWNTGate](/src/oz-custom/presets/token/interfaces/IWNTGate.sol/interface.IWNTGate.md), [Context](/src/oz-custom/oz/utils/Context.sol/abstract.Context.md), [Transferable](/src/oz-custom/internal/Transferable.sol/abstract.Transferable.md)

*Upgradable contracts cannot receive ether via `transfer` because of
increased SLOAD gas cost.
We use this non-upgradeable contract as the recipient and then immediately
transfer to an upgradable contract.
More details about this issue can be found
[here](https://forum.openzeppelin.com/t/openzeppelin-upgradeable-contracts-affected-by-istanbul-hardfork/1616).*


## State Variables
### __wnt
*Wrapped native token contract*


```solidity
bytes32 private __wnt;
```


## Functions
### constructor


```solidity
constructor(IWNT wnt_) payable;
```

### wnt


```solidity
function wnt() public view returns (IWNT _wnt);
```

### withdraw

*Transfer assets to a receiver.*


```solidity
function withdraw(address _receiver, uint256 _wad) external override;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_receiver`|`address`||
|`_wad`|`uint256`||


### receive


```solidity
receive() external payable;
```

