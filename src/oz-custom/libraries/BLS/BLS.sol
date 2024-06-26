// SPDX-License-Identifier: LGPL 3.0
pragma solidity ^0.8.15;

import { BN256G2 } from "./BN256G2.sol";

library BLS {
    error BLS__LengthMismatch();
    error BLS__InvalidSignature();
    error BLS__NoPublicKeysGiven();
    error BLS__SqrtModExpCallFailed();
    error BLS__IsNonResidueFP2ModExpCallFailed();
    error BLS__BadYCoordinateForUncompressingKey();

    // Field order
    uint256 private constant N =
        21_888_242_871_839_275_222_246_405_745_257_275_088_696_311_157_297_823_662_689_037_894_645_226_208_583;

    // curve order
    uint256 private constant R =
        21_888_242_871_839_275_222_246_405_745_257_275_088_548_364_400_416_034_343_698_204_186_575_808_495_617;

    // Negated genarator of G2
    uint256 private constant N_G2_X1 =
        11_559_732_032_986_387_107_991_004_021_392_285_783_925_812_861_821_192_530_917_403_151_452_391_805_634;
    uint256 private constant N_G2_X0 =
        10_857_046_999_023_057_135_944_570_762_232_829_481_370_756_359_578_518_086_990_519_993_285_655_852_781;
    uint256 private constant N_G2_Y1 =
        17_805_874_995_975_841_540_914_202_342_111_839_520_379_459_829_704_422_454_583_296_818_431_106_115_052;
    uint256 private constant N_G2_Y0 =
        13_392_588_948_715_843_804_641_432_497_768_002_650_278_120_570_034_223_513_918_757_245_338_268_106_653;

    uint256 private constant FIELD_MASK =
        0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    uint256 private constant SIGN_MASK =
        0x8000000000000000000000000000000000000000000000000000000000000000;
    uint256 private constant ODD_NUM =
        0x8000000000000000000000000000000000000000000000000000000000000000;

    // curve param x. We use s here to prevent confusion with coordinate x.
    uint256 private constant S = 4_965_661_367_192_848_881;

    //eps^((p-1)/3)
    uint256 internal constant EPS_EXP_0X0 =
        21_575_463_638_280_843_010_398_324_269_430_826_099_269_044_274_347_216_827_212_613_867_836_435_027_261;
    uint256 internal constant EPS_EXP_0X1 =
        10_307_601_595_873_709_700_152_284_273_816_112_264_069_230_130_616_436_755_625_194_854_815_875_713_954;

    //eps^((p-1)/2)
    uint256 internal constant EPS_EXP_1X0 =
        2_821_565_182_194_536_844_548_159_561_693_502_659_359_617_185_244_120_367_078_079_554_186_484_126_554;
    uint256 internal constant EPS_EXP_1X1 =
        3_505_843_767_911_556_378_687_030_309_984_248_845_540_243_509_899_259_641_013_678_093_033_130_930_403;

    function verifySingle(
        uint256[2] memory signature,
        uint256[4] memory pubkey,
        uint256[2] memory message
    )
        internal
        view
        returns (bool)
    {
        uint256[12] memory input = [
            signature[0],
            signature[1],
            N_G2_X1,
            N_G2_X0,
            N_G2_Y1,
            N_G2_Y0,
            message[0],
            message[1],
            pubkey[1],
            pubkey[0],
            pubkey[3],
            pubkey[2]
        ];
        uint256[1] memory out;
        bool success;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            success := staticcall(sub(gas(), 2000), 8, input, 384, out, 0x20)
            switch success
            case 0 { invalid() }
        }
        if (!success) revert BLS__InvalidSignature();
        return out[0] != 0;
    }

    function verifyMultiple(
        uint256[2] memory signature,
        uint256[4][] memory pubkeys,
        uint256[2][] memory messages
    )
        internal
        view
        returns (bool)
    {
        uint256 size = pubkeys.length;
        if (size == 0) revert BLS__NoPublicKeysGiven();
        if (size != messages.length) revert BLS__LengthMismatch();

        uint256 inputSize;
        unchecked {
            inputSize = (size + 1) * 6;
        }
        uint256[] memory input = new uint256[](inputSize);
        input[0] = signature[0];
        input[1] = signature[1];
        input[2] = N_G2_X1;
        input[3] = N_G2_X0;
        input[4] = N_G2_Y1;
        input[5] = N_G2_Y0;

        uint256 _i;
        for (uint256 i; i < size;) {
            unchecked {
                _i = i * 6;
                input[_i + 6] = messages[i][0];
                input[_i + 7] = messages[i][1];
                input[_i + 8] = pubkeys[i][1];
                input[_i + 9] = pubkeys[i][0];
                input[_i + 10] = pubkeys[i][3];
                input[_i + 11] = pubkeys[i][2];
                ++i;
            }
        }
        uint256[1] memory out;
        bool success;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            success :=
                staticcall(
                    sub(gas(), 2000),
                    8,
                    add(input, 0x20),
                    mul(inputSize, 0x20),
                    out,
                    0x20
                )
            switch success
            case 0 { invalid() }
        }
        if (!success) revert BLS__InvalidSignature();
        return out[0] != 0;
    }

    function hashToPoint(bytes memory data)
        internal
        view
        returns (uint256[2] memory p)
    {
        return mapToPoint(keccak256(data));
    }

    function mapToPoint(bytes32 _x)
        internal
        view
        returns (uint256[2] memory p)
    {
        uint256 x = uint256(_x) % N;
        uint256 y;
        bool found = false;
        while (true) {
            y = mulmod(x, x, N);
            y = mulmod(y, x, N);
            y = addmod(y, 3, N);
            (y, found) = sqrt(y);
            if (found) {
                p[0] = x;
                p[1] = y;
                break;
            }
            x = addmod(x, 1, N);
        }
    }

    function isValidPublicKey(uint256[4] memory publicKey)
        internal
        pure
        returns (bool)
    {
        if (
            (publicKey[0] >= N) || (publicKey[1] >= N)
                || (publicKey[2] >= N || (publicKey[3] >= N))
        ) return false;
        else return isOnCurveG2(publicKey);
    }

    function isValidSignature(uint256[2] memory signature)
        internal
        pure
        returns (bool)
    {
        if ((signature[0] >= N) || (signature[1] >= N)) return false;
        else return isOnCurveG1(signature);
    }

    function pubkeyToUncompresed(
        uint256[2] memory compressed,
        uint256[2] memory y
    )
        internal
        pure
        returns (uint256[4] memory uncompressed)
    {
        uint256 desicion = compressed[0] & SIGN_MASK;
        if (y[0] & 1 == 1 && desicion != ODD_NUM) {
            revert BLS__BadYCoordinateForUncompressingKey();
        }

        uncompressed[0] = compressed[0] & FIELD_MASK;
        uncompressed[1] = compressed[1];
        uncompressed[2] = y[0];
        uncompressed[3] = y[1];
    }

    function signatureToUncompresed(
        uint256 compressed,
        uint256 y
    )
        internal
        pure
        returns (uint256[2] memory uncompressed)
    {
        uint256 desicion = compressed & SIGN_MASK;
        if (y & 1 == 1 && desicion != ODD_NUM) {
            revert BLS__BadYCoordinateForUncompressingKey();
        }
        return [compressed & FIELD_MASK, y];
    }

    function isValidCompressedPublicKey(uint256[2] memory publicKey)
        internal
        view
        returns (bool)
    {
        uint256 x0 = publicKey[0] & FIELD_MASK;
        uint256 x1 = publicKey[1];
        if ((x0 >= N) || (x1 >= N)) return false;
        else if ((x0 == 0) && (x1 == 0)) return false;
        else return isOnCurveG2([x0, x1]);
    }

    function isValidCompressedSignature(uint256 signature)
        internal
        view
        returns (bool)
    {
        uint256 x = signature & FIELD_MASK;
        if (x >= N) {
            return false;
        } else if (x == 0) {
            return false;
        }
        return isOnCurveG1(x);
    }

    function isOnCurveG1(uint256[2] memory point)
        internal
        pure
        returns (bool _isOnCurve)
    {
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let t0 := mload(point)
            let t1 := mload(add(point, 32))
            let t2 := mulmod(t0, t0, N)
            t2 := mulmod(t2, t0, N)
            t2 := addmod(t2, 3, N)
            t1 := mulmod(t1, t1, N)
            _isOnCurve := eq(t1, t2)
        }
    }

    function isOnCurveG1(uint256 x) internal view returns (bool _isOnCurve) {
        bool callSuccess;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let t0 := x
            let t1 := mulmod(t0, t0, N)
            t1 := mulmod(t1, t0, N)
            t1 := addmod(t1, 3, N)

            let freemem := mload(0x40)
            mstore(freemem, 0x20)
            mstore(add(freemem, 0x20), 0x20)
            mstore(add(freemem, 0x40), 0x20)
            mstore(add(freemem, 0x60), t1)
            // (N - 1) / 2 =
            // 0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            mstore(
                add(freemem, 0x80),
                0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            )
            // N =
            // 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            mstore(
                add(freemem, 0xA0),
                0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            )
            callSuccess :=
                staticcall(sub(gas(), 2000), 5, freemem, 0xC0, freemem, 0x20)
            _isOnCurve := eq(1, mload(freemem))
        }
    }

    function isOnCurveG2(uint256[4] memory point)
        internal
        pure
        returns (bool _isOnCurve)
    {
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            // x0, x1
            let t0 := mload(point)
            let t1 := mload(add(point, 32))
            // x0 ^ 2
            let t2 := mulmod(t0, t0, N)
            // x1 ^ 2
            let t3 := mulmod(t1, t1, N)
            // 3 * x0 ^ 2
            let t4 := add(add(t2, t2), t2)
            // 3 * x1 ^ 2
            let t5 := addmod(add(t3, t3), t3, N)
            // x0 * (x0 ^ 2 - 3 * x1 ^ 2)
            t2 := mulmod(add(t2, sub(N, t5)), t0, N)
            // x1 * (3 * x0 ^ 2 - x1 ^ 2)
            t3 := mulmod(add(t4, sub(N, t3)), t1, N)

            // x ^ 3 + b
            t0 :=
                addmod(
                    t2,
                    0x2b149d40ceb8aaae81be18991be06ac3b5b4c5e559dbefa33267e6dc24a138e5,
                    N
                )
            t1 :=
                addmod(
                    t3,
                    0x009713b03af0fed4cd2cafadeed8fdf4a74fa084e52d1852e4a2bd0685c315d2,
                    N
                )

            // y0, y1
            t2 := mload(add(point, 64))
            t3 := mload(add(point, 96))
            // y ^ 2
            t4 := mulmod(addmod(t2, t3, N), addmod(t2, sub(N, t3), N), N)
            t3 := mulmod(shl(1, t2), t3, N)

            // y ^ 2 == x ^ 3 + b
            _isOnCurve := and(eq(t0, t4), eq(t1, t3))
        }
    }

    function isOnCurveG2(uint256[2] memory x)
        internal
        view
        returns (bool _isOnCurve)
    {
        bool callSuccess;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            // x0, x1
            let t0 := mload(add(x, 0))
            let t1 := mload(add(x, 32))
            // x0 ^ 2
            let t2 := mulmod(t0, t0, N)
            // x1 ^ 2
            let t3 := mulmod(t1, t1, N)
            // 3 * x0 ^ 2
            let t4 := add(add(t2, t2), t2)
            // 3 * x1 ^ 2
            let t5 := addmod(add(t3, t3), t3, N)
            // x0 * (x0 ^ 2 - 3 * x1 ^ 2)
            t2 := mulmod(add(t2, sub(N, t5)), t0, N)
            // x1 * (3 * x0 ^ 2 - x1 ^ 2)
            t3 := mulmod(add(t4, sub(N, t3)), t1, N)
            // x ^ 3 + b
            t0 :=
                add(
                    t2,
                    0x2b149d40ceb8aaae81be18991be06ac3b5b4c5e559dbefa33267e6dc24a138e5
                )
            t1 :=
                add(
                    t3,
                    0x009713b03af0fed4cd2cafadeed8fdf4a74fa084e52d1852e4a2bd0685c315d2
                )

            // is non residue ?
            t0 := addmod(mulmod(t0, t0, N), mulmod(t1, t1, N), N)
            let freemem := mload(0x40)
            mstore(freemem, 0x20)
            mstore(add(freemem, 0x20), 0x20)
            mstore(add(freemem, 0x40), 0x20)
            mstore(add(freemem, 0x60), t0)
            // (N - 1) / 2 =
            // 0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            mstore(
                add(freemem, 0x80),
                0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            )
            // N =
            // 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            mstore(
                add(freemem, 0xA0),
                0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            )
            callSuccess :=
                staticcall(sub(gas(), 2000), 5, freemem, 0xC0, freemem, 0x20)
            _isOnCurve := eq(1, mload(freemem))
        }
    }

    function isOnSubgroupG2Naive(uint256[4] memory point)
        internal
        view
        returns (bool)
    {
        uint256 t0;
        uint256 t1;
        uint256 t2;
        uint256 t3;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            t0 := mload(add(point, 0))
            t1 := mload(add(point, 32))
            // y0, y1
            t2 := mload(add(point, 64))
            t3 := mload(add(point, 96))
        }
        uint256 xx;
        uint256 xy;
        uint256 yx;
        uint256 yy;

        (xx, xy, yx, yy) = BN256G2.ECTwistMul(R, t0, t1, t2, t3);
        return xx == 0 && xy == 0 && yx == 0 && yy == 0;
    }

    function isNonResidueFP(uint256 e)
        internal
        view
        returns (bool isNonResidue)
    {
        bool callSuccess;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let freemem := mload(0x40)
            mstore(freemem, 0x20)
            mstore(add(freemem, 0x20), 0x20)
            mstore(add(freemem, 0x40), 0x20)
            mstore(add(freemem, 0x60), e)
            // (N - 1) / 2 =
            // 0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            mstore(
                add(freemem, 0x80),
                0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            )
            // N =
            // 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            mstore(
                add(freemem, 0xA0),
                0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            )
            callSuccess :=
                staticcall(sub(gas(), 2000), 5, freemem, 0xC0, freemem, 0x20)
            isNonResidue := eq(1, mload(freemem))
        }
        if (!callSuccess) revert BLS__IsNonResidueFP2ModExpCallFailed();
        return !isNonResidue;
    }

    function isNonResidueFP2(uint256[2] memory e)
        internal
        view
        returns (bool isNonResidue)
    {
        uint256 a = addmod(mulmod(e[0], e[0], N), mulmod(e[1], e[1], N), N);
        bool callSuccess;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let freemem := mload(0x40)
            mstore(freemem, 0x20)
            mstore(add(freemem, 0x20), 0x20)
            mstore(add(freemem, 0x40), 0x20)
            mstore(add(freemem, 0x60), a)
            // (N - 1) / 2 =
            // 0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            mstore(
                add(freemem, 0x80),
                0x183227397098d014dc2822db40c0ac2ecbc0b548b438e5469e10460b6c3e7ea3
            )
            // N =
            // 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            mstore(
                add(freemem, 0xA0),
                0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            )
            callSuccess :=
                staticcall(sub(gas(), 2000), 5, freemem, 0xC0, freemem, 0x20)
            isNonResidue := eq(1, mload(freemem))
        }
        if (!callSuccess) revert BLS__IsNonResidueFP2ModExpCallFailed();
        return !isNonResidue;
    }

    function sqrt(uint256 xx) internal view returns (uint256 x, bool hasRoot) {
        bool callSuccess;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            let freemem := mload(0x40)
            mstore(freemem, 0x20)
            mstore(add(freemem, 0x20), 0x20)
            mstore(add(freemem, 0x40), 0x20)
            mstore(add(freemem, 0x60), xx)
            // (N + 1) / 4 =
            // 0xc19139cb84c680a6e14116da060561765e05aa45a1c72a34f082305b61f3f52
            mstore(
                add(freemem, 0x80),
                0xc19139cb84c680a6e14116da060561765e05aa45a1c72a34f082305b61f3f52
            )
            // N =
            // 0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            mstore(
                add(freemem, 0xA0),
                0x30644e72e131a029b85045b68181585d97816a916871ca8d3c208c16d87cfd47
            )
            callSuccess :=
                staticcall(sub(gas(), 2000), 5, freemem, 0xC0, freemem, 0x20)
            x := mload(freemem)
            hasRoot := eq(xx, mulmod(x, x, N))
        }
        if (!callSuccess) revert BLS__SqrtModExpCallFailed();
    }

    function endomorphism(
        uint256 xx,
        uint256 xy,
        uint256 yx,
        uint256 yy
    )
        internal
        pure
        returns (uint256, uint256, uint256, uint256)
    {
        // x coordinate endomorphism
        // (xx, N - xy) is the conjugate of (xx, xy)
        (uint256 xxe, uint256 xye) =
            BN256G2._FQ2Mul(EPS_EXP_0X0, EPS_EXP_0X1, xx, N - xy);
        // y coordinate endomorphism
        // (yx, N - yy) is the conjugate of (yx, yy)
        (uint256 yxe, uint256 yye) =
            BN256G2._FQ2Mul(EPS_EXP_1X0, EPS_EXP_1X1, yx, N - yy);

        return (xxe, xye, yxe, yye);
    }

    /// Using https://eprint.iacr.org/2022/348.pdf
    function isOnSubgroupG2DLZZ(uint256[4] memory point)
        internal
        view
        returns (bool)
    {
        uint256 t0;
        uint256 t1;
        uint256 t2;
        uint256 t3;
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            t0 := mload(add(point, 0))
            t1 := mload(add(point, 32))
            // y0, y1
            t2 := mload(add(point, 64))
            t3 := mload(add(point, 96))
        }

        uint256 xx;
        uint256 xy;
        uint256 yx;
        uint256 yy;
        //s*P
        (xx, xy, yx, yy) = BN256G2.ECTwistMul(S, t0, t1, t2, t3);

        uint256 xx0;
        uint256 xy0;
        uint256 yx0;
        uint256 yy0;
        //(s+1)P
        (xx0, xy0, yx0, yy0) =
            BN256G2.ECTwistAdd(t0, t1, t2, t3, xx, xy, yx, yy);

        uint256[4] memory end0;
        //phi(sP)
        (end0[0], end0[1], end0[2], end0[3]) = endomorphism(xx, xy, yx, yy);
        uint256[4] memory end1;
        //phi^2(sP)
        (end1[0], end1[1], end1[2], end1[3]) =
            endomorphism(end0[0], end0[1], end0[2], end0[3]);
        //(s+1)P + phi(sP)
        (xx0, xy0, yx0, yy0) = BN256G2.ECTwistAdd(
            xx0, xy0, yx0, yy0, end0[0], end0[1], end0[2], end0[3]
        );
        //(s+1)P + phi(sP) + phi^2(sP)
        (xx0, xy0, yx0, yy0) = BN256G2.ECTwistAdd(
            xx0, xy0, yx0, yy0, end1[0], end1[1], end1[2], end1[3]
        );
        //2sP
        (xx, xy, yx, yy) = BN256G2.ECTwistAdd(xx, xy, yx, yy, xx, xy, yx, yy);
        //phi^3(2sP)
        (end0[0], end0[1], end0[2], end0[3]) = endomorphism(xx, xy, yx, yy);
        (end0[0], end0[1], end0[2], end0[3]) =
            endomorphism(end0[0], end0[1], end0[2], end0[3]);
        (end0[0], end0[1], end0[2], end0[3]) =
            endomorphism(end0[0], end0[1], end0[2], end0[3]);

        return
            xx0 == end0[0] && xy0 == end0[1] && yx0 == end0[2] && yy0 == end0[3];
    }
}
