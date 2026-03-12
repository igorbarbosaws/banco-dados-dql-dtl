create database senacdb;
use senacdb;

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `codigo` INT AUTO_INCREMENT PRIMARY KEY,
  `primeiro_nome` VARCHAR(50) NOT NULL,
  `segundo_nome` VARCHAR(50),
  `ultimo_nome` VARCHAR(50) NOT NULL,
  `data_nasci` DATE,
  `CPF` VARCHAR(20),
  `RG` VARCHAR(20),
  `endereco` VARCHAR(150),
  `CEP` VARCHAR(10),
  `cidade` VARCHAR(50),
  `fone` VARCHAR(20),
  `codigo_departamento` INT,
  `funcao` VARCHAR(80),
  `salario` DECIMAL(10, 2)
);

show tables;

desc funcionarios;

INSERT INTO Funcionarios (codigo, primeiro_nome, segundo_nome, ultimo_nome, data_nasci, CPF, RG, endereco, CEP, cidade, fone, codigo_departamento, funcao, salario) 
VALUES 
(1, 'Ana', 'Maria', 'Silva', '1990-05-15', '111.111.111-11', 'MG-11.111', 'Rua A, 10', '38300-000', 'Jaboatao dos Guararapes', '34-3261-0001', 1, 'Atendente', 1500.00),
(2, 'João', 'Paulo', 'Souza', '1985-10-20', '222.222.222-22', 'MG-22.222', 'Rua B, 20', '50000-000', 'Recife', '81-3444-0002', 2, 'Analista', 2500.00),
(3, 'Maria', NULL, 'Oliveira', '1992-01-12', '333.333.333-33', 'MG-33.333', 'Rua C, 30', '38300-100', 'Caruaru', '34-3261-0003', 2, 'Atendente', 1200.00),
(4, 'Carlos', 'Eduardo', 'Santos', '1988-03-25', '444.444.444-44', 'SP-44.444', 'Av. Paulista, 100', '01310-000', 'Goiania', '11-3200-0004', 2, 'Gerente', 5500.00),
(5, 'Pedro', NULL, 'Costa', '1995-07-30', '555.555.555-55', 'RJ-55.555', 'Rua D, 40', '20000-000', 'Petrolina', '21-2555-0005', 3, 'Auxiliar', 950.00),
(6, 'Juliana', 'Fernanda', 'Lima', '1993-11-05', '666.666.666-66', 'PE-66.666', 'Rua E, 50', '51000-000', 'Recife', '81-3444-0006', 1, 'Coordenadora', 4200.00),
(7, 'Lucas', 'Gabriel', 'Rocha', '2000-01-20', '777.777.777-77', 'MG-77.777', 'Rua F, 60', '38300-200', 'Carpina', '34-3261-0007', 3, 'Estagiário', 1100.00),
(8, 'Fernanda', NULL, 'Mendes', '1982-06-14', '888.888.888-88', 'SP-88.888', 'Rua G, 70', '01310-500', 'São Lourenço', '11-3200-0008', 4, 'Analista', 2800.00),
(9, 'Ricardo', 'Alves', 'Pereira', '1975-09-10', '999.999.999-99', 'RJ-99.999', 'Rua H, 80', '21000-000', 'Garanhuns', '21-2555-0009', 2, 'Supervisor', 3500.00),
(10, 'Beatriz', 'Lopes', 'Vieira', '1998-12-22', '000.000.000-00', 'MG-00.000', 'Rua I, 90', '38300-300', 'Limoeiro', '34-3261-0010', 4, 'Atendente', 1300.00),
(11, 'André', NULL, 'Machado', '1987-04-05', '121.212.121-21', 'PE-12.121', 'Rua J, 11', '52000-000', 'Recife', '81-3444-0011', 1, 'Vendedor', 2100.00),
(12, 'Amanda', 'Carolina', 'Ferreira', '1996-08-18', '232.323.232-32', 'SP-23.232', 'Rua K, 12', '01310-900', 'Ipojuca', '11-3200-0012', 3, 'Assistente', 1800.00);

/*Questão 01*/
select primeiro_nome, ultimo_nome from funcionarios order by ultimo_nome asc;

/*Questão 02*/
select primeiro_nome, ultimo_nome, cidade from funcionarios order by cidade asc;

/*Questão 03*/
select * concat_ws(" ", primeiro_nome, segundo_nome, ultimo_nome) from funcionarios as nome_completo group by nome_completo;

/*Questão 04*/



