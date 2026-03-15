-- Program
INSERT INTO "Program" ("program_id", "namn", "beskrivning") VALUES
(1, 'Alliance Data Engineering', 'Databaser och data pipelines'),
(2, 'Horde AI Developer', 'AI och machine learning');

-- Utbildningsledare
INSERT INTO "Utbildningsledare" ("utbildningsledare_id","förnamn","efternamn","ledare_email") VALUES
(1,'Anduin','Wrynn','anduin@yrkesco.se'),
(2,'Thrall','Doomhammer','thrall@yrkesco.se');

-- Klasser
INSERT INTO "Klass" ("klass_id","program_id","utbildningsledare_id","startdatum","slutdatum") VALUES
(101,1,1,'2024-09-01','2026-06-01'),
(102,2,2,'2024-09-01','2026-06-01');

-- Utbildare
INSERT INTO "Utbildare" ("utbildare_id","förnamn","efternamn") VALUES
(1,'Tyrande','Whisperwind'),
(2,'Malfurion','Stormrage'),
(3,'Jaina','Proudmoore'),
(4,'Sylvanas','Windrunner'),
(5,'Uther','Lightbringer');

-- Utbildare_klass
INSERT INTO "Utbildare_klass" ("klass_id","utbildare_id") VALUES
(101,1),
(101,2),
(101,3),
(102,4),
(102,5);

-- Konsultföretag
INSERT INTO "Konsultföretag"
("konsultföretag_id","företagsnamn","organisationsnummer","f_skatt","adress") VALUES
(1,'Cenarion Consulting','5561111111',TRUE,'Moonglade 12'),
(2,'Kirin Tor Solutions','5562222222',TRUE,'Dalaran 7');

-- Konsult
INSERT INTO "Konsult"
("konsult_id","utbildare_id","konsultföretag_id") VALUES
(1,1,1),
(2,3,2);

-- Konsult_avgift
INSERT INTO "Konsult_avgift"
("konsult_id","timarvode") VALUES
(1,950),
(2,1100);

-- Kurser
-- (kopplade till program)
INSERT INTO "Kurs"
("kurs_id","utbildare_id","program_id","kursnamn","kurskod","beskrivning","poäng") VALUES
(1,1,1,'SQL och databaser','DE101','Grundläggande relationsdatabaser',30),
(2,2,1,'Data pipelines','DE102','ETL och dataflöden',25),
(3,3,1,'Python för data','DE103','Python i data engineering',20),
(4,4,2,'Python för AI','AI101','Python i AI utveckling',25),
(5,5,2,'Machine Learning','AI102','Grundläggande ML',30);

-- Studenter
INSERT INTO "Student"
("student_id","klass_id","förnamn","efternamn","student_email") VALUES
(1,101,'Varian','Wrynn','varian@student.yrkesco.se'),
(2,101,'Genn','Greymane','genn@student.yrkesco.se'),
(3,101,'Alleria','Windrunner','alleria@student.yrkesco.se'),
(4,102,'Baine','Bloodhoof','baine@student.yrkesco.se'),
(5,102,'Voljin','Shadowhunter','voljin@student.yrkesco.se');

-- Student_uppgifter
-- (känsliga uppgifter separat)
INSERT INTO "Student_uppgifter"
("personnummer","student_id","student_privat_email") VALUES
('19900101-1001',1,'varian@gmail.com'),
('19900202-1002',2,'genn@gmail.com'),
('19900303-1003',3,'alleria@gmail.com'),
('19900404-1004',4,'baine@gmail.com'),
('19900505-1005',5,'voljin@gmail.com');