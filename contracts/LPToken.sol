// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

/**
 * @title Liquidity Provider Token
 * @notice This token is an ERC20 detailed token with added capability to be minted by the owner.
 * It is used to represent user's shares when providing liquidity to swap contracts.
 */
contract LPToken is ERC20Burnable, Ownable {
  using SafeMath for uint256;

  /**
   * @notice Deploys LPToken contract with given name, symbol, and decimals
   * @dev the caller of this constructor will become the owner of this contract
   * @param name_ name of this token
   * @param symbol_ symbol of this token
   * @param decimals_ number of decimals this token will be based on
   */
  constructor(
    string memory name_,
    string memory symbol_,
    uint8 decimals_
  ) public ERC20(name_, symbol_) {
    _setupDecimals(decimals_);
  }

  /**
   * @notice Mints the given amount of LPToken to the recipient.
   * @dev only owner can call this mint function
   * @param recipient address of account to receive the tokens
   * @param amount amount of tokens to mint
   */
  function mint(address recipient, uint256 amount) external onlyOwner {
    require(amount != 0, "amount == 0");
    _mint(recipient, amount);
  }
}