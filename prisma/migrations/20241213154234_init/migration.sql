-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'USER');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'USER',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Mahasiswa" (
    "id" SERIAL NOT NULL,
    "nim" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Mahasiswa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MataKuliah" (
    "id" SERIAL NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "sks" INTEGER NOT NULL,

    CONSTRAINT "MataKuliah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Krs" (
    "id" SERIAL NOT NULL,
    "mahasiswaId" INTEGER NOT NULL,
    "matkulId" INTEGER NOT NULL,

    CONSTRAINT "Krs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Mahasiswa_nim_key" ON "Mahasiswa"("nim");

-- CreateIndex
CREATE UNIQUE INDEX "Mahasiswa_userId_key" ON "Mahasiswa"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "MataKuliah_kode_key" ON "MataKuliah"("kode");

-- AddForeignKey
ALTER TABLE "Mahasiswa" ADD CONSTRAINT "Mahasiswa_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Krs" ADD CONSTRAINT "Krs_mahasiswaId_fkey" FOREIGN KEY ("mahasiswaId") REFERENCES "Mahasiswa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Krs" ADD CONSTRAINT "Krs_matkulId_fkey" FOREIGN KEY ("matkulId") REFERENCES "MataKuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
