const z = require("zod");

const mahasiswaValid = z.object({
  nim: z.number(),
  nama: z.string(),
  prodi: z.string(),
  emial: z.string(),
  password: z.string()
});

module.exports = { mahasiswaValid };
