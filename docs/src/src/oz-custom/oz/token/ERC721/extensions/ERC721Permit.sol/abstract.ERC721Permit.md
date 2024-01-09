# ERC721Permit
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC721/extensions/ERC721Permit.sol)

**Inherits:**
[ERC721](/src/oz-custom/oz/token/ERC721/ERC721.sol/abstract.ERC721.md), [IERC721Permit](/src/oz-custom/oz/token/ERC721/extensions/IERC721Permit.sol/interface.IERC721Permit.md), [Signable](/src/oz-custom/internal/Signable.sol/abstract.Signable.md)

Nonfungible tokens that support an approve via signature, i.e. permit


## State Variables
### __PERMIT_TYPEHASH
*Value is equal to to keccak256("Permit(address spender,uint256
tokenId,uint256 nonce,uint256 deadline)");*


```solidity
bytes32 private constant __PERMIT_TYPEHASH =
    0x49ecf333e5b8c95c40fdafc95c1ad136e8914a8fb55e9dc8bb01eaa83a2df9ad;
```


## Functions
### constructor


```solidity
constructor(
    string memory name_,
    string memory symbol_
)
    payable
    Signable(name_, "1")
    ERC721(name_, symbol_);
```

### DOMAIN_SEPARATOR

The domain separator used in the permit signature

*Gets the current nonce for a token ID and then increments it,
returning the original value*


```solidity
function DOMAIN_SEPARATOR()
    public
    view
    override(Signable, IERC721Permit)
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

