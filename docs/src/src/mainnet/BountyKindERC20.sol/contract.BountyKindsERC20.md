# BountyKindsERC20
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/mainnet/BountyKindERC20.sol)

**Inherits:**
[Taxable](/src/oz-custom/internal/Taxable.sol/abstract.Taxable.md), [ERC20Permit](/src/oz-custom/oz/token/ERC20/extensions/ERC20Permit.sol/abstract.ERC20Permit.md), [Transferable](/src/oz-custom/internal/Transferable.sol/abstract.Transferable.md), [ProxyChecker](/src/oz-custom/internal/ProxyChecker.sol/abstract.ProxyChecker.md), [Blacklistable](/src/oz-custom/internal/Blacklistable.sol/abstract.Blacklistable.md), [ERC20Burnable](/src/oz-custom/oz/token/ERC20/extensions/ERC20Burnable.sol/abstract.ERC20Burnable.md), [ERC20Pausable](/src/oz-custom/oz/token/ERC20/extensions/ERC20Pausable.sol/abstract.ERC20Pausable.md), [IBountyKindsERC20](/src/interfaces/IBountyKindsERC20.sol/interface.IBountyKindsERC20.md), [AccessControlEnumerable](/src/oz-custom/oz/access/AccessControlEnumerable.sol/abstract.AccessControlEnumerable.md)


## State Variables
### PAUSER_ROLE

```solidity
bytes32 public constant PAUSER_ROLE =
    0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a;
```


### MINTER_ROLE

```solidity
bytes32 public constant MINTER_ROLE =
    0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6;
```


### OPERATOR_ROLE

```solidity
bytes32 public constant OPERATOR_ROLE =
    0x97667070c54ef182b0f5858b034beac1b6f3089aa2d3188bb1e8929f4fa9b929;
```


### wnt

```solidity
IWNT public immutable wnt;
```


### priceFeed

```solidity
AggregatorV3Interface public immutable priceFeed;
```


### pool

```solidity
IUniswapV2Pair public pool;
```


## Functions
### constructor


```solidity
constructor(
    string memory name_,
    string memory symbol_,
    address admin_,
    address beneficiary_,
    uint256 initialSupply_,
    IWNT wnt_,
    AggregatorV3Interface priceFeed_
)
    payable
    Pausable
    Taxable(beneficiary_)
    ERC20Permit(name_, symbol_);
```

### setPool

*Sets the Uniswap V2 pair address.*


```solidity
function setPool(IUniswapV2Pair pool_)
    external
    whenPaused
    onlyRole(OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`pool_`|`IUniswapV2Pair`|The address of the new Uniswap V2 pair.|


### setUserStatus


```solidity
function setUserStatus(
    address account_,
    bool status_
)
    external
    onlyRole(OPERATOR_ROLE);
```

### pause


```solidity
function pause() external onlyRole(PAUSER_ROLE);
```

### unpause


```solidity
function unpause() external onlyRole(PAUSER_ROLE);
```

### toggleTax


```solidity
function toggleTax() external whenPaused onlyRole(PAUSER_ROLE);
```

### setTaxBeneficiary


```solidity
function setTaxBeneficiary(address beneficiary_)
    external
    onlyRole(OPERATOR_ROLE);
```

### mint

*Mints tokens to the specified address.*


```solidity
function mint(address to_, uint256 amount_) external onlyRole(MINTER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`to_`|`address`|The address that will receive the tokens.|
|`amount_`|`uint256`|The amount of tokens to mint.|


### execute

*Executes a call to an external contract.*


```solidity
function execute(
    address target_,
    uint256 value_,
    bytes calldata calldata_
)
    external
    whenPaused
    onlyRole(OPERATOR_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`target_`|`address`|The address of the external contract to call.|
|`value_`|`uint256`|The amount of ether to send with the call.|
|`calldata_`|`bytes`|The data to send with the call.|


### tax


```solidity
function tax(
    address pool_,
    uint256 amount_
)
    public
    view
    override
    returns (uint256);
```

### taxEnabledDuration


```solidity
function taxEnabledDuration() public pure override returns (uint256);
```

### taxFraction


```solidity
function taxFraction(address) public pure override returns (uint256);
```

### percentageFraction


```solidity
function percentageFraction() public pure override returns (uint256);
```

### _setPool


```solidity
function _setPool(IUniswapV2Pair pool_) internal;
```

### _beforeTokenTransfer


```solidity
function _beforeTokenTransfer(
    address from_,
    address to_,
    uint256 amount_
)
    internal
    override(ERC20, ERC20Pausable);
```

