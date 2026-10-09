-- Criar e selecionar o banco de dados
CREATE DATABASE `empresa`;
USE `empresa`;

-- Criar tabela de setores
CREATE TABLE `setores` (
    `id_setor` INT PRIMARY KEY AUTO_INCREMENT,
    `setor` VARCHAR(50) NOT NULL
);

-- Inserir dados nos setores
INSERT INTO `setores` (`setor`) 
VALUES
    ('TI'),
    ('RH'),
    ('Marketing'),
    ('Vendas'),
    ('Financeiro'),
    ('Logística');

SELECT * FROM `setores`;

-- Criar tabela de funcionários
CREATE TABLE `funcionarios` (
    `id_funcionarios` INT PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `setor_id` INT
);

-- Criar relacionamento entre as tabelas
ALTER TABLE `funcionarios`
    ADD FOREIGN KEY (`setor_id`) 
    REFERENCES `setores`(`id_setor`);

-- Inserir funcionários COM setor
INSERT INTO `funcionarios` (`nome`, `setor_id`)
VALUES
    ('Bruno', 2),
    ('Carlos', 3),
    ('Daniela', 4),
    ('Eduardo', 1),
    ('Fernanda', 2),
    ('Gustavo', 1),
    ('Helena', 3),
    ('Igor', 4),
    ('Juliana', 1),
    ('Kleber', 2),
    ('Larissa', 4),
    ('Marcelo', 1),
    ('Natalia', 3),
    ('Otavio', 4),
    ('Patricia', 1);

-- Inserir funcionários SEM setor (NULL)
INSERT INTO `funcionarios` (`nome`) 
VALUES
    ('Rafael'),
    ('Silvia'),
    ('Thiago'),
    ('Ursula');

SELECT * FROM `funcionarios`;

-- 1. INNER JOIN
-- Retorna apenas os funcionários que possuem setor associado
SELECT 
    `funcionarios`.`id_funcionarios`, 
    `funcionarios`.`nome`, 
    `setores`.`setor`
FROM `funcionarios`
INNER JOIN `setores` 
    ON `setores`.`id_setor` = `funcionarios`.`setor_id`;

-- 2. LEFT JOIN
-- Retorna TODOS os funcionários, mesmo os sem setor
SELECT 
    `funcionarios`.`id_funcionarios`, 
    `funcionarios`.`nome`, 
    `setores`.`setor`
FROM `funcionarios`
LEFT JOIN `setores` 
    ON `setores`.`id_setor` = `funcionarios`.`setor_id`;

-- 3. RIGHT JOIN
-- Retorna TODOS os setores, mesmo os que não possuem funcionários alocados
SELECT 
    `funcionarios`.`id_funcionarios`, 
    `funcionarios`.`nome`, 
    `setores`.`setor`
FROM `funcionarios`
RIGHT JOIN `setores` 
    ON `setores`.`id_setor` = `funcionarios`.`setor_id`;

-- 4. FULL JOIN (Sintaxe direta - não funciona no MySQL/MariaDB)
SELECT 
    `funcionarios`.`id_funcionarios`, 
    `funcionarios`.`nome`, 
    `setores`.`setor`
FROM `funcionarios`
FULL JOIN `setores` 
    ON `setores`.`id_setor` = `funcionarios`.`setor_id`;

-- 5. FULL JOIN via UNION (Versão funcional para MySQL/MariaDB)
SELECT 
    `funcionarios`.`id_funcionarios`, 
    `funcionarios`.`nome`, 
    `setores`.`setor`
FROM `funcionarios`
LEFT JOIN `setores` 
    ON `setores`.`id_setor` = `funcionarios`.`setor_id`

UNION

SELECT 
    `funcionarios`.`id_funcionarios`, 
    `funcionarios`.`nome`, 
    `setores`.`setor`
FROM `funcionarios`
RIGHT JOIN `setores` 
    ON `setores`.`id_setor` = `funcionarios`.`setor_id`;