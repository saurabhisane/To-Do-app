
const {
    PutCommand,
    GetCommand
} = require("@aws-sdk/lib-dynamodb");

const crypto = require("crypto");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const dynamoDB = require("../config/dynamodb");

const USERS_TABLE = "TodoUsers";

class UserService {

    static async registerUser(email, password) {

        const normalizedEmail = email.toLowerCase();

        const existingUser = await dynamoDB.send(
            new GetCommand({
                TableName: USERS_TABLE,
                Key: {
                    email: normalizedEmail
                }
            })
        );

        if (existingUser.Item) {
            throw new Error("User already exists");
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const user = {
            userId: crypto.randomUUID(),
            email: normalizedEmail,
            password: hashedPassword
        };

        await dynamoDB.send(
            new PutCommand({
                TableName: USERS_TABLE,
                Item: user
            })
        );

        return user;
    }

    static async checkuser(email) {

        const normalizedEmail = email.toLowerCase();

        const result = await dynamoDB.send(
            new GetCommand({
                TableName: USERS_TABLE,
                Key: {
                    email: normalizedEmail
                }
            })
        );

        return result.Item || null;
    }

    static async generateToken(tokenData, secretKey, jwtExp) {

        return jwt.sign(
            tokenData,
            secretKey,
            {
                expiresIn: jwtExp
            }
        );
    }
}

module.exports = UserService;