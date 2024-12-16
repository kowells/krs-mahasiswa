/*
  Warnings:

  - A unique constraint covering the columns `[nim]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nim` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Mahasiswa" DROP CONSTRAINT "Mahasiswa_nim_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "nim" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "User_nim_key" ON "User"("nim");

-- AddForeignKey
ALTER TABLE "Mahasiswa" ADD CONSTRAINT "Mahasiswa_nim_fkey" FOREIGN KEY ("nim") REFERENCES "User"("nim") ON DELETE RESTRICT ON UPDATE CASCADE;
