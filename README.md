# Degen Makeup Token

The project is about Degen Makeup Token, allowing users to use tokens for makeup items and fun features in a beauty-focused world.

## Description
This code is all about Degen Makeup Token, a special digital currency mixing beauty and blockchain. It does regular money stuff like creating and burning tokens, plus it lets users have fun redeeming makeup items and getting special discounts. 

## Getting Started
## Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.
   
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

In order to deploy this contract onto the avalanche fuji testnet, try running this command:
    
    npx hardhat run/scripts/deploy.js --network fuji
In order to verify the contract address , try running this command:
    
    npx hardhat verify {address} --network fuji

## Authors

Manvi Sinha [@sinhamanvi17@gmail.com]

## License

This project is licensed under the MIT License.
