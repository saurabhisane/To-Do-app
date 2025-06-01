const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const { Schema } = mongoose;

const userSchema = new Schema({
    email: {
        type: String,
        required: true,
        lowercase: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    }
});


userSchema.pre('save', async function (next) {
    try {
        const user = this;

        // Only hash the password if it has been modified (or is new)
        if (user.isModified('password')) {
            const salt = await bcrypt.genSalt(10);
            const hashpass = await bcrypt.hash(user.password, salt);
            user.password = hashpass;
        }
        next(); // Call next to proceed with the save operation
    } catch (e) {
        next(e); // Pass the error to the next middleware
    }
});

// Method to compare passwords
userSchema.methods.comparePassword = async function (userPass) {
    try {
        const ismatch = await bcrypt.compare(userPass, this.password);
        console.log(ismatch); // Debugging line
        return ismatch;
    } catch (e) {
        throw e; // Rethrow the error
    }
}

const UserModel = mongoose.model('User', userSchema);

module.exports = UserModel;