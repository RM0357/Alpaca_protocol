// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts@4.8.1/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.8.1/access/Ownable.sol";

contract AlpacaToken is ERC20, Ownable {
    constructor() ERC20("Alpaca", "ALP") {}

    uint256 public maxTokenSupply = 100000000; // what is the right value? 100M with 18 or not? probably not
    function mint(address to, uint256 amount) public onlyOwner { // check successfull: only owner can mint tokens to any address.
        // is there a check which can protect user from being using gas for nothing?
        if (maxTokenSupply > amount){ // function gets executed and gas is spent even though if was never executed. Do i need some _require check here?
        _mint(to, amount);
        maxTokenSupply -=amount; 
        }
    }
    function getRemainingSupply() view public returns (uint256){
        return maxTokenSupply;
    }
    
}

// to do:
/*
1. Create and test basic token minting with Metamask
2. Start adding features
3. Write basic functions, care about @functions and tests later.
4. Gas is being spent if/when not owner is calling the contract? - yes 25k wei , just reading doesnt cost gas.
5. How to do upgradable proxy?
6. Checking Minting and if it reduces the totalTokenSupply - works good.
*/
