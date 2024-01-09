# ERC1967Proxy
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/oz/proxy/ERC1967/ERC1967Proxy.sol)

**Inherits:**
[Proxy](/src/oz-custom/oz/proxy/Proxy.sol/abstract.Proxy.md), [ERC1967Upgrade](/src/oz-custom/oz/proxy/ERC1967/ERC1967Upgrade.sol/abstract.ERC1967Upgrade.md)

*This contract implements an upgradeable proxy. It is upgradeable because
calls are delegated to an
implementation address that can be changed. This address is stored in storage
in the location specified by
https://eips.ethereum.org/EIPS/eip-1967[EIP1967], so that it doesn't conflict
with the storage layout of the
implementation behind the proxy.*


## Functions
### constructor

*Initializes the upgradeable proxy with an initial implementation
specified by `_logic`.
If `_data` is nonempty, it's used as data in a delegate call to `_logic`.
This will typically be an encoded
function call, and allows initializing the storage of the proxy like a
Solidity constructor.*


```solidity
constructor(address _logic, bytes memory _data) payable;
```

### _implementation

*Returns the current implementation address.*


```solidity
function _implementation()
    internal
    view
    virtual
    override
    returns (address impl);
```

