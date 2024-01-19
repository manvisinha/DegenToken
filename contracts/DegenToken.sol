// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable 
{
string public items_in_shop;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender)
    {
      items_in_shop= "The items in the items_in_shop are as follows: 1. Lipstick 2. Tint 3. Nail paint remover 4. Nail paint";  
    }

        function mint(address to, uint256 amount) public onlyOwner 
        {
            _mint(to, amount);
    }
    function redeem(uint256 item_number) public
    {
        require(item_number>= 1 && item_number <= 4, "No such item exists.");
        uint256 tokensToBurn = item_number * 160;
        require(balanceOf(msg.sender) >= tokensToBurn, "Insufficient balance for redemption");
        _burn(msg.sender, tokensToBurn);
    }
    function discount(uint256 coupon_code, uint256 item_number) public 
    {
        require(coupon_code== 5637, "You cannot avail this coupon.");
        _burn(msg.sender, item_number*80);
    }
}
