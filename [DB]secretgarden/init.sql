CREATE SCHEMA IF NOT EXISTS gardener;
CREATE SCHEMA IF NOT EXISTS garden;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gin;

CREATE USER sickdog WITH PASSWORD 'Password$123';
GRANT CONNECT ON DATABASE secretgarden TO sickdog;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA gardener, garden TO sickdog;
