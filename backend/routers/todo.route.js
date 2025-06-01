const express = require('express');
const router = express.Router();
const todoController = require('../controller/todo.controller');

// Route to create a new todo
router.post('/todo', todoController.createTodo);

router.post('/getTodoData', todoController.getTodoList);

router.post('/deleteTodo', todoController.deleteTodoList);

module.exports = router;