
const {
    PutCommand,
    QueryCommand,
    DeleteCommand
} = require("@aws-sdk/lib-dynamodb");

const crypto = require("crypto");

const dynamoDB = require("../config/dynamodb");

const TODOS_TABLE = "TodoItems";

class TodoServices {

    static async createTodo(userId, title, desc) {

        const todo = {
            userId: userId,
            todoId: crypto.randomUUID(),
            title: title,
            desc: desc
        };

        await dynamoDB.send(
            new PutCommand({
                TableName: TODOS_TABLE,
                Item: todo
            })
        );

        return todo;
    }


    static async getTodoData(userId) {

        const result = await dynamoDB.send(
            new QueryCommand({
                TableName: TODOS_TABLE,

                KeyConditionExpression: "userId = :userId",

                ExpressionAttributeValues: {
                    ":userId": userId
                }
            })
        );

        return result.Items || [];
    }


    static async deleteTodoData(userId, todoId) {

        const result = await dynamoDB.send(
            new DeleteCommand({
                TableName: TODOS_TABLE,

                Key: {
                    userId: userId,
                    todoId: todoId
                },

                ReturnValues: "ALL_OLD"
            })
        );

        return result.Attributes || null;
    }
}

module.exports = TodoServices;