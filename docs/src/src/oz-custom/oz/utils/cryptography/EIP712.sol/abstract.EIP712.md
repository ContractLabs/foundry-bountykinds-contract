# EIP712
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/utils/cryptography/EIP712.sol)

*https://eips.ethereum.org/EIPS/eip-712[EIP 712] is a standard for
hashing and signing of typed structured data.
The encoding specified in the EIP is very generic, and such a generic
implementation in Solidity is not feasible,
thus this contract does not implement the encoding itself. Protocols need to
implement the type-specific encoding
they need in their contracts using a combination of `abi.encode` and
`keccak256`.
This contract implements the EIP 712 domain separator ({_domainSeparatorV4})
that is used as part of the encoding
scheme, and the final step of the encoding to obtain the message digest that
is then signed via ECDSA
({_hashTypedDataV4}).
The implementation of the domain separator was designed to be as efficient as
possible while still properly updating
the chain id to protect against replay attacks on an eventual fork of the
chain.
NOTE: This contract implements the version of the encoding known as "v4", as
implemented by the JSON RPC method
https://docs.metamask.io/guide/signing-data.html[`eth_signTypedDataV4` in
MetaMask].
_Available since v3.4._*


## State Variables
### _CACHED_DOMAIN_SEPARATOR

```solidity
bytes32 private immutable _CACHED_DOMAIN_SEPARATOR;
```


### _CACHED_CHAIN_ID

```solidity
uint256 private immutable _CACHED_CHAIN_ID;
```


### _CACHED_THIS

```solidity
address private immutable _CACHED_THIS;
```


### _HASHED_NAME

```solidity
bytes32 private immutable _HASHED_NAME;
```


### _HASHED_VERSION

```solidity
bytes32 private immutable _HASHED_VERSION;
```


### _TYPE_HASH

```solidity
bytes32 private immutable _TYPE_HASH;
```


## Functions
### constructor

*Initializes the domain separator and parameter caches.
The meaning of `name` and `version` is specified in
https://eips.ethereum.org/EIPS/eip-712#definition-of-domainseparator[EIP
712]:
- `name`: the user readable name of the signing domain, i.e. the name of
the DApp or the protocol.
- `version`: the current major version of the signing domain.
NOTE: These parameters cannot be changed except through a
xref:learn::upgrading-smart-contracts.adoc[smart
contract upgrade].*


```solidity
constructor(string memory name, string memory version) payable;
```

### _domainSeparatorV4

*
0x8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f
is equal to
keccak256("EIP712Domain(string name,string version,uint256
chainId,address verifyingContract)")*

*Returns the domain separator for the current chain.*


```solidity
function _domainSeparatorV4() internal view returns (bytes32);
```

### _buildDomainSeparator


```solidity
function _buildDomainSeparator(
    bytes32 typeHash,
    bytes32 nameHash,
    bytes32 versionHash
)
    private
    view
    returns (bytes32 domainSeparatorV4);
```

### _hashTypedDataV4

*Given an already
https://eips.ethereum.org/EIPS/eip-712#definition-of-hashstruct[hashed
struct], this
function returns the hash of the fully encoded EIP712 message for this
domain.
This hash can be used together with {ECDSA-recover} to obtain the signer
of a message. For example:
```solidity
bytes32 digest = _hashTypedDataV4(keccak256(abi.encode(
keccak256("Mail(address to,string contents)"),
mailTo,
keccak256(bytes(mailContents))
)));
address signer = ECDSA.recover(digest, signature);
```*


```solidity
function _hashTypedDataV4(bytes32 structHash)
    internal
    view
    virtual
    returns (bytes32);
```

