-- ========================================================
-- PROCEDURE 3: Cancelamento de Cliente
-- ========================================================
DELIMITER //

CREATE PROCEDURE PR_Cancelar_Cliente (
    IN p_id_solicitacao INT
)
BEGIN
    DECLARE v_id_cliente INT;

    SELECT id_cliente INTO v_id_cliente
    FROM Solicitacoes_DBA
    WHERE id_solicitacao = p_id_solicitacao;

    UPDATE Clientes
    SET status = 'Inativo'
    WHERE id_cliente = v_id_cliente;

    UPDATE Solicitacoes_DBA
    SET status_execucao = 'Concluído'
    WHERE id_solicitacao = p_id_solicitacao;
END //

DELIMITER ;