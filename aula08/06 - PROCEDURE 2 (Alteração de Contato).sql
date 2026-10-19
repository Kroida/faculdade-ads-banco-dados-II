-- ========================================================
-- PROCEDURE 2: Alteração de Contato
-- ========================================================
DELIMITER //

CREATE PROCEDURE PR_Alterar_Contato (
    IN p_id_solicitacao INT,
    IN p_novo_email VARCHAR(100),
    IN p_novo_fone VARCHAR(20)
)
BEGIN
    DECLARE v_id_cliente INT;

    SELECT id_cliente INTO v_id_cliente
    FROM Solicitacoes_DBA
    WHERE id_solicitacao = p_id_solicitacao;

    UPDATE Clientes
    SET email = p_novo_email,
        fone = p_novo_fone
    WHERE id_cliente = v_id_cliente;

    UPDATE Solicitacoes_DBA
    SET status_execucao = 'Concluído'
    WHERE id_solicitacao = p_id_solicitacao;
END //

DELIMITER ;