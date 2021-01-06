--Criando Usuário e Revogando/Liberando Privilégios
create user usr_relatorio with password 'user';
revoke all privileges on database conveniencia from usr_relatorio;
grant connect on database conveniencia to usr_relatorio;
grant select on VWM_CLIENTES_ESTILO_CERV  to usr_relatorio;
grant select on venda_auditoria to usr_relatorio;