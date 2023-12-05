-- Criação do banco de dados (caso não exista)
CREATE DATABASE IF NOT EXISTS empresa_parafusos;
USE empresa_parafusos;

-- Criação da tabela de vendas
CREATE TABLE IF NOT EXISTS Vendas (
    IDVenda INT PRIMARY KEY AUTO_INCREMENT,
    DataVenda DATE,
    Quantidade INT
);

-- Inserção de alguns dados de exemplo
INSERT INTO Vendas (DataVenda, Quantidade) VALUES
('2023-12-01', 100),
('2023-12-01', 150),
('2023-12-02', 80),
('2023-12-02', 120),
('2023-12-02', 50);

-- Criação da procedure
DELIMITER //
CREATE PROCEDURE LevantamentoDiario()
BEGIN
    SELECT 
        DataVenda,
        SUM(Quantidade) AS QuantidadeTotal
    FROM Vendas
    GROUP BY DataVenda;
END //
DELIMITER ;

-- chamando a procedure
CALL LevantamentoDiario();
