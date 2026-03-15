-- 1. Vilken utbildningsledare har en viss klass?
SELECT
    k."klass_id",
    ul."förnamn" AS utbildningsledare_fornamn,
    ul."efternamn" AS utbildningsledare_efternamn,
    ul."ledare_email"
FROM "Klass" k
JOIN "Utbildningsledare" ul
    ON k."utbildningsledare_id" = ul."utbildningsledare_id"
WHERE k."klass_id" = 101;

-- 2. Vilket program tillhör en viss klass?
SELECT
    k."klass_id",
    p."namn" AS programnamn,
    p."beskrivning"
FROM "Klass" k
JOIN "Program" p
    ON k."program_id" = p."program_id"
WHERE k."klass_id" = 101;

-- 3. Vilka kurser har en viss klass?
-- Klassen får sina kurser via sitt program
SELECT
    k."klass_id",
    p."namn" AS programnamn,
    ku."kursnamn",
    ku."kurskod",
    ku."poäng",
    ku."beskrivning"
FROM "Klass" k
JOIN "Program" p
    ON k."program_id" = p."program_id"
JOIN "Kurs" ku
    ON p."program_id" = ku."program_id"
WHERE k."klass_id" = 101
ORDER BY ku."kurs_id";

-- 4. Hur många kurser har en viss klass?
SELECT
    k."klass_id",
    COUNT(ku."kurs_id") AS antal_kurser
FROM "Klass" k
JOIN "Program" p
    ON k."program_id" = p."program_id"
JOIN "Kurs" ku
    ON p."program_id" = ku."program_id"
WHERE k."klass_id" = 101
GROUP BY k."klass_id";

-- 5. Vilka utbildare undervisar vilka kurser
-- i en viss klass?
SELECT
    k."klass_id",
    ku."kursnamn",
    ku."kurskod",
    u."förnamn" AS utbildare_fornamn,
    u."efternamn" AS utbildare_efternamn
FROM "Klass" k
JOIN "Program" p
    ON k."program_id" = p."program_id"
JOIN "Kurs" ku
    ON p."program_id" = ku."program_id"
JOIN "Utbildare" u
    ON ku."utbildare_id" = u."utbildare_id"
WHERE k."klass_id" = 101
ORDER BY ku."kurs_id";

-- 6. Vilka studenter går i en viss klass?
SELECT
    k."klass_id",
    s."student_id",
    s."förnamn",
    s."efternamn",
    s."student_email"
FROM "Student" s
JOIN "Klass" k
    ON s."klass_id" = k."klass_id"
WHERE k."klass_id" = 101
ORDER BY s."student_id";

-- 7. Visa studenternas känsliga uppgifter separat
-- (för att visa att de ligger i egen tabell)
SELECT
    s."student_id",
    s."förnamn",
    s."efternamn",
    su."personnummer",
    su."student_privat_email"
FROM "Student" s
JOIN "Student_uppgifter" su
    ON s."student_id" = su."student_id"
ORDER BY s."student_id";

-- 8. Vilka utbildare är konsulter och vilket företag
-- kommer de från?
SELECT
    u."förnamn",
    u."efternamn",
    kf."företagsnamn",
    kf."organisationsnummer",
    ka."timarvode"
FROM "Konsult" k
JOIN "Utbildare" u
    ON k."utbildare_id" = u."utbildare_id"
JOIN "Konsultföretag" kf
    ON k."konsultföretag_id" = kf."konsultföretag_id"
JOIN "Konsult_avgift" ka
    ON k."konsult_id" = ka."konsult_id"
ORDER BY u."utbildare_id";