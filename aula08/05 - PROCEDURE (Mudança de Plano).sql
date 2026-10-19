-- ========================================================
-- PROCEDURE 1: Mudança de Plano
-- ========================================================
DELIMITER //

CREATE PROCEDURE PR_Mudar_Plano (
    IN p_id_solicitacao INT,
    IN p_novo_plano VARCHAR(20)
)
BEGIN
    DECLARE v_id_cliente INT;
    DECLARE v_novo_valor DECIMAL(10, 2);

    SELECT id_cliente INTO v_id_cliente
    FROM Solicitacoes_DBA
    WHERE id_solicitacao = p_id_solicitacao;

    SET v_novo_valor = CASE p_novo_plano
        WHEN '200MB' THEN 99.90
        WHEN '300MB' THEN 119.90
        WHEN '500MB' THEN 149.90
        WHEN '1GB'   THEN 199.90
        ELSE 0.00
    END;

    UPDATE Clientes
    SET plano = p_novo_plano,
        valor = v_novo_valor
    WHERE id_cliente = v_id_cliente;

    UPDATE Solicitacoes_DBA
    SET status_execucao = 'Concluído'
    WHERE id_solicitacao = p_id_solicitacao;
END //

DELIMITER ;