CREATE DATABASE bd_gatilho;

USE bd_gatilho;

CREATE TABLE usuarios(

id INT PRIMARY KEY AUTO_INCREMENT,

nome VARCHAR (50)
);

-- tabela de histórico (log)

CREATE TABLE log_usuarios (

mensagem VARCHAR(255),

data_criacao DATETIME
);

-- Gatilho para emitir alerta ao inserir um novo usuário


-- Gatilho (Trigger)

DELIMITER //

CREATE TRIGGER tg_log_novo_usuario

AFTER INSERT ON usuarios

FOR EACH ROW

BEGIN
	INSERT INTO log_usuarios (mensagem, data_criacao)
    
    VALUES (CONCAT('Novo usuário cadastrado: ', NEW.nome), NOW());
    
END; //

DELIMITER ;

SHOW TRIGGERS;

INSERT INTO USUARIOS (nome) VALUES ('Igor');

SELECT * FROM LOG_USUARIOS;	

-- Trigger (Update)

-- Tabela de Produtos

CREATE TABLE produtos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    estoque_anual INT DEFAULT 0);
    
-- Tabela de Vendas
CREATE TABLE vendas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	produto_id INT,
    quantidade_vendida INT,
    data_venda DATETIME,
    FOREIGN KEY (produto_id) REFERENCES produtos(id));
    
SHOW TABLES;

INSERT INTO produtos(nome, estoque_anual) VALUES('Teclado Mecânico', 50);

SELECT * FROM produtos;

DELIMITER //
CREATE TRIGGER tg_atualiza_estoque

AFTER INSERT ON vendas

FOR EACH ROW

BEGIN
	UPDATE produtos
    SET estoque_anual = estoque_anual - NEW.quantidade_vendida
    
    WHERE id = NEW.produto_id;
    
END;//

DELIMITER ;

SHOW TRIGGERS;

-- Realizar a Venda

INSERT INTO vendas(produto_id, quantidade_vendida) VALUES(1, 6);

SELECT * FROM produtos;

INSERT INTO vendas(produto_id, quantidade_vendida) VALUES(1, 5);

SELECT * FROM produtos;