CREATE DATABASE atividade;
USE atividade;

CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100) NOT NULL,
    produto VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_alterado TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

CREATE TABLE Entregas (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    entregador VARCHAR(100) DEFAULT NULL,
    status_entrega VARCHAR(30) DEFAULT 'Aguardando Coleta',
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_alterado TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    CONSTRAINT FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

CREATE TABLE Historico_Rastreamento (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_entrega INT NOT NULL,
    status_registrado VARCHAR(30) NOT NULL,
    data_criado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_alterado TIMESTAMP DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
    CONSTRAINT FOREIGN KEY (id_entrega) REFERENCES Entregas(id_entrega)
);

INSERT INTO Pedidos (cliente, produto, valor, status) VALUES
('Ana Souza', 'Notebook Gamer', 4500.00, 'Pendente'),
('Carlos Oliveira', 'Smartphone 128GB', 2200.00, 'Pendente'),
('Mariana Costa', 'Monitor 27 IPS', 1300.00, 'Pendente'),
('Roberto Santos', 'Teclado Mecânico RGB', 350.00, 'Pendente'),
('Fernanda Lima', 'Fone de Ouvido Bluetooth', 250.00, 'Pendente'),
('Lucas Pereira', 'Cadeira Ergonômica', 980.00, 'Pendente'),
('Beatriz Rocha', 'Mouse Sem Fio', 120.00, 'Pendente'),
('Gabriel Martins', 'Tablet 10 Polegadas', 1800.00, 'Pendente'),
('Juliana Alves', 'HD Externo 2TB', 420.00, 'Pendente'),
('Paulo Mendes', 'WebCam Full HD', 290.00, 'Pendente');

-- tarfa 1

DELIMITER //

CREATE TRIGGER Criar_Entrega
AFTER UPDATE ON Pedidos
FOR EACH ROW
BEGIN
	IF NEW.status = 'Aprovado' AND OLD.status = 'Pendente' THEN 
		INSERT INTO Entregas (id_pedido)
		VALUES (NEW.id_pedido);
	END IF;
END //

DELIMITER ;

-- tarefa 2

DELIMITER // 

CREATE PROCEDURE Despachar_Entrega(
	IN p_id_entrega INT,
    IN p_entregador VARCHAR(100)
)
BEGIN
	UPDATE Entregas
		SET entregador = p_entregador,
			status_entrega = 'Em Trânsito'
    WHERE id_entrega = p_id_entrega;
END //

DELIMITER ;

-- tarefa 3

DELIMITER //

CREATE TRIGGER Atualizar_Historico_E_Pedido
AFTER UPDATE ON Entregas
FOR EACH ROW
BEGIN
    IF NEW.status_entrega != OLD.status_entrega THEN
        INSERT INTO Historico_Rastreamento(id_entrega, status_registrado)
        VALUES (NEW.id_entrega, NEW.status_entrega);
    END IF;
    
    IF NEW.status_entrega = 'Entregue' THEN
		UPDATE Pedidos
			SET status = 'Entregue'
		WHERE id_pedido = NEW.id_pedido;
	END IF;
END //

DELIMITER ;

-- Testes meus

UPDATE Pedidos
SET status = 'Aprovado'
WHERE id_pedido = 1;

CALL Despachar_Entrega(1, 'João Alberto');

SELECT * FROM Pedidos;
SELECT * FROM Entregas;
SELECT * FROM Historico_Rastreamento;

UPDATE Entregas
SET status_entrega = 'Entregue'
WHERE id_pedido = 1;

SELECT * FROM Pedidos;
SELECT * FROM Entregas;
SELECT * FROM Historico_Rastreamento;

-- DROP DATABASE atividade;