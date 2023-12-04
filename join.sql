-- Criando as tabelas
CREATE TABLE IF NOT EXISTS Classes (
    class_id INTEGER PRIMARY KEY,
    class_name TEXT NOT NULL,
    role TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Races (
    race_id INTEGER PRIMARY KEY,
    race_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS ClassRaces (
    class_id INTEGER,
    race_id INTEGER,
    PRIMARY KEY (class_id, race_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (race_id) REFERENCES Races(race_id)
);

-- Inserir dados e
-- Inserir Classes
INSERT INTO Classes (class_id, class_name, role) VALUES
(1, 'Iop', 'Melee Damage'),
(2, 'Eniripsa', 'Healer'),
(3, 'Ecaflip', 'Chance');

-- Inserir Raças
INSERT INTO Races (race_id, race_name) VALUES
(1, 'Osamodas'),
(2, 'Sacrier'),
(3, 'Enutrof');

-- Relacionar Classes com Raças
INSERT INTO ClassRaces (class_id, race_id) VALUES
(1, 1), -- Iop pertence à raça Osamodas
(2, 2), -- Eniripsa pertence à raça Sacrier
(3, 3); -- Ecaflip pertence à raça Enutrof

-- Consultas usando LEFT JOIN
-- LEFT JOIN: Selecionar todas as classes e suas raças correspondentes
SELECT Classes.class_name, Races.race_name
FROM Classes
LEFT JOIN ClassRaces ON Classes.class_id = ClassRaces.class_id
LEFT JOIN Races ON ClassRaces.race_id = Races.race_id;
