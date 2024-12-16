/*
  Warnings:

  - You are about to drop the column `userId` on the `Mahasiswa` table. All the data in the column will be lost.
  - Changed the type of `nim` on the `Mahasiswa` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Mahasiswa" DROP CONSTRAINT "Mahasiswa_userId_fkey";

-- DropIndex
DROP INDEX "Mahasiswa_userId_key";

-- AlterTable
ALTER TABLE "Mahasiswa" DROP COLUMN "userId",
DROP COLUMN "nim",
ADD COLUMN     "nim" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Mahasiswa_nim_key" ON "Mahasiswa"("nim");

-- AddForeignKey
ALTER TABLE "Mahasiswa" ADD CONSTRAINT "Mahasiswa_nim_fkey" FOREIGN KEY ("nim") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
