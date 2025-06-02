// // mongodb://localhost:27017
// const mongoose = require('mongoose');

// const connection = mongoose.createConnection('mongodb://127.0.0.1:27017').on('open',()=>{
//     console.log('Mongodb susscesfully connected');
// }).on('error',()=>{
//     console.log('Mongodb connection error!!');
// });

// module.exports = connection;

const mongoose = require('mongoose');

const mongo =  'mongodb://127.0.0.1:27017/newTodo';


mongoose.connect(mongo)
    .then(() => {
        console.log('Mongodb successfully connected');
    })
    .catch((err) => {
        console.log('Mongodb connection error!!', err);
    });

module.exports = mongoose;
