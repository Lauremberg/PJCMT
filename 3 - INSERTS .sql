--Insert's

INSERT INTO public.estado(
	codigo, nome, sigla)
	VALUES (1, 'MATO GROSSO', 'MT');
INSERT INTO public.estado(
	codigo, nome, sigla)
	VALUES (2, 'MATO GROSSO DO SUL', 'MS');
	
INSERT INTO public.estado(
	codigo, nome, sigla)
	VALUES (3, 'PARANÁ', 'PR');
	
	
INSERT INTO public.cidade(
	codigo, nome, codigo_estado)
	VALUES (1, 'CUIABA', 1);
	
INSERT INTO public.cidade(
	codigo, nome, codigo_estado)
	VALUES (2, 'VARZEA GRANDE', 1);
	
INSERT INTO public.cidade(
	codigo, nome, codigo_estado)
	VALUES (3, 'CAMPO GRANDE', 2);
	
	
INSERT INTO public.estilo(
	codigo, nome)
	VALUES (1, 'PILSEN');
	
INSERT INTO public.estilo(
	codigo, nome)
	VALUES (2, 'LAGER');
	
INSERT INTO public.estilo(
	codigo, nome)
	VALUES (3, 'WEISSBIER');
	
INSERT INTO public.cerveja(
	codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque, foto, content_type)
	VALUES (1, 'AMB1CERVPILLT-269', 'SKOL', 'SKOL LATA 269ML', 2.50, 4.6, 0.75,NULL,'DINAMARCA', 1, 50, NULL,NULL);
	
INSERT INTO public.cerveja(
	codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque, foto, content_type)
	VALUES (2, 'AMB2CERVLGRLONG-330', 'BUDWEISER', 'BUDWEISER LONG NECK 330ML', 6.50, 5.0, 1.95,NULL,'ESTADOS UNIDOS', 2, 100, NULL,NULL);

INSERT INTO public.cerveja(
	codigo, sku, nome, descricao, valor, teor_alcoolico, comissao, sabor, origem, codigo_estilo, quantidade_estoque, foto, content_type)
	VALUES (3, 'AMB3CERVLGRLONG-330', 'QUILMES', 'QUILMES LONG NECK 330ML', 8.50, 4.9, 2.55,NULL,'ARGENTINA', 2, 50, NULL,NULL);

	
	
INSERT INTO public.cliente(
	codigo, nome, tipo_pessoa, cpf_cnpj, telefone, email, logradouro, numero, complemento, cep, codigo_cidade)
	VALUES (1, 'LAUREMBERG', 'FISICA', '99999999999', '65988888888', 'lauremberg@gmail.com', 'GRANDE TERCEIRO', 10, 'RESIDENCIA', '78000000', 1);
	
INSERT INTO public.cliente(
	codigo, nome, tipo_pessoa, cpf_cnpj, telefone, email, logradouro, numero, complemento, cep, codigo_cidade)
	VALUES (2, 'BRUNA', 'FISICA', '99999999999', '65988888888', 'bruna@gmail.com', 'GRANDE TERCEIRO', 10, 'RESIDENCIA', '78000000', 2);
	
	
INSERT INTO public.cliente(
	codigo, nome, tipo_pessoa, cpf_cnpj, telefone, email, logradouro, numero, complemento, cep, codigo_cidade)
	VALUES (3, 'LUCAS', 'FISICA', '99999999999', '65988888888', 'lucas@gmail.com', 'GRANDE TERCEIRO', 13, 'RESIDENCIA', '78000000', 3);
	
INSERT INTO public.usuario(
	codigo, nome, email, senha, ativo, data_nascimento)
	VALUES (1, 'JOSE', 'jose@gmail.com', 'Jose@123','1', '02/11/2000');
	
INSERT INTO public.usuario(
	codigo, nome, email, senha, ativo, data_nascimento)
	VALUES (2, 'MARIA', 'maria@gmail.com', 'Maria@123','1', '02/11/1999');
	
INSERT INTO public.usuario(
	codigo, nome, email, senha, ativo, data_nascimento)
	VALUES (3, 'JOAO', 'joao@gmail.com', 'Joao@123','1', '02/11/1998');
	
INSERT INTO public.grupo(
	codigo, nome)
	VALUES (1, 'GERENCIA');
	
INSERT INTO public.grupo(
	codigo, nome)
	VALUES (2, 'SUPERVISAO');

INSERT INTO public.grupo(
	codigo, nome)
	VALUES (3, 'VENDAS');
	
INSERT INTO public.usuario_grupo(
	codigo_usuario, codigo_grupo)
	VALUES (1, 3);
INSERT INTO public.usuario_grupo(
	codigo_usuario, codigo_grupo)
	VALUES (2, 1);
INSERT INTO public.usuario_grupo(
	codigo_usuario, codigo_grupo)
	VALUES (3, 2);
	
INSERT INTO public.permissao(
	codigo, nome)
	VALUES (1, 'GESTOR');
INSERT INTO public.permissao(
	codigo, nome)
	VALUES (2, 'ADMINISTRADOR');
INSERT INTO public.permissao(
	codigo, nome)
	VALUES (3, 'CONSULTA');
	
INSERT INTO public.grupo_permissao(
	codigo_grupo, codigo_permissao)
	VALUES (3, 3);
INSERT INTO public.grupo_permissao(
	codigo_grupo, codigo_permissao)
	VALUES (1, 1);
INSERT INTO public.grupo_permissao(
	codigo_grupo, codigo_permissao)
	VALUES (2, 1);
	
INSERT INTO public.venda(
	codigo, data_criacao, valor_frete, valor_desconto, valor_total, status, observacao, data_hora_entrega, codigo_cliente, codigo_usuario)
	VALUES (1, current_date, 0.00, 0.00, 5.00, 'PAGO', 'DINHEIRO', current_date, 2, 1);
INSERT INTO public.venda(
	codigo, data_criacao, valor_frete, valor_desconto, valor_total, status, observacao, data_hora_entrega, codigo_cliente, codigo_usuario)
	VALUES (2, current_date, 0.00, 0.00, 26.00, 'PAGO', 'DINHEIRO', current_date, 3, 1);
INSERT INTO public.venda(
	codigo, data_criacao, valor_frete, valor_desconto, valor_total, status, observacao, data_hora_entrega, codigo_cliente, codigo_usuario)
	VALUES (3, current_date, 0.00, 0.00, 42.50, 'PAGO', 'CREDITO', current_date, 1, 1);	
	
INSERT INTO public.item_venda(
	codigo, quantidade, valor_unitario, codigo_cerveja, codigo_venda)
	VALUES (1, 2, 2.50, 1, 1);
INSERT INTO public.item_venda(
	codigo, quantidade, valor_unitario, codigo_cerveja, codigo_venda)
	VALUES (2, 4, 6.50, 2, 2);
INSERT INTO public.item_venda(
	codigo, quantidade, valor_unitario, codigo_cerveja, codigo_venda)
	VALUES (3, 5, 8.50, 3, 3);