-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.3.9-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Exportiere Datenbank Struktur für wvg_data
CREATE DATABASE IF NOT EXISTS `wvg_data` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wvg_data`;

-- Exportiere Struktur von Tabelle wvg_data.buchungen
CREATE TABLE IF NOT EXISTS `buchungen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_BUS` int(11) DEFAULT NULL,
  `Name` text NOT NULL,
  `Rufnummer` text NOT NULL,
  `Datum` datetime DEFAULT NULL,
  `Passenger` int(11) NOT NULL,
  `Pickup` text NOT NULL,
  `Target` text NOT NULL,
  `Buchungszeit` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `FK_buchungen_bus` (`ID_BUS`),
  CONSTRAINT `FK_buchungen_bus` FOREIGN KEY (`ID_BUS`) REFERENCES `bus` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle wvg_data.buchungen: ~4 rows (ungefähr)
/*!40000 ALTER TABLE `buchungen` DISABLE KEYS */;
INSERT INTO `buchungen` (`ID`, `ID_BUS`, `Name`, `Rufnummer`, `Datum`, `Passenger`, `Pickup`, `Target`, `Buchungszeit`) VALUES
	(2, 1, 'test1', '12345678', '2018-10-10 21:46:26', 3, 'straße1', 'straße2', '2018-10-10 21:46:34'),
	(3, 1, 'Christoph', '987654321', '2018-10-28 06:50:00', 8, 'Start1', 'Ziel1, 38440 Wolfsburg', '2018-10-10 21:50:46'),
	(4, 1, 'Christoph', '012345678', '2018-11-04 23:21:00', 9, 'Astrid-Lindgren-Schule', 'Zur Haustür, 38440 Wolfsburg', '2018-10-29 19:21:20'),
	(5, 2, 'Christoph Werner', '012345678', '2018-11-04 23:32:00', 3, 'Hochring', 'Ziel2, 38440 Wolfsburg', '2018-10-29 19:32:35');
/*!40000 ALTER TABLE `buchungen` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle wvg_data.bus
CREATE TABLE IF NOT EXISTS `bus` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Bezeichnung` varchar(200) NOT NULL,
  `Personen` int(1) NOT NULL,
  `ACTIV` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle wvg_data.bus: ~4 rows (ungefähr)
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` (`ID`, `Bezeichnung`, `Personen`, `ACTIV`) VALUES
	(1, 'VW Bus 1', 9, 1),
	(2, 'VW Bus 2', 9, 1),
	(3, 'VW Bus 3', 9, 1),
	(4, 'VW Bus 4', 9, 1);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle wvg_data.haltestellen
CREATE TABLE IF NOT EXISTS `haltestellen` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Haltestelle` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle wvg_data.haltestellen: ~310 rows (ungefähr)
/*!40000 ALTER TABLE `haltestellen` DISABLE KEYS */;
INSERT INTO `haltestellen` (`ID`, `Haltestelle`) VALUES
	(1, 'Alexanderberg'),
	(2, 'Allerpark'),
	(4, 'Allerstraße'),
	(5, 'Allerwiesen'),
	(6, 'Almke Elmstraße'),
	(7, 'Almke Freibad'),
	(8, 'Almke Kapellenstraße'),
	(9, 'Almke Volkmarsdorfer Straße'),
	(10, 'Almke'),
	(11, 'Almke Zum Siekberg'),
	(12, 'Alt Wolfsburg'),
	(13, 'Am Schäferbusch'),
	(14, 'Amselweg'),
	(15, 'Amtsgericht'),
	(16, 'An der Kiesgrube'),
	(17, 'An der Mühle'),
	(18, 'Astrid-Lindgren-Schule'),
	(19, 'AutoMuseum'),
	(20, 'AUTOSTADT'),
	(21, 'Badeland'),
	(22, 'Barnstorf Gänsewiese'),
	(23, 'Barnstorf Ringstraße'),
	(24, 'Barnstorf Scharenhop'),
	(25, 'Barnstorf'),
	(26, 'Bartenslebenring'),
	(27, 'Beethovenring'),
	(28, 'Berufsschule II'),
	(29, 'Berufsschulzentrum'),
	(30, 'Bielefelder Straße'),
	(31, 'Borsigstraße'),
	(32, 'Brackstedt Gerberstraße'),
	(33, 'Brackstedt Kästorfer Straße'),
	(34, 'Brackstedt'),
	(35, 'Brandenburger Platz'),
	(36, 'Brandgehaege'),
	(37, 'Brücke VW-West'),
	(38, 'C+A'),
	(39, 'CongressPark'),
	(40, 'Detmerode Bonhoefferstraße'),
	(41, 'Detmerode Detmeroder Markt'),
	(42, 'Detmerode Friedrich-Naumann-Straße'),
	(43, 'Detmerode Goerdelerstraße'),
	(44, 'Detmerode Kurt-Schumacher-Ring'),
	(45, 'Detmerode Mörser Winkel'),
	(46, 'Detmerode Raststätte'),
	(47, 'Detmerode Theodor-Heuss-Straße'),
	(48, 'Detmerode'),
	(49, 'Duisburger Straße'),
	(50, 'Ehmen An der Reuterweide'),
	(51, 'Ehmen Brunsroder Straße'),
	(52, 'Ehmen Dammstraße'),
	(53, 'Ehmen Feldscheide'),
	(54, 'Ehmen Friedhof'),
	(55, 'Ehmen Kastanienallee'),
	(56, 'Ehmen Kolonie Ehmen'),
	(57, 'Ehmen Kreuzkamp'),
	(58, 'Ehmen Küsterwiese'),
	(59, 'Ehmen Ludgeristraße'),
	(60, 'Ehmen Siebsberg'),
	(61, 'Ehmen Südfriedhof'),
	(62, 'Ehmen Waldfrieden'),
	(63, 'Ehmen Walkenriedstraße'),
	(64, 'Ehmen Wasserturm'),
	(65, 'Ehmen Wilshoop'),
	(66, 'Ehmen Wulfhagen'),
	(67, 'Eichendorffschule'),
	(68, 'Eisenacher Straße'),
	(69, 'Fallersleben Altes Brauhaus'),
	(70, 'Fallersleben Bahnhof/Hafenstraße'),
	(71, 'Fallersleben Bahnhofstraße'),
	(72, 'Fallersleben Bahnhof'),
	(73, 'Fallersleben Dresdener Straße'),
	(74, 'Fallersleben Fallersleben Süd'),
	(75, 'Fallersleben Franz-Liszt-Straße'),
	(76, 'Fallersleben Franz-Schubert-Straße'),
	(77, 'Fallersleben Friedrich-Mumme-Straße'),
	(78, 'Fallersleben Glockenberg'),
	(79, 'Fallersleben Karl-Heise-Straße'),
	(80, 'Fallersleben Kurzer Weg'),
	(81, 'Fallersleben Logistikzentrum MLW'),
	(82, 'Fallersleben Logistikzentrum'),
	(83, 'Fallersleben Mozartstraße'),
	(84, 'Fallersleben Neues Feld'),
	(85, 'Fallersleben Nordring'),
	(86, 'Fallersleben Schulzentrum'),
	(87, 'Fallersleben Schwefelbad'),
	(88, 'Fallersleben Spitzwegstraße'),
	(89, 'Fallersleben St. Marienkirche'),
	(90, 'Fallersleben Tappenbecker Landstraße'),
	(91, 'Fallersleben TechnoForum'),
	(92, 'Fallersleben Viehtrift'),
	(93, 'Fallersleben Westerbreite'),
	(94, 'Fallersleben Westrampe'),
	(95, 'Fallersleben West'),
	(96, 'Fallersleben Zillestraße'),
	(97, 'Fanny-Lewald-Ring'),
	(98, 'Föhrenhorst 2'),
	(99, 'Föhrenhorst'),
	(100, 'Forum AutoVision'),
	(101, 'Gerta-Overbeck-Ring'),
	(102, 'Hageberg Brücke Sandkamp'),
	(103, 'Hageberg Düsseldorfer Straße'),
	(104, 'Hageberg Grauhorststraße'),
	(105, 'Hageberg Hagebuttenweg'),
	(106, 'Hageberg Herrenwiese'),
	(107, 'Hageberg Kölner Ring'),
	(108, 'Halberstädter Straße'),
	(109, 'Hansaplatz'),
	(110, 'Hattorf Bauboulevard'),
	(111, 'Hattorf Buchenberg'),
	(112, 'Hattorf Heiligendorfer Straße'),
	(113, 'Hattorf Kahlenberg'),
	(114, 'Hattorf Osterberg'),
	(115, 'Hattorf real im Heinenkamp'),
	(116, 'Hattorf'),
	(117, 'Hechtstraße'),
	(118, 'Hehlingen Almker Straße'),
	(119, 'Hehlingen Mühlengasse'),
	(120, 'Hehlingen Vorsfelder Straße'),
	(121, 'Heiligendorf Barnstorfer Straße'),
	(122, 'Heiligendorf Grüner Jäger'),
	(123, 'Heiligendorf Hasenmorgen'),
	(124, 'Heiligendorf Sportzentrum'),
	(125, 'Heiligendorf'),
	(126, 'Heinrich-Heine-Straße'),
	(127, 'Hellwinkelschule'),
	(128, 'Hochring'),
	(129, 'Hubertusstraße'),
	(130, 'Im Holze'),
	(131, 'Imperial'),
	(132, 'Karpfenstraße'),
	(133, 'Kästorf Bürozentrum Nord'),
	(134, 'Kästorf Holzkampe'),
	(135, 'Kästorf IT City Backend'),
	(136, 'Kästorf IT City Fronted'),
	(137, 'Kästorf IT-City'),
	(138, 'Kästorf Landleben'),
	(139, 'Kästorf Ost'),
	(140, 'Kästorf West'),
	(141, 'Kaufhof'),
	(142, 'Kiebitzweg'),
	(143, 'Klinikum'),
	(144, 'Köhlerbergstraße'),
	(145, 'Korntweete'),
	(146, 'Köterkamp'),
	(147, 'Krähenhoop'),
	(148, 'Kreuzheide Böcklinstraße'),
	(149, 'Kreuzheide Eintracht-Stadion'),
	(150, 'Kreuzheide Kandinskystraße'),
	(151, 'Kreuzheide Kraunsbusch'),
	(152, 'Kreuzheide Schulzentrum'),
	(153, 'Kreuzheide Süd'),
	(154, 'Kreuzkirche'),
	(155, 'Kunstmuseum'),
	(156, 'Laagberg Breslauer Straße'),
	(157, 'Laagberg Pauluskirche'),
	(158, 'Laagberg Sachsenring'),
	(159, 'Laagberg Samlandweg'),
	(160, 'Laagberg Schlesierweg'),
	(161, 'Laagberg Schützenhaus'),
	(162, 'Lönsstraße'),
	(163, 'Major-Hirst-Straße'),
	(164, 'Markuskirche'),
	(165, 'Mörse Altmarkring'),
	(166, 'Mörse Hattorfer Straße'),
	(167, 'Mörse Im Dorfe'),
	(168, 'Mörse'),
	(169, 'Mühlenberg'),
	(170, 'Mühlenpfad'),
	(171, 'Neindorf Bahnhof'),
	(172, 'Neindorf Schule'),
	(173, 'Neindorf'),
	(174, 'Nelly-Sachs-Straße'),
	(175, 'Neuhaus Burg'),
	(176, 'Neuhaus Thingplatz'),
	(177, 'Nordfriedhof Eingang'),
	(178, 'Nordfriedhof'),
	(179, 'Nordsteimke Hehlinger Straße'),
	(180, 'Nordsteimke Hohe Eichen'),
	(181, 'Nordsteimke Kalkbergweg'),
	(182, 'Nordsteimke Ost'),
	(183, 'Nordsteimke'),
	(184, 'Örtzestraße'),
	(185, 'Parkplatz Allerpark/Plazabrücke'),
	(186, 'Pestalozzischule'),
	(187, 'Piazza Italia'),
	(188, 'Rabenberg Am Stemmelteich'),
	(189, 'Rabenberg Barnstorfer Weg'),
	(190, 'Rabenberg Burgwall'),
	(191, 'Rabenberg Rabenbergstraße'),
	(192, 'Raumeholz'),
	(193, 'Reislingen Einkaufszentrum'),
	(194, 'Reislingen Hauptstraße'),
	(195, 'Reislingen Windberg'),
	(196, 'Saarstraße'),
	(197, 'Sandkamp Hallenbad'),
	(198, 'Sandkamp Kippenweg'),
	(199, 'Sandkamp'),
	(200, 'Sauerbruchstraße'),
	(201, 'Schachtweg'),
	(202, 'Schloss'),
	(203, 'Schubertring'),
	(204, 'Seerosenstraße'),
	(205, 'Seeteich'),
	(206, 'Seilerstraße'),
	(207, 'Semmelweisring'),
	(208, 'Stadtwaldstraße'),
	(209, 'Stadtwerke'),
	(210, 'Steimker Berg Emmausheim'),
	(211, 'Steimker Berg'),
	(212, 'Steinbeißerstraße'),
	(213, 'Stichlingstraße'),
	(214, 'Südstraße'),
	(215, 'Sülfeld Am Steinkamp'),
	(216, 'Sülfeld Denkmal'),
	(217, 'Sülfeld Großer Winkel'),
	(218, 'Sülfeld Schleusensiedlung'),
	(219, 'Sülfeld Vierherren'),
	(220, 'Sülfeld'),
	(221, 'Theater'),
	(222, 'Tucholskystraße'),
	(223, 'Tunnel West'),
	(224, 'Velstove Alte Handelsstraße'),
	(225, 'Velstove'),
	(226, 'VFL-Stadion'),
	(227, 'Vogelsang'),
	(228, 'Von-Ebner-Eschenbach-Ring'),
	(229, 'Vorsfelde Am Drömlingstadion'),
	(230, 'Vorsfelde Ernst-August-Straße'),
	(231, 'Vorsfelde Flockenweg'),
	(232, 'Vorsfelde Friedhof'),
	(233, 'Vorsfelde Im Eichholz'),
	(234, 'Vorsfelde Kanalbrücke'),
	(235, 'Vorsfelde Meinstraße'),
	(236, 'Vorsfelde Molkerei'),
	(237, 'Vorsfelde Moorbreite'),
	(238, 'Vorsfelde Mühlenbusch'),
	(239, 'Vorsfelde Mühlenweg'),
	(240, 'Vorsfelde Obere Tor'),
	(241, 'Vorsfelde Parkplatz Schulzentrum Eichholz'),
	(242, 'Vorsfelde Peterskamp'),
	(243, 'Vorsfelde Petruskirche Westseite'),
	(244, 'Vorsfelde Petruskirche'),
	(245, 'Vorsfelde Thorner Weg'),
	(246, 'Vorsfelde Ütschenpaul'),
	(247, 'Vorsfelde Zum Heidgarten'),
	(248, 'VW Ausbildungszentrum'),
	(249, 'VW-Bad'),
	(250, 'VW Design'),
	(251, 'VW Eingang 104'),
	(252, 'VW Eingang 111/Tor Südost'),
	(253, 'VW Eingang 46'),
	(254, 'VW Eingang 50a'),
	(255, 'VW Eingang 56'),
	(256, 'VW Eingang 63'),
	(257, 'VW Eingang 73'),
	(258, 'VW Eingang 88'),
	(259, 'VW Eingang 97'),
	(260, 'VW FE/Tor Nordwest'),
	(261, 'VW Gießerei'),
	(262, 'VW Halle 42'),
	(263, 'VW Halle 50'),
	(264, 'VW Halle 54'),
	(265, 'VW Halle 55'),
	(266, 'VW K-QS'),
	(267, 'VW LKW-Waage'),
	(268, 'VW Service-Akademie'),
	(269, 'VW Tor 17'),
	(270, 'VW Tor 6'),
	(271, 'VW Tor FE Haupteingang'),
	(272, 'VW Tor LKW-Einfahrt'),
	(273, 'VW Tor Ost'),
	(274, 'VW Tor Pappelallee'),
	(275, 'VW Tor Sandkamp'),
	(276, 'VW Tor West/Halle 103'),
	(277, 'VW Verwaltungshochhaus Nord'),
	(278, 'Waldfriedhof'),
	(279, 'Waldhof Mitte'),
	(280, 'Warmenau Birnbaumstücke'),
	(281, 'Warmenau Hannoversche Straße'),
	(282, 'Warmenau Ost'),
	(283, 'Warmenau'),
	(284, 'Wendschott Bergmannskamp'),
	(285, 'Wendschott Brechtorfer Straße'),
	(286, 'Wendschott Große Riehe'),
	(287, 'Wendschott Mitjätgensanger'),
	(288, 'Wendschott Schützenplatz'),
	(289, 'Wendschott Wildzähnecke'),
	(290, 'Wendschott Wippermühle'),
	(291, 'Wendschott'),
	(292, 'Wendschott Zum Rottenföhr'),
	(293, 'Wendschott Zur Wipperaller'),
	(294, 'Werderstraße'),
	(295, 'Westhagen Dessauer Straße'),
	(296, 'Westhagen Frankfurter Straße'),
	(297, 'Westhagen Hallesche Straße'),
	(298, 'Westhagen Jenaer Straße'),
	(299, 'Westhagen Stralsunder Ring'),
	(300, 'Westhagen Weimarer Straße'),
	(301, 'Wipperstraße'),
	(302, 'Wohltbergstraße'),
	(303, 'Wolfsburg Busbf'),
	(304, 'Wolfsburg-Fallersle.'),
	(305, 'Wolfsburg Feuerwehr'),
	(306, 'Wolfsburg Hauptbahnhof'),
	(307, 'Wolfsburg Hbf'),
	(308, 'Wolfsburg Rathaus'),
	(309, 'WVG'),
	(310, 'Zollstraße');
