DELIMITER //

CREATE TRIGGER TG_Manejo_Status_Cliente
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    -- Se mudou de Ativo para Inativo
    IF OLD.status = 'Ativo' AND NEW.status = 'Inativo' THEN
        DELETE FROM Clientes_Ativos 
        WHERE id_cliente = NEW.id_cliente;

        INSERT INTO Clientes_Inativos (id_cliente, nome, email, fone, data_inativacao)
        VALUES (NEW.id_cliente, NEW.nome, NEW.email, NEW.fone, CURRENT_TIMESTAMP);

    -- Se mudou de Inativo para Ativo (Retorno)
    ELSEIF OLD.status = 'Inativo' AND NEW.status = 'Ativo' THEN
        DELETE FROM Clientes_Inativos 
        WHERE id_cliente = NEW.id_cliente;

        INSERT INTO Clientes_Ativos (id_cliente, nome, plano, data_ativacao)
        VALUES (NEW.id_cliente, NEW.nome, NEW.plano, CURRENT_TIMESTAMP);
    END IF;
END //

DELIMITER ;