const UserModel = require("../model/user.model.js");
const jwt = require('jsonwebtoken');

class UserService {
    static async registerUser(email, password) {
        try {
            const createUser = new UserModel({ email, password });
            return await createUser.save();
        } catch (e) {
            throw e;
        }
    }

    static async checkuser(email) {
        try {
            return await UserModel.findOne({ email });
        } catch (error) {
            throw error;
        }
    }

    static async generateToken(tokenData, secretKey, jwtExp) {
        return jwt.sign(tokenData, secretKey, { expiresIn: jwtExp });
    }

}

module.exports = UserService;