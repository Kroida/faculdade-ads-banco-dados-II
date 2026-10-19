CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    categoria_fidelidade VARCHAR(20) NOT NULL,
    saldo_atual_milhas INT DEFAULT 0
);

CREATE TABLE Voos_Realizados (
    id_voo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    trecho VARCHAR(50) NOT NULL,
    distancia_km INT NOT NULL,
    data_voo DATE NOT NULL,
    status_voo VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Historico_Resgates (
    id_resgate INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    quantidade_milhas INT NOT NULL,
    tipo_operacao VARCHAR(50) NOT NULL,
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);