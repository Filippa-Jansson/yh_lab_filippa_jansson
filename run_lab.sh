#!/bin/bash

# Variabler
CONTAINER_NAME="yrkesco"
DB_NAME="yh_lab"
DB_USER="postgres"

echo ""
echo "----- 1. Rensar databasen -----"
docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

echo ""
echo "----- 2. Skapar tabeller (fysisk modell) -----"
cat "sql/yh_lab_fysisk_modell.sql" | docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME

echo ""
echo "----- 3. Laddar fake data -----"
cat "sql/fake_data.sql" | docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME

echo ""
echo "----- 4. Kör test queries -----"
cat "sql/test_queries.sql" | docker exec -i $CONTAINER_NAME psql -U $DB_USER -d $DB_NAME

echo ""
echo "----- Klart! -----"