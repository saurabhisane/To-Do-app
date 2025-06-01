const UserModel = require("../model/user.model");
const UserService = require("../services/user.services");
const { registerUser } = require("../services/user.services");

exports.register = async (req, res, next) => {
    try {

        const { email, password } = req.body;

        const succesRes = await registerUser(email, password);

        res.json({ status: true, success: 'user Registered susccessfully' });

    } catch (e) {
        console.error("Error in register:", e);
        res.status(500).json({ status: false, error: e.message || "Internal Server Error" });
    }
}

exports.login = async (req, res, next) => {
    try {

        const { email, password } = req.body;

        const user = await UserService.checkuser(email);

        if (!user) {
            throw new Error('User does not exist');
        }

        const ismatch = await user.comparePassword(password);

        console.log("ismatch = ",ismatch)

        if (ismatch === false) {

            throw new Error('Invalid password');
        } else {

            let tokenData = { _id: user._id, email: user.email };

            const token = await UserService.generateToken(tokenData, "SecretKey", "1h");

            res.status(200).json({ status: true, token: token });
        }

    } catch (e) {
        console.error("Error in register:", e);
        res.status(500).json({ status: false, error: e.message || "Internal Server Error" });
    }
}   