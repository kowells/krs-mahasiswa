/*
  Warnings:

  - You are about to drop the column `nim` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `Mahasiswa` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `Mahasiswa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `Mahasiswa` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Mahasiswa" DROP CONSTRAINT "Mahasiswa_nim_fkey";

-- DropIndex
DROP INDEX "User_nim_key";

-- AlterTable
ALTER TABLE "Mahasiswa" ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "password" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "nim",
ALTER COLUMN "role" SET DEFAULT 'ADMIN';

-- CreateIndex
CREATE UNIQUE INDEX "Mahasiswa_email_key" ON "Mahasiswa"("email");
