# BK721
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/BK721.sol)

**Inherits:**
[IBK721](/src/interfaces/IBK721.sol/interface.IBK721.md), [ManagerUpgradeable](/src/oz-custom/presets-upgradeable/base/ManagerUpgradeable.sol/abstract.ManagerUpgradeable.md), [ProtocolFeeUpgradeable](/src/oz-custom/internal-upgradeable/ProtocolFeeUpgradeable.sol/abstract.ProtocolFeeUpgradeable.md), [ERC721PermitUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721PermitUpgradeable.sol/abstract.ERC721PermitUpgradeable.md), [BKFundForwarderUpgradeable](/src/internal-upgradeable/BKFundForwarderUpgradeable.sol/abstract.BKFundForwarderUpgradeable.md), [ERC721EnumerableUpgradeable](/src/oz-custom/oz-upgradeable/token/ERC721/extensions/ERC721EnumerableUpgradeable.sol/abstract.ERC721EnumerableUpgradeable.md)


## State Variables
### __baseTokenURIPtr

```solidity
bytes32 private __baseTokenURIPtr;
```


### typeIdTrackers

```solidity
mapping(uint256 => uint256) public typeIdTrackers;
```


### __nonceBitMaps

```solidity
mapping(address => mapping(uint248 => uint256)) private __nonceBitMaps;
```


### __gap

```solidity
uint256[47] private __gap;
```


## Functions
### whenUseSignature


```solidity
modifier whenUseSignature(uint256 deadline_);
```

### exchangeAssets


```solidity
function exchangeAssets(
    IBK721 forNFT_,
    uint256 forAmount_,
    uint256 forTypeId_,
    uint256 nonce_,
    uint256 deadline_,
    uint256[] calldata myIds_,
    bytes calldata signature_
)
    external
    whenNotPaused
    whenUseSignature(deadline_)
    returns (uint256[] memory forIds);
```

### redeemBulk

*get rid of stack too deep*

*get rid of stack too deep*

*value is equal to keccak256("Exchange(address
forNFT,uint256 forAmount,uint256
forTypeId,address sendTo,uint256 nonce,uint256
deadline,uint256[] myIds)")*

*get rid of stack too deep*


```solidity
function redeemBulk(
    uint256 nonce_,
    uint256 amount_,
    uint256 typeId_,
    address claimer_,
    uint256 deadline_,
    bytes calldata signature_
)
    external
    whenNotPaused
    whenUseSignature(deadline_);
```

### changeVault

*value is equal to keccak256("Redeem(address
claimer,uint256 typeId,uint256 amount,uint256
nonce,uint256 deadline)")*


```solidity
function changeVault(address vault_)
    external
    override
    onlyRole(Roles.TREASURER_ROLE);
```

### setBaseURI


```solidity
function setBaseURI(string calldata baseURI_)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```

### merge


```solidity
function merge(
    uint256[] calldata fromIds_,
    uint256 toId_,
    uint256 deadline_,
    bytes calldata signature_
)
    external
    whenUseSignature(deadline_);
```

### setRoyalty

*value is equal to keccak256("Swap(address
user,uint256 toId,uint256 deadline,uint256
nonce,uint256[] fromIds)")*


```solidity
function setRoyalty(
    address feeToken_,
    uint96 feeAmt_
)
    external
    onlyRole(Roles.OPERATOR_ROLE);
```

### safeMint


```solidity
function safeMint(
    address to_,
    uint256 typeId_
)
    external
    onlyRole(Roles.PROXY_ROLE)
    returns (uint256 tokenId);
```

### safeMintBatch


```solidity
function safeMintBatch(
    address to_,
    uint256 typeId_,
    uint256 length_
)
    external
    onlyRole(Roles.PROXY_ROLE)
    returns (uint256[] memory tokenIds);
```

### mint

*value is equal to
keccak256("BatchTransfered(address,address,uint256)")*


```solidity
function mint(
    address to_,
    uint256 typeId_
)
    external
    onlyRole(Roles.MINTER_ROLE)
    returns (uint256 tokenId);
```

