CREATE DATABASE loja;
USE loja;

-- =============================================
-- CRIAÇÃO DAS TABELAS
-- =============================================

CREATE TABLE tipo_entrega (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_entrega INT UNIQUE NOT NULL,
    descricao_entrega VARCHAR(50) NOT NULL
);

CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    cod_entrega INT,
    CONSTRAINT fk_compras_tipo_entrega 
        FOREIGN KEY (cod_entrega) 
        REFERENCES tipo_entrega(codigo_entrega)
);

-- =============================================
-- INSERÇÃO DE DADOS
-- =============================================

INSERT INTO tipo_entrega (codigo_entrega, descricao_entrega) 
VALUES
    (159357, 'Terrestre'),
    (258456, 'Aérea'),
    (357159, 'Marítima'),
    (456258, 'Correios'),
    (555333, 'Transportadora'),
    (654987, 'Retirada no Local');

INSERT INTO compras (produto, valor, cod_entrega) 
VALUES
    ('Notebook Dell', 4500.00, 258456),
    ('Monitor LG 27pol', 1200.00, 159357),
    ('Mouse Logitech', 150.00, 456258),
    ('Servidor HP', 18000.00, 555333),
    ('Cadeira Gamer', 1100.00, 159357),
    ('Mesa de Escritório', 1500.00, 159357),
    ('Cabo de Rede 10m', 45.00, 456258),
    ('Case HD externol', 45.00, 258456),
    ('Smartphone Samsung', 3200.00, 258456),
    ('SSD M2 480gb', 540.00, 159357);

INSERT INTO compras (produto, valor) 
VALUES
    ('Webcam HD', 280.00),
    ('Cabo HDMI', 60.00),
    ('Teclado Mecânico', 350.00);

-- =============================================
-- CONSULTAS (JOINS)
-- =============================================

-- Inner Join
SELECT 
    compras.produto, 
    compras.valor, 
    tipo_entrega.descricao_entrega
FROM compras
INNER JOIN tipo_entrega 
    ON compras.cod_entrega = tipo_entrega.codigo_entrega;

-- Left Join
SELECT 
    compras.produto, 
    compras.valor, 
    tipo_entrega.descricao_entrega
FROM compras
LEFT JOIN tipo_entrega 
    ON compras.cod_entrega = tipo_entrega.codigo_entrega;

-- Right Join
SELECT 
    compras.produto, 
    compras.valor, 
    tipo_entrega.descricao_entrega
FROM compras
RIGHT JOIN tipo_entrega 
    ON compras.cod_entrega = tipo_entrega.codigo_entrega;

-- Full Outer Join (Simulado via UNION)
SELECT 
    compras.produto, 
    compras.valor, 
    tipo_entrega.descricao_entrega
FROM compras
LEFT JOIN tipo_entrega 
    ON compras.cod_entrega = tipo_entrega.codigo_entrega

UNION

SELECT 
    compras.produto, 
    compras.valor, 
    tipo_entrega.descricao_entrega
FROM compras
RIGHT JOIN tipo_entrega 
    ON compras.cod_entrega = tipo_entrega.codigo_entrega;