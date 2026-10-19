DELIMITER //

CREATE TRIGGER Gatilho_Credito_Pos_Voo
AFTER UPDATE ON Voos_Realizados
FOR EACH ROW
BEGIN
    DECLARE v_multiplicador INT;
    DECLARE v_categoria VARCHAR(20);

    IF NEW.status_voo = 'Concluído' AND OLD.status_voo != 'Concluído' THEN
        SELECT categoria_fidelidade INTO v_categoria
        FROM Clientes
        WHERE id_cliente = NEW.id_cliente;

        SET v_multiplicador = 1;
        IF v_categoria = 'Ouro' THEN
            SET v_multiplicador = 2;
        ELSEIF v_categoria = 'Diamante' THEN
            SET v_multiplicador = 3;
        END IF;

        UPDATE Clientes
        SET saldo_atual_milhas = saldo_atual_milhas + (NEW.distancia_km * v_multiplicador)
        WHERE id_cliente = NEW.id_cliente;
    END IF;
END //

DELIMITER ;