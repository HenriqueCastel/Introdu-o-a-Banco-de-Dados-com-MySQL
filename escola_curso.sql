CREATE DATABASE escola_curso;
USE escola_curso;

CREATE TABLE alunos (
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    data_nascimento DATE NOT NULL,
	endereco VARCHAR (255) NOT NULL,
    cidade VARCHAR (100) NOT NULL,
    estado VARCHAR (2) NOT NULL,
    cpf VARCHAR (11) UNIQUE NOT NULL,
    PRIMARY KEY (id_aluno));
    
CREATE TABLE cursos (
	id_curso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL,
    PRIMARY KEY (id_curso));
    
CREATE TABLE notas (
	id_nota INT NOT NULL AUTO_INCREMENT,
    descricao_atividade VARCHAR (255) NOT NULL,
    valor_nota DECIMAL (5, 2) NOT NULL,
    id_aluno_curso INT NOT NULL,
    PRIMARY KEY (id_nota),
    FOREIGN KEY (id_aluno_curso) REFERENCES alunos_cursos (id_aluno_curso));
   
CREATE TABLE alunos_cursos (
	id_aluno_curso INT NOT NULL AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    PRIMARY KEY (id_aluno_curso),
    FOREIGN KEY (id_aluno) REFERENCES alunos (aluno),
    FOREIGN KEY (id_curso) REFERENCES cursos (curso));
   
INSERT INTO alunos VALUES 
(DEFAULT, 'Henrique', '2002-11-07', 'Júlio de Castilhos, 500', 'Sapucaia do Sul', 'RS', '12345678901'),
(DEFAULT, 'Pedro', '2001-12-26', 'Américo Vespúcio, 550', 'Esteio', 'RS', '09876543212'),
(DEFAULT, 'João', '2003-10-14', 'Copacabana, 345', 'Porto Alegre', 'RS', '23456789098'),
(DEFAULT, 'Lucas', '2002-05-09', 'Getúlio Vargas, 653', 'Canoas', 'RS', '34567890987'),
(DEFAULT, 'Guilherme', '2002-02-17', 'Ursa Maior, 980', 'São Paulo', 'RS', '45678909876');

INSERT INTO cursos VALUES
(DEFAULT, 'Java'),
(DEFAULT, 'MySQL'),
(DEFAULT, 'Python');

INSERT INTO alunos_cursos VALUES
(DEFAULT, 1, 1),
(DEFAULT, 1, 2),
(DEFAULT, 2, 3),
(DEFAULT, 3, 1),
(DEFAULT, 4, 2),
(DEFAULT, 5, 3),
(DEFAULT, 4, 1),
(DEFAULT, 3, 2);

INSERT INTO notas VALUES
(DEFAULT, 'Prova I', 7.00, 1),
(DEFAULT, 'Prova II', 5.50, 2),
(DEFAULT, 'Prova III', 8.00, 3),
(DEFAULT, 'Prova IV', 9.00, 4),
(DEFAULT, 'Prova V', 10.00, 5),
(DEFAULT, 'Prova VI', 7.50, 6),
(DEFAULT, 'Prova VII', 9.50, 7);

UPDATE alunos SET nome = 'Pedro' WHERE id_aluno = 1;

DELETE FROM alunos WHERE id_aluno = 2;

SELECT * FROM alunos;
SELECT * FROM alunos_cursos;
SELECT * FROM cursos;
SELECT * FROM notas;

SELECT nome, data_nascimento, cidade, cpf FROM alunos WHERE cidade= 'Sapucaia do Sul';

SELECT * FROM alunos ORDER BY nome;

SELECT * FROM alunos ORDER BY cidade DESC;

SELECT nome, cidade, cpf FROM alunos ORDER BY 2 DESC;

SELECT * FROM alunos WHERE id_aluno = 1 OR id_aluno = 3;

SELECT * FROM alunos WHERE data_nascimento > '2002-01-01';

SELECT a.nome, c.nome, n.descricao_atividade, n.valor_nota FROM alunos a, cursos c, alunos_cursos ac, notas n
WHERE a.id_aluno = ac.id_aluno AND c.id_curso = ac.id_curso AND ac.id_aluno_curso = n.id_aluno_curso;
