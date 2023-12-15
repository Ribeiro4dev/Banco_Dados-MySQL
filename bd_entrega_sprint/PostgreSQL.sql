-- Passo 1: Criar tabelas principais

CREATE TABLE Planos (
    id_planos SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE Instrutor (
    id_instrutor SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

CREATE TABLE Matricula (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INT
);

CREATE TABLE Curso (
    id_curso SERIAL PRIMARY KEY,
    nome VARCHAR(36) NOT NULL
);

CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    rg VARCHAR(15),
    estado VARCHAR(15),
    telefone VARCHAR(15),
    email VARCHAR(20),
    cidade VARCHAR(20),
    id_planos INT,
    FOREIGN KEY(id_planos) REFERENCES Planos(id_planos)
);

-- Passo 2: Criar tabelas de relacionamento

CREATE TABLE Identificacao (
    id_curso INT,
    id_planos INT,
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY(id_planos) REFERENCES Planos(id_planos)
);

CREATE TABLE Grade (
    id_curso INT,
    id_instrutor INT,
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY(id_instrutor) REFERENCES Instrutor(id_instrutor)
);

CREATE TABLE Instrucao (
    id_aluno INT,
    id_instrutor INT,
    FOREIGN KEY(id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY(id_instrutor) REFERENCES Instrutor(id_instrutor)
);

CREATE TABLE Cursando (
    id_aluno INT,
    id_curso INT,
    FOREIGN KEY(id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso)
);

-- Passo 3: Adicionar restrições de chave estrangeira

ALTER TABLE Matricula ADD FOREIGN KEY(id_aluno) REFERENCES Aluno(id_aluno);
