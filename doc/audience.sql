-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.5.37-log - Source distribution
-- Serveur OS:                   FreeBSD10.0
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de table bb2_audience. bb2_audience
CREATE TABLE IF NOT EXISTS `datas` (
  `affiliate` int(11) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `project` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `remote_ip` varchar(50) DEFAULT '0.0.0.0',
  `prefered_language` varchar(50) DEFAULT 'none',
  `user_agent` varchar(255) DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- L'exportation de données n'été pas sélectionné.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- Export de la structure de table bb2_audience. affiliates
CREATE TABLE IF NOT EXISTS `affiliates` (
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
INSERT INTO `affiliates` (`name`, `num`) VALUES
    ('IAM CYCLING', 3),
    ('CAJA RURAL - SEGUROS RGA', 4),
    ('MOVISTAR TEAM', 5),
    ('BARDIANI - CSF PRO TEAM', 6),
    ('KATUSHA TEAM', 7),
    ('UNITEDHEALTHCARE PRO CYCLING TEAM', 8),
    ('DRAPAC PROFESSIONAL CYCLING', 9),
    ('TEAM COLOMBIA', 10),
    ('TEAM NETAPP - ENDURA', 11),
    ('BRETAGNE-SECHE ENVIRONNEMENT', 12),
    ('TINKOFF-SAXO', 13),
    ('LOTTO BELISOL', 14),
    ('AG2R LA MONDIALE', 15),
    ('FDJ', 16),
    ('TREK FACTORY RACING', 17),
    ('CULT ENERGY VITAL WATER', 18),
    ('COLOR CODE-BIOWANZE', 19),
    ('WALLONIE BRUXELLES', 20),
    ('BELKIN PRO CYCLING TEAM', 21),
    ('ANDRONI GIOCATTOLI - VENEZUELA', 22),
    ('TEAM GIANT-SHIMANO', 23),
    ('LKT TEAM BRANDENBURG', 24),
    ('RIWAL CYCLING TEAM', 25),
    ('TEAM SKY', 26),
    ('COFIDIS, SOLUTIONS CREDITS', 27),
    ('WANTY-GROUPE GOBERT', 28),
    ('TEAM JOKER', 29),
    ('VERANDAS WILLEMS', 30),
    ('BAUKNECHT AUTHOR', 31),
    ('RADIO POPULAR', 32),
    ('TIROL CYCLING TEAM', 33),
    ('VERANCLASSIC - DOLTCINI', 34),
    ('OMEGA PHARMA - QUICK-STEP', 35),
    ('TEAM STÖLTING', 36),
    ('MTN-QHUBEKA', 37),
    ('LEOPARD DEVELOPMENT TEAM', 38),
    ('BIGMAT-AUBER93', 39),
    ('CCC POLSAT POLKOWICE', 40),
    ('AMORE & VITA – SELLE SMP', 41),
    ('LAMPRE - MERIDA', 42),
    ('TEAM GARMIN-SHARP', 43),
    ('ACTIVEJET TEAM', 44),
    ('LA ALUMINIOS - ANTARTE', 45),
    ('TEAM3M', 46),
    ('ASTANA PRO TEAM', 47),
    ('CHRISTINA WATCHES - KUMA POWERED BY DANA', 48),
    ('TEAM EUROPCAR', 49),
    ('CYCLINGTEAM JO PIELS', 50),
    ('ADRIA MOBIL', 51),
    ('ROUBAIX LILLE METROPOLE', 52),
    ('RAPHA CONDOR JLT', 53),
    ('AN POST CHAINREACTION SEAN KELLY TEAM', 54),
    ('TEAM LA POMME-MARSEILLE', 55),
    ('TEAM SPAREBANKEN SOR', 56),
    ('SKYDIVE DUBAI PRO CYCLING TEAM', 57),
    ('CANNONDALE PRO CYCLING', 58),
    ('ORICA-GREENEDGE', 2),
    ('Cyanide', 1);
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
