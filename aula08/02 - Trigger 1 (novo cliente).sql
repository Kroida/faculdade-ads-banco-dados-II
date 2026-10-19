DELIMITER //

CREATE TRIGGER TG_Cliente_Novo_Ativo
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    IF NEW.status = 'Ativo' THEN
        INSERT INTO Clientes_Ativos (id_cliente, nome, plano, data_ativacao)
        VALUES (NEW.id_cliente, NEW.nome, NEW.plano, CURRENT_TIMESTAMP);
    END IF;
END //

DELIMITER ;