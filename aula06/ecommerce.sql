CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    codigo INT NOT NULL,
    nome VARCHAR(180) NOT NULL,
    descricao VARCHAR(240),
    valor decimal(10, 2),
    quantidade INT NOT NULL
);

CREATE TABLE  itens_venda (
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    quantidade_vendida INT NOT NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (codigo, nome, descricao, valor, quantidade) VALUES
('29985', 'Mouse Sem Fio', 'Mouse óptico sem fio 1600 DPI', 85.50, 100),
('85322', 'Monitor 24', 'Monitor LED IPS 24 polegadas 75Hz', 899.99, 30),
('86555', 'SSD 1TB', 'SSD NVMe M.2 1TB Leitura 3500MBs', 450.00, 80),
('44449', 'Memória RAM 16GB', 'Módulo de memória DDR4 3200MHz', 220.00, 120),
('91637', 'Placa Mãe B550', 'Placa mãe soquete AM4 ATX', 750.00, 25),
('36118', 'Processador i7', 'Processador octa-core 4.8GHz', 1800.00, 15),
('78126', 'Fonte 600W', 'Fonte ATX 600W 80 Plus Bronze', 320.00, 45),
('48460', 'Gabinete Gamer', 'Gabinete mid-tower com lateral de vidro', 280.00, 20),
('21726', 'Placa de Vídeo RTX 3060', 'Placa de vídeo 12GB GDDR6', 2100.00, 10),
('43975', 'Headset Gamer', 'Fone de ouvido com microfone removível', 199.90, 60),
('57822', 'Webcam Full HD', 'Webcam 1080p com microfone embutido', 150.00, 40),
('84086', 'Microfone Condensador', 'Microfone USB para streaming e podcast', 299.00, 25),
('15117', 'Cadeira Gamer', 'Cadeira ergonômica ajustável preta', 950.00, 12),
('30950', 'Mesa Digitalizadora', 'Mesa para desenho digital com caneta', 340.00, 18),
('90741', 'Roteador Wi-Fi 6', 'Roteador dual-band gigabit', 410.00, 35),
('39785', 'Cabo de Rede 10m', 'Cabo ethernet Cat6 patch cord', 35.00, 200),
('10289', 'Switch 8 Portas', 'Switch gigabit ethernet 8 portas', 120.00, 40),
('96110', 'Nobreak 1200VA', 'Nobreak interativo bivolt', 580.00, 15),
('63156', 'Filtro de Linha', 'Filtro de linha com 6 tomadas', 45.00, 150),
('65237', 'Pen Drive 64GB', 'Pen drive USB 3.2', 55.00, 300),
('37087', 'Cartão MicroSD 128GB', 'Cartão de memória classe 10', 90.00, 250),
('44269', 'HD Externo 2TB', 'Disco rígido portátil USB 3.0', 499.00, 30),
('55395', 'Leitor de Cartões', 'Leitor de cartões SD e MicroSD USB', 25.00, 80),
('71496', 'Hub USB 3.0', 'Hub USB com 4 portas', 65.00, 100),
('48992', 'Adaptador Bluetooth', 'Adaptador USB Bluetooth 5.0', 35.00, 120),
('88552', 'Placa de Rede Wi-Fi', 'Placa de rede PCI Express dual-band', 110.00, 50),
('99935', 'Pasta Térmica', 'Pasta térmica à base de prata 5g', 40.00, 150),
('38897', 'Cooler Fan 120mm', 'Ventoinha para gabinete silenciosa', 30.00, 200),
('43202', 'Water Cooler 240mm', 'Refrigeração líquida para processador', 350.00, 20),
('36189', 'Suporte para Monitor', 'Suporte articulado de mesa para 1 tela', 180.00, 35),
('69464', 'Mousepad Grande', 'Mousepad com borda costurada 90x40cm', 70.00, 90),
('79681', 'Cabo HDMI 2m', 'Cabo de vídeo HDMI 2.0 4K', 25.00, 300),
('20250', 'Cabo DisplayPort', 'Cabo DisplayPort 1.4 144Hz', 45.00, 150),
('37460', 'Adaptador HDMI VGA', 'Conversor de vídeo HDMI para VGA', 35.00, 80),
('18131', 'Kit Teclado e Mouse', 'Conjunto teclado e mouse padrão USB', 60.00, 120),
('53361', 'Impressora Multifuncional', 'Impressora tanque de tinta com Wi-Fi', 1050.00, 15),
('55490', 'Cartucho de Tinta Preto', 'Refil de tinta original preto 65ml', 55.00, 100),
('96771', 'Cartucho de Tinta Colorido', 'Refil de tinta original ciano 65ml', 55.00, 100),
('58268', 'Papel Sulfite A4', 'Caixa com 500 folhas brancas', 28.00, 250),
('88282', 'Scanner de Mesa', 'Scanner de documentos alta resolução', 420.00, 10),
('86322', 'Projetor LED', 'Projetor 3000 lumens Full HD nativo', 1250.00, 8),
('86012', 'Tela de Projeção', 'Tela retrátil 100 polegadas', 350.00, 12),
('13544', 'Apresentador Sem Fio', 'Passador de slides com laser point', 85.00, 45),
('97941', 'Caixa de Som 2.1', 'Sistema estéreo com subwoofer 20W', 140.00, 50),
('96971', 'Placa de Som USB', 'Adaptador de áudio externo 7.1', 45.00, 70),
('91882', 'Gravador de DVD Externo', 'Leitor e gravador óptico USB', 110.00, 30),
('72907', 'Kit Chaves de Precisão', 'Estojo com 31 chaves para manutenção', 35.00, 80),
('75824', 'Pulseira Antiestática', 'Pulseira de aterramento com garra', 15.00, 100),
('51512', 'Limpa Telas', 'Kit líquido limpador de monitores e flanela', 25.00, 150);

DELIMITER //

CREATE TRIGGER AtualizarEstoque
AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN
	UPDATE produtos
    SET
		quantidade = quantidade - NEW.quantidade_vendida
	WHERE id_produto = NEW.id_produto;
END //

DELIMITER ;

insert into itens_venda(id_produto, quantidade_vendida)
	values(14, 2);
    
SELECT * FROM produtos;

SELECT * FROM itens_venda;

-- DROP DATABASE ecommerce;