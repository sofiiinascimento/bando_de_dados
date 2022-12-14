-- MySQL Script generated by MySQL Workbench
-- Wed Nov 16 11:06:25 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE database;

-- -----------------------------------------------------
-- Table `mydb`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoa` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(8) NOT NULL,
  `data_nascimento` INT NOT NULL,
  PRIMARY KEY (`cpf`)
  );

-- -----------------------------------------------------
-- Table `mydb`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livros` (
  `isbn` INT NOT NULL,
  `titulo` VARCHAR(200) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `tipo_obra` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `mydb`.`livros_has_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livros_has_pessoa` (
  `isbn` INT NOT NULL,
  `pessoa_cpf` INT NOT NULL,
  `status_leitura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`isbn`, `pessoa_cpf`),
  CONSTRAINT `fk_livros_has_pessoa_livros`
    FOREIGN KEY (`isbn`)
    REFERENCES `mydb`.`livros` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livros_has_pessoa_pessoa1`
    FOREIGN KEY (`pessoa_cpf`)
    REFERENCES `mydb`.`pessoa` (`cpf`)
    );


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `codigo` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genero` (
  `idgenero` INT NOT NULL,
  `nome_genero` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenero`)
  );



-- -----------------------------------------------------
-- Table `mydb`.`autor_has_livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor_has_livros` (
  `autor_codigo` INT NOT NULL,
  `livros_isbn` INT NOT NULL,
  PRIMARY KEY (`autor_codigo`, `livros_isbn`),
  CONSTRAINT `fk_autor_has_livros_autor1`
    FOREIGN KEY (`autor_codigo`)
    REFERENCES `mydb`.`autor` (`codigo`),
    FOREIGN KEY (`livros_isbn`),
    REFERENCES `mydb`.`livros` (`isbn`)
);



-- -----------------------------------------------------
-- Table `mydb`.`livros_has_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livros_has_genero` (
  `livros_isbn` INT NOT NULL,
  `genero_idgenero` INT NOT NULL,
  PRIMARY KEY (`livros_isbn`, `genero_idgenero`),
  CONSTRAINT `fk_livros_has_genero_livros1`
    FOREIGN KEY (`livros_isbn`)
    REFERENCES `mydb`.`livros` (`isbn`),
  CONSTRAINT `fk_livros_has_genero_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `mydb`.`genero` (`idgenero`)
);


-- -----------------------------------------------------
-- Table `mydb`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`editora` (
  `codigo_editora` INT NOT NULL,
  `nome_editora` VARCHAR(45) NULL,
  PRIMARY KEY (`codigo_editora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`livros_has_editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`livros_has_editora` (
  `livros_isbn` INT NOT NULL,
  `editora_codigo_editora` INT NOT NULL,
  PRIMARY KEY (`livros_isbn`, `editora_codigo_editora`),
  CONSTRAINT `fk_livros_has_editora_livros1`
    FOREIGN KEY (`livros_isbn`)
    REFERENCES `mydb`.`livros` (`isbn`),
  CONSTRAINT `fk_livros_has_editora_editora1`
    FOREIGN KEY (`editora_codigo_editora`)
    REFERENCES `mydb`.`editora` (`codigo_editora`)
  );

DROP DATABASE mydb;


/* --------------------------------------- */

INSERT INTO (
  cpf,
  nome, 
  email,
  nacionalidade
  sexo,
  data_nascimento,
)

VALUES (80222520884,'Carlos Duarte', 'carlos.duarte@gmail.com', 'Brasil','Masculino','02-02-1982')
       (37406414285, 'Pedro Ricardo Alves','pedroalvess@gmail.com', 'Brasil', 'Masculino','04-24-1991')
       (96352539076,'Pietra Silva','pietraa123@gmail.com', 'Brasil','Fran??a','Feminino','11-03-2000')
       ()