/* 1. Criar um banco de dados para o projeto 2. */
CREATE DATABASE `proj_php` ;

/* 2. Criar a tabela "cliente" com os seguintes campos: */
/*     Id_Cliente        */
/*     NomeCliente       */
/*     CPF               */
/*     email             */
/*     Dt_cadastro       */

CREATE TABLE `proj_php`.`cliente` (
  `Id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `NomeCliente` VARCHAR(100) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `email` NCHAR(10) NULL,
  `Dt_Cadastro` DATE NULL,
  PRIMARY KEY (`Id_Cliente`));

/* 3. Criar a tabela "produto" com os seguintes campos: */
/*     codbarras           */
/*     NomeProduto         */
/*     ValorUnitario       */
/*     Dt_Cadastro         */

CREATE TABLE `proj_php`.`produto` (
  `Codbarras` Varchar(20) NOT NULL,
  `NomeProduto` VARCHAR(100) NULL,
  `ValorUnitario` DECIMAL(19,2) NOT NULL,
  `Dt_Cadastro` DATE NULL,
  PRIMARY KEY (`Codbarras`));

/* 4. Criar a tabela "pedido" com os seguintes campos: */
/*     NumeroPedido      */
/*     Id_Cliente        */
/*     CodBarras         */
/*     Quantidade        */
/*     DtPedido          */

CREATE TABLE `proj_php`.`pedido` (
  `NumeroPedido` INT NOT NULL AUTO_INCREMENT,
  `Id_Cliente` INT NOT NULL,
  `CodBarras` Varchar(20) NOT NULL,
  `Quantidade` INT NOT NULL,
  `Dt_Pedido` TIMESTAMP NOT NULL,
  PRIMARY KEY (`NumeroPedido`));

