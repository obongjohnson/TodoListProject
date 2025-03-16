// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


contract TodoList {
    // Struct to represent a Todo item
    struct Todo {
        string text;
        bool completed;
    }

    // Array to store all Todo items
    Todo[] public todos;

    // Event to notify when a new Todo is added
    event TodoAdded(uint256 todoId, string text);
    
    // Event to notify when a Todo is completed
    event TodoCompleted(uint256 todoId);

    // Function to add a new Todo item
    function addTodo(string calldata _text) external {
        uint256 todoId = todos.length;
        todos.push(Todo({
            text: _text,
            completed: false
        }));
        
        emit TodoAdded(todoId, _text);
    }

    // Function to mark a Todo as completed
    function completeTodo(uint256 _todoId) external {
        require(_todoId < todos.length, "Todo does not exist");
        require(!todos[_todoId].completed, "Todo already completed");

        todos[_todoId].completed = true;
        emit TodoCompleted(_todoId);
    }

    // Function to get the total number of Todos
    function getTodosCount() external view returns (uint256) {
        return todos.length;
    }

    // Function to get a specific Todo by ID
    function getTodo(uint256 _todoId) external view returns (string memory text, bool completed) {
        require(_todoId < todos.length, "Todo does not exist");
        Todo memory todo = todos[_todoId];
        return (todo.text, todo.completed);
    }
}
