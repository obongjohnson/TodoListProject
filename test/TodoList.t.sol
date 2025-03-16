// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


import "forge-std/Test.sol";
import "../src/TodoList.sol";

contract TodoListTest is Test {
    TodoList public todoList;

    function setUp() public {
        // Deploy a new instance of TodoList before each test
        todoList = new TodoList();
    }

    function testAddTodo() public {
        todoList.addTodo("Learn Solidity");
        assertEq(todoList.getTodosCount(), 1);
    }

    function testCompleteTodo() public {
        todoList.addTodo("Complete a task");
        uint256 todoId = 0;
        
        todoList.completeTodo(todoId);
        (string memory text, bool completed) = todoList.getTodo(todoId);
        assertTrue(completed);
        assertEq(text, "Complete a task");
    }
}
