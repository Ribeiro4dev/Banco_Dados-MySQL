-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS guns_n_roses;

-- Utilizar o banco de dados
USE guns_n_roses;

-- Criar a tabela Membros
CREATE TABLE IF NOT EXISTS Membros (
    membro_id INT PRIMARY KEY,
    nome_membro VARCHAR(50) NOT NULL,
    instrumento VARCHAR(50) NOT NULL
);

-- Inserir alguns dados sobre membros da banda
INSERT INTO Membros (membro_id, nome_membro, instrumento) VALUES
(1, 'Axl Rose', 'Vocal'),
(2, 'Slash', 'Guitarra'),
(3, 'Duff McKagan', 'Baixo'),
(4, 'Izzy Stradlin', 'Guitarra'),
(5, 'Steven Adler', 'Bateria');

-- Criar a tabela Albuns
CREATE TABLE IF NOT EXISTS Albuns (
    album_id INT PRIMARY KEY,
    titulo_album VARCHAR(100) NOT NULL,
    ano_lancamento INT,
    membro_id INT,
    FOREIGN KEY (membro_id) REFERENCES Membros(membro_id)
);

-- Criar o trigger para inserção de álbuns
CREATE TRIGGER tr_insere_album
BEFORE INSERT ON Albuns
FOR EACH ROW
BEGIN
    DECLARE mensagem VARCHAR(255);
    SET mensagem = CONCAT('Álbum "', NEW.titulo_album, '" lançado por ', (SELECT nome_membro FROM Membros WHERE membro_id = NEW.membro_id), ' em ', NEW.ano_lancamento);
    SELECT mensagem AS 'Mensagem do Trigger';
END;

-- Inserir alguns dados sobre álbuns (o trigger será acionado)
INSERT INTO Albuns (album_id, titulo_album, ano_lancamento, membro_id) VALUES
(1, 'Appetite for Destruction', 1987, 1),
(2, 'Use Your Illusion I', 1991, 1),
(3, 'Use Your Illusion II', 1991, 1);
