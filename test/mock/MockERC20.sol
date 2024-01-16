// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import { ERC20 } from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    uint8 decimal;

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimal_
    )
        ERC20(name_, symbol_)
    {
        decimal = decimal_;
    }

    function decimals() public view override returns (uint8) {
        return decimal;
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function mintBulk(
        address[] calldata addresses,
        uint256[] calldata amounts
    )
        public
    {
        for (uint256 i; i < addresses.length;) {
            _mint(addresses[i], amounts[i]);
            unchecked {
                ++i;
            }
        }
    }

    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }
}
