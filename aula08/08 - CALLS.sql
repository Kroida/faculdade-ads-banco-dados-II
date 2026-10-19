-- Executar Mudança de Plano (define valor automaticamente)
CALL PR_Mudar_Plano(1, '500MB');

-- Executar Alteração de Dados de Contato
CALL PR_Alterar_Contato(2, 'contato.novo@email.com', '(11) 99999-8888');

-- Executar Cancelamento (muda status para Inativo e dispara o trigger)
CALL PR_Cancelar_Cliente(3);