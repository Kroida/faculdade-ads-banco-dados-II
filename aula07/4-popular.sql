INSERT INTO Clientes (nome, email, categoria_fidelidade, saldo_atual_milhas) VALUES
('Jorge Cardoso', 'jorge@email.com', 'Diamante', 150000),
('Ana Souza', 'ana@email.com', 'Ouro', 45000),
('Carlos Silva', 'carlos@email.com', 'Básico', 12000),
('Beatriz Lima', 'beatriz@email.com', 'Diamante', 320000),
('Fernanda Costa', 'fernanda@email.com', 'Ouro', 85000);

INSERT INTO Voos_Realizados (id_cliente, trecho, distancia_km, data_voo, status_voo) VALUES
(1, 'POA - MCO', 7200, '2026-08-10', 'Concluído'),
(1, 'MCO - POA', 7200, '2026-08-25', 'Agendado'),
(2, 'GRU - LIS', 7900, '2026-09-12', 'Agendado'),
(3, 'CGH - SDU', 400, '2026-07-20', 'Concluído'),
(4, 'VCP - FLL', 6800, '2026-10-05', 'Agendado'),
(5, 'BSB - CNF', 600, '2026-08-01', 'Cancelado');

INSERT INTO Historico_Resgates (id_cliente, quantidade_milhas, tipo_operacao, data_operacao) VALUES
(1, 50000, 'Venda HotMilhas', '2026-09-01 10:30:00'),
(1, 20000, 'Emissão Decolar', '2026-09-05 14:15:00'),
(2, 15000, 'Upgrade de Cabine', '2026-09-10 09:00:00'),
(4, 100000, 'Venda HotMilhas', '2026-08-20 11:45:00'),
(5, 30000, 'Emissão TudoAzul', '2026-07-15 16:20:00');




INSERT INTO Historico_Resgates (id_cliente, quantidade_milhas, tipo_operacao, data_resgate)
VALUES (1, 50000, 'Venda HotMilhas', NOW());


CALL Processar_Resgate_Milhas(1, 50000, 'Venda HotMilhas');