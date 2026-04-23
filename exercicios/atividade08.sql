CREATE DATABASE rh_triggers;
USE rh_triggers;

-- Funcionários
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(10) UNIQUE,
    nome VARCHAR(100),
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    status ENUM('ativo', 'ferias', 'afastado', 'demitido') DEFAULT 'ativo',
    gerente_id INT NULL,
    data_ultimo_reajuste DATE
);

-- Histórico salarial (auditoria de mudanças)

CREATE TABLE historico_salarial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    salario_antigo DECIMAL(10,2),
    salario_novo DECIMAL(10,2),
    percentual_reajuste DECIMAL(5,2),
    data_reajuste TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    motivo VARCHAR(200),
    aprovado_por VARCHAR(100)
);

-- Log de alterações geral
CREATE TABLE log_rh (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela VARCHAR(50),
    operacao VARCHAR(10),
    registro_id INT,
    campo_alterado VARCHAR(50),
    valor_antigo VARCHAR(255),
    valor_novo VARCHAR(255),
    usuario VARCHAR(100),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Folha de pagamento (gerada mensalmente)

CREATE TABLE folha_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT,
    mes_ano DATE,  -- primeiro dia do mês
    salario_base DECIMAL(10,2),
    bonus DECIMAL(10,2) DEFAULT 0,
    descontos DECIMAL(10,2) DEFAULT 0,
    salario_liquido DECIMAL(10,2),
    status ENUM('calculada', 'paga', 'cancelada') DEFAULT 'calculada'
);

-- Inserir dados de teste
INSERT INTO funcionarios (matricula, nome, cargo, departamento, salario, data_admissao, gerente_id) VALUES
('F001', 'Ana Silva', 'Analista', 'TI', 5000.00, '2025-01-15', NULL),
('F002', 'Bruno Costa', 'Desenvolvedor', 'TI', 7000.00, '2025-03-20', 1),
('F003', 'Carla Dias', 'Gerente', 'Vendas', 9000.00, '2024-06-10', NULL),
('F004', 'Daniel Souza', 'Vendedor', 'Vendas', 3500.00, '2025-08-05', 3);

DELIMITER //

CREATE TRIGGER tr_auditoria_salario
AFTER UPDATE ON funcionarios
FOR EACH ROW

BEGIN
    INSERT INTO historico_salarial (
        funcionario_id, 
        salario_antigo, 
        salario_novo, 
        percentual_reajuste
    )
    VALUES (
        OLD.id,
        OLD.salario,
        NEW.salario,
        ((NEW.salario - OLD.salario) / OLD.salario) * 100
    );
END //

DELIMITER ;

UPDATE funcionarios 
SET salario = 8000.00 
WHERE matricula = 'F002';

SELECT nome, salario FROM funcionarios WHERE nome = 'Bruno Costa';

SELECT * FROM historico_salarial;

UPDATE funcionarios 
SET salario = 9000.00 
WHERE matricula = 'F002';

SELECT nome, salario FROM funcionarios WHERE nome = 'Bruno Costa';

SELECT * FROM historico_salarial;

UPDATE funcionarios 
SET salario = 10000.00 
WHERE matricula = 'F002';

SELECT nome, salario FROM funcionarios WHERE nome = 'Bruno Costa';

SELECT * FROM historico_salarial;