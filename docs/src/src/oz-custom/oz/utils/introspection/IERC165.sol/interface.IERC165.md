# IERC165
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/utils/introspection/IERC165.sol)

*Interface of the ERC165 standard, as defined in the
https://eips.ethereum.org/EIPS/eip-165[EIP].
Implementers can declare support of contract interfaces, which can then be
queried by others ({ERC165Checker}).
For an implementation, see {ERC165}.*


## Functions
### supportsInterface

*Returns true if this contract implements the interface defined by
`interfaceId`. See the corresponding
https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP
section]
to learn more about how these ids are created.
This function call must use less than 30 000 gas.*


```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool);
```

