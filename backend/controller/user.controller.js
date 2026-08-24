
const UserService = require("../services/user.services");
const bcrypt = require("bcrypt");

exports.register = async (req, res) => {

    try {

        const { email, password } = req.body;

        await UserService.registerUser(email, password);

        res.status(201).json({
            status: true,
            success: "User Registered successfully"
        });

    } catch (e) {

        console.error("Error in register:", e);

        res.status(500).json({
            status: false,
            error: e.message || "Internal Server Error"
        });
    }
};


exports.login = async (req, res) => {

    try {

        const { email, password } = req.body;

        const user = await UserService.checkuser(email);

        if (!user) {

            return res.status(404).json({
                status: false,
                error: "User does not exist"
            });
        }

        const ismatch = await bcrypt.compare(
            password,
            user.password
        );

        if (!ismatch) {

            return res.status(401).json({
                status: false,
                error: "Invalid password"
            });
        }

        const tokenData = {
            _id: user.userId,
            email: user.email
        };

        const token = await UserService.generateToken(
            tokenData,
            process.env.JWT_SECRET || "SecretKey",
            "1h"
        );

        res.status(200).json({
            status: true,
            token: token
        });

    } catch (e) {

        console.error("Error in login:", e);

        res.status(500).json({
            status: false,
            error: e.message || "Internal Server Error"
        });
    }
};