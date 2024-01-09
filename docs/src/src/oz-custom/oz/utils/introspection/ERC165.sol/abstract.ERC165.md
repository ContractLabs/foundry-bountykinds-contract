# ERC165
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/utils/introspection/ERC165.sol)

**Inherits:**
[IERC165](/src/oz-custom/oz/utils/introspection/IERC165.sol/interface.IERC165.md)

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


## Functions
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

