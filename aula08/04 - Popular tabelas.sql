-- ========================================================
-- 1. POPULANDO A TABELA PRINCIPAL: Clientes (30 Registros)
-- ========================================================
INSERT INTO Clientes (id_cliente, nome, cpf, fone, email, plano, valor, status) VALUES
-- 22 Clientes Ativos
(1, 'Lucas Silva', '111.222.333-01', '(11) 98765-4321', 'lucas.silva@email.com', '200MB', 99.90, 'Ativo'),
(2, 'Beatriz Oliveira', '111.222.333-02', '(11) 98765-4322', 'beatriz.oliveira@email.com', '300MB', 119.90, 'Ativo'),
(3, 'Carlos Eduardo', '111.222.333-03', '(11) 98765-4323', 'carlos.eduardo@email.com', '500MB', 149.90, 'Ativo'),
(4, 'Daniela Souza', '111.222.333-04', '(11) 98765-4324', 'daniela.souza@email.com', '1GB', 199.90, 'Ativo'),
(5, 'Eduardo Santos', '111.222.333-05', '(11) 98765-4325', 'eduardo.santos@email.com', '200MB', 99.90, 'Ativo'),
(6, 'Fernanda Lima', '111.222.333-06', '(11) 98765-4326', 'fernanda.lima@email.com', '300MB', 119.90, 'Ativo'),
(7, 'Gabriel Costa', '111.222.333-07', '(11) 98765-4327', 'gabriel.costa@email.com', '500MB', 149.90, 'Ativo'),
(8, 'Helena Rocha', '111.222.333-08', '(11) 98765-4328', 'helena.rocha@email.com', '1GB', 199.90, 'Ativo'),
(9, 'Igor Martins', '111.222.333-09', '(11) 98765-4329', 'igor.martins@email.com', '200MB', 99.90, 'Ativo'),
(10, 'Juliana Alves', '111.222.333-10', '(11) 98765-4330', 'juliana.alves@email.com', '300MB', 119.90, 'Ativo'),
(11, 'Kleverton Pereira', '111.222.333-11', '(11) 98765-4331', 'kleverton.pereira@email.com', '500MB', 149.90, 'Ativo'),
(12, 'Larissa Ribeiro', '111.222.333-12', '(11) 98765-4332', 'larissa.ribeiro@email.com', '1GB', 199.90, 'Ativo'),
(13, 'Marcelo Carvalho', '111.222.333-13', '(11) 98765-4333', 'marcelo.carvalho@email.com', '200MB', 99.90, 'Ativo'),
(14, 'Nathalia Ferreira', '111.222.333-14', '(11) 98765-4334', 'nathalia.ferreira@email.com', '300MB', 119.90, 'Ativo'),
(15, 'Otavio Gomes', '111.222.333-15', '(11) 98765-4335', 'otavio.gomes@email.com', '500MB', 149.90, 'Ativo'),
(16, 'Patricia Mendes', '111.222.333-16', '(11) 98765-4336', 'patricia.mendes@email.com', '1GB', 199.90, 'Ativo'),
(17, 'Renato Barbosa', '111.222.333-17', '(11) 98765-4337', 'renato.barbosa@email.com', '200MB', 99.90, 'Ativo'),
(18, 'Sabrina Cardoso', '111.222.333-18', '(11) 98765-4338', 'sabrina.cardoso@email.com', '300MB', 119.90, 'Ativo'),
(19, 'Thiago Teixeira', '111.222.333-19', '(11) 98765-4339', 'thiago.teixeira@email.com', '500MB', 149.90, 'Ativo'),
(20, 'Vanessa Moreira', '111.222.333-20', '(11) 98765-4340', 'vanessa.moreira@email.com', '1GB', 199.90, 'Ativo'),
(21, 'William Nunes', '111.222.333-21', '(11) 98765-4341', 'william.nunes@email.com', '200MB', 99.90, 'Ativo'),
(22, 'Yasmin Vieira', '111.222.333-22', '(11) 98765-4342', 'yasmin.vieira@email.com', '300MB', 119.90, 'Ativo'),

