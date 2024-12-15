const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.send("Hello World!");
});

// app.get('/', {req, res} => {

// })

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
