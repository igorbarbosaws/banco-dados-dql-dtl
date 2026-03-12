show tables;

select * from projetos;

desc projetos;

select * from projetos;


select count(*) from projetos;

select now();
select curdate();



select id_projeto, nome_projeto from projetos where nome_projeto = "Caledon";

select nome_projeto from projetos where nome_projeto like "C%";

select nome_projeto from projetos where nome_projeto like "Mo%";

select nome_projeto from projetos where nome_projeto like "%n";

select nome_projeto, valor_projeto from projetos where valor_projeto > 2500000;

select nome_projeto, valor_projeto from projetos where valor_projeto > 2000000 and valor_projeto <2500000;

select nome_projeto from projetos where nome_projeto like "Regina" or nome_projeto like "Mo%";

select data_inicio_projeto, count(*) from projetos group by data_inicio_projeto;

select nome_projeto, count(*) from projetos group by nome_projeto;

select * from projetos limit 10,2;

select * from projetos limit 5;

select avg(valor_projeto) as "Média de valores cobrados" from projetos;


select * from projetos;

/*Apaga um único registro*/
delete from projetos where id_projeto = 3;

/*Apaga todos os registros*/
truncate projetos;

/*Apaga a tabela*/
drop table projetos;

/*Apaga o banco*/
drop database jogo;

