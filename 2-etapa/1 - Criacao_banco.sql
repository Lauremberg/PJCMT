--Criação do Banco de Dados "Conveniencia"
CREATE DATABASE conveniencia
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

GRANT ALL ON DATABASE conveniencia TO postgres;

GRANT TEMPORARY, CONNECT ON DATABASE conveniencia TO PUBLIC;