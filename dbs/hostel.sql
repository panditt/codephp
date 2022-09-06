-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2017 at 05:05 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hostel`
--
CREATE DATABASE IF NOT EXISTS `hostel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hostel`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auser` varchar(50) NOT NULL,
  `apass` varchar(50) NOT NULL,
  `marquee1` text NOT NULL,
  `colgname` varchar(99) NOT NULL,
  `colgintro` text NOT NULL,
  `footerinfo` varchar(50) NOT NULL,
  `abouthead` varchar(50) NOT NULL,
  `aboutinfo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `auser`, `apass`, `marquee1`, `colgname`, `colgintro`, `footerinfo`, `abouthead`, `aboutinfo`) VALUES
(1, 'admin', 'caf1a3dfb505ffed0d024130f58c5cfa', 'College Information', 'HINDU COLLEGE OF ENGINEERING', 'a pioneer educational Institute of Northern India, has been striving to provide quality higher education since 1990. Approved by AICTE and UGC, HINDU COLLEGE OF ENGINEERING has a sprawling multi-discipline campus, world class facilities and competent faculty, with prime focus on research and quality education. Creating a benchmark in the field of education, HINDU COLLEGE OF ENGINEERING aims to create proficient technocrats and future leaders with emphasis on overall development of personality imbibing core human values among students.', 'Copyright under 2015-2016', 'About Us', 'Our College  is dedicated to preparing students with the knowledge, skills and training needed for meaningful employment. Through education, we create opportunities, change lives and impact futures.</font><br> <h3><b>Our values</b></h3> <font size="+1">We are dedicated to preparing students for meaningful employment. We provide a quality education and learning environment. We embody integrity in everything we do. We believe in partnership with employers, students, graduates and our communities. We have pride in our students and are passionate about their success. We respect diversity and believe all people should have the opportunity to get an education and find meaningful employment. We believe in continuous improvement and exploring new ideas.</font><br> <h3><b>Who we are</b></h3> <font size="+1">ABC is the parent organization for XYZ College.  Since its inception, ABC has been a leader in career-focused education, meeting workforce needs for in-demand employment fields. As occupational challenges and opportunities are recognized, ABC develops new programs in cooperation with industry leaders to meet the needs of our students and graduates and of employers, as well.'),
(2, 'nitesh', '98d34c1758b15b5a359b69c2b08c5767', '', '', '', '', '', ''),
(3, 'nitesh11', 'goodforbad', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `mob` bigint(50) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `gender`, `mob`, `address`) VALUES
(26, 'neeraj', '3b3b8360f70b78bb4f6239078e636626', 'neeraj@gmail.com', 'm', 8800670473, ''),
(28, 'nishant', 'caf1a3dfb505ffed0d024130f58c5cfa', 'nishant@nishant.com', 'm', 9451626198, ''),
(30, 'test', '098f6bcd4621d373cade4e832627b4f6', 'test@tets.com', 'm', 9458822647, ''),
(31, 'test3', '8ad8757baa8564dc136c1e07507f4a98', 'test2@gmail.com', 'm', 9898789, 'tst test '),
(32, 'test0', '202cb962ac59075b964b07152d234b70', 'admin@gmail.com', 'f', 987897987, 'asndhasvd'),
(33, 'test123', '202cb962ac59075b964b07152d234b70', 'test2@gmail.com', 'm', 123, ''),
(34, 'ravi', '63dd3e154ca6d948fc380fa576343ba6', 'ravi@gmail.com', 'm', 901555555, 'delhi'),
(35, 'sanjeev', '98d34c1758b15b5a359b69c2b08c5767', 'sanjeevtech2@gmail.com', 'm', 9015501897, '141 delhi\r\ndhakka'),
(36, 'abhi', 'd76f3d05cc9ac98f1f9160274a39fe33', 'abhi@gmail.com', 'm', 9015501899, 'ddd9'),
(37, 'nitesh', 'bbf80c97fe25d69692d9e0ece52567ec', 'nitesh.parashar55@gmail.com', 'm', 8684859772, 'hownlalfjlkdjf'),
(38, 'NITESH', 'ROOT', 'DONE THE WORKLOAD', 'm', 8684859772, 'LKJLJLKJLKJLKJLJ'),
(39, 'NITESH PARASHAR', 'preetcuti', 'nitesh.parashar55@gmail.com', 'm', 85522222222222, 'J;LKAJLKJDLKJFJLKDOIHFEEWEKJHHIUH'),
(40, 'go with the word', '', 'nakldlkjlkfjdlkj@Gmai.com', 'm', 7942116, 'dhakjhfkjdkjfbkjadbsuib'),
(41, 'cool boy', 'luvupreeti', 'nitesh.parashar55@gmail.com', 'm', 554446434846, 'kjnskjjdfjhuih'),
(42, 'noni dahiya', 'daksh dahiya', 'noni@gmail.com', 'm', 9811050718, 'sunil dahiya,v.p.o. kheri manajat,sonipat-131001'),
(43, 'atul dajiya', 'please savewater', 'atuldahiya12@gmail.com', 'm', 8685876232, 'h.no. 104, v.p.o. kheri manajat, district- sonipat,hr-131103'),
(44, 'ranbir singh', 'preet father', 'nitesh.parashar55@gmail.com', 'm', 9991862594, 'h.no.358,gumar,ganaur,haryana'),
(45, 'root', 'GONE', 'sajave@bewafa.com', 'm', 0, 'jkljldajlkfkjj');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
