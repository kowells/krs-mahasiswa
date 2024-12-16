const express = require("express");
const bodyParser = require("body-parser");
const routerMahasiswa = require("./app/mahasiswa/mahasiswa.router");

const app = express();
const port = 3000;
app.use(bodyParser.json());

app.use("/mahasiswa", routerMahasiswa);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
