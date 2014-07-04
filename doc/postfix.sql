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

-- Export de la structure de la base pour postfix
CREATE DATABASE IF NOT EXISTS `postfix` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `postfix`;


-- Export de la structure de table postfix. alias
CREATE TABLE IF NOT EXISTS `alias` (
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `persistent` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`address`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Aliases';

-- Export de données de la table postfix.alias: 0 rows
/*!40000 ALTER TABLE `alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias` ENABLE KEYS */;


-- Export de la structure de table postfix. domain
CREATE TABLE IF NOT EXISTS `domain` (
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aliases` int(10) NOT NULL DEFAULT '0',
  `mailboxes` int(10) NOT NULL DEFAULT '0',
  `maxquota` bigint(20) NOT NULL DEFAULT '0',
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `transport` varchar(255) NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Domains';

-- Export de données de la table postfix.domain: 2 rows
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
REPLACE INTO `domain` (`domain`, `description`, `aliases`, `mailboxes`, `maxquota`, `quota`, `transport`, `backupmx`, `created`, `modified`, `active`) VALUES
	('cyanide-studio.com', 'cyanide Nanterre', 0, 0, 0, 0, 'virtual', 0, '2008-05-28 08:23:26', '2008-05-28 08:23:26', 1),
	('ALL', '', 0, 0, 0, 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;


-- Export de la structure de table postfix. mailbox
CREATE TABLE IF NOT EXISTS `mailbox` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `maildir` varchar(255) NOT NULL,
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `uid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `ml_admin` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `domain` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=468 DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Mailboxes';

-- Export de données de la table postfix.mailbox: 2 rows
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
REPLACE INTO `mailbox` (`username`, `password`, `name`, `maildir`, `quota`, `local_part`, `domain`, `created`, `modified`, `active`, `uid`, `ml_admin`) VALUES
	('yguern@cyanide-studio.com', '$1$43985fcc$GQJNrd4KFvwej0Cv6Tsov/', 'Yannick Guern', 'cyanide-studio.com/yguern/', 0, 'yguern', 'cyanide-studio.com', '2014-02-21 15:47:09', '2014-02-21 15:47:09', 1, 460, 1),
	('yguern2@cyanide-studio.com', '$1$43985fcc$GQJNrd4KFvwej0Cv6Tsov/', 'Yannick Guern2', 'cyanide-studio.com/yguern2/', 0, 'yguern2', 'cyanide-studio.com', '2014-02-21 15:47:09', '2014-02-21 15:47:09', 1, 467, 0);
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;


-- Export de la structure de table postfix. mailing_list
CREATE TABLE IF NOT EXISTS `mailing_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '1' COMMENT 'if 1, this ML is not listed by the subscribe script (but still public)',
  `private` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'if 1, users can''t subscribe through subscribe script',
  `public_can_send` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `public_can_subscribe` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2005 DEFAULT CHARSET=latin1;

-- Export de données de la table postfix.mailing_list: 5 rows
/*!40000 ALTER TABLE `mailing_list` DISABLE KEYS */;
REPLACE INTO `mailing_list` (`id`, `name`, `hidden`, `private`, `public_can_send`, `public_can_subscribe`) VALUES
	(999, 'yguernml', 0, 0, 0, 0),
	(2001, 'yguernml1', 0, 0, 0, 0),
	(2002, 'yguernml2', 0, 0, 0, 0),
	(2003, 'yguernml3', 0, 0, 0, 0),
	(2004, 'yguernml4', 0, 0, 0, 0);
/*!40000 ALTER TABLE `mailing_list` ENABLE KEYS */;


-- Export de la structure de table postfix. mailing_list_external_user
CREATE TABLE IF NOT EXISTS `mailing_list_external_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `mailing_list_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `must_receive_message` tinyint(1) unsigned DEFAULT '1',
  `can_send_message` tinyint(1) unsigned DEFAULT '0',
  `str_custom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- Export de données de la table postfix.mailing_list_external_user: 36 rows
/*!40000 ALTER TABLE `mailing_list_external_user` DISABLE KEYS */;
REPLACE INTO `mailing_list_external_user` (`id`, `mailing_list_id`, `email`, `must_receive_message`, `can_send_message`, `str_custom`) VALUES
	(1, 999, 'yguern_a@cyanide-studio.com', 1, 1, NULL),
	(2, 999, 'yguern_z@cyanide-studio.com', 1, 1, NULL),
	(3, 999, 'yguern_e@cyanide-studio.com', 1, 1, NULL),
	(4, 999, 'yguern_r@cyanide-studio.com', 1, 1, NULL),
	(5, 999, 'yguern_t@cyanide-studio.com', 1, 1, NULL),
	(6, 999, 'yguern_y@cyanide-studio.com', 1, 1, NULL),
	(7, 999, 'yguern_u@cyanide-studio.com', 1, 1, NULL),
	(8, 999, 'yguern_i@cyanide-studio.com', 1, 1, NULL),
	(9, 999, 'yguern_o@cyanide-studio.com', 1, 1, NULL),
	(10, 999, 'yguern_p@cyanide-studio.com', 1, 1, NULL),
	(11, 999, 'yguern_q@cyanide-studio.com', 1, 1, NULL),
	(12, 999, 'yguern_s@cyanide-studio.com', 1, 1, NULL),
	(13, 999, 'yguern_d@cyanide-studio.com', 1, 1, NULL),
	(14, 999, 'yguern_f@cyanide-studio.com', 1, 1, NULL),
	(15, 999, 'yguern_g@cyanide-studio.com', 1, 1, NULL),
	(16, 999, 'yguern_h@cyanide-studio.com', 1, 1, NULL),
	(17, 999, 'yguern_j@cyanide-studio.com', 1, 1, NULL),
	(18, 999, 'yguern_k@cyanide-studio.com', 1, 1, NULL),
	(19, 999, 'yguern_l@cyanide-studio.com', 1, 1, NULL),
	(20, 999, 'yguern_m@cyanide-studio.com', 1, 1, NULL),
	(21, 999, 'yguern_w@cyanide-studio.com', 1, 1, NULL),
	(22, 999, 'yguern_x@cyanide-studio.com', 1, 1, NULL),
	(23, 999, 'yguern_c@cyanide-studio.com', 1, 1, NULL),
	(24, 999, 'yguern_v@cyanide-studio.com', 1, 1, NULL),
	(25, 999, 'yguern_b@cyanide-studio.com', 1, 1, NULL),
	(26, 999, 'yguern_n@cyanide-studio.com', 1, 1, NULL),
	(27, 999, 'yguern_1@cyanide-studio.com', 1, 1, NULL),
	(28, 999, 'yguern_2@cyanide-studio.com', 1, 1, NULL),
	(29, 999, 'yguern_3@cyanide-studio.com', 1, 1, NULL),
	(30, 999, 'yguern_4@cyanide-studio.com', 1, 1, NULL),
	(31, 999, 'yguern_5@cyanide-studio.com', 1, 1, NULL),
	(32, 999, 'yguern_6@cyanide-studio.com', 1, 1, NULL),
	(33, 999, 'yguern_7@cyanide-studio.com', 1, 1, NULL),
	(34, 999, 'yguern_8@cyanide-studio.com', 1, 1, NULL),
	(35, 999, 'yguern_9@cyanide-studio.com', 1, 1, NULL),
	(36, 999, 'yguern_0@cyanide-studio.com', 1, 1, NULL);
/*!40000 ALTER TABLE `mailing_list_external_user` ENABLE KEYS */;


-- Export de la structure de table postfix. mailing_list_user
CREATE TABLE IF NOT EXISTS `mailing_list_user` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mailing_list_id` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `must_receive_message` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_send_message` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`mailing_list_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Export de données de la table postfix.mailing_list_user: 1 rows
/*!40000 ALTER TABLE `mailing_list_user` DISABLE KEYS */;
REPLACE INTO `mailing_list_user` (`id`, `mailing_list_id`, `uid`, `must_receive_message`, `can_send_message`) VALUES
	(0, 2001, 460, 1, 1);
/*!40000 ALTER TABLE `mailing_list_user` ENABLE KEYS */;


-- Export de la structure de table postfix. mail_alias
CREATE TABLE IF NOT EXISTS `mail_alias` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Export de données de la table postfix.mail_alias: 16 rows
/*!40000 ALTER TABLE `mail_alias` DISABLE KEYS */;
REPLACE INTO `mail_alias` (`id`, `uid`, `alias`) VALUES
	(1, 5, 'mister-j'),
	(2, 7, 'ppligers'),
	(3, 8, 'patch'),
	(4, 3, 'mura'),
	(5, 7, 'storm'),
	(6, 12, 'jbdrouot'),
	(7, 12, 'jb'),
	(8, 14, 'freire'),
	(11, 15, 'vince'),
	(12, 9, 'grib'),
	(13, 4, 'mao'),
	(14, 6, 'toms'),
	(15, 10, 'marie'),
	(17, 11, 'pierro'),
	(19, 20, 'rhiann'),
	(20, 2, 'sabbasth');
/*!40000 ALTER TABLE `mail_alias` ENABLE KEYS */;


-- Export de la structure de table postfix. subscription_not_allowed
CREATE TABLE IF NOT EXISTS `subscription_not_allowed` (
  `mailbox_id` smallint(4) unsigned NOT NULL COMMENT 'mailbox id',
  PRIMARY KEY (`mailbox_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='references emails that are not allowed to subscribe';

-- Export de données de la table postfix.subscription_not_allowed: 20 rows
/*!40000 ALTER TABLE `subscription_not_allowed` DISABLE KEYS */;
REPLACE INTO `subscription_not_allowed` (`mailbox_id`) VALUES
	(1),
	(79),
	(103),
	(105),
	(118),
	(121),
	(149),
	(182),
	(216),
	(225),
	(227),
	(256),
	(263),
	(288),
	(289),
	(292),
	(305),
	(347),
	(348),
	(357);
/*!40000 ALTER TABLE `subscription_not_allowed` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
