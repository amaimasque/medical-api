/*
  Warnings:

  - The `gender` column on the `staff` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `type` column on the `staff` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `shift` column on the `staff` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('Male', 'Female');

-- CreateEnum
CREATE TYPE "StaffType" AS ENUM ('Doctor', 'Nurse');

-- CreateEnum
CREATE TYPE "Shift" AS ENUM ('Day', 'Night');

-- AlterTable
ALTER TABLE "staff" DROP COLUMN "gender",
ADD COLUMN     "gender" "Gender" NOT NULL DEFAULT 'Male',
DROP COLUMN "type",
ADD COLUMN     "type" "StaffType" NOT NULL DEFAULT 'Nurse',
DROP COLUMN "shift",
ADD COLUMN     "shift" "Shift" NOT NULL DEFAULT 'Day';
