const app = require('./app');
const db = require('./config/db')
const UserModel  = require('./model/user.model.js')
const TodoModel  = require('./model/todo.model.js')

const port = 4588;

app.get('/',(req,res)=>{
     res.send("Hello world");
})

// app.listen(port,()=>{
//     console.log(`server Listening on port http://localhost:${port}`);
// });

app.listen(port, '0.0.0.0', () => {
  console.log("Server running on port 4588");
});
