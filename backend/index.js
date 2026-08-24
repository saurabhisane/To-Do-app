const app = require('./app');

const port = 4588;

app.get('/',(req,res)=>{
     res.send("Hello world");
})

app.listen(port, '0.0.0.0', () => {
  console.log("Server running on port 4588");
});
