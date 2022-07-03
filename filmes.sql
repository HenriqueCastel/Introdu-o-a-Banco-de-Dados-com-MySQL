CREATE DATABASE filmes;
USE filmes;

CREATE TABLE filmes (
	id_filme INT NOT NULL AUTO_INCREMENT,
    filme VARCHAR (255) NOT NULL,
    genero VARCHAR (255) NOT NULL,
    nota_especialistas INT NOT NULL,
    nota_audiencia INT NOT NULL,
    custo INT NOT NULL,
    ano INT NOT NULL,
    PRIMARY KEY (id_filme));

SELECT * FROM filmes;

-- 1. Quais são os 10 filmes mais apreciados pelo público?
SELECT * FROM filmes ORDER BY nota_audiencia DESC LIMIT 10;

-- 2. Quais são os 10 filmes mais apreciados pela crítica especializada?
SELECT * FROM filmes ORDER BY nota_especialistas DESC LIMIT 10;

-- 3. Quais são os 10 filmes mais odiados pelo público?
SELECT * FROM filmes ORDER BY nota_audiencia LIMIT 10;

-- 4. Quais são os 10 filmes mais odiados pela crítica especializada?
SELECT * FROM filmes ORDER BY nota_especialistas LIMIT 10;

-- 5. Qual filme com maior custo e qual filme com menor custo?
SELECT * FROM filmes WHERE custo = (SELECT max(custo) FROM filmes);
SELECT * FROM filmes WHERE custo = (SELECT min(custo) FROM filmes);

-- 6. Qual a média da nota da crítica especializada?
SELECT AVG(nota_especialistas) AS media_especialistas FROM filmes;

-- 7. Qual a média da nota do público?
SELECT AVG(nota_audiencia) AS media_audiencia FROM filmes;

-- 8. Qual a média de custo de filmes?
SELECT AVG(custo) AS media_custo FROM filmes;

-- 9. Quantos filmes custaram mais do que o custo médio dos filmes da tabela?
SELECT count(*) AS total FROM filmes WHERE custo > (SELECT AVG(custo) FROM filmes);

-- 10. Quais são os filmes com nota acima da média das notas dadas pela crítica especializada?
SELECT * FROM filmes WHERE nota_especialistas > (SELECT AVG(nota_especialistas) FROM filmes);

-- 11. Quais são os filmes com nota acima da média das notas dadas pelo público? Quais os melhores?
SELECT * FROM filmes WHERE nota_audiencia > (SELECT AVG(nota_audiencia) FROM filmes);
SELECT * FROM filmes WHERE nota_audiencia > (SELECT AVG(nota_audiencia) FROM filmes) 
ORDER BY nota_audiencia DESC LIMIT 10;

-- 12. Quais são os tipos de categoria (gêneros) existentes?
SELECT genero FROM filmes GROUP BY genero;

-- 13. Quais são os gêneros com maior quantidade de filmes?
SELECT genero, count(genero) AS total FROM filmes GROUP BY genero ORDER BY count(genero) DESC;

-- 14. Qual gênero tem a mais alta média de custo?
SELECT AVG(custo) AS 'Action' FROM filmes WHERE genero = 'Action';
SELECT AVG(custo) AS 'Adventure' FROM filmes WHERE genero = 'Adventure';
SELECT AVG(custo) AS 'Comedy' FROM filmes WHERE genero = 'Comedy';
SELECT AVG(custo) AS 'Drama' FROM filmes WHERE genero = 'Drama';
SELECT AVG(custo) AS 'Horror' FROM filmes WHERE genero = 'Horror';
SELECT AVG(custo) AS 'Romance' FROM filmes WHERE genero = 'Romance';
SELECT AVG(custo) AS 'Thriller' FROM filmes WHERE genero = 'Thriller';

-- 15. Qual gênero tem a mais alta média de nota para o público?
SELECT AVG(nota_audiencia) AS 'Action' FROM filmes WHERE genero = 'Action';
SELECT AVG(nota_audiencia) AS 'Adventure' FROM filmes WHERE genero = 'Adventure';
SELECT AVG(nota_audiencia) AS 'Comedy' FROM filmes WHERE genero = 'Comedy';
SELECT AVG(nota_audiencia) AS 'Drama' FROM filmes WHERE genero = 'Drama';
SELECT AVG(nota_audiencia) AS 'Horror' FROM filmes WHERE genero = 'Horror';
SELECT AVG(nota_audiencia) AS 'Romance' FROM filmes WHERE genero = 'Romance';
SELECT AVG(nota_audiencia) AS 'Thriller' FROM filmes WHERE genero = 'Thriller';

-- 16. Qual gênero tem a mais alta média de nota para a crítica especializada?
SELECT AVG(nota_especialistas) AS 'Action' FROM filmes WHERE genero = 'Action';
SELECT AVG(nota_especialistas) AS 'Adventure' FROM filmes WHERE genero = 'Adventure';
SELECT AVG(nota_especialistas) AS 'Comedy' FROM filmes WHERE genero = 'Comedy';
SELECT AVG(nota_especialistas) AS 'Drama' FROM filmes WHERE genero = 'Drama';
SELECT AVG(nota_especialistas) AS 'Horror' FROM filmes WHERE genero = 'Horror';
SELECT AVG(nota_especialistas) AS 'Romance' FROM filmes WHERE genero = 'Romance';
SELECT AVG(nota_especialistas) AS 'Thriller' FROM filmes WHERE genero = 'Thriller';

-- 17. Quantos filmes foram produzidos por ano?
SELECT ano, count(ano) AS total FROM filmes GROUP BY ano ORDER BY ano;

-- 18. Qual ano foram produzidos mais filmes?
SELECT ano, count(ano) AS total FROM filmes GROUP BY ano ORDER BY total DESC LIMIT 1;

-- 19. Qual gênero produziu mais filmes em um ano?
SELECT genero, ano, count(genero) AS total FROM filmes GROUP BY genero, ano ORDER BY total DESC LIMIT 1;

-- 20. Qual o filme mais amado pela audiência e pelos especialistas ao mesmo tempo?
SELECT filme, (nota_audiencia + nota_especialistas) / 2 AS nota_media FROM filmes ORDER BY nota_media DESC LIMIT 1;

