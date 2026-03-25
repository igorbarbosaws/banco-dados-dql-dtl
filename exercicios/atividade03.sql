CREATE DATABASE bd_join;

USE bd_join;

CREATE TABLE marca (
	idmarca INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(10)
);

 
CREATE TABLE carro (
    idcarro INT PRIMARY KEY,
    modelo VARCHAR(50),
    cor VARCHAR(20),
    idmarca INT,
    FOREIGN KEY (idmarca) REFERENCES marca(idmarca)
);
 
INSERT INTO marca (idmarca, nome, sigla) VALUES
(1, 'Volkswagen', 'VW'),
(2, 'Fiat', 'FIAT'),
(3, 'Ford', 'FORD'),
(4, 'Chevrolet', 'GM'),
(5, 'Ferrari', 'FER'),
(6, 'Renault', 'REN');
 
INSERT INTO carro (idcarro, modelo, cor, idmarca) VALUES
(1, 'Gol', 'preto', 1),
(2, 'Palio', 'branco', 2),
(3, 'Fiesta', 'preto', 3),
(4, 'Onix', 'vermelho', 4),
(5, 'Fox', 'preto', 1),
(6, 'Uno', 'azul', 2),
(7, 'Clio', 'cinza', 6),
(8, 'F50', 'vermelho', 5);

SHOW TABLES;

SELECT * FROM marca;

SELECT * FROM carro;

/*Questão A*/
SELECT * FROM carro ORDER BY modelo ASC;

/*Questão B*/
SELECT COUNT(*) FROM carro WHERE cor LIKE 'preto';

/*Questão C*/
SELECT cor, COUNT(*) FROM carro GROUP BY cor;

/*Questão D*/
SELECT * FROM carro WHERE cor LIKE 'preto';

SELECT c.modelo, c.cor, m.sigla
FROM carro c
INNER JOIN marca m on c.idmarca = m.idmarca
WHERE c.cor = "preto";