-- 8 Clientes Inativos
(23, 'Alexandre Ramos', '111.222.333-23', '(11) 98765-4343', 'alexandre.ramos@email.com', '200MB', 99.90, 'Inativo'),
(24, 'Brena Castro', '111.222.333-24', '(11) 98765-4344', 'brena.castro@email.com', '300MB', 119.90, 'Inativo'),
(25, 'Caio Freitas', '111.222.333-25', '(11) 98765-4345', 'caio.freitas@email.com', '500MB', 149.90, 'Inativo'),
(26, 'Diego Machado', '111.222.333-26', '(11) 98765-4346', 'diego.machado@email.com', '1GB', 199.90, 'Inativo'),
(27, 'Erika Farias', '111.222.333-27', '(11) 98765-4347', 'erika.farias@email.com', '200MB', 99.90, 'Inativo'),
(28, 'Fabio Araujo', '111.222.333-28', '(11) 98765-4348', 'fabio.araujo@email.com', '300MB', 119.90, 'Inativo'),
(29, 'Gabriela Duarte', '111.222.333-29', '(11) 98765-4349', 'gabriela.duarte@email.com', '500MB', 149.90, 'Inativo'),
(30, 'Heitor Marques', '111.222.333-30', '(11) 98765-4350', 'heitor.marques@email.com', '1GB', 199.90, 'Inativo');


-- ========================================================
-- 2. POPULANDO A TABELA AUXILIAR: Clientes_Ativos (22 Registros)
-- ========================================================
INSERT INTO Clientes_Ativos (id_cliente, nome, plano) VALUES
(1, 'Lucas Silva', '200MB'),
(2, 'Beatriz Oliveira', '300MB'),
(3, 'Carlos Eduardo', '500MB'),
(4, 'Daniela Souza', '1GB'),
(5, 'Eduardo Santos', '200MB'),
(6, 'Fernanda Lima', '300MB'),
(7, 'Gabriel Costa', '500MB'),
(8, 'Helena Rocha', '1GB'),
(9, 'Igor Martins', '200MB'),
(10, 'Juliana Alves', '300MB'),
(11, 'Kleverton Pereira', '500MB'),
(12, 'Larissa Ribeiro', '1GB'),
(13, 'Marcelo Carvalho', '200MB'),
(14, 'Nathalia Ferreira', '300MB'),
(15, 'Otavio Gomes', '500MB'),
(16, 'Patricia Mendes', '1GB'),
(17, 'Renato Barbosa', '200MB'),
(18, 'Sabrina Cardoso', '300MB'),
(19, 'Thiago Teixeira', '500MB'),
(20, 'Vanessa Moreira', '1GB'),
(21, 'William Nunes', '200MB'),
(22, 'Yasmin Vieira', '300MB');


-- ========================================================
-- 3. POPULANDO A TABELA AUXILIAR: Clientes_Inativos (8 Registros)
-- ========================================================
INSERT INTO Clientes_Inativos (id_cliente, nome, email, fone) VALUES
(23, 'Alexandre Ramos', 'alexandre.ramos@email.com', '(11) 98765-4343'),
(24, 'Brena Castro', 'brena.castro@email.com', '(11) 98765-4344'),
(25, 'Caio Freitas', 'caio.freitas@email.com', '(11) 98765-4345'),
(26, 'Diego Machado', 'diego.machado@email.com', '(11) 98765-4346'),
(27, 'Erika Farias', 'erika.farias@email.com', '(11) 98765-4347'),
(28, 'Fabio Araujo', 'fabio.araujo@email.com', '(11) 98765-4348'),
(29, 'Gabriela Duarte', 'gabriela.duarte@email.com', '(11) 98765-4349'),
(30, 'Heitor Marques', 'heitor.marques@email.com', '(11) 98765-4350');