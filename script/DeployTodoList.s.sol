// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "forge-std/Script.sol";
import "../src/TodoList.sol";

contract DeployTodoList is Script {
    function run() public {
        // Start broadcasting the transaction
        vm.startBroadcast();

        // Deploy the TodoList contract
        TodoList todoList = new TodoList();
        
        // Stop broadcasting the transaction
        vm.stopBroadcast();

        // Print the contract address (optional)
        console.log("TodoList deployed at:", address(todoList));
    }
}

