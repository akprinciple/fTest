// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {VulnerableVault} from "../src/VulnerableVault.sol";

contract VulnerableVaultTest is Test {
    VulnerableVault public vault;
    address public owner = makeAddr('owner');
    address public alice = makeAddr('alice');
    function setUp() public {
        vm.prank(owner);
        
        vault = new VulnerableVault{value: 10 ether}();
       
    }

    function test_withdrawal() public {
        // deal(alice, 1 ether);
        vm.startPrank(alice);

        // vault.deposit{value: 1 ether}(alice, 119000);
        // console.log(vault.viewDeposit(alice));
        // assert(vault.viewDeposit(alice)> 1);
         vault.deposit{value: 1}(alice, 16859);
         assertEq(vault.viewDeposit(alice), type(uint256).max);
    }


    // function testFuzz_SetNumber(uint256 x) public {
    //     vault.setNumber(x);
    //     assertEq(vault.number(), x);
    // }
}
