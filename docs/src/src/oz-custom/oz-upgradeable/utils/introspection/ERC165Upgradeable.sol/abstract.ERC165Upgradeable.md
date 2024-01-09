# ERC165Upgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/utils/introspection/ERC165Upgradeable.sol)

**Inherits:**
[Initializable](/src/oz-custom/oz-upgradeable/proxy/utils/Initializable.sol/abstract.Initializable.md), [IERC165Upgradeable](/src/oz-custom/oz-upgradeable/utils/introspection/IERC165Upgradeable.sol/interface.IERC165Upgradeable.md)

*Implementation of the {IERC165} interface.
Contracts that want to implement ERC165 should inherit from this contract and
override {supportsInterface} to check
for the additional interface id that will be supported. For example:
```solidity
function supportsInterface(bytes4 interfaceId) public view virtual override
returns (bool) {
return interfaceId == type(MyInterface).interfaceId ||
super.supportsInterface(interfaceId);
}
```
Alternatively, {ERC165Storage} provides an easier to use but more expensive
implementation.*


## State Variables
### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[50] private __gap;
```


## Functions
### __ERC165_init


```solidity
function __ERC165_init() internal onlyInitializing;
```

### __ERC165_init_unchained


```solidity
function __ERC165_init_unchained() internal onlyInitializing;
```

### supportsInterface

*See {IERC165-supportsInterface}.*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override
    returns (bool);
```

