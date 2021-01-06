--SQL Lista de Cervejas Vendidas e Ordenadas pela Qtde. de Vendas
select c.nome as cerveja,
       e.nome as estilo,
       count(iv.codigo_cerveja) as Qtde_vendas
  from cerveja c
 inner join estilo e
    on e.codigo = c.codigo_estilo
  left join item_venda iv
    ON iv.codigo_cerveja = c.codigo
 group by c.nome, e.nome
 order by count(iv.codigo_cerveja);
 
 --SQL Lista Qtde. Vendas por Usuário
 select t.nome_usuario,
       sum(t.qtde_vendida) as qtde_vendida,
       t.mes_venda,
       t.ano_venda
  from (select u.nome as nome_usuario,
               count(v.codigo_usuario) as qtde_vendida,
               extract(month from v.data_criacao) as mes_venda,
               extract(year from v.data_criacao) as ano_venda
          from venda v
         inner join usuario u
            on u.codigo = v.codigo_usuario
         group by u.nome, v.data_criacao) t
 group by t.nome_usuario, t.mes_venda, t.ano_venda
 order by 2, 1;
 
 --SQL Valor Comissão recebida por vendas feitas pelo primeiro usuário cadastrado
 
 select u.nome as nome_usuario, sum(cv.comissao) as total_comissao
  from venda v
 inner join item_venda iv
    on iv.codigo_venda = v.codigo
 inner join cerveja cv
    on cv.codigo = iv.codigo_cerveja
 inner join usuario u
    on u.codigo = v.codigo_usuario
 where u.codigo = 1 -- Primeiro usuário cadastrado, conforme solicitado(desconsiderando demais usuários)
 group by u.nome;
