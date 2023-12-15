-- Inserir dados nos planos
INSERT INTO Planos (nome) VALUES ('Individual');
INSERT INTO Planos (nome) VALUES ('Em Grupo');
INSERT INTO Planos (nome) VALUES ('VIP');

-- Inserir dados nos instrutores
INSERT INTO Instrutor (nome) VALUES ('Professor Pedro');
INSERT INTO Instrutor (nome) VALUES ('Professor João');
INSERT INTO Instrutor (nome) VALUES ('Professor Adelio');

-- Inserir dados nos cursos
INSERT INTO Curso (nome) VALUES ('Inglês Básico');
INSERT INTO Curso (nome) VALUES ('Inglês Intermediário');
INSERT INTO Curso (nome) VALUES ('Inglês Avançado');

-- Inserir matérias nos cursos
INSERT INTO Grade (id_curso, id_instrutor) VALUES (1, 1);
INSERT INTO Grade (id_curso, id_instrutor) VALUES (1, 2);
INSERT INTO Grade (id_curso, id_instrutor) VALUES (2, 2);
INSERT INTO Grade (id_curso, id_instrutor) VALUES (2, 3);
INSERT INTO Grade (id_curso, id_instrutor) VALUES (3, 3);
INSERT INTO Grade (id_curso, id_instrutor) VALUES (3, 1);

-- Inserir dados nos alunos
INSERT INTO Aluno (nome, rg, estado, telefone, email, cidade, id_planos)
VALUES 
  ('João Silva', '123456789', 'SP', '111111111', 'joao@email.com', 'São Paulo', 1),
  ('Maria Oliveira', '987654321', 'RJ', '222222222', 'maria@email.com', 'Rio de Janeiro', 2),
  ('Carlos Pereira', '111111111', 'MG', '333333333', 'carlos@email.com', 'Belo Horizonte', 3),
  ('Ana Souza', '222222222', 'RS', '444444444', 'ana@email.com', 'Porto Alegre', 1),
  ('Roberto Santos', '333333333', 'BA', '555555555', 'roberto@email.com', 'Salvador', 2);

-- Inserir dados nas tabelas de relacionamento
INSERT INTO Identificacao (id_curso, id_planos) VALUES (1, 1);
INSERT INTO Identificacao (id_curso, id_planos) VALUES (2, 2);
INSERT INTO Identificacao (id_curso, id_planos) VALUES (3, 3);

INSERT INTO Instrucao (id_aluno, id_instrutor) VALUES (1, 1);
INSERT INTO Instrucao (id_aluno, id_instrutor) VALUES (2, 2);
INSERT INTO Instrucao (id_aluno, id_instrutor) VALUES (3, 3);
INSERT INTO Instrucao (id_aluno, id_instrutor) VALUES (4, 1);
INSERT INTO Instrucao (id_aluno, id_instrutor) VALUES (5, 2);

INSERT INTO Cursando (id_aluno, id_curso) VALUES (1, 1);
INSERT INTO Cursando (id_aluno, id_curso) VALUES (2, 2);
INSERT INTO Cursando (id_aluno, id_curso) VALUES (3, 3);
INSERT INTO Cursando (id_aluno, id_curso) VALUES (4, 1);
INSERT INTO Cursando (id_aluno, id_curso) VALUES (5, 2);

-- Inserir nomes de matérias
-- Adicionar a coluna "materia" na tabela "Grade"
ALTER TABLE Grade ADD COLUMN materia VARCHAR(50);

UPDATE Grade SET materia = 'Vocabulário Básico' WHERE id_curso = 1 AND id_instrutor = 1;
UPDATE Grade SET materia = 'Conversação Básica' WHERE id_curso = 1 AND id_instrutor = 2;
UPDATE Grade SET materia = 'Gramática Intermediária' WHERE id_curso = 2 AND id_instrutor = 2;
UPDATE Grade SET materia = 'Leitura Intermediária' WHERE id_curso = 2 AND id_instrutor = 3;
UPDATE Grade SET materia = 'Gramática Avançada' WHERE id_curso = 3 AND id_instrutor = 3;
UPDATE Grade SET materia = 'Leitura Avançada' WHERE id_curso = 3 AND id_instrutor = 1;

