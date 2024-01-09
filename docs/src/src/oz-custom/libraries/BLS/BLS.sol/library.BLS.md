# BLS
[Git Source](https://github.com/ContractLabs/foundry-bountykinds-contract/blob/67e6855d3beabdf242cc0b51d9e53b087a5235b9/src/oz-custom/libraries/BLS/BLS.sol)


## State Variables
### N

```solidity
uint256 private constant N =
    21_888_242_871_839_275_222_246_405_745_257_275_088_696_311_157_297_823_662_689_037_894_645_226_208_583;
```


### R

```solidity
uint256 private constant R =
    21_888_242_871_839_275_222_246_405_745_257_275_088_548_364_400_416_034_343_698_204_186_575_808_495_617;
```


### N_G2_X1

```solidity
uint256 private constant N_G2_X1 =
    11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634;
```


### N_G2_X0

```solidity
uint256 private constant N_G2_X0 =
    10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781;
```


### N_G2_Y1

```solidity
uint256 private constant N_G2_Y1 =
    17_805_874_995_975_841_540_914_202_342_111_839_520_379_459_829_704_422_454_583_296_818_431_106_115_052;
```


### N_G2_Y0

```solidity
uint256 private constant N_G2_Y0 =
    13_392_588_948_715_843_804_641_432_497_768_002_650_278_120_570_034_223_513_918_757_245_338_268_106_653;
```


### FIELD_MASK

```solidity
uint256 private constant FIELD_MASK =
    0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
```


### SIGN_MASK

```solidity
uint256 private constant SIGN_MASK =
    0x8000000000000000000000000000000000000000000000000000000000000000;
```


### ODD_NUM

```solidity
uint256 private constant ODD_NUM =
    0x8000000000000000000000000000000000000000000000000000000000000000;
```


### S

```solidity
uint256 private constant S = 4_965_661_367_192_848_881;
```


### EPS_EXP_0X0

```solidity
uint256 internal constant EPS_EXP_0X0 =
    21_575_463_638_280_843_010_398_324_269_430_826_099_269_044_274_347_216_827_212_613_867_836_435_027_261;
```


### EPS_EXP_0X1

```solidity
uint256 internal constant EPS_EXP_0X1 =
    10_307_601_595_873_709_700_152_284_273_816_112_264_069_230_130_616_436_755_625_194_854_815_875_713_954;
```


### EPS_EXP_1X0

```solidity
uint256 internal constant EPS_EXP_1X0 =
    2_821_565_182_194_536_844_548_159_561_693_502_659_359_617_185_244_120_367_078_079_554_186_484_126_554;
```


### EPS_EXP_1X1

```solidity
uint256 internal constant EPS_EXP_1X1 =
    3_505_843_767_911_556_378_687_030_309_984_248_845_540_243_509_899_259_641_013_678_093_033_130_930_403;
```


## Functions
### verifySingle


```solidity
function verifySingle(
    uint256[2] memory signature,
    uint256[4] memory pubkey,
    uint256[2] memory message
)
    internal
    view
    returns (bool);
```

### verifyMultiple


```solidity
function verifyMultiple(
    uint256[2] memory signature,
    uint256[4][] memory pubkeys,
    uint256[2][] memory messages
)
    internal
    view
    returns (bool);
```

### hashToPoint


```solidity
function hashToPoint(bytes memory data)
    internal
    view
    returns (uint256[2] memory p);
```

### mapToPoint


```solidity
function mapToPoint(bytes32 _x) internal view returns (uint256[2] memory p);
```

### isValidPublicKey


```solidity
function isValidPublicKey(uint256[4] memory publicKey)
    internal
    pure
    returns (bool);
```

### isValidSignature


```solidity
function isValidSignature(uint256[2] memory signature)
    internal
    pure
    returns (bool);
```

### pubkeyToUncompresed


```solidity
function pubkeyToUncompresed(
    uint256[2] memory compressed,
    uint256[2] memory y
)
    internal
    pure
    returns (uint256[4] memory uncompressed);
```

### signatureToUncompresed


```solidity
function signatureToUncompresed(
    uint256 compressed,
    uint256 y
)
    internal
    pure
    returns (uint256[2] memory uncompressed);
```

### isValidCompressedPublicKey


```solidity
function isValidCompressedPublicKey(uint256[2] memory publicKey)
    internal
    view
    returns (bool);
```

### isValidCompressedSignature


```solidity
function isValidCompressedSignature(uint256 signature)
    internal
    view
    returns (bool);
```

### isOnCurveG1


```solidity
function isOnCurveG1(uint256[2] memory point)
    internal
    pure
    returns (bool _isOnCurve);
```

### isOnCurveG1


```solidity
function isOnCurveG1(uint256 x) internal view returns (bool _isOnCurve);
```

### isOnCurveG2


```solidity
function isOnCurveG2(uint256[4] memory point)
    internal
    pure
    returns (bool _isOnCurve);
```

### isOnCurveG2


```solidity
function isOnCurveG2(uint256[2] memory x)
    internal
    view
    returns (bool _isOnCurve);
```

### isOnSubgroupG2Naive


```solidity
function isOnSubgroupG2Naive(uint256[4] memory point)
    internal
    view
    returns (bool);
```

### isNonResidueFP


```solidity
function isNonResidueFP(uint256 e) internal view returns (bool isNonResidue);
```

### isNonResidueFP2


```solidity
function isNonResidueFP2(uint256[2] memory e)
    internal
    view
    returns (bool isNonResidue);
```

### sqrt


```solidity
function sqrt(uint256 xx) internal view returns (uint256 x, bool hasRoot);
```

### endomorphism


```solidity
function endomorphism(
    uint256 xx,
    uint256 xy,
    uint256 yx,
    uint256 yy
)
    internal
    pure
    returns (uint256, uint256, uint256, uint256);
```

### isOnSubgroupG2DLZZ

Using https://eprint.iacr.org/2022/348.pdf


```solidity
function isOnSubgroupG2DLZZ(uint256[4] memory point)
    internal
    view
    returns (bool);
```

## Errors
### BLS__LengthMismatch

```solidity
error BLS__LengthMismatch();
```

### BLS__InvalidSignature

```solidity
error BLS__InvalidSignature();
```

### BLS__NoPublicKeysGiven

```solidity
error BLS__NoPublicKeysGiven();
```

### BLS__SqrtModExpCallFailed

```solidity
error BLS__SqrtModExpCallFailed();
```

### BLS__IsNonResidueFP2ModExpCallFailed

```solidity
error BLS__IsNonResidueFP2ModExpCallFailed();
```

### BLS__BadYCoordinateForUncompressingKey

```solidity
error BLS__BadYCoordinateForUncompressingKey();
```

