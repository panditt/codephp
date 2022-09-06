-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2017 at 05:06 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hosteler`
--
CREATE DATABASE IF NOT EXISTS `hosteler` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hosteler`;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_assets`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=55 ;

--
-- Dumping data for table `bak_wjrcv_assets`
--

INSERT INTO `bak_wjrcv_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 103, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 20, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 21, 22, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 23, 24, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 25, 26, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 27, 28, 1, 'com_login', 'com_login', '{}'),
(13, 1, 29, 30, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 31, 32, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 33, 34, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 35, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 72, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 73, 76, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 77, 78, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 79, 80, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 81, 82, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 83, 84, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 85, 88, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 89, 90, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 74, 75, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 86, 87, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 91, 92, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 93, 94, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 95, 96, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 97, 98, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 99, 100, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 101, 102, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 42, 43, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 18, 44, 45, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 46, 47, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 48, 49, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 50, 51, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 52, 53, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 54, 55, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 56, 57, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 58, 59, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 60, 61, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 62, 63, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 64, 65, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 66, 67, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 18, 68, 69, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 70, 71, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 16, 36, 37, 2, 'com_menus.menu.1', 'Main Menu', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_associations`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_banners`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_banner_clients`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_categories`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bak_wjrcv_categories`
--

INSERT INTO `bak_wjrcv_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_contact_details`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_content`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_content_rating`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_content_types`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `bak_wjrcv_content_types`
--

INSERT INTO `bak_wjrcv_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_extensions`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=803 ;

--
-- Dumping data for table `bak_wjrcv_extensions`
--

INSERT INTO `bak_wjrcv_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '', '{"template_positions_display":"0","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 'plg_installer_folderinstaller', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 'plg_installer_urlinstaller', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 'English (United Kingdom)', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_filters`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bak_wjrcv_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `bak_wjrcv_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_assets`
--

CREATE TABLE IF NOT EXISTS `wjrcv_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `wjrcv_assets`
--

INSERT INTO `wjrcv_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 119, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 20, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 21, 22, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 23, 24, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 25, 26, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 27, 28, 1, 'com_login', 'com_login', '{}'),
(13, 1, 29, 30, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 31, 32, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 33, 34, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 35, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 82, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 83, 86, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 87, 88, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 89, 90, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 91, 92, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 93, 94, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 95, 98, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 99, 100, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 84, 85, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 96, 97, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 101, 102, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 103, 104, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 105, 106, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 107, 108, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 109, 110, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 111, 112, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 42, 43, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(40, 18, 44, 45, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 46, 47, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 48, 49, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 50, 51, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 52, 53, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 54, 55, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 56, 57, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 58, 59, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 60, 61, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 62, 63, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 64, 65, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 66, 67, 2, 'com_modules.module.17', 'about', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 18, 68, 69, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 70, 71, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 16, 36, 37, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 1, 113, 114, 1, 'com_sellacious', 'com_sellacious', '{}'),
(56, 18, 72, 73, 2, 'com_modules.module.87', 'Frontend Currency', '{}'),
(57, 18, 74, 75, 2, 'com_modules.module.88', 'Sellacious Shopping Cart', '{}'),
(58, 1, 115, 116, 1, 'com_goodspack', 'COM_GOODSPACK', '{}'),
(59, 1, 117, 118, 1, 'com_ecwid', 'Ecwid', '{}'),
(60, 18, 76, 77, 2, 'com_modules.module.89', 'Ecwid Categories Module', '{}'),
(61, 18, 78, 79, 2, 'com_modules.module.90', 'Ecwid Mini-cart Module', '{}'),
(62, 18, 80, 81, 2, 'com_modules.module.91', 'Ecwid Search Module', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_associations`
--

CREATE TABLE IF NOT EXISTS `wjrcv_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_banners`
--

CREATE TABLE IF NOT EXISTS `wjrcv_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_banner_clients`
--

CREATE TABLE IF NOT EXISTS `wjrcv_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `wjrcv_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_categories`
--

CREATE TABLE IF NOT EXISTS `wjrcv_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `wjrcv_categories`
--

INSERT INTO `wjrcv_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 235, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 235, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 235, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 235, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 235, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 235, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_contact_details`
--

CREATE TABLE IF NOT EXISTS `wjrcv_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if contact is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_content`
--

CREATE TABLE IF NOT EXISTS `wjrcv_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `wjrcv_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `wjrcv_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_content_rating`
--

CREATE TABLE IF NOT EXISTS `wjrcv_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_content_types`
--

CREATE TABLE IF NOT EXISTS `wjrcv_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wjrcv_content_types`
--

INSERT INTO `wjrcv_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `wjrcv_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_extensions`
--

CREATE TABLE IF NOT EXISTS `wjrcv_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=817 ;

--
-- Dumping data for table `wjrcv_extensions`
--

INSERT INTO `wjrcv_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0","upload_limit":"10","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"LIB_PHPUTF8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"LIB_JOOMLA","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"13ff27c902f3accfd0bf99d404212d95"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"LIB_IDNA","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"LIB_PHPASS","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.18.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2016","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.4.3","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `wjrcv_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 1, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(452, 'plg_system_updatenotification', 'plugin', 'updatenotification', 'system', 0, 1, 1, 0, '{"name":"plg_system_updatenotification","type":"plugin","creationDate":"May 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION","group":"","filename":"updatenotification"}', '{"lastrun":1490152952}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(453, 'plg_editors-xtd_module', 'plugin', 'module', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_module","type":"plugin","creationDate":"October 2015","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_MODULE_XML_DESCRIPTION","group":"","filename":"module"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(454, 'plg_system_stats', 'plugin', 'stats', 'system', 0, 1, 1, 0, '{"name":"plg_system_stats","type":"plugin","creationDate":"November 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"PLG_SYSTEM_STATS_XML_DESCRIPTION","group":"","filename":"stats"}', '{"mode":3,"lastrun":1480283949,"unique_id":"e8c2e58ef676eda80b8d6882e40c9dad36b6289e","interval":12}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"packageinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_FOLDERINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"folderinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_URLINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"urlinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.4","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.4","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"October 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.4","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.4.1","description":"en-GB language pack","group":"","filename":"pkg_en-GB"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(803, 'jPeople', 'template', 'jpeople', '', 0, 1, 1, 0, '{"name":"jPeople","type":"template","creationDate":"01-10-2016","author":"xs","copyright":"2016","authorEmail":"","authorUrl":"http:\\/\\/www.xswebdesign.com","version":"1.0.0","description":"\\n\\n<b>How to enable this template?<\\/b>\\n<p>1) <a href=\\"..\\/administrator\\/index.php?option=com_templates\\">Go to the Template Manager<\\/a> (In the menu: Extensions > Templates) and make this template the default one.<\\/p>\\n<p>2) Click the name of the template in the template manager to see all template options.<\\/p>\\n<p>This is a free template. You can use the template on commercial websites as well, but please leave the author links intact.<\\/p>\\n\\n","group":"","filename":"templateDetails"}', '{"logotype":"image","sitetitle":"Site Name","slogandisable":"1","slogan":"Custom slogan","footerdisable":"1","socialdisable":"1","facebook":"http:\\/\\/www.facebook.com\\/YOURFANPAGE","twitter":"http:\\/\\/www.twitter.com\\/YOURFANPAGE","gplus":"https:\\/\\/plus.google.com\\/YOURPAGE","mail":"mailto:you@example.com?Subject=Hello","footertext":"Custom text here","analyticsdisable":"1","googleanalytics":"UA-1111111-22","jscroll":"1","slidehome":"1","NumberOfSlides":"4","slidedesc1":"Description slide 1","slidedesc2":"Description slide 2","slidedesc3":"Description slide 3","slidedesc4":"Description slide 4","slidedesc5":"Description slide 5","slidedesc6":"Description slide 6","slidedesc7":"Description slide 7","slidedesc8":"Description slide 8"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(804, 'com_sellacious', 'component', 'com_sellacious', '', 1, 1, 0, 0, '{"name":"com_sellacious","type":"component","creationDate":"December 26, 2016","author":"Izhar Aazmi","copyright":"Copyright (C) 2016 Bhartiy Web Technologies. All rights reserved.","authorEmail":"info@bhartiy.com","authorUrl":"www.bhartiy.com","version":"1.4.4","description":"COM_SELLACIOUS_XML_DESCRIPTION","group":"","filename":"sellacious"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(805, 'mod_usercurrency', 'module', 'mod_usercurrency', '', 0, 1, 0, 0, '{"name":"mod_usercurrency","type":"module","creationDate":"July 2015","author":"Izhar Aazmi","copyright":"Copyright (C) 2016 Bhartiy Web Technologies. All rights reserved.","authorEmail":"info@bhartiy.org","authorUrl":"www.joomla.org","version":"1.3.3","description":"MOD_USERCURRENCY_XML_DESCRIPTION","group":"","filename":"mod_usercurrency"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(806, 'mod_sellacious_cart', 'module', 'mod_sellacious_cart', '', 0, 1, 0, 0, '{"name":"mod_sellacious_cart","type":"module","creationDate":"October 28, 2016","author":"Bhavika Matariya","copyright":"Copyright (C) 2016 Bhartiy Web Technologies. All rights reserved.","authorEmail":"info@bhartiy.com","authorUrl":"www.bhartiy.com","version":"1.4.1","description":"MOD_SELLACIOUS_CART_DESC","group":"","filename":"mod_sellacious_cart"}', '{"class_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(807, 'Sellacious Package', 'package', 'pkg_sellacious', '', 0, 1, 1, 0, '{"name":"Sellacious Package","type":"package","creationDate":"December 31, 2016","author":"Bhartiy Web Technologies","copyright":"","authorEmail":"","authorUrl":"","version":"1.4.4","description":"\\n\\t\\tThis will install entire sellacious e-commerce software on your Joomla website.\\n\\t","group":"","filename":"pkg_sellacious"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(808, 'VM Image Zoom', 'plugin', 'imagezoom', 'system', 0, 0, 1, 0, '{"name":"VM Image Zoom","type":"plugin","creationDate":"August 2015","author":"Ranker Infotech","copyright":"Copyright (c) 2015 ImageZoom. All rights reserved.","authorEmail":"tumbiabdul@gmail.com","authorUrl":"http:\\/\\/rankerinfotech.com","version":"1.0.0","description":"\\n\\t\\n\\n\\t\\n\\t","group":"","filename":"imagezoom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(809, 'COM_GOODSPACK', 'component', 'com_goodspack', '', 1, 1, 0, 0, '{"name":"COM_GOODSPACK","type":"component","creationDate":"2016-01-05","author":"UkrSolution","copyright":"(C) 2015 - UkrSolution","authorEmail":"ukrsolution@gmail.com","authorUrl":"https:\\/\\/www.ukrsolution.com","version":"1.0.1","description":"COM_GOODSPACK_DESCRIPTION","group":"","filename":"manifest"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(811, 'Ecwid', 'component', 'com_ecwid', '', 1, 1, 0, 0, '{"name":"Ecwid","type":"component","creationDate":"Nov 2, 2016","author":"Ecwid, Inc","copyright":"(C) 2009 - 2016 Ecwid, Inc.","authorEmail":"support@ecwid.com","authorUrl":"http:\\/\\/www.ecwid.com","version":"2.3","description":"\\n        Ecwid offers the performance and flexibility you need, with none of the hassles you don''t.\\n    ","group":"","filename":"ecwid"}', '{"ecwidInstallDate":1490157901}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(812, 'System - Ecwid', 'plugin', 'ecwid', 'system', 0, 1, 1, 0, '{"name":"System - Ecwid","type":"plugin","creationDate":"Nov 2, 2016","author":"Ecwid, Inc","copyright":"(C) 2009 - 2016 Ecwid, Inc.","authorEmail":"support@ecwid.com","authorUrl":"http:\\/\\/www.ecwid.com","version":"2.3","description":"Support Plugin for Ecwid","group":"","filename":"ecwid"}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(813, 'Ecwid Categories Module', 'module', 'mod_ecwid_categories', '', 0, 1, 1, 0, '{"name":"Ecwid Categories Module","type":"module","creationDate":"Nov 2, 2016","author":"Ecwid, Inc","copyright":"(C) 2009 - 2016 Ecwid, Inc.","authorEmail":"support@ecwid.com","authorUrl":"http:\\/\\/www.ecwid.com","version":"2.3","description":"Module to show the Ecwid store categories","group":"","filename":"mod_ecwid_categories"}', '{"categoryLayout":"xVCategories"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(814, 'Ecwid Mini-cart Module', 'module', 'mod_ecwid_minicart', '', 0, 1, 1, 0, '{"name":"Ecwid Mini-cart Module","type":"module","creationDate":"Nov 2, 2016","author":"Ecwid, Inc","copyright":"(C) 2009 - 2016 Ecwid, Inc.","authorEmail":"support@ecwid.com","authorUrl":"http:\\/\\/www.ecwid.com","version":"2.3","description":"Module to show the Ecwid mini-cart","group":"","filename":"mod_ecwid_minicart"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(815, 'Ecwid Search Module', 'module', 'mod_ecwid_search', '', 0, 1, 1, 0, '{"name":"Ecwid Search Module","type":"module","creationDate":"Nov 2, 2016","author":"Ecwid, Inc","copyright":"(C) 2009 - 2016 Ecwid, Inc.","authorEmail":"support@ecwid.com","authorUrl":"http:\\/\\/www.ecwid.com","version":"2.3","description":"Module to show the Ecwid Search module","group":"","filename":"mod_ecwid_search"}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(816, '', 'package', 'pkg_ecwid', '', 0, 1, 1, 0, '{"name":"Ecwid shopping cart package","type":"package","creationDate":"Nov 2, 2016","author":"Ecwid, Inc","copyright":"(C) 2009 - 2016 Ecwid, Inc.","authorEmail":"support@ecwid.com","authorUrl":"http:\\/\\/www.ecwid.com","version":"2.3","description":"Ecwid Shopping Cart Extensions Package","group":"","filename":"pkg_ecwid"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_filters`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_finder_taxonomy`
--

INSERT INTO `wjrcv_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_terms`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wjrcv_finder_terms_common`
--

INSERT INTO `wjrcv_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_finder_types`
--

CREATE TABLE IF NOT EXISTS `wjrcv_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wjrcv_finder_types`
--

INSERT INTO `wjrcv_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Tag', ''),
(2, 'Category', ''),
(3, 'Contact', ''),
(4, 'Article', ''),
(5, 'News Feed', '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_languages`
--

CREATE TABLE IF NOT EXISTS `wjrcv_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_languages`
--

INSERT INTO `wjrcv_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_menu`
--

CREATE TABLE IF NOT EXISTS `wjrcv_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=110 ;

--
-- Dumping data for table `wjrcv_menu`
--

INSERT INTO `wjrcv_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 59, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 29, 30, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 31, 32, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 33, 34, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 35, 36, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 37, 38, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 39, 40, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 41, 42, 1, '*', 0),
(102, 'main', 'COM_SELLACIOUS', 'com-sellacious', '', 'com-sellacious', 'index.php?option=com_sellacious', 'component', 0, 1, 1, 804, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 43, 44, 0, '', 1),
(103, 'main', 'COM_GOODSPACK_MENU', 'com-goodspack-menu', '', 'com-goodspack-menu', 'index.php?option=com_goodspack', 'component', 0, 1, 1, 809, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 45, 46, 0, '', 1),
(104, 'main', 'COM_ECWID', 'com-ecwid', '', 'com-ecwid', 'index.php?option=com_ecwid', 'component', 0, 1, 1, 811, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_ecwid/assets/images/ecwid_16.png', 0, '{}', 47, 54, 0, '', 1),
(105, 'main', 'COM_ECWID_GENERAL_SETTINGS', 'com-ecwid-general-settings', '', 'com-ecwid/com-ecwid-general-settings', 'index.php?option=com_ecwid', 'component', 0, 104, 2, 811, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 48, 49, 0, '', 1),
(106, 'main', 'COM_ECWID_APPEARANCE_SETTINGS', 'com-ecwid-appearance-settings', '', 'com-ecwid/com-ecwid-appearance-settings', 'index.php?option=com_ecwid&layout=appearance', 'component', 0, 104, 2, 811, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 50, 51, 0, '', 1),
(107, 'main', 'COM_ECWID_ADVANCED_SETTINGS', 'com-ecwid-advanced-settings', '', 'com-ecwid/com-ecwid-advanced-settings', 'index.php?option=com_ecwid&layout=advanced', 'component', 0, 104, 2, 811, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 52, 53, 0, '', 1),
(108, 'mainmenu', 'contacts', 'contacts', '', 'contacts', 'index.php?option=com_contact&view=featured', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_pagination_limit":"","show_headings":"","show_position_headings":"","show_email_headings":"","show_telephone_headings":"","show_mobile_headings":"","show_fax_headings":"","show_suburb_headings":"","show_state_headings":"","show_country_headings":"","show_pagination":"","show_pagination_results":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","articles_display_num":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"menu_show":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 55, 56, 0, '*', 0),
(109, 'mainmenu', 'about', 'about', '', 'about', '', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu-anchor_rel":"","menu_image":"","menu_text":1,"menu_show":1}', 57, 58, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_menu_types`
--

CREATE TABLE IF NOT EXISTS `wjrcv_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_menu_types`
--

INSERT INTO `wjrcv_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_messages`
--

CREATE TABLE IF NOT EXISTS `wjrcv_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `wjrcv_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_modules`
--

CREATE TABLE IF NOT EXISTS `wjrcv_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=92 ;

--
-- Dumping data for table `wjrcv_modules`
--

INSERT INTO `wjrcv_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '2017-03-22 04:57:18', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(17, 51, 'about', '', '', 1, 'position-9', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"I","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"0","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, 'en-GB'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 56, 'Frontend Currency', '', '', 0, '', 0, '0000-00-00 00:00:00', '2017-03-22 04:57:37', '0000-00-00 00:00:00', 1, 'mod_usercurrency', 1, 1, '', 0, '*'),
(88, 57, 'Sellacious Shopping Cart', '', '', 0, '', 0, '0000-00-00 00:00:00', '2017-03-22 04:57:34', '0000-00-00 00:00:00', 1, 'mod_sellacious_cart', 1, 1, '', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_modules_menu`
--

CREATE TABLE IF NOT EXISTS `wjrcv_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wjrcv_modules_menu`
--

INSERT INTO `wjrcv_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `wjrcv_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_overrider`
--

CREATE TABLE IF NOT EXISTS `wjrcv_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `wjrcv_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wjrcv_postinstall_messages`
--

INSERT INTO `wjrcv_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 700, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
(4, 700, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_redirect_links`
--

CREATE TABLE IF NOT EXISTS `wjrcv_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_schemas`
--

CREATE TABLE IF NOT EXISTS `wjrcv_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wjrcv_schemas`
--

INSERT INTO `wjrcv_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.6.3-2016-08-16'),
(804, '1.4.4');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_addresses`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `district` varchar(150) NOT NULL,
  `landmark` varchar(150) NOT NULL,
  `country` varchar(100) NOT NULL,
  `state_loc` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `state` int(11) NOT NULL,
  `company` varchar(200) NOT NULL,
  `po_box` varchar(50) NOT NULL,
  `residential` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_cart`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ship_quotes` text NOT NULL,
  `ship_quote_id` varchar(50) NOT NULL,
  `remote_ip` varchar(64) NOT NULL COMMENT 'most recent accessed from ipv4 or ipv6',
  `token` varchar(100) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_cart_info`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_cart_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `billing` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `ship_quotes` text NOT NULL,
  `ship_quote_id` varchar(100) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `payment_params` text NOT NULL,
  `shipment_params` text NOT NULL,
  `currency` varchar(5) NOT NULL,
  `coupon` varchar(100) NOT NULL,
  `cart_hash` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_categories`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `introtext` text NOT NULL,
  `description` text NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `path` varchar(500) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL,
  `mfr_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `compare` tinyint(1) NOT NULL,
  `usergroups` varchar(250) NOT NULL,
  `ledgergroup` int(11) NOT NULL,
  `seller_commission` varchar(50) NOT NULL,
  `commission` varchar(200) NOT NULL,
  `core_fields` text NOT NULL,
  `variant_fields` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

--
-- Dumping data for table `wjrcv_sellacious_categories`
--

INSERT INTO `wjrcv_sellacious_categories` (`id`, `title`, `alias`, `introtext`, `description`, `parent_id`, `level`, `path`, `state`, `lft`, `rgt`, `mfr_id`, `type`, `is_default`, `compare`, `usergroups`, `ledgergroup`, `seller_commission`, `commission`, `core_fields`, `variant_fields`, `created`, `created_by`, `modified`, `modified_by`, `params`) VALUES
(1, 'ROOT', 'root', '', '', 0, 0, '', 1, 0, 211, 0, '', 0, 0, '0', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(2, 'Default E-Product Category', 'default-e-product-category', '', '', 1, 1, 'default-e-product-category', 1, 1, 2, 0, 'product/electronic', 1, 1, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["41"]', '["3"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(3, 'Default Product Category', 'default-product-category', '', '', 1, 1, 'default-product-category', 1, 3, 4, 0, 'product/physical', 1, 1, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["41"]', '["3"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(4, 'Computers and Accessories', 'computers-and-accessories', '', '', 1, 1, 'computers-and-accessories', 1, 5, 40, 0, 'product/physical', 0, 1, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["41"]', '["3"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(5, 'Laptops', 'laptops', '', '', 4, 2, 'computers-and-accessories/laptops', 1, 6, 17, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["7","9","279","293","24","453","276","14","16","443"]', '["247","401","11","432","449","12","456","458","457","286","285","287","10","240","283","282","281","459","20","299","22","292","23","123","452","17","19","18","15","451","450","226","26","462","213","28","461"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(6, 'Dell', 'dell', '', '', 5, 3, 'computers-and-accessories/laptops/dell', 1, 11, 12, 0, 'product/physical', 0, 1, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(7, 'Toshiba', 'toshiba34', '', '', 5, 3, 'computers-and-accessories/laptops/toshiba34', 1, 7, 8, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["247"]', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(8, 'Thinkpads', 'thinkpads', '', '', 5, 3, 'computers-and-accessories/laptops/thinkpads', 1, 13, 14, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(9, 'Apple', 'apple', '', '', 5, 3, 'computers-and-accessories/laptops/apple', 1, 9, 10, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(10, 'Pendrives', 'pendrives', '', '', 4, 2, 'computers-and-accessories/pendrives', 1, 18, 25, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["7","443"]', '["266","57","13","25","265"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(12, 'HP', 'hp', '', '', 10, 3, 'computers-and-accessories/pendrives/hp', 1, 19, 20, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(13, 'SanDisk', 'sandisk', '', '', 10, 3, 'computers-and-accessories/pendrives/sandisk', 1, 23, 24, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["206","267","7","11","25","265","55","57","8","264","266","269","259","261","260"]', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(14, 'Kingston', 'kingston', '', '', 10, 3, 'computers-and-accessories/pendrives/kingston', 1, 21, 22, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(15, 'Camera', 'camera', '', '<p>Due to the optical properties of photographic lenses, only objects within a limited range of distances from the camera will be reproduced clearly. The process of adjusting this range is known as changing the camera''s focus. There are various ways of focusing a camera accurately. The simplest cameras have fixed focus and use a small aperture and wide-angle lens to ensure that everything within a certain range of distance from the lens, usually around 3 metres (10 ft) to infinity, is in reasonable focus. Fixed focus cameras are usually inexpensive types, such as single-use cameras. The camera can also have a limited focusing range or scale-focus that is indicated on the camera body. The user will guess or calculate the distance to the subject and adjust the focus accordingly. On some cameras this is indicated by symbols (head-and-shoulders; two people standing upright; one tree; mountains).</p>\r\n<p>Rangefinder cameras allow the distance to objects to be measured by means of a coupled parallax unit on top of the camera, allowing the focus to be set with accuracy. Single-lens reflex cameras allow the photographer to determine the focus and composition visually using the objective lens and a moving mirror to project the image onto a ground glass or plastic micro-prism screen.</p>\r\n<p>Twin-lens reflex cameras use an objective lens and a focusing lens unit (usually identical to the objective lens.) in a parallel body for composition and focusing. View cameras use a ground glass screen which is removed and replaced by either a photographic plate or a reusable holder containing sheet film before exposure. Modern cameras often offer autofocus systems to focus the camera automatically by a variety of methods.</p>', 1, 1, 'camera', 1, 41, 52, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["106","110","96","89","92","91","88","100","90","98","71","68","7","99","95","443"]', '["78","80","77","79","327","81","350","341","346","339","347","348","340","349","338","344","337","345","311","309","106","108","302","109","113","110","301","112","105","303","111","107","87","67","69","70","307","305","130","131","116","117","115","247","253","449","55","471","473","468","465","464","469","474","467","470","472","13","394","328","85","83","84"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(16, 'Point and Shoot', 'point-and-shoot', '', '', 15, 2, 'camera/point-and-shoot', 1, 50, 51, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(17, 'Digital SLR', 'digital-slr', '', '', 15, 2, 'camera/digital-slr', 1, 42, 43, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(18, 'Digital Camera', 'digital-camera', '', '', 15, 2, 'camera/digital-camera', 1, 46, 47, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(19, 'Nikon', 'nikon', '', '', 15, 2, 'camera/nikon', 1, 44, 45, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(20, 'Canon', 'canon', '', '', 15, 2, 'camera/canon', 1, 48, 49, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(21, 'Camera Accessories', 'camera-accessories', '', '', 1, 1, 'camera-accessories', 1, 53, 60, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["7"]', '["431","106","108","302","109","113","110","301","112","105","303","111","107","25","436"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(22, 'Lenses', 'lenses', '', '', 21, 2, 'camera-accessories/lenses', 1, 54, 55, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(23, 'Memory Cards', 'memory-cards', '', '', 21, 2, 'camera-accessories/memory-cards', 1, 56, 57, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(24, 'Camera Bags', 'camera-bags', '', '', 21, 2, 'camera-accessories/camera-bags', 1, 58, 59, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(25, 'Mobiles', 'mobiles', '', '', 1, 1, 'mobiles', 1, 61, 82, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["7","192","279","283","282","23","200","199","201","276","146","207","150","319","322","445","444","446","443"]', '["351","353","352","291","13","20","197","196","193","262","23","123","155","221","210","211","451","118","124","462","213","214","153"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(26, 'Android Phones', 'android-phones', '', '', 25, 2, 'mobiles/android-phones', 1, 64, 75, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(27, 'Windows Phones', 'windows-phones', '', '', 25, 2, 'mobiles/windows-phones', 1, 76, 79, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(28, 'S40 Phones', 's40-phones', '', '', 25, 2, 'mobiles/s40-phones', 1, 62, 63, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(29, 'S60 Phones', 's60-phones', '', '', 25, 2, 'mobiles/s60-phones', 1, 80, 81, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(30, 'Samsung', 'samsung', '', '', 26, 3, 'mobiles/android-phones/samsung', 1, 65, 66, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["127","129","131","128","130","132","118","120","122","7","124","13","119","121","123","8","125","62","139","141","143","145","147","149","151","140","142","144","146","148","134","136","135","137","153","103","152","154"]', '["131","132","124"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(31, 'HTC', 'htc', '', '', 26, 3, 'mobiles/android-phones/htc', 1, 67, 68, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["127","129","131","132","130","236","118","120","122","7","124","13","121","123","8","139","141","145","151","140","142","144","146","134","136","135"]', '["205","193","262"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(32, 'Micromax', 'micromax', '', '', 26, 3, 'mobiles/android-phones/micromax', 1, 69, 70, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(33, 'Lava', 'lava', '', '', 26, 3, 'mobiles/android-phones/lava', 1, 71, 72, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(34, 'Nokia', 'nokia', '', '', 27, 3, 'mobiles/windows-phones/nokia', 1, 77, 78, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(35, 'Men', 'men', '', '', 1, 1, 'men', 1, 83, 188, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(36, 'Clothing', 'clothing', '', '', 35, 2, 'men/clothing', 1, 84, 101, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["188","389","7"]', '["360","364","159","161","362","361","157","189"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(37, 'T-Shirts', 't-shirts', '', '', 36, 3, 'men/clothing/t-shirts', 1, 85, 86, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["167","163","165","164","158","160","161","157","159"]', '["157","159"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(38, 'Casual & Party wearing shirts', 'casual-party-wearing-shirts', '', '', 36, 3, 'men/clothing/casual-party-wearing-shirts', 1, 87, 88, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(39, 'Formal Shirts', 'formal-shirts', '', '', 36, 3, 'men/clothing/formal-shirts', 1, 89, 90, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(40, 'Cargo, Jeans & 3/4ths', 'cargo-jeans-3-4ths', '', '', 36, 3, 'men/clothing/cargo-jeans-3-4ths', 1, 91, 92, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(41, 'Trousers', 'trousers', '', '', 36, 3, 'men/clothing/trousers', 1, 93, 94, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(42, 'Winter Wears', 'winter-wears', '', '', 36, 3, 'men/clothing/winter-wears', 1, 95, 96, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(43, 'Inner & Sleep Wear', 'inner-sleep-wear', '', '', 36, 3, 'men/clothing/inner-sleep-wear', 1, 97, 98, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(44, 'Sports Wears', 'sports-wears', '', '', 36, 3, 'men/clothing/sports-wears', 1, 99, 100, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(46, 'Footwears', 'footwears', '', '', 35, 2, 'men/footwears', 1, 102, 119, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["188","370","7"]', '["189","369","367","373","368","371","374","372","375","432","187"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(47, 'Casual Shoes', 'casual-shoes', '', '', 46, 3, 'men/footwears/casual-shoes', 1, 103, 104, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(48, 'Sports Shoes', 'sports-shoes', '', '', 46, 3, 'men/footwears/sports-shoes', 1, 105, 106, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(49, 'Formal Shoes', 'formal-shoes', '', '', 46, 3, 'men/footwears/formal-shoes', 1, 107, 108, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(50, 'Sandals & Floaters', 'sandals-floaters', '', '', 46, 3, 'men/footwears/sandals-floaters', 1, 109, 110, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(51, 'Flip-Flops & Slippers', 'flip-flops-slippers', '', '', 46, 3, 'men/footwears/flip-flops-slippers', 1, 111, 112, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(52, 'Sneakers', 'sneakers', '', '', 46, 3, 'men/footwears/sneakers', 1, 113, 114, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(53, 'Loafers', 'loafers', '', '', 46, 3, 'men/footwears/loafers', 1, 115, 116, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(54, 'Running Shoes', 'running-shoes', '', '', 46, 3, 'men/footwears/running-shoes', 1, 117, 118, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(55, 'Watches', 'watches', '', '', 35, 2, 'men/watches', 1, 120, 141, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["188","389","7","55","443","173","180","179","181","385"]', '["189","11","187","381","185","177","184","178","186","378"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(56, 'FastTrack', 'fasttrack', '', '', 55, 3, 'men/watches/fasttrack', 1, 123, 124, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(57, 'Casio', 'casio', '', '', 55, 3, 'men/watches/casio', 1, 121, 122, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["167","177","179","181","183","185","178","180","182","184","186","175","176","174","171","173","172","9","189","188","190","55"]', '["185","175","176"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(58, 'Titan', 'titan', '', '', 55, 3, 'men/watches/titan', 1, 125, 126, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(59, 'Fossil', 'fossil', '', '', 55, 3, 'men/watches/fossil', 1, 127, 128, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(60, 'Tommy-Hilfiger', 'tommy-hilfiger', '', '', 55, 3, 'men/watches/tommy-hilfiger', 1, 129, 130, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(61, 'Timex', 'timex', '', '', 55, 3, 'men/watches/timex', 1, 131, 132, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(62, 'Maxima', 'maxima', '', '', 55, 3, 'men/watches/maxima', 1, 133, 134, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(63, 'Q&Q', 'q-q', '', '', 55, 3, 'men/watches/q-q', 1, 135, 136, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(64, 'Citizen', 'citizen', '', '', 55, 3, 'men/watches/citizen', 1, 137, 138, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(65, 'Sunglasses', 'sunglasses', '', '', 35, 2, 'men/sunglasses', 1, 142, 149, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["188","7","265"]', '["189","187","440","438","437","435","436","439","183","184","179","379","181"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(66, 'Aviator', 'aviator', '', '', 65, 3, 'men/sunglasses/aviator', 1, 143, 144, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(67, 'Wayfarer', 'wayfarer', '', '', 65, 3, 'men/sunglasses/wayfarer', 1, 145, 146, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(68, 'Rectangular', 'rectangular', '', '', 65, 3, 'men/sunglasses/rectangular', 1, 147, 148, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(69, 'Bags', 'bags', '', '', 35, 2, 'men/bags', 1, 150, 159, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["188","7"]', '["431","189","389","433","11","432","187"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(70, 'BagPacks', 'bagpacks', '', '', 69, 3, 'men/bags/bagpacks', 1, 151, 152, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(71, 'Laptop Bags', 'laptop-bags', '', '', 69, 3, 'men/bags/laptop-bags', 1, 153, 154, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(72, 'Messanger Bags', 'messanger-bags', '', '', 69, 3, 'men/bags/messanger-bags', 1, 155, 156, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(73, 'Hand Bags', 'hand-bags', '', '', 69, 3, 'men/bags/hand-bags', 1, 157, 158, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(74, 'Belts', 'belts', '', '', 35, 2, 'men/belts', 1, 160, 161, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(75, 'Wallets', 'wallets', '', '', 35, 2, 'men/wallets', 1, 162, 163, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["188","7"]', '["189","389","433","11","432","187"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(76, 'Premium Pens', 'premium-pens', '', '', 35, 2, 'men/premium-pens', 1, 164, 165, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(77, 'Grooming', 'grooming', '', '', 35, 2, 'men/grooming', 1, 166, 181, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '["7","413","416"]', '["189","377","415","412","411","414","423","419","426","418","428","427","429"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(78, 'Perfumes', 'perfumes', '', '', 77, 3, 'men/grooming/perfumes', 1, 167, 168, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(79, 'Deodrants', 'deodrants', '', '', 77, 3, 'men/grooming/deodrants', 1, 169, 170, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(80, 'Shaving', 'shaving', '', '', 77, 3, 'men/grooming/shaving', 1, 171, 172, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(81, 'Skin', 'skin', '', '', 77, 3, 'men/grooming/skin', 1, 173, 174, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(82, 'Hair Care', 'hair-care', '', '', 77, 3, 'men/grooming/hair-care', 1, 175, 176, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(83, 'Bath & Spa', 'bath-spa', '', '', 77, 3, 'men/grooming/bath-spa', 1, 177, 178, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(84, 'Personal care Applications', 'personal-care-applications', '', '', 77, 3, 'men/grooming/personal-care-applications', 1, 179, 180, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(85, 'Wellness', 'wellness', '', '', 35, 2, 'men/wellness', 1, 182, 187, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(86, 'Oral Care', 'oral-care', '', '', 85, 3, 'men/wellness/oral-care', 1, 183, 184, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(87, 'Halth care Devices', 'halth-care-devices', '', '', 85, 3, 'men/wellness/halth-care-devices', 1, 185, 186, 0, 'product/physical', 0, 0, '0', 0, '', '{"onsale":"","onsalereturn":"","onsale_franchise":"","onsalereturn_franchise":""}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(88, 'Default Client Category', 'default-client', '', '<p>Default Client Category</p>', 1, 1, 'default-client', 1, 189, 190, 0, 'client', 1, 0, '["2"]', 31, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(89, 'Default Staff Category', 'default-seller', '', '<p>Default Staff Category</p>', 1, 1, 'default-seller', 1, 191, 192, 0, 'staff', 1, 0, '["6"]', 20, '', '{"onsale":"0.00","onsalereturn":"0.00"}', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(90, 'Default Seller Category', 'default-seller-category', '', '<p>test </p>', 1, 1, 'default-seller-category', 1, 193, 194, 0, 'seller', 1, 0, '["3"]', 27, '15.00', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(100, 'Default Manufacturer', 'default-manufacturer', '', '<p>Default Manufacturer</p>', 1, 1, 'default-manufacturer', 1, 195, 196, 0, 'manufacturer', 1, 0, '["2"]', 27, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0'),
(103, 'E-Books', 'e-books', '', '<p>e-books here!</p>', 1, 1, 'e-books', 1, 209, 210, 0, 'product/electronic', 0, 0, '', 0, '', '', '["480"]', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(107, 'Tablets', 'tablets', '', '', 4, 2, 'computers-and-accessories/tablets', 1, 26, 39, 0, 'product/physical', 0, 1, '', 0, '', '', '["127","7","200","199","123","141","146","150","14","203","202","322","260"]', '["7","13","20","197","196","193","262","35","23","394","155","118","121","124","153"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(108, 'Lenovo', 'lenovo', '', '', 107, 3, 'computers-and-accessories/tablets/lenovo', 1, 27, 28, 0, 'product/physical', 0, 1, '', 0, '', '', '["194","192","193"]', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(109, 'Asus', 'asus', '', '', 107, 3, 'computers-and-accessories/tablets/asus', 1, 29, 30, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(110, 'iBall', 'iball', '', '', 107, 3, 'computers-and-accessories/tablets/iball', 1, 31, 32, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(111, 'Dell', 'dell', '', '', 107, 3, 'computers-and-accessories/tablets/dell', 1, 33, 34, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(112, 'Samsung', 'samsung', '', '', 107, 3, 'computers-and-accessories/tablets/samsung', 1, 35, 36, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(113, 'HP', 'hp', '', '', 107, 3, 'computers-and-accessories/tablets/hp', 1, 37, 38, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(114, 'Television', 'television', '', '', 1, 1, 'television', 1, 197, 208, 0, 'product/physical', 0, 1, '', 0, '', '', '["7","226","407","211","228","242","243","445","444","446","443"]', '["249","245","247","246","256","252","405","403","251","253","254","255","257","448","447","441","232","230","229","231","221","211","224","239","234","398","442","237","400","320","222"]', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(115, 'LG', 'lg', '', '', 114, 2, 'television/lg', 1, 198, 199, 0, 'product/physical', 0, 1, '', 0, '', '', '["229","230","232","7","221","223","225","227","8","222","224","226","219","260","259","261"]', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(116, 'Samsung', 'samsung', '', '', 114, 2, 'television/samsung', 1, 200, 201, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(117, 'Sony', 'sony', '', '', 114, 2, 'television/sony', 1, 202, 203, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(118, 'Sansui', 'sansui', '', '', 114, 2, 'television/sansui', 1, 204, 205, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(119, 'Panasonic', 'panasonic', '', '', 114, 2, 'television/panasonic', 1, 206, 207, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(120, 'HP', 'hp', '', '', 5, 3, 'computers-and-accessories/laptops/hp', 1, 15, 16, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(121, 'Wall Clocks', 'wall-clocks', '', '', 55, 3, 'men/watches/wall-clocks', 1, 139, 140, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(122, 'Lenovo', 'lenovo', '', '', 26, 3, 'mobiles/android-phones/lenovo', 1, 73, 74, 0, 'product/physical', 0, 1, '', 0, '', '', '', '', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_category_types`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_category_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`state`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `wjrcv_sellacious_category_types`
--

INSERT INTO `wjrcv_sellacious_category_types` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `description`, `state`, `params`) VALUES
(1, 0, 0, 19, 0, '', 'ROOT', 'root', '', 1, ''),
(2, 1, 1, 10, 1, 'product', 'Product', 'product', 'Categories of the products in this company', 1, ''),
(3, 1, 11, 12, 1, 'staff', 'Staff', 'staff', 'All user categories with staff access to the company', 1, ''),
(4, 1, 13, 14, 1, 'client', 'Client', 'client', 'All user categories of the shoppers/clients of the company', 1, ''),
(5, 1, 15, 16, 1, 'seller', 'Seller', 'seller', 'All user categories of the sellers of the company', 1, ''),
(6, 1, 17, 18, 1, 'manufacturer', 'Manufacturer', 'manufacturer', 'All user categories of the manufacturers listed with this company', 1, ''),
(8, 2, 2, 3, 2, 'product/physical', 'Physical Product', 'physical', '', 1, ''),
(9, 2, 4, 5, 2, 'product/electronic', 'Electronic Product', 'electronic', '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_cities`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(20) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_clients`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `client_type` varchar(50) NOT NULL,
  `org_reg_no` varchar(50) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_client_authorised`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_client_authorised` (
  `client_uid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `client_uid` (`client_uid`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_client_types`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_client_types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `client_type` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `wjrcv_sellacious_client_types`
--

INSERT INTO `wjrcv_sellacious_client_types` (`id`, `client_type`, `title`, `description`, `state`) VALUES
(1, 'individual', 'Individual', '', 1),
(2, 'business', 'Business', '', 1),
(3, 'group', 'Group', '', 1),
(4, 'org', 'Non Profit Organization', '', 1),
(5, 'govt', 'Government', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_config`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(100) NOT NULL,
  `subcontext` varchar(100) NOT NULL COMMENT 'e.g. - seller.42 (for a seller''s settings for that extension)',
  `params` text NOT NULL,
  `state` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_sellacious_config`
--

INSERT INTO `wjrcv_sellacious_config` (`id`, `context`, `subcontext`, `params`, `state`, `ordering`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'com_sellacious', 'core', '{"multi_seller":"0","multi_variant":"2","pricing_model":"basic","allowed_product_type":"both","allowed_product_package":"1","product_rating":"1","product_detail_page":"1","product_compare":"1","allow_checkout":"1","allow_duplicate_location":"0","compare_limit":"6","redirect":"index.php","contact_spam_protection":"1","product_filter_position":"right","financial_year_start":"4","forex_update_interval":{"l":"3650","p":"day"},"development":"","shop_name":"My Shop","shop_logo":"","shop_address":"11, Kaveri Enclave - 2,Swarn Jayanti Nagar, Ramghat Road,Aligarh - 202001 (UP)","shop_country":"","shop_phone1":"+1-000-000-0000","shop_phone2":"+1-000-000-0000","shop_email":"contact@sellacious.com","shop_website":"www.sellacious.com\\/shop","shopping_more_redirect":"","shopping_complete_redirect":"","global_currency":"USD","user_currency":"0","ip_currency":"0","eproduct_image_watermark":"","purchase_return":"2","purchase_return_icon":"","purchase_return_icon_global":"","purchase_return_tnc":"<p>At <strong>Our Shop<\\/strong>, we understand how much you value your every purchase. And we are committed to making your shopping experience with us as delightful as possible.<\\/p><p>Therefore, in the rare event that you are not fully satisfied with what you ordered, just return it to us. You can conveniently initiate the return online from your order''s page. We will ensure you get a resolution as quickly as possible. Our Returns policy may vary slightly depending on the product or seller.<\\/p><p>We assure you that all products sold on <strong>Our Shop<\\/strong> are brand new and 100% genuine. In case the product you received is ''Damaged'', ''Defective'' or ''Not as Described'', our Friendly Returns policy has got you covered.<\\/p><p>Possible resolution could be Replacement, Exchange or Refund in case we are unable to provide a Replacement\\/Exchange. All this is backed by the 30 Day Return Guarantee.<\\/p><p>In any case, all your purchases on <strong>Our Shop<\\/strong> are backed by Buyer Protection for 45 days from the date of delivery, in case you face any issues.<\\/p>","purchase_exchange":"2","purchase_exchange_icon":"","purchase_exchange_icon_global":"","purchase_exchange_tnc":"<p>At <strong>Our Shop<\\/strong>, we understand how much you value your every purchase. And we are committed to making your shopping experience with us as delightful as possible.<\\/p><p>Therefore, in the rare event that you are not fully satisfied with what you ordered, just return it to us. You can conveniently initiate the return online from your order''s page. We will ensure you get a resolution as quickly as possible. Our Returns policy may vary slightly depending on the product or seller.<\\/p><p>We assure you that all products sold on <strong>Our Shop<\\/strong> are brand new and 100% genuine. In case the product you received is ''Damaged'', ''Defective'' or ''Not as Described'', our Friendly Returns policy has got you covered.<\\/p><p>Possible resolution could be Replacement, Exchange or Refund in case we are unable to provide a Replacement\\/Exchange. All this is backed by the 30 Day Return Guarantee.<\\/p><p>In any case, all your purchases on <strong>Our Shop<\\/strong> are backed by Buyer Protection for 45 days from the date of delivery, in case you face any issues.<\\/p><p>u00a0<\\/p><p><strong>Replacement<\\/strong><\\/p><div><p>If you have received an item in a ''Damaged'' or ''Defective'' condition, or it is ''Not as Described'' by the Seller, you may request a replacement at no extra cost. Return Policy is Seller specific and terms may differ. Please check the respective Seller''s policy when buying or before initiating a return for a replacement.<br \\/><br \\/>Replacement is subject to availability of stock with the Seller. If the product is out of stock, you will receive a full refund, no questions asked.<\\/p><\\/div><div>u00a0<\\/div><div><strong>Exchange<\\/strong><\\/div><p>u00a0<\\/p><p>If you are not satisfied with the Clothing and Footwear item delivered, you can request an exchange in a different size or color. All this again, at no extra cost to you. Be sure to check the Seller''s Return Policy when buying or before initiating a return for exchange.<br \\/><br \\/>Exchange is subject to availability of stock with the Seller. If the product is out of stock, you will receive a full refund, no questions asked.<\\/p>","splcategory_badge_display":["categories","products","product","product_modal"],"product_features_list":["categories","products","product","product_modal"],"product_rating_display":["categories","products","product","product_modal"],"product_compare_display":["categories","products","product","product_modal"],"product_add_to_cart_display":["categories","products","product","product_modal"],"product_buy_now_display":["categories","products","product","product_modal"],"product_quick_detail_pages":["categories","products"],"product_price_display":"2","product_price_display_pages":["categories","products","product","product_modal"],"show_category_child_count":"1","show_category_product_count":"1","show_category_description":"1","show_category_products":"1","category_page_product_limit":"5","image_slider_height":"270","image_slider_width":"270","image_slider_size_adjust":"0","list_style":"grid","list_style_switcher":"1","hide_out_of_stock":"0","geolocation_levels":["country","state_loc","zip","landmark"],"usergroups_company":["7"],"usergroups_client":["2"],"usergroups_seller":["3"],"usergroups_staff":["6"],"new_usertype":"2","useractivation":"1","require_activation_cart_aio":"0","seller_country":"","default_seller":"256","seller_can_know_client_category":"0","listing_currency":"0","on_sale_commission":"0.00%","free_listing":"1","listing_fee":"0.25","listing_fee_recurrence":"5","seller_tnc":"0","allowed_price_display":["0","1","2","3"],"query_form_recipient":"3","shipment_itemised":"0","shipped_by":"shop","flat_shipping":"1","shipping_flat_fee":"20.00","shippable_location_by_seller":"1","tax_on_shipping":"0","shipping_address_line1":"","shipping_address_line2":"","shipping_address_line3":"","shipping_country":"","shipping_state":"","shipping_district":"","shipping_zip":"","ship_to_country":"","ship_to_state":"","ship_to_district":"","ship_to_zip":"","bill_to_country":"","bill_to_state":"","bill_to_district":"","bill_to_zip":"","allow_guest_ratings":"1","allow_non_buyer_ratings":"1","show_reviewer_badge":"1","allow_ratings_for":["product","seller","packaging","shipment"],"allow_review_for":["product","seller"]}', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_countries`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `iso2` varchar(5) NOT NULL,
  `iso3` varchar(5) NOT NULL,
  `num` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_coupons`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `alias` varchar(250) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `per_user_limit` int(11) NOT NULL DEFAULT '0',
  `coupon_code` varchar(30) NOT NULL,
  `total_limit` int(11) NOT NULL DEFAULT '0',
  `discount_amount` varchar(30) NOT NULL,
  `min_purchase` decimal(10,2) NOT NULL,
  `max_discount` decimal(10,2) NOT NULL,
  `max_discount_total` decimal(10,2) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  `publish_up` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_coupon_usage`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_coupon_usage` (
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_currencies`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `code_2` varchar(2) NOT NULL,
  `code_3` varchar(3) NOT NULL,
  `code_n` int(4) NOT NULL,
  `symbol` varchar(4) NOT NULL,
  `decimal_places` varchar(4) NOT NULL,
  `decimal_sep` varchar(4) NOT NULL,
  `thousand_sep` varchar(4) NOT NULL,
  `format_pos` varchar(25) NOT NULL,
  `format_neg` varchar(25) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `wjrcv_sellacious_currencies`
--

INSERT INTO `wjrcv_sellacious_currencies` (`id`, `title`, `alias`, `code_2`, `code_3`, `code_n`, `symbol`, `decimal_places`, `decimal_sep`, `thousand_sep`, `format_pos`, `format_neg`, `ordering`, `state`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'United Arab Emirates dirham', '', '', 'AED', 784, 'د.إ', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, 'Albanian lek', '', '', 'ALL', 8, 'Lek', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(3, 'Netherlands Antillean gulden', '', '', 'ANG', 532, 'ƒ', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(4, 'Argentine peso', '', '', 'ARS', 32, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(5, 'Australian dollar', '', '', 'AUD', 36, '$', '2', '.', ',', '{symbol} {number}', '{sign}{symbol} {number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(6, 'Aruban florin', '', '', 'AWG', 533, 'ƒ', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(7, 'Barbadian dollar', '', '', 'BBD', 52, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(8, 'Bangladeshi taka', '', '', 'BDT', 50, '৳', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(9, 'Bahraini dinar', '', '', 'BHD', 48, 'ب.د', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(10, 'Burundian franc', '', '', 'BIF', 108, 'Fr', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(11, 'Bermudian dollar', '', '', 'BMD', 60, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(12, 'Brunei dollar', '', '', 'BND', 96, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(13, 'Bolivian boliviano', '', '', 'BOB', 68, '$b', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(14, 'Brazilian real', '', '', 'BRL', 986, 'R$', '2', ',', '.', '{symbol} {number}', '{symbol} {sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(15, 'Bahamian dollar', '', '', 'BSD', 44, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(16, 'Bhutanese ngultrum', '', '', 'BTN', 64, 'BTN', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(17, 'Botswana pula', '', '', 'BWP', 72, 'P', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(18, 'Belize dollar', '', '', 'BZD', 84, 'BZ$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(19, 'Canadian dollar', '', '', 'CAD', 124, '$', '2', '.', ',', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(20, 'Swiss franc', '', '', 'CHF', 756, 'CHF', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(21, 'Unidad de Fomento', '', '', 'CLF', 990, 'CLF', '0', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(22, 'Chilean peso', '', '', 'CLP', 152, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(23, 'Chinese renminbi yuan', '', '', 'CNY', 156, '元', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(24, 'Colombian peso', '', '', 'COP', 170, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(25, 'Costa Rican colón', '', '', 'CRC', 188, '₡', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(26, 'Czech koruna', '', '', 'CZK', 203, 'Kč', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(27, 'Cuban peso', '', '', 'CUP', 192, '₱', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(28, 'Cape Verdean escudo', '', '', 'CVE', 132, '$', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(29, 'Danish krone', '', '', 'DKK', 208, 'kr', '2', '.', ',', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(30, 'Dominican peso', '', '', 'DOP', 214, 'RD$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(31, 'Algerian dinar', '', '', 'DZD', 12, 'د.ج', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(32, 'Egyptian pound', '', '', 'EGP', 818, '£', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(33, 'Ethiopian birr', '', '', 'ETB', 230, 'ETB', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(34, 'Euro', '', '', 'EUR', 978, '€', '2', ',', '.', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(35, 'Fijian dollar', '', '', 'FJD', 242, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(36, 'Falkland pound', '', '', 'FKP', 238, '£', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(37, 'British pound', '', '', 'GBP', 826, '£', '2', '.', ',', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(38, 'Gibraltar pound', '', '', 'GIP', 292, '£', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(39, 'Gambian dalasi', '', '', 'GMD', 270, 'D', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(40, 'Guinean franc', '', '', 'GNF', 324, 'Fr', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(41, 'Guatemalan quetzal', '', '', 'GTQ', 320, 'Q', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(42, 'Guyanese dollar', '', '', 'GYD', 328, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(43, 'Hong Kong dollar', '', '', 'HKD', 344, '元', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(44, 'Honduran lempira', '', '', 'HNL', 340, 'L', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(45, 'Haitian gourde', '', '', 'HTG', 332, 'G', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(46, 'Hungarian forint', '', '', 'HUF', 348, 'Ft', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(47, 'Indonesian rupiah', '', '', 'IDR', 360, 'Rp', '0', '', '', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(48, 'Israeli new sheqel', '', '', 'ILS', 376, '₪', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(49, 'Indian rupee', '', '', 'INR', 356, '₹', '2', '.', ',', '{symbol} {number}', '{symbol} {sign}{number} ', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(50, 'Iraqi dinar', '', '', 'IQD', 368, 'ع.د', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(51, 'Iranian rial', '', '', 'IRR', 364, '﷼', '2', ',', '', '{number} {symbol}', '{sign}{number}{symb0l}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(52, 'Jamaican dollar', '', '', 'JMD', 388, 'J$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(53, 'Jordanian dinar', '', '', 'JOD', 400, 'د.ا', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(54, 'Japanese yen', '', '', 'JPY', 392, '¥', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(55, 'Kenyan shilling', '', '', 'KES', 404, 'Sh', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(56, 'Cambodian riel', '', '', 'KHR', 116, '៛', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(57, 'Comorian franc', '', '', 'KMF', 174, 'Fr', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(58, 'North Korean won', '', '', 'KPW', 408, '₩', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(59, 'South Korean won', '', '', 'KRW', 410, '₩', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(60, 'Kuwaiti dinar', '', '', 'KWD', 414, 'د.ك', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(61, 'Cayman Islands dollar', '', '', 'KYD', 136, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(62, 'Lao kip', '', '', 'LAK', 418, '₭', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(63, 'Lebanese pound', '', '', 'LBP', 422, '£', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(64, 'Sri Lankan rupee', '', '', 'LKR', 144, '₨', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(65, 'Liberian dollar', '', '', 'LRD', 430, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(66, 'Lesotho loti', '', '', 'LSL', 426, 'L', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(67, 'Libyan dinar', '', '', 'LYD', 434, 'ل.د', '3', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(68, 'Moroccan dirham', '', '', 'MAD', 504, 'د.م.', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(69, 'Mongolian tögrög', '', '', 'MNT', 496, '₮', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(70, 'Macanese pataca', '', '', 'MOP', 446, 'P', '1', ',', '', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(71, 'Mauritanian ouguiya', '', '', 'MRO', 478, 'UM', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(72, 'Mauritian rupee', '', '', 'MUR', 480, '₨', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(73, 'Maldivian rufiyaa', '', '', 'MVR', 462, 'ރ.', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(74, 'Malawian kwacha', '', '', 'MWK', 454, 'MK', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(75, 'Malaysian ringgit', '', '', 'MYR', 458, 'RM', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(76, 'Nigerian naira', '', '', 'NGN', 566, '₦', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(77, 'Norwegian krone', '', '', 'NOK', 578, 'kr', '2', ',', '', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(78, 'Nepalese rupee', '', '', 'NPR', 524, '₨', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(79, 'New Zealand dollar', '', '', 'NZD', 554, '$', '2', ',', '', '{number} {symbol}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(80, 'Omani rial', '', '', 'OMR', 512, '﷼', '3', '.', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(81, 'Panamanian balboa', '', '', 'PAB', 590, 'B/.', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(82, 'Peruvian nuevo sol', '', '', 'PEN', 604, 'S/.', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(83, 'Papua New Guinean kina', '', '', 'PGK', 598, 'K', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(84, 'Philippine peso', '', '', 'PHP', 608, '₱', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(85, 'Pakistani rupee', '', '', 'PKR', 586, '₨', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(86, 'Polish Złoty', '', '', 'PLN', 985, 'zł', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(87, 'Paraguayan guaraní', '', '', 'PYG', 600, '₲', '0', '', '.', '{symbol} {number}', '{symbol} {sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(88, 'Qatari riyal', '', '', 'QAR', 634, '﷼', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(89, 'Romanian leu', '', '', 'RON', 946, 'lei', '2', ',', '.', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(90, 'Rwandan franc', '', '', 'RWF', 646, 'Fr', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(91, 'Saudi riyal', '', '', 'SAR', 682, '﷼', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(92, 'Solomon Islands dollar', '', '', 'SBD', 90, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(93, 'Seychellois rupee', '', '', 'SCR', 690, '₨', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(94, 'Swedish krona', '', '', 'SEK', 752, 'kr', '2', ',', '.', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(95, 'Singapore dollar', '', '', 'SGD', 702, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(96, 'Saint Helenian pound', '', '', 'SHP', 654, '£', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(97, 'Sierra Leonean leone', '', '', 'SLL', 694, 'Le', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(98, 'Somali shilling', '', '', 'SOS', 706, 'S', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(99, 'São Tomé and Príncipe dobra', '', '', 'STD', 678, 'Db', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(100, 'Russian ruble', '', '', 'RUB', 643, 'руб', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(101, 'Salvadoran colón', '', '', 'SVC', 222, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(102, 'Syrian pound', '', '', 'SYP', 760, '£', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(103, 'Swazi lilangeni', '', '', 'SZL', 748, 'L', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(104, 'Thai baht', '', '', 'THB', 764, '฿', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(105, 'Tunisian dinar', '', '', 'TND', 788, 'د.ت', '3', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(106, 'Tongan paʻanga', '', '', 'TOP', 776, 'T$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(107, 'Turkish new lira', '', '', 'TRY', 949, 'YTL', '2', ',', '.', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(108, 'Trinidad and Tobago dollar', '', '', 'TTD', 780, 'TT$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(109, 'New Taiwan dollar', '', '', 'TWD', 901, 'NT$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(110, 'Tanzanian shilling', '', '', 'TZS', 834, 'Sh', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(111, 'United States dollar', '', '', 'USD', 840, '$', '2', '.', ',', '{symbol}{number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(112, 'Vietnamese Dong', '', '', 'VND', 704, '₫', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(113, 'Vanuatu vatu', '', '', 'VUV', 548, 'Vt', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(114, 'Samoan tala', '', '', 'WST', 882, 'T', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(115, 'Yemeni rial', '', '', 'YER', 886, '﷼', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(116, 'Serbian dinar', '', '', 'RSD', 941, 'Дин.', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(117, 'South African rand', '', '', 'ZAR', 710, 'R', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(118, 'Zambian kwacha', '', '', 'ZMK', 894, 'ZK', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(119, 'Zimbabwean dollar', '', '', 'ZWD', 932, 'Z$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(120, 'Armenian dram', '', '', 'AMD', 51, 'դր.', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(121, 'Myanmar kyat', '', '', 'MMK', 104, 'K', '2', ',', '', '{number} {symbol}', '{symbol} {sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(122, 'Croatian kuna', '', '', 'HRK', 191, 'kn', '2', ',', '.', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(123, 'Eritrean nakfa', '', '', 'ERN', 232, 'Nfk', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(124, 'Djiboutian franc', '', '', 'DJF', 262, 'Fr', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(125, 'Icelandic króna', '', '', 'ISK', 352, 'kr', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(126, 'Kazakhstani tenge', '', '', 'KZT', 398, 'лв', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(127, 'Kyrgyzstani som', '', '', 'KGS', 417, 'лв', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(128, 'Latvian lats', '', '', 'LVL', 428, 'Ls', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(129, 'Lithuanian litas', '', '', 'LTL', 440, 'Lt', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(130, 'Mexican peso', '', '', 'MXN', 484, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(131, 'Moldovan leu', '', '', 'MDL', 498, 'L', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(132, 'Namibian dollar', '', '', 'NAD', 516, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(133, 'Nicaraguan córdoba', '', '', 'NIO', 558, 'C$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(134, 'Ugandan shilling', '', '', 'UGX', 800, 'Sh', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(135, 'Macedonian denar', '', '', 'MKD', 807, 'ден', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(136, 'Uruguayan peso', '', '', 'UYU', 858, '$', '0', '', '', '{symbol}number}', '{symbol}{sign}{number}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(137, 'Uzbekistani som', '', '', 'UZS', 860, 'лв', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(138, 'Azerbaijani manat', '', '', 'AZN', 934, 'ман', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(139, 'Ghanaian cedi', '', '', 'GHS', 936, '₵', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(140, 'Venezuelan bolívar', '', '', 'VEF', 937, 'Bs', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(141, 'Sudanese pound', '', '', 'SDG', 938, '£', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(142, 'Uruguay Peso', '', '', 'UYI', 940, 'UYI', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(143, 'Mozambican metical', '', '', 'MZN', 943, 'MT', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(144, 'WIR Euro', '', '', 'CHE', 947, '€', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(145, 'WIR Franc', '', '', 'CHW', 948, 'CHW', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(146, 'Central African CFA franc', '', '', 'XAF', 950, 'Fr', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(147, 'East Caribbean dollar', '', '', 'XCD', 951, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(148, 'West African CFA franc', '', '', 'XOF', 952, 'Fr', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(149, 'CFP franc', '', '', 'XPF', 953, 'Fr', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(150, 'Surinamese dollar', '', '', 'SRD', 968, '$', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(151, 'Malagasy ariary', '', '', 'MGA', 969, 'MGA', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(152, 'Unidad de Valor Real', '', '', 'COU', 970, 'COU', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(153, 'Afghan afghani', '', '', 'AFN', 971, '؋', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(154, 'Tajikistani somoni', '', '', 'TJS', 972, 'ЅМ', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(155, 'Angolan kwanza', '', '', 'AOA', 973, 'Kz', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(156, 'Belarusian ruble', '', '', 'BYR', 974, 'p.', '0', '', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(157, 'Bulgarian lev', '', '', 'BGN', 975, 'лв', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(158, 'Congolese franc', '', '', 'CDF', 976, 'Fr', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(159, 'Bosnia and Herzegovina convert', '', '', 'BAM', 977, 'KM', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(160, 'Mexican Unid', '', '', 'MXV', 979, 'MXV', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(161, 'Ukrainian hryvnia', '', '', 'UAH', 980, '₴', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(162, 'Georgian lari', '', '', 'GEL', 981, 'ლ', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(163, 'Mvdol', '', '', 'BOV', 984, 'BOV', '2', ',', '', '{number} {symbol}', '{sign}{number} {symbol}', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_emailtemplates`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `context` varchar(50) NOT NULL,
  `recipient_category` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_eproduct_delivery`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_eproduct_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_uid` varchar(20) NOT NULL,
  `license_id` int(11) NOT NULL,
  `mode` varchar(20) NOT NULL,
  `download_limit` int(11) NOT NULL,
  `expiry` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `preview_mode` varchar(20) NOT NULL,
  `preview_url` varchar(250) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_eproduct_downloads`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_eproduct_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `dl_count` int(11) NOT NULL,
  `dl_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(40) NOT NULL,
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_eproduct_media`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_eproduct_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `tags` varchar(250) NOT NULL,
  `version` varchar(20) NOT NULL,
  `released` varchar(20) NOT NULL COMMENT 'Allow freehand date value',
  `is_latest` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_eproduct_sellers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_eproduct_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psx_id` int(11) NOT NULL,
  `delivery_mode` varchar(20) NOT NULL,
  `download_limit` int(11) NOT NULL,
  `download_period` varchar(50) NOT NULL,
  `license` int(11) NOT NULL,
  `license_on` varchar(20) NOT NULL,
  `license_count` int(11) NOT NULL,
  `preview_mode` varchar(10) NOT NULL,
  `preview_url` mediumtext NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_fields`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `path` mediumtext NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'name of the resp, plugin',
  `context` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `description` text NOT NULL,
  `class` varchar(100) NOT NULL,
  `validate` varchar(100) NOT NULL,
  `required` varchar(15) NOT NULL DEFAULT '0',
  `filterable` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  `xml_cache` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`,`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='All available field types' AUTO_INCREMENT=481 ;

--
-- Dumping data for table `wjrcv_sellacious_fields`
--

INSERT INTO `wjrcv_sellacious_fields` (`id`, `title`, `alias`, `parent_id`, `level`, `path`, `lft`, `rgt`, `type`, `context`, `message`, `description`, `class`, `validate`, `required`, `filterable`, `state`, `created`, `created_by`, `modified`, `modified_by`, `params`, `xml_cache`) VALUES
(1, 'ROOT', 'root', 0, 0, '', 0, 813, 'root', '', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(2, 'General', 'general', 1, 1, 'general', 1, 80, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(6, 'What''s in the Package', 'what-s-in-the-package', 73, 2, 'in-the-box/what-s-in-the-package', 132, 133, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"250","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(7, 'Brand', 'brand', 2, 2, 'general/brand', 4, 5, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(8, 'Model-Name', 'model-name', 2, 2, 'general/model-name', 6, 7, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(9, 'Series', 'series', 2, 2, 'general/series', 8, 9, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(10, 'Life Style', 'life-style', 2, 2, 'general/life-style', 10, 11, 'list', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"listoptions":["Business","Gaming","Personal","Entertainment","Dumboi","ZS","Daily Use","Performance","Processing and Multitasking","Daily Use","Processing and Multitasking"],"default":"Business","size":"1","multiple":"false"}', ''),
(11, 'Color', 'color', 2, 2, 'general/color', 12, 13, 'color', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"default":"#bbaacc","readonly":"false","disabled":"false"}', ''),
(12, 'Part Number', 'part-number', 2, 2, 'general/part-number', 14, 15, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(13, 'Model ID', 'model-id', 2, 2, 'general/model-id', 16, 17, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(14, 'Processor', 'processor', 33, 2, 'processor/processor', 96, 97, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(15, 'Processor Variant', 'processor-variant', 33, 2, 'processor/processor-variant', 100, 101, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(16, 'Processor Chipset', 'processor-chipset', 33, 2, 'processor/processor-chipset', 94, 95, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(17, 'Processor Brand', 'processor-brand', 33, 2, 'processor/processor-brand', 98, 99, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(18, 'Processor Clock Speed', 'processor-clock-speed', 33, 2, 'processor/processor-clock-speed', 90, 91, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(19, 'Processor Cache', 'processor-cache', 33, 2, 'processor/processor-cache', 92, 93, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","default":"","readonly":"false","disabled":"false","filter":"string"}', ''),
(20, 'Expandable Memory', 'expandable-memory', 195, 2, 'memory/expandable-memory', 404, 405, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(22, 'System Memory', 'system-memory', 195, 2, 'memory/system-memory', 406, 407, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(23, 'Storage Type', 'storage-type', 30, 2, 'technical-specifications/storage-type', 82, 83, 'list', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"default":"","multiple":"false","size":"1","listoptions":{"value":["0","1"],"text":["HDD","SSD"]}}', ''),
(24, 'RPM', 'rpm', 191, 2, 'storage/rpm', 392, 393, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(25, 'Capacity', 'capacity', 2, 2, 'general/capacity', 2, 3, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(26, 'Optical Drive', 'optical-drive', 298, 2, 'optical-desk-drive/optical-drive', 608, 609, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(28, 'System Architecture', 'system-architecture', 212, 2, 'platform/system-architecture', 452, 453, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(30, 'Technical Specifications', 'technical-specifications', 1, 1, 'technical-specifications', 81, 88, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(33, 'Processor', 'processor', 1, 1, 'processor', 89, 104, 'fieldgroup', 'product', '', '', '', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(34, 'DIMS', 'dims', 30, 2, 'technical-specifications/dims', 84, 85, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(35, 'Operating System', 'operating-system', 30, 2, 'technical-specifications/operating-system', 86, 87, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(458, 'Dedicated Graphics Memory Type', 'dedicated-graphics-memory-type', 455, 2, 'graphics/dedicated-graphics-memory-type', 776, 777, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(457, 'Graphic Processor', 'graphic-processor', 455, 2, 'graphics/graphic-processor', 774, 775, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(452, 'Wireless LAN', 'wireless-lan', 138, 2, 'internet-connectivity/wireless-lan', 302, 303, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(455, 'Graphics', 'graphics', 1, 1, 'graphics', 771, 778, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(456, 'Dedicated Graphics Memory Capacity	', 'dedicated-graphics-memory-capacity', 455, 2, 'graphics/dedicated-graphics-memory-capacity', 772, 773, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(453, 'Bluetooth', 'bluetooth', 138, 2, 'internet-connectivity/bluetooth', 304, 305, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(46, 'Contact Address', 'contact-address', 1, 1, 'contact-address', 105, 114, 'fieldgroup', 'queryform', '', '', '', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(449, 'Colour', 'colour', 2, 2, 'general/colour', 76, 77, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(50, 'Name', 'name', 46, 2, 'contact-address/name', 106, 107, 'text', 'queryform', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"ALNUM"}', ''),
(51, 'Contact Number', 'contact-number', 46, 2, 'contact-address/contact-number', 108, 109, 'text', 'queryform', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"15","maxlength":"100","readonly":"false","disabled":"true","default":"9410060107","filter":"INT"}', ''),
(52, 'Query', 'query', 46, 2, 'contact-address/query', 110, 111, 'textarea', 'queryform', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"ALNUM"}', ''),
(53, 'Can we contact you', 'can-we-contact-you', 46, 2, 'contact-address/can-we-contact-you', 112, 113, 'checkbox', 'queryform', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"value":"Yes","default":"1","disabled":"false"}', ''),
(57, 'INTERFACE', 'interface', 2, 2, 'general/interface', 20, 21, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"ALNUM"}', ''),
(55, 'Type', 'type', 2, 2, 'general/type', 18, 19, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"ALNUM"}', ''),
(471, 'Accessory Shoe', 'accessory-shoe', 463, 2, 'interface/accessory-shoe', 798, 799, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(470, 'Wi-Fi Standard', 'wi-fi-standard', 463, 2, 'interface/wi-fi-standard', 796, 797, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(73, 'IN THE BOX', 'in-the-box', 1, 1, 'in-the-box', 129, 134, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(74, 'Sales Package', 'sales-package', 73, 2, 'in-the-box/sales-package', 130, 131, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(469, 'PictBridge', 'pictbridge', 463, 2, 'interface/pictbridge', 794, 795, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(468, 'Headphone Jack', 'headphone-jack', 463, 2, 'interface/headphone-jack', 792, 793, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(467, 'USB Cable', 'usb-cable', 463, 2, 'interface/usb-cable', 790, 791, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(466, 'Microphone', 'microphone-2', 463, 2, 'interface/microphone-2', 788, 789, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(66, 'SHUTTER SPEED', 'shutter-speed', 1, 1, 'shutter-speed', 115, 128, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(67, 'Maximum Shutter Speed', 'maximum-shutter-speed', 66, 2, 'shutter-speed/maximum-shutter-speed', 116, 117, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(68, 'Shutter Release Modes', 'shutter-release-modes', 66, 2, 'shutter-speed/shutter-release-modes', 118, 119, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(69, 'Minimum Shutter Speed', 'minimum-shutter-speed', 66, 2, 'shutter-speed/minimum-shutter-speed', 120, 121, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(70, 'Shutter Type', 'shutter-type', 66, 2, 'shutter-speed/shutter-type', 122, 123, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(71, 'Shutter Flash Sync Speed', 'shutter-flash-sync-speed', 66, 2, 'shutter-speed/shutter-flash-sync-speed', 124, 125, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(465, 'Microphone', 'microphone', 463, 2, 'interface/microphone', 786, 787, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(75, 'FLASH', 'flash', 1, 1, 'flash', 135, 148, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(81, 'Other Flash Features', 'other-flash-features', 75, 2, 'flash/other-flash-features', 144, 145, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(77, 'Flash Compensation', 'flash-compensation', 75, 2, 'flash/flash-compensation', 136, 137, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(78, 'Built in Flash', 'built-in-flash', 75, 2, 'flash/built-in-flash', 138, 139, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(79, 'Flash Modes', 'flash-modes', 75, 2, 'flash/flash-modes', 140, 141, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(80, 'External Flash', 'external-flash', 75, 2, 'flash/external-flash', 142, 143, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(82, 'SENSOR', 'sensor', 1, 1, 'sensor', 149, 158, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(83, 'Sensor Size', 'sensor-size', 82, 2, 'sensor/sensor-size', 150, 151, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(84, 'Sensor Type', 'sensor-type', 82, 2, 'sensor/sensor-type', 152, 153, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(85, 'Sensor Format', 'sensor-format', 82, 2, 'sensor/sensor-format', 154, 155, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(86, 'OTHER FEATURES', 'other-features', 1, 1, 'other-features', 159, 212, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(87, 'Aperture Range', 'aperture-range', 86, 2, 'other-features/aperture-range', 160, 161, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(88, 'Red Eye Reduction', 'red-eye-reduction', 86, 2, 'other-features/red-eye-reduction', 162, 163, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(89, 'Dust Reduction', 'dust-reduction', 86, 2, 'other-features/dust-reduction', 164, 165, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(90, 'Temperature', 'temperature', 86, 2, 'other-features/temperature', 166, 167, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(91, 'Humidity', 'humidity', 86, 2, 'other-features/humidity', 168, 169, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(92, 'Face Detection', 'face-detection', 86, 2, 'other-features/face-detection', 170, 171, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(93, 'Scene Modes', 'scene-modes', 86, 2, 'other-features/scene-modes', 172, 173, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(94, 'Metering', 'metering', 86, 2, 'other-features/metering', 174, 175, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(95, 'Sync Terminal', 'sync-terminal', 86, 2, 'other-features/sync-terminal', 176, 177, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(96, 'Continuous Shots', 'continuous-shots', 86, 2, 'other-features/continuous-shots', 178, 179, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(97, 'ISO Rating', 'iso-rating', 86, 2, 'other-features/iso-rating', 180, 181, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(98, 'White Balancing', 'white-balancing', 86, 2, 'other-features/white-balancing', 182, 183, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(99, 'Shooting Modes', 'shooting-modes', 86, 2, 'other-features/shooting-modes', 184, 185, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(100, 'Self Timer', 'self-timer', 86, 2, 'other-features/self-timer', 186, 187, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(101, 'HDMI', 'hdmi', 86, 2, 'other-features/hdmi', 188, 189, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(102, 'Supported Languages', 'supported-languages', 86, 2, 'other-features/supported-languages', 190, 191, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(103, 'Additional Features', 'additional-features', 86, 2, 'other-features/additional-features', 192, 193, 'textarea', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(104, 'LENS', 'lens', 1, 1, 'lens', 213, 238, 'fieldgroup', 'product', '', '', '', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(105, 'Lens Type', 'lens-type', 104, 2, 'lens/lens-type', 214, 215, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(106, 'Auto Focus', 'auto-focus', 104, 2, 'lens/auto-focus', 216, 217, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(107, 'other Lens Features', 'other-lens-features', 104, 2, 'lens/other-lens-features', 218, 219, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(108, 'Focal Length', 'focal-length', 104, 2, 'lens/focal-length', 220, 221, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(109, 'Focus Points', 'focus-points', 104, 2, 'lens/focus-points', 222, 223, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(110, 'Focusing Screen', 'focusing-screen', 104, 2, 'lens/focusing-screen', 224, 225, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(111, 'Other Focus Features', 'other-focus-features', 104, 2, 'lens/other-focus-features', 226, 227, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(112, 'Lens Servo', 'lens-servo', 104, 2, 'lens/lens-servo', 228, 229, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(113, 'Focus Range', 'focus-range', 104, 2, 'lens/focus-range', 230, 231, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(114, 'PIXELS', 'pixels', 1, 1, 'pixels', 239, 246, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(115, 'Total Pixel/Gross Pixel', 'total-pixel-gross-pixel', 114, 2, 'pixels/total-pixel-gross-pixel', 240, 241, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(116, 'Optical Sensor Resolution (in MegaPixel)', 'optical-sensor-resolution-in-megapixel', 114, 2, 'pixels/optical-sensor-resolution-in-megapixel', 242, 243, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(117, 'Other Resolution', 'other-resolution', 114, 2, 'pixels/other-resolution', 244, 245, 'text', 'product', '', '', 'inputbox', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(118, 'Handset Color', 'handset-color', 2, 2, 'general/handset-color', 22, 23, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(119, 'Business Features', 'business-features', 86, 2, 'other-features/business-features', 200, 201, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(121, 'SIM Size', 'sim-size', 2, 2, 'general/sim-size', 24, 25, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(123, 'Touch Screen', 'touch-screen', 2, 2, 'general/touch-screen', 26, 27, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(124, 'SIM Type', 'sim-type', 2, 2, 'general/sim-type', 28, 29, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(125, 'In the Box', 'in-the-box', 2, 2, 'general/in-the-box', 30, 31, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(126, 'CAMERA', 'camera', 1, 1, 'camera', 247, 260, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(127, 'Video Recording', 'video-recording', 126, 2, 'camera/video-recording', 248, 249, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(129, 'Other Camera Features', 'other-camera-features', 126, 2, 'camera/other-camera-features', 250, 251, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(130, 'HD Recording', 'hd-recording', 126, 2, 'camera/hd-recording', 252, 253, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(131, 'Rear Camera', 'rear-camera', 126, 2, 'camera/rear-camera', 254, 255, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(132, 'Front Facing Camera', 'front-facing-camera', 126, 2, 'camera/front-facing-camera', 256, 257, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(133, 'MULTIMEDIA', 'multimedia', 1, 1, 'multimedia', 261, 274, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(134, 'Video Player', 'video-player', 133, 2, 'multimedia/video-player', 262, 263, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(135, 'Sound Enhancement', 'sound-enhancement', 133, 2, 'multimedia/sound-enhancement', 264, 265, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(136, 'Music Player', 'music-player', 133, 2, 'multimedia/music-player', 266, 267, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(137, 'FM', 'fm', 133, 2, 'multimedia/fm', 268, 269, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(138, 'INTERNET & CONNECTIVITY', 'internet-connectivity', 1, 1, 'internet-connectivity', 275, 306, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(139, 'Audio Jack', 'audio-jack', 138, 2, 'internet-connectivity/audio-jack', 276, 277, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(454, 'Clock Speed', 'clock-speed', 33, 2, 'processor/clock-speed', 102, 103, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(450, 'Screen Size', 'screen-size', 209, 2, 'display/screen-size', 442, 443, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(142, '4G', '4g', 138, 2, 'internet-connectivity/4g', 278, 279, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(143, 'Charging Point', 'charging-point', 2, 2, 'general/charging-point', 66, 67, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(144, 'Navigation Technology', 'navigation-technology', 138, 2, 'internet-connectivity/navigation-technology', 280, 281, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(145, 'Wifi', 'wifi', 138, 2, 'internet-connectivity/wifi', 282, 283, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(146, 'Internet Features', 'internet-features', 138, 2, 'internet-connectivity/internet-features', 284, 285, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(147, 'EDGE', 'edge', 138, 2, 'internet-connectivity/edge', 286, 287, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(148, 'GPRS', 'gprs', 138, 2, 'internet-connectivity/gprs', 288, 289, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(149, 'Tethering', 'tethering', 138, 2, 'internet-connectivity/tethering', 290, 291, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(150, 'USB Connectivity	', 'usb-connectivity', 138, 2, 'internet-connectivity/usb-connectivity', 292, 293, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(151, '3G', '3g', 138, 2, 'internet-connectivity/3g', 294, 295, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(463, 'Interface', 'interface', 1, 1, 'interface', 783, 806, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(464, 'Other Connectivity Features', 'other-connectivity-features', 463, 2, 'interface/other-connectivity-features', 784, 785, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"4997","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(153, 'Call Memory', 'call-memory', 86, 2, 'other-features/call-memory', 194, 195, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(154, 'SAR Value', 'sar-value', 86, 2, 'other-features/sar-value', 196, 197, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(155, 'Important Apps', 'important-apps', 86, 2, 'other-features/important-apps', 198, 199, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(156, 'T-SHIRT DETAILS', 't-shirt-details', 1, 1, 't-shirt-details', 307, 326, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(157, 'Sleeve', 'sleeve', 156, 2, 't-shirt-details/sleeve', 308, 309, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(158, 'Number of Contents in Sales Package', 'number-of-contents-in-sales-package', 156, 2, 't-shirt-details/number-of-contents-in-sales-package', 310, 311, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(159, 'Fabric', 'fabric', 156, 2, 't-shirt-details/fabric', 312, 313, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(160, 'Type', 'type', 156, 2, 't-shirt-details/type', 314, 315, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(161, 'Fit', 'fit', 156, 2, 't-shirt-details/fit', 316, 317, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(462, 'OS Architecture	', 'os-architecture', 212, 2, 'platform/os-architecture', 454, 455, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(460, 'Power', 'power', 1, 1, 'power', 779, 782, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(461, 'Battery Cell', 'battery-cell', 460, 2, 'power/battery-cell', 780, 781, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(451, 'Resolution', 'resolution', 209, 2, 'display/resolution', 444, 445, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(168, 'FUNCTIONS', 'functions', 1, 1, 'functions', 327, 348, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(169, 'DIAL DIMENSIONS', 'dial-dimensions', 1, 1, 'dial-dimensions', 349, 356, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(170, 'BODY FEATURES', 'body-features', 1, 1, 'body-features', 357, 386, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(382, 'Date Display', 'date-display', 168, 2, 'functions/date-display', 334, 335, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(172, 'Other Functions', 'other-functions', 168, 2, 'functions/other-functions', 328, 329, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(173, 'Calendar', 'calendar', 168, 2, 'functions/calendar', 330, 331, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(174, 'Diameter', 'diameter', 169, 2, 'dial-dimensions/diameter', 350, 351, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(175, 'Weight', 'weight', 169, 2, 'dial-dimensions/weight', 352, 353, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(176, 'Thickness', 'thickness', 169, 2, 'dial-dimensions/thickness', 354, 355, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(177, 'Dial Shape', 'dial-shape', 170, 2, 'body-features/dial-shape', 358, 359, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(178, 'Strap Color', 'strap-color', 170, 2, 'body-features/strap-color', 360, 361, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(179, 'Scratch Resistant', 'scratch-resistant', 170, 2, 'body-features/scratch-resistant', 362, 363, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(180, 'Case / Bezel Material', 'case-bezel-material', 170, 2, 'body-features/case-bezel-material', 364, 365, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(181, 'Water Resistant', 'water-resistant', 170, 2, 'body-features/water-resistant', 366, 367, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(183, 'Clasp Type', 'clasp-type', 170, 2, 'body-features/clasp-type', 368, 369, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(184, 'Other Body Features', 'other-body-features', 170, 2, 'body-features/other-body-features', 370, 371, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(185, 'Dial Color', 'dial-color', 170, 2, 'body-features/dial-color', 372, 373, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(186, 'Strap Material', 'strap-material', 170, 2, 'body-features/strap-material', 374, 375, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(187, 'Style Code', 'style-code', 2, 2, 'general/style-code', 32, 33, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(188, 'Occasion', 'occasion', 2, 2, 'general/occasion', 34, 35, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(189, 'Ideal For', 'ideal-for', 2, 2, 'general/ideal-for', 36, 37, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(191, 'STORAGE', 'storage', 1, 1, 'storage', 387, 398, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(192, 'Memory Card Slot type', 'memory-card-slot-type', 275, 2, 'ports-slots/memory-card-slot-type', 570, 571, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(193, 'Expandable Storage Capacity', 'expandable-storage-capacity', 191, 2, 'storage/expandable-storage-capacity', 388, 389, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(262, 'Internal Storage', 'internal-storage', 191, 2, 'storage/internal-storage', 390, 391, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(195, 'MEMORY', 'memory', 1, 1, 'memory', 399, 410, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(196, 'ROM', 'rom', 195, 2, 'memory/rom', 400, 401, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(197, 'RAM', 'ram', 195, 2, 'memory/ram', 402, 403, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(198, 'BUSINESS FEATURES', 'business-features', 1, 1, 'business-features', 411, 418, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(199, 'Mail Features', 'mail-features', 198, 2, 'business-features/mail-features', 412, 413, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', '');
INSERT INTO `wjrcv_sellacious_fields` (`id`, `title`, `alias`, `parent_id`, `level`, `path`, `lft`, `rgt`, `type`, `context`, `message`, `description`, `class`, `validate`, `required`, `filterable`, `state`, `created`, `created_by`, `modified`, `modified_by`, `params`, `xml_cache`) VALUES
(200, 'Document Support', 'document-support', 198, 2, 'business-features/document-support', 414, 415, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(201, 'Other Business features', 'other-business-features', 198, 2, 'business-features/other-business-features', 416, 417, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(202, 'Video Playback', 'video-playback', 133, 2, 'multimedia/video-playback', 270, 271, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(203, 'Audio Formats Supported', 'audio-formats-supported', 133, 2, 'multimedia/audio-formats-supported', 272, 273, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(204, 'DIMENSIONS', 'dimensions', 1, 1, 'dimensions', 419, 432, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(205, 'Weight', 'weight', 204, 2, 'dimensions/weight', 420, 421, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(206, 'Size', 'dimensions', 204, 2, 'dimensions/dimensions', 422, 423, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(207, 'Pre-Installed Browser', 'pre-installed-browser', 138, 2, 'internet-connectivity/pre-installed-browser', 296, 297, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(208, 'Wi-Fi', 'wi-fi', 138, 2, 'internet-connectivity/wi-fi', 298, 299, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(209, 'DISPLAY', 'display', 1, 1, 'display', 433, 446, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(210, 'Display Type', 'display-type', 209, 2, 'display/display-type', 434, 435, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(211, 'Other Display Features', 'other-display-features', 209, 2, 'display/other-display-features', 436, 437, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(212, 'PLATFORM', 'platform', 1, 1, 'platform', 447, 456, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(213, 'Operating System', 'operating-system', 212, 2, 'platform/operating-system', 448, 449, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(214, 'Sensors', 'sensors', 212, 2, 'platform/sensors', 450, 451, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(216, 'Demand Draft', 'demand-draft', 1, 1, 'demand-draft', 457, 460, 'fieldgroup', 'paymentmethod', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(217, 'DD No.', 'dd-no', 216, 2, 'demand-draft/dd-no', 458, 459, 'text', 'paymentmethod', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(218, 'REMOTE CONTROL FEATURES', 'remote-control-features', 1, 1, 'remote-control-features', 461, 468, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(219, 'RF Capable', 'rf-capable', 218, 2, 'remote-control-features/rf-capable', 462, 463, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(459, 'USB Port', 'usb-port', 275, 2, 'ports-slots/usb-port', 582, 583, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(221, 'Display Size', 'display-size', 209, 2, 'display/display-size', 438, 439, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(222, 'Smart TV', 'smart-tv', 2, 2, 'general/smart-tv', 38, 39, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(224, 'HD Technology & Resolution', 'hd-technology-resolution', 2, 2, 'general/hd-technology-resolution', 70, 71, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(474, 'Tripod Socket', 'tripod-socket', 463, 2, 'interface/tripod-socket', 804, 805, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(226, 'Screen Type', 'screen-type', 209, 2, 'display/screen-type', 440, 441, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(473, 'Audio Video Interface', 'audio-video-interface', 463, 2, 'interface/audio-video-interface', 802, 803, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(228, 'Launch Year', 'launch-year', 2, 2, 'general/launch-year', 40, 41, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(229, 'Width x Height x Depth (with stand)', 'width-x-height-x-depth-with-stand', 204, 2, 'dimensions/width-x-height-x-depth-with-stand', 424, 425, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(230, 'Weight (without stand)', 'weight-without-stand', 204, 2, 'dimensions/weight-without-stand', 426, 427, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(231, 'Width x Height x Depth (without stand)', 'width-x-height-x-depth-without-stand', 204, 2, 'dimensions/width-x-height-x-depth-without-stand', 428, 429, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(232, 'Weight (with stand)', 'weight-with-stand', 204, 2, 'dimensions/weight-with-stand', 430, 431, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(233, 'CONNECTIVITY FEATURES', 'connectivity-features', 1, 1, 'connectivity-features', 469, 504, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(234, 'Composite In (Audio Video Cable)', 'composite-in-audio-video-cable', 233, 2, 'connectivity-features/composite-in-audio-video-cable', 470, 471, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(235, 'RF Connectivity Input', 'rf-connectivity-input', 233, 2, 'connectivity-features/rf-connectivity-input', 472, 473, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(237, 'Headphone Jack', 'headphone-jack', 233, 2, 'connectivity-features/headphone-jack', 474, 475, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(239, 'Component In (RGB Cable)', 'component-in-rgb-cable', 233, 2, 'connectivity-features/component-in-rgb-cable', 476, 477, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(240, 'HDMI Port', 'hdmi', 275, 2, 'ports-slots/hdmi', 572, 573, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(241, 'POWER FEATURES', 'power-features', 1, 1, 'power-features', 505, 510, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(242, 'Power Consumption	', 'power-consumption', 241, 2, 'power-features/power-consumption', 506, 507, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(243, 'Power Requirement', 'power-requirement', 241, 2, 'power-features/power-requirement', 508, 509, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(244, 'AUDIO FEATURES', 'audio-features', 1, 1, 'audio-features', 511, 526, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(245, 'Other Audio Features', 'other-audio-features', 244, 2, 'audio-features/other-audio-features', 512, 513, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(246, 'Speaker Output RMS', 'speaker-output-rms', 244, 2, 'audio-features/speaker-output-rms', 514, 515, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(247, 'Sound Technology', 'sound-technology', 244, 2, 'audio-features/sound-technology', 516, 517, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(248, 'Sound Mode', 'sound-mode', 244, 2, 'audio-features/sound-mode', 518, 519, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(249, 'Number of Speakers', 'number-of-speakers', 244, 2, 'audio-features/number-of-speakers', 520, 521, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(250, 'VIDEO FEATURES', 'video-features', 1, 1, 'video-features', 527, 548, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(251, 'LED Display Type	', 'led-display-type', 250, 2, 'video-features/led-display-type', 528, 529, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(252, 'Aspect Ratio', 'aspect-ratio', 250, 2, 'video-features/aspect-ratio', 530, 531, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(253, 'Other Video Features', 'other-video-features', 250, 2, 'video-features/other-video-features', 532, 533, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(254, 'Panel Type', 'panel-type', 250, 2, 'video-features/panel-type', 534, 535, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(255, 'Picture Engine', 'picture-engine', 250, 2, 'video-features/picture-engine', 536, 537, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(256, 'Analog TV Reception', 'analog-tv-reception', 250, 2, 'video-features/analog-tv-reception', 538, 539, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(257, 'Refresh Rate	', 'refresh-rate', 250, 2, 'video-features/refresh-rate', 540, 541, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(258, 'WARRANTY', 'warranty', 1, 1, 'warranty', 549, 558, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(445, 'Covered in Warranty', 'covered-in-warranty', 258, 2, 'warranty/covered-in-warranty', 554, 555, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(444, 'Not Covered in Warranty', 'not-covered-in-warranty', 258, 2, 'warranty/not-covered-in-warranty', 552, 553, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(443, 'Warranty Summary', 'warranty-summary', 258, 2, 'warranty/warranty-summary', 550, 551, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(263, 'LED Indication', 'led-indication', 2, 2, 'general/led-indication', 42, 43, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(430, 'OS Supported', 'os-supported', 2, 2, 'general/os-supported', 58, 59, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(265, 'Case Material	', 'case-material', 2, 2, 'general/case-material', 44, 45, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(266, 'Form Factor	', 'form-factor', 2, 2, 'general/form-factor', 46, 47, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(472, 'Wireless Connectivity', 'wireless-connectivity', 463, 2, 'interface/wireless-connectivity', 800, 801, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(447, 'HDMI', 'hdmi', 2, 2, 'general/hdmi', 72, 73, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(270, 'Seller Form', 'seller-form', 1, 1, 'seller-form', 559, 568, 'fieldgroup', 'form', '', 'Seller Registration Form', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(271, 'Name', 'name', 270, 2, 'seller-form/name', 560, 561, 'text', 'form', '', '', 'inputbox', '', 'false', 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(272, 'Company Name', 'company-name', 270, 2, 'seller-form/company-name', 562, 563, 'text', 'form', '', '', 'inputbox', '', 'false', 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(273, 'Phone Number', 'phone-number', 270, 2, 'seller-form/phone-number', 564, 565, 'text', 'form', '', '', 'inputbox', '', 'false', 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(274, 'Email', 'email', 270, 2, 'seller-form/email', 566, 567, 'text', 'form', '', '', 'inputbox', '', 'false', 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(275, 'Ports/Slots', 'ports-slots', 1, 1, 'ports-slots', 569, 584, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(276, 'Ethernet', 'ethernet', 138, 2, 'internet-connectivity/ethernet', 300, 301, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(277, 'Zoom', 'zoom', 126, 2, 'camera/zoom', 258, 259, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(279, 'Mic In', 'mic-in', 275, 2, 'ports-slots/mic-in', 574, 575, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(281, 'RJ45 LAN', 'rj45-lan', 275, 2, 'ports-slots/rj45-lan', 576, 577, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(282, 'Other Ports', 'other-ports', 275, 2, 'ports-slots/other-ports', 578, 579, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(283, 'Multi Card Slot', 'multi-card-slot', 275, 2, 'ports-slots/multi-card-slot', 580, 581, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(284, 'Input', 'input', 1, 1, 'input', 585, 592, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(285, 'Pointer Device', 'pointer-device', 284, 2, 'input/pointer-device', 586, 587, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(286, 'Keyboard', 'keyboard', 284, 2, 'input/keyboard', 588, 589, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(287, 'Web Camera', 'web-camera', 284, 2, 'input/web-camera', 590, 591, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(288, 'Software', 'software', 1, 1, 'software', 593, 596, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(289, 'Included Software', 'included-software', 288, 2, 'software/included-software', 594, 595, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(290, 'Battery', 'battery', 1, 1, 'battery', 597, 606, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(291, 'Type', 'type', 290, 2, 'battery/type', 598, 599, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(292, 'HDD Capacity', 'hdd-capacity', 191, 2, 'storage/hdd-capacity', 394, 395, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(293, 'Hardware Interface', 'hardware-interface', 191, 2, 'storage/hardware-interface', 396, 397, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(448, '3D', '3d', 2, 2, 'general/3d', 74, 75, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(446, 'Warranty Service Type', 'warranty-service-type', 258, 2, 'warranty/warranty-service-type', 556, 557, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"5000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(441, 'USB', 'usb', 2, 2, 'general/usb', 68, 69, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(442, 'HDMI', 'hdmi', 233, 2, 'connectivity-features/hdmi', 502, 503, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(298, 'Optical Desk Drive', 'optical-desk-drive', 1, 1, 'optical-desk-drive', 607, 610, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(299, 'RAM Frequency', 'ram-frequency', 195, 2, 'memory/ram-frequency', 408, 409, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(300, 'Shutter Speed in other Modes', 'shutter-speed-in-other-modes', 66, 2, 'shutter-speed/shutter-speed-in-other-modes', 126, 127, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(301, 'Lens Construction', 'lens-construction', 104, 2, 'lens/lens-construction', 232, 233, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(302, 'Focus Mode', 'focus-mode', 104, 2, 'lens/focus-mode', 234, 235, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(303, 'Manual Focus', 'manual-focus', 104, 2, 'lens/manual-focus', 236, 237, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(304, 'Zoom', 'zoom', 1, 1, 'zoom', 611, 618, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(305, 'Optical Zoom', 'optical-zoom', 304, 2, 'zoom/optical-zoom', 612, 613, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(306, 'Focus', 'focus', 304, 2, 'zoom/focus', 614, 615, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(307, 'Digital Zoom', 'digital-zoom', 304, 2, 'zoom/digital-zoom', 616, 617, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(308, 'LCD', 'lcd', 1, 1, 'lcd', 619, 640, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(309, 'LCD Display', 'lcd-display', 308, 2, 'lcd/lcd-display', 620, 621, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(310, 'Video Display Resolution', 'video-display-resolution', 308, 2, 'lcd/video-display-resolution', 622, 623, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(311, 'Exposure Modes', 'exposure-modes', 308, 2, 'lcd/exposure-modes', 624, 625, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(312, 'LCD Screen Size', 'lcd-screen-size', 308, 2, 'lcd/lcd-screen-size', 626, 627, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(313, 'Other Display Features', 'other-display-features', 308, 2, 'lcd/other-display-features', 628, 629, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(314, 'Image Display Resolution', 'image-display-resolution', 308, 2, 'lcd/image-display-resolution', 630, 631, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(315, 'Exposure Compensation', 'exposure-compensation', 308, 2, 'lcd/exposure-compensation', 632, 633, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(316, 'Brightness Adjustment', 'brightness-adjustment', 308, 2, 'lcd/brightness-adjustment', 634, 635, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(317, 'Supported Aspect Ratio', 'supported-aspect-ratio', 308, 2, 'lcd/supported-aspect-ratio', 636, 637, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(318, 'Viewfinder Type', 'viewfinder-type', 308, 2, 'lcd/viewfinder-type', 638, 639, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(319, 'Other Connectivity Features', 'other-connectivity-features', 233, 2, 'connectivity-features/other-connectivity-features', 478, 479, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(320, 'USB', 'usb', 233, 2, 'connectivity-features/usb', 480, 481, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(321, 'PictBridge', 'pictbridge', 233, 2, 'connectivity-features/pictbridge', 482, 483, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(322, 'Wi-Fi Connectivity', 'wi-fi-connectivity', 233, 2, 'connectivity-features/wi-fi-connectivity', 484, 485, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(323, 'Wi-Fi Standard', 'wi-fi-standard', 233, 2, 'connectivity-features/wi-fi-standard', 486, 487, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(324, 'Wireless Connectivity', 'wireless-connectivity', 233, 2, 'connectivity-features/wireless-connectivity', 488, 489, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(325, 'Tripod Socket', 'tripod-socket', 233, 2, 'connectivity-features/tripod-socket', 490, 491, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(326, 'Audio Video Interface', 'audio-video-interface', 233, 2, 'connectivity-features/audio-video-interface', 492, 493, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(327, 'Flash Range', 'flash-range', 75, 2, 'flash/flash-range', 146, 147, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(328, 'Other Sensor Features', 'other-sensor-features', 82, 2, 'sensor/other-sensor-features', 156, 157, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(329, 'Maximum Burst', 'maximum-burst', 86, 2, 'other-features/maximum-burst', 202, 203, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(330, 'Drive Modes', 'drive-modes', 86, 2, 'other-features/drive-modes', 204, 205, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(331, 'Blink Detection', 'blink-detection', 86, 2, 'other-features/blink-detection', 206, 207, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(332, 'Macro Mode', 'macro-mode', 86, 2, 'other-features/macro-mode', 208, 209, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(333, 'Metering Modes', 'metering-modes', 86, 2, 'other-features/metering-modes', 210, 211, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(334, 'SPORTS AND ACTION CAMERA FEATURES', 'sports-and-action-camera-features', 1, 1, 'sports-and-action-camera-features', 641, 644, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(335, 'Spot Meter', 'spot-meter', 334, 2, 'sports-and-action-camera-features/spot-meter', 642, 643, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(336, 'Image', 'image', 1, 1, 'image', 645, 674, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(337, 'Still Image Size 4:3', 'still-image-size', 336, 2, 'image/still-image-size', 646, 647, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(338, 'Smile Detection', 'smile-detection', 336, 2, 'image/smile-detection', 648, 649, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"0","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(339, 'Image Format', 'image-format', 336, 2, 'image/image-format', 650, 651, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(340, 'Image Stabilizer', 'image-stabilizer', 336, 2, 'image/image-stabilizer', 652, 653, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(341, 'Eye-Fi Ready', 'eye-fi-ready', 336, 2, 'image/eye-fi-ready', 654, 655, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(342, 'Recording Time', 'recording-time', 336, 2, 'image/recording-time', 656, 657, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(343, 'Audio Formats', 'audio-formats', 336, 2, 'image/audio-formats', 658, 659, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(344, 'Still Image Size 16:9', 'still-image-size-16-9', 336, 2, 'image/still-image-size-16-9', 660, 661, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(345, 'Video Format', 'video-format', 336, 2, 'image/video-format', 662, 663, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(346, 'HDR Support', 'hdr-support', 336, 2, 'image/hdr-support', 664, 665, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(347, 'Image Size at Aspect Ratio', 'image-size-at-aspect-ratio', 336, 2, 'image/image-size-at-aspect-ratio', 666, 667, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(348, 'Image Size at Megapixels', 'image-size-at-megapixels', 336, 2, 'image/image-size-at-megapixels', 668, 669, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(349, 'Shooting Modes', 'shooting-modes', 336, 2, 'image/shooting-modes', 670, 671, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(350, '3D Images', '3d-images', 336, 2, 'image/3d-images', 672, 673, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(351, 'Power Requirement', 'power-requirement', 290, 2, 'battery/power-requirement', 600, 601, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(352, 'Recharging Time', 'recharging-time', 290, 2, 'battery/recharging-time', 602, 603, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(353, 'Power Supply', 'power-supply', 290, 2, 'battery/power-supply', 604, 605, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(354, 'Media And Software', 'media-and-software', 1, 1, 'media-and-software', 675, 686, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(355, 'Upgradeable Memory', 'upgradeable-memory', 354, 2, 'media-and-software/upgradeable-memory', 676, 677, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(356, 'Memory Card Type', 'memory-card-type', 354, 2, 'media-and-software/memory-card-type', 678, 679, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(357, 'Inbuilt Memory', 'inbuilt-memory', 354, 2, 'media-and-software/inbuilt-memory', 680, 681, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(358, 'Other Storage Features', 'other-storage-features', 354, 2, 'media-and-software/other-storage-features', 682, 683, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(359, 'Operating System', 'operating-system', 354, 2, 'media-and-software/operating-system', 684, 685, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(360, 'Pattern', 'pattern', 2, 2, 'general/pattern', 48, 49, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(361, 'Pockets', 'pockets', 156, 2, 't-shirt-details/pockets', 318, 319, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(362, 'Knit Type', 'knit-type', 156, 2, 't-shirt-details/knit-type', 320, 321, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(363, 'character', 'character', 156, 2, 't-shirt-details/character', 322, 323, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(364, 'Design', 'design', 156, 2, 't-shirt-details/design', 324, 325, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(365, 'Shoe Details', 'shoe-details', 1, 1, 'shoe-details', 687, 708, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(366, 'Weight', 'weight', 365, 2, 'shoe-details/weight', 688, 689, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(367, 'Heel Height', 'heel-height', 365, 2, 'shoe-details/heel-height', 690, 691, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(368, 'Outer Material', 'outer-material', 365, 2, 'shoe-details/outer-material', 692, 693, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(369, 'Color', 'color', 365, 2, 'shoe-details/color', 694, 695, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(370, 'Closure', 'closure', 365, 2, 'shoe-details/closure', 696, 697, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(371, 'Sole Material', 'sole-material', 365, 2, 'shoe-details/sole-material', 698, 699, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(372, 'Tip Shape', 'tip-shape', 365, 2, 'shoe-details/tip-shape', 700, 701, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(373, 'Inner Material', 'inner-material', 365, 2, 'shoe-details/inner-material', 702, 703, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(374, 'Technology Used', 'technology-used', 365, 2, 'shoe-details/technology-used', 704, 705, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(375, 'Type', 'type', 365, 2, 'shoe-details/type', 706, 707, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(376, 'Fabric care', 'fabric-care', 1, 1, 'fabric-care', 709, 710, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(377, 'Mechanism', 'mechanism', 2, 2, 'general/mechanism', 50, 51, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(378, 'Strap type', 'strap-type', 170, 2, 'body-features/strap-type', 376, 377, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', '');
INSERT INTO `wjrcv_sellacious_fields` (`id`, `title`, `alias`, `parent_id`, `level`, `path`, `lft`, `rgt`, `type`, `context`, `message`, `description`, `class`, `validate`, `required`, `filterable`, `state`, `created`, `created_by`, `modified`, `modified_by`, `params`, `xml_cache`) VALUES
(379, 'Shock Resistance', 'shock-resistance', 170, 2, 'body-features/shock-resistance', 378, 379, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(380, 'Box Material', 'box-material', 170, 2, 'body-features/box-material', 380, 381, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(381, 'Chronograph', 'chronograph', 168, 2, 'functions/chronograph', 332, 333, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(384, 'Barometer', 'barometer', 168, 2, 'functions/barometer', 336, 337, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(385, 'Alarm Clock', 'alarm-clock', 168, 2, 'functions/alarm-clock', 338, 339, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(386, 'Compass', 'compass', 168, 2, 'functions/compass', 340, 341, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(387, 'Luminous', 'luminous', 168, 2, 'functions/luminous', 342, 343, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(388, 'Number of Hands', 'number-of-hands', 170, 2, 'body-features/number-of-hands', 382, 383, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(389, 'Theme', 'theme', 2, 2, 'general/theme', 52, 53, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(390, 'Case Color', 'case-color', 170, 2, 'body-features/case-color', 384, 385, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(392, 'Temperature Readout', 'temperature-readout', 168, 2, 'functions/temperature-readout', 344, 345, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(393, 'Time Format', 'time-format', 168, 2, 'functions/time-format', 346, 347, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(394, 'Display Size', 'display-size', 2, 2, 'general/display-size', 54, 55, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(395, 'Built In Wi-Fi', 'built-in-wi-fi', 2, 2, 'general/built-in-wi-fi', 56, 57, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(396, 'Internet Access', 'internet-access', 218, 2, 'remote-control-features/internet-access', 464, 465, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(397, 'Battery Type', 'battery-type', 218, 2, 'remote-control-features/battery-type', 466, 467, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(398, 'Digital Audio Output (Optical)', 'digital-audio-output-optical', 233, 2, 'connectivity-features/digital-audio-output-optical', 494, 495, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(399, 'PC Audio In', 'pc-audio-in', 233, 2, 'connectivity-features/pc-audio-in', 496, 497, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(400, 'PC D-sub', 'pc-d-sub', 233, 2, 'connectivity-features/pc-d-sub', 498, 499, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(401, 'Speaker Type', 'speaker-type', 244, 2, 'audio-features/speaker-type', 522, 523, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(402, 'Number of Subwoofers', 'number-of-subwoofers', 244, 2, 'audio-features/number-of-subwoofers', 524, 525, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(403, 'Contrast Ratio', 'contrast-ratio', 250, 2, 'video-features/contrast-ratio', 542, 543, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(404, 'View Angle', 'view-angle', 250, 2, 'video-features/view-angle', 544, 545, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(405, 'Brightness', 'brightness', 250, 2, 'video-features/brightness', 546, 547, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(406, 'INSTALLATION & DEMO', 'installation-demo', 1, 1, 'installation-demo', 711, 714, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(407, 'Installation & Demo Details', 'installation-demo-details', 406, 2, 'installation-demo/installation-demo-details', 712, 713, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"10000","readonly":"false","disabled":"false","default":"","filter":"STRING"}', ''),
(408, 'CONVENIENCE FEATURES', 'convenience-features', 1, 1, 'convenience-features', 715, 716, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(409, 'Mobile High-Definition Link', 'mobile-high-definition-link', 233, 2, 'connectivity-features/mobile-high-definition-link', 500, 501, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(410, 'GENERAL TRAITS', 'general-traits', 1, 1, 'general-traits', 717, 730, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(411, 'Quantity', 'quantity', 410, 2, 'general-traits/quantity', 718, 719, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(412, 'Other Traits', 'other-traits', 410, 2, 'general-traits/other-traits', 720, 721, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(413, 'Container Type', 'container-type', 410, 2, 'general-traits/container-type', 722, 723, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(414, 'Treatment Type', 'treatment-type', 410, 2, 'general-traits/treatment-type', 724, 725, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(415, 'Ingredients', 'ingredients', 410, 2, 'general-traits/ingredients', 726, 727, 'textarea', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"rows":"4","cols":"4","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(416, 'Gift Pack', 'gift-pack', 410, 2, 'general-traits/gift-pack', 728, 729, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(417, 'HAIR TREATMENT DETAILS', 'hair-treatment-details', 1, 1, 'hair-treatment-details', 731, 756, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(418, 'Hair Type', 'hair-type', 417, 2, 'hair-treatment-details/hair-type', 732, 733, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(419, 'Hair Condition', 'hair-condition', 417, 2, 'hair-treatment-details/hair-condition', 734, 735, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(420, 'Applied For', 'applied-for', 417, 2, 'hair-treatment-details/applied-for', 736, 737, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(421, 'Ideal For', 'ideal-for', 417, 2, 'hair-treatment-details/ideal-for', 738, 739, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(422, 'Brand', 'brand', 417, 2, 'hair-treatment-details/brand', 740, 741, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(423, 'Formula', 'formula', 417, 2, 'hair-treatment-details/formula', 742, 743, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(424, 'Application Frequency', 'application-frequency', 417, 2, 'hair-treatment-details/application-frequency', 744, 745, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(425, 'Application Area', 'application-area', 417, 2, 'hair-treatment-details/application-area', 746, 747, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(426, 'Hair Texture', 'hair-texture', 417, 2, 'hair-treatment-details/hair-texture', 748, 749, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(427, 'Organic', 'organic', 417, 2, 'hair-treatment-details/organic', 750, 751, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(428, 'Ideal Skin Type', 'ideal-skin-type', 417, 2, 'hair-treatment-details/ideal-skin-type', 752, 753, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(429, 'Organic Type', 'organic-type', 417, 2, 'hair-treatment-details/organic-type', 754, 755, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(431, 'Bag Size', 'bag-size', 2, 2, 'general/bag-size', 60, 61, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(432, 'Color Code', 'color-code', 2, 2, 'general/color-code', 62, 63, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(433, 'Closure', 'closure', 2, 2, 'general/closure', 64, 65, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(434, 'FEATURES & FUNCTIONS', 'features-functions', 1, 1, 'features-functions', 757, 770, 'fieldgroup', 'product', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(435, 'Lens Color', 'lens-color', 434, 2, 'features-functions/lens-color', 758, 759, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(436, 'Lens Material	', 'lens-material', 434, 2, 'features-functions/lens-material', 760, 761, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(437, 'Frame material', 'frame-material', 434, 2, 'features-functions/frame-material', 762, 763, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(438, 'Frame Type', 'frame-type', 434, 2, 'features-functions/frame-type', 764, 765, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(439, 'UV Protection', 'uv-protection', 434, 2, 'features-functions/uv-protection', 766, 767, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(440, 'Frame Color', 'frame-color', 434, 2, 'features-functions/frame-color', 768, 769, 'text', 'product', '', '', 'inputbox', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","maxlength":"100","readonly":"false","disabled":"false","default":"","filter":"INT"}', ''),
(476, 'Query Group', 'query-group', 1, 1, 'query-group', 807, 812, 'fieldgroup', 'queryform', '', '', '', '', '', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', ''),
(477, 'Query color', 'query-color', 476, 2, 'query-group/query-color', 808, 809, 'color', 'queryform', '', '', '', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"default":"#ff0303","readonly":"false","disabled":"false"}', ''),
(479, 'query', 'query', 476, 2, 'query-group/query', 810, 811, 'number', 'queryform', '', '', '', '', 'false', 0, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"size":"60","min":"","max":"","step":"1","default":"1","readonly":"false","disabled":"false"}', ''),
(480, 'Country', 'country', 2, 2, 'general/country', 78, 79, 'location', 'product', '', '', '', '', 'false', 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"readonly":"false","disabled":"false","gl_type":"country","default":""}', '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_field_tags`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_field_tags` (
  `field_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_field_values`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `record_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_forex`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_forex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x_from` varchar(5) NOT NULL,
  `x_to` varchar(5) NOT NULL,
  `x_factor` double NOT NULL,
  `note` varchar(10) NOT NULL,
  `state` mediumint(9) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_licenses`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `description` mediumtext NOT NULL,
  `external_link` varchar(250) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wjrcv_sellacious_licenses`
--

INSERT INTO `wjrcv_sellacious_licenses` (`id`, `title`, `description`, `external_link`, `state`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'GNU Public License v3', '<pre>A Quick Guide to GPLv3\n======================\n\n:Authors: Brett Smith\n:Organization: Free Software Foundation\n:Contact: licensing@fsf.org\n:Copyright: Copyright 2007 Free Software Foundation, Inc.  Verbatim copying\n  and distribution of this entire article are permitted worldwide, without\n  royalty, in any medium, provided this notice is preserved.\n\n.. |--| unicode:: U+2013   .. en dash\n.. |---| unicode:: U+2014  .. em dash, trimming surrounding whitespace\n   :trim:\n\nAfter a year and a half of public consultation, thousands of comments, and\nfour drafts, version 3 of the GNU General Public License (`GPLv3`_) was\nfinally published on June 29.  While there''s been a lot of discussion about\nthe license since the first draft appeared, not many people have talked\nabout the benefits that it provides developers.  We''ve published this guide\nto fill that gap.  We''ll start with a brief refresher on free software,\ncopyleft, and the goals of the GPL.  We''ll then review the major changes in\nthe license to see how they advance those goals and benefit developers.\n\n.. _GPLv3: http://www.fsf.org/licensing/licenses/gpl.html\n\nThe Foundations of the GPL\n--------------------------\n\nNobody should be restricted by the software they use.  There are four\nfreedoms that every user should have:\n\n* the freedom to use the software for any purpose,\n* the freedom to share the software with your friends and neighbors,\n* the freedom to change the software to suit your needs, and\n* the freedom to share the changes you make.\n\nWhen a program offers users all of these freedoms, we call it `free\nsoftware`_.\n\n.. _free software: http://www.fsf.org/licensing/essays/free-sw.html\n\nDevelopers who write software can release it under the terms of the GNU\nGPL.  When they do, it will be free software and stay free software, no\nmatter who changes or distributes the program.  We call this copyleft: the\nsoftware is copyrighted, but instead of using those rights to restrict\nusers like proprietary software does, we use them to ensure that\nevery user has freedom.\n\nWe update the GPL to protect its copyleft from being undermined by legal or\ntechnological developments.  The most recent version protects users from\nthree recent threats:\n\n* Tivoization: Some companies have created various different kinds of\n  devices that run GPLed software, and then rigged the hardware so that\n  they can change the software that''s running, but you cannot.  If a device\n  can run arbitrary software, it''s a general-purpose computer, and its\n  owner should control what it does.  When a device thwarts you from doing\n  that, we call that tivoization.\n\n* Laws prohibiting free software: Legislation like the Digital Millennium\n  Copyright Act and the European Union Copyright Directive make it a crime\n  to write or share software that can break DRM.  These laws should not\n  interfere with the rights the GPL grants you.\n\n* Discriminatory patent deals: Microsoft has recently started telling\n  people that they will not sue free software users for patent infringement\n  |---| as long as you get the software from a vendor that''s paying\n  Microsoft for the privilege.  Ultimately, Microsoft is trying to collect\n  royalties for the use of free software, which interferes with users''\n  freedom.  No company should be able to do this.\n\nVersion 3 also has a number of improvements to make the license easier for\neveryone to use and understand.  But even with all these changes, GPLv3\nisn''t a radical new license; instead it''s an evolution of the previous\nversion.  Though a lot of text has changed, much of it simply clarifies\nwhat GPLv2 said.  With that in mind, let''s review the major changes in\nGPLv3, and talk about how they improve the license for users and\ndevelopers.\n\nNeutralizing Laws That Prohibit Free Software |--| But Not Forbidding DRM\n---\n----------------------------------------------------------------------\n\nYou''re probably familiar with the Digital Restrictions Management (DRM) on\nDVDs and other media.  You''re probably also familiar with the laws that\nmake it illegal to write your own tools to bypass those restrictions, like\nthe Digital Millennium Copyright Act and the European Union Copyright\nDirective.  Nobody should be able to stop you from writing any code that\nyou want, and GPLv3 protects this right for you.\n\nIt''s always possible to use GPLed code to write software that implements\nDRM.  However, if someone does that with code protected by GPLv3, section 3\nsays that the system will not count as an effective technological\n"protection" measure.  This means that if you break the DRM, you''ll be free\nto distribute your own software that does that, and you won''t be threatened\nby the DMCA or similar laws.\n\nAs usual, the GNU GPL does not restrict what people do in software; it just\nstops them from restricting others.\n\nProtecting Your Right to Tinker\n-------------------------------\n\nTivoization is a dangerous attempt to curtail users'' freedom: the right to\nmodify your software will become meaningless if none of your computers let\nyou do it.  GPLv3 stops tivoization by requiring the distributor to provide\nyou with whatever information or data is necessary to install modified\nsoftware on the device.  This may be as simple as a set of instructions, or\nit may include special data such as cryptographic keys or information about\nhow to bypass an integrity check in the hardware.  It will depend on how\nthe hardware was designed |---| but no matter what information you need, you\nmust be able to get it.\n\nThis requirement is limited in scope.  Distributors are still allowed to\nuse cryptographic keys for any purpose, and they''ll only be required to\ndisclose a key if you need it to modify GPLed software on the device they\ngave you.  The GNU Project itself uses GnuPG to prove the integrity of all\nthe software on its FTP site, and measures like that are beneficial to\nusers.  GPLv3 does not stop people from using cryptography; we wouldn''t\nwant it to.  It only stops people from taking away the rights that the\nlicense provides you |---| whether through patent law, technology, or any\nother means.\n\nStronger Protection Against Patent Threats\n------------------------------------------\n\nIn the 17 years since GPLv2 was published, the software patent landscape\nhas changed considerably, and free software licenses have developed new\nstrategies to address them.  GPLv3 reflects these changes too.  Whenever\nsomeone conveys software covered by GPLv3 that they''ve written or modified,\nthey must provide every recipient with any patent licenses necessary to\nexercise the rights that the GPL gives them.  In addition to that, if any\nlicensee tries to use a patent suit to stop another user from exercising\nthose rights, their license will be terminated.\n\nWhat this means for users and developers is that they''ll be able to work\nwith GPLv3-covered software without worrying that a desperate contributor\nwill try to sue them for patent infringement later.  With these changes,\nGPLv3 affords its users more defenses against patent aggression than any\nother free software license.\n\nClarifying License Compatibility\n--------------------------------\n\nIf you found some code and wanted to incorporate it into a GPLed project,\nGPLv2 said that the license on the other code was not allowed to have any\nrestrictions that were not already in GPLv2.  As long as that was the case,\nwe said the license was GPL-compatible.\n\nHowever, some licenses had requirements that weren''t really restrictive,\nbecause they were so easy to comply with.  For example, some licenses say\nthat they don''t give you permission to use certain trademarks.  That''s not\nreally an additional restriction: if that clause wasn''t there\n, you still\nwouldn''t have permission to use the trademark.  We always said those\nlicenses were compatible with GPLv2, too.\n\nNow, GPLv3 explicitly gives everyone permission to use code that has\nrequirements like this.  These new terms should help clear up\nmisunderstandings about which licenses are GPL-compatible, why that is, and\nwhat you can do with GPL-compatible code.\n\nNew Compatible Licenses\n-----------------------\n\nIn addition to clarifying the rules about licenses that are already\nGPL-compatible, GPLv3 is also newly compatible with a few other licenses.\nThe Apache License 2.0 is a prime example.  Lots of great free software is\navailable under this license, with strong communities surrounding it.  We\nhope that this change in GPLv3 will foster more cooperation and sharing\nwithin the free software community.  The chart below helps illustrate some\ncommon compatibility relationships between different free software\nlicenses:\n\n.. image:: gplv3-nov-guide-compatibility.png\n    :width: 594px\n    :height: 498px\n    :align: center\n    :alt: A chart illustrating compatibility relationships between\n      different free software licenses.  For details, see the FSF''s license\n      list page.\n\nArrows pointing from one license to another indicate that the first license\nis compatible with the second.  This is true even if you follow multiple\narrows to get from one license to the other; so, for example, the ISC\nlicense is compatible with GPLv3.  GPLv2 is compatible with GPLv3 if the\nprogram allows you to choose "any later version" of the GPL, which is the\ncase for most software released under this license.  This diagram is not\ncomprehensive (see `our licenses page`_ for a more complete list of licenses\ncompatible with GPLv2 and GPLv3), but plainly illustrates that GPLv3\nis compatible with just about everything GPLv2 is, and then some.\n\n.. _our licenses page: http://www.fsf.org/licensing/licenses\n\nThe GNU Affero GPL version 3 has also been brought into the fold.  The\noriginal Affero GPL was designed to ensure that all users of a web\napplication would be able to receive its source.  The GNU Affero GPL\nversion 3 broadens this goal: it is applicable to all network-interactive\nsoftware, so it will also work well for programs like game servers.  The\nadditional provision is also more flexible, so that if someone uses AGPLed\nsource in an application without a network interface, they''ll only have to\nprovide source in the same sort of way the GPL has always required.\nBy making these two licenses compatible, developers of network-interactive\nsoftware will be able to strengthen their copyleft while still building on\ntop of the mature body of GPLed code available to them.\n\nMore Ways for Developers to Provide Source\n------------------------------------------\n\nOne of the fundamental requirements of the GPL is that when you distribute\nobject code to users, you must also provide them with a way to get the\nsource.  GPLv2 gave you a few ways to do this, and GPLv3 keeps those intact\nwith some clarification.  It also offers you new ways to provide source\nwhen you convey object code over a network.  For instance, when you host\nobject code on a web or FTP server, you can simply provide instructions\nthat tell visitors how to get the source from a third-party server.  Thanks\nto this new option, fulfilling this requirement should be easier for many\nsmall distributors who only make a few changes to large bodies of source.\n\nThe new license also makes it much easier to convey object code via\nBitTorrent.  First, people who are merely downloading or seeding the\ntorrent are exempt from the license''s requirements for conveying the\nsoftware.  Then, whoever starts the torrent can provide source by simply\ntelling other torrent users where it is available on a public network\nserver.\n\nThese new options help keep the GPL in line with community standards f\nor\noffering source, without making it harder for users to get.\n\nLess Source to Distribute: New System Libraries Exception\n---------------------------------------------------------\n\nBoth versions of the GPL require you to provide all the source necessary to\nbuild the software, including supporting libraries, compilation scripts,\nand so on.  They also draw the line at System Libraries: you''re not\nrequired to provide the source for certain core components of the operating\nsystem, such as the C library.\n\nGPLv3 has adjusted the definition of System Library to include software\nthat may not come directly with the operating system, but that all users of\nthe software can reasonably be expected to have.  For example, it now also\nincludes the standard libraries of common programming languages such as\nPython and Ruby.\n\nThe new definition also makes it clear that you can combine GPLed software\nwith GPL-incompatible System Libraries, such as OpenSolaris'' C library, and\ndistribute them both together.  These changes will make life easier for\nfree software distributors who want to provide these combinations to their\nusers.\n\nA Global License\n----------------\n\nGPLv2 talks about "distribution" a lot |---| when you share the program\nwith someone else, you''re distributing it.  The license never says what\ndistribution is, because the term was borrowed from United States copyright\nlaw.  We expected that judges would look there for the definition.\nHowever, we later found out that copyright laws in other countries use the\nsame word, but give it different meanings.  Because of this, a judge in\nsuch a country might analyze GPLv2 differently than a judge in the United\nStates.\n\nGPLv3 uses a new term, "convey," and provides a definition for that term.\n"Convey" has the same meaning we intended for "distribute," but now that\nthis is explained directly in the license, it should be easy for people\neverywhere to understand what we meant.  There are other minor changes\nthroughout the license that will also help ensure it is applied\nconsistently worldwide.\n\nWhen the Rules Are Broken: A Smooth Path to Compliance\n------------------------------------------------------\n\nUnder GPLv2, if you violated the license in any way, your rights were\nautomatically and permanently lost.  The only way to get them back was to\npetition the copyright holder.  While a strong defense against violations\nis valuable, this policy could cause a lot of headache when someone\naccidentally ran afoul of the rules.  Asking all the copyright holders for\na formal restoration of the license could be burdensome and costly: a\ntypical GNU/Linux distribution draws upon the work of thousands.\n\nGPLv3 offers a reprieve for good behavior: if you violate the license,\nyou''ll get your rights back once you stop the violation, unless a copyright\nholder contacts you within 60 days.  After you receive such a notice, you\ncan have your rights fully restored if you''re a first-time violator and\ncorrect the violation within 30 days.  Otherwise, you can work out the\nissue on a case-by-case basis with the copyright holders who contacted you,\nand your rights will be restored afterward.\n\nCompliance with the GPL has always been the top priority of the FSF\nCompliance Lab and other groups enforcing the license worldwide.  These\nchanges ensure that compliance remains the top priority for enforcers, and\ngives violators incentive to comply.\n\nThe Latest and Greatest\n-----------------------\n\nSome of these changes probably seem less important to you than others.\nThat''s okay.  Every project is different, and needs different things from\nits license.  But odds are that a number of these improvements will help\nyou and your work.\n\nAnd taken as a whole, all these upgrades represent something more: we made\na better copyleft.  It does more to protect users'' freedom, but it also\nenables more cooperati\non in the free software community.  But updating the\nlicense is only part of the job: in order for people to get the benefits it\noffers, developers need to use GPLv3 for their projects, too.  By releasing\nyour own software under the new license, everyone who deals with it |---|\nusers, other developers, distributors, even lawyers |---| will benefit.  We\nhope you''ll use GPLv3 for your next release.\n\nIf you''d like to learn more about upgrading your project to GPLv3, the FSF\nCompliance Lab would be happy to assist you.  On `our web site`_, you can\nfind `basic instructions for using the license`_, and an `FAQ addressing\ncommon concerns`_ that people have about it.  If your situation is more\ncomplicated than that, please `contact us`_ and we''ll do what we can to\nhelp you with your transition.  Together, we can help protect freedom for\nall users.\n\n.. _our web site: http://www.fsf.org/licensing/\n.. _basic instructions for using the license: http://www.fsf.org/licensing/licenses/gpl-howto.html\n.. _FAQ addressing common concerns: http://www.fsf.org/licensing/licenses/gpl-faq.html\n.. _contact us: mailto:licensing@fsf.org</pre>', 'https://www.gnu.org/licenses/gpl-3.0-standalone.html', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, 'GNU Public License v2', '<div id="content"><h3><a id="SEC1"></a>GNU GENERAL PUBLIC LICENSE</h3><p>Version 2, June 1991</p><pre>Copyright (C) 1989, 1991 Free Software Foundation, Inc.  \n51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA\n\nEveryone is permitted to copy and distribute verbatim copies\nof this license document, but changing it is not allowed.\n</pre><h3><a id="preamble"></a><a id="SEC2"></a>Preamble</h3><p>The licenses for most software are designed to take away your freedom to share and change it. By contrast, the GNU General Public License is intended to guarantee your freedom to share and change free software--to make sure the software is free for all its users. This General Public License applies to most of the Free Software Foundation''s software and to any other program whose authors commit to using it. (Some other Free Software Foundation software is covered by the GNU Lesser General Public License instead.) You can apply it to your programs, too.</p><p>When we speak of free software, we are referring to freedom, not price. Our General Public Licenses are designed to make sure that you have the freedom to distribute copies of free software (and charge for this service if you wish), that you receive source code or can get it if you want it, that you can change the software or use pieces of it in new free programs; and that you know you can do these things.</p><p>To protect your rights, we need to make restrictions that forbid anyone to deny you these rights or to ask you to surrender the rights. These restrictions translate to certain responsibilities for you if you distribute copies of the software, or if you modify it.</p><p>For example, if you distribute copies of such a program, whether gratis or for a fee, you must give the recipients all the rights that you have. You must make sure that they, too, receive or can get the source code. And you must show them these terms so they know their rights.</p><p>We protect your rights with two steps: (1) copyright the software, and (2) offer you this license which gives you legal permission to copy, distribute and/or modify the software.</p><p>Also, for each author''s protection and ours, we want to make certain that everyone understands that there is no warranty for this free software. If the software is modified by someone else and passed on, we want its recipients to know that what they have is not the original, so that any problems introduced by others will not reflect on the original authors'' reputations.</p><p>Finally, any free program is threatened constantly by software patents. We wish to avoid the danger that redistributors of a free program will individually obtain patent licenses, in effect making the program proprietary. To prevent this, we have made it clear that any patent must be licensed for everyone''s free use or not licensed at all.</p><p>The precise terms and conditions for copying, distribution and modification follow.</p><h3><a id="terms"></a><a id="SEC3"></a>TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION</h3><a id="section0"></a><p><strong>0.</strong> This License applies to any program or other work which contains a notice placed by the copyright holder saying it may be distributed under the terms of this General Public License. The "Program", below, refers to any such program or work, and a "work based on the Program" means either the Program or any derivative work under copyright law: that is to say, a work containing the Program or a portion of it, either verbatim or with modifications and/or translated into another language. (Hereinafter, translation is included without limitation in the term "modification".) Each licensee is addressed as "you".</p><p>Activities other than copying, distribution and modification are not covered by this License; they are outside its scope. The act of running the Program is not restricted, and the output from the Program is covered only if its contents constitute a work based on the Program (independent of having been made by running the Program). Whether that is true depends on what the Program does.</p><a id="section1"></a><p><strong>1.</strong> You may copy and distribute verbatim copies of the Program''s source code as you receive it, in any medium, provided that you conspicuously and appropriately publish on each copy an appropriate copyright notice and disclaimer of warranty; keep intact all the notices that refer to this License and to the absence of any warranty; and give any other recipients of the Program a copy of this License along with the Program.</p><p>You may charge a fee for the physical act of transferring a copy, and you may at your option offer warranty protection in exchange for a fee.</p><a id="section2"></a><p><strong>2.</strong> You may modify your copy or copies of the Program or any portion of it, thus forming a work based on the Program, and copy and distribute such modifications or work under the terms of Section 1 above, provided that you also meet all of these conditions:</p><dl><dt></dt><dd><strong>a)</strong> You must cause the modified files to carry prominent notices stating that you changed the files and the date of any change.</dd><dt></dt><dd><strong>b)</strong> You must cause any work that you distribute or publish, that in whole or in part contains or is derived from the Program or any part thereof, to be licensed as a whole at no charge to all third parties under the terms of this License.</dd><dt></dt><dd><strong>c)</strong> If the modified program normally reads commands interactively when run, you must cause it, when started running for such interactive use in the most ordinary way, to print or display an announcement including an appropriate copyright notice and a notice that there is no warranty (or else, saying that you provide a warranty) and that users may redistribute the program under these conditions, and telling the user how to view a copy of this License. (Exception: if the Program itself is interactive but does not normally print such an announcement, your work based on the Program is not required to print an announcement.)</dd></dl><p>These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Program, and can be reasonably considered independent and separate works in themselves, then this License, and its terms, do not apply to those sections when you distribute them as separate works. But when you distribute the same sections as part of a whole which is a work based on the Program, the distribution of the whole must be on the terms of this License, whose permissions for other licensees extend to the entire whole, and thus to each and every part regardless of who wrote it.</p><p>Thus, it is not the intent of this section to claim rights or contest your rights to work written entirely by you; rather, the intent is to exercise the right to control the distribution of derivative or collective works based on the Program.</p><p>In addition, mere aggregation of another work not based on the Program with the Program (or with a work based on the Program) on a volume of a storage or distribution medium does not bring the other work under the scope of this License.</p><a id="section3"></a><p><strong>3.</strong> You may copy and distribute the Program (or a work based on it, under Section 2) in object code or executable form under the terms of Sections 1 and 2 above provided that you also do one of the following:</p><dl><dt></dt><dd><strong>a)</strong> Accompany it with the complete corresponding machine-readable source code, which must be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,</dd><dt></dt><dd><strong>b)</strong> Accompany it with a written offer, valid for at least three years, to give any third party, for a charge no more than your cost of physically performing source distribution, a complete machine-readable copy of the corresponding source code, to be distributed under the terms of Sections 1 and 2 above on a medium customarily used for software interchange; or,</dd><dt></dt><dd><strong>c)</strong> Accompany it with the information you received as to the offer to distribute corresponding source code. (This alternative is allowed only for noncommercial distribution and only if you received the program in object code or executable form with such an offer, in accord with Subsection b above.)</dd></dl><p>The source code for a work means the preferred form of the work for making modifications to it. For an executable work, complete source code means all the source code for all modules it contains, plus any associated interface definition files, plus the scripts used to control compilation and installation of the executable. However, as a special exception, the source code distributed need not include anything that is normally distributed (in either source or binary form) with the major components (compiler, kernel, and so on) of the operating system on which the executable runs, unless that component itself accompanies the executable.</p><p>If distribution of executable or object code is made by offering access to copy from a designated place, then offering equivalent access to copy the source code from the same place counts as distribution of the source code, even though third parties are not compelled to copy the source along with the object code.</p><a id="section4"></a><p><strong>4.</strong> You may not copy, modify, sublicense, or distribute the Program except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense or distribute the Program is void, and will automatically terminate your rights under this License. However, parties who have received copies, or rights, from you under this License will not have their licenses terminated so long as such parties remain in full compliance.</p><a id="section5"></a><p><strong>5.</strong> You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to modify or distribute the Program or its derivative works. These actions are prohibited by law if you do not accept this License. Therefore, by modifying or distributing the Program (or any work based on the Program), you indicate your acceptance of this License to do so, and all its terms and conditions for copying, distributing or modifying the Program or works based on it.</p><a id="section6"></a><p><strong>6.</strong> Each time you redistribute the Program (or any work based on the Program), the recipient automatically receives a license from the original licensor to copy, distribute or modify the Program subject to these terms and conditions. You may not impose any further restrictions on the recipients'' exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties to this License.</p><a id="section7"></a><p><strong>7.</strong> If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Program at all. For example, if a patent license would not permit royalty-free redistribution of the Program by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Program.</p><p>If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply and the section as a whole is intended to apply in other circumstances.</p><p>It is not the purpose of thi\ns section to induce you to infringe any patents or other property right claims or to contest validity of any such claims; this section has the sole purpose of protecting the integrity of the free software distribution system, which is implemented by public license practices. Many people have made generous contributions to the wide range of software distributed through that system in reliance on consistent application of that system; it is up to the author/donor to decide if he or she is willing to distribute software through any other system and a licensee cannot impose that choice.</p><p>This section is intended to make thoroughly clear what is believed to be a consequence of the rest of this License.</p><a id="section8"></a><p><strong>8.</strong> If the distribution and/or use of the Program is restricted in certain countries either by patents or by copyrighted interfaces, the original copyright holder who places the Program under this License may add an explicit geographical distribution limitation excluding those countries, so that distribution is permitted only in or among countries not thus excluded. In such case, this License incorporates the limitation as if written in the body of this License.</p><a id="section9"></a><p><strong>9.</strong> The Free Software Foundation may publish revised and/or new versions of the General Public License from time to time. Such new versions will be similar in spirit to the present version, but may differ in detail to address new problems or concerns.</p><p>Each version is given a distinguishing version number. If the Program specifies a version number of this License which applies to it and "any later version", you have the option of following the terms and conditions either of that version or of any later version published by the Free Software Foundation. If the Program does not specify a version number of this License, you may choose any version ever published by the Free Software Foundation.</p><a id="section10"></a><p><strong>10.</strong> If you wish to incorporate parts of the Program into other free programs whose distribution conditions are different, write to the author to ask for permission. For software which is copyrighted by the Free Software Foundation, write to the Free Software Foundation; we sometimes make exceptions for this. Our decision will be guided by the two goals of preserving the free status of all derivatives of our free software and of promoting the sharing and reuse of software generally.</p><a id="section11"></a><p><strong>NO WARRANTY</strong></p><p><strong>11.</strong> BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.</p><a id="section12"></a><p><strong>12.</strong> IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</p><h3>END OF TERMS AND CONDITIONS</h3><h3><a id="howto"></a><a id="SEC4"></a>How to Apply These Terms to Your New Programs</h3><p>If you develop a new program, and you want it to be of the greatest possible use to the public, the best way to achieve this is to make it free software which everyone can redistribute and change under these terms.</p><p>To do so, attach the following notices to the program. It is safest to attach them to the start of each source file to most effectively convey the exclusion of warranty; and each file should have at least the "copyright" line and a pointer to where the full notice is found.</p><pre><var>one line to give the program''s name and an idea of what it does.</var>\nCopyright (C) <var>yyyy</var>  <var>name of author</var>\n\nThis program is free software; you can redistribute it and/or\nmodify it under the terms of the GNU General Public License\nas published by the Free Software Foundation; either version 2\nof the License, or (at your option) any later version.\n\nThis program is distributed in the hope that it will be useful,\nbut WITHOUT ANY WARRANTY; without even the implied warranty of\nMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\nGNU General Public License for more details.\n\nYou should have received a copy of the GNU General Public License\nalong with this program; if not, write to the Free Software\nFoundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.\n</pre><p>Also add information on how to contact you by electronic and paper mail.</p><p>If the program is interactive, make it output a short notice like this when it starts in an interactive mode:</p><pre>Gnomovision version 69, Copyright (C) <var>year</var> <var>name of author</var>\nGnomovision comes with ABSOLUTELY NO WARRANTY; for details\ntype `show w''.  This is free software, and you are welcome\nto redistribute it under certain conditions; type `show c'' \nfor details.\n</pre><p>The hypothetical commands <samp>`show w''</samp> and <samp>`show c''</samp> should show the appropriate parts of the General Public License. Of course, the commands you use may be called something other than <samp>`show w''</samp> and <samp>`show c''</samp>; they could even be mouse-clicks or menu items--whatever suits your program.</p><p>You should also get your employer (if you work as a programmer) or your school, if any, to sign a "copyright disclaimer" for the program, if necessary. Here is a sample; alter the names:</p><pre>Yoyodyne, Inc., hereby disclaims all copyright\ninterest in the program `Gnomovision''\n(which makes passes at compilers) written \nby James Hacker.\n\n<var>signature of Ty Coon</var>, 1 April 1989\nTy Coon, President of Vice\n</pre><p>This General Public License does not permit incorporating your program into proprietary programs. If your program is a subroutine library, you may consider it more useful to permit linking proprietary applications with the library. If this is what you want to do, use the <a href="http://www.gnu.org/licenses/lgpl.html">GNU Lesser General Public License</a> instead of this License.</p></div><div id="fsf-links"> </div>', 'https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_listing_orders`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_listing_orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `customer_firstname` varchar(255) NOT NULL,
  `customer_lastname` varchar(255) NOT NULL,
  `customer_company` varchar(255) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_fax` varchar(20) NOT NULL,
  `customer_ip` varchar(64) NOT NULL COMMENT 'ipv4 or ipv6',
  `billing_street1` varchar(255) NOT NULL,
  `billing_street2` varchar(255) NOT NULL,
  `billing_district` varchar(100) NOT NULL,
  `billing_landmark` varchar(100) NOT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_state` varchar(255) NOT NULL,
  `billing_zip` varchar(10) NOT NULL,
  `billing_country` varchar(255) NOT NULL,
  `billing_phone` varchar(30) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `order_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_notes` text,
  `discount_name` varchar(255) NOT NULL,
  `discount_code` varchar(50) NOT NULL,
  `order_subtotal` double NOT NULL DEFAULT '0',
  `discount_amount` double NOT NULL,
  `order_tax` double NOT NULL,
  `total_tax` double NOT NULL,
  `order_total` double NOT NULL DEFAULT '0',
  `trans_id` varchar(15) NOT NULL,
  `order_cost` double NOT NULL DEFAULT '0',
  `trans_fee_percent` double NOT NULL,
  `trans_fee` decimal(19,4) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `payment_message` text,
  `notes` text,
  `sales_notes` varchar(30) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_locations`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL,
  `continent_id` int(11) NOT NULL DEFAULT '0',
  `country_id` int(11) NOT NULL DEFAULT '0',
  `state_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `area_id` int(11) NOT NULL DEFAULT '0',
  `zip_id` int(11) NOT NULL,
  `new_id` int(11) DEFAULT '0',
  `continent_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@cache',
  `country_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@cache',
  `state_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@cache',
  `district_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@cache',
  `area_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@cache',
  `zip_title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@cache',
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  KEY `district_id` (`district_id`),
  KEY `area_id` (`area_id`),
  KEY `continent_id` (`continent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1404 ;

--
-- Dumping data for table `wjrcv_sellacious_locations`
--

INSERT INTO `wjrcv_sellacious_locations` (`id`, `title`, `iso_code`, `parent_id`, `type`, `state`, `continent_id`, `country_id`, `state_id`, `district_id`, `area_id`, `zip_id`, `new_id`, `continent_title`, `country_title`, `state_title`, `district_title`, `area_title`, `zip_title`) VALUES
(1, 'ROOT', '', 0, '', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Africa', 'AF', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Antarctica', 'AN', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Asia', 'AS', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Europe', 'EU', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'North america', 'NA', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Oceania', 'OC', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'South america', 'SA', 1, 'continent', 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Angola', 'AO', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(10, 'Burkina Faso', 'BF', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(11, 'Burundi', 'BI', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(12, 'Benin', 'BJ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(13, 'Botswana', 'BW', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(14, 'Democratic Republic of the Congo', 'CD', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(15, 'Central African Republic', 'CF', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(16, 'Republic of the Congo', 'CG', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(17, 'Ivory Coast', 'CI', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(18, 'Cameroon', 'CM', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(19, 'Cape Verde', 'CV', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(20, 'Djibouti', 'DJ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(21, 'Algeria', 'DZ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(22, 'Egypt', 'EG', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(23, 'Western Sahara', 'EH', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(24, 'Eritrea', 'ER', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(25, 'Ethiopia', 'ET', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(26, 'Gabon', 'GA', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(27, 'Ghana', 'GH', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(28, 'Gambia', 'GM', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(29, 'Guinea', 'GN', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(30, 'Equatorial Guinea', 'GQ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(31, 'Guinea-Bissau', 'GW', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(32, 'Kenya', 'KE', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(33, 'Comoros', 'KM', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(34, 'Liberia', 'LR', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(35, 'Lesotho', 'LS', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(36, 'Libya', 'LY', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(37, 'Morocco', 'MA', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(38, 'Madagascar', 'MG', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(39, 'Mali', 'ML', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(40, 'Mauritania', 'MR', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(41, 'Mauritius', 'MU', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(42, 'Malawi', 'MW', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(43, 'Mozambique', 'MZ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(44, 'Namibia', 'NA', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(45, 'Niger', 'NE', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(46, 'Nigeria', 'NG', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(47, 'Reunion', 'RE', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(48, 'Rwanda', 'RW', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(49, 'Seychelles', 'SC', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(50, 'Sudan', 'SD', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(51, 'Saint Helena', 'SH', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(52, 'Sierra Leone', 'SL', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(53, 'Senegal', 'SN', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(54, 'Somalia', 'SO', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(55, 'South Sudan', 'SS', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(56, 'Sao Tome and Principe', 'ST', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(57, 'Swaziland', 'SZ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(58, 'Chad', 'TD', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(59, 'Togo', 'TG', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(60, 'Tunisia', 'TN', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(61, 'Tanzania', 'TZ', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(62, 'Uganda', 'UG', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(63, 'Mayotte', 'YT', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(64, 'South Africa', 'ZA', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(65, 'Zambia', 'ZM', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(66, 'Zimbabwe', 'ZW', 2, 'country', 1, 2, 0, 0, 0, 0, 0, 0, 'Africa', NULL, NULL, NULL, NULL, NULL),
(67, 'Antarctica', 'AQ', 3, 'country', 1, 3, 0, 0, 0, 0, 0, 0, 'Antarctica', NULL, NULL, NULL, NULL, NULL),
(68, 'Bouvet Island', 'BV', 3, 'country', 1, 3, 0, 0, 0, 0, 0, 0, 'Antarctica', NULL, NULL, NULL, NULL, NULL),
(69, 'South Georgia and the South Sandwich Islands', 'GS', 3, 'country', 1, 3, 0, 0, 0, 0, 0, 0, 'Antarctica', NULL, NULL, NULL, NULL, NULL),
(70, 'Heard Island and McDonald Islands', 'HM', 3, 'country', 1, 3, 0, 0, 0, 0, 0, 0, 'Antarctica', NULL, NULL, NULL, NULL, NULL),
(71, 'French Southern Territories', 'TF', 3, 'country', 1, 3, 0, 0, 0, 0, 0, 0, 'Antarctica', NULL, NULL, NULL, NULL, NULL),
(72, 'United Arab Emirates', 'AE', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(73, 'Afghanistan', 'AF', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(74, 'Armenia', 'AM', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(75, 'Azerbaijan', 'AZ', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(76, 'Bangladesh', 'BD', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(77, 'Bahrain', 'BH', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(78, 'Brunei', 'BN', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(79, 'Bhutan', 'BT', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(80, 'Cocos Islands', 'CC', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(81, 'China', 'CN', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(82, 'Christmas Island', 'CX', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(83, 'Georgia', 'GE', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(84, 'Hong Kong', 'HK', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(85, 'Indonesia', 'ID', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(86, 'Israel', 'IL', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(87, 'India', 'IN', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(88, 'British Indian Ocean Territory', 'IO', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(89, 'Iraq', 'IQ', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(90, 'Iran', 'IR', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(91, 'Jordan', 'JO', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(92, 'Japan', 'JP', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(93, 'Kyrgyzstan', 'KG', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(94, 'Cambodia', 'KH', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(95, 'North Korea', 'KP', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(96, 'South Korea', 'KR', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(97, 'Kuwait', 'KW', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(98, 'Kazakhstan', 'KZ', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(99, 'Laos', 'LA', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(100, 'Lebanon', 'LB', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(101, 'Sri Lanka', 'LK', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(102, 'Myanmar', 'MM', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(103, 'Mongolia', 'MN', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(104, 'Macao', 'MO', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(105, 'Maldives', 'MV', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(106, 'Malaysia', 'MY', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(107, 'Nepal', 'NP', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(108, 'Oman', 'OM', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(109, 'Philippines', 'PH', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(110, 'Pakistan', 'PK', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(111, 'Palestinian Territory', 'PS', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(112, 'Qatar', 'QA', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(113, 'Saudi Arabia', 'SA', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(114, 'Singapore', 'SG', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(115, 'Syria', 'SY', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(116, 'Thailand', 'TH', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(117, 'Tajikistan', 'TJ', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(118, 'Turkmenistan', 'TM', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(119, 'Turkey', 'TR', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(120, 'Taiwan', 'TW', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(121, 'Uzbekistan', 'UZ', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(122, 'Vietnam', 'VN', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(123, 'Yemen', 'YE', 4, 'country', 1, 4, 0, 0, 0, 0, 0, 0, 'Asia', NULL, NULL, NULL, NULL, NULL),
(124, 'Andorra', 'AD', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(125, 'Albania', 'AL', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(126, 'Austria', 'AT', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(127, 'Aland Islands', 'AX', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(128, 'Bosnia and Herzegovina', 'BA', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(129, 'Belgium', 'BE', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(130, 'Bulgaria', 'BG', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(131, 'Belarus', 'BY', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(132, 'Switzerland', 'CH', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(133, 'Serbia and Montenegro', 'CS', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(134, 'Cyprus', 'CY', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(135, 'Czech Republic', 'CZ', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(136, 'Germany', 'DE', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(137, 'Denmark', 'DK', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(138, 'Estonia', 'EE', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(139, 'Spain', 'ES', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(140, 'Finland', 'FI', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(141, 'Faroe Islands', 'FO', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(142, 'France', 'FR', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(143, 'United Kingdom', 'GB', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(144, 'Guernsey', 'GG', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(145, 'Gibraltar', 'GI', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(146, 'Greece', 'GR', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(147, 'Croatia', 'HR', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(148, 'Hungary', 'HU', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(149, 'Ireland', 'IE', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(150, 'Isle of Man', 'IM', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(151, 'Iceland', 'IS', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(152, 'Italy', 'IT', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(153, 'Jersey', 'JE', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(154, 'Liechtenstein', 'LI', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(155, 'Lithuania', 'LT', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(156, 'Luxembourg', 'LU', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(157, 'Latvia', 'LV', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(158, 'Monaco', 'MC', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(159, 'Moldova', 'MD', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(160, 'Montenegro', 'ME', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(161, 'Macedonia', 'MK', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(162, 'Malta', 'MT', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(163, 'Netherlands', 'NL', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(164, 'Norway', 'NO', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(165, 'Poland', 'PL', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(166, 'Portugal', 'PT', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(167, 'Romania', 'RO', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(168, 'Serbia', 'RS', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(169, 'Russia', 'RU', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(170, 'Sweden', 'SE', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(171, 'Slovenia', 'SI', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(172, 'Svalbard and Jan Mayen', 'SJ', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(173, 'Slovakia', 'SK', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(174, 'San Marino', 'SM', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(175, 'Ukraine', 'UA', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(176, 'Vatican', 'VA', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(177, 'Kosovo', 'XK', 5, 'country', 1, 5, 0, 0, 0, 0, 0, 0, 'Europe', NULL, NULL, NULL, NULL, NULL),
(178, 'Antigua and Barbuda', 'AG', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(179, 'Anguilla', 'AI', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(180, 'Netherlands Antilles', 'AN', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(181, 'Aruba', 'AW', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(182, 'Barbados', 'BB', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(183, 'Saint Barthelemy', 'BL', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(184, 'Bermuda', 'BM', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(185, 'Bonaire, Saint Eustatius and Saba ', 'BQ', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(186, 'Bahamas', 'BS', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(187, 'Belize', 'BZ', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(188, 'Canada', 'CA', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(189, 'Costa Rica', 'CR', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(190, 'Cuba', 'CU', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(191, 'Curacao', 'CW', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(192, 'Dominica', 'DM', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(193, 'Dominican Republic', 'DO', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(194, 'Grenada', 'GD', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(195, 'Greenland', 'GL', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(196, 'Guadeloupe', 'GP', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(197, 'Guatemala', 'GT', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(198, 'Honduras', 'HN', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(199, 'Haiti', 'HT', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(200, 'Jamaica', 'JM', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(201, 'Saint Kitts and Nevis', 'KN', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(202, 'Cayman Islands', 'KY', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(203, 'Saint Lucia', 'LC', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(204, 'Saint Martin', 'MF', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(205, 'Martinique', 'MQ', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(206, 'Montserrat', 'MS', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(207, 'Mexico', 'MX', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(208, 'Nicaragua', 'NI', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(209, 'Panama', 'PA', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(210, 'Saint Pierre and Miquelon', 'PM', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(211, 'Puerto Rico', 'PR', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(212, 'El Salvador', 'SV', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(213, 'Sint Maarten', 'SX', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(214, 'Turks and Caicos Islands', 'TC', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(215, 'Trinidad and Tobago', 'TT', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(216, 'United States', 'US', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(217, 'Saint Vincent and the Grenadines', 'VC', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(218, 'British Virgin Islands', 'VG', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(219, 'U.S. Virgin Islands', 'VI', 6, 'country', 1, 6, 0, 0, 0, 0, 0, 0, 'North america', NULL, NULL, NULL, NULL, NULL),
(220, 'American Samoa', 'AS', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(221, 'Australia', 'AU', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(222, 'Cook Islands', 'CK', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(223, 'Fiji', 'FJ', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(224, 'Micronesia', 'FM', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(225, 'Guam', 'GU', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(226, 'Kiribati', 'KI', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(227, 'Marshall Islands', 'MH', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(228, 'Northern Mariana Islands', 'MP', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(229, 'New Caledonia', 'NC', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(230, 'Norfolk Island', 'NF', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(231, 'Nauru', 'NR', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(232, 'Niue', 'NU', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(233, 'New Zealand', 'NZ', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(234, 'French Polynesia', 'PF', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(235, 'Papua New Guinea', 'PG', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(236, 'Pitcairn', 'PN', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(237, 'Palau', 'PW', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(238, 'Solomon Islands', 'SB', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(239, 'Tokelau', 'TK', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(240, 'East Timor', 'TL', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(241, 'Tonga', 'TO', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(242, 'Tuvalu', 'TV', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(243, 'United States Minor Outlying Islands', 'UM', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(244, 'Vanuatu', 'VU', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(245, 'Wallis and Futuna', 'WF', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(246, 'Samoa', 'WS', 7, 'country', 1, 7, 0, 0, 0, 0, 0, 0, 'Oceania', NULL, NULL, NULL, NULL, NULL),
(247, 'Argentina', 'AR', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(248, 'Bolivia', 'BO', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(249, 'Brazil', 'BR', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(250, 'Chile', 'CL', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(251, 'Colombia', 'CO', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(252, 'Ecuador', 'EC', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(253, 'Falkland Islands', 'FK', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(254, 'French Guiana', 'GF', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(255, 'Guyana', 'GY', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(256, 'Peru', 'PE', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(257, 'Paraguay', 'PY', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(258, 'Suriname', 'SR', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(259, 'Uruguay', 'UY', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(260, 'Venezuela', 'VE', 8, 'country', 1, 8, 0, 0, 0, 0, 0, 0, 'South america', NULL, NULL, NULL, NULL, NULL),
(261, 'Adrar', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(262, 'Ain-Defla', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(263, 'Ain-Temouchent', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(264, 'Alger', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(265, 'Annaba', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(266, 'Batna', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(267, 'Bechar', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(268, 'Bejaia', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(269, 'Biskra', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(270, 'Blida', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(271, 'Bordj-Bou-Arreridj', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(272, 'Bouira', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(273, 'Boumerdes', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(274, 'Chlef', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(275, 'Constantine', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(276, 'Djelfa', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(277, 'El-Bayadh', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(278, 'El-Oued', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(279, 'El-Taref', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(280, 'Ghardaia', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(281, 'Guelma', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(282, 'Illizi', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(283, 'Jijel', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(284, 'Khenchela', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(285, 'L.Aghouat', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(286, 'M''Sila', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(287, 'Mascara', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(288, 'Medea', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(289, 'Mila', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(290, 'Mostaganem', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(291, 'Naama', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(292, 'Oran', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(293, 'Ouargla', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(294, 'Oum-El-Bouaghi', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(295, 'Relizane', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(296, 'Saida', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(297, 'Setif', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(298, 'Sidi-Bel-Abbes', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(299, 'Skikda', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(300, 'Souk-Ahras', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(301, 'Tamanrasset', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(302, 'Tebessa', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(303, 'Tiaret', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(304, 'Tindouf', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(305, 'Tipaza', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(306, 'Tissemsilt', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(307, 'Tizi-Ouzou', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(308, 'Tlemcen', '', 21, 'state', 1, 2, 21, 0, 0, 0, 0, 0, 'Africa', 'Algeria', NULL, NULL, NULL, NULL),
(309, 'Réunion', '', 47, 'state', 1, 2, 47, 0, 0, 0, 0, 0, 'Africa', 'Reunion', NULL, NULL, NULL, NULL),
(310, 'Reunion (general)', '', 47, 'state', 1, 2, 47, 0, 0, 0, 0, 0, 'Africa', 'Reunion', NULL, NULL, NULL, NULL),
(311, 'Bandraboua', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(312, 'Bandrele', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(313, 'Bouéni', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(314, 'Chiconi', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(315, 'Chirongui', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(316, 'Dembeni', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(317, 'Kani-Kéli', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(318, 'Koungou', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(319, 'M''Tsangamouji', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(320, 'Mamoudzou', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(321, 'Mtsamboro', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(322, 'Ouangani', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(323, 'Sada', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(324, 'Tsingoni', '', 63, 'state', 1, 2, 63, 0, 0, 0, 0, 0, 'Africa', 'Mayotte', NULL, NULL, NULL, NULL),
(325, 'Andaman & Nicobar Islands', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(326, 'Andhra Pradesh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(327, 'Arunachal Pradesh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(328, 'Assam', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(329, 'Bihar', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(330, 'Chandigarh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(331, 'Chattisgarh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(332, 'Dadra & Nagar Haveli', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(333, 'Daman & Diu', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(334, 'Delhi', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(335, 'Goa', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(336, 'Gujarat', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(337, 'Haryana', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(338, 'Himachal Pradesh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(339, 'Jammu & Kashmir', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(340, 'Jharkhand', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(341, 'Karnataka', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(342, 'Kerala', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(343, 'Lakshadweep', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(344, 'Madhya Pradesh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(345, 'Maharashtra', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(346, 'Manipur', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(347, 'Meghalaya', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(348, 'Mizoram', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(349, 'Nagaland', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(350, 'Odisha', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(351, 'Pondicherry', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(352, 'Punjab', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(353, 'Rajasthan', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(354, 'Sikkim', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(355, 'Tamil Nadu', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(356, 'Telangana', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(357, 'Tripura', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(358, 'Uttar Pradesh', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(359, 'Uttarakhand', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(360, 'West Bengal', '', 87, 'state', 1, 4, 87, 0, 0, 0, 0, 0, 'Asia', 'India', NULL, NULL, NULL, NULL),
(361, 'Aichiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(362, 'Chibaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(363, 'Ehimeken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(364, 'Fukuiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(365, 'Fukuokaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(366, 'Fukushimaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(367, 'Gifuken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(368, 'Gunmaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(369, 'Hiroshimaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(370, 'Hyougoken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(371, 'Ibarakiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(372, 'Ishikawaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(373, 'Kagawaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(374, 'Kagoshimaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(375, 'Kanagawaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(376, 'Kouchiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(377, 'Kumamotoken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(378, 'Kyoutofu', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(379, 'Mieken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(380, 'Miyagiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(381, 'Miyazakiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(382, 'Naganoken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(383, 'Nagasakiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(384, 'Naraken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(385, 'Niigataken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(386, 'Okayamaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(387, 'Okinawaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(388, 'Ooitaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(389, 'Oosakafu', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(390, 'Sagaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(391, 'Saitamaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(392, 'Shigaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(393, 'Shimaneken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(394, 'Shizuokaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(395, 'Tochigiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(396, 'Tokushimaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(397, 'Tottoriken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(398, 'Toukyouto', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(399, 'Toyamaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(400, 'Wakayamaken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(401, 'Yamagataken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(402, 'Yamaguchiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(403, 'Yamanashiken', '', 92, 'state', 1, 4, 92, 0, 0, 0, 0, 0, 'Asia', 'Japan', NULL, NULL, NULL, NULL),
(404, 'Johor', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(405, 'Kedah', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(406, 'Kelantan', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(407, 'Kuala Lumpur', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(408, 'Labuan', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(409, 'Melaka', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(410, 'Negeri Sembilan', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(411, 'Pahang', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(412, 'Perak', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(413, 'Perlis', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(414, 'Pulau Pinang', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(415, 'Putrajaya', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(416, 'Sabah', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(417, 'Sarawak', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(418, 'Selangor', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(419, 'Terengganu', '', 106, 'state', 1, 4, 106, 0, 0, 0, 0, 0, 'Asia', 'Malaysia', NULL, NULL, NULL, NULL),
(420, 'Balochisan', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(421, 'Federal Capial &AJK', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(422, 'Hyderabad', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(423, 'Lahore', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(424, 'Norhern Punajb Rawalpindi', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(425, 'NWFP Peshawar', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(426, 'Souhern Punajb Mulan', '', 110, 'state', 1, 4, 110, 0, 0, 0, 0, 0, 'Asia', 'Pakistan', NULL, NULL, NULL, NULL),
(427, 'Amnat Charoen', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(428, 'Ang Thong', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(429, 'Bangkok', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(430, 'Burirum', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(431, 'Chachoengsao', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(432, 'Chainat', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(433, 'Chaiyaphum', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(434, 'Chanthaburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(435, 'Chiang Mai', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(436, 'Chiang Rai', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(437, 'Chonburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(438, 'Chumphon', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(439, 'Kalasin', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(440, 'Kamphaeng Phet', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(441, 'Khanchanaburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(442, 'Khon Kaen', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(443, 'Krabi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(444, 'Lampang', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(445, 'Lamphun', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(446, 'Loei', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(447, 'Lopburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(448, 'Mae Hong Son', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(449, 'Maha Sarakham', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(450, 'Mukdahan', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(451, 'Na Tan', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(452, 'Nakhon Nayok', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(453, 'Nakhon Pathom', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(454, 'Nakhon Phanom', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(455, 'Nakhon Ratchasima', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(456, 'Nakhon Sawan', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(457, 'Nakhon Sie Thammarat', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(458, 'Nan', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(459, 'Narathiwat', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(460, 'Non Bua Lam Phu', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(461, 'Nong Khai', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(462, 'Nonthaburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(463, 'Pathum Thani', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(464, 'Pattani', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(465, 'Phang Nga', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(466, 'Phatthalung', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(467, 'Phayao', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(468, 'Phetchabun', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(469, 'Phetchaburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(470, 'Phichit', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(471, 'Phitsanulok', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(472, 'Phrae', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(473, 'Phranakhon Si Ayutthaya', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(474, 'Phuket', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(475, 'Prachinburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(476, 'Prachuap Khirikhan', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(477, 'Ranong', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(478, 'Ratchaburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL);
INSERT INTO `wjrcv_sellacious_locations` (`id`, `title`, `iso_code`, `parent_id`, `type`, `state`, `continent_id`, `country_id`, `state_id`, `district_id`, `area_id`, `zip_id`, `new_id`, `continent_title`, `country_title`, `state_title`, `district_title`, `area_title`, `zip_title`) VALUES
(479, 'Rayong', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(480, 'Roi Et', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(481, 'Sa Kaeo', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(482, 'Sakon Nakhon', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(483, 'Samut Prakan', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(484, 'Samut Sakhon', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(485, 'Samut Songkhram', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(486, 'Saraburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(487, 'Satun', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(488, 'Singburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(489, 'Sisaket', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(490, 'Songkhla', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(491, 'Sukhothai', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(492, 'Suphanburi', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(493, 'Surat Thani', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(494, 'Tak', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(495, 'Trang', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(496, 'Trat', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(497, 'Ubon Ratchathani', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(498, 'Udon Thani', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(499, 'Uthai Thani', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(500, 'Uttaradit', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(501, 'Yala', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(502, 'Yasothon', '', 116, 'state', 1, 4, 116, 0, 0, 0, 0, 0, 'Asia', 'Thailand', NULL, NULL, NULL, NULL),
(503, 'Adana', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(504, 'Adiyaman', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(505, 'Afyonkarahisar', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(506, 'Ağri', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(507, 'Aksaray', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(508, 'Amasya', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(509, 'Ankara', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(510, 'Antalya', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(511, 'Ardahan', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(512, 'Artvin', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(513, 'Aydin', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(514, 'Balikesir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(515, 'Bartin', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(516, 'Batman', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(517, 'Bayburt', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(518, 'Bilecik', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(519, 'Bingöl', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(520, 'Bitlis', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(521, 'Bolu', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(522, 'Burdur', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(523, 'Bursa', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(524, 'Çanakkale', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(525, 'Çankiri', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(526, 'Çorum', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(527, 'Denizli', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(528, 'Diyarbakir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(529, 'Düzce', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(530, 'Edirne', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(531, 'Elaziğ', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(532, 'Erzincan', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(533, 'Erzurum', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(534, 'Eskişehir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(535, 'Gaziantep', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(536, 'Giresun', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(537, 'Gümüşhane', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(538, 'Hakkari', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(539, 'Hatay', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(540, 'Iğdir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(541, 'Isparta', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(542, 'İstanbul', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(543, 'İzmir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(544, 'Kahramanmaraş', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(545, 'Karabük', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(546, 'Karaman', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(547, 'Kars', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(548, 'Kastamonu', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(549, 'Kayseri', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(550, 'Kilis', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(551, 'Kirikkale', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(552, 'Kirklareli', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(553, 'Kirşehir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(554, 'Kktc', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(555, 'Kocaeli', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(556, 'Konya', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(557, 'Kütahya', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(558, 'Malatya', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(559, 'Manisa', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(560, 'Mardin', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(561, 'Mersin(İçel)', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(562, 'Muğla', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(563, 'Muş', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(564, 'Nevşehir', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(565, 'Niğde', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(566, 'Ordu', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(567, 'Osmaniye', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(568, 'Rize', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(569, 'Sakarya', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(570, 'Samsun', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(571, 'Şanliurfa', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(572, 'Siirt', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(573, 'Sinop', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(574, 'Şirnak', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(575, 'Sivas', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(576, 'Tekirdağ', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(577, 'Tokat', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(578, 'Trabzon', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(579, 'Tunceli', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(580, 'Uşak', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(581, 'Van', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(582, 'Yalova', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(583, 'Yozgat', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(584, 'Zonguldak', '', 119, 'state', 1, 4, 119, 0, 0, 0, 0, 0, 'Asia', 'Turkey', NULL, NULL, NULL, NULL),
(585, 'Burgenland', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(586, 'Kärnten', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(587, 'Niederösterreich', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(588, 'Oberösterreich', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(589, 'Salzburg', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(590, 'Steiermark', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(591, 'Tirol', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(592, 'Vorarlberg', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(593, 'Wien', '', 126, 'state', 1, 5, 126, 0, 0, 0, 0, 0, 'Europe', 'Austria', NULL, NULL, NULL, NULL),
(594, 'Ålands landsbygd', '', 127, 'state', 1, 5, 127, 0, 0, 0, 0, 0, 'Europe', 'Aland Islands', NULL, NULL, NULL, NULL),
(595, 'Ålands skärgård', '', 127, 'state', 1, 5, 127, 0, 0, 0, 0, 0, 'Europe', 'Aland Islands', NULL, NULL, NULL, NULL),
(596, 'Mariehamns stad', '', 127, 'state', 1, 5, 127, 0, 0, 0, 0, 0, 'Europe', 'Aland Islands', NULL, NULL, NULL, NULL),
(597, 'Bruxelles-Capitale', '', 129, 'state', 1, 5, 129, 0, 0, 0, 0, 0, 'Europe', 'Belgium', NULL, NULL, NULL, NULL),
(598, 'Vlaanderen', '', 129, 'state', 1, 5, 129, 0, 0, 0, 0, 0, 'Europe', 'Belgium', NULL, NULL, NULL, NULL),
(599, 'Wallonie', '', 129, 'state', 1, 5, 129, 0, 0, 0, 0, 0, 'Europe', 'Belgium', NULL, NULL, NULL, NULL),
(600, 'Благоевград / Blagoevgrad', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(601, 'Бургас / Burgas', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(602, 'Варна / Varna', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(603, 'Велико Търново / Veliko Turnovo', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(604, 'Видин / Vidin', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(605, 'Враца / Vraca', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(606, 'Габрово / Gabrovo', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(607, 'Добрич / Dobrich', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(608, 'Кърджали / Kurdzhali', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(609, 'Кюстендил / Kjustendil', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(610, 'Ловеч / Lovech', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(611, 'Монтана / Montana', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(612, 'Пазарджик / Pazardzhik', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(613, 'Перник / Pernik', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(614, 'Плевен / Pleven', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(615, 'Пловдив / Plovdiv', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(616, 'Разград / Razgrad', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(617, 'Русе / Ruse', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(618, 'Силистра / Silistra', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(619, 'Сливен / Sliven', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(620, 'Смолян / Smoljan', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(621, 'София (столица) / Sofija (stolica)', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(622, 'София / Sofija', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(623, 'Стара Загора / Stara Zagora', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(624, 'Търговище / Turgovishhe', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(625, 'Хасково / Khaskovo', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(626, 'Шумен / Shumen', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(627, 'Ямбол / Jambol', '', 130, 'state', 1, 5, 130, 0, 0, 0, 0, 0, 'Europe', 'Bulgaria', NULL, NULL, NULL, NULL),
(628, 'Canton de Fribourg', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(629, 'Canton de Genève', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(630, 'Canton de Neuchâtel', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(631, 'Canton de Vaud', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(632, 'Canton du Jura', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(633, 'Canton du Valais', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(634, 'Cantone Ticino', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(635, 'Kanton Aargau', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(636, 'Kanton Appenzell Ausserrhoden', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(637, 'Kanton Appenzell Innerrhoden', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(638, 'Kanton Basel-Landschaft', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(639, 'Kanton Basel-Stadt', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(640, 'Kanton Bern', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(641, 'Kanton Glarus', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(642, 'Kanton Graubünden', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(643, 'Kanton Luzern', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(644, 'Kanton Nidwalden', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(645, 'Kanton Obwalden', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(646, 'Kanton Schaffhausen', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(647, 'Kanton Schwyz', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(648, 'Kanton Solothurn', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(649, 'Kanton St. Gallen', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(650, 'Kanton Thurgau', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(651, 'Kanton Uri', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(652, 'Kanton Zug', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(653, 'Kanton Zürich', '', 132, 'state', 1, 5, 132, 0, 0, 0, 0, 0, 'Europe', 'Switzerland', NULL, NULL, NULL, NULL),
(654, 'Baden-Württemberg', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(655, 'Bayern', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(656, 'Berlin', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(657, 'Brandenburg', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(658, 'Bremen', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(659, 'Hamburg', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(660, 'Hessen', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(661, 'Mecklenburg-Vorpommern', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(662, 'Niedersachsen', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(663, 'Nordrhein-Westfalen', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(664, 'Rheinland-Pfalz', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(665, 'Saarland', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(666, 'Sachsen', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(667, 'Sachsen-Anhalt', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(668, 'Schleswig-Holstein', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(669, 'Thüringen', '', 136, 'state', 1, 5, 136, 0, 0, 0, 0, 0, 'Europe', 'Germany', NULL, NULL, NULL, NULL),
(670, 'Region Hovedstaden', '', 137, 'state', 1, 5, 137, 0, 0, 0, 0, 0, 'Europe', 'Denmark', NULL, NULL, NULL, NULL),
(671, 'Region Midtjylland', '', 137, 'state', 1, 5, 137, 0, 0, 0, 0, 0, 'Europe', 'Denmark', NULL, NULL, NULL, NULL),
(672, 'Region Nordjylland', '', 137, 'state', 1, 5, 137, 0, 0, 0, 0, 0, 'Europe', 'Denmark', NULL, NULL, NULL, NULL),
(673, 'Region Sjælland', '', 137, 'state', 1, 5, 137, 0, 0, 0, 0, 0, 'Europe', 'Denmark', NULL, NULL, NULL, NULL),
(674, 'Region Syddanmark', '', 137, 'state', 1, 5, 137, 0, 0, 0, 0, 0, 'Europe', 'Denmark', NULL, NULL, NULL, NULL),
(675, 'Andalucia', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(676, 'Aragon', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(677, 'Asturias', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(678, 'Baleares', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(679, 'Canarias', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(680, 'Cantabria', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(681, 'Castilla - La Mancha', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(682, 'Castilla - Leon', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(683, 'Cataluna', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(684, 'Ceuta', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(685, 'Comunidad Valenciana', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(686, 'Extremadura', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(687, 'Galicia', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(688, 'La Rioja', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(689, 'Madrid', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(690, 'Melilla', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(691, 'Murcia', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(692, 'Navarra', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(693, 'Pais Vasco', '', 139, 'state', 1, 5, 139, 0, 0, 0, 0, 0, 'Europe', 'Spain', NULL, NULL, NULL, NULL),
(694, 'Etelä-Karjala', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(695, 'Etelä-Pohjanmaa', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(696, 'Etelä-Savo', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(697, 'Kainuu', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(698, 'Kanta-Häme', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(699, 'Keski-Pohjanmaa', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(700, 'Keski-Suomi', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(701, 'Kymenlaakso', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(702, 'Lappi', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(703, 'Päijät-Häme', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(704, 'Pirkanmaa', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(705, 'Pohjanmaa', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(706, 'Pohjois-Karjala', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(707, 'Pohjois-Pohjanmaa', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(708, 'Pohjois-Savo', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(709, 'Satakunta', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(710, 'Uusimaa', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(711, 'Varsinais-Suomi', '', 140, 'state', 1, 5, 140, 0, 0, 0, 0, 0, 'Europe', 'Finland', NULL, NULL, NULL, NULL),
(712, 'Alsace-Champagne-Ardenne-Lorraine', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(713, 'Aquitaine-Limousin-Poitou-Charentes', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(714, 'Auvergne-Rhône-Alpes', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(715, 'Bourgogne-Franche-Comté', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(716, 'Bretagne', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(717, 'Centre', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(718, 'Corse', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(719, 'Île-de-France', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(720, 'Languedoc-Roussillon-Midi-Pyrénées', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(721, 'Nord-Pas-de-Calais-Picardie', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(722, 'Normandy', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(723, 'Pays de la Loire', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(724, 'Provence-Alpes-Côte d''Azur', '', 142, 'state', 1, 5, 142, 0, 0, 0, 0, 0, 'Europe', 'France', NULL, NULL, NULL, NULL),
(725, 'England', '', 143, 'state', 1, 5, 143, 0, 0, 0, 0, 0, 'Europe', 'United Kingdom', NULL, NULL, NULL, NULL),
(726, 'Northern Ireland', '', 143, 'state', 1, 5, 143, 0, 0, 0, 0, 0, 'Europe', 'United Kingdom', NULL, NULL, NULL, NULL),
(727, 'Scotland', '', 143, 'state', 1, 5, 143, 0, 0, 0, 0, 0, 'Europe', 'United Kingdom', NULL, NULL, NULL, NULL),
(728, 'Wales', '', 143, 'state', 1, 5, 143, 0, 0, 0, 0, 0, 'Europe', 'United Kingdom', NULL, NULL, NULL, NULL),
(729, 'Bjelovarsko-Bilogorska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(730, 'Brodsko-Posavska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(731, 'Dubrovačko-Neretvanska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(732, 'Istarska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(733, 'Karlovačka', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(734, 'Koprivničko-Križevačka', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(735, 'Krapinsko-Zagorska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(736, 'Ličko-Senjska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(737, 'Međimurska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(738, 'Osječko-Baranjska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(739, 'Požeško-Slavonska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(740, 'Primorsko-Goranska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(741, 'Šibensko-Kninska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(742, 'Sisačko-Moslavačka', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(743, 'Splitsko-Dalmatinska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(744, 'Varaždinska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(745, 'Virovitičko-Podravska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(746, 'Vukovarsko-Srijemska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(747, 'Zadarska', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(748, 'Zagrebačka', '', 147, 'state', 1, 5, 147, 0, 0, 0, 0, 0, 'Europe', 'Croatia', NULL, NULL, NULL, NULL),
(749, 'Bács-Kiskun', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(750, 'Baranya', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(751, 'Békés', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(752, 'Borsod-Abaúj-Zemplén', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(753, 'Budapest', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(754, 'Csongrád', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(755, 'Fejér', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(756, 'Győr-Moson-Sopron', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(757, 'Hajdú-Bihar', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(758, 'Heves', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(759, 'Jász-Nagykun-Szolnok', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(760, 'Komárom-Esztergom', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(761, 'Nógrád', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(762, 'Pest', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(763, 'Somogy', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(764, 'Szabolcs-Szatmár-Bereg', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(765, 'Tolna', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(766, 'Vas', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(767, 'Veszprém', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(768, 'Zala', '', 148, 'state', 1, 5, 148, 0, 0, 0, 0, 0, 'Europe', 'Hungary', NULL, NULL, NULL, NULL),
(769, 'Abruzzi', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(770, 'Basilicata', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(771, 'Calabria', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(772, 'Campania', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(773, 'Emilia-Romagna', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(774, 'Friuli-Venezia Giulia', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(775, 'Lazio', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(776, 'Liguria', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(777, 'Lombardia', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(778, 'Marche', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(779, 'Molise', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(780, 'Piemonte', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(781, 'Puglia', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(782, 'Sardegna', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(783, 'Sicilia', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(784, 'Toscana', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(785, 'Trentino-Alto Adige', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(786, 'Umbria', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(787, 'Valle D''Aosta', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(788, 'Veneto', '', 152, 'state', 1, 5, 152, 0, 0, 0, 0, 0, 'Europe', 'Italy', NULL, NULL, NULL, NULL),
(789, 'Balzers', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(790, 'Eschen', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(791, 'Gamprin', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(792, 'Mauren', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(793, 'Planken', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(794, 'Ruggell', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(795, 'Schaan', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(796, 'Schellenberg', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(797, 'Triesen', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(798, 'Triesenberg', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(799, 'Vaduz', '', 154, 'state', 1, 5, 154, 0, 0, 0, 0, 0, 'Europe', 'Liechtenstein', NULL, NULL, NULL, NULL),
(800, 'Monaco', '', 158, 'state', 1, 5, 158, 0, 0, 0, 0, 0, 'Europe', 'Monaco', NULL, NULL, NULL, NULL),
(801, 'Anenii Noi', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(802, 'Balti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(803, 'Bender Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(804, 'Briceni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(805, 'Cahul', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(806, 'Calarasi', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(807, 'Camenca Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(808, 'Cantemir', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(809, 'Cantrmir', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(810, 'Canul', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(811, 'Causeni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(812, 'Cimislia', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(813, 'Comrat', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(814, 'Criuleni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(815, 'Criuleni- Dub.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(816, 'Criuleni-Dub.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(817, 'Criulenii-Dub.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(818, 'Donduseni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(819, 'Drochia', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(820, 'Dubasari Cr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(821, 'Dubasari Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(822, 'Edinet', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(823, 'Falesti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(824, 'Floresti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(825, 'Glodeni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(826, 'Grigoriopol Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(827, 'Hincesti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(828, 'Ialoveni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(829, 'Lazo', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(830, 'Leova', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(831, 'Mun.Balti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(832, 'Mun.Chisinau', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(833, 'Nisporeni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(834, 'Ocnita', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(835, 'Orhei', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(836, 'Rezina', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(837, 'Ribnita Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(838, 'Riscani', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(839, 'Singerei', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(840, 'Slobozia Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(841, 'Soldanesti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(842, 'Soroca', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(843, 'Stefan-Voda', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(844, 'Straseni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(845, 'Taraclia', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(846, 'Telenesti', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(847, 'Tiraspol Tr.', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(848, 'Uhnheni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(849, 'Ungheni', '', 159, 'state', 1, 5, 159, 0, 0, 0, 0, 0, 'Europe', 'Moldova', NULL, NULL, NULL, NULL),
(850, 'Attard', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(851, 'Balzan', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(852, 'Birkirkara', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(853, 'Birżebbuġa', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(854, 'Bormla', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(855, 'Dingli', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(856, 'Għajnsielem', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(857, 'Ħal Għargħur', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(858, 'Ħal Għaxaq', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(859, 'Ħaż-Żabbar', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(860, 'Ħaż-Żebbuġ', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(861, 'Il-Belt Valletta', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(862, 'Il-Birgu', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(863, 'Il-Fgura', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(864, 'Il-Fontana', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(865, 'Il-Furjana', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(866, 'Il-Gudja', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(867, 'Il-Gżira', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(868, 'Il-Ħamrun', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(869, 'Il-Kalkara', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(870, 'Il-Marsa', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(871, 'Il-Mellieħa', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(872, 'Il-Mosta', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(873, 'Il-Munxar', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(874, 'Il-Qala', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(875, 'Il-Qrendi', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(876, 'In-Nadur', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(877, 'In-Naxxar', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(878, 'Ir-Rabat', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(879, 'Is-Siġġiewi', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(880, 'Is-Swieqi', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(881, 'Ix-Xagħra', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(882, 'Ix-Xewkija', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(883, 'Ix-Xgħajra', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(884, 'Iż-Żebbuġ', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(885, 'Iż-Żejtun', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(886, 'Iż-Żurrieq', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(887, 'Kirkop', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(888, 'L-Għarb', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(889, 'L-Għasri', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(890, 'L-Iklin', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(891, 'L-Imdina', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(892, 'L-Imġarr', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(893, 'L-Imqabba', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(894, 'L-Imsida', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(895, 'L-Imtarfa', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(896, 'L-Isla', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(897, 'Lija', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(898, 'Luqa', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(899, 'Marsaskala', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(900, 'Marsaxlokk', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(901, 'Paola', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(902, 'Pembroke', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(903, 'Qormi', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(904, 'Safi', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(905, 'Saint John', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(906, 'Saint Julian''s', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(907, 'Saint Lawrence', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(908, 'Saint Lucia', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(909, 'Saint Paul’s Bay', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(910, 'Saint Venera', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(911, 'Sannat', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(912, 'Ta’ Kerċem', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(913, 'Ta’ Xbiex', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(914, 'Tal-Pietà', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(915, 'Tarxien', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(916, 'Tas-Sliema', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(917, 'Victoria', '', 162, 'state', 1, 5, 162, 0, 0, 0, 0, 0, 'Europe', 'Malta', NULL, NULL, NULL, NULL),
(918, 'Provincie Drenthe', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(919, 'Provincie Flevoland', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(920, 'Provincie Friesland', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(921, 'Provincie Gelderland', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(922, 'Provincie Groningen', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(923, 'Provincie Limburg', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(924, 'Provincie Noord-Brabant', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(925, 'Provincie Noord-Holland', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(926, 'Provincie Overijssel', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(927, 'Provincie Utrecht', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(928, 'Provincie Zeeland', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(929, 'Provincie Zuid-Holland', '', 163, 'state', 1, 5, 163, 0, 0, 0, 0, 0, 'Europe', 'Netherlands', NULL, NULL, NULL, NULL),
(930, 'Akershus', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(931, 'Aust-Agder', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(932, 'Buskerud', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(933, 'Finnmark', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(934, 'Hedmark', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL);
INSERT INTO `wjrcv_sellacious_locations` (`id`, `title`, `iso_code`, `parent_id`, `type`, `state`, `continent_id`, `country_id`, `state_id`, `district_id`, `area_id`, `zip_id`, `new_id`, `continent_title`, `country_title`, `state_title`, `district_title`, `area_title`, `zip_title`) VALUES
(935, 'Hordaland', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(936, 'More og Romdal', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(937, 'Nord-Trondelag', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(938, 'Nordland', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(939, 'Oppland', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(940, 'Oslo', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(941, 'Ostfold', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(942, 'Rogaland', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(943, 'Sogn og Fjordane', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(944, 'Sor-Trondelag', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(945, 'Telemark', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(946, 'Troms', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(947, 'Vest-Agder', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(948, 'Vestfold', '', 164, 'state', 1, 5, 164, 0, 0, 0, 0, 0, 'Europe', 'Norway', NULL, NULL, NULL, NULL),
(949, 'Dolnośląskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(950, 'Kujawsko-Pomorskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(951, 'Lubelskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(952, 'Lubuskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(953, 'Łódzkie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(954, 'Małopolskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(955, 'Mazowieckie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(956, 'Opolskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(957, 'Podkarpackie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(958, 'Podlaskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(959, 'Pomorskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(960, 'Śląskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(961, 'Świętokrzyskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(962, 'Warmińsko-Mazurskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(963, 'Wielkopolskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(964, 'Zachodniopomorskie', '', 165, 'state', 1, 5, 165, 0, 0, 0, 0, 0, 'Europe', 'Poland', NULL, NULL, NULL, NULL),
(965, 'Aveiro', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(966, 'Beja', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(967, 'Braga', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(968, 'Bragança', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(969, 'Castelo Branco', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(970, 'Coimbra', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(971, 'Évora', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(972, 'Faro', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(973, 'Guarda', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(974, 'Ilha da Graciosa', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(975, 'Ilha da Madeira', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(976, 'Ilha das Flores', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(977, 'Ilha de Porto Santo', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(978, 'Ilha de Santa Maria', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(979, 'Ilha de São Jorge', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(980, 'Ilha de São Miguel', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(981, 'Ilha do Corvo', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(982, 'Ilha do Faial', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(983, 'Ilha do Pico', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(984, 'Ilha Terceira', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(985, 'Leiria', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(986, 'Lisboa', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(987, 'Portalegre', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(988, 'Porto', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(989, 'Santarém', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(990, 'Setúbal', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(991, 'Viana do Castelo', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(992, 'Vila Real', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(993, 'Viseu', '', 166, 'state', 1, 5, 166, 0, 0, 0, 0, 0, 'Europe', 'Portugal', NULL, NULL, NULL, NULL),
(994, 'Arad', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(995, 'Bihor', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(996, 'Covasna', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(997, 'Dolj', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(998, 'Giurgiu', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(999, 'Gorj', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1000, 'Harghita', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1001, 'Hunedoara', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1002, 'Ilfov', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1003, 'Judeţul Alba', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1004, 'Judeţul Argeş', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1005, 'Judeţul Bacău', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1006, 'Judeţul Bistriţa-Năsăud', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1007, 'Judeţul Botoşani', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1008, 'Judeţul Brăila', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1009, 'Judeţul Braşov', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1010, 'Judeţul Buzău', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1011, 'Judeţul Călăraşi', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1012, 'Judeţul Caraş-Severin', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1013, 'Judeţul Cluj', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1014, 'Judeţul Constanţa', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1015, 'Judeţul Dâmboviţa', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1016, 'Judeţul Galaţi', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1017, 'Judeţul Ialomiţa', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1018, 'Judeţul Iaşi', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1019, 'Judeţul Maramureş', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1020, 'Judeţul Mehedinţi', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1021, 'Judeţul Mureş', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1022, 'Judeţul Neamţ', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1023, 'Judeţul Sălaj', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1024, 'Judeţul Sibiu', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1025, 'Judeţul Timiş', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1026, 'Judeţul Vâlcea', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1027, 'Olt', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1028, 'Prahova', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1029, 'Satu Mare', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1030, 'Suceava', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1031, 'Teleorman', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1032, 'Tulcea', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1033, 'Vaslui', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1034, 'Vrancea', '', 167, 'state', 1, 5, 167, 0, 0, 0, 0, 0, 'Europe', 'Romania', NULL, NULL, NULL, NULL),
(1035, 'Адыгея Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1036, 'Алтай Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1037, 'Алтайский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1038, 'Амурская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1039, 'Архангельская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1040, 'Астраханская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1041, 'Байконур', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1042, 'Башкортостан Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1043, 'Белгородская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1044, 'Брянская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1045, 'Бурятия Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1046, 'Владимирская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1047, 'Волгоградская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1048, 'Вологодская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1049, 'Воронежская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1050, 'Дагестан Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1051, 'Ивановская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1052, 'Ингушетия Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1053, 'Иркутская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1054, 'Кабардино-Балкарская Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1055, 'Калининградская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1056, 'Калмыкия Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1057, 'Калужская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1058, 'Камчатская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1059, 'Карачаево-Черкесская Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1060, 'Карелия Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1061, 'Кемеровская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1062, 'Кировская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1063, 'Коми Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1064, 'Костромская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1065, 'Краснодарский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1066, 'Красноярский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1067, 'Курганская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1068, 'Курская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1069, 'Ленинградская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1070, 'Липецкая Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1071, 'Магаданская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1072, 'Марий Эл Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1073, 'Мордовия Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1074, 'Москва', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1075, 'Московская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1076, 'Мурманская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1077, 'Нижегородская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1078, 'Новгородская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1079, 'Новосибирская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1080, 'Омская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1081, 'Оренбургская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1082, 'Орловская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1083, 'Пензенская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1084, 'Пермский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1085, 'Приморский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1086, 'Псковская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1087, 'Ростовская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1088, 'Рязанская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1089, 'Самарская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1090, 'Санкт-Петербург', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1091, 'Саратовская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1092, 'Саха (Якутия) Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1093, 'Сахалинская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1094, 'Свердловская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1095, 'Северная Осетия-Алания Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1096, 'Смоленская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1097, 'Ставропольский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1098, 'Тамбовская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1099, 'Татарстан Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1100, 'Тверская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1101, 'Томская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1102, 'Тульская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1103, 'Тыва Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1104, 'Тюменская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1105, 'Удмуртская Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1106, 'Ульяновская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1107, 'Хабаровский Край', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1108, 'Хакасия Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1109, 'Челябинская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1110, 'Чеченская Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1111, 'Читинская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1112, 'Чувашская Республика', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1113, 'Ярославская Область', '', 169, 'state', 1, 5, 169, 0, 0, 0, 0, 0, 'Europe', 'Russia', NULL, NULL, NULL, NULL),
(1114, 'Blekinge', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1115, 'Dalarna', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1116, 'Gävleborg', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1117, 'Gotland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1118, 'Halland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1119, 'Jämtland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1120, 'Jönköping', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1121, 'Kalmar', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1122, 'Kronoberg', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1123, 'Norrbotten', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1124, 'Örebro', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1125, 'Östergötland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1126, 'Skåne', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1127, 'Södermanland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1128, 'Stockholm', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1129, 'Uppsala', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1130, 'Värmland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1131, 'Västerbotten', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1132, 'Västernorrland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1133, 'Västmanland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1134, 'Västra Götaland', '', 170, 'state', 1, 5, 170, 0, 0, 0, 0, 0, 'Europe', 'Sweden', NULL, NULL, NULL, NULL),
(1135, 'Jan Mayen', '', 172, 'state', 1, 5, 172, 0, 0, 0, 0, 0, 'Europe', 'Svalbard and Jan Mayen', NULL, NULL, NULL, NULL),
(1136, 'Svalbard', '', 172, 'state', 1, 5, 172, 0, 0, 0, 0, 0, 'Europe', 'Svalbard and Jan Mayen', NULL, NULL, NULL, NULL),
(1137, 'Alberta', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1138, 'British Columbia', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1139, 'Manitoba', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1140, 'New Brunswick', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1141, 'Newfoundland and Labrador', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1142, 'Northwest Territory', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1143, 'Nova Scotia', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1144, 'Nunavut Territory', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1145, 'Ontario', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1146, 'Prince Edward Island', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1147, 'Quebec', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1148, 'Saskatchewan', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1149, 'Yukon', '', 188, 'state', 1, 6, 188, 0, 0, 0, 0, 0, 'North america', 'Canada', NULL, NULL, NULL, NULL),
(1150, 'Guadeloupe', '', 196, 'state', 1, 6, 196, 0, 0, 0, 0, 0, 'North america', 'Guadeloupe', NULL, NULL, NULL, NULL),
(1151, 'Ciudad de Guatemala', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1152, 'DEPTO DE ALTA VERAPAZ', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1153, 'DEPTO DE BAJA VERAPAZ', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1154, 'DEPTO DE CHIMALTENANGO', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1155, 'DEPTO DE CHIQUIMULA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1156, 'DEPTO DE EL PROGRESO', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1157, 'DEPTO DE ESCUINTLA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1158, 'DEPTO DE GUATEMALA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1159, 'DEPTO DE HUEHUETENANGO', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1160, 'DEPTO DE IZABAL', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1161, 'DEPTO DE JALAPA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1162, 'DEPTO DE JUTIAPA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1163, 'DEPTO DE PETEN', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1164, 'DEPTO DE QUETZALTENANGO', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1165, 'DEPTO DE RETALHULEU', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1166, 'DEPTO DE SACATEPEQUEZ', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1167, 'DEPTO DE SAN MARCOS', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1168, 'DEPTO DE SANTA ROSA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1169, 'DEPTO DE SOLOLA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1170, 'DEPTO DE SUCHITEPEQUEZ', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1171, 'DEPTO DE TOTONICAPAN', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1172, 'DEPTO DE ZACAPA', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1173, 'DEPTO DEL QUICHE', '', 197, 'state', 1, 6, 197, 0, 0, 0, 0, 0, 'North america', 'Guatemala', NULL, NULL, NULL, NULL),
(1174, 'Martinique', '', 205, 'state', 1, 6, 205, 0, 0, 0, 0, 0, 'North america', 'Martinique', NULL, NULL, NULL, NULL),
(1175, 'Aguascalientes', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1176, 'Baja California', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1177, 'Baja California Sur', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1178, 'Campeche', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1179, 'Chiapas', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1180, 'Chihuahua', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1181, 'Coahuila de Zaragoza', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1182, 'Colima', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1183, 'Distrito Federal', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1184, 'Durango', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1185, 'Guanajuato', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1186, 'Guerrero', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1187, 'Hidalgo', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1188, 'Jalisco', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1189, 'México', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1190, 'Michoacán de Ocampo', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1191, 'Morelos', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1192, 'Nayarit', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1193, 'Nuevo León', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1194, 'Oaxaca', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1195, 'Puebla', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1196, 'Querétaro', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1197, 'Quintana Roo', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1198, 'San Luis Potosí', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1199, 'Sinaloa', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1200, 'Sonora', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1201, 'Tabasco', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1202, 'Tamaulipas', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1203, 'Tlaxcala', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1204, 'Veracruz de Ignacio de la Llave', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1205, 'Yucatán', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1206, 'Zacatecas', '', 207, 'state', 1, 6, 207, 0, 0, 0, 0, 0, 'North america', 'Mexico', NULL, NULL, NULL, NULL),
(1207, 'Miquelon-Langlade', '', 210, 'state', 1, 6, 210, 0, 0, 0, 0, 0, 'North america', 'Saint Pierre and Miquelon', NULL, NULL, NULL, NULL),
(1208, 'Saint-Pierre', '', 210, 'state', 1, 6, 210, 0, 0, 0, 0, 0, 'North america', 'Saint Pierre and Miquelon', NULL, NULL, NULL, NULL),
(1209, 'Adjuntas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1210, 'Aguada', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1211, 'Aguadilla', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1212, 'Aguas Buenas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1213, 'Aibonito', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1214, 'Anasco', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1215, 'Arecibo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1216, 'Arroyo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1217, 'Barceloneta', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1218, 'Barranquitas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1219, 'Bayamon', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1220, 'Cabo Rojo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1221, 'Caguas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1222, 'Camuy', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1223, 'Canovanas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1224, 'Carolina', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1225, 'Catano', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1226, 'Cayey', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1227, 'Ceiba', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1228, 'Ciales', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1229, 'Cidra', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1230, 'Coamo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1231, 'Comerio', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1232, 'Corozal', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1233, 'Culebra', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1234, 'Dorado', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1235, 'Fajardo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1236, 'Florida', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1237, 'Guanica', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1238, 'Guayama', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1239, 'Guayanilla', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1240, 'Guaynabo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1241, 'Gurabo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1242, 'Hatillo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1243, 'Hormigueros', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1244, 'Humacao', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1245, 'Isabela', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1246, 'Jayuya', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1247, 'Juana Diaz', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1248, 'Juncos', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1249, 'Lajas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1250, 'Lares', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1251, 'Las Marias', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1252, 'Las Piedras', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1253, 'Loiza', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1254, 'Luquillo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1255, 'Manati', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1256, 'Maricao', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1257, 'Maunabo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1258, 'Mayaguez', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1259, 'Moca', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1260, 'Morovis', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1261, 'Naguabo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1262, 'Naranjito', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1263, 'Orocovis', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1264, 'Patillas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1265, 'Penuelas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1266, 'Ponce', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1267, 'Quebradillas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1268, 'Rincon', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1269, 'Rio Grande', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1270, 'Sabana Grande', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1271, 'Salinas', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1272, 'San German', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1273, 'San Juan', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1274, 'San Lorenzo', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1275, 'San Sebastian', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1276, 'Santa Isabel', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1277, 'Toa Alta', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1278, 'Toa Baja', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1279, 'Trujillo Alto', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1280, 'Utuado', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1281, 'Vega Alta', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1282, 'Vega Baja', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1283, 'Vieques', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1284, 'Villalba', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1285, 'Yabucoa', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1286, 'Yauco', '', 211, 'state', 1, 6, 211, 0, 0, 0, 0, 0, 'North america', 'Puerto Rico', NULL, NULL, NULL, NULL),
(1287, 'Alabama', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1288, 'Alaska', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1289, 'Arizona', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1290, 'Arkansas', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1291, 'California', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1292, 'Colorado', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1293, 'Connecticut', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1294, 'Delaware', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1295, 'District of Columbia', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1296, 'Florida', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1297, 'Georgia', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1298, 'Hawaii', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1299, 'Idaho', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1300, 'Illinois', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1301, 'Indiana', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1302, 'Iowa', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1303, 'Kansas', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1304, 'Kentucky', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1305, 'Louisiana', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1306, 'Maine', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1307, 'Maryland', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1308, 'Massachusetts', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1309, 'Michigan', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1310, 'Minnesota', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1311, 'Mississippi', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1312, 'Missouri', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1313, 'Montana', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1314, 'Nebraska', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1315, 'Nevada', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1316, 'New Hampshire', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1317, 'New Jersey', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1318, 'New Mexico', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1319, 'New York', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1320, 'North Carolina', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1321, 'North Dakota', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1322, 'Ohio', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1323, 'Oklahoma', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1324, 'Oregon', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1325, 'Pennsylvania', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1326, 'Rhode Island', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1327, 'South Carolina', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1328, 'South Dakota', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1329, 'Tennessee', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1330, 'Texas', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1331, 'Utah', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1332, 'Vermont', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1333, 'Virginia', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1334, 'Washington', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1335, 'West Virginia', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1336, 'Wisconsin', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1337, 'Wyoming', '', 216, 'state', 1, 6, 216, 0, 0, 0, 0, 0, 'North america', 'United States', NULL, NULL, NULL, NULL),
(1338, 'Vi', '', 219, 'state', 1, 6, 219, 0, 0, 0, 0, 0, 'North america', 'U.S. Virgin Islands', NULL, NULL, NULL, NULL),
(1339, 'As', '', 220, 'state', 1, 7, 220, 0, 0, 0, 0, 0, 'Oceania', 'American Samoa', NULL, NULL, NULL, NULL),
(1340, 'Australian Capital Territory', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1341, 'New South Wales', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1342, 'Northern Territory', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1343, 'Queensland', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1344, 'South Australia', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1345, 'Tasmania', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1346, 'Victoria', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1347, 'Western Australia', '', 221, 'state', 1, 7, 221, 0, 0, 0, 0, 0, 'Oceania', 'Australia', NULL, NULL, NULL, NULL),
(1348, 'Gu', '', 225, 'state', 1, 7, 225, 0, 0, 0, 0, 0, 'Oceania', 'Guam', NULL, NULL, NULL, NULL),
(1349, 'Guam ', '', 225, 'state', 1, 7, 225, 0, 0, 0, 0, 0, 'Oceania', 'Guam', NULL, NULL, NULL, NULL),
(1350, 'Mh', '', 227, 'state', 1, 7, 227, 0, 0, 0, 0, 0, 'Oceania', 'Marshall Islands', NULL, NULL, NULL, NULL),
(1351, 'Mp', '', 228, 'state', 1, 7, 228, 0, 0, 0, 0, 0, 'Oceania', 'Northern Mariana Islands', NULL, NULL, NULL, NULL);
INSERT INTO `wjrcv_sellacious_locations` (`id`, `title`, `iso_code`, `parent_id`, `type`, `state`, `continent_id`, `country_id`, `state_id`, `district_id`, `area_id`, `zip_id`, `new_id`, `continent_title`, `country_title`, `state_title`, `district_title`, `area_title`, `zip_title`) VALUES
(1352, 'Northern Mariana Islands ', '', 228, 'state', 1, 7, 228, 0, 0, 0, 0, 0, 'Oceania', 'Northern Mariana Islands', NULL, NULL, NULL, NULL),
(1353, 'BUENOS AIRES', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1354, 'CATAMARCA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1355, 'CHACO', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1356, 'CHUBUT', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1357, 'CORDOBA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1358, 'CORRIENTES', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1359, 'ENTRE RIOS', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1360, 'FORMOSA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1361, 'JUJUY', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1362, 'LA PAMPA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1363, 'LA RIOJA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1364, 'MENDOZA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1365, 'MISIONES', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1366, 'NEUQUEN', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1367, 'RIO NEGRO', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1368, 'SALTA', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1369, 'SAN JUAN', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1370, 'SAN LUIS', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1371, 'SANTA CRUZ', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1372, 'SANTA FE', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1373, 'SANTIAGO DEL ESTERO', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1374, 'TIERRA DEL FUEGO', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1375, 'TUCUMAN', '', 247, 'state', 1, 8, 247, 0, 0, 0, 0, 0, 'South america', 'Argentina', NULL, NULL, NULL, NULL),
(1376, 'Acre', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1377, 'Alagoas ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1378, 'Amapa', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1379, 'Amazonas ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1380, 'Bahia', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1381, 'Ceara', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1382, 'Distrito Federal', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1383, 'Espirito Santo', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1384, 'Goias', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1385, 'Maranhao ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1386, 'Mato Grosso ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1387, 'Mato Grosso do Sul', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1388, 'Minas Gerais', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1389, 'Para', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1390, 'Paraiba', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1391, 'Parana', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1392, 'Pernambuco ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1393, 'Piaui', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1394, 'Rio de Janeiro ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1395, 'Rio Grande do Norte ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1396, 'Rio Grande do Sul', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1397, 'Rondonia', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1398, 'Roraima', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1399, 'Santa Catarina ', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1400, 'Sao Paulo', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1401, 'Sergipe', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1402, 'Tocantins', '', 249, 'state', 1, 8, 249, 0, 0, 0, 0, 0, 'South america', 'Brazil', NULL, NULL, NULL, NULL),
(1403, 'Guyane', '', 254, 'state', 1, 8, 254, 0, 0, 0, 0, 0, 'South america', 'French Guiana', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_mailqueue`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_mailqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(50) NOT NULL,
  `reference` int(11) NOT NULL COMMENT 'A unique identifier for an email to avoid duplicate emails',
  `recipients` text NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `is_html` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `sent_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `response` text NOT NULL,
  `retries` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_manufacturers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `code` varchar(50) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_media`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `record_id` int(11) NOT NULL,
  `context` varchar(50) NOT NULL,
  `path` varchar(1000) NOT NULL,
  `original_name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `doc_type` varchar(50) NOT NULL,
  `doc_reference` varchar(100) NOT NULL,
  `protected` int(11) NOT NULL COMMENT 'Don''t allow direct download',
  `state` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL COMMENT 'not used yet',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `wjrcv_sellacious_media`
--

INSERT INTO `wjrcv_sellacious_media` (`id`, `table_name`, `record_id`, `context`, `path`, `original_name`, `type`, `size`, `doc_type`, `doc_reference`, `protected`, `state`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `params`) VALUES
(1, 'config', 1, 'shop_logo', 'images/com_sellacious/config/shop_logo/1/b6872a36384d4a06c957a6797892a617b8488a08-794.png', 'sellacious-logo-main.png', 'image/png', 8594, '', '', 0, 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(2, 'config', 2, 'purchase_return_icon', 'images/com_sellacious/config/purchase_return_icon/2/a8fe1a3055f1f0ffd108d97904f54088f77b147b-794.png', '7-return.png', 'image/png', 30821, '', '7', 0, 1, 2, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(3, 'config', 2, 'purchase_return_icon', 'images/com_sellacious/config/purchase_return_icon/2/fb73614e80c4712d6158cb1df5c8bff9fce0428e-794.png', '10-return.png', 'image/png', 32405, '', '10', 0, 1, 3, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(4, 'config', 2, 'purchase_return_icon', 'images/com_sellacious/config/purchase_return_icon/2/470d26154a8d38d00fa771d7ca2e4193a5070c15-794.png', '15-return.png', 'image/png', 32426, '', '15', 0, 1, 4, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(5, 'config', 2, 'purchase_return_icon', 'images/com_sellacious/config/purchase_return_icon/2/5bcfbb86d248dab78a9e2e5b1cd4b12d835b68d5-794.png', '30-return.png', 'image/png', 33476, '', '30', 0, 1, 5, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(6, 'config', 2, 'purchase_exchange_icon', 'images/com_sellacious/config/purchase_exchange_icon/2/486b9a5d9afea12d03917b7519532beaa9673e90-794.png', '7-exchange.png', 'image/png', 31655, '', '7', 0, 1, 6, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(7, 'config', 2, 'purchase_exchange_icon', 'images/com_sellacious/config/purchase_exchange_icon/2/95f8597de777d9c0015250dee6794ad7ca9acd6e-794.png', '10-exchange.png', 'image/png', 33240, '', '10', 0, 1, 7, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(8, 'config', 2, 'purchase_exchange_icon', 'images/com_sellacious/config/purchase_exchange_icon/2/1c58c02c1179a564523a9a2d8b78acfd8d3e874b-794.png', '15-exchange.png', 'image/png', 33258, '', '15', 0, 1, 8, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(9, 'config', 2, 'purchase_exchange_icon', 'images/com_sellacious/config/purchase_exchange_icon/2/8a2b899c1666b9d1c0855dd758191830e4ff5296-794.png', '30-exchange.png', 'image/png', 34311, '', '30', 0, 1, 9, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_messages`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL,
  `is_read` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `alias` varchar(250) NOT NULL,
  `path` text NOT NULL,
  `body` text NOT NULL,
  `context` varchar(30) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '#need this?',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `remote_ip` varchar(40) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_sellacious_messages`
--

INSERT INTO `wjrcv_sellacious_messages` (`id`, `parent_id`, `sender`, `recipient`, `is_read`, `title`, `alias`, `path`, `body`, `context`, `ref_id`, `date_sent`, `created`, `created_by`, `modified`, `modified_by`, `state`, `lft`, `rgt`, `level`, `remote_ip`, `params`) VALUES
(1, 0, 0, 0, 0, 'Root', 'root', '', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 1, 0, 1, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_message_recipients`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_message_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `recipient` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_mimes`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_mimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(20) NOT NULL,
  `mime` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `note` varchar(250) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `extension_mime` (`extension`,`mime`),
  KEY `content` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=688 ;

--
-- Dumping data for table `wjrcv_sellacious_mimes`
--

INSERT INTO `wjrcv_sellacious_mimes` (`id`, `extension`, `mime`, `category`, `note`, `state`) VALUES
(2, '.x3d', 'application/vnd.hzn-3d-crossword', '', '3D Crossword Plugin', 1),
(3, '.3gp', 'video/3gpp', 'video', '3GP', 1),
(4, '.3g2', 'video/3gpp2', 'video', '3GP2', 1),
(5, '.mseq', 'application/vnd.mseq', '', '3GPP MSEQ File', 1),
(6, '.pwn', 'application/vnd.3m.post-it-notes', '', '3M Post It Notes', 1),
(7, '.plb', 'application/vnd.3gpp.pic-bw-large', '', '3rd Generation Partnership Project - Pic Large', 1),
(8, '.psb', 'application/vnd.3gpp.pic-bw-small', '', '3rd Generation Partnership Project - Pic Small', 1),
(9, '.pvb', 'application/vnd.3gpp.pic-bw-var', '', '3rd Generation Partnership Project - Pic Var', 1),
(10, '.tcap', 'application/vnd.3gpp2.tcap', '', '3rd Generation Partnership Project - Transaction Capabilities Application Part', 1),
(11, '.7z', 'application/x-7z-compressed', 'archive', '7-Zip', 1),
(12, '.abw', 'application/x-abiword', '', 'AbiWord', 1),
(13, '.ace', 'application/x-ace-compressed', '', 'Ace Archive', 1),
(14, '.acc', 'application/vnd.americandynamics.acc', 'archive', 'Active Content Compression', 1),
(15, '.acu', 'application/vnd.acucobol', '', 'ACU Cobol', 1),
(16, '.atc', 'application/vnd.acucorp', '', 'ACU Cobol', 1),
(17, '.adp', 'audio/adpcm', '', 'Adaptive differential pulse-code modulation', 1),
(18, '.aab', 'application/x-authorware-bin', '', 'Adobe (Macropedia) Authorware - Binary File', 1),
(19, '.aam', 'application/x-authorware-map', '', 'Adobe (Macropedia) Authorware - Map', 1),
(20, '.aas', 'application/x-authorware-seg', '', 'Adobe (Macropedia) Authorware - Segment File', 1),
(21, '.air', 'application/vnd.adobe.air-application-installer-package+zip', 'binary', 'Adobe AIR Application', 1),
(22, '.swf', 'application/x-shockwave-flash', 'video', 'Adobe Flash', 1),
(23, '.fxp', 'application/vnd.adobe.fxp', '', 'Adobe Flex Project', 1),
(24, '.pdf', 'application/pdf', 'document', 'Adobe Portable Document Format', 1),
(25, '.ppd', 'application/vnd.cups-ppd', '', 'Adobe PostScript Printer Description File Format', 1),
(26, '.dir', 'application/x-director', '', 'Adobe Shockwave Player', 1),
(27, '.xdp', 'application/vnd.adobe.xdp+xml', '', 'Adobe XML Data Package', 1),
(28, '.xfdf', 'application/vnd.adobe.xfdf', 'audio', 'Adobe XML Forms Data Format', 1),
(29, '.aac', 'audio/x-aac', '', 'Advanced Audio Coding (AAC)', 1),
(30, '.ahead', 'application/vnd.ahead.space', '', 'Ahead AIR Application', 1),
(31, '.azf', 'application/vnd.airzip.filesecure.azf', '', 'AirZip FileSECURE', 1),
(32, '.azs', 'application/vnd.airzip.filesecure.azs', '', 'AirZip FileSECURE', 1),
(33, '.azw', 'application/vnd.amazon.ebook', '', 'Amazon Kindle eBook format', 1),
(34, '.ami', 'application/vnd.amiga.ami', '', 'AmigaDE', 1),
(35, 'N/A', 'application/andrew-inset', '', 'Andrew Toolkit', 1),
(36, '.apk', 'application/vnd.android.package-archive', 'binary', 'Android Package Archive', 1),
(37, '.cii', 'application/vnd.anser-web-certificate-issue-initiation', '', 'ANSER-WEB Terminal Client - Certificate Issue', 1),
(38, '.fti', 'application/vnd.anser-web-funds-transfer-initiation', '', 'ANSER-WEB Terminal Client - Web Funds Transfer', 1),
(39, '.atx', 'application/vnd.antix.game-component', '', 'Antix Game Player', 1),
(40, '.mpkg', 'application/vnd.apple.installer+xml', '', 'Apple Installer Package', 1),
(41, '.aw', 'application/applixware', '', 'Applixware', 1),
(42, '.les', 'application/vnd.hhe.lesson-player', '', 'Archipelago Lesson Player', 1),
(43, '.swi', 'application/vnd.aristanetworks.swi', '', 'Arista Networks Software Image', 1),
(44, '.s', 'text/x-asm', '', 'Assembler Source File', 1),
(45, '.atomcat', 'application/atomcat+xml', '', 'Atom Publishing Protocol', 1),
(46, '.atomsvc', 'application/atomsvc+xml', '', 'Atom Publishing Protocol Service Document', 1),
(47, '.atom, .xml', 'application/atom+xml', '', 'Atom Syndication Format', 1),
(48, '.ac', 'application/pkix-attr-cert', '', 'Attribute Certificate', 1),
(49, '.aif', 'audio/x-aiff', '', 'Audio Interchange File Format', 1),
(50, '.avi', 'video/x-msvideo', 'video', 'Audio Video Interleave (AVI)', 1),
(51, '.aep', 'application/vnd.audiograph', '', 'Audiograph', 1),
(52, '.dxf', 'image/vnd.dxf', '', 'AutoCAD DXF', 1),
(53, '.dwf', 'model/vnd.dwf', '', 'Autodesk Design Web Format (DWF)', 1),
(54, '.par', 'text/plain-bas', '', 'BAS Partitur Format', 1),
(55, '.bcpio', 'application/x-bcpio', '', 'Binary CPIO Archive', 1),
(56, '.bin', 'application/octet-stream', 'binary', 'Binary Data', 1),
(57, '.bmp', 'image/bmp', 'image', 'Bitmap Image File', 1),
(58, '.torrent', 'application/x-bittorrent', '', 'BitTorrent', 1),
(59, '.cod', 'application/vnd.rim.cod', '', 'Blackberry COD File', 1),
(60, '.mpm', 'application/vnd.blueice.multipass', '', 'Blueice Research Multipass', 1),
(61, '.bmi', 'application/vnd.bmi', '', 'BMI Drawing Data Interchange', 1),
(62, '.sh', 'application/x-sh', '', 'Bourne Shell Script', 1),
(63, '.btif', 'image/prs.btif', '', 'BTIF', 1),
(64, '.rep', 'application/vnd.businessobjects', '', 'BusinessObjects', 1),
(65, '.bz', 'application/x-bzip', '', 'Bzip Archive', 1),
(66, '.bz2', 'application/x-bzip2', '', 'Bzip2 Archive', 1),
(67, '.csh', 'application/x-csh', 'script', 'C Shell Script', 1),
(68, '.c', 'text/x-c', 'script', 'C Source File', 1),
(69, '.cdxml', 'application/vnd.chemdraw+xml', 'script', 'CambridgeSoft Chem Draw', 1),
(70, '.css', 'text/css', 'script', 'Cascading Style Sheets (CSS)', 1),
(71, '.cdx', 'chemical/x-cdx', '', 'ChemDraw eXchange file', 1),
(72, '.cml', 'chemical/x-cml', 'script', 'Chemical Markup Language', 1),
(73, '.csml', 'chemical/x-csml', 'script', 'Chemical Style Markup Language', 1),
(74, '.cdbcmsg', 'application/vnd.contact.cmsg', '', 'CIM Database', 1),
(75, '.cla', 'application/vnd.claymore', '', 'Claymore Data Files', 1),
(76, '.c4g', 'application/vnd.clonk.c4group', '', 'Clonk Game', 1),
(77, '.sub', 'image/vnd.dvb.subtitle', '', 'Close Captioning - Subtitle', 1),
(78, '.cdmia', 'application/cdmi-capability', '', 'Cloud Data Management Interface (CDMI) - Capability', 1),
(79, '.cdmic', 'application/cdmi-container', '', 'Cloud Data Management Interface (CDMI) - Contaimer', 1),
(80, '.cdmid', 'application/cdmi-domain', '', 'Cloud Data Management Interface (CDMI) - Domain', 1),
(81, '.cdmio', 'application/cdmi-object', '', 'Cloud Data Management Interface (CDMI) - Object', 1),
(82, '.cdmiq', 'application/cdmi-queue', '', 'Cloud Data Management Interface (CDMI) - Queue', 1),
(83, '.c11amc', 'application/vnd.cluetrust.cartomobile-config', '', 'ClueTrust CartoMobile - Config', 1),
(84, '.c11amz', 'application/vnd.cluetrust.cartomobile-config-pkg', '', 'ClueTrust CartoMobile - Config Package', 1),
(85, '.ras', 'image/x-cmu-raster', '', 'CMU Image', 1),
(86, '.dae', 'model/vnd.collada+xml', '', 'COLLADA', 1),
(87, '.csv', 'text/csv', 'database', 'Comma-Seperated Values', 1),
(88, '.cpt', 'application/mac-compactpro', '', 'Compact Pro', 1),
(89, '.wmlc', 'application/vnd.wap.wmlc', '', 'Compiled Wireless Markup Language (WMLC)', 1),
(90, '.cgm', 'image/cgm', '', 'Computer Graphics Metafile', 1),
(91, '.ice', 'x-conference/x-cooltalk', '', 'CoolTalk', 1),
(92, '.cmx', 'image/x-cmx', '', 'Corel Metafile Exchange (CMX)', 1),
(93, '.xar', 'application/vnd.xara', '', 'CorelXARA', 1),
(94, '.cmc', 'application/vnd.cosmocaller', '', 'CosmoCaller', 1),
(95, '.cpio', 'application/x-cpio', '', 'CPIO Archive', 1),
(96, '.clkx', 'application/vnd.crick.clicker', '', 'CrickSoftware - Clicker', 1),
(97, '.clkk', 'application/vnd.crick.clicker.keyboard', '', 'CrickSoftware - Clicker - Keyboard', 1),
(98, '.clkp', 'application/vnd.crick.clicker.palette', '', 'CrickSoftware - Clicker - Palette', 1),
(99, '.clkt', 'application/vnd.crick.clicker.template', '', 'CrickSoftware - Clicker - Template', 1),
(100, '.clkw', 'application/vnd.crick.clicker.wordbank', '', 'CrickSoftware - Clicker - Wordbank', 1),
(101, '.wbs', 'application/vnd.criticaltools.wbs+xml', '', 'Critical Tools - PERT Chart EXPERT', 1),
(102, '.cryptonote', 'application/vnd.rig.cryptonote', '', 'CryptoNote', 1),
(103, '.cif', 'chemical/x-cif', '', 'Crystallographic Interchange Format', 1),
(104, '.cmdf', 'chemical/x-cmdf', '', 'CrystalMaker Data Format', 1),
(105, '.cu', 'application/cu-seeme', '', 'CU-SeeMe', 1),
(106, '.cww', 'application/prs.cww', '', 'CU-Writer', 1),
(107, '.curl', 'text/vnd.curl', 'script', 'Curl - Applet', 1),
(108, '.dcurl', 'text/vnd.curl.dcurl', '', 'Curl - Detached Applet', 1),
(109, '.mcurl', 'text/vnd.curl.mcurl', '', 'Curl - Manifest File', 1),
(110, '.scurl', 'text/vnd.curl.scurl', '', 'Curl - Source Code', 1),
(111, '.car', 'application/vnd.curl.car', '', 'CURL Applet', 1),
(112, '.pcurl', 'application/vnd.curl.pcurl', '', 'CURL Applet', 1),
(113, '.cmp', 'application/vnd.yellowriver-custom-menu', '', 'CustomMenu', 1),
(114, '.dssc', 'application/dssc+der', '', 'Data Structure for the Security Suitability of Cryptographic Algorithms', 1),
(115, '.xdssc', 'application/dssc+xml', '', 'Data Structure for the Security Suitability of Cryptographic Algorithms', 1),
(116, '.deb', 'application/x-debian-package', '', 'Debian Package', 1),
(117, '.uva', 'audio/vnd.dece.audio', 'audio', 'DECE Audio', 1),
(118, '.uvi', 'image/vnd.dece.graphic', 'image', 'DECE Graphic', 1),
(119, '.uvh', 'video/vnd.dece.hd', 'video', 'DECE High Definition Video', 1),
(120, '.uvm', 'video/vnd.dece.mobile', 'video', 'DECE Mobile Video', 1),
(121, '.uvu', 'video/vnd.uvvu.mp4', 'video', 'DECE MP4', 1),
(122, '.uvp', 'video/vnd.dece.pd', 'video', 'DECE PD Video', 1),
(123, '.uvs', 'video/vnd.dece.sd', 'video', 'DECE SD Video', 1),
(124, '.uvv', 'video/vnd.dece.video', 'video', 'DECE Video', 1),
(125, '.dvi', 'application/x-dvi', 'binary', 'Device Independent File Format (DVI)', 1),
(126, '.seed', 'application/vnd.fdsn.seed', '', 'Digital Siesmograph Networks - SEED Datafiles', 1),
(127, '.dtb', 'application/x-dtbook+xml', '', 'Digital Talking Book', 1),
(128, '.res', 'application/x-dtbresource+xml', '', 'Digital Talking Book - Resource File', 1),
(129, '.ait', 'application/vnd.dvb.ait', '', 'Digital Video Broadcasting', 1),
(130, '.svc', 'application/vnd.dvb.service', '', 'Digital Video Broadcasting', 1),
(131, '.eol', 'audio/vnd.digital-winds', '', 'Digital Winds Music', 1),
(132, '.djvu', 'image/vnd.djvu', '', 'DjVu', 1),
(133, '.dtd', 'application/xml-dtd', '', 'Document Type Definition', 1),
(134, '.mlp', 'application/vnd.dolby.mlp', 'video', 'Dolby Meridian Lossless Packing', 1),
(135, '.wad', 'application/x-doom', '', 'Doom Video Game', 1),
(136, '.dpg', 'application/vnd.dpgraph', '', 'DPGraph', 1),
(137, '.dra', 'audio/vnd.dra', '', 'DRA Audio', 1),
(138, '.dfac', 'application/vnd.dreamfactory', '', 'DreamFactory', 1),
(139, '.dts', 'audio/vnd.dts', '', 'DTS Audio', 1),
(140, '.dtshd', 'audio/vnd.dts.hd', '', 'DTS High Definition Audio', 1),
(141, '.dwg', 'image/vnd.dwg', '', 'DWG Drawing', 1),
(142, '.geo', 'application/vnd.dynageo', '', 'DynaGeo', 1),
(143, '.es', 'application/ecmascript', '', 'ECMAScript', 1),
(144, '.mag', 'application/vnd.ecowin.chart', '', 'EcoWin Chart', 1),
(145, '.mmr', 'image/vnd.fujixerox.edmics-mmr', '', 'EDMICS 2000', 1),
(146, '.rlc', 'image/vnd.fujixerox.edmics-rlc', '', 'EDMICS 2000', 1),
(147, '.exi', 'application/exi', 'script', 'Efficient XML Interchange', 1),
(148, '.mgz', 'application/vnd.proteus.magazine', '', 'EFI Proteus', 1),
(149, '.epub', 'application/epub+zip', '', 'Electronic Publication', 1),
(150, '.eml', 'message/rfc822', '', 'Email Message', 1),
(151, '.nml', 'application/vnd.enliven', '', 'Enliven Viewer', 1),
(152, '.xpr', 'application/vnd.is-xpr', '', 'Express by Infoseek', 1),
(153, '.xif', 'image/vnd.xiff', 'image', 'eXtended Image File Format (XIFF)', 1),
(154, '.xfdl', 'application/vnd.xfdl', '', 'Extensible Forms Description Language', 1),
(155, '.emma', 'application/emma+xml', '', 'Extensible MultiModal Annotation', 1),
(156, '.ez2', 'application/vnd.ezpix-album', '', 'EZPix Secure Photo Album', 1),
(157, '.ez3', 'application/vnd.ezpix-package', '', 'EZPix Secure Photo Album', 1),
(158, '.fst', 'image/vnd.fst', '', 'FAST Search & Transfer ASA', 1),
(159, '.fvt', 'video/vnd.fvt', '', 'FAST Search & Transfer ASA', 1),
(160, '.fbs', 'image/vnd.fastbidsheet', '', 'FastBid Sheet', 1),
(161, '.fe_launch', 'application/vnd.denovo.fcselayout-link', '', 'FCS Express Layout Link', 1),
(162, '.f4v', 'video/x-f4v', '', 'Flash Video', 1),
(163, '.flv', 'video/x-flv', '', 'Flash Video', 1),
(164, '.fpx', 'image/vnd.fpx', '', 'FlashPix', 1),
(165, '.npx', 'image/vnd.net-fpx', '', 'FlashPix', 1),
(166, '.flx', 'text/vnd.fmi.flexstor', '', 'FLEXSTOR', 1),
(167, '.fli', 'video/x-fli', '', 'FLI/FLC Animation Format', 1),
(168, '.ftc', 'application/vnd.fluxtime.clip', '', 'FluxTime Clip', 1),
(169, '.fdf', 'application/vnd.fdf', '', 'Forms Data Format', 1),
(170, '.f', 'text/x-fortran', '', 'Fortran Source File', 1),
(171, '.mif', 'application/vnd.mif', '', 'FrameMaker Interchange Format', 1),
(172, '.fm', 'application/vnd.framemaker', '', 'FrameMaker Normal Format', 1),
(173, '.fh', 'image/x-freehand', '', 'FreeHand MX', 1),
(174, '.fsc', 'application/vnd.fsc.weblaunch', '', 'Friendly Software Corporation', 1),
(175, '.fnc', 'application/vnd.frogans.fnc', '', 'Frogans Player', 1),
(176, '.ltf', 'application/vnd.frogans.ltf', '', 'Frogans Player', 1),
(177, '.ddd', 'application/vnd.fujixerox.ddd', '', 'Fujitsu - Xerox 2D CAD Data', 1),
(178, '.xdw', 'application/vnd.fujixerox.docuworks', '', 'Fujitsu - Xerox DocuWorks', 1),
(179, '.xbd', 'application/vnd.fujixerox.docuworks.binder', '', 'Fujitsu - Xerox DocuWorks Binder', 1),
(180, '.oas', 'application/vnd.fujitsu.oasys', '', 'Fujitsu Oasys', 1),
(181, '.oa2', 'application/vnd.fujitsu.oasys2', '', 'Fujitsu Oasys', 1),
(182, '.oa3', 'application/vnd.fujitsu.oasys3', '', 'Fujitsu Oasys', 1),
(183, '.fg5', 'application/vnd.fujitsu.oasysgp', '', 'Fujitsu Oasys', 1),
(184, '.bh2', 'application/vnd.fujitsu.oasysprs', '', 'Fujitsu Oasys', 1),
(185, '.spl', 'application/x-futuresplash', '', 'FutureSplash Animator', 1),
(186, '.fzs', 'application/vnd.fuzzysheet', '', 'FuzzySheet', 1),
(187, '.g3', 'image/g3fax', '', 'G3 Fax Image', 1),
(188, '.gmx', 'application/vnd.gmx', '', 'GameMaker ActiveX', 1),
(189, '.gtw', 'model/vnd.gtw', '', 'Gen-Trix Studio', 1),
(190, '.txd', 'application/vnd.genomatix.tuxedo', '', 'Genomatix Tuxedo Framework', 1),
(191, '.ggb', 'application/vnd.geogebra.file', '', 'GeoGebra', 1),
(192, '.ggt', 'application/vnd.geogebra.tool', '', 'GeoGebra', 1),
(193, '.gdl', 'model/vnd.gdl', '', 'Geometric Description Language (GDL)', 1),
(194, '.gex', 'application/vnd.geometry-explorer', '', 'GeoMetry Explorer', 1),
(195, '.gxt', 'application/vnd.geonext', '', 'GEONExT and JSXGraph', 1),
(196, '.g2w', 'application/vnd.geoplan', '', 'GeoplanW', 1),
(197, '.g3w', 'application/vnd.geospace', '', 'GeospacW', 1),
(198, '.gsf', 'application/x-font-ghostscript', '', 'Ghostscript Font', 1),
(199, '.bdf', 'application/x-font-bdf', '', 'Glyph Bitmap Distribution Format', 1),
(200, '.gtar', 'application/x-gtar', '', 'GNU Tar Files', 1),
(201, '.texinfo', 'application/x-texinfo', '', 'GNU Texinfo Document', 1),
(202, '.gnumeric', 'application/x-gnumeric', '', 'Gnumeric', 1),
(203, '.kml', 'application/vnd.google-earth.kml+xml', '', 'Google Earth - KML', 1),
(204, '.kmz', 'application/vnd.google-earth.kmz', '', 'Google Earth - Zipped KML', 1),
(205, '.gqf', 'application/vnd.grafeq', '', 'GrafEq', 1),
(206, '.gif', 'image/gif', 'image', 'Graphics Interchange Format', 1),
(207, '.gv', 'text/vnd.graphviz', '', 'Graphviz', 1),
(208, '.gac', 'application/vnd.groove-account', '', 'Groove - Account', 1),
(209, '.ghf', 'application/vnd.groove-help', '', 'Groove - Help', 1),
(210, '.gim', 'application/vnd.groove-identity-message', '', 'Groove - Identity Message', 1),
(211, '.grv', 'application/vnd.groove-injector', '', 'Groove - Injector', 1),
(212, '.gtm', 'application/vnd.groove-tool-message', '', 'Groove - Tool Message', 1),
(213, '.tpl', 'application/vnd.groove-tool-template', 'script', 'Groove - Tool Template', 1),
(214, '.vcg', 'application/vnd.groove-vcard', '', 'Groove - Vcard', 1),
(215, '.h261', 'video/h261', '', 'H.261', 1),
(216, '.h263', 'video/h263', '', 'H.263', 1),
(217, '.h264', 'video/h264', '', 'H.264', 1),
(218, '.hpid', 'application/vnd.hp-hpid', '', 'Hewlett Packard Instant Delivery', 1),
(219, '.hps', 'application/vnd.hp-hps', '', 'Hewlett-Packard''s WebPrintSmart', 1),
(220, '.hdf', 'application/x-hdf', '', 'Hierarchical Data Format', 1),
(221, '.rip', 'audio/vnd.rip', '', 'Hit''n''Mix', 1),
(222, '.hbci', 'application/vnd.hbci', '', 'Homebanking Computer Interface (HBCI)', 1),
(223, '.jlt', 'application/vnd.hp-jlyt', '', 'HP Indigo Digital Press - Job Layout Languate', 1),
(224, '.pcl', 'application/vnd.hp-pcl', '', 'HP Printer Command Language', 1),
(225, '.hpgl', 'application/vnd.hp-hpgl', '', 'HP-GL/2 and HP RTL', 1),
(226, '.hvs', 'application/vnd.yamaha.hv-script', '', 'HV Script', 1),
(227, '.hvd', 'application/vnd.yamaha.hv-dic', '', 'HV Voice Dictionary', 1),
(228, '.hvp', 'application/vnd.yamaha.hv-voice', '', 'HV Voice Parameter', 1),
(229, '.sfd-hdstx', 'application/vnd.hydrostatix.sof-data', '', 'Hydrostatix Master Suite', 1),
(230, '.stk', 'application/hyperstudio', '', 'Hyperstudio', 1),
(231, '.hal', 'application/vnd.hal+xml', 'script', 'Hypertext Application Language', 1),
(232, '.html', 'text/html', 'script', 'HyperText Markup Language (HTML)', 1),
(233, '.irm', 'application/vnd.ibm.rights-management', '', 'IBM DB2 Rights Manager', 1),
(234, '.sc', 'application/vnd.ibm.secure-container', '', 'IBM Electronic Media Management System - Secure Container', 1),
(235, '.ics', 'text/calendar', '', 'iCalendar', 1),
(236, '.icc', 'application/vnd.iccprofile', '', 'ICC profile', 1),
(237, '.ico', 'image/x-icon', '', 'Icon Image', 1),
(238, '.igl', 'application/vnd.igloader', '', 'igLoader', 1),
(239, '.ief', 'image/ief', '', 'Image Exchange Format', 1),
(240, '.ivp', 'application/vnd.immervision-ivp', '', 'ImmerVision PURE Players', 1),
(241, '.ivu', 'application/vnd.immervision-ivu', '', 'ImmerVision PURE Players', 1),
(242, '.rif', 'application/reginfo+xml', '', 'IMS Networks', 1),
(243, '.3dml', 'text/vnd.in3d.3dml', '', 'In3D - 3DML', 1),
(244, '.spot', 'text/vnd.in3d.spot', '', 'In3D - 3DML', 1),
(245, '.igs', 'model/iges', '', 'Initial Graphics Exchange Specification (IGES)', 1),
(246, '.i2g', 'application/vnd.intergeo', '', 'Interactive Geometry Software', 1),
(247, '.cdy', 'application/vnd.cinderella', '', 'Interactive Geometry Software Cinderella', 1),
(248, '.xpw', 'application/vnd.intercon.formnet', '', 'Intercon FormNet', 1),
(249, '.fcs', 'application/vnd.isac.fcs', '', 'International Society for Advancement of Cytometry', 1),
(250, '.ipfix', 'application/ipfix', '', 'Internet Protocol Flow Information Export', 1),
(251, '.cer', 'application/pkix-cert', '', 'Internet Public Key Infrastructure - Certificate', 1),
(252, '.pki', 'application/pkixcmp', '', 'Internet Public Key Infrastructure - Certificate Management Protocole', 1),
(253, '.crl', 'application/pkix-crl', '', 'Internet Public Key Infrastructure - Certificate Revocation Lists', 1),
(254, '.pkipath', 'application/pkix-pkipath', '', 'Internet Public Key Infrastructure - Certification Path', 1),
(255, '.igm', 'application/vnd.insors.igm', '', 'IOCOM Visimeet', 1),
(256, '.rcprofile', 'application/vnd.ipunplugged.rcprofile', '', 'IP Unplugged Roaming Client', 1),
(257, '.irp', 'application/vnd.irepository.package+xml', '', 'iRepository / Lucidoc Editor', 1),
(258, '.jad', 'text/vnd.sun.j2me.app-descriptor', '', 'J2ME App Descriptor', 1),
(259, '.jar', 'application/java-archive', 'archive', 'Java Archive', 1),
(260, '.class', 'application/java-vm', '', 'Java Bytecode File', 1),
(261, '.jnlp', 'application/x-java-jnlp-file', '', 'Java Network Launching Protocol', 1),
(262, '.ser', 'application/java-serialized-object', '', 'Java Serialized Object', 1),
(263, '.java', 'text/x-java-source,java', 'script', 'Java Source File', 1),
(264, '.js', 'application/javascript', 'script', 'JavaScript', 1),
(265, '.json', 'application/json', 'script', 'JavaScript Object Notation (JSON)', 1),
(266, '.joda', 'application/vnd.joost.joda-archive', '', 'Joda Archive', 1),
(267, '.jpm', 'video/jpm', 'image', 'JPEG 2000 Compound Image File Format', 1),
(268, '.jpg', 'image/jpeg', 'image', 'JPEG Image', 1),
(269, '.jpgv', 'video/jpeg', 'video', 'JPGVideo', 1),
(270, '.ktz', 'application/vnd.kahootz', '', 'Kahootz', 1),
(271, '.mmd', 'application/vnd.chipnuts.karaoke-mmd', '', 'Karaoke on Chipnuts Chipsets', 1),
(272, '.karbon', 'application/vnd.kde.karbon', '', 'KDE KOffice Office Suite - Karbon', 1),
(273, '.chrt', 'application/vnd.kde.kchart', '', 'KDE KOffice Office Suite - KChart', 1),
(274, '.kfo', 'application/vnd.kde.kformula', '', 'KDE KOffice Office Suite - Kformula', 1),
(275, '.flw', 'application/vnd.kde.kivio', '', 'KDE KOffice Office Suite - Kivio', 1),
(276, '.kon', 'application/vnd.kde.kontour', '', 'KDE KOffice Office Suite - Kontour', 1),
(277, '.kpr', 'application/vnd.kde.kpresenter', '', 'KDE KOffice Office Suite - Kpresenter', 1),
(278, '.ksp', 'application/vnd.kde.kspread', '', 'KDE KOffice Office Suite - Kspread', 1),
(279, '.kwd', 'application/vnd.kde.kword', '', 'KDE KOffice Office Suite - Kword', 1),
(280, '.htke', 'application/vnd.kenameaapp', '', 'Kenamea App', 1),
(281, '.kia', 'application/vnd.kidspiration', '', 'Kidspiration', 1),
(282, '.kne', 'application/vnd.kinar', '', 'Kinar Applications', 1),
(283, '.sse', 'application/vnd.kodak-descriptor', '', 'Kodak Storyshare', 1),
(284, '.lasxml', 'application/vnd.las.las+xml', '', 'Laser App Enterprise', 1),
(285, '.latex', 'application/x-latex', '', 'LaTeX', 1),
(286, '.lbd', 'application/vnd.llamagraphics.life-balance.desktop', '', 'Life Balance - Desktop Edition', 1),
(287, '.lbe', 'application/vnd.llamagraphics.life-balance.exchange+xml', '', 'Life Balance - Exchange Format', 1),
(288, '.jam', 'application/vnd.jam', '', 'Lightspeed Audio Lab', 1),
(289, '0.123', 'application/vnd.lotus-1-2-3', '', 'Lotus 1-2-3', 1),
(290, '.apr', 'application/vnd.lotus-approach', '', 'Lotus Approach', 1),
(291, '.pre', 'application/vnd.lotus-freelance', '', 'Lotus Freelance', 1),
(292, '.nsf', 'application/vnd.lotus-notes', '', 'Lotus Notes', 1),
(293, '.org', 'application/vnd.lotus-organizer', '', 'Lotus Organizer', 1),
(294, '.scm', 'application/vnd.lotus-screencam', '', 'Lotus Screencam', 1),
(295, '.lwp', 'application/vnd.lotus-wordpro', '', 'Lotus Wordpro', 1),
(296, '.lvp', 'audio/vnd.lucent.voice', '', 'Lucent Voice', 1),
(297, '.m3u', 'audio/x-mpegurl', '', 'M3U (Multimedia Playlist)', 1),
(298, '.m4v', 'video/x-m4v', '', 'M4v', 1),
(299, '.hqx', 'application/mac-binhex40', '', 'Macintosh BinHex 4.0', 1),
(300, '.portpkg', 'application/vnd.macports.portpkg', '', 'MacPorts Port System', 1),
(301, '.mgp', 'application/vnd.osgeo.mapguide.package', '', 'MapGuide DBXML', 1),
(302, '.mrc', 'application/marc', '', 'MARC Formats', 1),
(303, '.mrcx', 'application/marcxml+xml', '', 'MARC21 XML Schema', 1),
(304, '.mxf', 'application/mxf', '', 'Material Exchange Format', 1),
(305, '.nbp', 'application/vnd.wolfram.player', '', 'Mathematica Notebook Player', 1),
(306, '.ma', 'application/mathematica', '', 'Mathematica Notebooks', 1),
(307, '.mathml', 'application/mathml+xml', '', 'Mathematical Markup Language', 1),
(308, '.mbox', 'application/mbox', '', 'Mbox database files', 1),
(309, '.mc1', 'application/vnd.medcalcdata', '', 'MedCalc', 1),
(310, '.mscml', 'application/mediaservercontrol+xml', '', 'Media Server Control Markup Language', 1),
(311, '.cdkey', 'application/vnd.mediastation.cdkey', '', 'MediaRemote', 1),
(312, '.mwf', 'application/vnd.mfer', '', 'Medical Waveform Encoding Format', 1),
(313, '.mfm', 'application/vnd.mfmp', '', 'Melody Format for Mobile Platform', 1),
(314, '.msh', 'model/mesh', '', 'Mesh Data Type', 1),
(315, '.mads', 'application/mads+xml', '', 'Metadata Authority Description Schema', 1),
(316, '.mets', 'application/mets+xml', '', 'Metadata Encoding and Transmission Standard', 1),
(317, '.mods', 'application/mods+xml', '', 'Metadata Object Description Schema', 1),
(318, '.meta4', 'application/metalink4+xml', '', 'Metalink', 1),
(319, '.potm', 'application/vnd.ms-powerpoint.template.macroenabled.12', '', 'Micosoft PowerPoint - Macro-Enabled Template File', 1),
(320, '.docm', 'application/vnd.ms-word.document.macroenabled.12', '', 'Micosoft Word - Macro-Enabled Document', 1),
(321, '.dotm', 'application/vnd.ms-word.template.macroenabled.12', '', 'Micosoft Word - Macro-Enabled Template', 1),
(322, '.mcd', 'application/vnd.mcd', '', 'Micro CADAM Helix D&D', 1),
(323, '.flo', 'application/vnd.micrografx.flo', '', 'Micrografx', 1),
(324, '.igx', 'application/vnd.micrografx.igx', '', 'Micrografx iGrafx Professional', 1),
(325, '.es3', 'application/vnd.eszigno3+xml', '', 'MICROSEC e-Szign?', 1),
(326, '.mdb', 'application/x-msaccess', '', 'Microsoft Access', 1),
(327, '.asf', 'video/x-ms-asf', '', 'Microsoft Advanced Systems Format (ASF)', 1),
(328, '.exe', 'application/x-msdownload', '', 'Microsoft Application', 1),
(329, '.cil', 'application/vnd.ms-artgalry', 'binary', 'Microsoft Artgalry', 1),
(330, '.cab', 'application/vnd.ms-cab-compressed', '', 'Microsoft Cabinet File', 1),
(331, '.ims', 'application/vnd.ms-ims', '', 'Microsoft Class Server', 1),
(332, '.application', 'application/x-ms-application', 'binary', 'Microsoft ClickOnce', 1),
(333, '.clp', 'application/x-msclip', '', 'Microsoft Clipboard Clip', 1),
(334, '.mdi', 'image/vnd.ms-modi', 'image', 'Microsoft Document Imaging Format', 1),
(335, '.eot', 'application/vnd.ms-fontobject', '', 'Microsoft Embedded OpenType', 1),
(336, '.xls', 'application/vnd.ms-excel', 'database', 'Microsoft Excel', 1),
(337, '.xlam', 'application/vnd.ms-excel.addin.macroenabled.12', '', 'Microsoft Excel - Add-In File', 1),
(338, '.xlsb', 'application/vnd.ms-excel.sheet.binary.macroenabled.12', '', 'Microsoft Excel - Binary Workbook', 1),
(339, '.xltm', 'application/vnd.ms-excel.template.macroenabled.12', '', 'Microsoft Excel - Macro-Enabled Template File', 1),
(340, '.xlsm', 'application/vnd.ms-excel.sheet.macroenabled.12', '', 'Microsoft Excel - Macro-Enabled Workbook', 1),
(341, '.chm', 'application/vnd.ms-htmlhelp', '', 'Microsoft Html Help File', 1),
(342, '.crd', 'application/x-mscardfile', '', 'Microsoft Information Card', 1),
(343, '.lrm', 'application/vnd.ms-lrm', '', 'Microsoft Learning Resource Module', 1),
(344, '.mvb', 'application/x-msmediaview', '', 'Microsoft MediaView', 1),
(345, '.mny', 'application/x-msmoney', '', 'Microsoft Money', 1),
(346, '.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'document', 'Microsoft Office - OOXML - Presentation', 1),
(347, '.sldx', 'application/vnd.openxmlformats-officedocument.presentationml.slide', '', 'Microsoft Office - OOXML - Presentation (Slide)', 1),
(348, '.ppsx', 'application/vnd.openxmlformats-officedocument.presentationml.slideshow', '', 'Microsoft Office - OOXML - Presentation (Slideshow)', 1),
(349, '.potx', 'application/vnd.openxmlformats-officedocument.presentationml.template', '', 'Microsoft Office - OOXML - Presentation Template', 1),
(350, '.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'database', 'Microsoft Office - OOXML - Spreadsheet', 1),
(351, '.xltx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.template', '', 'Microsoft Office - OOXML - Spreadsheet Teplate', 1),
(352, '.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'document', 'Microsoft Office - OOXML - Word Document', 1),
(353, '.dotx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.template', 'script', 'Microsoft Office - OOXML - Word Document Template', 1),
(354, '.obd', 'application/x-msbinder', '', 'Microsoft Office Binder', 1),
(355, '.thmx', 'application/vnd.ms-officetheme', '', 'Microsoft Office System Release Theme', 1),
(356, '.onetoc', 'application/onenote', '', 'Microsoft OneNote', 1),
(357, '.pya', 'audio/vnd.ms-playready.media.pya', '', 'Microsoft PlayReady Ecosystem', 1),
(358, '.pyv', 'video/vnd.ms-playready.media.pyv', '', 'Microsoft PlayReady Ecosystem Video', 1),
(359, '.ppt', 'application/vnd.ms-powerpoint', 'document', 'Microsoft PowerPoint', 1),
(360, '.ppam', 'application/vnd.ms-powerpoint.addin.macroenabled.12', '', 'Microsoft PowerPoint - Add-in file', 1),
(361, '.sldm', 'application/vnd.ms-powerpoint.slide.macroenabled.12', '', 'Microsoft PowerPoint - Macro-Enabled Open XML Slide', 1),
(362, '.pptm', 'application/vnd.ms-powerpoint.presentation.macroenabled.12', '', 'Microsoft PowerPoint - Macro-Enabled Presentation File', 1),
(363, '.ppsm', 'application/vnd.ms-powerpoint.slideshow.macroenabled.12', '', 'Microsoft PowerPoint - Macro-Enabled Slide Show File', 1),
(364, '.mpp', 'application/vnd.ms-project', '', 'Microsoft Project', 1),
(365, '.pub', 'application/x-mspublisher', '', 'Microsoft Publisher', 1),
(366, '.scd', 'application/x-msschedule', '', 'Microsoft Schedule+', 1),
(367, '.xap', 'application/x-silverlight-app', '', 'Microsoft Silverlight', 1),
(368, '.stl', 'application/vnd.ms-pki.stl', '', 'Microsoft Trust UI Provider - Certificate Trust Link', 1),
(369, '.cat', 'application/vnd.ms-pki.seccat', '', 'Microsoft Trust UI Provider - Security Catalog', 1),
(370, '.vsd', 'application/vnd.visio', '', 'Microsoft Visio', 1),
(371, '.wm', 'video/x-ms-wm', '', 'Microsoft Windows Media', 1),
(372, '.wma', 'audio/x-ms-wma', 'audio', 'Microsoft Windows Media Audio', 1),
(373, '.wax', 'audio/x-ms-wax', '', 'Microsoft Windows Media Audio Redirector', 1),
(374, '.wmx', 'video/x-ms-wmx', '', 'Microsoft Windows Media Audio/Video Playlist', 1),
(375, '.wmd', 'application/x-ms-wmd', '', 'Microsoft Windows Media Player Download Package', 1),
(376, '.wpl', 'application/vnd.ms-wpl', '', 'Microsoft Windows Media Player Playlist', 1),
(377, '.wmz', 'application/x-ms-wmz', '', 'Microsoft Windows Media Player Skin Package', 1),
(378, '.wmv', 'video/x-ms-wmv', 'video', 'Microsoft Windows Media Video', 1),
(379, '.wvx', 'video/x-ms-wvx', '', 'Microsoft Windows Media Video Playlist', 1),
(380, '.wmf', 'application/x-msmetafile', '', 'Microsoft Windows Metafile', 1),
(381, '.trm', 'application/x-msterminal', '', 'Microsoft Windows Terminal Services', 1),
(382, '.doc', 'application/msword', '', 'Microsoft Word', 1),
(383, '.wri', 'application/x-mswrite', '', 'Microsoft Wordpad', 1),
(384, '.wps', 'application/vnd.ms-works', '', 'Microsoft Works', 1),
(385, '.xbap', 'application/x-ms-xbap', '', 'Microsoft XAML Browser Application', 1),
(386, '.xps', 'application/vnd.ms-xpsdocument', 'document', 'Microsoft XML Paper Specification', 1),
(387, '.mid', 'audio/midi', 'audio', 'MIDI - Musical Instrument Digital Interface', 1),
(388, '.mpy', 'application/vnd.ibm.minipay', '', 'MiniPay', 1),
(389, '.afp', 'application/vnd.ibm.modcap', '', 'MO:DCA-P', 1),
(390, '.rms', 'application/vnd.jcp.javame.midlet-rms', '', 'Mobile Information Device Profile', 1),
(391, '.tmo', 'application/vnd.tmobile-livetv', '', 'MobileTV', 1),
(392, '.prc', 'application/x-mobipocket-ebook', '', 'Mobipocket', 1),
(393, '.mbk', 'application/vnd.mobius.mbk', '', 'Mobius Management Systems - Basket file', 1),
(394, '.dis', 'application/vnd.mobius.dis', '', 'Mobius Management Systems - Distribution Database', 1),
(395, '.plc', 'application/vnd.mobius.plc', '', 'Mobius Management Systems - Policy Definition Language File', 1),
(396, '.mqy', 'application/vnd.mobius.mqy', '', 'Mobius Management Systems - Query File', 1),
(397, '.msl', 'application/vnd.mobius.msl', '', 'Mobius Management Systems - Script Language', 1),
(398, '.txf', 'application/vnd.mobius.txf', '', 'Mobius Management Systems - Topic Index File', 1),
(399, '.daf', 'application/vnd.mobius.daf', '', 'Mobius Management Systems - UniversalArchive', 1),
(400, '.fly', 'text/vnd.fly', '', 'mod_fly / fly.cgi', 1),
(401, '.mpc', 'application/vnd.mophun.certificate', '', 'Mophun Certificate', 1),
(402, '.mpn', 'application/vnd.mophun.application', '', 'Mophun VM', 1),
(403, '.mj2', 'video/mj2', '', 'Motion JPEG 2000', 1),
(404, '.mpga', 'audio/mpeg', '', 'MPEG Audio', 1),
(405, '.mxu', 'video/vnd.mpegurl', '', 'MPEG Url', 1),
(406, '.mpeg', 'video/mpeg', '', 'MPEG Video', 1),
(407, '.m21', 'application/mp21', '', 'MPEG-21', 1),
(408, '.mp4a', 'audio/mp4', '', 'MPEG-4 Audio', 1),
(409, '.mp4', 'video/mp4', 'video', 'MPEG-4 Video', 1),
(410, '.mp4', 'application/mp4', 'video', 'MPEG4', 1),
(411, '.m3u8', 'application/vnd.apple.mpegurl', '', 'Multimedia Playlist Unicode', 1),
(412, '.mus', 'application/vnd.musician', '', 'MUsical Score Interpreted Code Invented for the ASCII designation of Notation', 1),
(413, '.msty', 'application/vnd.muvee.style', '', 'Muvee Automatic Video Editing', 1),
(414, '.mxml', 'application/xv+xml', '', 'MXML', 1),
(415, '.ngdat', 'application/vnd.nokia.n-gage.data', '', 'N-Gage Game Data', 1),
(416, '.n-gage', 'application/vnd.nokia.n-gage.symbian.install', '', 'N-Gage Game Installer', 1),
(417, '.ncx', 'application/x-dtbncx+xml', '', 'Navigation Control file for XML (for ePub)', 1),
(418, '.nc', 'application/x-netcdf', '', 'Network Common Data Form (NetCDF)', 1),
(419, '.nlu', 'application/vnd.neurolanguage.nlu', '', 'neuroLanguage', 1),
(420, '.dna', 'application/vnd.dna', '', 'New Moon Liftoff/DNA', 1),
(421, '.nnd', 'application/vnd.noblenet-directory', '', 'NobleNet Directory', 1),
(422, '.nns', 'application/vnd.noblenet-sealer', '', 'NobleNet Sealer', 1),
(423, '.nnw', 'application/vnd.noblenet-web', '', 'NobleNet Web', 1),
(424, '.rpst', 'application/vnd.nokia.radio-preset', '', 'Nokia Radio Application - Preset', 1),
(425, '.rpss', 'application/vnd.nokia.radio-presets', '', 'Nokia Radio Application - Preset', 1),
(426, '.n3', 'text/n3', '', 'Notation3', 1),
(427, '.edm', 'application/vnd.novadigm.edm', '', 'Novadigm''s RADIA and EDM products', 1),
(428, '.edx', 'application/vnd.novadigm.edx', '', 'Novadigm''s RADIA and EDM products', 1),
(429, '.ext', 'application/vnd.novadigm.ext', '', 'Novadigm''s RADIA and EDM products', 1),
(430, '.gph', 'application/vnd.flographit', '', 'NpGraphIt', 1),
(431, '.ecelp4800', 'audio/vnd.nuera.ecelp4800', '', 'Nuera ECELP 4800', 1),
(432, '.ecelp7470', 'audio/vnd.nuera.ecelp7470', '', 'Nuera ECELP 7470', 1),
(433, '.ecelp9600', 'audio/vnd.nuera.ecelp9600', '', 'Nuera ECELP 9600', 1),
(434, '.oda', 'application/oda', 'document', 'Office Document Architecture', 1),
(435, '.ogx', 'application/ogg', 'document', 'Ogg', 1),
(436, '.oga', 'audio/ogg', 'audio', 'Ogg Audio', 1),
(437, '.ogv', 'video/ogg', 'video', 'Ogg Video', 1),
(438, '.dd2', 'application/vnd.oma.dd2+xml', '', 'OMA Download Agents', 1),
(439, '.oth', 'application/vnd.oasis.opendocument.text-web', '', 'Open Document Text Web', 1),
(440, '.opf', 'application/oebps-package+xml', '', 'Open eBook Publication Structure', 1),
(441, '.qbo', 'application/vnd.intu.qbo', '', 'Open Financial Exchange', 1),
(442, '.oxt', 'application/vnd.openofficeorg.extension', '', 'Open Office Extension', 1),
(443, '.osf', 'application/vnd.yamaha.openscoreformat', '', 'Open Score Format', 1),
(444, '.weba', 'audio/webm', 'audio', 'Open Web Media Project - Audio', 1),
(445, '.webm', 'video/webm', 'video', 'Open Web Media Project - Video', 1),
(446, '.odc', 'application/vnd.oasis.opendocument.chart', '', 'OpenDocument Chart', 1),
(447, '.otc', 'application/vnd.oasis.opendocument.chart-template', '', 'OpenDocument Chart Template', 1),
(448, '.odb', 'application/vnd.oasis.opendocument.database', 'database', 'OpenDocument Database', 1),
(449, '.odf', 'application/vnd.oasis.opendocument.formula', '', 'OpenDocument Formula', 1),
(450, '.odft', 'application/vnd.oasis.opendocument.formula-template', '', 'OpenDocument Formula Template', 1),
(451, '.odg', 'application/vnd.oasis.opendocument.graphics', 'image', 'OpenDocument Graphics', 1),
(452, '.otg', 'application/vnd.oasis.opendocument.graphics-template', '', 'OpenDocument Graphics Template', 1),
(453, '.odi', 'application/vnd.oasis.opendocument.image', 'image', 'OpenDocument Image', 1),
(454, '.oti', 'application/vnd.oasis.opendocument.image-template', '', 'OpenDocument Image Template', 1),
(455, '.odp', 'application/vnd.oasis.opendocument.presentation', 'document', 'OpenDocument Presentation', 1),
(456, '.otp', 'application/vnd.oasis.opendocument.presentation-template', '', 'OpenDocument Presentation Template', 1),
(457, '.ods', 'application/vnd.oasis.opendocument.spreadsheet', 'database', 'OpenDocument Spreadsheet', 1),
(458, '.ots', 'application/vnd.oasis.opendocument.spreadsheet-template', '', 'OpenDocument Spreadsheet Template', 1),
(459, '.odt', 'application/vnd.oasis.opendocument.text', '', 'OpenDocument Text', 1),
(460, '.odm', 'application/vnd.oasis.opendocument.text-master', '', 'OpenDocument Text Master', 1),
(461, '.ott', 'application/vnd.oasis.opendocument.text-template', '', 'OpenDocument Text Template', 1),
(462, '.ktx', 'image/ktx', '', 'OpenGL Textures (KTX)', 1),
(463, '.sxc', 'application/vnd.sun.xml.calc', 'database', 'OpenOffice - Calc (Spreadsheet)', 1),
(464, '.stc', 'application/vnd.sun.xml.calc.template', '', 'OpenOffice - Calc Template (Spreadsheet)', 1),
(465, '.sxd', 'application/vnd.sun.xml.draw', '', 'OpenOffice - Draw (Graphics)', 1),
(466, '.std', 'application/vnd.sun.xml.draw.template', '', 'OpenOffice - Draw Template (Graphics)', 1),
(467, '.sxi', 'application/vnd.sun.xml.impress', '', 'OpenOffice - Impress (Presentation)', 1),
(468, '.sti', 'application/vnd.sun.xml.impress.template', '', 'OpenOffice - Impress Template (Presentation)', 1),
(469, '.sxm', 'application/vnd.sun.xml.math', '', 'OpenOffice - Math (Formula)', 1),
(470, '.sxw', 'application/vnd.sun.xml.writer', '', 'OpenOffice - Writer (Text - HTML)', 1),
(471, '.sxg', 'application/vnd.sun.xml.writer.global', '', 'OpenOffice - Writer (Text - HTML)', 1),
(472, '.stw', 'application/vnd.sun.xml.writer.template', '', 'OpenOffice - Writer Template (Text - HTML)', 1),
(473, '.otf', 'application/x-font-otf', '', 'OpenType Font File', 1),
(474, '.osfpvg', 'application/vnd.yamaha.openscoreformat.osfpvg+xml', '', 'OSFPVG', 1),
(475, '.dp', 'application/vnd.osgi.dp', '', 'OSGi Deployment Package', 1),
(476, '.pdb', 'application/vnd.palm', '', 'PalmOS Data', 1),
(477, '.p', 'text/x-pascal', '', 'Pascal Source File', 1),
(478, '.paw', 'application/vnd.pawaafile', '', 'PawaaFILE', 1),
(479, '.pclxl', 'application/vnd.hp-pclxl', '', 'PCL 6 Enhanced (Formely PCL XL)', 1),
(480, '.efif', 'application/vnd.picsel', '', 'Pcsel eFIF File', 1),
(481, '.pcx', 'image/x-pcx', '', 'PCX Image', 1),
(482, '.psd', 'image/vnd.adobe.photoshop', 'image', 'Photoshop Document', 1),
(483, '.prf', 'application/pics-rules', '', 'PICSRules', 1),
(484, '.pic', 'image/x-pict', 'image', 'PICT Image', 1),
(485, '.chat', 'application/x-chat', '', 'pIRCh', 1),
(486, '.p10', 'application/pkcs10', '', 'PKCS #10 - Certification Request Standard', 1),
(487, '.p12', 'application/x-pkcs12', '', 'PKCS #12 - Personal Information Exchange Syntax Standard', 1),
(488, '.p7m', 'application/pkcs7-mime', '', 'PKCS #7 - Cryptographic Message Syntax Standard', 1),
(489, '.p7s', 'application/pkcs7-signature', '', 'PKCS #7 - Cryptographic Message Syntax Standard', 1),
(490, '.p7r', 'application/x-pkcs7-certreqresp', '', 'PKCS #7 - Cryptographic Message Syntax Standard (Certificate Request Response)', 1),
(491, '.p7b', 'application/x-pkcs7-certificates', '', 'PKCS #7 - Cryptographic Message Syntax Standard (Certificates)', 1),
(492, '.p8', 'application/pkcs8', '', 'PKCS #8 - Private-Key Information Syntax Standard', 1),
(493, '.plf', 'application/vnd.pocketlearn', '', 'PocketLearn Viewers', 1),
(494, '.pnm', 'image/x-portable-anymap', '', 'Portable Anymap Image', 1),
(495, '.pbm', 'image/x-portable-bitmap', '', 'Portable Bitmap Format', 1),
(496, '.pcf', 'application/x-font-pcf', '', 'Portable Compiled Format', 1),
(497, '.pfr', 'application/font-tdpfr', '', 'Portable Font Resource', 1),
(498, '.pgn', 'application/x-chess-pgn', '', 'Portable Game Notation (Chess Games)', 1),
(499, '.pgm', 'image/x-portable-graymap', '', 'Portable Graymap Format', 1),
(500, '.png', 'image/png', 'image', 'Portable Network Graphics (PNG)', 1),
(501, '.ppm', 'image/x-portable-pixmap', '', 'Portable Pixmap Format', 1),
(502, '.pskcxml', 'application/pskc+xml', '', 'Portable Symmetric Key Container', 1),
(503, '.pml', 'application/vnd.ctc-posml', '', 'PosML', 1),
(504, '.ai', 'application/postscript', '', 'PostScript', 1),
(505, '.pfa', 'application/x-font-type1', '', 'PostScript Fonts', 1),
(506, '.pbd', 'application/vnd.powerbuilder6', '', 'PowerBuilder', 1),
(507, '', 'application/pgp-encrypted', '', 'Pretty Good Privacy', 1),
(508, '.pgp', 'application/pgp-signature', '', 'Pretty Good Privacy - Signature', 1),
(509, '.box', 'application/vnd.previewsystems.box', '', 'Preview Systems ZipLock/VBox', 1),
(510, '.ptid', 'application/vnd.pvi.ptid1', '', 'Princeton Video Image', 1),
(511, '.pls', 'application/pls+xml', '', 'Pronunciation Lexicon Specification', 1),
(512, '.str', 'application/vnd.pg.format', '', 'Proprietary P&G Standard Reporting System', 1),
(513, '.ei6', 'application/vnd.pg.osasli', '', 'Proprietary P&G Standard Reporting System', 1),
(514, '.dsc', 'text/prs.lines.tag', '', 'PRS Lines Tag', 1),
(515, '.psf', 'application/x-font-linux-psf', '', 'PSF Fonts', 1),
(516, '.qps', 'application/vnd.publishare-delta-tree', '', 'PubliShare Objects', 1),
(517, '.wg', 'application/vnd.pmi.widget', '', 'Qualcomm''s Plaza Mobile Internet', 1),
(518, '.qxd', 'application/vnd.quark.quarkxpress', '', 'QuarkXpress', 1),
(519, '.esf', 'application/vnd.epson.esf', '', 'QUASS Stream Player', 1),
(520, '.msf', 'application/vnd.epson.msf', '', 'QUASS Stream Player', 1),
(521, '.ssf', 'application/vnd.epson.ssf', '', 'QUASS Stream Player', 1),
(522, '.qam', 'application/vnd.epson.quickanime', '', 'QuickAnime Player', 1),
(523, '.qfx', 'application/vnd.intu.qfx', '', 'Quicken', 1),
(524, '.qt', 'video/quicktime', '', 'Quicktime Video', 1),
(525, '.rar', 'application/x-rar-compressed', 'archive', 'RAR Archive', 1),
(526, '.ram', 'audio/x-pn-realaudio', '', 'Real Audio Sound', 1),
(527, '.rmp', 'audio/x-pn-realaudio-plugin', '', 'Real Audio Sound', 1),
(528, '.rsd', 'application/rsd+xml', '', 'Really Simple Discovery', 1),
(529, '.rm', 'application/vnd.rn-realmedia', '', 'RealMedia', 1),
(530, '.bed', 'application/vnd.realvnc.bed', '', 'RealVNC', 1),
(531, '.mxl', 'application/vnd.recordare.musicxml', '', 'Recordare Applications', 1),
(532, '.musicxml', 'application/vnd.recordare.musicxml+xml', '', 'Recordare Applications', 1),
(533, '.rnc', 'application/relax-ng-compact-syntax', '', 'Relax NG Compact Syntax', 1),
(534, '.rdz', 'application/vnd.data-vision.rdz', '', 'RemoteDocs R-Viewer', 1),
(535, '.rdf', 'application/rdf+xml', '', 'Resource Description Framework', 1),
(536, '.rp9', 'application/vnd.cloanto.rp9', '', 'RetroPlatform Player', 1),
(537, '.jisp', 'application/vnd.jisp', '', 'RhymBox', 1),
(538, '.rtf', 'application/rtf', 'document', 'Rich Text Format', 1),
(539, '.rtx', 'text/richtext', 'document', 'Rich Text Format (RTF)', 1),
(540, '.link66', 'application/vnd.route66.link66+xml', '', 'ROUTE 66 Location Based Services', 1),
(541, '.rss, .xml', 'application/rss+xml', 'script', 'RSS - Really Simple Syndication', 1),
(542, '.shf', 'application/shf+xml', '', 'S Hexdump Format', 1),
(543, '.st', 'application/vnd.sailingtracker.track', '', 'SailingTracker', 1),
(544, '.svg', 'image/svg+xml', '', 'Scalable Vector Graphics (SVG)', 1),
(545, '.sus', 'application/vnd.sus-calendar', '', 'ScheduleUs', 1),
(546, '.sru', 'application/sru+xml', '', 'Search/Retrieve via URL Response Format', 1),
(547, '.setpay', 'application/set-payment-initiation', '', 'Secure Electronic Transaction - Payment', 1),
(548, '.setreg', 'application/set-registration-initiation', '', 'Secure Electronic Transaction - Registration', 1),
(549, '.sema', 'application/vnd.sema', '', 'Secured eMail', 1),
(550, '.semd', 'application/vnd.semd', '', 'Secured eMail', 1),
(551, '.semf', 'application/vnd.semf', '', 'Secured eMail', 1),
(552, '.see', 'application/vnd.seemail', '', 'SeeMail', 1),
(553, '.snf', 'application/x-font-snf', '', 'Server Normal Format', 1),
(554, '.spq', 'application/scvp-vp-request', '', 'Server-Based Certificate Validation Protocol - Validation Policies - Request', 1),
(555, '.spp', 'application/scvp-vp-response', '', 'Server-Based Certificate Validation Protocol - Validation Policies - Response', 1),
(556, '.scq', 'application/scvp-cv-request', '', 'Server-Based Certificate Validation Protocol - Validation Request', 1),
(557, '.scs', 'application/scvp-cv-response', '', 'Server-Based Certificate Validation Protocol - Validation Response', 1),
(558, '.sdp', 'application/sdp', '', 'Session Description Protocol', 1),
(559, '.etx', 'text/x-setext', '', 'Setext', 1),
(560, '.movie', 'video/x-sgi-movie', 'video', 'SGI Movie', 1),
(561, '.ifm', 'application/vnd.shana.informed.formdata', '', 'Shana Informed Filler', 1),
(562, '.itp', 'application/vnd.shana.informed.formtemplate', '', 'Shana Informed Filler', 1),
(563, '.iif', 'application/vnd.shana.informed.interchange', '', 'Shana Informed Filler', 1),
(564, '.ipk', 'application/vnd.shana.informed.package', 'archive', 'Shana Informed Filler', 1),
(565, '.tfi', 'application/thraud+xml', '', 'Sharing Transaction Fraud Data', 1),
(566, '.shar', 'application/x-shar', '', 'Shell Archive', 1),
(567, '.rgb', 'image/x-rgb', '', 'Silicon Graphics RGB Bitmap', 1),
(568, '.slt', 'application/vnd.epson.salt', '', 'SimpleAnimeLite Player', 1),
(569, '.aso', 'application/vnd.accpac.simply.aso', '', 'Simply Accounting', 1),
(570, '.imp', 'application/vnd.accpac.simply.imp', '', 'Simply Accounting - Data Import', 1),
(571, '.twd', 'application/vnd.simtech-mindmapper', '', 'SimTech MindMapper', 1),
(572, '.csp', 'application/vnd.commonspace', '', 'Sixth Floor Media - CommonSpace', 1),
(573, '.saf', 'application/vnd.yamaha.smaf-audio', '', 'SMAF Audio', 1),
(574, '.mmf', 'application/vnd.smaf', '', 'SMAF File', 1),
(575, '.spf', 'application/vnd.yamaha.smaf-phrase', '', 'SMAF Phrase', 1),
(576, '.teacher', 'application/vnd.smart.teacher', '', 'SMART Technologies Apps', 1),
(577, '.svd', 'application/vnd.svd', '', 'SourceView Document', 1),
(578, '.rq', 'application/sparql-query', '', 'SPARQL - Query', 1),
(579, '.srx', 'application/sparql-results+xml', '', 'SPARQL - Results', 1),
(580, '.gram', 'application/srgs', '', 'Speech Recognition Grammar Specification', 1),
(581, '.grxml', 'application/srgs+xml', '', 'Speech Recognition Grammar Specification - XML', 1),
(582, '.ssml', 'application/ssml+xml', '', 'Speech Synthesis Markup Language', 1),
(583, '.skp', 'application/vnd.koan', '', 'SSEYO Koan Play File', 1),
(584, '.sgml', 'text/sgml', '', 'Standard Generalized Markup Language (SGML)', 1),
(585, '.sdc', 'application/vnd.stardivision.calc', '', 'StarOffice - Calc', 1),
(586, '.sda', 'application/vnd.stardivision.draw', '', 'StarOffice - Draw', 1),
(587, '.sdd', 'application/vnd.stardivision.impress', '', 'StarOffice - Impress', 1),
(588, '.smf', 'application/vnd.stardivision.math', '', 'StarOffice - Math', 1),
(589, '.sdw', 'application/vnd.stardivision.writer', '', 'StarOffice - Writer', 1),
(590, '.sgl', 'application/vnd.stardivision.writer-global', '', 'StarOffice - Writer (Global)', 1),
(591, '.sm', 'application/vnd.stepmania.stepchart', '', 'StepMania', 1),
(592, '.sit', 'application/x-stuffit', '', 'Stuffit Archive', 1),
(593, '.sitx', 'application/x-stuffitx', '', 'Stuffit Archive', 1),
(594, '.sdkm', 'application/vnd.solent.sdkm+xml', '', 'SudokuMagic', 1),
(595, '.xo', 'application/vnd.olpc-sugar', '', 'Sugar Linux Application Bundle', 1),
(596, '.au', 'audio/basic', '', 'Sun Audio - Au file format', 1),
(597, '.wqd', 'application/vnd.wqd', '', 'SundaHus WQ', 1),
(598, '.sis', 'application/vnd.symbian.install', '', 'Symbian Install Package', 1),
(599, '.smi', 'application/smil+xml', '', 'Synchronized Multimedia Integration Language', 1),
(600, '.xsm', 'application/vnd.syncml+xml', '', 'SyncML', 1),
(601, '.bdm', 'application/vnd.syncml.dm+wbxml', '', 'SyncML - Device Management', 1),
(602, '.xdm', 'application/vnd.syncml.dm+xml', '', 'SyncML - Device Management', 1),
(603, '.sv4cpio', 'application/x-sv4cpio', '', 'System V Release 4 CPIO Archive', 1),
(604, '.sv4crc', 'application/x-sv4crc', '', 'System V Release 4 CPIO Checksum Data', 1),
(605, '.sbml', 'application/sbml+xml', '', 'Systems Biology Markup Language', 1),
(606, '.tsv', 'text/tab-separated-values', '', 'Tab Seperated Values', 1),
(607, '.tiff', 'image/tiff', 'image', 'Tagged Image File Format', 1),
(608, '.tao', 'application/vnd.tao.intent-module-archive', '', 'Tao Intent', 1),
(609, '.tar', 'application/x-tar', '', 'Tar File (Tape Archive)', 1),
(610, '.tcl', 'application/x-tcl', '', 'Tcl Script', 1),
(611, '.tex', 'application/x-tex', '', 'TeX', 1),
(612, '.tfm', 'application/x-tex-tfm', '', 'TeX Font Metric', 1),
(613, '.tei', 'application/tei+xml', '', 'Text Encoding and Interchange', 1),
(614, '.txt', 'text/plain', 'document', 'Text File', 1),
(615, '.dxp', 'application/vnd.spotfire.dxp', '', 'TIBCO Spotfire', 1),
(616, '.sfs', 'application/vnd.spotfire.sfs', '', 'TIBCO Spotfire', 1),
(617, '.tsd', 'application/timestamped-data', '', 'Time Stamped Data Envelope', 1),
(618, '.tpt', 'application/vnd.trid.tpt', '', 'TRI Systems Config', 1),
(619, '.mxs', 'application/vnd.triscape.mxs', '', 'Triscape Map Explorer', 1),
(620, '.t', 'text/troff', '', 'troff', 1),
(621, '.tra', 'application/vnd.trueapp', '', 'True BASIC', 1),
(622, '.ttf', 'application/x-font-ttf', '', 'TrueType Font', 1),
(623, '.ttl', 'text/turtle', '', 'Turtle (Terse RDF Triple Language)', 1),
(624, '.umj', 'application/vnd.umajin', '', 'UMAJIN', 1),
(625, '.uoml', 'application/vnd.uoml+xml', '', 'Unique Object Markup Language', 1),
(626, '.unityweb', 'application/vnd.unity', '', 'Unity 3d', 1),
(627, '.ufd', 'application/vnd.ufdl', '', 'Universal Forms Description Language', 1),
(628, '.uri', 'text/uri-list', '', 'URI Resolution Services', 1),
(629, '.utz', 'application/vnd.uiq.theme', '', 'User Interface Quartz - Theme (Symbian)', 1),
(630, '.ustar', 'application/x-ustar', '', 'Ustar (Uniform Standard Tape Archive)', 1),
(631, '.uu', 'text/x-uuencode', '', 'UUEncode', 1),
(632, '.vcs', 'text/x-vcalendar', '', 'vCalendar', 1),
(633, '.vcf', 'text/x-vcard', '', 'vCard', 1),
(634, '.vcd', 'application/x-cdlink', 'video', 'Video CD', 1),
(635, '.vsf', 'application/vnd.vsf', '', 'Viewport+', 1),
(636, '.wrl', 'model/vrml', '', 'Virtual Reality Modeling Language', 1),
(637, '.vcx', 'application/vnd.vcx', '', 'VirtualCatalog', 1),
(638, '.mts', 'model/vnd.mts', '', 'Virtue MTS', 1),
(639, '.vtu', 'model/vnd.vtu', '', 'Virtue VTU', 1),
(640, '.vis', 'application/vnd.visionary', '', 'Visionary', 1),
(641, '.viv', 'video/vnd.vivo', '', 'Vivo', 1);
INSERT INTO `wjrcv_sellacious_mimes` (`id`, `extension`, `mime`, `category`, `note`, `state`) VALUES
(642, '.ccxml', 'application/ccxml+xml,', '', 'Voice Browser Call Control', 1),
(643, '.vxml', 'application/voicexml+xml', '', 'VoiceXML', 1),
(644, '.src', 'application/x-wais-source', '', 'WAIS Source', 1),
(645, '.wbxml', 'application/vnd.wap.wbxml', '', 'WAP Binary XML (WBXML)', 1),
(646, '.wbmp', 'image/vnd.wap.wbmp', '', 'WAP Bitamp (WBMP)', 1),
(647, '.wav', 'audio/x-wav', 'audio', 'Waveform Audio File Format (WAV)', 1),
(648, '.davmount', 'application/davmount+xml', '', 'Web Distributed Authoring and Versioning', 1),
(649, '.woff', 'application/x-font-woff', '', 'Web Open Font Format', 1),
(650, '.wspolicy', 'application/wspolicy+xml', '', 'Web Services Policy', 1),
(651, '.webp', 'image/webp', '', 'WebP Image', 1),
(652, '.wtb', 'application/vnd.webturbo', '', 'WebTurbo', 1),
(653, '.wgt', 'application/widget', '', 'Widget Packaging and XML Configuration', 1),
(654, '.hlp', 'application/winhlp', '', 'WinHelp', 1),
(655, '.wml', 'text/vnd.wap.wml', 'script', 'Wireless Markup Language (WML)', 1),
(656, '.wmls', 'text/vnd.wap.wmlscript', 'script', 'Wireless Markup Language Script (WMLScript)', 1),
(657, '.wmlsc', 'application/vnd.wap.wmlscriptc', 'script', 'WMLScript', 1),
(658, '.wpd', 'application/vnd.wordperfect', '', 'Wordperfect', 1),
(659, '.stf', 'application/vnd.wt.stf', '', 'Worldtalk', 1),
(660, '.wsdl', 'application/wsdl+xml', '', 'WSDL - Web Services Description Language', 1),
(661, '.xbm', 'image/x-xbitmap', '', 'X BitMap', 1),
(662, '.xpm', 'image/x-xpixmap', '', 'X PixMap', 1),
(663, '.xwd', 'image/x-xwindowdump', '', 'X Window Dump', 1),
(664, '.der', 'application/x-x509-ca-cert', '', 'X.509 Certificate', 1),
(665, '.fig', 'application/x-xfig', '', 'Xfig', 1),
(666, '.xhtml', 'application/xhtml+xml', 'script', 'XHTML - The Extensible HyperText Markup Language', 1),
(667, '.xml', 'application/xml', 'script', 'XML - Extensible Markup Language', 1),
(668, '.xdf', 'application/xcap-diff+xml', '', 'XML Configuration Access Protocol - XCAP Diff', 1),
(669, '.xenc', 'application/xenc+xml', '', 'XML Encryption Syntax and Processing', 1),
(670, '.xer', 'application/patch-ops-error+xml', '', 'XML Patch Framework', 1),
(671, '.rl', 'application/resource-lists+xml', '', 'XML Resource Lists', 1),
(672, '.rs', 'application/rls-services+xml', '', 'XML Resource Lists', 1),
(673, '.rld', 'application/resource-lists-diff+xml', '', 'XML Resource Lists Diff', 1),
(674, '.xslt', 'application/xslt+xml', '', 'XML Transformations', 1),
(675, '.xop', 'application/xop+xml', '', 'XML-Binary Optimized Packaging', 1),
(676, '.xpi', 'application/x-xpinstall', '', 'XPInstall - Mozilla', 1),
(677, '.xspf', 'application/xspf+xml', '', 'XSPF - XML Shareable Playlist Format', 1),
(678, '.xul', 'application/vnd.mozilla.xul+xml', '', 'XUL - XML User Interface Language', 1),
(679, '.xyz', 'chemical/x-xyz', '', 'XYZ File Format', 1),
(680, '.yaml', 'text/yaml', '', 'YAML Ain''t Markup Language / Yet Another Markup Language', 1),
(681, '.yang', 'application/yang', '', 'YANG Data Modeling Language', 1),
(682, '.yin', 'application/yin+xml', '', 'YIN (YANG - XML)', 1),
(683, '.zir', 'application/vnd.zul', '', 'Z.U.L. Geometry', 1),
(684, '.zip', 'application/zip', 'archive', 'Zip Archive', 1),
(685, '.zmm', 'application/vnd.handheld-entertainment+xml', '', 'ZVUE Media Manager', 1),
(686, '.zaz', 'application/vnd.zzazz.deck+xml', '', 'Zzazz Deck', 1),
(687, '.jpeg', 'image/jpeg', 'image', 'JPEG Image', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_orders`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_hash` varchar(150) NOT NULL,
  `order_number` varchar(50) NOT NULL COMMENT 'user viewable order identifier',
  `customer_uid` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_reg_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customer_ip` varchar(30) NOT NULL,
  `bt_name` varchar(100) NOT NULL,
  `bt_address` text NOT NULL,
  `bt_district` varchar(100) NOT NULL,
  `bt_landmark` varchar(100) NOT NULL,
  `bt_city` varchar(100) NOT NULL,
  `bt_state` varchar(100) NOT NULL,
  `bt_zip` varchar(10) NOT NULL,
  `bt_country` varchar(100) NOT NULL,
  `bt_mobile` varchar(20) NOT NULL,
  `bt_company` varchar(200) NOT NULL,
  `bt_po_box` varchar(50) NOT NULL,
  `bt_residential` int(11) NOT NULL,
  `st_name` varchar(100) NOT NULL,
  `st_address` text NOT NULL,
  `st_district` varchar(100) NOT NULL,
  `st_landmark` varchar(100) NOT NULL,
  `st_city` varchar(100) NOT NULL,
  `st_state` varchar(100) NOT NULL,
  `st_zip` varchar(10) NOT NULL,
  `st_country` varchar(100) NOT NULL,
  `st_mobile` varchar(20) NOT NULL,
  `st_company` varchar(200) NOT NULL,
  `st_po_box` varchar(50) NOT NULL,
  `st_residential` int(11) NOT NULL,
  `bt_same_st` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `payment_params` text NOT NULL,
  `currency` varchar(5) NOT NULL,
  `product_total` double NOT NULL,
  `product_taxes` double NOT NULL,
  `product_discounts` double NOT NULL,
  `product_subtotal` double NOT NULL,
  `product_shipping` double NOT NULL,
  `product_ship_tbd` int(11) NOT NULL,
  `shipping_rule` varchar(100) NOT NULL,
  `shipping_service` varchar(100) NOT NULL,
  `shipping_params` text NOT NULL,
  `checkout_forms` text NOT NULL,
  `cart_total` double NOT NULL,
  `cart_taxes` double NOT NULL,
  `cart_discounts` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_status` varchar(30) NOT NULL,
  `shoprules` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_order_items`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_uid` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(250) NOT NULL,
  `product_type` varchar(30) NOT NULL,
  `local_sku` varchar(100) NOT NULL,
  `manufacturer_sku` varchar(100) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `manufacturer_title` varchar(100) NOT NULL,
  `features` text NOT NULL,
  `variant_id` int(11) NOT NULL,
  `variant_title` varchar(250) NOT NULL,
  `variant_sku` varchar(100) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `seller_email` varchar(100) NOT NULL,
  `seller_code` varchar(100) NOT NULL,
  `seller_name` varchar(100) NOT NULL,
  `seller_company` varchar(100) NOT NULL,
  `seller_money_back` int(11) NOT NULL,
  `seller_flat_shipping` int(11) NOT NULL,
  `seller_whats_in_box` text NOT NULL,
  `return_days` int(11) NOT NULL,
  `return_tnc` text NOT NULL,
  `exchange_days` int(11) NOT NULL,
  `exchange_tnc` text NOT NULL,
  `cost_price` float(10,2) NOT NULL,
  `price_margin` float(10,2) NOT NULL,
  `price_perc_margin` int(11) NOT NULL,
  `list_price` float(10,2) NOT NULL,
  `calculated_price` float(10,2) NOT NULL,
  `override_price` float(10,2) NOT NULL,
  `product_price` float(10,2) NOT NULL,
  `sales_price` float(10,2) NOT NULL,
  `variant_price` float(10,2) NOT NULL,
  `basic_price` float(10,2) NOT NULL,
  `discount_amount` float(10,2) NOT NULL,
  `tax_amount` float(10,2) NOT NULL,
  `shipping_rule` varchar(100) NOT NULL,
  `shipping_service` varchar(100) NOT NULL,
  `shipping_free` int(11) NOT NULL,
  `shipping_amount` float(10,2) NOT NULL,
  `shipping_tbd` int(11) NOT NULL,
  `shipping_rules` text NOT NULL,
  `shipping_note` varchar(200) NOT NULL,
  `shoprules` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total` float(10,2) NOT NULL,
  `reviewed` int(11) NOT NULL DEFAULT '0',
  `reviewed_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_order_package_items`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_order_package_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL COMMENT '#fk: order_items',
  `product_id` int(11) NOT NULL,
  `product_sku` varchar(50) NOT NULL,
  `product_title` varchar(500) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `variant_sku` varchar(50) NOT NULL,
  `variant_title` varchar(500) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `manufacturer_sku` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `extras` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_order_shipments`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_order_shipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_uid` varchar(100) NOT NULL,
  `shipper` varchar(50) NOT NULL,
  `tracking_url` varchar(500) NOT NULL,
  `tracking_number` varchar(100) NOT NULL,
  `ship_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `source_address` text NOT NULL,
  `source_district` varchar(100) NOT NULL,
  `source_city` varchar(150) NOT NULL,
  `source_state` varchar(150) NOT NULL,
  `source_country` varchar(150) NOT NULL,
  `source_zip` varchar(20) NOT NULL,
  `item_serial` varchar(150) NOT NULL,
  `ship_notes` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_order_status`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_uid` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `notes` text NOT NULL,
  `customer_notes` text NOT NULL,
  `shipment` text NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_package_items`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_package_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_id` (`package_id`,`product_id`,`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_package_sellers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_package_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psx_id` int(11) NOT NULL,
  `listing_type` int(11) NOT NULL,
  `item_condition` int(11) NOT NULL,
  `flat_shipping` int(11) NOT NULL,
  `shipping_flat_fee` double NOT NULL,
  `length` varchar(50) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `vol_weight` varchar(50) NOT NULL,
  `shipping_country` int(11) NOT NULL,
  `shipping_state` int(11) NOT NULL,
  `shipping_district` int(11) NOT NULL,
  `shipping_city` int(11) NOT NULL,
  `shipping_zip` int(11) NOT NULL,
  `whats_in_box` text NOT NULL,
  `return_days` int(11) NOT NULL,
  `return_tnc` text NOT NULL,
  `exchange_days` int(11) NOT NULL,
  `exchange_tnc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_paymentmethods`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_paymentmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `handler` varchar(100) NOT NULL,
  `success_status` int(11) NOT NULL,
  `percent_fee` decimal(10,4) NOT NULL,
  `flat_fee` decimal(10,4) NOT NULL COMMENT 'Always in shop currency',
  `contexts` text NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wjrcv_sellacious_paymentmethods`
--

INSERT INTO `wjrcv_sellacious_paymentmethods` (`id`, `title`, `description`, `handler`, `success_status`, `percent_fee`, `flat_fee`, `contexts`, `state`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `params`) VALUES
(1, 'Cheque', 'Pay by sending us a Cheque valid for 3 month at least. DD should be drawn in favor of Bhartiy Web Technologies payable at Aligarh, Uttar Pradesh.', 'custom', 0, '1.8000', '0.1500', '["cart","addfund"]', 1, 7, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(2, 'E-Wallet Payment System', 'Pay using your sellacious e-wallet', 'ewallet', 0, '0.0000', '0.0000', '["cart"]', 1, 13, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(3, 'Cash On Delivery', 'Pay in Cash when the item is delivered to you', 'cod', 0, '0.0000', '0.0000', '["cart"]', 1, 14, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, ''),
(4, 'PayPal', 'Pay by using your PayPal account', 'paypal', 1, '2.9000', '0.3000', '["cart","addfund"]', 1, 15, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"api_mode":"sandbox","apikey_sandbox":"","apisecret_sandbox":"","apikey":"","apisecret":"","http_timeout":"30","http_retry":"1","http_proxy":"","log_enabled":"1","log_level":"INFO"}');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_payments`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(30) NOT NULL,
  `order_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `handler` varchar(50) NOT NULL,
  `method_name` varchar(150) NOT NULL,
  `handler_name` varchar(150) NOT NULL COMMENT '@unused,future use',
  `data` text NOT NULL COMMENT 'The form data is optional here. Plugins must use from session only',
  `test_mode` int(11) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `flat_fee` double NOT NULL,
  `percent_fee` double NOT NULL,
  `order_amount` double NOT NULL,
  `fee_amount` double NOT NULL,
  `amount_payable` double NOT NULL,
  `response_code` varchar(50) NOT NULL,
  `response_state` varchar(50) NOT NULL,
  `response_message` varchar(250) NOT NULL,
  `response_data` text NOT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_physical_sellers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_physical_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `psx_id` int(11) NOT NULL,
  `listing_type` int(11) NOT NULL,
  `item_condition` int(11) NOT NULL,
  `flat_shipping` int(11) NOT NULL,
  `shipping_flat_fee` double NOT NULL,
  `length` varchar(50) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `vol_weight` varchar(50) NOT NULL,
  `shipping_country` int(11) NOT NULL,
  `shipping_state` int(11) NOT NULL,
  `shipping_district` int(11) NOT NULL,
  `shipping_city` int(11) NOT NULL,
  `shipping_zip` int(11) NOT NULL,
  `whats_in_box` text NOT NULL,
  `return_days` int(11) NOT NULL,
  `return_tnc` text NOT NULL,
  `exchange_days` int(11) NOT NULL,
  `exchange_tnc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_prices_cache`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_prices_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A unique id, coz we have multipricing',
  `price_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `qty_min` int(11) NOT NULL,
  `qty_max` int(11) NOT NULL,
  `cost_price` double NOT NULL,
  `margin` double NOT NULL,
  `margin_type` int(11) NOT NULL,
  `list_price` double NOT NULL,
  `calculated_price` double NOT NULL,
  `ovr_price` double NOT NULL,
  `is_fallback` int(11) NOT NULL,
  `sdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_price` double NOT NULL DEFAULT '0',
  `price_display` int(11) NOT NULL,
  `listing_type` int(11) NOT NULL,
  `item_condition` int(11) NOT NULL,
  `flat_shipping` int(11) NOT NULL,
  `shipping_flat_fee` double NOT NULL,
  `shipping_country` int(11) NOT NULL,
  `shipping_state` int(11) NOT NULL,
  `shipping_district` int(11) NOT NULL,
  `shipping_suburb` int(11) NOT NULL,
  `shipping_city` int(11) NOT NULL,
  `shipping_zip` int(11) NOT NULL,
  `whats_in_box` text NOT NULL,
  `return_days` int(11) NOT NULL,
  `return_tnc` text NOT NULL,
  `exchange_days` int(11) NOT NULL,
  `exchange_tnc` text NOT NULL,
  `seller_company` varchar(250) NOT NULL,
  `seller_code` varchar(50) NOT NULL,
  `seller_name` varchar(255) NOT NULL DEFAULT '',
  `seller_username` varchar(150) NOT NULL DEFAULT '',
  `seller_email` varchar(100) NOT NULL DEFAULT '',
  `seller_currency` varchar(10) NOT NULL,
  `seller_mobile` varchar(15) NOT NULL,
  `psx_id` int(11) NOT NULL,
  `pcx_id` int(11) DEFAULT NULL,
  `client_catid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_productprices_clientcategory_xref`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_productprices_clientcategory_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_price_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_products`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `alias` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `local_sku` varchar(50) NOT NULL,
  `manufacturer_sku` varchar(50) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `features` text NOT NULL,
  `introtext` text NOT NULL,
  `description` text NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `state` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  `owned_by` int(11) NOT NULL COMMENT 'who is managing this item, 0=shop,INT=seller_uid',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `tags` text NOT NULL,
  `params` text NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_products_cache`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_products_cache` (
  `id` int(11) NOT NULL DEFAULT '0',
  `variant_id` bigint(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `variant_title` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `local_sku` varchar(50) NOT NULL DEFAULT '',
  `variant_sku` varchar(50) NOT NULL DEFAULT '',
  `manufacturer_sku` varchar(50) NOT NULL DEFAULT '',
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `introtext` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `variant_description` mediumtext NOT NULL,
  `features` text NOT NULL,
  `variant_features` mediumtext NOT NULL,
  `variant_count` int(11) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `tags` text NOT NULL,
  `params` mediumtext NOT NULL,
  PRIMARY KEY (`id`,`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_product_categories`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_product_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  UNIQUE KEY `product_id` (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_product_physical`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_product_physical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `length` varchar(50) NOT NULL,
  `width` varchar(50) NOT NULL,
  `height` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `vol_weight` varchar(50) NOT NULL,
  `whats_in_box` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_product_prices`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `qty_min` int(11) NOT NULL,
  `qty_max` int(11) NOT NULL,
  `sdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `edate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cost_price` double NOT NULL,
  `margin` double NOT NULL,
  `margin_type` int(11) NOT NULL,
  `list_price` double NOT NULL,
  `calculated_price` double NOT NULL,
  `ovr_price` double NOT NULL,
  `product_price` double NOT NULL,
  `is_fallback` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_product_queries`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_product_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `query` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_product_sellers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_product_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `over_stock` int(11) NOT NULL,
  `stock_reserved` int(11) NOT NULL,
  `stock_sold` int(11) NOT NULL,
  `price_display` int(11) NOT NULL,
  `query_form` text NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_profiles`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `website` varchar(100) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `bankinfo` text NOT NULL,
  `taxinfo` text NOT NULL,
  `state` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_ratings`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `author_email` varchar(100) NOT NULL,
  `buyer` int(11) NOT NULL,
  `type` varchar(15) NOT NULL,
  `rating` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `comment` varchar(2000) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reported` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_relatedproducts`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_relatedproducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `group_title` varchar(100) NOT NULL,
  `group_alias` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`product_id`,`group_title`,`group_alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_sellers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `code` varchar(50) NOT NULL,
  `store_name` varchar(250) NOT NULL,
  `store_address` mediumtext NOT NULL,
  `currency` varchar(5) NOT NULL,
  `commission` varchar(100) NOT NULL,
  `store_location` varchar(100) NOT NULL,
  `ship_origin_address_line1` varchar(200) NOT NULL,
  `ship_origin_address_line2` varchar(200) NOT NULL,
  `ship_origin_address_line3` varchar(200) NOT NULL,
  `ship_origin_country` int(11) NOT NULL,
  `ship_origin_state` int(11) NOT NULL,
  `ship_origin_district` int(11) NOT NULL,
  `ship_origin_zip` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_seller_listing`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_seller_listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT '#special cat id',
  `recurrence` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `slots` int(11) NOT NULL,
  `slot_fee` double NOT NULL,
  `fee_total` double NOT NULL,
  `publish_up` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subscription_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `carried_from` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_seller_shippable`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_seller_shippable` (
  `seller_uid` int(11) NOT NULL DEFAULT '0',
  `gl_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `seller_gl_uid` (`seller_uid`,`gl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_shippingrules`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_shippingrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `method_name` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `amount_additional` double NOT NULL,
  `state` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  `params` text NOT NULL,
  `owned_by` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_shoprules`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_shoprules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `path` varchar(500) NOT NULL,
  `type` varchar(10) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `ledger_id` int(11) NOT NULL,
  `amount` varchar(20) NOT NULL,
  `sum_method` varchar(20) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL,
  `publish_up` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_sellacious_shoprules`
--

INSERT INTO `wjrcv_sellacious_shoprules` (`id`, `title`, `alias`, `parent_id`, `level`, `path`, `type`, `seller_uid`, `ledger_id`, `amount`, `sum_method`, `state`, `lft`, `rgt`, `publish_up`, `publish_down`, `created`, `created_by`, `modified`, `modified_by`, `params`) VALUES
(1, 'ROOT', 'root', 0, 0, '', '', 0, 0, '0', '', 1, 0, 29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_splcategories`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_splcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `recurrence` int(11) NOT NULL,
  `fee_amount` varchar(50) NOT NULL,
  `images` mediumtext NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `path` varchar(500) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL,
  `is_core` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  `access` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wjrcv_sellacious_splcategories`
--

INSERT INTO `wjrcv_sellacious_splcategories` (`id`, `title`, `alias`, `description`, `recurrence`, `fee_amount`, `images`, `parent_id`, `level`, `path`, `state`, `lft`, `rgt`, `is_core`, `created`, `created_by`, `modified`, `modified_by`, `params`, `access`) VALUES
(1, 'ROOT', 'root', '0', 0, '0', '', 0, 0, '', 1, 0, 9, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '', 0),
(2, 'Highlighted', 'highlighted', '<p>Will show the product in a highlighted background in the listing.</p>', 10, '3', '', 1, 1, 'highlighted', 1, 1, 4, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"border-width":"1px","border-style":"solid","border-color":"#ff1003","background-color":"#fffede"}', 5),
(3, 'Bordered', 'bordered', '<p>Will show the product in a bordered box in the listing page</p>', 7, '1', '', 1, 1, 'bordered', 1, 5, 6, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"border-width":"1px","border-style":"solid","border-color":"#030303","background-color":""}', 5),
(4, 'Featured', 'featured', '<p>Will show the product at the Top in the listing page</p>', 7, '5', '', 1, 1, 'featured', 1, 7, 8, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '{"border-width":"1px","border-style":"solid","border-color":"#6b6b6b","background-color":"#fcffcc"}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_staffs`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_states`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `code` varchar(20) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_statuses`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `context` varchar(100) NOT NULL,
  `stock` varchar(10) NOT NULL,
  `is_stable` tinyint(1) NOT NULL,
  `notes_required` int(11) NOT NULL,
  `allow_change_to` text NOT NULL,
  `alert` text NOT NULL,
  `usergroups` text NOT NULL,
  `color_code` varchar(20) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `is_core` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `wjrcv_sellacious_statuses`
--

INSERT INTO `wjrcv_sellacious_statuses` (`id`, `title`, `type`, `context`, `stock`, `is_stable`, `notes_required`, `allow_change_to`, `alert`, `usergroups`, `color_code`, `state`, `ordering`, `is_core`) VALUES
(1, 'Order Placed', 'order_placed', 'order', '', 1, 0, '["2","3","65"]', '', '["3"]', '', 1, 1, 1),
(2, 'Payment Pending Approval', 'paid', 'order', '', 1, 1, '["3","65"]', '', '["13"]', '', 1, 2, 1),
(3, 'Payment Approved', 'approved', 'order', '', 1, 1, '["5","67","68","69","70"]', '', '["13"]', '', 1, 3, 1),
(4, 'Cancelled', 'cancellation', 'order', '', 1, 1, '', '', '["12"]', '', 1, 4, 0),
(5, 'Completed', 'completed', 'order', '', 1, 1, '', '', '["12","17"]', '', 1, 5, 0),
(6, 'Payment Approved', 'approved', 'order.physical', 'R', 1, 0, '["7","8","9"]', '', '["12","19","17"]', '#8a0202', 1, 6, 1),
(7, 'Packaged', 'packaged', 'order.physical', '', 0, 0, '["8","9"]', 'This is irreversible process.', '["12","13"]', '', 1, 7, 0),
(8, 'Waiting for Pickup', 'waiting_pickup', 'order.physical', '', 0, 0, '["9"]', '', '["12","13"]', '', 1, 8, 0),
(9, 'Shipped', 'shipped', 'order.physical', 'O', 0, 0, '["10","11"]', '', '["12","13"]', '', 1, 9, 0),
(10, 'Undelivered', 'undelivered', 'order.physical', '', 0, 1, '[9]', '', '', '', 1, 10, 0),
(11, 'Delivered', 'delivered', 'order.physical', 'A', 1, 0, '["15","18"]', '', '["12","13"]', '', 1, 11, 0),
(12, 'Refund Placed', 'refund_placed', 'order.physical', '', 0, 0, '["13","14"]', '', '', '', 1, 12, 1),
(13, 'Refund Approved', 'refunded', 'order.physical', '', 1, 0, '', '', '', '', 1, 13, 0),
(14, 'Refund Declined', 'refund_cancelled', 'order.physical', '', 1, 0, '', '', '', '', 1, 14, 0),
(15, 'Return Placed', 'return_placed', 'order.physical', '', 0, 0, '["16","17"]', '', '["6"]', '', 1, 15, 1),
(16, 'Return Approved', 'returned', 'order.physical', '', 1, 0, '', '', '', '', 1, 16, 0),
(17, 'Return Declined', 'return_cancelled', 'order.physical', '', 1, 1, '', 'This is not reversible', '', '', 1, 17, 0),
(18, 'Exchange Placed', 'exchange_placed', 'order.physical', '', 0, 0, '["19","20"]', '', '', '', 1, 18, 1),
(19, 'Exchange Approved', 'exchanged', 'order.physical', '', 1, 0, '', 'This is not reversible', '', '', 1, 19, 0),
(20, 'Exchange Declined', 'exchange_cancelled', 'order.physical', '', 1, 0, '', '', '', '', 1, 20, 0),
(38, 'Order Placed', 'order_placed', 'order.physical', '', 1, 0, '["6","39","63"]', '', '["12","13"]', '', 1, 23, 1),
(39, 'Payment Pending Approval', 'paid', 'order.physical', '', 1, 1, '["6","63"]', '', '["12","13"]', '', 1, 24, 1),
(41, 'Order Placed', 'order_placed', 'order.electronic', '', 1, 0, '["42","43","64"]', '', '', '', 1, 28, 1),
(42, 'Payment Pending Approval', 'paid', 'order.electronic', '', 1, 1, '["43","64"]', '', '', '', 1, 27, 1),
(43, 'Payment Approved', 'approved', 'order.electronic', 'R', 1, 0, '["44"]', '', '', '#8a0202', 1, 26, 1),
(44, 'Delivered', 'delivered', 'order.electronic', 'O', 0, 0, '', '', '', '', 1, 29, 1),
(45, 'Payment Approved', 'approved', 'order.package', 'R', 1, 0, '["46","47","48"]', '', '["12","19","17"]', '#8a0202', 1, 6, 1),
(46, 'Packaged', 'packaged', 'order.package', '', 0, 0, '["47","48"]', 'This is irretrievable process.', '["12","13"]', '', 1, 7, 0),
(47, 'Waiting for Pickup', 'waiting_pickup', 'order.package', '', 0, 0, '["48"]', '', '["12","13"]', '', 1, 8, 0),
(48, 'Shipped', 'shipped', 'order.package', 'O', 0, 0, '["49","50"]', '', '["12","13"]', '', 1, 9, 0),
(49, 'Undelivered', 'undelivered', 'order.package', '', 0, 1, '["48"]', '', '', '', 1, 10, 0),
(50, 'Delivered', 'delivered', 'order.package', 'O', 1, 0, '["54","57"]', '', '["12","13"]', '', 1, 11, 0),
(51, 'Refund Placed', 'refund_placed', 'order.package', '', 0, 0, '["52","55"]', '', '', '', 1, 12, 1),
(52, 'Refund Approved', 'refunded', 'order.package', '', 1, 0, '', '', '', '', 1, 13, 0),
(53, 'Refund Declined', 'refund_cancelled', 'order.package', '', 1, 0, '', '', '', '', 1, 14, 0),
(54, 'Return Placed', 'return_placed', 'order.package', '', 0, 0, '["55","56"]', '', '', '', 1, 15, 1),
(55, 'Return Approved', 'returned', 'order.package', '', 1, 0, '', '', '', '', 1, 16, 0),
(56, 'Return Declined', 'return_cancelled', 'order.package', '', 1, 1, '', 'This is not reversible', '', '', 1, 17, 0),
(57, 'Exchange Placed', 'exchange_placed', 'order.package', '', 0, 0, '["58","59"]', '', '', '', 1, 18, 1),
(58, 'Exchange Approved', 'exchanged', 'order.package', '', 1, 0, '', 'This is not reversible', '', '', 1, 19, 0),
(59, 'Exchange Declined', 'exchange_cancelled', 'order.package', '', 1, 0, '', '', '', '', 1, 20, 0),
(60, 'Order Placed', 'order_placed', 'order.package', '', 1, 0, '["61","62"]', '', '["12","13"]', '', 1, 23, 1),
(61, 'Payment Pending Approval', 'paid', 'order.package', '', 1, 1, '["45","66"]', '', '["12","13"]', '', 1, 24, 1),
(63, 'Payment Failed', 'payment_failed', 'order.physical', '', 1, 0, '', '', '', '', 1, 30, 0),
(64, 'Payment Failed', 'payment_failed', 'order.electronic', '', 1, 0, '', '', '', '', 1, 31, 0),
(65, 'Payment Failed', 'payment_failed', 'order', '', 1, 0, '', '', '', '', 1, 32, 0),
(66, 'Payment Failed', 'payment_failed', 'order.package', '', 1, 0, '', '', '', '', 1, 33, 0),
(67, 'Delivered', 'delivered', 'order', '', 0, 0, '["71","73"]', '', '', '', 1, 34, 0),
(68, 'Shipped', 'shipped', 'order', '', 0, 0, '["67"]', '', '', '', 1, 35, 0),
(69, 'Packaged', 'packaged', 'order', '', 0, 0, '["70"]', '', '', '', 1, 36, 0),
(70, 'Waiting for pick up', 'waiting_pickup', 'order', '', 0, 0, '["68"]', '', '', '', 1, 37, 0),
(71, 'Return placed ', 'return_placed', 'order', '', 0, 0, '["74","75"]', '', '', '', 1, 38, 0),
(72, 'Delivered', 'delivered', 'order.electronic', 'O', 0, 0, '', '', '', '', 1, 39, 0),
(73, 'Exchange Placed', 'exchange_placed', 'order', '', 0, 0, '["77","78"]', '', '', '', 1, 40, 0),
(74, 'Return Approved ', 'returned', 'order', '', 0, 0, '["76"]', '', '', '', 1, 41, 0),
(75, 'Return Decline', 'return_cancelled', 'order', '', 0, 0, '', '', '', '', 1, 42, 0),
(76, 'Returned', 'returned', 'order', '', 0, 0, '', '', '', '', 1, 43, 0),
(77, 'Exchange Approved', 'exchanged', 'order', '', 0, 1, '', '', '', '', 1, 44, 0),
(78, 'Exchange Declined', 'exchange_cancelled', 'order', '', 0, 1, '', '', '', '', 1, 45, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_transactions`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `context` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `context_id` int(11) NOT NULL,
  `reason` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crdr` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double NOT NULL,
  `txn_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `payment_method_id` int(11) NOT NULL,
  `payment_params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_by` int(11) NOT NULL,
  `approval_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` int(11) NOT NULL COMMENT 'approved=1/disapproved=-1/pending=0/locked=2/cancelled=-2',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_unitconversions`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_unitconversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `rate` double NOT NULL,
  `state` mediumint(9) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `wjrcv_sellacious_unitconversions`
--

INSERT INTO `wjrcv_sellacious_unitconversions` (`id`, `from`, `to`, `rate`, `state`, `ordering`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 2, 11, 1.09361, 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, 1, 11, 0.0109361, 1, 2, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(3, 3, 2, 1000, 1, 3, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(4, 5, 19, 35.274, 1, 4, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(5, 7, 14, 0.000001, 1, 5, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(6, 6, 14, 0.001, 1, 6, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(7, 8, 11, 0.0277778, 1, 7, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(8, 9, 11, 0.00109361, 1, 8, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(9, 10, 11, 0.333333, 1, 9, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(10, 11, 10, 3, 1, 10, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(11, 10, 9, 304.8, 1, 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(12, 11, 9, 914.4, 1, 12, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(13, 10, 8, 12, 1, 13, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(14, 9, 10, 0.00328084, 1, 14, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(15, 8, 10, 0.08333, 1, 15, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(16, 9, 8, 0.00005, 1, 16, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(17, 10, 2, 0, 1, 17, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(18, 11, 8, 36, 1, 18, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(19, 12, 14, 0.00378541, 1, 19, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(20, 13, 14, 0.000029574, 1, 20, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(21, 14, 13, 33813.5, 1, 21, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(22, 12, 13, 127.99803, 1, 22, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(23, 13, 7, 29.574, 1, 23, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(24, 14, 12, 264.17218, 1, 24, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(25, 15, 5, 0, 1, 25, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(26, 16, 19, 0.000035274, 1, 26, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(27, 17, 19, 0.035274, 1, 27, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(28, 18, 19, 32000, 1, 28, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(29, 19, 18, 0.00003125, 1, 29, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(30, 4, 19, 16, 1, 30, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(31, 18, 17, 907185, 1, 31, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(32, 16, 5, 0.000001, 1, 32, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(33, 17, 15, 0.001, 1, 33, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(34, 18, 15, 907.185, 1, 34, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(35, 19, 17, 28.34949, 1, 35, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(36, 1, 10, 0.03281, 1, 36, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(37, 2, 10, 0, 1, 37, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(38, 1, 9, 10, 1, 38, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(39, 8, 9, 18655, 1, 39, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(40, 8, 2, 0, 1, 40, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(41, 20, 1, 0, 1, 41, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(42, 20, 2, 0, 1, 42, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(43, 20, 8, 0, 1, 43, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(44, 20, 9, 0, 1, 44, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(45, 20, 10, 0, 1, 45, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(46, 20, 11, 0, 1, 46, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(47, 1, 2, 0, 1, 47, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(48, 1, 8, 0, 1, 48, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(49, 1, 20, 0, 1, 49, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_units`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `unit_group` varchar(100) NOT NULL,
  `decimal_places` smallint(6) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `wjrcv_sellacious_units`
--

INSERT INTO `wjrcv_sellacious_units` (`id`, `title`, `alias`, `symbol`, `unit_group`, `decimal_places`, `state`, `ordering`, `created`, `created_by`, `modified`, `modified_by`) VALUES
(1, 'Centimeter', 'centimeter', 'cm', 'Length', 2, 1, 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(2, 'Meter', 'meter', 'm', 'Length', 2, 1, 2, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(4, 'Pound', 'lb', 'lb', 'Weight', 3, 1, 4, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(5, 'KiloGram', 'kilogram', 'Kg', 'Weight', 3, 1, 5, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(6, 'Litre', 'litre', 'ltr', 'Volume', 2, 1, 6, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(7, 'Mili-Litre', 'mili-litre', 'ml', 'Volume', 3, 1, 7, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(8, 'Inch', 'inch', 'in', 'Length', 2, 1, 8, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(9, 'Milimeter', 'milimeter', 'mm', 'Length', 2, 1, 9, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(10, 'Foot', 'foot', 'ft', 'Length', 2, 1, 10, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(11, 'Yard', 'yard', 'yd', 'Length', 2, 1, 11, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(12, 'US Gallon', 'gallon', 'gal', 'Volume', 2, 1, 12, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(13, 'US fluid ounce', 'us-fluid-ounce', 'fl oz', 'Volume', 2, 1, 13, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(14, 'Cubic meter', 'cubic-meter', 'cm', 'Volume', 2, 1, 14, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(16, 'Miligram', 'miligram', 'mg', 'Weight', 2, 1, 16, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(17, 'Gram', 'gram', 'g', 'Weight', 2, 1, 17, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(18, 'US Ton', 'us-ton', 'ton', 'Weight', 2, 1, 18, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0),
(19, 'Ounce', 'ounce', 'oz', 'Weight', 2, 1, 19, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_utm`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_utm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `platform` varchar(100) NOT NULL,
  `browser` varchar(100) NOT NULL,
  `browser_version` varchar(20) NOT NULL,
  `is_mobile` tinyint(1) NOT NULL,
  `is_robot` tinyint(1) NOT NULL,
  `ip_address` varchar(60) NOT NULL,
  `session_start` varchar(15) NOT NULL,
  `session_hit` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_utm_links`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_utm_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utm_id` int(11) NOT NULL,
  `page_url` varchar(500) NOT NULL,
  `hits` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_variants`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `local_sku` varchar(50) NOT NULL,
  `features` text NOT NULL,
  `description` text NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `owned_by` int(11) NOT NULL COMMENT 'who is managing this item, 0=shop,INT=seller_uid',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL,
  `params` text NOT NULL,
  `cache_state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='All available field types' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_variant_sellers`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_variant_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `price_mod` double NOT NULL,
  `price_mod_perc` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `over_stock` int(11) NOT NULL,
  `stock_reserved` int(11) NOT NULL,
  `stock_sold` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_wishlist`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `seller_uid` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_sellacious_zipcodes`
--

CREATE TABLE IF NOT EXISTS `wjrcv_sellacious_zipcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zipcode` varchar(20) NOT NULL,
  `city_id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_session`
--

CREATE TABLE IF NOT EXISTS `wjrcv_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wjrcv_session`
--

INSERT INTO `wjrcv_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('7ablf8qe2rvel5fb8heklpgcj1', 0, 0, '1490158778', 'joomla|s:928:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo4O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ5MDE1ODY3MjtzOjQ6Imxhc3QiO2k6MTQ5MDE1ODc3NTtzOjM6Im5vdyI7aToxNDkwMTU4Nzc3O31zOjU6InRva2VuIjtzOjMyOiJvcjhhaHo3a0licVFXSklvVGg5VklhN3FmaFhWSG5qNSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InVzZXJzIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6ImxvZ2luIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImZvcm0iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YTowOnt9czo2OiJyZXR1cm4iO3M6MjQ6Imh0dHA6Ly9sb2NhbGhvc3Qvam9vbWxhLyI7fX19fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjE7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7Tzo1OiJKVXNlciI6MTp7czoyOiJpZCI7czozOiIyMzUiO319fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==";', 235, 'root'),
('ono0vil2ag3pf18hd0571l7tk5', 1, 0, '1490158756', 'joomla|s:1848:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo2NDtzOjU6InRva2VuIjtzOjMyOiJSVUlwckdtUXZnUjZhWDh4MmZLT2hhRWhpdHJzcVVOYSI7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNDkwMTU3ODA0O3M6NDoibGFzdCI7aToxNDkwMTU4NzU1O3M6Mzoibm93IjtpOjE0OTAxNTg3NTY7fX1zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjM6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6NDp7czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9czo5OiJjb21fbWVudXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJtZW51IjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO047fXM6NDoiaXRlbSI7Tzo4OiJzdGRDbGFzcyI6NDp7czo0OiJ0eXBlIjtOO3M6NDoibGluayI7TjtzOjQ6ImRhdGEiO047czoyOiJpZCI7YTowOnt9fX1zOjU6Iml0ZW1zIjtPOjg6InN0ZENsYXNzIjozOntzOjg6Im1lbnV0eXBlIjtzOjg6Im1haW5tZW51IjtzOjEwOiJsaW1pdHN0YXJ0IjtpOjA7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7czoyOiIyMCI7czo4OiJvcmRlcmluZyI7czo1OiJhLmxmdCI7czo1OiJzdGFydCI7ZDowO319fXM6NDoiaXRlbSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJmaWx0ZXIiO086ODoic3RkQ2xhc3MiOjE6e3M6ODoibWVudXR5cGUiO3M6ODoibWFpbm1lbnUiO319czoxMToiY29tX21vZHVsZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJtb2R1bGUiO086ODoic3RkQ2xhc3MiOjI6e3M6MjoiaWQiO2E6MDp7fXM6NDoiZGF0YSI7Tjt9fXM6MzoiYWRkIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Im1vZHVsZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoxMjoiZXh0ZW5zaW9uX2lkIjtOO3M6NjoicGFyYW1zIjtOO319fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjoxO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO3M6MzoiMjM1Ijt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO047fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 235, 'root');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_tags`
--

CREATE TABLE IF NOT EXISTS `wjrcv_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_tags`
--

INSERT INTO `wjrcv_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 235, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_template_styles`
--

CREATE TABLE IF NOT EXISTS `wjrcv_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `wjrcv_template_styles`
--

INSERT INTO `wjrcv_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '1', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'jpeople', 0, '0', 'jPeople - Default', '{"logotype":"image","sitetitle":"Site Name","slogandisable":"1","slogan":"Custom slogan","footerdisable":"1","socialdisable":"1","facebook":"http:\\/\\/www.facebook.com\\/YOURFANPAGE","twitter":"http:\\/\\/www.twitter.com\\/YOURFANPAGE","gplus":"https:\\/\\/plus.google.com\\/YOURPAGE","mail":"mailto:you@example.com?Subject=Hello","footertext":"Custom text here","analyticsdisable":"1","googleanalytics":"UA-1111111-22","jscroll":"1","slidehome":"1","NumberOfSlides":"4","slidedesc1":"Description slide 1","slidedesc2":"Description slide 2","slidedesc3":"Description slide 3","slidedesc4":"Description slide 4","slidedesc5":"Description slide 5","slidedesc6":"Description slide 6","slidedesc7":"Description slide 7","slidedesc8":"Description slide 8"}');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_ucm_base`
--

CREATE TABLE IF NOT EXISTS `wjrcv_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_ucm_content`
--

CREATE TABLE IF NOT EXISTS `wjrcv_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_ucm_history`
--

CREATE TABLE IF NOT EXISTS `wjrcv_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_updates`
--

CREATE TABLE IF NOT EXISTS `wjrcv_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wjrcv_updates`
--

INSERT INTO `wjrcv_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 5, 807, 'Sellacious Package', 'Sellacious Basic Package which includes frontend modules and component.', 'pkg_sellacious', 'package', '', 0, '1.4.5', '', 'http://sellacious.com/release/pkg_sellacious_v1.4.xml', 'http://sellacious.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_update_sites`
--

CREATE TABLE IF NOT EXISTS `wjrcv_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `wjrcv_update_sites`
--

INSERT INTO `wjrcv_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1490158604, ''),
(2, 'Joomla! Extension Directory', 'collection', 'https://update.joomla.org/jed/list.xml', 1, 1490158604, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 0, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 0, ''),
(5, 'Sellacious Package Updates', 'extension', 'http://sellacious.com/release/pkg_sellacious_v1.4.xml', 1, 1490158606, ''),
(6, 'Ecwid Update Server', 'extension', 'http://plugins.ecwid.com/update-joomla.xml', 1, 1490158607, '');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `wjrcv_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Dumping data for table `wjrcv_update_sites_extensions`
--

INSERT INTO `wjrcv_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 802),
(4, 28),
(5, 807),
(6, 816);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_usergroups`
--

CREATE TABLE IF NOT EXISTS `wjrcv_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `wjrcv_usergroups`
--

INSERT INTO `wjrcv_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_users`
--

CREATE TABLE IF NOT EXISTS `wjrcv_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=236 ;

--
-- Dumping data for table `wjrcv_users`
--

INSERT INTO `wjrcv_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(235, 'Super User', 'root', 'nitesh.parashar55@gmail.com', '$2y$10$zw3bKLE2DA8NGqH5v3nt0uUiUOF4bzQDFazSBadh8f7rkNIi327bm', 0, 1, '2016-11-27 21:55:18', '2017-03-22 04:57:58', '0', '', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_user_keys`
--

CREATE TABLE IF NOT EXISTS `wjrcv_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_user_notes`
--

CREATE TABLE IF NOT EXISTS `wjrcv_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_user_profiles`
--

CREATE TABLE IF NOT EXISTS `wjrcv_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `wjrcv_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wjrcv_user_usergroup_map`
--

INSERT INTO `wjrcv_user_usergroup_map` (`user_id`, `group_id`) VALUES
(235, 8);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_utf8_conversion`
--

CREATE TABLE IF NOT EXISTS `wjrcv_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wjrcv_utf8_conversion`
--

INSERT INTO `wjrcv_utf8_conversion` (`converted`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `wjrcv_viewlevels`
--

CREATE TABLE IF NOT EXISTS `wjrcv_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `wjrcv_viewlevels`
--

INSERT INTO `wjrcv_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
