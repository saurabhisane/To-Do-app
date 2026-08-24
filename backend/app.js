const express = require('express');
const body_parser = require('body-parser');
const cors = require('cors');

const userRouter = require("./routers/user.route.js");
const TodoRouter = require("./routers/todo.route.js");

const app = express();
// app.use(cors());

app.use(cors({
  origin: "http://192.168.49.2:30532",
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
}));


app.use(body_parser.json());

app.use('/',userRouter);
app.use('/',TodoRouter);

module.exports = app;