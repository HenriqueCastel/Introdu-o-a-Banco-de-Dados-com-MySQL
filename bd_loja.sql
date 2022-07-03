-- 1
CREATE DATABASE bd_loja;
use bd_loja;
-- 2
CREATE TABLE categoria(
cod_cat BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
descricao_cat VARCHAR(30) NOT NULL,
PRIMARY KEY (cod_cat));

CREATE TABLE marca(
cod_mar BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
nome_mar VARCHAR(30) NOT NULL,
PRIMARY KEY (cod_mar));

CREATE TABLE unidade(
cod_uni BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
descricao_uni VARCHAR(20) NOT NULL,
PRIMARY KEY (cod_uni));

CREATE TABLE produto(
cod_prod BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
descricao_prod VARCHAR(50) NOT NULL,
preco_custo DOUBLE NOT NULL ,
preco_venda DOUBLE NOT NULL ,
qtde_estoque BIGINT NOT NULL ,
qtde_minima BIGINT NOT NULL,
cod_cat BIGINT NOT NULL,
cod_mar BIGINT NOT NULL,
cod_uni BIGINT NOT NULL,	 
PRIMARY KEY (cod_prod),
FOREIGN KEY (cod_cat) REFERENCES categoria(cod_cat),
FOREIGN KEY (cod_mar) REFERENCES marca(cod_mar),
FOREIGN KEY (cod_uni) REFERENCES unidade(cod_uni));
 -- 3
 -- a
INSERT INTO categoria 
VALUES (null, 'Tênis de Mesa'),(null, 'Tênis'),(null, 'Futebol'),(null, 'Natação'),(null, 'Basquete'),
       (null, 'Paddle');
-- b
INSERT INTO marca 
VALUES (null, 'Butterfly'),(null, 'Spalding'),(null, 'Adidas'),(null, 'Nike'),(null, 'Speedy'),(null, 'Wilson');
-- c
INSERT INTO unidade 
VALUES (null, 'Par'), (null, 'Gramas'), (null, 'Caixa'), (null, 'Cartela'), (null, 'Dúzia'), (null, 'Unidade');
-- d
INSERT INTO produto 
VALUES (null, 'Camisa Internacional', 100.00, 179.00, 50, 10, 3, 4, 6),
	   (null, 'Bola de Tênis de Mesa 40mm', 8.59, 15.50, 100, 5, 1, 1, 5),
	   (null, 'Camisa Chelsea', 100.00, 169.90, 2, 4, 3, 3, 6),
	   (null, 'Raquete de Tênis', 250.00, 420.00, 5, 3, 2, 6, 6),
	   (null, 'Chuteira de Futebol', 89.90, 159.00, 20, 5, 3, 4, 1),
	   (null, 'Bola de Basquete', 59.90, 129.90, 15, 10, 5, 2, 6),
	   (null, 'Óculos de Natação', 29.90, 59.90, 3, 5, 4, 5, 6);  
-- 4
ALTER TABLE produto CHANGE descricao_prod desc_prod VARCHAR (70) NOT NULL;
-- 5
ALTER TABLE unidade ADD sigla_uni VARCHAR (5);
-- 6
ALTER TABLE unidade DROP sigla_uni;
-- 7
UPDATE produto SET preco_venda = preco_venda * 1.05;
-- 8
UPDATE produto SET preco_venda = preco_venda * 0.75;
-- 9
DELETE FROM produto;
-- 10
UPDATE produto SET qtde_estoque = qtde_estoque * 1.05 WHERE cod_mar = 4;
-- 11
SELECT distinct(preco_custo) FROM produto;
-- 12
SELECT * FROM produto WHERE cod_cat = 1;
-- 13
SELECT * FROM produto WHERE cod_mar = 4;
-- 14
SELECT * FROM produto WHERE cod_cat = 3 AND cod_mar = 3;
-- 15
SELECT * FROM produto WHERE cod_cat = 3 AND cod_mar = 4 AND preco_venda <= 50.00;
SELECT * FROM produto WHERE cod_cat = 3 AND cod_mar = 4 AND 50.00 > preco_venda <= 100.00;
SELECT * FROM produto WHERE cod_cat = 3 AND cod_mar = 4 AND 100.00 > preco_venda <= 300.00;
SELECT * FROM produto WHERE cod_cat = 3 AND cod_mar = 4 AND preco_venda > 300.00;