// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {W3bBank} from "../src/W3bBank.sol";

contract W3bBankTest is Test {
    W3bBank public w3bBank;
    address public owner = makeAddr('owner');
    address public alice = makeAddr('alice');
    function setUp() public {
        vm.prank(owner);
        
        w3bBank = new W3bBank();
        deal(owner, 1 ether);
       
    }

    function test_withdrawal() public {
        // deal(alice, 1 ether);
        vm.startPrank(alice);

        // w3bBank.deposit{value: 1 ether}(alice, 119000);
        // console.log(w3bBank.viewDeposit(alice));
        // assert(w3bBank.viewDeposit(alice)> 1);
         w3bBank.deposit{value: 1}(alice, 16859);
         assertEq(w3bBank.viewDeposit(alice), type(uint256).max);
    }


    // function testFuzz_SetNumber(uint256 x) public {
    //     w3bBank.setNumber(x);
    //     assertEq(w3bBank.number(), x);
    // }
}
