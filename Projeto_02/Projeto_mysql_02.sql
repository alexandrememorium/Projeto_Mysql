/* 1. Criar um banco de dados para o projeto 2. */
CREATE DATABASE `pagamento` ;

/* 2. Criar a tabela "usuario" com os seguintes campos: */
/*     Id                */
/*     Nome              */
/*     Imagem            */
/*     Nome de usuario   */
/*     Data de cadastro  */

CREATE TABLE `pagamento`.`usuario` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Imagem` BLOB NULL,
  `Nome_de_Usuario` VARCHAR(50) NULL,
  `Data_de_Cadastro` DATE NULL,
  PRIMARY KEY (`Id`));

/* 3. Criar a tabela "cartao" com os seguintes campos: */
/*     Id                  */
/*     Numero              */
/*     Cvv                 */
/*     Data de expiracao   */
/*     Valido              */
/*     Data de cadastro    */

CREATE TABLE `pagamento`.`cartao` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(16) NOT NULL,
  `CVV` INT(3) NULL,
  `Data_de_Expiracao` DATE NULL,
  `Valido` DATE NULL,
  `Data_de_Cadastro` DATE NULL,
  PRIMARY KEY (`Id`));

/* 4. Criar a tabela "transacao" com os seguintes campos: */
/*     Id                */
/*     Id_usuario        */
/*     Id_cartao         */
/*     Valor             */
/*     Data de cadastro  */

CREATE TABLE `pagamento`.`transacao` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_Usuario` INT NOT NULL,
  `Id_Cartao` INT NOT NULL,
  `Valor` FLOAT(30,2) NOT NULL,
  `Data_de_Cadastro` DATETIME NOT NULL,
  PRIMARY KEY (`Id`));

/* 5. Criar uma query que insira um usuário com os campos nome, imagem, nome de usuário e data de cadastro. */
INSERT INTO `pagamento`.`usuario` (`Nome`, `Imagem`, `Nome_de_Usuario`, `Data_de_Cadastro`) VALUES ('João de Deus', 'IMG João', '@josao.deus', '2022-12-25');
INSERT INTO `pagamento`.`usuario` (`Nome`, `Imagem`, `Nome_de_Usuario`, `Data_de_Cadastro`) VALUES ('Marcela Carvalho', 'IMG Marcela', '@marcela.carvalho', '2022-12-26');
INSERT INTO `pagamento`.`usuario` (`Nome`, `Imagem`, `Nome_de_Usuario`, `Data_de_Cadastro`) VALUES ('Mario dos Santos', 'IMG Mario', '@mario.santos', '2022-12-27');
INSERT INTO `pagamento`.`usuario` (`Nome`, `Imagem`, `Nome_de_Usuario`, `Data_de_Cadastro`) VALUES ('Carlos Magalhães', 'IMG Carlos', '@carlos.magalhaes', '2022-12-28');
INSERT INTO `pagamento`.`usuario` (`Nome`, `Imagem`, `Nome_de_Usuario`, `Data_de_Cadastro`) VALUES ('Nelson Dias', 'IMG Nelson', '@nelson.dias', '2022-12-29');

/* 6. Criar uma query que retorne todos os usuários cadastrados em ordem alfabética. */
SELECT * FROM pagamento.usuario
ORDER BY Nome ASC;

/* 7. Criar uma query que insira um cartão com os campos número, cvv, data de expiração, válido e data de cadastro. */
INSERT INTO `pagamento`.`cartao` (`Numero`, `CVV`, `Data_de_Expiracao`, `Valido`, `Data_de_Cadastro`) VALUES ('1111111111111111', '789', '2023-10-28', '2023-10-28', '2022-12-25');
INSERT INTO `pagamento`.`cartao` (`Numero`, `CVV`, `Data_de_Expiracao`, `Valido`, `Data_de_Cadastro`) VALUES ('1111111111111111', '789', '2024-10-24', '2024-10-24', '2022-12-26');
INSERT INTO `pagamento`.`cartao` (`Numero`, `CVV`, `Data_de_Expiracao`, `Valido`, `Data_de_Cadastro`) VALUES ('4111111111111234', '123', '2020-10-28', '2023-10-28', '2022-12-27');
INSERT INTO `pagamento`.`cartao` (`Numero`, `CVV`, `Data_de_Expiracao`, `Valido`, `Data_de_Cadastro`) VALUES ('4111111111111234', '123', '2020-01-01', '2027-05-08', '2022-12-28');
INSERT INTO `pagamento`.`cartao` (`Numero`, `CVV`, `Data_de_Expiracao`, `Valido`, `Data_de_Cadastro`) VALUES ('1111111111111111', '789', '2025-01-01', '2031-12-02', '2022-12-29');

/* 8. Criar uma query que retorne apenas os cartões válidos em ordem crescente da data de cadastro. */
/* - No projeto este numero de cartão era o valido */
SELECT * FROM `pagamento`.`cartao`
WHERE Numero = "1111111111111111"
ORDER BY Data_de_Cadastro ASC;

/* - Mais faria esta validação pela data de Expiração, pois desta forma vai pegar todos os cartões com data de expiração validas curdate() é a data atual*/
SELECT * FROM `pagamento`.`cartao`
WHERE data_de_expiracao > curdate()
ORDER BY Data_de_Cadastro ASC;

/* 9. Criar uma query que insira uma transação com os campos id_usuario, id_cartao, valor e data de cadastro. */
INSERT INTO `pagamento`.`transacao` (`Id_Usuario`, `Id_Cartao`, `Valor`, `Data_de_Cadastro`) VALUES ('1', '1', '250.54', '2022-12-25');
INSERT INTO `pagamento`.`transacao` (`Id_Usuario`, `Id_Cartao`, `Valor`, `Data_de_Cadastro`) VALUES ('2', '2', '301.85', '2022-12-26');
INSERT INTO `pagamento`.`transacao` (`Id_Usuario`, `Id_Cartao`, `Valor`, `Data_de_Cadastro`) VALUES ('3', '3', '27.65', '2022-12-28');
INSERT INTO `pagamento`.`transacao` (`Id_Usuario`, `Id_Cartao`, `Valor`, `Data_de_Cadastro`) VALUES ('4', '4', '401.60', '2022-12-27');
INSERT INTO `pagamento`.`transacao` (`Id_Usuario`, `Id_Cartao`, `Valor`, `Data_de_Cadastro`) VALUES ('5', '5', '5876.57', '2022-12-29');


/* 10. Criar uma query que retorne todas as transações cadastradas em ordem decrescente da data de cadastro, contendo os dados do usuário e cartão, não apenas seus IDs. */
SELECT t.`id`,
       t.`id_usuario`,
       u.`nome`,
       u.`nome_de_usuario`,
       t.`id_cartao`,
       c.`numero`,
       c.`cvv`,
       c.`data_de_expiracao`,
       c.`valido`,
       t.`valor`,
       t.`data_de_cadastro`
from `transacao` as `t`
inner join `usuario` as `u` on u.`id` = t.`id_usuario`
inner join `cartao` as `c` on c.`id` = t.`id_cartao`
ORDER BY t.`data_de_cadastro` DESC
