# ERC721PermitUpgradeable
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721PermitUpgradeable.sol)

**Inherits:**
[ERC721Upgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/ERC721Upgradeable.sol/abstract.ERC721Upgradeable.md), [SignableUpgradeable](/src/oz-custom/internal-upgradeable/SignableUpgradeable.sol/abstract.SignableUpgradeable.md), [IERC721PermitUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/IERC721PermitUpgradeable.sol/interface.IERC721PermitUpgradeable.md)

Nonfungible tokens that support an approve via signature, i.e. permit


## State Variables
### __PERMIT_TYPEHASH
*Value is equal to to keccak256("Permit(address spender,uint256
tokenId,uint256 nonce,uint256 deadline)");*


```solidity
bytes32 private constant __PERMIT_TYPEHASH =
    0x49ecf333e5b8c95c40fdafc95c1ad136e8914a8fb55e9dc8bb01eaa83a2df9ad;
```


### __gap
*This empty reserved space is put in place to allow future versions
to add new
variables without shifting down storage in the inheritance chain.
See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps*


```solidity
uint256[50] private __gap;
```


## Functions
### __ERC721Permit_init


```solidity
function __ERC721Permit_init(
    string calldata name_,
    string calldata symbol_
)
    internal
    onlyInitializing;
```

### DOMAIN_SEPARATOR

The domain separator used in the permit signature

*Gets the current nonce for a token ID and then increments it,
returning the original value*


```solidity
function DOMAIN_SEPARATOR()
    public
    view
    override(IERC721PermitUpgradeable, SignableUpgradeable)
    returns (bytes32);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bytes32`|The domain seperator used in encoding of permit signature|


### permit

function to be called by anyone to approve `spender` using a
Permit signature

*Anyone can call this to approve `spender`, even a third-party*


```solidity
function permit(
    address spender_,
    uint256 tokenId_,
    uint256 deadline_,
    bytes calldata signature_
)
    external
    override;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`spender_`|`address`||
|`tokenId_`|`uint256`||
|`deadline_`|`uint256`||
|`signature_`|`bytes`||


### nonces


```solidity
function nonces(uint256 tokenId_)
    external
    view
    override
    returns (uint256 nonce);
```

### supportsInterface

Query if a contract implements an interface

*Overridden from ERC721 here in order to include the interface of
this EIP*


```solidity
function supportsInterface(bytes4 interfaceId)
    public
    view
    virtual
    override(ERC721Upgradeable, IERC165Upgradeable)
    returns (bool);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`interfaceId`|`bytes4`|The interface identifier, as specified in ERC-165|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`bool`|`true` if the contract implements `interfaceID` and `interfaceID` is not 0xffffffff, `false` otherwise|


