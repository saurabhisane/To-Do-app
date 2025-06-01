const express = require('express');
const body_parser = require('body-parser');
const userRouter = require("./routers/user.route.js");
const TodoRouter = require("./routers/todo.route.js");

const app = express();

app.use(body_parser.json());

app.use('/',userRouter);
app.use('/',TodoRouter);

module.exports = app;