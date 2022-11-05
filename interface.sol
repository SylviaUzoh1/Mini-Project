// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 { //our interface keyword and name, interface name must start with "I"

function totalSupply() external view returns(uint); /*function totalSupply indicates the total amount of tokens created, it is set to return a number, hence uint.*/

function balanceOf(address account) external view returns(uint); /*balanceOf when called, indicates the remmaining tokens in our wallet. Takes in an input, an address from the front end and returns a number, that will be the amount remaining in our input address.*/

function transfer(address recipient, uint amount) external returns(bool); /*this transfer function when called, enables money to be transfered to the recipient. Takes in two inputs, an address that the tokens will be tranferred to and the amount that will be transferred. And, it is set to return in bool- that is, either true or false.*/

function allowance(address owner, address sender) external view returns(uint); /*function allowance takes in two addresses, the address of the person granting access for money-tokens to be taken from his accounnt and the address of the beneficiary. It is set to return a number.*/

function approve(address spender, uint amount) external returns(bool); /*this function approves the spender's address to recieve some tokens from the owner  hence the inputs are the address of the approved spender and the approved amount.*/

function transferFrom(address sender, address recipient, uint amount) external returns(bool); /* This function is usually called by the recipient. It enables tokens to be transferred from the sender's address to the recipient's address and the approved amount. Hence takes in the addresses of the sender and the reciever as input and the amount to be transferred.*/

event Transfer(address indexed from, address indexed to, uint amount); /*Event Transfer takes as input, the address where a transfer will be made from, the address where the money will be sent to, and the amount to be sent. The indexed keyword helps to filter the logs to find the wanted data. The indexed parameters for these logged events enables us to search for these events using the indexed parameters as filters.*/

event Approval(address indexed owner, address indexed spender, uint amount); /*Event Approval takes as input, the owner's address, the appproved spender's address and the approved amount.*/

}