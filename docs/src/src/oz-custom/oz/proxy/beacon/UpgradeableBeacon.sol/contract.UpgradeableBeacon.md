# UpgradeableBeacon
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/proxy/beacon/UpgradeableBeacon.sol)

**Inherits:**
[IBeacon](/src/oz-custom/oz/proxy/beacon/IBeacon.sol/interface.IBeacon.md), [Ownable](/src/oz-custom/oz/access/Ownable.sol/abstract.Ownable.md)

*This contract is used in conjunction with one or more instances of
{BeaconProxy} to determine their
implementation contract, which is where they will delegate all function
calls.
An owner is able to change the implementation the beacon points to, thus
upgrading the proxies that use this beacon.*


## State Variables
### __implementation

```solidity
bytes32 private __implementation;
```


## Functions
### constructor

*Sets the address of the initial implementation, and the deployer
account as the owner who can upgrade the
beacon.*


```solidity
constructor(address implementation_) payable;
```

### implementation

*Returns the current implementation address.*


```solidity
function implementation()
    public
    view
    virtual
    override
    returns (address _implementation);
```

### upgradeTo

*Upgrades the beacon to a new implementation.
Emits an {Upgraded} event.
Requirements:
- msg.sender must be the owner of the contract.
- `newImplementation` must be a contract.*


```solidity
function upgradeTo(address newImplementation) public virtual onlyOwner;
```

### _setImplementation

*Sets the implementation contract address for this beacon
Requirements:
- `newImplementation` must be a contract.*


```solidity
function _setImplementation(address newImplementation) private;
```

## Events
### Upgraded
*Emitted when the implementation returned by the beacon is changed.*


```solidity
event Upgraded(address indexed implementation);
```

