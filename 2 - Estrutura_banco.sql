--SCRIPT OBJETOS DB CONVENIENCIA

--Tabela cerveja
CREATE TABLE cerveja
(
    codigo bigint NOT NULL,
    sku VARCHAR(50),
    nome VARCHAR(80),
	descricao text,
	valor decimal(10,2),
	teor_alcoolico decimal(10,2),
	comissao decimal(10,2),
	sabor varchar(50),
	origem varchar(50),
	codigo_estilo bigint,
	quantidade_estoque int,
	foto varchar(100),
	content_type varchar(100),
    CONSTRAINT cerveja_pkey PRIMARY KEY (codigo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE cerveja
    OWNER to postgres;	
	

--Tabela Item_venda
CREATE TABLE item_venda
(
    codigo bigint NOT NULL,    
	quantidade int,
	valor_unitario decimal(10,2),
	codigo_cerveja bigint,
	codigo_venda bigint,	
    CONSTRAINT item_venda_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE item_venda
    OWNER to postgres;	
	
--Tabela Estilo
CREATE TABLE estilo
(
    codigo bigint NOT NULL,    
	nome varchar(50),	
    CONSTRAINT estilo_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE estilo
    OWNER to postgres;	
	
--Tabela Venda
	
CREATE TABLE venda
(
    codigo bigint NOT NULL,    
	data_criacao timestamp,
	valor_frete decimal(10,2),
	valor_desconto decimal(10,2),
	valor_total decimal(10,2),
	status varchar(30),
	observacao varchar(200),
	data_hora_entrega timestamp,
	codigo_cliente bigint,
	codigo_usuario bigint,
    CONSTRAINT venda_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE venda
    OWNER to postgres;	
	
--Tabela de Auditoria de Vendas
CREATE TABLE venda_auditoria
(
    codigo bigint NOT NULL,    
	data_operacao timestamp,
	tipo_operacao varchar(15),
	codigo_usuario bigint,
	codigo_venda bigint,
	valor_anterior decimal(10,2),
	valor_atual decimal(10,2),
	CONSTRAINT venda_auditoria_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE venda_auditoria
    OWNER to postgres;	
	
	
--Tabela Cliente
CREATE TABLE cliente
(
    codigo bigint NOT NULL,    
	nome varchar(80),
	tipo_pessoa varchar(15),
	cpf_cnpj varchar(30),
	telefone varchar(15),
	email varchar(50),
	logradouro varchar(50),
	numero varchar(15),
	complemento varchar(20),
	cep varchar(15),
	codigo_cidade bigint,
    CONSTRAINT cliente_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE cliente
    OWNER to postgres;	
	
--Tabela Usuário
CREATE TABLE usuario
(
    codigo bigint NOT NULL,    
	nome varchar(50),
	email varchar(50),
	senha varchar(120),
	ativo smallint,
	data_nascimento date,
    CONSTRAINT usuario_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE usuario
    OWNER to postgres;	
	
--Tabela Cidade
CREATE TABLE cidade
(
    codigo bigint NOT NULL,    
	nome varchar(50),
	codigo_estado bigint,
    CONSTRAINT cidade_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE cidade
    OWNER to postgres;	
	
--Tabela Estado
CREATE TABLE estado
(
    codigo bigint NOT NULL,    
	nome varchar(50),
	sigla varchar(2),
    CONSTRAINT estado_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE estado
    OWNER to postgres;	
	
--Tabela grupo
CREATE TABLE grupo
(
    codigo bigint NOT NULL,    
	nome varchar(50),
	CONSTRAINT grupo_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE grupo
    OWNER to postgres;	
	
--Tabela Usuário Grupo	
CREATE TABLE usuario_grupo
(
    codigo_usuario bigint NOT NULL,    
	codigo_grupo bigint NOT NULL
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE usuario_grupo
    OWNER to postgres;	
	
--Tabela Permissão
CREATE TABLE permissao
(
    codigo bigint NOT NULL,    
	nome varchar(50),
	CONSTRAINT permissao_pkey PRIMARY KEY (codigo)	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE permissao
    OWNER to postgres;	
	
--Tabela Grupo Permissão
CREATE TABLE grupo_permissao
(
    codigo_grupo bigint NOT NULL,    
	codigo_permissao bigint NOT NULL	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE grupo_permissao
    OWNER to postgres;	
	
--Tabela Schema Version
CREATE TABLE schema_version
(
    installed_rank int NOT NULL,    
	version varchar(50),
    description varchar(200),
	type varchar(20),
	script varchar(1000),
	checksum int,
	installed_by varchar(100),
	installed_on timestamp,
	execution_time int,
	success smallint,
	CONSTRAINT schema_version_pkey PRIMARY KEY (installed_rank)
	
)
WITH (
    OIDS = FALSE
) 
TABLESPACE pg_default;

ALTER TABLE schema_version
    OWNER to postgres;	

	
	
	
--Chaves Estrangeiras DB Conveniencia

--Tabela cerveja
ALTER TABLE cerveja
ADD CONSTRAINT fk_estilo_codigo FOREIGN KEY (codigo_estilo) REFERENCES estilo(codigo);

--Tabela item_venda
ALTER TABLE item_venda
ADD CONSTRAINT fk_cerveja_codigo FOREIGN KEY (codigo_cerveja) REFERENCES cerveja(codigo);

ALTER TABLE item_venda
ADD CONSTRAINT fk_venda_codigo FOREIGN KEY (codigo_venda) REFERENCES venda(codigo);

--Tabela Venda
ALTER TABLE venda
ADD CONSTRAINT fk_cliente_codigo FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo);

ALTER TABLE venda
ADD CONSTRAINT fk_usuario_codigo FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo);

--Tabela Cidade
ALTER TABLE cidade
ADD CONSTRAINT fk_estado_codigo FOREIGN KEY (codigo_estado) REFERENCES estado(codigo);

--Tabela Usuário Grupo
ALTER TABLE usuario_grupo
ADD CONSTRAINT fk_usuario__codigo FOREIGN KEY (codigo_usuario) REFERENCES usuario(codigo);

ALTER TABLE usuario_grupo
ADD CONSTRAINT fk_grupo_codigo FOREIGN KEY (codigo_grupo) REFERENCES grupo(codigo);

--Tabela Grupo Permissão
ALTER TABLE grupo_permissao
ADD CONSTRAINT fk_grupo__codigo FOREIGN KEY (codigo_grupo) REFERENCES grupo(codigo);

ALTER TABLE grupo_permissao
ADD CONSTRAINT fk_permissao_codigo FOREIGN KEY (codigo_permissao) REFERENCES permissao(codigo);

--Sequence Tabela venda_auditoria
CREATE SEQUENCE venda_auditoria_codigo_seq
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
    CACHE 1;
	
	
--Indices
CREATE INDEX idx_cidade ON cidade (codigo);
CREATE INDEX idx_cerveja ON cerveja (codigo);
CREATE INDEX idx_cliente ON cliente (codigo);
CREATE INDEX idx_estado ON estado (codigo);
CREATE INDEX idx_estilo ON estilo (codigo);
CREATE INDEX idx_grupo ON grupo (codigo);
CREATE INDEX idx_item_venda ON item_venda (codigo);
CREATE INDEX idx_permissao ON permissao (codigo);
CREATE INDEX idx_usuario ON usuario (codigo);
CREATE INDEX idx_venda ON venda (codigo);
CREATE INDEX idx_venda_auditoria ON venda_auditoria (codigo);

--Trigger VENDAS

CREATE OR REPLACE FUNCTION processa_venda_auditoria() RETURNS TRIGGER AS $venda_auditoria$
	
    BEGIN
        IF (TG_OP = 'DELETE') THEN
			INSERT INTO public.venda_auditoria(
			codigo, data_operacao, tipo_operacao, codigo_usuario, codigo_venda, valor_anterior, valor_atual)
			VALUES (nextval('venda_auditoria_codigo_seq'), now(), 'DELETE', OLD.codigo_usuario, OLD.codigo, OLD.valor_total, NULL);
            RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
			INSERT INTO public.venda_auditoria(
			codigo, data_operacao, tipo_operacao, codigo_usuario, codigo_venda, valor_anterior, valor_atual)
			VALUES (nextval('venda_auditoria_codigo_seq'), now(), 'UPDATE', NEW.codigo_usuario, NEW.codigo, OLD.valor_total, NEW.valor_total);
            RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
			INSERT INTO public.venda_auditoria(
			codigo, data_operacao, tipo_operacao, codigo_usuario, codigo_venda, valor_anterior, valor_atual)
			VALUES (nextval('venda_auditoria_codigo_seq'), now(), 'INSERT', NEW.codigo_usuario, NEW.codigo, NULL,NEW.valor_total);
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
    $venda_auditoria$ language plpgsql;



CREATE TRIGGER venda_auditoria
  AFTER INSERT OR UPDATE OR DELETE ON venda
    FOR EACH ROW EXECUTE PROCEDURE processa_venda_auditoria();
	
	
--View Materializada VWM_CLIENTES_ESTILO_CERV
CREATE MATERIALIZED VIEW VWM_CLIENTES_ESTILO_CERV
AS
SELECT T.nome as cliente, T4.nome as estilo
  FROM CLIENTE T
 INNER JOIN VENDA T1
    ON T1.codigo_cliente = T.codigo
 INNER JOIN item_venda T2
    ON T2.codigo_venda = T1.codigo
 INNER JOIN CERVEJA T3
    ON T3.codigo = T2.codigo_cerveja
 INNER JOIN ESTILO T4
    ON T4.codigo = T3.codigo_estilo
 ORDER BY T.nome
WITH NO DATA;

REFRESH MATERIALIZED VIEW VWM_CLIENTES_ESTILO_CERV;

