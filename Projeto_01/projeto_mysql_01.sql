/* 1. Criar um banco de dados para o projeto 1 */
CREATE DATABASE `controle_financeiro` ;


/* 2. Criar a tabela "transacao" com os seguintes campos: */
/*      Id  */
/*      Tipo */
/*      Nome */
/*      Valor */
/*      Data de cadastro */
CREATE TABLE `controle_financeiro`.`transacao` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Tipo` VARCHAR(45) NULL,
  `Nome` VARCHAR(100) NULL,
  `Valor` FLOAT(30,2) NULL,
  `Data_de_Cadastro` DATE NULL,
  PRIMARY KEY (`Id`));


/* 3. Criar uma query que insira uma transação com os campos tipo, nome, valor e data de cadastro. */
INSERT INTO `controle_financeiro`.`transacao` (`Tipo`, `Nome`, `Valor`, `Data_de_Cadastro`) 
  VALUES 
  ('Compra', 'Paçoca', '2.00', '2022-12-28');

INSERT INTO `controle_financeiro`.`transacao` (`Tipo`, `Nome`, `Valor`, `Data_de_Cadastro`) 
  VALUES 
  ('Venda', 'Mesa', '1850.00', '2022-12-26');

INSERT INTO `controle_financeiro`.`transacao` (`Tipo`, `Nome`, `Valor`, `Data_de_Cadastro`) 
  VALUES 
  ('Venda', 'Microondas', '350.65', '2022-12-25');

INSERT INTO `controle_financeiro`.`transacao` (`Tipo`, `Nome`, `Valor`, `Data_de_Cadastro`) 
  VALUES 
  ('Compra', 'Livro Mysql', '56.92', '2022-12-30');

INSERT INTO `controle_financeiro`.`transacao` (`Tipo`, `Nome`, `Valor`, `Data_de_Cadastro`) 
  VALUES 
  ('Compra', 'Livro JavaScript', '87.65', '2022-12-27');



/* 4. Criar uma query que retorne todas as transações cadastradas em ordem crescente da data de cadastro. */
SELECT * FROM controle_financeiro.transacao
ORDER BY `Data_de_Cadastro` ASC;


/* 5. Criar uma query que retorne o saldo acumulado considerando todas as transações cadastradas. */
SELECT SUM(Valor) FROM controle_financeiro.transacao;


/* 6. Criar uma query que exclua todas as transações cadastradas. */
/* - Para excluir tudo poderia simplesmente usar */
DELETE FROM `controle_financeiro`.`transacao`;

/* - Ou excluir lançamento por lançamento */
DELETE FROM `controle_financeiro`.`transacao` WHERE (`Id` = '1');
DELETE FROM `controle_financeiro`.`transacao` WHERE (`Id` = '2');
DELETE FROM `controle_financeiro`.`transacao` WHERE (`Id` = '3');
DELETE FROM `controle_financeiro`.`transacao` WHERE (`Id` = '4');
DELETE FROM `controle_financeiro`.`transacao` WHERE (`Id` = '5');