/*!40000 ALTER TABLE `haltestellen` ENABLE KEYS */;

-- Exportiere Struktur von View wvg_data.kunden
-- Erstelle temporäre Tabelle um View Abhängigkeiten zuvorzukommen
CREATE TABLE `kunden` (
	`NAME` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`Rufnummer` TEXT NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von Tabelle wvg_data.mitarbeiter
CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Exportiere Daten aus Tabelle wvg_data.mitarbeiter: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `mitarbeiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `mitarbeiter` ENABLE KEYS */;

-- Exportiere Struktur von Trigger wvg_data.VALIDATE_BUS_TIME
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `VALIDATE_BUS_TIME` BEFORE INSERT ON `buchungen` FOR EACH ROW BEGIN
DECLARE BUS_COUNTER INT(5);
DECLARE BUS INT(5);


-- Sind alle Busse für den Buchungszeitraum belegt? (intervall 1 Stunde)

SET BUS_COUNTER = (select count(*) from `Buchungen` where DATUM > (NEW.DATUM - INTERVAL 1 HOUR) and DATUM < (NEW.DATUM + INTERVAL 1 HOUR));

IF BUS_COUNTER = 0 THEN

	SET NEW.ID_BUS = 1;

ELSEIF BUS_COUNTER < 4 THEN

WHILE NEW.ID_BUS is NULL DO

SET NEW.ID_BUS = (select random_num from (select FLOOR(RAND()*(4-1+1)+1) as random_num from dual) q where random_num NOT IN (SELECT ID_BUS FROM `Buchungen` where DATUM > (NEW.DATUM - INTERVAL 1 HOUR) and DATUM < (NEW.DATUM + INTERVAL 1 HOUR)) limit 1);

END WHILE;

ELSE 

SET NEW.DATUM = (NEW.DATUM + INTERVAL 30 MINUTE);

SET NEW.ID_BUS = (select random_num from (select FLOOR(RAND()*(4-1+1)+1) as random_num from dual) q where random_num NOT IN (SELECT ID_BUS FROM `Buchungen` where DATUM > (NEW.DATUM - INTERVAL 60 MINUTE) and DATUM < (NEW.DATUM + INTERVAL 60 MINUTE)) limit 1);

	IF NEW.ID_BUS is NULL THEN

		SET NEW.ID_BUS = 0;
        SET NEW.DATUM = (NEW.DATUM - INTERVAL 30 MINUTE);
        
	END IF;
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Exportiere Struktur von View wvg_data.kunden
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `kunden`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `kunden` AS select distinct `Buchungen`.`Name` AS `NAME`,`Buchungen`.`Rufnummer` AS `Rufnummer` from `Buchungen` ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