### transferBatch


```solidity
function transferBatch(
    address from_,
    address[] calldata tos_,
    uint256[] calldata tokenIds_
)
    external;
```

### mintBatch


```solidity
function mintBatch(
    uint256 typeId_,
    address[] calldata tos_
)
    external
    onlyRole(Roles.MINTER_ROLE);
```

### safeMint


```solidity
function safeMint(
    address to_,
    uint256 typeId_,
    uint256 length_
)
    external
    onlyRole(Roles.PROXY_ROLE)
    returns (uint256[] memory tokenIds);
```

### nonces

*value is equal to
keccak256("BatchTransfered(address,address,uint256)")*


```solidity
function nonces(address account_) external view returns (uint256 nonce);
```

### nonceBitMaps


```solidity
function nonceBitMaps(
    address account_,
    uint256 nonce_
)
    external
    view
    returns (uint256 bitmap, bool isDirtied);
```

### invalidateNonce


```solidity
function invalidateNonce(
    address account_,
    uint248 wordPos_,
    uint256 mask_
)
    external
    onlyRole(Roles.OPERATOR_ROLE)
    whenPaused;
```

### baseURI

*value is equal to
keccak256("NonceUsed(address,address,uint256,uint248)")*


```solidity
function baseURI() external view returns (string memory);
```

### metadataOf


```solidity
function metadataOf(uint256 tokenId_)
    external
    view
    returns (uint256 typeId, uint256 index);
```

### nextIdFromType


```solidity
function nextIdFromType(uint256 typeId_) public view returns (uint256 nextId);
```

### tokenURI


```solidity
function tokenURI(uint256 tokenId)
    public
    view
    override
    returns (string memory);
```

### supportsInterface


```solidity
function supportsInterface(bytes4 interfaceId_)
    public
    view
    virtual
    override(ERC721PermitUpgradeable, ERC721EnumerableUpgradeable)
    returns (bool);
```

### version


```solidity
function version() public pure returns (bytes32);
```

### _setBaseURI

*value is equal to keccak256("BKNFT_v1")*


```solidity
function _setBaseURI(string calldata baseURI_) internal;
```

### _invalidateNonce


```solidity
function _invalidateNonce(
    address sender_,
    address account_,
    uint256 nonce_
)
    internal;
```

### __BK_init

*value is equal to
keccak256("NonceUsed(address,address,uint256,uint248)")*


```solidity
function __BK_init(
    string calldata name_,
    string calldata symbol_,
    string calldata baseURI_,
    uint96 feeAmt_,
    address feeToken_,
    IAuthority authority_
)
    internal
    onlyInitializing;
```

### __BK_init_unchained


```solidity
function __BK_init_unchained(string calldata baseURI_)
    internal
    onlyInitializing;
```

### _useTypeIdTrackers


```solidity
function _useTypeIdTrackers(uint256 typeId_)
    internal
    returns (uint256 tokenId);
```

### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 tokenId_,
    uint256 batchSize_
)
    internal
    virtual
    override(ERC721EnumerableUpgradeable, ERC721Upgradeable)
    whenNotPaused;
```

### _setTypeIdTrackers


```solidity
function _setTypeIdTrackers(uint256 typeId_, uint256 value_) internal;
```

### _mintTransfer


```solidity
function _mintTransfer(address to_, uint256 tokenId_) private;
```

### _verifySig


```solidity
function _verifySig(bytes32 digest_, bytes calldata signature_) internal view;
```

### _checkExpiry


```solidity
function _checkExpiry(uint256 deadline_) internal view;
```

### _baseURI


```solidity
function _baseURI() internal view virtual override returns (string memory);
```

### _beforeRecover


```solidity
function _beforeRecover(bytes memory)
    internal
    override
    whenPaused
    onlyRole(Roles.OPERATOR_ROLE);
```

### _afterRecover


```solidity
function _afterRecover(
    address,
    address,
    uint256,
    bytes memory
)
    internal
    override;
```

