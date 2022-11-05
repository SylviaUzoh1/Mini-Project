// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//main contract
import "./ERC20(2.sol"; //we import the file carrying our interface with the import keyword and the filename.

contract ERC20 is IERC20 { // we inherit our interface with, "is + our interface name" 
    uint public override totalSupply; /*function totalSupply is stated as a state variable and "override" is used here and throughout to prevent duplicating the initial names our functions were called in our interface.*/
//public in line 7 & others is used so that we can call the function outside our contract.

    mapping(address => uint) public override balanceOf; /*mapping is usually used for the balanceOf function, it contains an "address" and an "amount" that will help determine the amount left in the address that is being checked.*/

    mapping(address => mapping(address => uint)) public override allowance; /*Nested mapping, function allowance contains two addresses, the address of the person granting access for money-tokens to be taken from his accounnt and the address of the beneficiary, and also the amount that is alloed to be taken.*/

    string public name ="Tech4dev Token"; //name of the created token
    string public symbol ="TDT"; //symbol that the token will be designated
    uint public decimals =18; /* decimals indicate how divisible a token can be, the decimals value is the number of digits that come after the decimal place when displaying token values on-screen. This is because Ethereum does not deal with decimal numbers,  but states all numeric values as integers. By default, ERC20 uses a value of 18 for decimals.*/

   function transfer(address recipient, uint amount) external override returns(bool) {
   balanceOf[msg.sender] -=amount; // indicates a deduction in the balance of the person calling the contract.
   balanceOf[recipient] = balanceOf[recipient] + amount; /*indicates that the deducted token from the address of the person calling the contract is added to the recipient's address.*/
   emit Transfer(msg.sender, recipient, amount); /*from the Transfer event created, this emit keyword broadcasts the address of the person calling the function, the address of the receiver where the tokens are going to, and the amount of tokens.*/
   return true; //for the function to reuturn true if successful.
   }

   function approve(address spender, uint amount) external override returns(bool) { /*approves the spender to take out a certain amount of tokens from his address, hence the inputs are the address of the approved spender and the approved amount.*/
   allowance[msg.sender][spender] =amount; /* an allowance function is executed before an approve function, this indicates that the function will execute where allowance has been made for the person calling the function, to send out to the spender's address, a certain amount of tokens.*/
   emit Approval(msg.sender, spender, amount); /*from the Approval event in the interface, the emit keyword broadcasts the approval made for the person calling the contract to send to the spender, some amount of tokens.*/
   return true; // function is to return true where the transaction is successful.
   }

   function transferFrom(address sender, address recipient, uint amount) external override returns(bool) { /*enables tokens to be transferred from the sender's address to the recipient's address and the approved amount. Hence takes in the addresses of the sender and the reciever as input and the amount to be transferred.*/
    allowance[sender][msg.sender] -=amount; /*an allowance function is executed before an approve function, before the transferFrom is then executed, this enables a deduction in the allowance of the person calling the contract, who is the receiver.*/
    balanceOf[sender] -=amount; //enables a deduction in the address of the sender to the tune of the amount indicated.
    balanceOf[recipient] +=amount; //enables an addition in the recipient's address to the tune of the amount indicated.
    emit Transfer(sender, recipient, amount); /*from the Transfer event created, this emit keyword broadcasts the address of the sender, the address of the receiver where the tokens are going to, and the amount of tokens.*/
    return true; //function is to return true where the transaction is successful.
    }

    function mint(uint amount) public { /*mint is used to create tokens, the function contains an input, amount which will be used to indicate the amount of tokens to be created.*/
    balanceOf[msg.sender] += amount; /*this enables an addition of the minted tokens to the address of the person calling the contract when the mint function is called.*/
    totalSupply = totalSupply + amount; /*also enables an addition of the minted tokens to the total supply of minted tokens when the mint function is called.*/
    emit Transfer(address(0), msg.sender, amount); /*from the Transfer event created, this emit keyword broadcasts the unknown address that the tokens are being minted from, hence the "(0)", the address that the newly minted tokens are going to and the amount of tokens minted.*/
    }

    function burn(uint amount) public { /*function "burn" is used to destroy tokens, contains an input, amount which will be used specify the amount of tokens that will be burnt.*/
    balanceOf[msg.sender] -=amount; /*this enables a deduction from the address of the person calling the contract, when the burn function is called, and to the amount that is burnt.*/
    totalSupply -=amount; /*this enables a deduction in the total supply of created tokens, when the burn function is called, and to the amount that is burnt.*/
    emit Transfer(msg.sender, address(0), amount); /* from the Transfer event created, this emit keyword also broadcasts the address that the burnt tokens are deducted from, the amount of tokens burnt and the unknown address that the burnt tokens are going to, hence the "(0)".*/
    
    }
    
}
  