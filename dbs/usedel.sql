-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2017 at 05:02 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `usedel`
--
CREATE DATABASE IF NOT EXISTS `usedel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `usedel`;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `serial no.` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`serial no.`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`serial no.`, `name`, `email`, `subject`, `message`) VALUES
(1, 'nitesh', 'nitesh.parashar55@gmail.com', 'great job', 'that feel good to be bad\r\n'),
(2, '', '', '', ''),
(3, '', '', '', ''),
(4, '', '', '', ''),
(5, '', '', '', ''),
(6, '', '', '', ''),
(7, '', '', '', ''),
(8, '', '', '', ''),
(9, '', '', '', ''),
(10, '', '', '', ''),
(11, '', '', '', ''),
(12, '', '', '', ''),
(13, '', '', '', ''),
(14, '', '', '', ''),
(15, '', '', '', ''),
(16, '', '', '', ''),
(17, '', '', '', ''),
(18, '', '', '', ''),
(19, '', '', '', ''),
(20, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `myusers`
--

CREATE TABLE IF NOT EXISTS `myusers` (
  `serial no.` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `mobileno` bigint(56) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `age` varchar(3) DEFAULT NULL,
  `classtime` varchar(12) DEFAULT NULL,
  `purpose` varchar(18) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`serial no.`),
  UNIQUE KEY `serial no.` (`serial no.`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `myusers`
--

INSERT INTO `myusers` (`serial no.`, `name`, `email`, `mobileno`, `password`, `age`, `classtime`, `purpose`, `address`, `gender`) VALUES
(1, 'Nitesh', 'np96.com@gmail.com', 435788655466, 'something', '18', '7-8am', 'gain', '', 'male'),
(2, 'praveen', 'praveendahiya231996@gmaill.com', 8587875178, 'ektaranamanshi', '18', '5-6pm', 'leaning', '', 'male'),
(3, 'preeti', 'nitesh.parashar55@gmail.com', 9812508673, 'niteshparashar', '18', '6-7am', 'gain', '', 'female'),
(4, 'Nitesh', 'niiiiii@gman.com', 8684859772, 'preeti123', '15', '5-6am', 'loss', '', 'male'),
(9, 'Nitesh', 'myname@gmail.com', 8684859772, 'coding', '15', '5-6am', 'loss', '', 'male'),
(10, 'Nitesh', 'noni@gmail.com', 8684859772, 'codingiseverything', '16', '5-6am', 'loss', '', 'male'),
(13, 'patrakar', 'donno@gmail.com', 5556434322, 'passwordis', '16', '5-6am', 'loss', '', 'male'),
(15, 'nish', 'goto@gmail.com', 8684859772, 'donno', '16', '5-6am', 'loss', '', 'male'),
(16, 'hello', 'fine@gmail.com', 8684859772, 'ptanahi', '16', '5-6am', 'loss', '', 'male'),
(17, 'ranbir singh', 'ranbirgumar@gmail.com', 9991862594, 'sasurji', '58', '9-10am', 'hltmnt', 'house no. 358, v.p.o. gumar,ganaur,haryana', 'male'),
(18, 'preeti pahal parashar', 'preeti@gmail.com', 9812508673, 'preetiparashar', '19', '6-7am', 'gain', 'house no. 378,gumar,ganaur,haryana', 'female');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
