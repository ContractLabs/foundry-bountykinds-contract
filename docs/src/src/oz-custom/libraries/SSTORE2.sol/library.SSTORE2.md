# SSTORE2
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/SSTORE2.sol)

**Authors:**
Solmate
(https://github.com/Rari-Capital/solmate/blob/main/src/utils/SSTORE2.sol), Modified from 0xSequence
(https://github.com/0xSequence/sstore2/blob/master/contracts/SSTORE2.sol)

Read and write to persistent storage at a fraction of the cost.


## State Variables
### DATA_OFFSET

```solidity
uint256 internal constant DATA_OFFSET = 1;
```


## Functions
### write


```solidity
function write(bytes memory data) internal returns (bytes32 ptr);
```

### writeToAddr

------------------------------------------------------------------------------------+
Opcode  | Opcode + Arguments  | Description       | Stack View                    |
------------------------------------------------------------------------------------|
0x61    | 0x61XXXX            | PUSH2 codeSize    | codeSize                      |
0x80    | 0x80                | DUP1              | codeSize
codeSize             |
0x60    | 0x600A              | PUSH1 10          | 10 codeSize
codeSize          |
0x3D    | 0x3D                | RETURNDATASIZE    | 0 10
codeSize codeSize        |
0x39    | 0x39                | CODECOPY          | codeSize                      |
0x3D    | 0x3D                | RETURNDATASZIE    | 0 codeSize                    |
0xF3    | 0xF3                | RETURN            |                               |
0x00    | 0x00                | STOP              |                               |
------------------------------------------------------------------------------------+

*Prefix the bytecode with a STOP opcode to ensure it cannot
be called. Also PUSH2 is
used since max contract size cap is 24,576 bytes which is less
than 2 ** 16.*


```solidity
function writeToAddr(bytes memory data) internal returns (address pointer);
```

### read

------------------------------------------------------------------------------------+
Opcode  | Opcode + Arguments  | Description       | Stack View                    |
------------------------------------------------------------------------------------|
0x61    | 0x61XXXX            | PUSH2 codeSize    | codeSize                      |
0x80    | 0x80                | DUP1              | codeSize
codeSize             |
0x60    | 0x600A              | PUSH1 10          | 10 codeSize
codeSize          |
0x3D    | 0x3D                | RETURNDATASIZE    | 0 10
codeSize codeSize        |
0x39    | 0x39                | CODECOPY          | codeSize                      |
0x3D    | 0x3D                | RETURNDATASZIE    | 0 codeSize                    |
0xF3    | 0xF3                | RETURN            |                               |
0x00    | 0x00                | STOP              |                               |
------------------------------------------------------------------------------------+

*Prefix the bytecode with a STOP opcode to ensure it cannot
be called. Also PUSH2 is
used since max contract size cap is 24,576 bytes which is less
than 2 ** 16.*


```solidity
function read(address ptr) internal view returns (bytes memory);
```

### read


```solidity
function read(bytes32 ptr) internal view returns (bytes memory);
```

### read


```solidity
function read(
    address pointer,
    uint256 start
)
    internal
    view
    returns (bytes memory);
```

### read


```solidity
function read(
    address pointer,
    uint256 start,
    uint256 end
)
    internal
    view
    returns (bytes memory);
```

### readBytecode


```solidity
function readBytecode(
    address pointer,
    uint256 start,
    uint256 size
)
    private
    view
    returns (bytes memory data);
```

## Errors
### SSTORE2__ReadOutOfBounds

```solidity
error SSTORE2__ReadOutOfBounds();
```

### SSTORE2__DeploymentFailed

```solidity
error SSTORE2__DeploymentFailed();
```

