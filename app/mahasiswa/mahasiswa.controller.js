const prisma = require("../utils/prisma");
const { mahasiswaValid } = require("../mahasiswa/mahasiswa.validation");

const getAllMahasiswa = async (req, res) => {
  try {
    const mahasiswa = await prisma.mahasiswa.findMany();
    return res.status(200).json({
      success: true,
      message: "Get all data mahasiswa success",
      data: mahasiswa,
    });
  } catch (error) {
    console.log(error);

    return res.status(500).json({
      success: false,
      message: "Get all data mahasiswa failed",
    });
  }
};

const createMahasiswa = async (req, res) => {
  try {
    const parseMahasiswa = mahasiswaValid.safeParse(req.body);

    if (!parseMahasiswa.success) {
      const errorMessage = parseMahasiswa.error.issues.map(
        (err) => `${err.path} - ${err.message}`
      );

      return res.json({
        success: false,
        message: errorMessage,
        data: null,
      });
    }

    const mahasiswa = await prisma.mahasiswa.create({
      data: {
        nim: parseMahasiswa.data.nim,
        nama: parseMahasiswa.data.nama,
        prodi: parseMahasiswa.data.prodi,
      },
    });
    return res.json({
      success: true,
      message: "Create data mahasiswa success",
      data: mahasiswa,
    });
  } catch (error) {
    console.log(error);

    return res.status(500).json({
      success: false,
      message: "Create data mahasiswa failed",
    });
  }
};

module.exports = {
  getAllMahasiswa,
  createMahasiswa,
};
