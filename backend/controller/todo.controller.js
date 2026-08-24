

const TodoServices = require("../services/todo.services");

exports.createTodo = async (req, res) => {

    try {

        const { userId, title, desc } = req.body;

        if (!userId || !title || !desc) {
            return res.status(400).json({
                status: false,
                error: "userId, title and desc are required"
            });
        }

        const todo = await TodoServices.createTodo(
            userId,
            title,
            desc
        );

        res.status(201).json({
            status: true,
            success: todo
        });

    } catch (e) {

        console.error("Error creating todo:", e);

        res.status(500).json({
            status: false,
            error: e.message || "Internal Server Error"
        });
    }
};


exports.getTodoList = async (req, res) => {

    try {

        const { userId } = req.body;

        if (!userId) {
            return res.status(400).json({
                status: false,
                error: "userId is required"
            });
        }

        const todoData =
            await TodoServices.getTodoData(userId);

        res.status(200).json({
            status: true,
            success: todoData
        });

    } catch (e) {

        console.error("Error getting todos:", e);

        res.status(500).json({
            status: false,
            error: e.message || "Internal Server Error"
        });
    }
};


exports.deleteTodoList = async (req, res) => {

    try {

        const { userId, todoId } = req.body;

        if (!userId || !todoId) {
            return res.status(400).json({
                status: false,
                error: "userId and todoId are required"
            });
        }

        const deletedItem =
            await TodoServices.deleteTodoData(
                userId,
                todoId
            );

        if (!deletedItem) {
            return res.status(404).json({
                status: false,
                error: "Todo not found"
            });
        }

        res.status(200).json({
            status: true,
            success: deletedItem
        });

    } catch (e) {

        console.error("Error deleting todo:", e);

        res.status(500).json({
            status: false,
            error: e.message || "Internal Server Error"
        });
    }
};