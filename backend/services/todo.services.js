const TodoModel = require('../model/todo.model')

class TodoServices {
    static async createTodo(userId, title, desc) {
        const createTodo = new TodoModel({ userId, title, desc });
        return createTodo.save();
    }
    static async getTodoData(userId) {
        return await TodoModel.find({ userId });
    }
    static async deleteTodoData(id) {
        return await TodoModel.findOneAndDelete({ _id: id }); 
    }
}

module.exports = TodoServices;