// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0)
// (token/ERC721/presets/ERC721PresetMinterPauserAutoId.sol)

pragma solidity ^0.8.0;

import {
    ERC721Upgradeable,
    ERC721BurnableUpgradeable
} from "../extensions/ERC721BurnableUpgradeable.sol";
import { ERC721PausableUpgradeable } from
    "../extensions/ERC721PausableUpgradeable.sol";
import {
    IERC165Upgradeable,
    ERC721EnumerableUpgradeable
} from "../extensions/ERC721EnumerableUpgradeable.sol";
import { AccessControlEnumerableUpgradeable } from
    "../../../access/AccessControlEnumerableUpgradeable.sol";

/**
 * @dev {ERC721} token, including:
 *
 *  - ability for holders to burn (destroy) their tokens
 *  - a minter role that allows for token minting (creation)
 *  - a pauser role that allows to stop all token transfers
 *  - token ID and URI autogeneration
 *
 * This contract uses {AccessControl} to lock permissioned functions using the
 * different roles - head to its documentation for details.
 *
 * The account that deploys the contract will be granted the minter and pauser
 * roles, as well as the default admin role, which will let it grant both minter
 * and pauser roles to other accounts.
 *
 * _Deprecated in favor of https://wizard.openzeppelin.com/[Contracts Wizard]._
 */
abstract contract ERC721PresetMinterPauserAutoIdUpgradeable is
    ERC721PausableUpgradeable,
    ERC721BurnableUpgradeable,
    ERC721EnumerableUpgradeable,
    AccessControlEnumerableUpgradeable
{
    ///@dev value is equal to keccak256("MINTER_ROLE")
    bytes32 public constant MINTER_ROLE =
        0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6;
    ///@dev value is equal to keccak256("PAUSER_ROLE")
    bytes32 public constant PAUSER_ROLE =
        0x65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a;

    uint256 internal _tokenIdTracker;

    string private __baseTokenURI;

    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `MINTER_ROLE` and `PAUSER_ROLE` to the
     * account that deploys the contract.
     *
     * Token URIs will be autogenerated based on `baseURI` and their token IDs.
     * See {ERC721-tokenURI}.
     */

    function __ERC721PresetMinterPauserAutoId_init(
        string calldata name_,
        string calldata symbol_,
        string calldata baseTokenURI_
    )
        internal
        onlyInitializing
    {
        __ERC721_init_unchained(name_, symbol_);
        __Pausable_init_unchained();
        __ERC721PresetMinterPauserAutoId_init_unchained(baseTokenURI_);
    }

    function __ERC721PresetMinterPauserAutoId_init_unchained(
        string calldata baseTokenURI
    )
        internal
        onlyInitializing
    {
        __baseTokenURI = baseTokenURI;

        address sender = _msgSender();
        _grantRole(MINTER_ROLE, sender);
        _grantRole(PAUSER_ROLE, sender);
        _grantRole(DEFAULT_ADMIN_ROLE, sender);
    }

    function _baseURI()
        internal
        view
        virtual
        override
        returns (string memory)
    {
        return __baseTokenURI;
    }

    /**
     * @dev Creates a new token for `to`. Its token ID will be automatically
     * assigned (and available on the emitted {IERC721-Transfer} event), and the
     * token
     * URI autogenerated based on the base URI passed at construction.
     *
     * See {ERC721-_mint}.
     *
     * Requirements:
     *
     * - the caller must have the `MINTER_ROLE`.
     */
    function mint(address to) public virtual {
        _checkRole(MINTER_ROLE, _msgSender());

        // We cannot just use balanceOf to create the new tokenId because tokens
        // can be burned (destroyed), so we need a separate counter.
        unchecked {
            _mint(to, _tokenIdTracker++);
        }
    }

    /**
     * @dev Pauses all token transfers.
     *
     * See {ERC721Pausable} and {Pausable-_pause}.
     *
     * Requirements:
     *
     * - the caller must have the `PAUSER_ROLE`.
     */
    function pause() public virtual onlyRole(PAUSER_ROLE) {
        _pause();
    }

    /**
     * @dev Unpauses all token transfers.
     *
     * See {ERC721Pausable} and {Pausable-_unpause}.
     *
     * Requirements:
     *
     * - the caller must have the `PAUSER_ROLE`.
     */
    function unpause() public virtual onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    )
        internal
        virtual
        override(
            ERC721Upgradeable,
            ERC721PausableUpgradeable,
            ERC721EnumerableUpgradeable
        )
    {
        super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(
            ERC721Upgradeable,
            ERC721BurnableUpgradeable,
            ERC721EnumerableUpgradeable,
            AccessControlEnumerableUpgradeable
        )
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions
     * to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[48] private __gap;
}
