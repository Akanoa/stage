-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.6.16 - MySQL Community Server (GPL)
-- Serveur OS:                   Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour cyavision
CREATE DATABASE IF NOT EXISTS `cyavision` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cyavision`;


-- Export de la structure de table cyavision. alerts
CREATE TABLE IF NOT EXISTS `alerts` (
  `project` char(32) NOT NULL,
  `testbench` char(32) NOT NULL,
  `test` char(32) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `first_alert` datetime DEFAULT NULL,
  PRIMARY KEY (`project`,`testbench`,`test`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store alerts from CyaVision';

/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;


-- Export de la structure de table cyavision. config
CREATE TABLE IF NOT EXISTS `config` (
  `section` varchar(50) NOT NULL,
  `directive` varchar(50) NOT NULL,
  `content` text,
  PRIMARY KEY (`section`,`directive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Export de données de la table cyavision.config: 14 rows
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
REPLACE INTO `config` (`section`, `directive`, `content`) VALUES
	('bble', 'emails', 'yguern@cyanide-studio.com'),
	('bble', 'bble_sql1', 'MySQL://bble1.cyanide-studio.com'),
	('pcm12', 'pcm12_sql1', 'MySQL://lobby.pcm12.cyanide-studio.com'),
	('pcm12', 'emails', 'yguern@cyanide-studio.com'),
	('general', 'antispam_delay', '3600'),
	('general', 'tpl_delimiter', '##LINE##'),
	('general', 'admin_email', 'yguern@cyanide-studio.com'),
	('general', 'tpl_html', '<html>\r\n    <head>\r\n        <meta http-equiv=\\"content-type\\" content=\\"text/html; charset=ISO-8859-1\\">\r\n    </head>\r\n    <body text="#000000" bgcolor="#FFFFFF">\r\n        Alerts on <b>$project_name</b> project:\r\n        <br/>\r\n        <ul>\r\n            $delimiter\r\n            <li>\r\n                $test_name\r\n                <br />\r\n                <ul>\r\n                    $delimiter\r\n                    <li>$routine_name <font color="#ff0000">FAILED</font></li>\r\n                    $delimiter\r\n                </ul>\r\n            </li>\r\n            $delimiter\r\n        </ul>\r\n        NB : <b>first alert at <em>$first_alert</em></b>\r\n    </body>\r\n</html>\r\n$delimiter\r\n<html>\r\n    <head>\r\n        <meta http-equiv=\\"content-type\\" content=\\"text/html; charset=ISO-8859-1\\">\r\n    </head>\r\n    <body text="#000000" bgcolor="#FFFFFF">\r\n        No alert on project <b>$project_name</b> but it must be <b>resetted</b> since <b>$first_alert</b> \r\n    </body>\r\n</html>'),
	('general', 'tpl_plain', 'Alert(s) on $project_name\r\n$delimiter\r\n    $test_name errors : $error_names FAILED\r\nNB : first alert on $first_alert\r\n$delimiter\r\nNo alert on project $project_name but it must be resetted since $first_alert '),
	('pcm12', 'pcm12_prod', 'PyLobby://lobby.pcm12.cyanide-studio.com:8016'),
	('bble', 'bble_prod1', 'PyLobby://bble1.cyanide-studio.com:12026'),
	('dungeonbowl', 'dungeonbowl_sql1', 'MySQL://dungeonbowl1.cyanide-studio.com'),
	('dungeonbowl', 'emails', 'yguern@cyanide-studio.com'),
	('dungeonbowl', 'dungeonbowl_prod', 'PyLobby://dungeonbowl1.cyanide-studio.com:8016');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
