CREATE TABLE "Utbildare" (
  "utbildare_id" INTEGER PRIMARY KEY NOT NULL,
  "förnamn" VARCHAR(50) NOT NULL,
  "efternamn" VARCHAR(50) NOT NULL
);

CREATE TABLE "Utbildare_klass" (
  "klass_id" INTEGER NOT NULL,
  "utbildare_id" INTEGER NOT NULL,
  PRIMARY KEY ("klass_id", "utbildare_id")
);

CREATE TABLE "Konsult" (
  "utbildare_id" INTEGER NOT NULL,
  "konsult_id" INTEGER PRIMARY KEY,
  "konsultföretag_id" INTEGER NOT NULL
);

CREATE TABLE "Konsultföretag" (
  "konsultföretag_id" INTEGER PRIMARY KEY NOT NULL,
  "företagsnamn" VARCHAR(100) NOT NULL,
  "organisationsnummer" VARCHAR(10) NOT NULL,
  "f_skatt" BOOLEAN,
  "adress" VARCHAR(200) NOT NULL
);

CREATE TABLE "Konsult_avgift" (
  "konsult_id" INTEGER PRIMARY KEY,
  "timarvode" DECIMAL NOT NULL
);

CREATE TABLE "Klass" (
  "klass_id" INTEGER PRIMARY KEY NOT NULL,
  "program_id" INTEGER NOT NULL,
  "utbildningsledare_id" INTEGER,
  "startdatum" DATE,
  "slutdatum" DATE
);

CREATE TABLE "Utbildningsledare" (
  "utbildningsledare_id" INTEGER PRIMARY KEY NOT NULL,
  "förnamn" VARCHAR(50) NOT NULL,
  "efternamn" VARCHAR(50) NOT NULL,
  "ledare_email" VARCHAR(100) NOT NULL
);

CREATE TABLE "Kurs" (
  "kurs_id" INTEGER PRIMARY KEY,
  "utbildare_id" INTEGER NOT NULL,
  "kursnamn" VARCHAR(50) NOT NULL,
  "kurskod" VARCHAR(50) NOT NULL,
  "beskrivning" VARCHAR(500) NOT NULL,
  "poäng" INTEGER,
  "program_id" INTEGER
);

CREATE TABLE "Program" (
  "program_id" INTEGER PRIMARY KEY NOT NULL,
  "namn" VARCHAR(50) NOT NULL,
  "beskrivning" VARCHAR(500) NOT NULL
);

CREATE TABLE "Student" (
  "student_id" INTEGER PRIMARY KEY,
  "klass_id" INTEGER NOT NULL,
  "förnamn" VARCHAR(50) NOT NULL,
  "efternamn" VARCHAR(50) NOT NULL,
  "student_email" VARCHAR(100) NOT NULL
);

CREATE TABLE "Student_uppgifter" (
  "personnummer" VARCHAR(50) PRIMARY KEY NOT NULL,
  "student_id" INTEGER NOT NULL UNIQUE,
  "student_privat_email" VARCHAR(100) NOT NULL
);

ALTER TABLE "Utbildare_klass" ADD FOREIGN KEY ("utbildare_id") REFERENCES "Utbildare" ("utbildare_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Konsult" ADD FOREIGN KEY ("utbildare_id") REFERENCES "Utbildare" ("utbildare_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Konsult" ADD FOREIGN KEY ("konsultföretag_id") REFERENCES "Konsultföretag" ("konsultföretag_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Klass" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Klass" ADD FOREIGN KEY ("utbildningsledare_id") REFERENCES "Utbildningsledare" ("utbildningsledare_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Kurs" ADD FOREIGN KEY ("utbildare_id") REFERENCES "Utbildare" ("utbildare_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Kurs" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("program_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Student_uppgifter" ADD FOREIGN KEY ("student_id") REFERENCES "Student" ("student_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Student" ADD FOREIGN KEY ("klass_id") REFERENCES "Klass" ("klass_id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "Konsult_avgift" ADD FOREIGN KEY ("konsult_id") REFERENCES "Konsult" ("konsult_id");

ALTER TABLE "Utbildare_klass" ADD FOREIGN KEY ("klass_id") REFERENCES "Klass" ("klass_id");