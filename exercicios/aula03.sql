/*Banco de Dados: sistema taxi*/
 
CREATE DATABASE sistema_taxi;

USE sistema_taxi;
 
/*Tabela: cliente*/
 
CREATE TABLE cliente (
    id VARCHAR(4),
    nome VARCHAR(80),
    PRIMARY KEY (id)
);
 
/*Tabela: cliente particular*/
 
CREATE TABLE cliente_particular (
    id VARCHAR(4),
    cpf VARCHAR(14),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES cliente(id)
);
 
/*Tabela: cliente empresa*/
 
CREATE TABLE cliente_empresa (
    id VARCHAR(4),
    cnpj VARCHAR(18),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES cliente(id)
);
 
 
CREATE TABLE taxi (
    placa VARCHAR(7),
    marca VARCHAR(30),
    modelo VARCHAR(30),
    anofab INTEGER,
    PRIMARY KEY (placa)
);
 
 
/*Tabela: corrida*/
 
CREATE TABLE corrida (
    cliid VARCHAR(4),
    placa VARCHAR(7),
    dataPedido DATE,
    PRIMARY KEY (cliid, placa, dataPedido),
    FOREIGN KEY (cliid) REFERENCES cliente(id),
    FOREIGN KEY (placa) REFERENCES taxi(placa)
);
 
/*1. Tabela Cliente*/
 
INSERT INTO Cliente (id, nome) VALUES
(1532, 'Asdrúbal'),
(1755, 'Doriana'),
(1780, 'Quincas'),
(93, 'DinoTech'),
(97, 'Proj');
 
/*2. Tabela cliente_particular*/
 
INSERT INTO cliente_particular (id, cpf) VALUES
(1532, '448.754.253-44'),
(1755, '567.387.387-44'),
(1780, '576.456.123-55');
 
/*3. Tabela cliente_empresa*/
 
 
INSERT INTO cliente_empresa (id, cnpj) VALUES
(93, '58.443.828/0001-02'),
(97, '44.876.234/7789-10');
 
/*4. Tabela taxi*/
 
INSERT INTO taxi (placa, marca, modelo, anofab) VALUES
('DAE6534', 'Ford', 'Fiesta', 1999),
('DKL4598', 'Wolkswagen', 'Gol', 2001),
('DKL7878', 'Ford', 'Fiesta', 2001),
('JDM8776', 'Wolkswagen', 'Santana', 2002),
('JJM3692', 'Chevrolet', 'Corsa', 1999);

/*5. Tabela corrida*/
 
INSERT INTO corrida (cliid, placa, datapedido) VALUES
(1755, 'DAE6534', '2003-02-15'),
(97, 'JDM8776', '2003-02-18');

SHOW TABLES;
/* Inner Join*/
SELECT * FROM cliente INNER JOIN corrida ON cliid = id;

SELECT * FROM cliente, corrida WHERE cliid = id;

/* Natural Join*/
SELECT * FROM taxi NATURAL JOIN corrida;

SELECT * FROM taxi AS t INNER JOIN corrida AS c ON c.placa = t.placa;

/* Left Outer Join*/
SELECT *  FROM cliente LEFT JOIN corrida ON cliid = id;

SELECT *  FROM cliente LEFT JOIN corrida ON cliid = id WHERE cliid IS NULL;

/* Full Outer Join*/
SELECT * FROM cliente_particular FULL OUTER JOIN corrida ON cliid = id;

FROM cliente RIGHT JOIN corrida ON cliid = id WHERE cliid IS NULL;

SELECT *
FROM cliente LEFT JOIN corrida ON cliid = id
UNION ALL 
SELECT *
FROM cliente RIGHT JOIN corrida ON cliid = id;

SELECT *
FROM cliente_particular FULL OUTER JOIN corrida ON cliid = id
WHERE id IS NULL OR cliid IS NULL;

SELECT *
FROM cliente LEFT JOIN corrida ON cliid = id WHERE cliid IS NULL
UNION ALL
SELECT *
FROM cliente RIGHT JOIN corrida ON cliid = id WHERE id IS NULL OR cliid IS NULL;