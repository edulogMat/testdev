# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;

INSERT INTO `employee` (`id`, `last_name`, `first_name`)
VALUES
	(1,'Duchemin','Thomas'),
	(2,'Mitron','Stéphanie'),
	(3,'Quatremain','Olivier'),
	(4,'Du Chemin','Aurélie'),
	(5,'Bouvier','Nicole');

/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table holiday
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holiday`;

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `kind_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DC9AB2348C03F15C` (`employee_id`),
  KEY `IDX_DC9AB23430602CA9` (`kind_id`),
  CONSTRAINT `FK_DC9AB23430602CA9` FOREIGN KEY (`kind_id`) REFERENCES `holiday_kind` (`id`),
  CONSTRAINT `FK_DC9AB2348C03F15C` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;

INSERT INTO `holiday` (`id`, `employee_id`, `kind_id`, `start_date`, `end_date`)
VALUES
	(1,5,1,'2020-10-12','2020-10-18'),
	(2,4,2,'2020-10-15','2020-10-15'),
	(3,4,2,'2020-10-19','2020-10-19'),
	(4,2,1,'2020-10-26','2020-11-06'),
	(5,1,1,'2020-10-01','2020-10-09'),
	(6,1,1,'2020-11-30','2020-12-11');

/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table holiday_kind
# ------------------------------------------------------------

DROP TABLE IF EXISTS `holiday_kind`;

CREATE TABLE `holiday_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `holiday_kind` WRITE;
/*!40000 ALTER TABLE `holiday_kind` DISABLE KEYS */;

INSERT INTO `holiday_kind` (`id`, `title`)
VALUES
	(1,'Congés payés'),
	(2,'Congés exceptionnels');

/*!40000 ALTER TABLE `holiday_kind` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
