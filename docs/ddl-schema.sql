-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela upd8.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.cache: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela upd8.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.cache_locks: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela upd8.cidades
CREATE TABLE IF NOT EXISTS `cidades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `estado_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidades_estado_id_foreign` (`estado_id`),
  CONSTRAINT `cidades_estado_id_foreign` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.cidades: ~30 rows (aproximadamente)
INSERT INTO `cidades` (`id`, `nome`, `estado_id`, `created_at`, `updated_at`) VALUES
	(1, 'Hillsborough', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(2, 'West Angelicaside', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(3, 'West Lesley', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(4, 'Gerdaborough', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(5, 'North Kole', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(6, 'Spinkamouth', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(7, 'Flatleyberg', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(8, 'East Peteton', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(9, 'Kutchburgh', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(10, 'Stehrshire', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(11, 'Kesslerland', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(12, 'Rueckerport', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(13, 'Port Eula', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(14, 'Nigelfurt', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(15, 'Vitamouth', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(16, 'New Ervin', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(17, 'Lake Linnie', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(18, 'New Kyra', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(19, 'North Reecetown', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(20, 'Ziememouth', 6, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(21, 'Ariannahaven', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(22, 'Robertport', 3, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(23, 'West Elody', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(24, 'New Aurelieview', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(25, 'Zoiehaven', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(26, 'Lake Sherwood', 6, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(27, 'North Jodie', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(28, 'Cordellside', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(29, 'Ziemeburgh', 3, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(30, 'Lindgrenberg', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12');

-- Copiando estrutura para tabela upd8.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` enum('M','F') NOT NULL,
  `cidade_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `clientes_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.clientes: ~50 rows (aproximadamente)
