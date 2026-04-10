// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {CoinFlip} from "../src/CoinFlip.sol";

contract CoinFlipScript is Script {
    CoinFlip public coin = CoinFlip(0xA62fE5344FE62AdC1F356447B669E9E6D10abaaF);
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 lastHash;

    constructor(CoinFlip _flip) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = true;
        _flip.flip(side);
    }

    function setUp() public {}

    function run() public {
        vm.startBroadcast(msg.sender);

        new CoinFlip(coin);

        vm.stopBroadcast();
    }
}

