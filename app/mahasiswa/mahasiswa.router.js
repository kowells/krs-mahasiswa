const express = require("express");
const { getAllMahasiswa, createMahasiswa } = require("./mahasiswa.controller");

const routerMahasiswa = express.Router();

routerMahasiswa.get("/", getAllMahasiswa);
routerMahasiswa.post("/", createMahasiswa);

module.exports = routerMahasiswa;
