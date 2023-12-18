-- CreateTable
CREATE TABLE "appointment" (
    "id" SERIAL NOT NULL,
    "dateScheduled" TIMESTAMP(6) NOT NULL,
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),
    "doctorId" INTEGER,
    "diagnosisId" INTEGER,
    "patientId" INTEGER,

    CONSTRAINT "PK_e8be1a53027415e709ce8a2db74" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bed" (
    "id" SERIAL NOT NULL,
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),
    "roomId" INTEGER,

    CONSTRAINT "PK_828b3f79eab8a8b1de6b6ed6c5a" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "diagnosis" (
    "id" SERIAL NOT NULL,
    "diagnosis" VARCHAR NOT NULL,
    "illnesses" VARCHAR NOT NULL,
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),

    CONSTRAINT "PK_d5dbb1cc4e30790df368da56961" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "patient" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR NOT NULL,
    "lastName" VARCHAR NOT NULL,
    "middleName" VARCHAR NOT NULL,
    "birthYear" VARCHAR(4) NOT NULL,
    "birthMonth" VARCHAR(2) NOT NULL,
    "birthDay" VARCHAR(2) NOT NULL,
    "gender" VARCHAR NOT NULL DEFAULT 'Male',
    "address" VARCHAR,
    "emailAddress" VARCHAR(25),
    "phoneNumber" VARCHAR(10),
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),
    "assignedBedId" INTEGER,

    CONSTRAINT "PK_8dfa510bb29ad31ab2139fbfb99" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "room" (
    "id" SERIAL NOT NULL,
    "assignedRoomId" VARCHAR(3) NOT NULL,
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),

    CONSTRAINT "PK_c6d46db005d623e691b2fbcba23" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "staff" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR NOT NULL,
    "lastName" VARCHAR NOT NULL,
    "middleName" VARCHAR NOT NULL,
    "birthYear" VARCHAR(4) NOT NULL,
    "birthMonth" VARCHAR(2) NOT NULL,
    "birthDay" VARCHAR(2) NOT NULL,
    "gender" VARCHAR NOT NULL DEFAULT 'Male',
    "address" VARCHAR NOT NULL,
    "emailAddress" VARCHAR(25),
    "phoneNumber" VARCHAR(10) NOT NULL,
    "type" VARCHAR NOT NULL DEFAULT 'Nurse',
    "shift" VARCHAR NOT NULL DEFAULT 'Day',
    "isSurgeon" BOOLEAN NOT NULL DEFAULT false,
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),

    CONSTRAINT "PK_e4ee98bb552756c180aec1e854a" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "surgery" (
    "id" SERIAL NOT NULL,
    "dateScheduled" TIMESTAMP(6) NOT NULL,
    "dateCreated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateDeleted" TIMESTAMP(6),
    "surgeonId" INTEGER,
    "roomId" INTEGER,
    "patientId" INTEGER,

    CONSTRAINT "PK_2e963fc0e35d07a36e15f331754" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "REL_86395090f1ed2a6b749103a313" ON "appointment"("diagnosisId");

-- CreateIndex
CREATE UNIQUE INDEX "REL_3e05ff4e55732f2cc3eb5bdfc5" ON "patient"("assignedBedId");

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "FK_514bcc3fb1b8140f85bf1cde6e2" FOREIGN KEY ("doctorId") REFERENCES "staff"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "FK_86395090f1ed2a6b749103a3138" FOREIGN KEY ("diagnosisId") REFERENCES "diagnosis"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "appointment" ADD CONSTRAINT "appointment_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES "patient"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bed" ADD CONSTRAINT "FK_6281e91aacd3728b560352ea961" FOREIGN KEY ("roomId") REFERENCES "room"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "patient" ADD CONSTRAINT "FK_3e05ff4e55732f2cc3eb5bdfc54" FOREIGN KEY ("assignedBedId") REFERENCES "bed"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "surgery" ADD CONSTRAINT "FK_17d78a62dfeafd302d16dfaaf79" FOREIGN KEY ("surgeonId") REFERENCES "staff"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "surgery" ADD CONSTRAINT "FK_416a2e05f343a6dfa39589c9323" FOREIGN KEY ("roomId") REFERENCES "room"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "surgery" ADD CONSTRAINT "FK_cf1cdd4b148722b7f56719008ec" FOREIGN KEY ("patientId") REFERENCES "patient"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