INSERT INTO `clientes` (`id`, `nome`, `cpf`, `data_nascimento`, `sexo`, `cidade_id`, `created_at`, `updated_at`) VALUES
	(1, 'Sydni Bergstrom', '887.594.353-04', '1991-09-19', 'F', 27, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(2, 'Hermina Roberts III', '111.335.078-84', '1981-03-14', 'M', 26, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(3, 'Aubree Paucek PhD', '132.098.674-09', '1975-11-27', 'F', 17, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(4, 'Robert Kiehn', '279.058.267-53', '1993-08-12', 'F', 22, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(5, 'Shawna Kshlerin', '613.560.979-14', '1993-02-12', 'F', 11, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(6, 'Alba Breitenberg', '063.745.918-44', '1973-10-27', 'M', 25, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(7, 'Seth Kris', '467.329.972-80', '1997-03-11', 'F', 2, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(8, 'Prof. Hulda Greenfelder', '632.888.060-84', '1986-06-06', 'F', 17, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(9, 'Alessia Fadel', '848.284.773-67', '1984-12-15', 'M', 19, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(10, 'Kimberly Turner', '073.623.620-47', '1980-09-24', 'F', 9, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(11, 'Mr. Mackenzie Towne', '049.152.740-88', '2005-11-09', 'F', 18, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(12, 'Dr. Raven Ratke', '227.445.104-93', '1975-07-08', 'F', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(13, 'Prof. Marlin White', '946.713.135-84', '1977-11-04', 'M', 27, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(14, 'Gerhard Wunsch II', '818.898.483-26', '1995-05-22', 'F', 27, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(15, 'Prof. Cullen Adams Sr.', '321.560.957-30', '2007-06-15', 'F', 10, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(16, 'Reyes Gleichner', '354.000.046-41', '2004-12-03', 'F', 8, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(17, 'Jennings Nader', '051.467.638-52', '2002-09-10', 'M', 1, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(18, 'Prof. Liam Oberbrunner V', '530.428.523-70', '1990-04-20', 'F', 12, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(19, 'Austen Ortiz', '358.571.683-62', '1984-07-19', 'M', 7, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(20, 'Justine Heidenreich MD', '373.981.806-58', '1992-07-22', 'F', 10, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(21, 'Katrine Gusikowski V', '341.517.692-19', '1978-12-27', 'M', 27, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(22, 'Jayne Ritchie', '896.848.772-17', '1972-04-26', 'M', 24, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(23, 'Mrs. Enola Strosin IV', '941.359.009-15', '1986-09-13', 'F', 12, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(24, 'Giovani Kihn DVM', '527.829.147-03', '1996-12-22', 'F', 15, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(25, 'Dr. Edwin Nicolas Jr.', '239.607.754-40', '1988-08-16', 'M', 26, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(26, 'Prof. Idella Funk PhD', '674.376.921-81', '1976-02-12', 'F', 16, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(27, 'Ward Will', '058.299.656-59', '2001-01-03', 'F', 11, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(28, 'Glenda Mueller', '011.274.415-41', '1986-12-19', 'M', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(29, 'Mrs. Pauline Schuppe III', '027.541.767-01', '1975-03-10', 'F', 6, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(30, 'Bernardo Zulauf', '844.184.326-39', '1970-10-17', 'M', 10, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(31, 'Mr. Justyn Padberg', '162.199.172-20', '1998-03-25', 'M', 8, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(32, 'Miss Selina Konopelski', '793.003.771-76', '2000-05-30', 'M', 7, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(33, 'Mrs. Kaitlyn Barrows III', '725.013.754-87', '2002-12-18', 'M', 24, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(34, 'Jayda Hayes', '956.729.139-55', '1995-09-01', 'F', 29, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(35, 'Dr. Trinity Hahn', '123.585.897-95', '1979-01-06', 'M', 7, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(36, 'Salvatore Watsica', '209.040.353-91', '1985-10-13', 'F', 7, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(37, 'Helene Goldner', '612.624.578-40', '2001-12-25', 'M', 26, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(38, 'Mrs. Dessie Kessler Jr.', '657.226.276-38', '1983-02-10', 'F', 18, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(39, 'Prof. Meaghan Pfeffer', '364.853.648-73', '1984-10-20', 'M', 16, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(40, 'Llewellyn Bahringer', '205.986.517-38', '1971-06-20', 'F', 8, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(41, 'Mr. Alexandre Kshlerin', '737.958.211-19', '1996-05-19', 'M', 5, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(42, 'Linda McKenzie', '022.323.252-57', '1993-10-11', 'F', 20, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(43, 'Prof. Madeline Cartwright', '512.744.059-52', '1986-07-11', 'F', 21, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(44, 'Ms. Nova Gaylord', '265.833.109-75', '1978-08-19', 'F', 23, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(45, 'Laurence Greenfelder', '073.301.093-72', '2000-02-13', 'F', 20, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(46, 'Mr. Skye Kessler', '744.906.241-08', '1988-09-23', 'M', 24, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(47, 'Miss Darby Gerlach Jr.', '134.954.344-69', '1988-07-21', 'F', 9, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(48, 'Carmel Upton', '741.211.816-01', '1999-08-31', 'F', 4, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(49, 'Ms. Dortha Dickens MD', '910.616.039-09', '1980-09-09', 'F', 13, '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(50, 'Florian Dibbert', '016.301.720-73', '1970-09-06', 'F', 16, '2025-07-12 20:12:12', '2025-07-12 20:12:12');

-- Copiando estrutura para tabela upd8.estados
CREATE TABLE IF NOT EXISTS `estados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estados_sigla_unique` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.estados: ~6 rows (aproximadamente)
INSERT INTO `estados` (`id`, `sigla`, `nome`, `created_at`, `updated_at`) VALUES
	(1, 'SP', 'São Paulo', NULL, NULL),
	(2, 'RJ', 'Rio de Janeiro', NULL, NULL),
	(3, 'MG', 'Minas Gerais', NULL, NULL),
	(4, 'PR', 'Paraná', NULL, NULL),
	(5, 'SC', 'Santa Catarina', NULL, NULL),
	(6, 'RS', 'Rio Grande do Sul', NULL, NULL);

-- Copiando estrutura para tabela upd8.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.migrations: ~6 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2025_07_12_134300_create_estados_table', 1),
	(2, '2025_07_12_134302_create_cidades_table', 1),
	(3, '2025_07_12_134306_create_clientes_table', 1),
	(4, '2025_07_12_134905_create_representantes_table', 1),
	(5, '2025_07_12_134910_create_representante_cidade_table', 1),
	(6, '2025_07_12_151118_create_cache_table', 1);

-- Copiando estrutura para tabela upd8.representantes
CREATE TABLE IF NOT EXISTS `representantes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('PF','PJ') NOT NULL,
  `documento` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `representantes_documento_unique` (`documento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.representantes: ~10 rows (aproximadamente)
INSERT INTO `representantes` (`id`, `nome`, `tipo`, `documento`, `email`, `telefone`, `created_at`, `updated_at`) VALUES
	(1, 'Aracely Boyer', 'PJ', '63676237853', 'dstanton@example.com', '(346) 812-7938', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(2, 'Walter Hand', 'PF', '41665903400', 'greyson.grimes@example.com', '+1-713-459-0389', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(3, 'Prof. Miguel Will', 'PJ', '09479266599', 'christ.wunsch@example.net', '+1-559-572-2223', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(4, 'Rusty Brekke MD', 'PJ', '94359343246', 'adan.reynolds@example.org', '1-757-386-3491', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(5, 'Lucienne Balistreri III', 'PF', '24340223559', 'meredith36@example.net', '+1-681-815-9217', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(6, 'Mrs. Clare Spencer', 'PJ', '03286624303', 'nettie71@example.com', '240.695.0927', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(7, 'Miss Ara Kihn', 'PF', '85637567510', 'conner.connelly@example.net', '+1.201.942.3171', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(8, 'Roy Rath', 'PF', '97761683506', 'croob@example.com', '1-225-924-7179', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(9, 'Rossie Bayer', 'PF', '43934707505', 'alangosh@example.com', '1-918-890-1525', '2025-07-12 20:12:12', '2025-07-12 20:12:12'),
	(10, 'Prof. Natasha Brown Jr.', 'PF', '24452134311', 'ynader@example.org', '+1-785-325-0392', '2025-07-12 20:12:12', '2025-07-12 20:12:12');

-- Copiando estrutura para tabela upd8.representante_cidade
CREATE TABLE IF NOT EXISTS `representante_cidade` (
  `representante_id` bigint(20) unsigned NOT NULL,
  `cidade_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`representante_id`,`cidade_id`),
  KEY `representante_cidade_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `representante_cidade_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE CASCADE,
  CONSTRAINT `representante_cidade_representante_id_foreign` FOREIGN KEY (`representante_id`) REFERENCES `representantes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela upd8.representante_cidade: ~26 rows (aproximadamente)
INSERT INTO `representante_cidade` (`representante_id`, `cidade_id`) VALUES
	(1, 1),
	(2, 5),
	(2, 6),
	(2, 20),
	(2, 27),
	(3, 1),
	(3, 19),
	(3, 22),
	(4, 10),
	(4, 12),
	(4, 24),
	(5, 12),
	(6, 8),
	(6, 12),
	(6, 14),
	(6, 19),
	(7, 2),
	(7, 14),
	(7, 21),
	(8, 8),
	(9, 2),
	(9, 4),
	(9, 6),
	(9, 18),
	(9, 28),
	(10, 12);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
