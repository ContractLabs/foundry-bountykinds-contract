# ERC20Permit
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/token/ERC20/extensions/ERC20Permit.sol)

**Inherits:**
[ERC20](/src/oz-custom/oz/token/ERC20/ERC20.sol/abstract.ERC20.md), [IERC20Permit](/src/oz-custom/oz/token/ERC20/extensions/IERC20Permit.sol/interface.IERC20Permit.md), [Signable](/src/oz-custom/internal/Signable.sol/abstract.Signable.md)

*Implementation of the ERC20 Permit extension allowing approvals to be
made via signatures, as defined in
https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
Adds the {permit} method, which can be used to change an account's ERC20
allowance (see {IERC20-allowance}) by
presenting a message signed by the account. By not relying on
`{IERC20-approve}`, the token holder account doesn't
need to send a transaction, and thus is not required to hold Ether at all.
_Available since v3.4._*


## State Variables
### __PERMIT_TYPEHASH
*value is equal to keccak256("Permit(address owner,address
spender,uint256 value,uint256 nonce,uint256
deadline)")*


```solidity
bytes32 private constant __PERMIT_TYPEHASH =
    0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
```


## Functions
### constructor

*Initializes the {EIP712} domain separator using the `name`
parameter, and setting `version` to `"1"`.
It's a good idea to use the same `name` that is defined as the ERC20
token name.*


```solidity
constructor(
    string memory name_,
    string memory symbol_
)
    payable
    Signable(name_, "1")
    ERC20(name_, symbol_);
```

### permit

*See {IERC20Permit-permit}.*


```solidity
function permit(
    address owner,
    address spender,
    uint256 value,
    uint256 deadline,
    uint8 v,
    bytes32 r,
    bytes32 s
)
    external
    virtual
    override;
```

### DOMAIN_SEPARATOR

*See {IERC20Permit-nonces}.
/***

*See {IERC20Permit-DOMAIN_SEPARATOR}.*


```solidity
function DOMAIN_SEPARATOR()
    external
    view
    override(IERC20Permit, Signable)
    returns (bytes32);
```

### nonces


```solidity
function nonces(address account_) external view returns (uint256 nonce);
```

