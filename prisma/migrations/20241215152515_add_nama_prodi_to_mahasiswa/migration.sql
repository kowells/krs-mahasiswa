/*
  Warnings:

  - Added the required column `nama` to the `Mahasiswa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prodi` to the `Mahasiswa` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Mahasiswa" ADD COLUMN     "nama" TEXT NOT NULL,
ADD COLUMN     "prodi" TEXT NOT NULL;
