const TodoServices = require('../services/todo.services')

exports.createTodo = async (req, res, next) => {
    try {
        const { userId, title, desc } = req.body;
        let todo = await TodoServices.createTodo(userId, title, desc);

        res.json({ status: true, success: todo });

    } catch (e) {
        throw e;
    }
}

exports.getTodoList = async (req, res, next) => {
    try {
        const { userId } = req.body;
        let todoData = await TodoServices.getTodoData(userId);

        res.json({ status: true, success: todoData });

    } catch (e) {
        throw e;
    }
}

exports.deleteTodoList = async (req, res, next) => {
    try {
        const { id } = req.body;
        let deletedItem = await TodoServices.deleteTodoData(id);

        res.json({ status: true, success: deletedItem });

    } catch (e) {
        throw e;
    }
}