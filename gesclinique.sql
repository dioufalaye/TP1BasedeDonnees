-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 19 mai 2020 à 17:42
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gesclinique`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `NUMCHAMBRE` int(11) NOT NULL AUTO_INCREMENT,
  `CATCHAMBRE` varchar(25) DEFAULT NULL,
  `TYPECHAM` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NUMCHAMBRE`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`NUMCHAMBRE`, `CATCHAMBRE`, `TYPECHAM`) VALUES
(1, 'C1', 'T1'),
(2, 'C1', 'T1'),
(3, 'C1', 'T1'),
(4, 'C2', 'T3'),
(5, 'C2', 'T1'),
(6, 'C1', 'T3'),
(7, 'C2', 'T1'),
(8, 'C1', 'T1'),
(9, 'C1', 'T1'),
(10, 'C3', 'T3'),
(11, 'C1', 'T1'),
(12, 'C2', 'T2');

-- --------------------------------------------------------

--
-- Structure de la table `consulter`
--

DROP TABLE IF EXISTS `consulter`;
CREATE TABLE IF NOT EXISTS `consulter` (
  `NUMPATIENT` int(11) NOT NULL,
  `NUMMED` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`NUMPATIENT`,`NUMMED`),
  KEY `FK_CONSULTER` (`NUMMED`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `consulter`
--

INSERT INTO `consulter` (`NUMPATIENT`, `NUMMED`, `DATE`) VALUES
(1, 2, '2020-01-12'),
(2, 11, '2020-02-09'),
(14, 11, '2019-10-14'),
(14, 3, '2019-12-28');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `IDDEP` int(11) NOT NULL AUTO_INCREMENT,
  `NOMDEP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IDDEP`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`IDDEP`, `NOMDEP`) VALUES
(1, 'D1'),
(2, 'D2'),
(3, 'D3'),
(4, 'D4'),
(5, 'D5'),
(6, 'D1'),
(7, 'D2'),
(8, 'D3'),
(9, 'D4'),
(10, 'D5');

-- --------------------------------------------------------

--
-- Structure de la table `feuille`
--

DROP TABLE IF EXISTS `feuille`;
CREATE TABLE IF NOT EXISTS `feuille` (
  `NUMFEUILLE` int(11) NOT NULL,
  `NUMPATIENT` int(11) NOT NULL,
  `IDDEP` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `ETAT` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`NUMFEUILLE`),
  KEY `FK_DELIBERER` (`IDDEP`),
  KEY `FK_DISPOSER` (`NUMPATIENT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `feuille`
--

INSERT INTO `feuille` (`NUMFEUILLE`, `NUMPATIENT`, `IDDEP`, `DATE`, `ETAT`) VALUES
(11, 2, 2, '2019-09-09', 'stable');

-- --------------------------------------------------------

--
-- Structure de la table `interner`
--

DROP TABLE IF EXISTS `interner`;
CREATE TABLE IF NOT EXISTS `interner` (
  `NUMPATIENT` int(11) NOT NULL,
  `IDDEP` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`NUMPATIENT`,`IDDEP`),
  KEY `FK_INTERNER` (`IDDEP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `interner`
--

INSERT INTO `interner` (`NUMPATIENT`, `IDDEP`, `DATE`) VALUES
(14, 2, '2020-01-05'),
(14, 3, '2020-01-05'),
(7, 3, '2018-11-18'),
(4, 1, '2020-01-12'),
(5, 2, '2020-06-03');

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

DROP TABLE IF EXISTS `lit`;
CREATE TABLE IF NOT EXISTS `lit` (
  `IDLIT` int(11) NOT NULL AUTO_INCREMENT,
  `NUMCHAMBRE` int(11) NOT NULL,
  PRIMARY KEY (`IDLIT`),
  KEY `FK_SETROUVER` (`NUMCHAMBRE`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`IDLIT`, `NUMCHAMBRE`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 2),
(8, 3),
(21, 3);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `NUMMED` int(11) NOT NULL AUTO_INCREMENT,
  `IDDEP` int(11) NOT NULL,
  `NOMMED` varchar(25) DEFAULT NULL,
  `SPECIALITE` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NUMMED`),
  KEY `FK_AFFECTER` (`IDDEP`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`NUMMED`, `IDDEP`, `NOMMED`, `SPECIALITE`) VALUES
(1, 1, 'M1', 'S1'),
(2, 1, 'M2', 'S1'),
(3, 2, 'M2', 'S3'),
(4, 2, 'M4', 'S1'),
(5, 3, 'M1', 'S3'),
(6, 1, 'M1', 'S1'),
(7, 1, 'M2', 'S1'),
(8, 2, 'M2', 'S3'),
(9, 2, 'M4', 'S1'),
(10, 3, 'M1', 'S3'),
(11, 1, 'M3', 'S2');

-- --------------------------------------------------------

--
-- Structure de la table `occuper`
--

DROP TABLE IF EXISTS `occuper`;
CREATE TABLE IF NOT EXISTS `occuper` (
  `NUMPATIENT` int(11) NOT NULL,
  `IDLIT` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  PRIMARY KEY (`NUMPATIENT`) USING BTREE,
  KEY `FK_OCCUPER` (`IDLIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `occuper`
--

INSERT INTO `occuper` (`NUMPATIENT`, `IDLIT`, `DATE`) VALUES
(1, 2, '2020-05-24'),
(3, 2, '2020-01-19'),
(4, 2, '2018-04-08'),
(14, 21, '2020-04-19'),
(2, 1, '2020-03-10');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `NUMPATIENT` int(11) NOT NULL AUTO_INCREMENT,
  `NOMPATIENT` varchar(50) DEFAULT NULL,
  `ADRESSE` varchar(50) DEFAULT NULL,
  `SEXE` varchar(15) DEFAULT NULL,
  `DATENAISS` date DEFAULT NULL,
  `LIEUNAISS` longtext DEFAULT NULL,
  PRIMARY KEY (`NUMPATIENT`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`NUMPATIENT`, `NOMPATIENT`, `ADRESSE`, `SEXE`, `DATENAISS`, `LIEUNAISS`) VALUES
(1, 'P1', 'DAkar', 'feminin', '2019-07-15', 'soprim'),
(2, 'P2', 'SOTRAC', 'masculin', '2019-12-22', 'thies\r\n\r\n'),
(3, 'P1', 'DAkar', 'feminin', '2013-07-15', 'soprim'),
(4, 'P2', 'SOTRAC', 'masculin', '2019-12-22', 'thies'),
(5, 'P3', 'DAkar', 'feminin', '2011-01-01', 'TAMBA'),
(6, 'P3', 'SOTRAC', 'feminin', '2013-12-22', 'thies'),
(7, 'P4', 'DAkar', 'feminin', '2000-07-15', 'soprim'),
(8, 'P3', 'SOTRAC', 'masculin', '2007-12-22', 'thies'),
(9, 'P5', 'DAkar', 'feminin', '1990-07-15', 'soprim'),
(10, 'P6', 'SOTRAC', 'masculin', '2019-12-22', 'thies'),
(11, 'P7', 'DAkar', 'feminin', '2019-07-15', 'TATAGUINE'),
(12, 'P8', 'SOTRAC', 'masculin', '2019-12-25', 'PARCELle'),
(13, 'P17', 'SEBIKHOTANE', 'MASCULIN', '2012-04-22', 'NORD FOIRE'),
(14, 'P17', 'SEBIKHOTANE', 'MASCULIN', '2012-04-22', 'NORD FOIRE'),
(15, 'AICHA', 'SOPRIM', 'feminin', '2020-05-08', 'soprim');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
