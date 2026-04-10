// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import  "../src/Winners.sol";

contract WinnersTest is Test {

    Winners public winner;
    address public owner = makeAddr('owner');
    address public alice = makeAddr('alice');
    function setUp() public {
        winner = new Winners();
        vm.startPrank(owner);
       
    }

    
}
