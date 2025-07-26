

CREATE TABLE `carros` (
  `id_carros` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `placa` varchar(50) NOT NULL,
  `ano` int DEFAULT NULL,
  `cor` varchar(10) NOT NULL,
  `status` enum('disponível','alugado','manutenção') DEFAULT 'disponível',
  PRIMARY KEY (`id_carros`);

INSERT INTO `carros` VALUES 
  (1,'Gol 1.0','Volkswagen','ABC1234',2020,'Prata','disponível'),
  (2,'Onix LT','Chevrolet','XYZ5678',2021,'Preto','alugado'),
  (3,'HB20 Comfort','Hyundai','JKL9012',2019,'Branco','manutenção');


CREATE TABLE `clientes` (
  `id_clientes` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(200) DEFAULT NULL,
  `telefone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `endereco` text,
  PRIMARY KEY (`id_clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `clientes` VALUES (1,'Ana Souza','123.456.789-00','11987654321','ana@email.com','Rua das Flores, 100'),
  (2,'Carlos Lima','987.654.321-00','21912345678','carlos@email.com','Av. Brasil, 250'),
  (3,'Beatriz Ramos','111.222.333-44','31976543210','bia@email.com','Rua Verde, 45');


CREATE TABLE `funcionario` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`id_funcionario`)

INSERT INTO `funcionario` VALUES
  (1,'Ana Souza','123.456.789-00','Atendente','(95) 98811-2233'),
  (2,'Carlos Lima','987.654.321-11','Gerente','(95) 98456-7788'),
  (3,'Mariana Alves','456.789.123-22','Mecânica','(95) 98123-4455');

CREATE TABLE `locação` (
  `id_locacao` int NOT NULL AUTO_INCREMENT,
  `id_clientes` int NOT NULL,
  `id_carros` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `data_inicio` date NOT NULL,
  `data_final` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status` enum('ativa','finalizada','cancelada') DEFAULT 'ativa',
  PRIMARY KEY (`id_locacao`),
  KEY `id_clientes` (`id_clientes`),
  KEY `id_carros` (`id_carros`),
  KEY `id_funcionario` (`id_funcionario`),
  CONSTRAINT `locação_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`),
  CONSTRAINT `locação_ibfk_2` FOREIGN KEY (`id_carros`) REFERENCES `carros` (`id_carros`),
  CONSTRAINT `locação_ibfk_3` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_funcionario`)

INSERT INTO `locação` VALUES
  (34,1,2,1,'2025-07-01','2025-07-05',800.00,'finalizada'),
  (35,2,1,2,'2025-07-20',NULL,200.20,'ativa'),
  (36,3,3,3,'2025-06-15','2025-06-20',650.00,'cancelada');

CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_locacao` int NOT NULL,
  `forma_pagamento` varchar(50) DEFAULT NULL,
  `data_pagamento` date NOT NULL,
  `valores` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_locacao` (`id_locacao`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_locacao`) REFERENCES `locação` (`id_locacao`)

INSERT INTO `pagamento` VALUES
  (58,34,'Cartão de crédito','2025-07-05',800.00),
  (59,35,'Pix','2025-06-20',650.00),
  (60,36,'Pix','2025-06-20',800.00);

