DELIMITER //

CREATE PROCEDURE Processar_Resgate_Milhas (
    IN p_id_cliente INT,
    IN p_milhas_necessarias INT,
    IN p_tipo_operacao VARCHAR(50)
)
BEGIN
    DECLARE p_saldo_atual INT;

    SELECT saldo_atual_milhas INTO p_saldo_atual
    FROM Clientes
    WHERE id_cliente = p_id_cliente;

    IF p_saldo_atual >= p_milhas_necessarias THEN
        INSERT INTO Historico_Resgates (id_cliente, quantidade_milhas, tipo_operacao)
        VALUES (p_id_cliente, p_milhas_necessarias, p_tipo_operacao);

        UPDATE Clientes
        SET saldo_atual_milhas = saldo_atual_milhas - p_milhas_necessarias
        WHERE id_cliente = p_id_cliente;

        SELECT 'Resgate realizado com sucesso!' AS Mensagem;
    ELSE
        SELECT 'Resgate não realizado: Saldo insuficiente.' AS Mensagem;
    END IF;
END //

DELIMITER ;