// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;


import {Script, console} from "forge-std/Script.sol";
import "../src/ChallengeTwo.sol";

contract ChallengeTwoScript is Script {
            ChallengeTwo challenge = ChallengeTwo(0x0E33589278B45fB9999F7E1C384b74425e33333B);

        function setUp() external {}

        function run() external{
                vm.startBroadcast();
                    uint8 correctKey;
        bytes32 targetHash = 0x98a476f1687bc3d60a2da2adbcba2c46958e61fa2fb4042cd7bc5816a710195b;
        // used 256 bcos of uint8
        for (uint16 i = 0; i <= 255; i++) {
            if (keccak256(abi.encode(uint8(i))) == targetHash) {
                correctKey = uint8(i);
                break;
            }
        }
        
        challenge.passKey(correctKey);
        for (uint i = 0; i < 4; i++) {
            challenge.getENoughPoint("AA");
        }
           // 1. Grab the array from the contract and save it to memory
string[] memory winners = challenge.getAllwiners();

console.log("--- Champions List ---");

// 2. Loop through the array and print each name individually
for (uint i = 0; i < winners.length; i++) {
    console.log("Champion", i, ":", winners[i]);
}
            // console.log("Successfully called addYourName!");
            vm.stopBroadcast();
        }

}