-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2017 at 04:52 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `saxovat`
--

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE `audio` (
  `id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '0',
  `album_id` int(11) NOT NULL DEFAULT '0',
  `singer_id` int(11) NOT NULL DEFAULT '0',
  `genre_id` int(11) NOT NULL DEFAULT '0',
  `music_url` varchar(250) NOT NULL DEFAULT '0',
  `listen` int(11) NOT NULL DEFAULT '0',
  `listened` int(11) NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL,
  `published` int(11) NOT NULL,
  `tags` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`id`, `user_id`, `name`, `album_id`, `singer_id`, `genre_id`, `music_url`, `listen`, `listened`, `pubdate`, `published`, `tags`) VALUES
(13, 1, 'Qaro-Qaro', 3, 1, 16, '/uploads/media/mp3/75a1e0a4b296dc717f026517f728a213.mp3', 0, 0, '2016-03-05 01:14:29', 1, 'Qaro,Qaro'),
(14, 1, 'Gul yuz', 2, 2, 7, '/uploads/media/mp3/cb76541c187a5030eec4fab6eafd2ac1.mp3', 0, 0, '2016-03-05 01:15:22', 1, ''),
(20, 1, 'Zilola', 4, 3, 11, '/uploads/media/mp3/b353002bb4e5c7882b12e15736f8f04a.mp3', 0, 0, '2016-03-05 02:39:06', 1, 'Zilola');

-- --------------------------------------------------------

--
-- Table structure for table `audio_album`
--

CREATE TABLE `audio_album` (
  `id` int(11) NOT NULL,
  `album_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audio_album`
--

INSERT INTO `audio_album` (`id`, `album_name`, `description`, `photo`, `user_id`, `pubdate`) VALUES
(1, 'Без Альбома', '', '', 1, '2016-03-05 00:26:19'),
(2, 'Gul yuz', '', '', 1, '2016-03-05 00:51:25'),
(3, 'Qaro-Qaro', '', '', 1, '2016-03-05 01:07:15'),
(4, 'Zilola', '', '', 1, '2016-03-05 01:18:38');

-- --------------------------------------------------------

--
-- Table structure for table `audio_genre`
--

CREATE TABLE `audio_genre` (
  `id` int(11) NOT NULL,
  `genre_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audio_genre`
--

INSERT INTO `audio_genre` (`id`, `genre_name`) VALUES
(2, 'Поп-Музыка'),
(3, 'Шансон'),
(4, 'Рок'),
(5, 'Электро'),
(6, 'Реп/Р&Б/Хип-Хоп'),
(7, 'Hardcore'),
(8, 'Хард-рок & Металл'),
(9, 'Техно'),
(10, 'Классическая'),
(11, 'Джаз и Блюз'),
(12, 'Элетро Хаус, Хаус'),
(13, 'Инструментальная'),
(14, 'Танцевальная/Клубная'),
(15, 'Саундтреки'),
(16, 'Другое');

-- --------------------------------------------------------

--
-- Table structure for table `audio_pl`
--

CREATE TABLE `audio_pl` (
  `id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `audio_pl_list`
--

CREATE TABLE `audio_pl_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pl_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `audio_singer`
--

CREATE TABLE `audio_singer` (
  `id` int(11) NOT NULL,
  `singer_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audio_singer`
--

INSERT INTO `audio_singer` (`id`, `singer_name`, `description`, `photo`, `user_id`, `pubdate`) VALUES
(1, 'Sherzodbek', '', '', 1, '2016-03-05 00:26:19'),
(2, 'Akmal Nazar', '', '', 1, '2016-03-05 00:51:25'),
(3, 'Alijon Isoqov', '', '', 1, '2016-03-05 01:16:14'),
(4, 'Abduvali Rajabov', '', '', 1, '2016-03-05 01:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_cats`
--

CREATE TABLE `blogs_cats` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `blog_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` varchar(128) NOT NULL,
  `active` smallint(1) NOT NULL DEFAULT '1',
  `alias` varchar(20) NOT NULL,
  `lang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blogs_photos`
--

CREATE TABLE `blogs_photos` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET cp1251 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `blog_cats_id` int(11) NOT NULL DEFAULT '1',
  `createdate` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `fulltext` text,
  `meta_keywords` text,
  `seo` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `active` smallint(1) NOT NULL DEFAULT '1',
  `show_in_anons` int(11) NOT NULL,
  `jscode` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(50) DEFAULT '*'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT '0',
  `cname` varchar(50) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `slug` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `tpl` varchar(50) DEFAULT NULL,
  `photoalbum` text,
  `cdescription` varchar(250) DEFAULT NULL,
  `orderby` enum('pubdate','title','ordering','hits') DEFAULT NULL,
  `orderto` enum('ASC','DESC') DEFAULT NULL,
  `maxcols` int(11) DEFAULT '1',
  `lang` varchar(50) DEFAULT '*',
  `mgroup_id` int(11) DEFAULT NULL,
  `config` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `cname`, `active`, `slug`, `url`, `tpl`, `photoalbum`, `cdescription`, `orderby`, `orderto`, `maxcols`, `lang`, `mgroup_id`, `config`) VALUES
(1, 0, '--Корневой раздел--', 1, '--kornevoi-razdel--', NULL, NULL, NULL, NULL, 'pubdate', 'ASC', 1, 'uz', -1, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(128, 1, 'Биз хақимизда', 1, 'biz_haimizda', 'biz_haimizda', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(129, 128, 'Жамият рахбарият', 1, 'biz_haimizda/zhamiyat_rahbariyat', 'zhamiyat_rahbariyat', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(130, 128, 'Жамият низоми', 1, 'biz_haimizda/zhamiyat_nizomi', 'zhamiyat_nizomi', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(131, 128, 'Акт бўйича масъул шахс', 1, 'biz_haimizda/akt_buyicha_masul_shahs', 'akt_buyicha_masul_shahs', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(132, 128, 'Жамият хақида', 1, 'biz_haimizda/zhamiyat_haida', 'zhamiyat_haida', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(133, 1, 'Янгиликлар', 1, 'yangiliklar', 'yangiliklar', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}'),
(134, 1, 'Махсулотлар', 1, 'mahsulotlar', 'mahsulotlar', 'com_content_view.php', NULL, '', 'pubdate', 'ASC', 1, 'uz', 0, 'a:5:{s:8:\"showdesc\";i:1;s:8:\"showdate\";i:1;s:8:\"showcomm\";i:1;s:8:\"showtags\";i:1;s:7:\"showrss\";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `categories_bind`
--

CREATE TABLE `categories_bind` (
  `category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories_bind`
--

INSERT INTO `categories_bind` (`category_id`, `item_id`) VALUES
(51, 6),
(53, 7),
(57, 8),
(61, 9),
(70, 10),
(70, 11),
(85, 6),
(88, 7),
(88, 8),
(88, 9),
(88, 10),
(88, 11),
(83, 13),
(88, 12),
(86, 15),
(86, 14),
(85, 18),
(85, 19),
(85, 20),
(85, 21),
(85, 22),
(85, 23),
(85, 24),
(85, 25),
(85, 26),
(85, 27),
(85, 28),
(85, 29),
(85, 30),
(85, 31),
(85, 32),
(85, 33),
(85, 34),
(85, 35),
(85, 36),
(91, 37),
(91, 38),
(91, 40),
(91, 39),
(91, 41),
(91, 42),
(91, 43),
(91, 44),
(91, 45),
(91, 46),
(91, 47),
(91, 48),
(91, 49),
(91, 50),
(91, 51),
(91, 52),
(91, 53),
(91, 54),
(91, 55),
(92, 56),
(92, 57),
(92, 58),
(92, 59),
(84, 60),
(84, 64),
(84, 63),
(86, 62),
(86, 61),
(86, 17),
(87, 65),
(89, 16),
(87, 66),
(91, 66),
(95, 68),
(96, 69),
(97, 70),
(98, 71),
(121, 84),
(117, 80),
(119, 82),
(118, 81),
(103, 73),
(99, 72),
(94, 67),
(109, 76),
(108, 75),
(107, 74),
(120, 83),
(126, 85),
(106, 86),
(97, 87),
(97, 88),
(117, 89),
(111, 77),
(113, 79),
(112, 78),
(111, 91),
(111, 92),
(133, 2),
(133, 1),
(133, 3),
(133, 5),
(132, 4);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `target` int(10) NOT NULL DEFAULT '0',
  `target_id` int(10) DEFAULT '0',
  `user_id` int(10) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `content` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `alt_class` varchar(100) NOT NULL,
  `show_title` tinyint(1) NOT NULL,
  `link` text NOT NULL,
  `hasconfig` tinyint(1) NOT NULL,
  `config` text NOT NULL,
  `sytem` tinyint(1) NOT NULL,
  `jscode` text NOT NULL,
  `ver` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `title`, `description`, `alt_class`, `show_title`, `link`, `hasconfig`, `config`, `sytem`, `jscode`, `ver`, `active`) VALUES
(2, 'Каталог статей', 'Каталог статей', '', 1, 'content', 1, 'a:8:{s:9:\"showtitle\";s:1:\"1\";s:8:\"showdesc\";s:1:\"1\";s:8:\"autokeys\";s:1:\"1\";s:7:\"pt_show\";s:1:\"1\";s:9:\"published\";s:1:\"1\";s:7:\"pt_disp\";s:1:\"1\";s:7:\"pt_hide\";s:1:\"1\";s:14:\"pt_morecontent\";s:1:\"1\";}', 1, '', '1.00', 1),
(3, 'Регистрация', 'Регистрация', '', 1, 'registration', 1, 'a:17:{s:8:\"reg_type\";s:4:\"open\";s:9:\"inv_count\";s:1:\"5\";s:9:\"inv_karma\";s:2:\"50\";s:10:\"inv_period\";s:4:\"WEEK\";s:11:\"default_gid\";s:1:\"4\";s:5:\"is_on\";s:1:\"1\";s:3:\"act\";s:1:\"0\";s:4:\"send\";N;s:6:\"offmsg\";s:80:\"Сайтда рўйхатдан ўтиш вактинча тухтатилган\";s:19:\"first_auth_redirect\";s:7:\"profile\";s:13:\"auth_redirect\";s:7:\"profile\";s:9:\"name_mode\";s:8:\"nickname\";s:11:\"badnickname\";s:200:\"��������������������������\r\n����������\r\nqwert\r\nqwerty\r\n123\r\nadmin\r\n�������� ������������\";s:7:\"ask_icq\";s:1:\"1\";s:13:\"ask_birthdate\";s:1:\"1\";s:13:\"send_greetmsg\";s:1:\"0\";s:8:\"greetmsg\";s:0:\"\";}', 1, '', '1.00', 1),
(5, 'Фотогалерея', 'Фотогалерея', '', 1, 'photos', 1, 'a:7:{s:7:\"maxcols\";s:1:\"4\";s:7:\"showlat\";s:1:\"1\";s:9:\"watermark\";s:1:\"0\";s:8:\"showdate\";s:1:\"1\";s:7:\"preview\";N;s:4:\"link\";s:1:\"1\";s:9:\"view_type\";s:4:\"list\";}', 1, '', '1.00', 1),
(6, 'Поиск', 'Поиск', '', 1, 'search', 1, 'a:2:{s:7:\"perpage\";s:2:\"15\";s:4:\"comp\";a:8:{i:0;s:7:\"content\";i:1;s:12:\"registration\";i:2;s:6:\"photos\";i:3;s:6:\"search\";i:4;s:5:\"media\";i:5;s:8:\"contacts\";i:6;s:8:\"fcatalog\";i:7;s:5:\"polls\";}}', 1, '', '1.00', 1),
(7, 'Медиагалерея', 'Медиагалерея', '', 1, 'media', 0, 'a:6:{s:7:\"pweight\";s:3:\"470\";s:6:\"waudio\";s:3:\"400\";s:6:\"phight\";s:3:\"320\";s:7:\"minimgw\";s:3:\"100\";s:8:\"aperpage\";s:2:\"10\";s:8:\"vperpage\";s:2:\"10\";}', 0, '', '1.00', 0),
(8, 'Контакт', 'Контакт', '', 1, 'contacts', 1, '', 1, '', '1.00', 1),
(9, 'Каталог файлов', 'Каталог файлов', '', 0, 'fcatalog', 1, 'a:7:{s:7:\"perpage\";i:10;s:6:\"premod\";i:1;s:7:\"maxsize\";i:25;s:7:\"maxcols\";i:3;s:9:\"filestype\";s:32:\"jpeg,gif,png,jpg,bmp,zip,rar,tar\";s:5:\"dtype\";s:1:\"p\";s:6:\"rcount\";i:0;}', 0, '', '1.00', 1),
(11, 'Опрос', 'Опрос', '', 0, 'polls', 1, '', 1, '', '1.00', 0),
(12, 'Обратная связь', 'Обратная связь', '', 1, 'feedback', 1, 'a:2:{s:7:\"myemail\";s:11:\"info@qbk.uz\";s:11:\"allowattach\";s:1:\"1\";}', 1, '', '1.00', 1),
(13, 'Календарь собития', 'Календарь собития', '', 1, 'calendar', 1, '', 1, '', '1.00', 0),
(14, 'СуперСлайдер', 'Конструктор слайдеров', '', 1, 'superslider', 0, '', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `featured` tinyint(3) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `introtext` text NOT NULL,
  `fulltext` text,
  `created_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `is_end` tinyint(4) NOT NULL,
  `is_archive` tinyint(4) NOT NULL,
  `images` text,
  `attribs` text NOT NULL,
  `active` smallint(1) NOT NULL DEFAULT '1',
  `pagetitle` varchar(255) NOT NULL DEFAULT '1',
  `tpl` varchar(255) NOT NULL DEFAULT '1',
  `meta_keywords` text NOT NULL,
  `meta_desc` text NOT NULL,
  `seo` varchar(150) NOT NULL,
  `url` varchar(150) NOT NULL,
  `jscode` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `category_id`, `featured`, `user_id`, `title`, `introtext`, `fulltext`, `created_at`, `end_at`, `update_at`, `is_end`, `is_archive`, `images`, `attribs`, `active`, `pagetitle`, `tpl`, `meta_keywords`, `meta_desc`, `seo`, `url`, `jscode`, `hits`, `lang`) VALUES
(1, 1, 1, 1, 'Қишлоқ хўжалиги ходимлари куни муносабати билан соҳа ривожига муносиб ҳисса қўшган юртдошларимиздан бир гуруҳини мукофотлаш тўғрисида', '<p style=\"text-align:justify\">Мамлакатимиз қишлоқ хўжалиги соҳасини ривожлантириш, тармоқни комплекс модернизация қилиш ва ишлаб чиқариш самарадорлигини ошириш, фермерлик ҳаракатини янги босқичга кўтариш, замонавий инновацион ишланмалар ва илғор хорижий тажрибаларни амалиётга жорий этиш каби долзарб масалалар ечимига қаратилган ислоҳотлар ўзининг ижобий натижаларини бермоқда. </p>', '<div style=\"text-align: justify;\"><strong>Ўзбекистон Республикаси Президентининг фармони</strong></div><div><p style=\"text-align:justify\"><br />Мамлакатимиз қишлоқ хўжалиги соҳасини ривожлантириш, тармоқни комплекс модернизация қилиш ва ишлаб чиқариш самарадорлигини ошириш, фермерлик ҳаракатини янги босқичга кўтариш, замонавий инновацион ишланмалар ва илғор хорижий тажрибаларни амалиётга жорий этиш каби долзарб масалалар ечимига қаратилган ислоҳотлар ўзининг ижобий натижаларини бермоқда. <br /><br />Ўз навбатида, бугунги кунда аграр соҳада эркин бозор муносабатларини жорий этиш, таълим, фан ва қишлоқ хўжалиги ишлаб чиқаришини интеграциялаш, ер ва сув ресурсларидан оқилона фойдаланиш, тизимни юқори малакали кадрлар билан таъминлаш борасида кенг кўламли ишлар амалга оширилмоқда. <br /><br />Қишлоқ хўжалиги соҳасидаги кўп йиллик фидокорона меҳнати, барча қишлоқ хўжалиги экинларидан мўл ҳосил етиштириб, халқимизнинг ризқ-рўзи ва фаровонлигини, юртимизнинг иқтисодий қудратини ва экспорт салоҳиятини юксалтириш, озиқ-овқат хавфсизлигини таъминлаш ишларига қўшган салмоқли ҳиссаси, аграр секторда ислоҳотларни муваффақиятли амалга ошириш ва давлат дастурлари ижросини таъминлаш, ерларнинг мелиоратив ҳолатини яхшилаш, илғор агротехнологияларни амалиётга жорий этиш борасидаги катта хизматлари ҳамда ижтимоий ҳаётдаги фаол иштироки учун қуйидагилар фахрий унвон, орден ва медаллар билан мукофотлансин: </p><div style=\"text-align: justify;\"> </div><div style=\"text-align: justify;\"><strong>«Ўзбекистон Республикасида хизмат кўрсатган пахтакор»</strong></div><p style=\"text-align:justify\"><br />Хайдарова Зайнаб - Нарпай туманидаги «Меҳнат-роҳат» фермер хўжалиги бошлиғи, Самарқанд вилояти </p><div style=\"text-align: justify;\"><strong>«Ўзбекистон Республикасида хизмат кўрсатган қишлоқ хўжалик ходими»</strong></div><p style=\"text-align:justify\"><br />Ахмедов Мухамад Исматович -Бухоро туманидаги «Маданият Муҳаммад Исмат» фермер хўжалиги бошлиғи, Бухоро вилояти </p><div style=\"text-align: justify;\"><strong>«Ўзбекистон Республикасида хизмат кўрсатган ирригатор»</strong></div><p style=\"text-align:justify\"><br />Рахимов Ботир - «Аму-Қашқадарё» ирригация тизимлари ҳавза бошқармаси бошлиғи, Қашқадарё вилояти <br /><br />Хамраев Шавкат Рахимович - Ўзбекистон Республикаси Қишлоқ ва сув хўжалиги вазирининг сув хўжалиги масалалари бўйича ўринбосари </p><div style=\"text-align: justify;\"> </div><div style=\"text-align: justify;\"><strong><strong>«Ўзбекистон Республикасида хизмат кўрсатган қурувчи»</strong></strong></div><p style=\"text-align:justify\"><br />Сангинов Абдугани Абдурахмонович - «Ўзбекгидроэнерго» акциядорлик жамияти бошқаруви раиси </p><div style=\"text-align: justify;\"> </div><div style=\"text-align: justify;\"><strong><strong>«Фидокорона хизматлари учун» ордени билан</strong></strong></div><p style=\"text-align:justify\"><br />Абдуллаев Умид Валиевич - «УзГИП» масъулияти чекланган жамияти техник директори <br /><br />Амирқулов Қурбан - Музработ туманидаги «Амирқул бобо» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /><br />Муротова Лола Неъматовна - Олтиариқ туманидаги «Нурли обод» фермер хўжалиги бошлиғи, Фарғона вилояти <br /><br />Хаджаев Мансурхаджа - Фарғона вилояти ўрмон хўжалиги бошқармаси бошлиғи </p><div style=\"text-align: justify;\"> </div><div style=\"text-align: justify;\"><strong>«Меҳнат шуҳрати» ордени билан</strong></div><p style=\"text-align:justify\"><br />Абдураимов Одилжон - меҳнат фахрийси</p></div><div style=\"text-align: justify;\"><br />Абдурахимов Абдукахар - Наманган шаҳридаги «Транснамбат сервис» асаларичилик фермер хўжалиги бошлиғи, Наманган вилояти <br /><br />Абдурахмонов Абдунаби Абдураимович - Шароф Рашидов туманидаги «Қўрғонтепа» фермер хўжалиги бошлиғи, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Алиев Номаз Жўраевич - Қумқўрғон туманидаги «Яккатут ғаллакори» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Ахтамов Илғор Рахматович - Кармана туманидаги «Анвар Ахтамов» фермер хўжалиги бошлиғи, Навоий вилояти <br /><br />Бекбаулиев Каримбай Реимович - «Қуйи Амударё» ирригация тизимлари ҳавза бошқармасининг «Суенли» ирригация тизими бошқармаси «Суенли параллел» участкаси муҳандис-гидротехниги, Қорақалпоғистон Республикаси <br /><br />Белолипов Игорь Владимирович - Тошкент давлат аграр университетининг «Доривор ўсимликлар ва ботаника» кафедраси профессори <br /><br />Буранов Уктам Мамаражабович - «Кармана-Конимех» ирригация тизими бошқармаси экскаватор машинисти, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Дониёров Дилмурод Амирович - Нарпай тумани қишлоқ ва сув хўжалиги бўлими бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Камилов Асил Икрамович - Тошкент ирригация ва қишлоқ хўжалигини механизациялаш муҳандислари институтининг «Тракторлар ва автомобиллар» кафедраси доценти <br /> </div><div style=\"text-align: justify;\">Каримов Қўчқор Салимович - Қизилтепа туманидаги «Қўчқор Каримов» фермер хўжалиги бошлиғи, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Комилов Турсунбой - Тўрақўрғон туманидаги «Комилов Турсунбой» фермер хўжалиги бошлиғи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Курбанов Илхам Узакович - Қарши магистрал каналидан фойдаланиш бошқармаси бошлиғи, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Курбанова Мукаррам Тухтасиновна - Избоскан туманидаги «Избоскан пилла миришкори» пиллачилик фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Маджитов Абдувохид Абдурашитович - Андижон вилояти қишлоқ ва сув хўжалиги бошқармаси бошлиғининг ўринбосари <br /> </div><div style=\"text-align: justify;\">Матниёзов Пўлат Ёқубович - Боғот туманидаги «Яқуб бобо ўғли Омон» фермер хўжалиги бошлиғи, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Мирзажонов Қирғизбой - Пахта селекцияси, уруғчилиги ва етиштириш агротехнологиялари илмий-тадқиқот институти бош илмий маслаҳатчиси <br /> </div><div style=\"text-align: justify;\">Мирсаатов Мирагзам Мирпулатович - «Тошкентпарранда» масъулияти чекланган жамияти бошқаруви раиси, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Наджимов Марат Фахриевич - «Ўзсувлойиҳа» акциядорлик жамияти бош директори <br /> </div><div style=\"text-align: justify;\">Озатов Эгамберди - Чиноз туманидаги «Қуюнбой ота» фермер хўжалиги бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Окманов Базарбой Жумабаевич - Шовот туманидаги «Анор» фермер хўжалиги бошлиғи, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Оллаберганов Отабой Балтаевич - Хива туманидаги «Болтабой оқсоқол» фермер хўжалиги бошлиғи, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Парманов Сайдулла - Зарбдор туманидаги «Тошкескан» фермер хўжалиги бошлиғи, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Рузибоев Баходир Кучкорович - «УзГИП» масъулияти чекланган жамияти директори <br /> </div><div style=\"text-align: justify;\">Рузимурадов Гулмурат - Қарши тумани фермер, деҳқон хўжаликлари ва томорқа ер эгалари кенгаши раиси, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Собиров Исмоил Эшонович - Олот тумани қишлоқ ва сув хўжалиги бўлими бошлиғи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Султанов Ражаббай - Амударё туманидаги «Уста Аллаяр» фермер хўжалиги бошлиғи, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Суюнов Эсанбай Таджибаевич - «Сирдарё-Зарафшон» ирригация тизимлари ҳавза бошқармасининг «Учтом» ирригация тизими бошқармаси участка экскаватор машинисти, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Тажахметов Давлетали - Юқори Чирчиқ туманидаги «Тожахмедов» фермер хўжалиги бошлиғи, Тошкент вилояти</div><div style=\"text-align: justify;\"> </div><div style=\"text-align: justify;\">Тошболтаев Махамад Тожалиевич - Қишлоқ хўжалигини механизациялаш ва электрлаштириш илмий-тадқиқот институти директорининг илмий ишлар бўйича ўринбосари <br /> </div><div style=\"text-align: justify;\">Тошпўлатов Баҳодир Жўраниёзович - Шеробод туманидаги «Тошпўлатов Баҳодир Жўраниёзович» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Туклиев Иброхим Бадалович - Бухоро туманидаги «Ўктам Иброҳим Тўқли» фермер хўжалиги бошлиғи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Турсунов Нурмамат - Самарқанд вилояти Ғўза уруғчилиги бирлашмаси раиси <br /> </div><div style=\"text-align: justify;\">Тухтасинов Махмуджон - Жалақудуқ туманидаги «Обод водий соҳибкори» фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Умедов Абдулло - Косон туманидаги «Заргар тонг» сув истеъмолчилари уюшмаси раиси, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Усмонов Орибжон Исакович - «Нориндавсувмахсуспудрат» давлат унитар корхонаси экскаватор машинисти, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Хайитов Тоштемир Джумаевич - Каттақўрғон туманидаги «Жума Хайитов» фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Халилов Насриддин - Самарқанд қишлоқ хўжалик институтининг «Ўсимликшунослик» кафедраси мудири <br /> </div><div style=\"text-align: justify;\">Хоналиев Эшқурбон - Касби туманидаги «Қамаши русти-рости» фермер хўжалиги бошлиғи, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Худайбердиева Айзада Мусаевна - Ўрта Чирчиқ туманидаги «Пилла» ишлаб чиқариш шўъба корхонаси бригада бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Ҳамзаев Неъматулла - Пастдарғом туманидаги «Неъматулло Шербобурлар даласи» фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Чинибекова Мамлакат Халбутаевна - Гулистон туманидаги «Гулистонагропилла» масъулияти чекланган жамияти агрономи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Чориева Жумахол Қурбоновна - Бойсун туманидаги «Бойсун теракли» фермер хўжалиги пиллачиси, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Шарипов Шавкат Уктамович - Самарқанд шаҳридаги «Шарқ саноат» концернининг директорлар Кенгаши раиси, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Щурова Людмила Георгиевна - Тошкент ирригация ва қишлоқ хўжалигини механизациялаш муҳандислари институтининг катта илмий ходими <br /> </div><div style=\"text-align: justify;\">Эргашев Бийтемир Тошбоевич - Зомин миллий табиат боғи нозири, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Юсупниязов Мирзабай Турганбаевич - Нукус туманидаги «Иқлас-Оринбай» фермер хўжалиги бошлиғи, Қорақалпоғистон Республикаси <br /> </div><div><p style=\"text-align:justify\">Юсупов Гияз Усмонович - Тошкент ирригация ва қишлоқ хўжалигини механизациялаш муҳандислари институтининг «Гидрология ва гидрогеология» кафедраси доценти </p><div style=\"text-align: justify;\"><strong>«Дўстлик» ордени билан</strong></div><div style=\"text-align: justify;\"> </div><p style=\"text-align:justify\">Азизов Хайитбой Каримович - Арнасой туманидаги «Ғани ота» фермер хўжалиги бошлиғи, Жиззах вилояти </p></div><div style=\"text-align: justify;\">Алибоев Салимжон Собирович - Учқўрғон туманидаги «Шодлик» фермер хўжалиги бошлиғи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Амиров Чори - Қизириқ туманидаги «Истара ғолиби» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Атабаева Халима Назаровна - Тошкент давлат аграр университетининг «Соя ва бошқа мойли экинлар етиштириш агротехнологиялари» кафедраси профессори <br /> </div><div style=\"text-align: justify;\">Атаджанов Фарход Боғибекович - Элликқалъа туманидаги «Тоҳир ўғли Боғибек» фермер хўжалиги бошлиғи, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Атаханов Фарходжон Мамрасулович - Пахтаобод туманидаги «Ғуломқодир» фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Ахмедов Холикназар Эргашевич - Бахмал туманидаги «Элёр Эргашев» боғдорчилик фермер хўжалиги бошлиғи, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Ахмедова Мутабар Мирзарасуловна - Риштон туманидаги «Ихтиёр» фермер хўжалиги бошлиғи, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Бабаева Ранохон Нематовна - Янгийўл туманидаги «Неъматжон олмалари» фермер хўжалиги бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Бакун Анна Федоровна - Ўзбекистон Республикаси Давлат ветеринария қўмитасининг Республика ҳайвонлар касалликлари ташхиси ва озиқ-овқат маҳсулотлари хавфсизлиги давлат маркази лаборатория мудири <br /> </div><div style=\"text-align: justify;\">Бекмуратов Рустам Эшбуриевич - Ангор туманидаги «Эшбури Бекмуродов» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Бозорова Раъно Хайдаровна - Деҳқонобод давлат ўрмон хўжалиги директори, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Бўтаев Равшан Одилович - Шаҳрихон тумани қишлоқ ва сув хўжалиги бўлими бош мутахассиси, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Гаипов Мурат Хожабаевич - Чимбой туманидаги «Ланэкстракт» қўшма корхонаси ижрочи директори, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Дорохова Елена Александровна - Академик М.Мирзаев номидаги боғдорчилик, узумчилик ва виночилик илмий-тадқиқот институти катта илмий ходими <br /> </div><div style=\"text-align: justify;\">Журакулов Норйигит - Оқолтин туманидаги «Ёрбек» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Ибрагимов Бойназар Рустамович - Янгиариқ туманидаги «Асқар Аброр Ғуломжон» фермер хўжалиги бошлиғи, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Илясов Орифжон Элмуратович - Тайлоқ туманидаги «Орзу Олим Дилмурод асаллари» кўп тармоқли асаларичиликка ихтисослашган фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Кистауов Нурдилла Утекулович - Учқудуқ туманидаги «Ақ шат» фермер хўжалиги чўпони, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Кожагелдиев Кенесбек Аймбетович - Томди туманидаги «Аймбет» фемер хўжалиги чўпони, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Курёзов Эгамберди - Хоразм давлат ўрмон хўжалиги ўрмон муҳандиси <br /> </div><div style=\"text-align: justify;\">Қорабоев Ғайбулло Қултаевич - Миришкор тумани қишлоқ ва сув хўжалиги бўлими бошлиғи, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Мамадалиева Барно Облобердиевна - Ургут туманидаги «Ғалаба» фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Мамадумаров Ортиқмат Собирович - «Наманган агросервис МТП» масъулияти чекланган жамияти директорининг ўринбосари, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Матмуротов Гулимбой Бозорбойович - «Хоразм агросервис МТП» масъулияти чекланган жамиятининг Гурлан тумани филиали механизатори, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Махматмуродов Шадияр Хайитович - Косон тумани ветеринария бўлими участка мудири, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Махмудов Хайдар Хусанович - Ўзбекистон Республикаси Ўрмон хўжалиги давлат қўмитасининг Сурхондарё вилояти бўйича ўрмон муҳофазаси инспектори <br /> </div><div style=\"text-align: justify;\">Нагиметов Орахбай - Қорақалпоғистон деҳқончилик илмий-тадқиқот институти директорининг илмий ишлар бўйича ўринбосари, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Назарова Махсуда Нишановна - Хатирчи туманидаги «Назар бобо» фермер хўжалиги бошлиғи, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Намазов Абдукадир Джалилович - Сирдарё туманидаги «Меҳридарё» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Нематов Исроил - Мирзаобод туманидаги «Қора қайин анор шарбати» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Нурматов Абдухошим Хожиматович - Булоқбоши туманидаги «Абдухошим Нурматов» фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Орипов Ғайратжон - Бешариқ туманидаги «Ғайратжон Орипов» фермер хўжалиги бошлиғи, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Рузиев Каримжан - «ТўполангсувГЭСқурилиш» масъулияти чекланган жамиятининг «Резаксойсувқурилиш» унитар корхонаси бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Рузматова Маъмура Ахматовна - Паркент туманидаги «Заркент Маъмура Рўзматова» фермер хўжалиги бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Рустамов Севдиёр Сафоевич - Навбаҳор туманидаги «Сафо Севди» фермер хўжалиги бошлиғи, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Сатторов Бахтиёр Шокирович - Фарғона туманидаги «Абдусаттор ота ўғли Шокиржон ҳожи» фермер хўжалиги бошлиғи, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Солиев Алижон Амонович - Ғиждувон тумани ветеринария бўлими участка мудири, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Тешабаев Баходир Нуманджанович - «Фарғонабалиқсаноат» масъулияти чекланган жамияти раҳбари, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Утарбаев Елубай Асантаевич - Тахтакўпир туманидаги «Айдос қала шарўаси» масъулияти чекланган жамияти бош чўпони, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Файзиев Яхё Шарафович - Ромитан туманидаги «Файз» фермер хўжалиги бошлиғи, Бухоро вилояти<br /> </div><div style=\"text-align: justify;\">Хабибуллаева Мутабархон Абдубаннобовна - Фарғона шаҳридаги «Шамсуддинов» фермер хўжалиги асаларичиси, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Хайдарова Насибахон Ибрагимовна - Янгиқўрғон туманидаги «Бош пиллахона» масъулияти чекланган жамияти агрономи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Хожиева Сайёра Қўйлибоевна - Пискент туманидаги «Хожиев Довутбек» фермер хўжалиги бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Холиқов Аслон Умарович - «Қуйи Зарафшон» ирригация тизимлари ҳавза бошқармаси қошидаги Насос станциялари ва энергетика бошқармасининг «Ўзбекистон» насос станцияси бошлиғи, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Ҳожиев Назар Қурбонович - Жондор туманидаги «Бўстон Назар» фермер хўжалиги бошлиғи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Чернова Галина Михайловна - Ўзбекистон Республикаси Ўрмон хўжалиги давлат қўмитасининг Ўрмон хўжалиги илмий-тадқиқот институти етакчи мутахассиси <br /> </div><div style=\"text-align: justify;\">Эшкуватов Эрмамат Бабаёрович - Ғузор туманидаги «Ғузор» қоракўлчилик масъулияти чекланган жамияти бош чўпони, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Юлдашев Лутфулла Умрияевич - Бўстонлиқ туманидаги «Бўстон Юлдашев Лутфулла» фермер хўжалиги бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Юсупов Шамситдин Эсанович - «Хархўр-Дуоба» ирригация тизими бошқармасининг «Вобкентдарё» канали бошлиғи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Юсупова Гулбахар Эркиновна - Беруний туманидаги «Каримов Рустамбой» фермер хўжалиги бошлиғи, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Юсупова Гулхумор Турабовна - «Агрокимёҳимоя» акциядорлик жамиятининг Ғиждувон тумани филиали бош агрономи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Ялгашев Шухрат Холиқназарович - «Қуйи Зарафшон» ирригация тизимлари ҳавза бошқармаси қошидаги Насос станциялари ва энергетика бошқармасининг Нурота сув таъминоти участкаси бошлиғи, Навоий вилояти <br /> </div><div><p style=\"text-align:justify\">Яхшибаев Зокир Жураевич - Пахтакор туманидаги «ЯЗ Бекзод» фермер хўжалиги бошлиғи, Жиззах вилояти </p><div style=\"text-align: justify;\"><strong>«Шуҳрат» медали билан</strong></div><div style=\"text-align: justify;\"> </div><p style=\"text-align:justify\">Абдикаримов Шарибай Балтабаевич - Чимбой туманидаги «Зайыр» фермер хўжалиги бошлиғи, Қорақалпоғистон Республикаси </p></div><div style=\"text-align: justify;\">Абдуллаев Бехзод Набиевич - Хўжаобод туманидаги «Хўжаобод ферузаси» фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Абдухоликов Ғайрат Сайдивалиевич - Зарбдор туманидаги «Шабода шамоли» фермер хўжалиги бошлиғи, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Абитов Хожагелди Туримбетович - «Қорақалпоғистон агросервис МТП» масъулияти чекланган жамиятининг Тахтакўпир тумани филиали механизатори, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Авазов Дилмурод Султонмуродович - Сариосиё туманидаги «Имкон» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Авлиякулов Одил Озодович - «Қашқадарё агросервис МТП» масъулияти чекланган жамиятининг Қарши тумани филиали комбайнчиси, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Акбаров Низомжон Эргашбаевич - Қувасой шаҳридаги «Акбаров Эргашбой боғи» фермер хўжалиги бошлиғи, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Аллаев Ихтиёр Буриевич - Сирдарё туманидаги «Ихтиёр» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Алланиязов Муратбай Махсетович - «Қорақалпоғистон агросервис МТП» масъулияти чекланган жамиятининг Қонликўл тумани филиали механизатори, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Арсланов Исмаилжон Усманович - Наманган туманидаги «Уста Қурбон» фермер хўжалиги бошлиғи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Бабаджанов Закиржан Самандарович - Беруний туманидаги «Шукурулла Бобожонов» фермер хўжалиги бошлиғи, Қорақалпоғистон Республикаси <br /> </div><div style=\"text-align: justify;\">Бабажанов Камолиддин Эшонкулович - Булунғур туманидаги «Бобожон ота» фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Бабамуратов Собир Тўхтамишович - «Сурхондарё агросервис МТП» масъулияти чекланган жамиятининг Термиз тумани филиали механизатори, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Базаров Диёр Гафурович - Ғаллаорол туманидаги «Сангзор-парранда» хусусий корхонаси директори, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Бердимуратов Фарход Азамович - «Жиззах агросервис МТП» масъулияти чекланган жамиятининг Дўстлик тумани филиали механизатори, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Буранов Ғанижон Валиевич - Сирдарё мелиоратив экспедицияси экскаватор машинисти, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Джураев Авазбек Адилович - Боёвут туманидаги «Зукко-зиё лочин» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Журабоев Собиржон Абдусамадович - Косонсой туманидаги «Кушон рохи сафед» фермер хўжалиги бошлиғи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Жураев Дилшод Хомидович - Поп туманидаги «Хомиджон Даврон» фермер хўжалиги бошлиғи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Избосаров Деҳқонали Юсупжонович - Чуст туманидаги «Юсупжон ҳожи Избосаров» фермер хўжалиги бошлиғи, Наманган вилояти <br /> </div><div style=\"text-align: justify;\">Имомов Ҳамдам Ҳайдарович - Пешку туманидаги «Қўшшаобод» фермер хўжалиги бошлиғи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Имомов Тулқин Шодиевич - Пайариқ туманидаги «Тўполос» фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Искандарова Мархабо Шариповна - Янгиариқ туманидаги «Янгиариқ кумуш тола» масъулияти чекланган жамияти пиллачиси, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Ишназаров Хушбоқ Хужақулович - Шўрчи туманидаги «Нурмат Хўжақулов» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Каримов Хуснидин Мўминович - Асака туманидаги «Обод турмуш орзуси» фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Косимов Собиржон Нарзуллоевич - «Ўзтемирйўлқурилишмонтаж» унитар корхонасининг гидротехник иншоотлар қуриш дирекцияси пайвандчиси <br /> </div><div style=\"text-align: justify;\">Қиличов Рамазон Бабажанович - «Бухоро агросервис МТП» масъулияти чекланган жамиятининг Қоракўл тумани филиали механизатори, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Кутлиев Кадамбай Рахимович - Хива туманидаги «Рахимберган ҳожи Анбар» фермер хўжалиги бошлиғи, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Мадрахимов Носиржон Орипович - Қўрғонтепа туманидаги «Интер Агро Стар» масъулияти чекланган жамияти раҳбари, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Мамадалиев Юлдаш Кучкорович - «Ўзтемирйўлқурилишмонтаж» унитар корхонасининг гидротехник иншоотлар қуриш дирекцияси ҳайдовчиси <br /> </div><div style=\"text-align: justify;\">Марасулов Розикжон Уринбоевич - «Данғарадавсувмахсуспудрат» давлат унитар корхонаси экскаватор машинисти, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Маткаримов Равшонбек Сабирович - «Шовот-Қуловот» ирригация тизими бошқармасининг «Урганч-арна» канали экскаватор машинисти, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Мирзаев Шавкат Кенжаевич - Пахтачи туманидаги «Мирзаев Шуҳрат Кенжаевич» фермер хўжалиги бошлиғи, Самарқанд вилояти <br /> </div><div style=\"text-align: justify;\">Муминов Барно Рахманович - «Ўзтемирйўлқурилишмонтаж» унитар корхонасининг гидротехник иншоотлар қуриш дирекцияси бульдозер машинисти <br /> </div><div style=\"text-align: justify;\">Норбоев Абдусамат Даминович - Денов туманидаги «Меҳнат – фаровон ҳаёт» фермер хўжалиги бошлиғи, Сурхондарё вилояти <br /> </div><div style=\"text-align: justify;\">Норматов Баходир Абдусаломович - Оқолтин туманидаги «Баходир Нуриддин Комилжон» балиқчилик фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Пиржанова Зулфия Гадимовна - «Шовот дон маҳсулотлари» акциядорлик жамияти лаборанти, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Примқулов Рўзиқул Умматқулович - Боёвут туманидаги «Сардорбек Элдорбек буюк» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Рахматов Тухтабой Камалович - Тошкент туманидаги «Камол Тўхтабой барака» фермер хўжалиги бошлиғи, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Рахматуллаев Нумонжон Мамаюнусович - «Фарғона агросервис МТП» масъулияти чекланган жамиятининг Бешариқ тумани филиали механизатори, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Самадов Бахтиёр Халимович - Қизилтепа туманидаги «Хазина» фермер хўжалиги бошлиғи, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Сапарматов Хуршид Мухиддинович - «Тошкент вилояти агросервис МТП» масъулияти чекланган жамиятининг Бўка тумани филиали механизатори, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Толипов Саҳоб Коршибой ўғли - «Сирдарё агросервис МТП» маъсулияти чекланган жамиятининг Сардоба тумани филиали комбайнчиси, Сирдарё вилояти <br /> </div><div style=\"text-align: justify;\">Тошниёзов Қобилжон Исмоилович - «Навоий агросервис МТП» масъулияти чекланган жамиятининг Хатирчи тумани филиали механизатори, Навоий вилояти <br /> </div><div style=\"text-align: justify;\">Туйчиев Сайфиддин Минигалиевич - «Ўзмахсуссувқурилиш ихтисослашган компанияси» давлат корхонасининг «Сирдарёмахсуссувқурилиш» филиали ишчиси <br /> </div><div style=\"text-align: justify;\">Тураев Абдурасул Хасанович - Ёзёвон туманидаги «Хайрулла» фермер хўжалиги бошлиғи, Фарғона вилояти <br /> </div><div style=\"text-align: justify;\">Умаров Савриддин Садуллаевич - Қоровулбозор туманидаги «Умар Шариф» фермер хўжалиги бошлиғи, Бухоро вилояти <br /> </div><div style=\"text-align: justify;\">Хамроев Камолжон Журақулович - «Қашқадарё агросервис МТП» масъулияти чекланган жамиятининг Китоб тумани филиали механизатори, Қашқадарё вилояти <br /> </div><div style=\"text-align: justify;\">Хидиров Нормамат Сулаймонович - Янгиобод туманидаги «Шанс-Имкон» чорвачилик фермер хўжалиги бошлиғи, Жиззах вилояти <br /> </div><div style=\"text-align: justify;\">Холбоев Шарафидин Закирович - «Тошкент вилояти агросервис МТП» масъулияти чекланган жамиятининг Оққўрғон тумани филиали механизатори, Тошкент вилояти <br /> </div><div style=\"text-align: justify;\">Холматов Махмуд Хайитбаевич - «Ўзтемирйўлқурилишмонтаж» унитар корхонаси бош директорининг ўринбосари – гидротехник иншоотлар қуриш дирекцияси бошлиғи <br /> </div><div style=\"text-align: justify;\">Худайберганова Нуқулжон Режабовна - Қўшкўпир туманидаги «Ўртаяп биосервис» масъулияти чекланган жамияти раҳбари, Хоразм вилояти <br /> </div><div style=\"text-align: justify;\">Худойбердиева Сохиба Мухторовна - Балиқчи туманидаги «Коинот» фермер хўжалиги бошлиғи, Андижон вилояти <br /> </div><div style=\"text-align: justify;\">Эргашов Нормурод Кодирович - «Ўзтемирйўлқурилишмонтаж» унитар корхонасининг гидротехник иншоотлар қуриш дирекцияси ҳайдовчиси <br /> </div><div style=\"text-align: justify;\">Юлдошев Зафар Қаршиевич - «Ўзтемирйўлқурилишмонтаж» унитар корхонасининг гидротехник иншоотлар қуриш дирекцияси экскаватор машинисти <br /> </div><div><p style=\"text-align:justify\">Яхяев Уткиржон Туйчиевич - Ховос туманидаги «Сабохат Хайдаровна» фермер хўжалиги бошлиғи, Сирдарё вилояти <br /> </p><p style=\"text-align:justify\"> </p><p style=\"text-align:justify\"><strong>Ўзбекистон Республикаси Президенти                                              Ш.МИРЗИЁЕВ</strong> <br /><br />Тошкент шаҳри, 2017 йил 7 декабрь</p><p style=\"text-align:justify\">манба: uza.uz</p></div>', '2017-12-11 13:19:07', '2017-12-11 13:19:07', '2017-12-11 14:07:40', 0, 0, '62eb53ef8cd42b246a6ee7e180d07aac.jpg', 'a:5:{s:9:\"showtitle\";s:1:\"1\";s:8:\"showdate\";s:1:\"1\";s:8:\"showcomm\";s:1:\"1\";s:10:\"showlatest\";s:1:\"1\";s:7:\"canrate\";s:1:\"1\";}', 1, '', 'com_content_read.php', 'Қишлоқ,хўжалиги,ходимлари,куни,муносабати,билан,соҳа,ривожига,муносиб,ҳисса,қўшган,юртдошларимиздан,бир,гуруҳини,мукофотлаш,тўғрисида', '<p style=\"text-align:justify\">Мамлакатимиз қишлоқ хўжалиги соҳасини ривожлантириш, тармоқни комплекс модернизация қилиш ва ишлаб чиқариш самарадорлигини ошириш, фермерлик ҳаракатини янги босқичга кўтариш, замонавий инновацион ишланмалар ва илғор хорижий тажрибаларни амалиётга жорий этиш каби долзарб масалалар ечимига қаратилган ислоҳотлар ўзининг ижобий натижаларини бермоқда.&nbsp;</p>\r\n', 'yangiliklar/ishlo_huzhaligi_hodimlari_kuni_munosabati_bilan_soha_rivozhiga_munosib_hissa_ushgan_yurtdoshlarimizdan_bir_guruhini_mukofotlash_turisida', '', '', 2, 'uz'),
(2, 1, 1, 1, 'Қишлоқ хўжалиги ходимлари куни кенг нишонланди', '<p style=\"text-align:justify\"><strong>Президентимиз Шавкат Мирзиёев ташаббуси билан декабрь ойининг иккинчи якшанбаси Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни этиб белгиланди. Юртимиз бўйлаб бу йил илк бор нишонланаётган ушбу сана \"Ҳосил байрами\" тадбирлари билан уйғунлашган ҳолда ўтмоқда.</strong> </p>', '<p><strong>Президентимиз Шавкат Мирзиёев ташаббуси билан декабрь ойининг иккинчи якшанбаси Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни этиб белгиланди. Юртимиз бўйлаб бу йил илк бор нишонланаётган ушбу сана \"Ҳосил байрами\" тадбирлари билан уйғунлашган ҳолда ўтмоқда.</strong> <br /><br />Қорақалпоғистон Республикаси, вилоятлардан пойтахтимизга ташриф буюрган аграр соҳанинг энг илғор вакиллари Мустақиллик ва эзгулик монументи пойига гулчамбарлар қўйди. <br /><br />                   <img alt=\"Medal Topshirish 02.JPG\" border=\"0\" src=\"http://uza.uz/upload/medialibrary/b22/medal-topshirish-02.jpg\" style=\"height:369px; width:640px\" title=\"Medal Topshirish 02.JPG\" /></p><p style=\"text-align:justify\">– Инсон учун тинчлик ва тотувликдан кўра қадрлироқ неъмат йўқ, – дейди Хоразм вилоятининг Боғот туманидаги “Боғот” фермер хўжалиги раиси, Ўзбекистон Қаҳрамони Шарифбой Ражабов. – Бугун биз эришаётган ютуқлар ана шу буюк неъматлар шарофатидан. Айниқса, Президентимизнинг қишлоқ хўжалигига, тадбиркорликни, фермерлик ҳаракатини ривожлантиришга доир саъй-ҳаракатлари, соҳага бўлган юксак эътибор ўз самарасини бермоқда. Бугун барчамизда ислоҳотларимизга дахлдорлик ҳисси, меҳнатимиз самарасига бўлган ишонч ортмоқда. Бу жиҳатлар деҳқону фермерларимизнинг чин меҳнати туфайли мўл ҳосил етиштирилаётганида ҳам яққол намоён. Бугунги байрамлар бизни янада руҳлантириб, янгича руҳда меҳнат қилишга ундайди. <br /><br />Тадбирлар иштирокчилари Тошкент қишлоқ хўжалиги техникаси заводида ташкил этилган кўргазмага ташриф буюрди. <br /><br />Бугунги кунда мамлакатимизда қишлоқ хўжалигини модернизация қилиш, ишлаб чиқаришга янги технологияларни жорий этиш, пировардида қўл меҳнатини енгиллаштиришга алоҳида эътибор қаратилмоқда. Бунда Германия, Россия, Туркия, Беларусь ва бошқа мамлакатлар билан ҳамкорликда ишлаб чиқарилаётган қишлоқ хўжалиги техникалари самара бермоқда. <br /><br />Аграр соҳа вакиллари мамлакатимизда ишлаб чиқарилаётган энг замонавий қишлоқ хўжалиги техникалари билан танишди. Мазкур техникаларни сотиб олиш усуллари, фойдаланиш самарадорлиги, тежамкорлиги ҳақида маълумотга эга бўлди. <br /><br />Қишлоқ хўжалиги ходимлари “Ўзкўргазмасавдо” марказида ташкил этилган асал байрами ва асал маҳсулотлари кўргазма-ярмаркаси билан танишди. <br /><br />Президентимиз Шавкат Мирзиёевнинг 2017 йил 16 октябрдаги “Республикамизда асаларичилик тармоғини янада ривожлантириш чора-тадбирлари тўғрисида”ги қарори соҳани янги босқичда ривожлантиришга хизмат қилмоқда. Мазкур қарор билан Ўзбекистон асаларичилари уюшмаси тузилди. “Апимондия” халқаро асаларичилик уюшмалари федерациясига аъзо бўлиш режалаштирилган, Фарғона давлат университетида зоотехника факультети ташкил этилади. Пировардида сифатли асал ва асал маҳсулотлари етиштириш ҳажми ортиб, экспорт кўлами кенгаяди. <br /><br />Асал байрамига ташриф буюрган меҳмонлар мутахассислар билан соҳанинг нозик сирлари, ҳосилдорликни ошириш ва тармоқни кенгайтириш истиқболлари борасида фикр алмашди. <br /><br />Байрам иштирокчилари Тошкент вилоятидаги илғор қишлоқ хўжалиги субъектлари билан танишди. <br /><br />Ўрта Чирчиқ туманидаги «Ўзбегим отлари» от заводида парваришланаётган қадимий от зотлари – ахалтака тулпорлари дунёга машҳур саналади. Бугунги кунда мазкур от заводида 400 га яқин ахалтака, инглиз ва араб зотли отлар бор. <br /><br />Мамлакатимизда йилқичилик ва от спорти жадал ривожланаётган соҳа ҳисобланади. Бу борада Президентимиз Шавкат Мирзиёевнинг 2017 йил 15 июндаги \"Ўзбекистон Республикасида йилқичилик ва от спортини ривожлантиришга доир қўшимча чора-тадбирлар тўғрисида\"ги қарори муҳим дастуриламал бўлмоқда. <br /><br />– Болалигимдан от боқишга қизиқаман. Шу боис, фермерлик фаолиятимда ҳам йилқичиликка эътибор қаратмоқдамиз, – дейди Сирдарё вилояти Гулистон туманидаги \"Орол неъматлари\" фермер хўжалиги раҳбари Баҳодир Неъматов. – Бугунги кунда хўжалигимизда ғалла ва пахта етиштиришдан ташқари, балиқчилик, асаларичилик билан шуғулланмоқдамиз. Шунингдек, 150 от, 450 қорамол, 300 қўй боқилаётир. Келажакда зотдор отларни кўпайтириш ниятидамиз. \"Ўзбегим отлари\" от заводида бу борада керакли маълумотларни олдик, ҳамкасбларимиз билан тажриба алмашдик. <br /><br />Ўзбекистон Республикаси Қишлоқ ва сув хўжалиги вазирлигида бир гуруҳ қишлоқ хўжалиги ходимларини тақдирлашга бағишланган маросим бўлиб ўтди. <br /><br />Унда Президентимиз Шавкат Мирзиёевнинг фармонига биноан тақдирланган соҳанинг илғор вакилларига Ўзбекистон Республикаси Бош вазири А.Арипов юксак давлат мукофотларини тантанали топширди. <br /><br />– Меҳнатларим бундай нуфузли мукофотга муносиб кўрилганидан хурсандман, – дейди «Шуҳрат» медали соҳиби, Жиззах вилояти Ғаллаорол тумани «Сангзор парранда» масъулияти чекланган жамияти раҳбари Диёр Бозоров. – Жорий йилда 1 миллион 500 минг долларлик тухум экспорт қилдик. Корхонамизда етиштирилган 190 минг бош 90 кунлик жўжа буюртма асосида фермер хўжаликларига етказиб берилди. Бугунги рағбат бизни янги марралар сари янада руҳлантиради. 2018 йил 20 миллиард сўмлик лойиҳани амалга оширишни режалаштирмоқдамиз. Шунда 5 миллион долларлик тухумни экспортга чиқариш имконига эга бўламиз. <br /><br />Қишлоқ хўжалиги ходимлари Тошкент шаҳридаги музейларда бўлди, театрларда спектакллар томоша қилди. </p><p style=\"text-align:justify\"> </p><p style=\"text-align:right\">Сайёра Шоева, Улуғбек Асроров, Оқил Ғуломов (сурат), ЎзА</p>', '2017-12-11 14:05:20', '2017-12-11 14:05:20', '2017-12-11 14:06:55', 0, 0, '', 'a:5:{s:9:\"showtitle\";s:1:\"1\";s:8:\"showdate\";s:1:\"1\";s:8:\"showcomm\";s:1:\"1\";s:10:\"showlatest\";s:1:\"1\";s:7:\"canrate\";s:1:\"1\";}', 1, '', 'com_content_read.php', 'Қишлоқ,хўжалиги,ходимлари,куни,кенг,нишонланди', '<p style=\"text-align:justify\"><strong>Президентимиз Шавкат Мирзиёев ташаббуси билан декабрь ойининг иккинчи якшанбаси Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни этиб белгиланди. Юртимиз бўйлаб бу йил илк бор нишонланаётган ушбу сана &quot;Ҳосил байрами&quot; тадбирлари билан уйғунлашган ҳолда ўтмоқда.</strong>&nbsp;</p>\r\n', 'yangiliklar/ishlo_huzhaligi_hodimlari_kuni_keng_nishonlandi', '', '', 7, 'uz');
INSERT INTO `content` (`id`, `category_id`, `featured`, `user_id`, `title`, `introtext`, `fulltext`, `created_at`, `end_at`, `update_at`, `is_end`, `is_archive`, `images`, `attribs`, `active`, `pagetitle`, `tpl`, `meta_keywords`, `meta_desc`, `seo`, `url`, `jscode`, `hits`, `lang`) VALUES
(3, 1, 0, 1, 'Ризқ-рўзимиз бунёдкори бўлган қишлоқ хўжалиги ходимлари меҳнатини улуғлаш, соҳа ривожини янги босқичга кўтариш – асосий вазифамиздир', '<p style=\"text-align:justify\"><strong>Ўзбекистон Республикаси Президенти Шавкат Мирзиёевнинг Қишлоқ хўжалиги ходимлари кунига бағишланган тантанали маросимдаги нутқи</strong></p>', '<p style=\"text-align:justify\"><strong>Ўзбекистон Республикаси Президенти Шавкат Мирзиёевнинг Қишлоқ хўжалиги ходимлари кунига бағишланган тантанали маросимдаги нутқи</strong></p><p style=\"text-align:justify\"><br /><br />Ассалому алайкум, азиз ватандошлар! <br /><br />Ҳурматли қишлоқ хўжалиги ходимлари! <br /><br />Мен учун қадрли бўлган деҳқон ва фермерлар! <br /><br />Муҳтарам дўстлар! <br /><br />Аввало, сиз, азизларни ва сизлар орқали бутун халқимизни юртимизда биринчи маротаба нишонланаётган <strong>Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни</strong> байрами билан чин қалбимдан самимий муборакбод этаман. <br /><br />Бугун мана шу муҳташам кошонада йиғилган миришкор деҳқон ва фермерлар, сувчи ва ирригаторлар, механизатор ва агрономлар, аграр тармоқ олимлари тимсолида дунёдаги энг шарафли касб эгаларини кўриб турибмиз. <br /><br />Узоқ йиллар раҳбарлик лавозимларида ишлаган инсон сифатида менинг турли соҳа вакиллари орасида дўстларим, танишларим кўп. Лекин<strong> қалбимга энг яқин инсонлар, қадрдонларимнинг энг кўпи мана шу соҳа – қишлоқ хўжалиги тармоқларида, десам, ишонинглар, айни ҳақиқатни айтган бўламан.</strong> <br /><br />Бу билан мен, албатта, доимо чин дилдан фахрланаман, сизларни қалбимга, юрагимга энг яқин ва азиз инсонлар, деб биламан. <br /><br />Чиндан ҳам, ҳаммамиз болалигимиздан ерга, деҳқончилик ва чорвачиликка меҳр қўйганмиз. <br /><br /><strong>Бу соҳанинг меҳнати қанчалик шарафли, нони эса, қанчалик тотли ва ширин эканини барчамиз яхши биламиз.</strong> <br /><br />Деҳқон деганда, бепоён далалар, боғу роғлар, дастурхонимиздаги турли ноз-неъматлар, тўй-томошалар, хурсандчилик кунларимиз, бутун ҳаётимиз кўз олдимизда намоён бўлади. <br /><br />Шу маънода, <strong>деҳқон бу – ҳаётнинг бақувват устуни, тирикликнинг мустаҳкам таянчи,</strong> десак, ҳеч қандай муболаға бўлмайди. <br /><br />Буюк мутафаккир Алишер Навоий бобомиз <strong>“олам аҳлининг тўқлиги, қувончи, аввало, ерга уруғ сочиб, бебаҳо ноз-неъмат етиштирадиган фидойи инсонлар меҳнатидандир”</strong>, деб миришкор деҳқонлар хизматига жуда катта баҳо берганлар. <br /><br />Мамлакатимизда ҳамма соҳа вакилларининг байрами бор. Лекин барчамизни, бутун ҳалқимизни боқадиган, кийинтирадиган қишлоқ хўжалиги ходимларининг байрами шу пайтгача йўқ эди. Шуни ўйлаб, очиғини айтганда, мен сизларнинг олдингизда ва бутун заҳматкаш деҳқонларимиз олдида ҳақиқатдан ҳам хижолат бўлиб юрардим. Албатта, бу адолатдан эмас эди. <br /><br />Шунинг учун махсус қонун қабул қилиб, <strong>Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари кунини белгилаганимиз, ўйлайманки, ҳаётимиздаги яна бир адолатли қарор, халқимизнинг дилидаги гап бўлди.</strong> <br /><br />Илгари республикамизда деҳқончилик мавсуми якуни бўйича қишлоқ хўжалиги ходимларининг қурултойи ўтказилар эди. Бундай қурултойларда ўтган мавсумда қўлга киритилган ютуқлар ҳам, йўл қўйилган камчиликлар ҳам батафсил таҳлил қилинар, соҳага тегишли янги режалар белгилаб олинар эди. <br /><br />Бугун биз нафақат қишлоқ хўжалиги соҳаси, балки бутун ижтимоий-иқтисодий ҳаётимиз тараққиёти учун янги уфқларни очиб берадиган ана шундай анжуманни – эзгу анъанани қайта тикламоқдамиз. <br /><br />Ҳурматли дўстлар! <br /><br />Ҳозирги кунда аграр соҳада амалга оширилаётган ислоҳотлар натижаларини таҳлил қилиш ва келгуси йил учун энг муҳим чора-тадбирларни белгилаб олиш долзарб вазифа ҳисобланади. <br /><br />Фермерлик ҳаракатини ривожлантириш натижасида мамлакатимизда кейинги йилларда 160 мингдан ортиқ фермер хўжаликлари шаклланиб, улар бугунги кунда 10 дан ортиқ йўналишларда самарали фаолият юритмоқда. <br /><br />Энг қувонарлиси, 12 мингдан зиёд фермер хўжалиги раҳбарларини 30 ёшгача бўлган ёшлар ташкил этса, 6 мингдан ортиқ фермер хўжалигига хотин-қизларимиз раҳбарлик қилмоқда. <br /><br />Кўп тармоқли фермер хўжаликлари охирги икки йилда 45 фоизга кўпайиб, бугунги кунда уларнинг сони 75 мингтага етди. Фақат шунинг ҳисобидан жойларда, узоқ-узоқ қишлоқларда юз минглаб янги иш ўринлари барпо этилди. <br /><br />Олиб борилган иқтисодий ислоҳотлар, фермерлик ҳаракатининг ривожланиши натижасида жорий йилда мамлакатимиз бўйича 8 миллион 377 минг тонна ғалла етиштирилди. <br /><br />Сизларнинг фидокорона меҳнатингиз туфайли 2 миллион 930 тоннадан зиёд пахта ҳосили, 12 минг 450 тонна пилла, 318 минг тонна шоли, 23 миллион тонна мева-сабзавот, 13 миллион тонна гўшт ва сут маҳсулотлари олишга эришдик. <br /><br />Бу йил биринчи марта ғалладан бўшаган қарийб 1 миллион гектар майдонга сабзавот, картошка, полиз ва дуккакли экинлар экилди ва 5,5 миллион тоннадан ортиқ маҳсулот етиштирилди. <br /><br />Қишлоқ хўжалигини диверсификация қилиш, ер-сув ресурсларидан янада оқилона фойдаланиш, экспортбоп маҳсулотлар етиштириш орқали деҳқонларнинг даромадини ошириш борасида олиб бораётган тизимли ишларимиз ҳам аста-секин ўз самарасини бермоқда. <br /><br />Масалан, жорий йилда 96 минг гектар ҳосилдорлиги паст майдонларда пахта ва ғалла ўрнига 32 минг гектар ерда карам, турли сабзавот ва кўкатлар экилди ва бу майдонлардан олинган минглаб тонна маҳсулотлар экспорт қилинди. Шунингдек, 11 минг гектарда интенсив боғ ва янги токзорлар, 1 минг 500 гектарда иссиқхоналар барпо этилди. <br /><br />Бу борада Испания, Польша, Нидерландия, Греция, Россия, Хитой, Жанубий Корея, Туркия, Вьетнам ва Индонезия давлатларининг илғор тажрибасидан кенг фойдаланишга алоҳида эътибор қаратилди. <br /><br />Шунингдек, мамлакатимизда биринчи марта шафран каби ноанъанавий экин экиш йўлга қўйилди, соя экиш кенгайди. <br /><br />Қишлоқ хўжалиги маҳсулотларининг 132 минг тоннаси қайта ишланиб, 100 миллион долларлик тайёр маҳсулот, эътибор беринг, тайёр маҳсулот экспорт қилинди. 724 минг тонна ҳўл мева четга сотилди ва бу юртимизга 856 миллион доллар валюта келтирди. Ҳолбуки, илгари минг-минг тонна турли ширин-шакар меваларимиз далада қолиб, чириб кетар, исроф бўларди, энг ёмони, увол бўлар эди. <br /><br /><strong>Пиллачиликда </strong>юқори ҳосил олишда муҳим аҳамиятга эга бўлган, аммо деярли йўқолиб бораётган анъаналар қайта тикланмоқда. Энг муҳими, қимматбаҳо хомашё бўлган ипак етиштиришнинг мутлақо янги тизими йўлга қўйилди. Ушбу соҳада ишларни мутлақо янги асосда йўлга қўйиш мақсадида “Ўзбекипаксаноат” уюшмаси ташкил этилди. Бу йил мамлакатимизда <strong>биринчи марта пилладан йилига икки марта ҳосил олиш тажрибаси синовдан ўтказилди ва ижобий натижа берди.</strong> <br /><br />Ҳар бир вилоятда пилла хомашёсини қайта ишлаб, тайёр маҳсулот олиш мақсадида <strong>тўғридан-тўғри чет эл инвестициялари жалб қилинмоқда.</strong> Натижада шу йилнинг ўзида ипакни қайта ишлашга ихтисослашган 10 дан ортиқ янги корхона ишга туширилди. <br /><br />Кейинги йилларда <strong>чорвачилик тармоғини ривожлантириш </strong>дастурлари доирасида балиқ, асал етиштириладиган, парранда, эчки, қорамол боқиладиган кўплаб хўжаликлар фаолияти йўлга қўйилди. <br /><br />Яна бир муҳим, аммо кейинги йилларда эътиборимиздан четда қолиб кетган масала ҳақида алоҳида тўхталиб ўтмоқчиман. Ҳозирги кунда мамлакатимизда <strong>йилқичилик тармоғи бўйича 15 та насл хўжалиги</strong> фаолият кўрсатмоқда. Уларда 3 минг 150 дан зиёд зотдор от боқилмоқда. <br /><br /><strong>Зотдор қорабайир отларини кўпайтириш ва от спортини ривожлантириш</strong> мақсадида Қашқадарё вилоятининг Яккабоғ туманида янги йилқичилик комплекси ташкил этилди. Тошкент вилоятида ва юртимизнинг бошқа ҳудудларида ҳам бундай мажмуалар барпо этилмоқда. <br /><br />Умуман олганда, ота-боболаримиз ардоқлаб, парваришлаб келган, яхши ва ёмон кунларида дўст билган қорабайир отларни миллатимизнинг ғурури, десак, арзийди. Фарзандларимиз қалбида мардлик, жасурлик, она юртга садоқат фазилатларини шакллантиришда ундан тўғри фойдалансак, ўйлайманки, нур устига нур бўлади. <br /><br />Охирги 20 йилда эътибордан четда қолган яна бир тармоқ –<strong> балиқчилик соҳасини</strong> тиклаш учун “Ўзбекбалиқсаноат” уюшмаси ташкил этилди. Унинг тизимига 3 минг 600 та балиқчилик хўжалиги киритилди. Жорий йилда 580 минг гектар майдондаги табиий ва 28 минг гектар сунъий кўлларда 100 минг тоннадан ортиқ балиқ етиштирилди. <br /><br />Вьетнам ва Хитой технологияси асосида интенсив усулда балиқ етиштириш, уни кўпайтириш, балиқ озуқаси ишлаб чиқариш борасида ушбу мамлакатлар билан яқин ҳамкорлик йўлга қўйилди. <br /><br />Яна бир муҳим йўналиш –<strong> асаларичилик соҳасини </strong>ривожлантириш мақсадида Ўзбекистон асаларичилар уюшмаси ташкил этилиб, унга асал етиштирадиган 14 мингдан ортиқ тадбиркор аъзо бўлиб кирди. <br /><br />Бундай салмоқли ютуқлар ҳақида гапирганда, сиз, азиз фермер ва деҳқонлар, барча миришкорларнинг фидокорона меҳнатингизни, шу соҳа ривожига умрини, бутун ҳаётини бағишлаган инсонлар номларини фахр билан тилга оламиз. <br /><br />Айниқса, Ўзбекистон Қаҳрамонлари Азим Латипов, Аваз Эргашев, Анорбой Эшматов, Парда Зиёдов, Сарсенбай Сейтназаров, Дўстмурод Абдуллаев, Исахон Баҳромов, Сиёсатхон Абдуллаева, Аваз Ҳосилов, Гулмат Ҳайитметов, Шарифбой Ражабов, Аҳмад Нарзуллаев, Абдумурод Бозоров, Абдурайим Ҳомидов, Патилахон Эргашева, Халчахон Мирзаева, Тўра Нарзиев каби фидойи юртдошларимиз ҳақида ҳар қанча гапирсак арзийди. <br /><br />Сизларга яхши маълумки, ҳозирги кунда фермер хўжаликлари ва умуман, қишлоқ хўжалиги соҳаси давлатимиз томонидан ҳар томонлама қўллаб-қувватланиб, уларга барча зарур шароит ва имкониятлар яратиб берилмоқда. <br /><br />Мамлакатимизда ирригация ва мелиорация тадбирларининг барча харажатлари тўлиқ давлат бюджети ҳисобидан қопланмоқда. Бу қишлоқ хўжалиги экинларидан мўл ҳосил олишда муҳим омил бўлмоқда. <br /><br />Қишлоқ хўжалиги экин майдонларини сув билан кафолатли таъминлаш мақсадида ҳар йили давлат бюджетидан 2 триллион сўмдан ортиқ, суғориладиган ерларнинг мелиоратив ҳолатини яхшилаш учун 400 миллиард сўмдан зиёд маблағ ажратилмоқда. <br /><br />Ҳосилдорлиги паст ерларда давлат эҳтиёжлари учун пахта етиштирадиган фермер хўжаликларини молиявий қўллаб-қувватлаш мақсадида давлат бюджетидан маблағ ажратиш ҳажми йилдан-йилга ортиб бормоқда. Агар 2008 йилда ушбу мақсадлар учун 80 миллиард сўм маблағ йўналтирилган бўлса, жорий йилда бу кўрсаткич 300 миллиард сўмни ташкил этди. <br /><br />Йил давомида қилинган машаққатли меҳнат, агротехник тадбирларнинг ўз муддатида ва сифатли ўтказилиши натижасида гектаридан ўртача 50 центнердан зиёд ҳосил олган фермерлар 1 минг 121 тани, 45 центнерлик маррани эгаллаган фермерларимиз 2 минг 130 тани, 40 центнерчилар 7 минг 208 тани ташкил этди. Бу пахтачилик бўйича ўз тажриба мактабини яратаётган фермерлар кўпайиб бораётганидан далолат беради. <br /><br />Жорий мавсумда Амударё, Булоқбоши, Пахтаобод, Вобкент, Бухоро, Миришкор, Нишон, Қизилтепа, Мингбулоқ, Каттақўрғон, Нарпай, Жарқўрғон, Юқоричирчиқ, Боғот, Хонқа, Қўшкўпир туманларида пахтадан мўл ҳосил олинди. <br /><br />Пахта етиштиришда юқори ҳосилдорликка эришган Амударё туманидаги “Амударё соҳили” фермер хўжалиги раҳбари Исломбек Маткаримов, Миришкор туманидаги “Турдиали бобо” фермер хўжалиги раҳбари Абдувоҳид Бегалиев, Пешку туманидаги “Фаттоев” фермер хўжалиги раҳбари Ёқуб Фаттоев каби фермерлар фаолияти таҳсинга сазовордир. <br /><br />Ғаллачилик бўйича эришган ютуқларимизда Беруний, Олтинкўл, Қўрғонтепа, Дўстлик, Ромитан, Пешку, Шаҳрисабз, Норин, Иштихон, Пискент, Олтиариқ, Учкўприк, Қува туманлари фермерлари ўрнак ва намуна бўлдилар. <br /><br />Энг асосийси, бу йил етиштирилган ғалланинг 5 миллион 200 минг тоннадан ортиғи фермер ва деҳқон хўжаликлари ҳамда аҳоли ихтиёрида қолдирилди. Буларнинг барчаси деҳқонларимизнинг омборлари донга, рўзғорлари қут-баракага тўлиб бораётгани, улар ўз меҳнатидан катта манфаат кўраётгани, халқимиз ибораси билан айтганда, том маънода уларнинг косаси оқараётганининг амалий далили, десак, айни ҳақиқатни айтган бўламиз. <br /><br />Сув ресурслари чекланган минтақамизда деҳқончилик қилиш, мўл ва сифатли ҳосил олиш қанчалар оғир ва машаққатли эканини сиз, шу соҳанинг моҳир усталари жуда яхши биласиз. Шунинг учун <strong>сувни тежайдиган </strong>технологияларни жорий этишга қаратилган тадбирлар қўллаб-қувватланиб, бунинг ташаббускори бўлган хўжалик ва ташкилотларга қўшимча имтиёз ва преференциялар яратиб берилмоқда. Натижада бугунги кунда қарийб 240 минг гектар майдонда ана шундай технологиялар, жумладан, 28 минг гектар ерда томчилатиб суғориш технологияси жорий қилинди. <br /><br />2017 йилнинг ўзида қишлоқ хўжалиги соҳасига оид 5 та қонун, 20 дан ортиқ фармон ва қарор қабул қилинди, 2 та янги қўмита ва 3 та уюшма тузилди. Қишлоқ ва сув хўжалиги вазирлиги фаолияти тубдан такомиллаштирилди. <br /><br />Қишлоқ туманларида ҳокимларнинг қишлоқ ва сув хўжалиги масалалари бўйича ўринбосари лавозими жорий қилинди. Ўзбекистон Фермерлари кенгаши Ўзбекистон Фермер, деҳқон хўжаликлари ва томорқа ер эгалари кенгаши сифатида қайта ташкил этилди. <br /><br />Энди ана шундай ўзгаришлар амалий натижа ва самара бериши учун барчамиз бор куч ва имкониятларимизни сафарбар этишимиз керак. <br /><br />Қадрли дўстлар! <br /><br />Шу ўринда мен бир фикрни алоҳида таъкидлашни истардим. <br /><br />Фермер ва деҳқонларимиз қишлоқ хўжалигида асосий куч бўлиб, нафақат мазкур соҳани, балки бутун мамлакатимиз тараққиётини юксалтириш, халқимизнинг турмуш даражасини ошириш, юртимизни ҳар жиҳатдан обод ва фаровон қилишда беқиёс ишларни амалга ошираётганини бугун фахр ва ғурур билан, миннатдорлик билан қайд этамиз. <br /><br />Ўзбек деҳқонлари она заминимизга, муқаддас тупроғимизга энг садоқатли, элу юрт тақдири учун чинакам фидойи инсонлардир. Уларнинг бундай фазилатларидан барчамиз ўрнак олсак арзийди. <br /><br />Азиз фермерлар, деҳқон ва миришкорлар! <br /><br />Қишлоқ хўжалиги соҳасида эришаётган ютуқ ва натижаларимиз ҳақида яна кўп гапиришимиз мумкин. <strong>Лекин ютуқларга маҳлиё бўлиб ўтириш, хотиржамликка берилиш бизга ярашмайди.</strong>Чунки қишлоқ хўжалиги соҳасида ҳали ишга солинмаган имкониятлар, ўз ечимини кутаётган муаммо ва камчиликлар ҳам жуда кўплигини барчамиз яхши биламиз. <br /><br /><strong>Ўзбекистонни 2017-2021 йилларда янада ривожлантириш бўйича Ҳаракатлар стратегиясида </strong>барча соҳалар қатори қишлоқ хўжалигини ҳам модернизация қилиш борасида энг муҳим вазифаларни аниқ белгилаб, уларни изчил амалга ошириб бораётганимиз соҳадаги улкан муваффақиятларга асос бўлиб хизмат қилмоқда. <br /><br />Бугун сизлар билан <strong>ана шу масалалар ҳақида очиқ-ойдин гаплашиб, уларни ечиш йўлларини аниқ белгилаб олсак, </strong>ўйлайманки, айни муддао бўлади. Бу келгуси йилда қишлоқ хўжалигининг барча тармоқларида янада юксак натижаларга эришишимиз учун пухта замин яратади. <br /><br /><strong>Биринчидан, ердан унумли фойдаланиш ва уни талон-тарож қилишнинг олдини олиш – энг муҳим вазифалардан биридир.</strong> <br /><br />Мамлакатимизда суғориладиган ерлар атиги 3 миллион 300 минг гектар бўлиб, уни кўпайтиришнинг ҳеч иложи йўқ. Чунки бизда сув ресурслари чекланган. Аҳолимиз эса йилдан-йилга кўпайиб бормоқда. <br /><br />Жойларда қатъий назорат йўқлиги оқибатида суғориладиган ерларни фермерлар ва бошқа мутасадди раҳбарлар томонидан сотиш, ўзбошимчалик билан эгаллаб олиш ва талон-тарож қилиш ҳолатлари, афсуски, давом этмоқда. <br /><br />Жорий йилнинг ўзида 20 дан ортиқ туманда, жумладан, Бўз, Ангор, Навбаҳор, Жомбой, Оҳангарон ва бошқа туманларда суғориладиган ерлар фуқаролар томонидан ўзбошимчалик билан эгаллаб олинган. Бундай нохуш ҳолатларни деярли барча вилоятларда кузатиш мумкин. <br /><br />Ҳозирги кунда мамлакатимиздаги мавжуд 700 минг гектарга яқин лалми ернинг бор-йўғи 300 минг гектарига ғалла ва мойли экинлар экилмоқда. <br /><br />Қани, айтинглар, қолган 400 минг гектар ердан нега фойдаланмаймиз? <br /><br />Бундай майдонларни ўзлаштириш, уларни мунтазам равишда деҳқончилик экинлари экиладиган ерларга айлантириш осон бўлмайди, деб ўтирсак, ўтираверамиз. <br /><br />Ҳолбуки, бугунги вазият барчамиздан ташаббус кўрсатиб, жаҳондаги илғор тажрибаларни чуқур ўрганиш, фидойилик билан меҳнат қилишни талаб этмоқда. <br /><br />Бундай эзгу ишга қўл урган фермер ва деҳқонларимизга биз ҳар томонлама кўмак беришга тайёрмиз. <br /><br />Ўзингизга маълум, <strong>ҳар қарич ер – давлатнинг, демакки, халқимизнинг бебаҳо бойлиги ҳисобланади.</strong> Ундан ноқонуний, ўзбошимчалик билан фойдаланишга ҳеч кимнинг ҳаққи йўқ. Афсуски, ана шу оддий ҳақиқатни тушуниб етмаган ёки тушунишни ва унга амал қилишни истамаётганлар ҳамон учраб турибди. <br /><br />“Ергеодезкадастр” қўмитаси томонидан ўтказилган ўрганишлар натижасида жорий йилда 3 минг 600 га яқин фермер хўжалиги <strong>ғалла ва пахтани шартномада қайд этилганига нисбатан 19 минг гектар ерга кам эккани аниқланган.</strong> 833 та фермер хўжалиги эса 13 минг гектар ерда пахта ва ғалла етиштириш бўйича шартнома тузган бўлса-да, амалда бу экинларни умуман экмаган. <br /><br />Унумдор ерларни сотаётган, ноқонуний тарзда уй-жой қуриб олаётган, шартномада кўзда тутилган экинларни экишдан бўйин товлаётган фермерларга нисбатан қатъий чоралар кўрадиган ва қонуний баҳо берадиган вақт келди. <br /><br />Шунинг учун Бош вазир ўринбосари, қишлоқ ва сув хўжалиги вазири Зойир Мирзаев, мутасадди идоралар ва вилоятлар ҳокимлари бир ой муддатда ана шундай муаммоларни тўлиқ бартараф этиш юзасидан аниқ чора-тадбирлар ишлаб чиқиб, кўриб чиқиш учун тақдим этиши зарур. <br /><br /><strong>Иккинчидан, суғориш иншоотлари эскириб, тармоқлар яроқсиз ҳолга келиб қолгани оқибатида 830 минг гектар ерни суғоришда қийинчиликлар юзага келмоқда.</strong> <br /><br />Бундан ташқари, 1 миллион 300 минг гектар суғориладиган ернинг мелиоратив ҳолатини яхшилаш, 18 минг километр коллектор ва дренаж тармоқларини босқичма-босқич тозалаш лозим. Шунингдек, 103 та йирик, 720 та ўрта ва кичик сув иншоотлари янгилаш ва таъмирлашга муҳтож. <br /><br />2017-2018 йилларда бу тадбирлар учун давлат бюджетидан 1,5 триллион сўм, халқаро молия институтларининг 150 миллион доллар маблағини йўналтириш режалаштирилган. Бироқ шуларнинг ўзи билан соҳадаги мавжуд муаммоларни тўлиқ ҳал этиб бўлмайди. <br /><br />Шунинг учун Бош вазир ўринбосарлари Зойир Мирзаев ва Жамшид Қўчқоров бир ҳафта муддатда давлат бюджетидан ушбу мақсадлар учун қўшимча маблағ ажратиш ва халқаро молия институтларининг мазкур лойиҳаларда янада кенгроқ иштирок этишини таъминлаш бўйича аниқ таклифлар киритиши лозим. <br /><br />Мамлакатимизда <strong>ер ресурсларидан самарали фойдаланиш </strong>борасида ҳам кўплаб ишларни амалга оширишимиз зарур. Бу борада <strong>сув омборлари тармоғини кенгайтириш</strong> ҳисобидан лалми ерларни ўзлаштириш масаласига алоҳида эътибор қаратиш керак. <br /><br />2018-2019 йиллар давомида Тошкент вилоятида жами 44 миллион куб метр сув йиғиладиган “Паркентсой”, “Қизилсой”, “Тоштепа” сув омборлари қурилади. Шу тариқа Паркент ва Оҳангарон туманларида 5 минг гектар лалми ерларни ўзлаштириш имконияти яратилади. <br /><br />Жиззах вилоятининг Фориш туманида “Караман” сув омбори ишга туширилгач, 20 минг гектар ер ўзлаштирилади. <br /><br />Қашқадарё вилоятида “Гулдара”, “Аяқчисой”, Самарқанд вилоятида “Булунғур” сув омборларини қурсак, бу қўшимча равишда 2 минг гектар экин майдонларини ўзлаштириш, 2 минг 300 гектар ерда сув таъминотини яхшилаш имконини беради. <br /><br />Навоий вилоятидаги “Сентобсой”, Наманган вилоятидаги “Қорасув”, “Ертикан”, “Уйчи” сув омборлари қарийб 2 баробар кенгайтирилади. <br /><br />2018-2019 йилларда ирригация тармоқларини ривожлантириш ва суғориладиган ерларнинг мелиоратив ҳолатини яхшилаш бўйича давлат дастурига мувофиқ, келгуси икки йилда 1 минг 86 километр узунликдаги каналлар бетонлаштирилиб, 661 километр лотоклар янгидан бунёд этилади. Шунингдек, 109 та йирик гидротехник иншоотлар қурилади ва янги насос станциялари ўрнатилади. <br /><br />Ана шу тадбирларни амалга ошириш натижасида 1 миллион 200 минг гектар ернинг сув таъминоти яхшиланади. <br /><br />Энг асосийси, йилига 1 миллиард 700 миллион куб метр сув тежалади ва 600 минг гектар ернинг мелиоратив ҳолати яхшиланади. <br /><br />Ҳаммамиз яхши тушунамиз, <strong>“Ерни боқсанг, ер ҳам сени боқади”</strong>, деган мақол бежиз айтилмаган. Соҳада катта натижага эришмоқчи бўлсак, биринчи навбатда ризқ-рўзимиз манбаи бўлган ерни боқишимиз, тупроқ унумдорлигини оширишимиз керак. <br /><br /><strong>Учинчидан, аҳолини сифатли гўшт, сут, тухум ва балиқ маҳсулотлари билан етарлича таъминлаш – энг асосий вазифаларимиздандир. </strong><br /><br />Бунга эришиш учун қуйидаги масалаларга алоҳида эътибор қаратишимиз зарур. 2018-2019 йилларда банк кредитлари ҳисобидан 145 та лойиҳа доирасида қўшимча 35 минг бош зотдор қорамол боқиш йўлга қўйилади. Умумий қиймати 280 миллиард сўм бўлган 80 та лойиҳа асосида қўшимча 3 миллион 200 минг бош парранда боқишга мўлжалланган хўжаликларни ташкил этиш керак. Шунинг ҳисобидан 2018 йилда тухум етиштиришни 10 фоизга ошириб, унинг умумий ҳажмини 7 миллиард 800 миллион донага етказиш имкони юзага келади. <br /><br />Келгуси йилда балиқ етиштиришни 150 минг тоннага етказиш мақсадида 215 миллиард сўмлик 280 та лойиҳа амалга оширилади, 1 минг 650 гектар сунъий сув ҳавзалари ташкил этилади. 25 та сув омборида Вьетнам тажрибаси асосида 13 минг тонна, 37 минг гектар шолизорда қарийб 15 минг тонна балиқ етиштириш бўйича чора-тадбирлар кўрилмоқда. <br /><br />Қорақалпоғистон Республикаси, Самарқанд, Сурхондарё, Андижон ва Наманган вилоятларида Индонезиядан келтириладиган 380 минг дона сермаҳсул балиқ чавоғини ушбу мамлакат мутахассислари билан ҳамкорликда маҳаллий иқлимга мослаштириш лозим. <br /><br /><strong>Тўртинчидан, мева-сабзавот етиштиришни янада кўпайтириш, уни сифатли тарзда аҳолига етказиш ва экспорт қилиш ишлари, афсуски, етарли даражада эмас.</strong> <br /><br />Бугунги кунда юртимизда етиштирилаётган мева-сабзавотнинг атиги 15 фоизи қайта ишланиб, 8 фоизи экспорт қилинмоқда, холос. Айниқса, Сирдарё, Жиззах, Хоразм, Қашқадарё ва Тошкент вилоятларида бу кўрсаткичлар ҳамон пастлигича қолмоқда. <br /><br />Жорий йилда 860 минг тонна ёки 620 миллион долларлик мева-сабзавот экспорт қилингани бизнинг имконият ва салоҳиятимизга мосми? Йўқ, албатта! <br /><br />Ривожланган давлатлар тажрибаси асосида боғлар ва токзорларга ишлов берадиган, сабзавот ва картошка уруғларини экадиган ва йиғиштириб оладиган техникалар мавжуд эмас, фермер, деҳқон хўжаликларига ёқилғи-мойлаш маҳсулотлари, минерал ўғитлар, уруғлик етказиб бериш, касаллик ва зараркунандаларга қарши кураш ишлари талаб даражасида ташкил этилмаган. Бу ҳам ҳақиқат. <br /><br />Бош вазир ўринбосарлари Нодир Отажонов, Зойир Мирзаев бир ой муддатда ҳар бир вилоят ва туманда мева-сабзавот етиштиришни кўпайтириш, уни қайта ишлаш ва экспорт ҳажмини ошириш бўйича аниқ чора-тадбирларни ишлаб чиқиб, амалга оширишлари керак. <br /><br /><strong>Бешинчидан, </strong>республикамиз бўйича<strong> 445 минг гектар энг унумдор ер аҳолига томорқа сифатида берилган.</strong> <br /><br />Лекин томорқадан фойдаланиш талаб даражасида эмас. Бу йўналишдаги ишларни мувофиқлаштириш ва назорат қилиш тизими йўқ, десак, айни ҳақиқатни айтган бўламиз. <br /><br />Соҳада назоратни таъминлаш, томорқа эгаларини ҳар томонлама қўллаб-қувватлаш мақсадида Ўзбекистон фермер, деҳқон хўжаликлари ва томорқа ер эгалари кенгашига қатор ваколатлар берилди. <br /><br />Вазирлар Маҳкамаси (З.Мирзаев), Ўзбекистон фермер, деҳқон хўжаликлари ва томорқа ер эгалари кенгаши (Б.Юсупов), Касаба уюшмалари федерацияси (Қ.Рафиқов), “Ергеодезкадастр” давлат қўмитаси (А.Абдуллаев), “Маҳалла” жамғармаси (Ш.Жавлонов), Хотин-қизлар қўмитаси (Т.Норбоева) ва ҳудудлардаги секторлар раҳбарлари уйма-уй юриб, аҳолига томорқадан самарали фойдаланиш юзасидан зарур тавсия ва амалий ёрдам бериш механизмини ишлаб чиқиб, амалга ошириши лозим.<br /><br />Бу ишларни самарали йўлга қўйиш натижасида томорқалардан мева, сабзавот, картошка, кўкат, дуккакли ва бошқа маҳсулотлар етиштириш имкониятлари янада кенгаяди. <br /><br />Шунингдек, аҳоли томорқаларида цитрус мевалар етиштиришга мўлжалланган ихчам иссиқхоналар барпо қилиш, ёнғоқ, унаби ва бошқа кўчатлар етиштиришни ташкил этиш лозим. <br /><br /><strong>Олтинчидан, </strong>ҳозирги пайтда мамлакатимиздаги 146 минг 295 та қишлоқ хўжалиги <strong>техникасининг 38 фоизи аллақачон ўз умрини ўтаб бўлган, яъни бутунлай эскирган.</strong> <br /><br />Айниқса, мева ва сабзавотчиликка ихтисослашган туманлар боғ ва токзорларга ишлов бериш, сабзавот экиш, парваришлаш ва йиғиб олишга мўлжалланган техникалар билан бор-йўғи 34 фоиз таъминланган, холос. Бу меҳнат унумдорлиги ва ҳосилдорликнинг пасайиб кетишига сабаб бўлмоқда. <br /><br />Айни пайтда мамлакатимиз бўйича 16 минг 495 та қишлоқ хўжалиги техникаси етишмаслиги аниқланган. Бунинг оқибатида белгиланган агротехник тадбирларни ўз вақтида ва сифатли амалга оширишнинг имкони бўлмаяпти ва шунинг учун пировард натижада кутилган самарага эришилмаяпти. <br /><br />Бош вазир ўринбосарлари Зойир Мирзаев, Жамшид Қўчқоров ва Нодир Отажоновга қишлоқ хўжалиги техникасини юртимизда ишлаб чиқаришни йўлга қўйиш, зарур ҳолларда уларни хорижий давлатлардан сотиб олиш учун молиявий манбаларни аниқлаш масалаларини ҳал этиш бўйича жорий йил 20 декабрга қадар аниқ ва амалий таклифлар киритиш вазифаси топширилади. <br /><br /><strong>Еттинчидан, қишлоқ хўжалиги соҳасини ривожлантиришда илм-фан ҳаёт талабларидан орқада қолаётгани жиддий муаммолардан биридир. </strong><br /><br />Қишлоқ ва сув хўжалиги вазирлигига қарашли<strong> илмий-тадқиқот институтларининг </strong>аграр фан ва селекцияни ривожлантириш, илғор агротехнологияларни ишлаб чиқиш ва амалиётга жорий этиш, <strong>ҳар бир ҳудудда тупроқ ва иқлим шароитига мос экин навларини яратиш ва жойлаштириш</strong>борасидаги ўрни ва ролини кескин ошириш лозим. <br /><br />Ҳозирги кунда ана шу илмий муассасаларнинг моддий-техник базаси замонавий тадқиқотларни амалга ошириш имконини бермайди. Илмий-тадқиқот ишлари ҳамон эскича усулларда олиб борилаётгани ҳам ҳақиқат. <br /><br />Соҳада замонавий илм-фан ютуқларини пухта ўзлаштирган кадрлар етишмаётганини ҳам тан олишимиз керак. Айниқса, чорвачилик, паррандачилик ва балиқчилик соҳаларида ветеринар мутахассисларга эҳтиёж катта. <br /><br />Чорва молларининг зотини яхшилаш, паррандаларда касалликларни эрта аниқлаш ва даволаш бўйича илмий изланишлар деярли олиб борилмаяпти. <br /><br />Яқин вақтгача чорвачилик соҳасида етакчи бўлиб келган юртимизда бугун зотдор молларни фақат четдан олиб келиш билан чекланиб қолаётганимизни нима билан изоҳлаш мумкин? <br /><br /><strong>Бундай эътиборсизлик ва соҳанинг эртанги ривожини ўйламасликни ҳеч нарса билан оқлаб бўлмайди.</strong> <br /><br />Ана шу ҳолатларнинг барчасини инобатга олиб, соҳага илмий ёндашувни ташкил этиш ва малакали кадрлар тайёрлаш тизимиин йўлга қўйиш мақсадида юртимизда<strong> Ветеринария институтини ташкил </strong>этишнинг фурсати келди, деб ҳисоблайман. <br /><br />Яна бир муҳим масала, яъни йилига мамлакатимизда етиштирилаётган 12 миллион донадан зиёд терини йиғиш, уни чуқур қайта ишлаш, айниқса, дунёга машҳур қоракўл теридан юқори сифатли, рақобатдош маҳсулот тайёрлаш бўйича ишларимиз ҳам талаб даражасида эмас. <br /><br />Бош вазир ўринбосари Зойир Мирзаев тегишли вазирлик ва идоралар билан биргаликда икки ой муддатда “Ўзбекчармпойабзали” уюшмаси фаолиятини тубдан қайта кўриб чиқиб, тизимни такомиллаштириш, бу борадаги экспорт кўрсаткичини 150 миллион доллардан камида 300 миллион долларга ошириш бўйича қарор лойиҳасини тайёрлаши зарур. <br /><br />Хабарингиз бор, биз яқинда ривожланган давлатлар тажрибасидан келиб чиқиб, ҳаётимизга янги инновацион технологиялар жорий этиш кўламини янада кенгайтириш мақсадида <strong>Инновацияларни ривожлантириш вазирлигини ташкил этдик.</strong> Ушбу вазирлик бу борада алоҳида дастур ишлаб чиқиб, қишлоқ хўжалиги соҳасига илғор технологияларни жорий этиш чора-тадбирларини амалга ошириши ғоят муҳим масаладир. <br /><br />Академик Маҳмуд Мирзаев номидаги Боғдорчилик, узумчилик ва виночилик илмий-тадқиқот институти фаолиятини чуқур таҳлил қилган ҳолда, узумнинг саноатбоп навлари, лимон ва мевали дарахт кўчатлари етиштириш – ҳозирги давр талабидир. Афсуски, ушбу институтнинг айни пайтдаги ҳолати бугунги мезон ва талабга мутлақо жавоб бермайди. <br /><br />Дон ва дуккакли экинлар илмий-тадқиқот институтининг Ғаллаорол илмий-тажриба станцияси негизида Лалмикор деҳқончилик институтини ташкил этишни замоннинг ўзи тақозо этмоқда. Бундай илмий-тадқиқот маркази лалми ерлардан самарали фойдаланиш бўйича замонавий илмий изланишларни янада кенгайтириш имконини яратади. <br /><br />Мамлакатимизда паррандачиликни ривожлантириш, жумладан, курка, бедана, ғоз, ўрдак ва туяқуш парваришлашни илмий асосда йўлга қўйиш мақсадида <strong>Паррандачилик илмий маркази</strong>ни ташкил этиш зарур, деб ўйлайман. <br /><br />Халқимизни энг кўп истеъмол қилинадиган озиқ-овқат турларидан бири бўлган <strong>картошка </strong>билан тўла таъминлаш учун бизга йилига ўртача 50 минг тонна сифатли картошка уруғи керак бўлади. Бунинг учун Голландия, Польша, Россия каби давлатлар билан ҳамкорликда замонавий лаборатория ускуналарига эга бўлган<strong> маҳаллий уруғчилик маркази ва махсус корхоналар</strong> ташкил этишимиз керак. <br /><br /><strong>Саккизинчидан, фермер хўжаликларида ҳар қарич ердан унумли фойдаланиш, даромад ҳажмини ошириш</strong> масаласига ҳам алоҳида аҳамият қаратишимиз зарур. <br /><br />Шу мақсадда мавжуд 2 миллион 626 минг гектар майдоннинг умумий узунлиги 385 минг километр бўлган чекка қисмларида сабзавот ва полиз экинлари экишни йўлга қўйиш орқали 415 минг тонна қўшимча маҳсулот етиштиришга эришиш мумкин. <br /><br />Оддий ҳисоб-китоблар шуни кўрсатмоқдаки, ҳозирги вақтда ҳар бир фермер хўжалиги даласида бир бошдан, жами 14 минг соғин сигир, 21 минг 125 фермер хўжалигининг ҳар бирида 50 бошдан, жами 1 миллион 57 минг парранда, 66 минг фермер хўжалигининг дала четларида 329 минг қути асалари боқиш ҳисобидан 7 минг 200 тонна асал етиштиришни йўлга қўйиш мумкин. <br /><br />Юзаки қараганда, бу оддий гапга ўхшайди. Агар масалага жиддий ёндашиб, ҳар бир рақам замиридаги маънони теран англаб етсак, булар деҳқонларимиз учун қўшимча даромад манбаи экани маълум бўлади. <br /><br />Келгуси йилда алоҳида эътибор қаратилиши лозим бўлган яна бир муҳим йўналиш – бу суғориш ва коллектор-дренаж тармоқлари бўйларида, йирик гидротехник иншоотлар атрофидаги майдонлар ва дала четларида оддий ва арзон усулларда 30 мингдан зиёд <strong>ихчам иссиқхоналар</strong> ташкил этишдан иборат. <br /><br /><strong>Тўққизинчидан, пахта ва ғалла экилаётган паст рентабелли майдонларни йилдан-йилга қисқартириб, уларнинг ўрнига интенсив боғлар, ёнғоқзор ва токзорлар барпо этиш, шунингдек, сердаромад бўлган соя, қалампир ва кўкатлар экиш режалаштирилган.</strong> <br /><br />Мамлакатимизда рапс етиштиришни кенгайтиришга ҳам алоҳида эътибор қаратилмоқда. <br /><br />Шу билан бирга, енгил саноат корхоналарини сифатли тола билан таъминлаш ҳақида ҳам жиддий ўйлашимиз керак. 2018 йилда мамлакатимизда етиштирилаётган 1 миллион 200 минг тонна пахта толасини юртимизда тўлиқ қайта ишлаб, хорижга фақат тайёр маҳсулотлар экспорт қилишни йўлга қўйишимиз зарур. <br /><br />Навоий вилоятининг Қизилтепа туманида амалда қўлланган – пахтани етиштиришдан тортиб, ундан тайёр маҳсулот ишлаб чиқаришгача бўлган босқичларни ўз ичига қамраб олган <strong>кластер </strong>усулига биз Ўзбекистон пахтачилигининг келажаги сифатида қарамоқдамиз. <br /><br />Бу истиқболли тажрибани кенг ёйиш мақсадида мамлакатимиздаги ўттиздан зиёд енгил саноат корхонасига тўрт юз минг гектардан кўпроқ пахта майдонлари бириктириб берилади. <br /><br />Ўзбекистон Республикаси Бош вазири Абдулла Нигматович Ариповга тегишли комплекс раҳбарлари, Иқтисодиёт ва Молия вазирликлари, Давлат солиқ қўмитаси билан биргаликда бу масала бўйича қарор лойиҳасини 15 кун муддатда ишлаб чиқиш, вилоят ҳокимларига лойиҳа ташаббускорлари учун барча зарур шароитни яратиб бериш вазифаси топширилади. <br /><br />Қолган пахта майдонларида ҳосилдорликни ошириш ва ердан самарали фойдаланиш мақсадида чигитни “қўшқатор” ва “олтмишлик” схемаси асосида экишни йўлга қўйиш ва самарасиз бўлган “тўқсонлик” схемадан босқичма-босқич воз кечиш керак. Шунингдек, хитойлик олимлар билан ҳамкорликда Фарғона, Андижон ва Наманган вилоятларида ғўза парваришини замонавий технологиялар асосида олиб боришимиз зарур. Сурхондарё, Самарқанд ва бошқа вилоятларда томчилатиб суғориш технологияларини кенг жорий этишимиз лозим. <br /><br />Ҳурматли йиғилиш иштирокчилари! <br /><br />Бугунги кунда олдимизда турган энг асосий муаммолардан бири бу – республикамиз қишлоқ хўжалигида илм ва амалиётнинг бир-биридан узоқлашгани, аксарият ҳолларда узилиб қолганидир. <br /><br />Бир ҳақиқат барчамизга яхши маълум: <strong>илм ва изланиш бўлмаган жойда ҳеч қандай ривожланиш, юксалиш ва, умуман, бирор-бир соҳанинг келажаги бўлмайди.</strong> <br /><br />Афсуски, кейинги 20 йил мобайнида биз аграр тармоқни илм-фан ютуқлари асосида ривожлантиришга етарлича эътибор бермадик, эътиборсизлигимиз туфайли мавжуд илмий-текшириш институтлари молиявий муаммолар гирдобига, ночор аҳволга тушиб қолди, таъбир жоиз бўлса, “чалажон” бўлиб қолди. <br /><br />Қишлоқ ва сув хўжалиги вазирлиги ҳузуридаги Ўзбекистон қишлоқ хўжалиги илмий-ишлаб чиқариш маркази (собиқ Ўзбекистон қишлоқ хўжалиги фанлари академияси) таркибида айни пайтда 11 та илмий- тадқиқот институти ва 44 та илмий-тажриба станцияси мавжуд. <br /><br />Бундан ташқари, бевосита Қишлоқ ва сув хўжалиги вазирлиги тизимида 4 та олий таълим муассасаси ва уларнинг 3 та филиали, шунингдек, 132 та касб-ҳунар коллежи фаолият кўрсатмоқда. Лекин Тошкент давлат аграр университети, Тошкент ирригация ва қишлоқ хўжалигини механизациялаш муҳандислари институти, Андижон ва Самарқанд қишлоқ хўжалиги институтларининг илмий салоҳияти ва кадрлар тайёрлашдаги мавқеи йилдан-йилга пасайиб бормоқда. Агар ўтган асрнинг 80-90 йиллари билан солиштирадиган бўлсак, ушбу олий таълим муассасаларида илмий, педагогик ва амалий тажриба борасида салоҳият кескин пасайиб кетган. <br /><br />Қишлоқ хўжалигида аниқ мезонлар асосида кадрлар тайёрлашнинг ягона тизими мавжуд эмас. Бунга вазирлик ва олий таълим даргоҳлари раҳбарлари ҳам умуман эътибор қаратмаяпти, десак, айни ҳақиқатни айтган бўламиз. <br /><br />Бугун олий таълим муассасаси ёки коллежда ўқиётган талаба эртага қаерга ишга боради, амалиётда унинг билим ва мутахассислигига айнан қандай талаблар қўйилади, у шу талабларга жавоб берадими-йўқми – буни ҳеч ким билмайди. <br /><br />Ҳатто шу даражага бориб етдики, аудиторияда талабага бошқа нарса ўқитилади, амалиётда эса ундан умуман бошқа билим ва кўникма талаб этилади. Аграр тармоқдаги бирор-бир олий ёки ўрта махсус таълим муассасаси ишлаб чиқариш ёки амалиётнинг аниқ буюртмаси бўйича мутахассислар тайёрлаётгани йўқ ва, афсуски, бу бўйича ҳали ҳаракат ҳам бошланмаган. Шундай экан, малакали ва рақобатдош мутахассис-кадрлар тайёрлаш тўғрисида қандай гапиришимиз мумкин. <br /><br />Тошкент давлат аграр университети ва Тошкент ирригация ва қишлоқ хўжалигини механизациялаш муҳандислари институти таянч ўқув даргоҳлари ва ўқув-методик марказ сифатида белгиланган эди. Лекин ҳар иккала таълим муассасасининг раҳбарияти ҳам бу борада ўз зиммасидаги вазифани тўла уддалаётгани йўқ. Андижон ва Самарқанд қишлоқ хўжалиги институтларининг фаолиятини эса қониқарли деб бўлмайди. <br /><br />Бугунги давр шуни тақозо этмоқдаки, олий таълим муассасаси ва коллежлардаги ўқув дастурлари ишлаб чиқариш, фирма ва компанияларнинг аниқ талаб ва буюртмалари асосида тузилиши ва рақобатдош кадрларни тайёрлаб бериши керак. <br /><br />Агар талаб бўлса, олий таълим муассасаси ва коллеж мутахассис тайёрлаши керак, муайян йўналиш бўйича битираётган кадрларга эҳтиёж бўлмаса ёки кадрнинг билим савияси ва илмий даражаси паст бўлса, бундай ўқув муассасаси ёпилиши зарур. <br /><br />Бу борада бир мисол келтираман. Фарғона водийсида бир неча йиллардан буён зарарли ҳашаротлар пахта майдонларига сезиларли даражада зиён етказяпти. Лекин водийдаги бирорта ўқув даргоҳида олим ва мутахассислар бундай касалликларга қарши курашиш ҳақида жиддий бош қотираётганлари йўқ. <br /><br /><strong>Ана шундай ўткир ва ҳаётий муаммоларни ҳал этиш ва зарур ечимларни топиш мақсадида қуйидаги долзарб вазифаларни амалга ошириш талаб этилади.</strong> <br /><br /><strong>Биринчидан</strong>, кадрлар тайёрлашни тубдан яхшилаш, олий таълим муассасалари профессор-ўқитувчилари ва илмий тадқиқотчиларининг иш ҳақи миқдори, жумладан, янги ўқув йилидан бошлаб докторантлар стипендияларини сезиларли даражада ошириш бўйича Молия вазирлиги (Ж.Қўчқоров) таклиф тайёрласин. <br /><br />Шу билан бирга, соҳадаги олий таълим муассасаларида таълим даражасини ошириш учун уларни модернизация қилиш дастурини 2021 йилгача чўзмасдан, 2019 йил охирига қадар якунлаш мақсадга мувофиқ бўлади. <br /><br />Барчага маълумки, қишлоқ хўжалиги мутахассисларини магистратурада контракт асосида ўқитиш илмий кадрлар тайёрлашга жиддий тўсқинлик қилмоқда. Шунинг учун янги ўқув йилидан бошлаб қишл</p>', '2017-12-11 14:13:02', '2017-12-11 14:13:02', '2017-12-11 14:15:18', 0, 0, '7f173c630cb7d04e414d01901cf2e3dd.jpg', 'a:5:{s:9:\"showtitle\";s:1:\"1\";s:8:\"showdate\";s:1:\"1\";s:8:\"showcomm\";s:1:\"1\";s:10:\"showlatest\";s:1:\"1\";s:7:\"canrate\";s:1:\"1\";}', 1, '', 'com_content_read.php', 'Ризқ,рўзимиз,бунёдкори,бўлган,қишлоқ,хўжалиги,ходимлари,меҳнатини,улуғлаш,соҳа,ривожини,янги,босқичга,кўтариш,асосий,вазифамиздир', '<p style=\"text-align:justify\"><strong>Ўзбекистон Республикаси Президенти Шавкат Мирзиёевнинг Қишлоқ хўжалиги ходимлари кунига бағишланган тантанали маросимдаги нутқи</strong></p>\r\n', 'yangiliklar/riz-ruzimiz_bunyodkori_bulgan_ishlo_huzhaligi_hodimlari_mehnatini_ululash_soha_rivozhini_yangi_bosichga_kutarish__asosiy_vazifamizdir', '', '', 8, 'uz'),
(4, 1, 0, 1, 'Жамият хақида', '<div class=\"row clearfix\"><div class=\"column col-lg-12 col-md-12 col-sm-12 col-xs-12\"><div class=\"content\"><p style=\"text-align:justify\">«VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO»  Масъулияти чекланган жамияти улгуржи худудий базаси Узбекистон Республикаси Президентининг 2006 йил 23 февралдаги ПФ-3722-сонли Фармони хамда 2006 йил 06 мартдаги ПК-300-сонли Карори хамда Узбекистон Республикаси Вазирлар Махкамасининг 2009 йил 20 августдаги 238-сонли Карори асосида ташкил топган.</p><p style=\"text-align:justify\">Улгуржи худудий база “VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO”  Масъулияти чекланган жамияти, Наманган вилояти Янгикургон тумани хокимлиги хузуридаги Тадбиркорлик субъектларини руйхатдан утказиш инспекциясида 2012 йил  январдаги     3139–сонли реестр раками билан руйхатда турган «VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO»  Масъулияти чекланган жамиятининг хукукий вориси хисобланади хамда унинг барча хукук ва мажбуриятларини уз зиммасига олади.</p></div></div></div>', '<p style=\"text-align:justify\">«VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO»  Масъулияти чекланган жамияти улгуржи худудий базаси Узбекистон Республикаси Президентининг 2006 йил 23 февралдаги ПФ-3722-сонли Фармони хамда 2006 йил 06 мартдаги ПК-300-сонли Карори хамда Узбекистон Республикаси Вазирлар Махкамасининг 2009 йил 20 августдаги 238-сонли Карори асосида ташкил топган.</p><p style=\"text-align:justify\">Улгуржи худудий база “VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO”  Масъулияти чекланган жамияти, Наманган вилояти Янгикургон тумани хокимлиги хузуридаги Тадбиркорлик субъектларини руйхатдан утказиш инспекциясида 2012 йил  январдаги     3139–сонли реестр раками билан руйхатда турган «VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO»  Масъулияти чекланган жамиятининг хукукий вориси хисобланади хамда унинг барча хукук ва мажбуриятларини уз зиммасига олади.</p>', '2017-12-11 15:14:50', '2017-12-11 15:14:50', '2017-12-12 00:16:28', 0, 0, '', 'a:5:{s:9:\"showtitle\";s:1:\"1\";s:8:\"showdate\";s:1:\"1\";s:8:\"showcomm\";s:1:\"1\";s:10:\"showlatest\";s:1:\"1\";s:7:\"canrate\";s:1:\"1\";}', 1, '', 'com_content_read.php', 'Жамият,хақида', '<div class=\"row clearfix\">\r\n<div class=\"column col-lg-12 col-md-12 col-sm-12 col-xs-12\">\r\n<div class=\"content\">\r\n<p style=\"text-align:justify\">&laquo;VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO&raquo;&nbsp; Масъулияти чекланган жамияти улгуржи худудий базаси Узбекистон Республикаси Президентининг 2006 йил 23 февралдаги ПФ-3722-сонли Фармони хамда 2006 йил 06 мартдаги ПК-300-сонли Карори хамда Узбекистон Республикаси Вазирлар Махкамасининг 2009 йил 20 августдаги 238-сонли Карори асосида ташкил топган.</p>\r\n\r\n<p style=\"text-align:justify\">Улгуржи худудий база &ldquo;VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO&rdquo; &nbsp;Масъулияти чекланган жамияти, Наманган вилояти Янгикургон тумани хокимлиги хузуридаги Тадбиркорлик субъектларини руйхатдан утказиш инспекциясида 2012 йил &nbsp;январдаги &nbsp;&nbsp;&nbsp;&nbsp;3139&ndash;сонли реестр раками билан руйхатда турган &laquo;VODIY SAХOVATI AGRO INVEST ULGURJI SAVDO&raquo; &nbsp;Масъулияти чекланган жамиятининг хукукий вориси хисобланади хамда унинг барча хукук ва мажбуриятларини уз зиммасига олади.</p>\r\n</div>\r\n</div>\r\n</div>\r\n', 'biz_haimizda/zhamiyat_haida/zhamiyat_haida', '', '', 5, 'uz'),
(5, 1, 0, 1, 'Жиззахда умумий ҳажми 2 триллион 444 миллиард сўмлик қишлоқ хўжалиги маҳсулотлари етиштирилди', '<p style=\"text-align: justify;\"><strong>Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни муносабати билан Жиззахда ўтказилган “Ҳосил байрами” тадбирлари фаровонлик, маъмурчилик ва дастурхонимиз тўкинлиги намойиши сифатида нишонланди.</strong></p>', '<p style=\"text-align: justify;\"><strong>Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни муносабати билан Жиззахда ўтказилган “Ҳосил байрами” тадбирлари фаровонлик, маъмурчилик ва дастурхонимиз тўкинлиги намойиши сифатида нишонланди.</strong></p><p style=\"text-align: justify;\"><br />Барча туманлардан деҳқон ва фермерлар, қишлоқ ва сув хўжалиги ташкилотлари ходимлари, илмий муассасалар мутахассислари таклиф этилган байрам тадбирларида юртимизда аграр соҳа ривожига қаратилаётган доимий эътибор ҳудудларни обод этиш, бандликни таъминлаш, энг муҳими, аҳоли фаровонлигини юксалтиришга хизмат қилаётгани таъкидланди.</p><p style=\"text-align: justify;\">Бугунги кунда вилоятда 12 мингдан ортиқ фермер хўжалиги фаолият кўрсатиб, уларда 70 мингдан ортиқ ишчи меҳнат қилаётир. Уларнинг меҳнати туфайли 2017 йилнинг ўтган тўққиз ойида етиштирилган қишлоқ хўжалиги маҳсулотларининг умумий ҳажми 2 триллион 444 миллиард сўмни ташкил этди. <br />Барча тоифадаги хўжаликларда 401 минг 222 тонна сабзавот, 181 минг тоннадан ортиқ полиз, 68 минг 161 тонна мева, 500 минг 343 тонна бошоқли дон йиғиб олинди. 167 минг тоннадан зиёд пахта хирмони бунёд этилди. 30 миллион долларлик мева-сабзавот маҳсулотлари экспорт қилинди.</p><p style=\"text-align: justify;\"><br />Чорвачилик соҳасининг имкониятларини оширишга қаратилган чора-тадбирлар қорамоллар бош сонининг ўсишига, ички истеъмол бозорининг чорва маҳсулотлари билан тўлиқ таъминланишига замин яратди. Жумладан, 2017 йилнинг 1 октябрь ҳолатига кўра, йирик шохли қорамоллар сони 101, қўй-эчки 102, парранда 105 фоизга кўпайди.</p><p style=\"text-align: justify;\"><br />2017 йилнинг ўтган даврида қишлоқ ҳўжалиги соҳасида умумий қиймати 101 миллиард 947 миллион сўмлик 647 лойиҳа амалга оширилиши натижасида 1 минг 937 қўшимча иш ўрни яратилди.</p><p style=\"text-align: justify;\"><br />Фуқароларнинг шахсий ёрдамчи хўжаликларида қишлоқ хўжалиги маҳсулотларини етиштириш, қорамол, қўй, қуён боқиш ва гўшт етиштириш, паррандачилик ва асаларичиликни ривожлантириш, иссиқхоналар ташкил этиш лойиҳаларига 96 миллиард сўмга яқин банк кредитлари ажратилди.</p><p style=\"text-align: justify;\"><br />– Президентимиз ташаббуси билан амалга оширилаётган ислоҳотлар қишлоқ хўжалиги ривожини янги босқичга кўтарди, – дейди Мирзачўл туманидаги “Пангатлик миришкор” фермер хўжалиги раҳбари О.Мавлонов. – Бу, аввало, деҳқонга, унинг меҳнатига бўлган муносабатнинг ўзгаришида намоён бўлмоқда. Мамлакатимизда қишлоқ хўжалиги ходимлари куни жорий этилиб, “Ҳосил байрами” ўтказилиши деҳқонларга кўрсатилган алоҳида ҳурмат эътирофи бўлди. Мана, неча кунки, юртимизда деҳқону чорвадорлар шаънига билдирилаётган миннатдорлик изҳорлари ва тақдирлашлар қалбимизни ғурурга тўлдириб, янада самарали меҳнат қилишга ундамоқда.</p><p style=\"text-align: justify;\"><br />Байрам тадбирлари доирасида «Шоҳсарой» тантаналар мажмуасида дастурхон ёзилиб, ош тортилди. Қишлоқ хўжалиги ходимлари бир пиёла чой устида якунланаётган йилни сарҳисоб қилиб, келгуси режалар хусусида фикр алмашди. Самарали меҳнати билан халқимиз фаровонлигига салмоқли ҳисса қўшаётган соҳа ходимлари, фермерлар, томорқа эгалари қимматбаҳо эсдалик совғалари билан тақдирланди.</p><p style=\"text-align: justify;\"><br />Санъат усталари ва ёш ижрочилар томонидан тайёрланган концерт дастури байрам иштирокчиларига хуш кайфият бағишлади. <br /> </p><p style=\"text-align: justify;\">Байрам тадбирлари доирасида туман ҳокимларининг қишлоқ хўжалиги масалалари бўйича ўринбосарларига хизмат машиналари топширилди. <br /> </p><p style=\"text-align: justify;\">Тадбирда Жиззах вилояти ҳокими вазифасини бажарувчи Э.Солиев сўзга чиқди. </p><p style=\"text-align: justify;\"> </p><p style=\"text-align: justify;\">Тошқул Бекназаров, ЎзА</p>', '2017-12-11 17:11:40', '2017-12-11 17:11:40', '2017-12-11 17:15:16', 0, 0, 'f312d12f243adb9cde46f8145c232b95.jpg', 'a:5:{s:9:\"showtitle\";s:1:\"1\";s:8:\"showdate\";s:1:\"1\";s:8:\"showcomm\";s:1:\"1\";s:10:\"showlatest\";s:1:\"1\";s:7:\"canrate\";s:1:\"1\";}', 1, '', 'com_content_read.php', 'Жиззахда,умумий,ҳажми,триллион,миллиард,сўмлик,қишлоқ,хўжалиги,маҳсулотлари,етиштирилди', '<p style=\"text-align: justify;\"><strong>Ўзбекистон Республикаси қишлоқ хўжалиги ходимлари куни муносабати билан Жиззахда ўтказилган “Ҳосил байрами” тадбирлари фаровонлик, маъмурчилик ва дастурхонимиз тўкинлиги намойиши сифатида нишонланди.</strong></p>', 'yangiliklar/zhizzahda_umumiy_hazhmi_2_trillion_444_milliard_sumlik_ishlo_huzhaligi_mahsulotlari_etishtirildi', '', '', 3, 'uz');

-- --------------------------------------------------------

--
-- Table structure for table `content_access`
--

CREATE TABLE `content_access` (
  `id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(100) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_photos`
--

CREATE TABLE `content_photos` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `desc` text NOT NULL,
  `published` int(2) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content_video`
--

CREATE TABLE `content_video` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `album_id` int(11) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `create_at` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `allow_who` varchar(150) NOT NULL,
  `hits` int(11) NOT NULL,
  `imageurl` varchar(250) NOT NULL,
  `raiting` int(11) NOT NULL,
  `vcode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `tags` varchar(250) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `fileurl` varchar(255) NOT NULL,
  `pubdate` datetime NOT NULL,
  `size` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `last` datetime NOT NULL,
  `published` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files_access`
--

CREATE TABLE `files_access` (
  `id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files_cat`
--

CREATE TABLE `files_cat` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '1',
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `seolink` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files_cat`
--

INSERT INTO `files_cat` (`id`, `parent_id`, `ordering`, `title`, `description`, `seolink`, `icon`) VALUES
(1, 0, 1, '-- Корневая категория --', '', '--kornevaya-kategoriya--', '');

-- --------------------------------------------------------

--
-- Table structure for table `files_rating`
--

CREATE TABLE `files_rating` (
  `id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files_rating`
--

INSERT INTO `files_rating` (`id`, `f_id`, `user_id`, `vote`) VALUES
(3, 23, 1, 1),
(4, 22, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `files_reclama`
--

CREATE TABLE `files_reclama` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files_reclama`
--

INSERT INTO `files_reclama` (`id`, `content`) VALUES
(1, 'Здесь может быть рекламный текст или код HTML'),
(2, 'Здесь может быть текст рекламного блока или код HTML');

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE `filters` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `desription` text NOT NULL,
  `link` varchar(150) NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`id`, `title`, `desription`, `link`, `published`) VALUES
(1, 'Содержание статьи', 'Фильтр ищет тэги {СТРАНИЦА=Название страницы} в текстах статей, и заменяет их на главы в содержании статьи.', 'f_contents', 1),
(2, 'Автозамена / Фильтр ссылок', 'Фильтр выполняет замену выражений по созданным вами правилам, а так же служит для создания ссылок в категории прайслиста, фотоальбомы и фотографии.<br/><br/>{ПРАЙС=Название категории}, <br/>{ФОТО=Название фотографии}, <br/>{АЛЬБОМ=Название фотоальбома}, <br/>{МАТЕРИАЛ=Название материала}<br/>{ФОРМА=Название формы} - форма с заголовком<br/>', 'f_replace', 1),
(3, 'плеер MP3', 'Фильтр встввит MP3 плеер где будет найден тэг {MP3}', 'f_mp3', 1),
(4, 'Опрос ', 'Голосования страница', 'f_polls', 1),
(5, 'Каталог файлов', 'Каталог файлов', 'f_fcatalog', 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter_rules`
--

CREATE TABLE `filter_rules` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `find` varchar(200) NOT NULL,
  `replace` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `flag` varchar(2) NOT NULL DEFAULT '0',
  `langdir` enum('ltr','rtl') NOT NULL,
  `author` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `flag`, `langdir`, `author`) VALUES
(1, 'Русский', 'ru', 'ltr', 'Бахром Парпиев'),
(2, 'Ўзбек', 'uz', 'ltr', 'Бахром Парпиев');

-- --------------------------------------------------------

--
-- Table structure for table `like_item`
--

CREATE TABLE `like_item` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `target_id` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `mod_id` int(11) DEFAULT '0',
  `menutype` varchar(150) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `linktype` varchar(255) DEFAULT NULL,
  `linkid` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `target` enum('_self','_blank','parent','top') DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `cols` tinyint(1) DEFAULT '1',
  `home_page` tinyint(4) DEFAULT '0',
  `active` tinyint(4) DEFAULT '0',
  `lang` varchar(50) DEFAULT '*',
  `css_class` varchar(50) DEFAULT NULL,
  `mgroup` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `mod_id`, `menutype`, `title`, `alias`, `link`, `linktype`, `linkid`, `ordering`, `target`, `icon`, `cols`, `home_page`, `active`, `lang`, `css_class`, `mgroup`) VALUES
(1, 0, 0, 'root', '-- Корневая страница --', NULL, NULL, NULL, '0', 0, NULL, NULL, 1, 0, 0, '*', NULL, 0),
(235, 1, 0, 'mainmenu', 'Бош сахифа', 'bosh_sahifa', '/', 'link', '/', 1, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(236, 1, 0, 'mainmenu', 'Биз хақимизда', 'biz_haimizda', 'biz_haimizda', 'category', '128', 2, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(237, 236, 0, 'mainmenu', 'Жамият хақида', 'zhamiyat_haida', 'biz_haimizda/zhamiyat_haida', 'category', '132', 3, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(238, 236, 0, 'mainmenu', 'Жамия рахбари', 'zhamiya_rahbari', 'biz_haimizda/zhamiyat_rahbariyat', 'category', '129', 4, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(239, 236, 0, 'mainmenu', 'Жамият низоми', 'zhamiyat_nizomi', 'biz_haimizda/zhamiyat_nizomi', 'category', '130', 5, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(240, 236, 0, 'mainmenu', 'Акт бўйича масъул шахс', 'akt_buyicha_masul_shahs', 'biz_haimizda/akt_buyicha_masul_shahs', 'category', '131', 6, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(241, 1, 0, 'mainmenu', 'Махсулотлар', 'mahsulotlar', 'mahsulotlar', 'category', '134', 7, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(242, 1, 0, 'mainmenu', 'Янгиликлар', 'yangiliklar', 'yangiliklar', 'category', '133', 6, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(243, 1, 0, 'mainmenu', 'Фото', 'foto', '/photos', 'component', 'photos', 8, '_self', NULL, 0, 0, 1, 'uz', '', 0),
(244, 1, 0, 'mainmenu', 'Боғланиш', 'bolanish', '/feedback', 'component', 'feedback', 9, '_self', NULL, 0, 0, 1, 'uz', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus_type`
--

CREATE TABLE `menus_type` (
  `id` int(11) NOT NULL,
  `menutype` varchar(150) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus_type`
--

INSERT INTO `menus_type` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Асосий меню', NULL),
(2, 'footermenu', 'Пастки меню', NULL),
(3, 'menumenu_ru', 'Бош меню', ''),
(4, 'mainmenu_uz', 'Асосий Меню2', 'Асосий Меню2'),
(10, 'topmenu', 'Тепа меню', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `position` varchar(50) NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `module` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `hasconfig` int(11) NOT NULL,
  `system` int(11) NOT NULL,
  `created` date NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `showtitle` int(11) NOT NULL DEFAULT '0',
  `is_external` int(11) NOT NULL DEFAULT '0',
  `is_user` int(11) NOT NULL DEFAULT '0',
  `css_prefix` varchar(100) NOT NULL,
  `tpl` varchar(100) NOT NULL,
  `modgroup` int(11) NOT NULL DEFAULT '0',
  `jscode` text NOT NULL,
  `params` text NOT NULL,
  `lang` varchar(50) NOT NULL,
  `access` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `position`, `title`, `description`, `module`, `ordering`, `hasconfig`, `system`, `created`, `active`, `showtitle`, `is_external`, `is_user`, `css_prefix`, `tpl`, `modgroup`, `jscode`, `params`, `lang`, `access`) VALUES
(8, 'topmenu', 'Меню', '', 'mod_menu', 1, 1, 0, '2017-12-10', 1, 0, 1, 0, '', 'module.php', 0, '', 'a:5:{s:8:\"menutype\";s:8:\"mainmenu\";s:9:\"max_items\";s:0:\"\";s:9:\"show_home\";N;s:14:\"menu_item_name\";s:0:\"\";s:8:\"cssclass\";s:19:\"navigation clearfix\";}', 'uz', ''),
(11, 'top', 'Меню вверх', '', 'mod_menu', 2, 1, 1, '2014-11-03', 0, 0, 1, 0, '', '', 0, '', 'a:3:{s:9:\"showtitle\";i:0;s:8:\"menutype\";s:7:\"topmenu\";s:8:\"cssclass\";s:11:\"footer-menu\";}', 'uz', ''),
(12, 'auth', 'Авторизация', 'Авторизация', 'mod_auth', 1, 1, 1, '2014-11-03', 1, 0, 1, 3, '', '', 0, '', '', 'uz', ''),
(13, 'user10', 'Пользователь меню', 'Пользователь меню', 'mod_usermenu', 5, 1, 1, '2015-11-03', 1, 0, 1, 3, '', '', 0, '', '', 'uz', ''),
(14, 'mainbottom', 'Новости категория', 'Новости категория', 'mod_catnews', 9, 1, 1, '2015-11-03', 1, 0, 1, 3, '', '', 0, '', '', 'uz', ''),
(15, 'sidebar1', 'Излаш', 'Поиск', 'mod_search', 9, 1, 0, '2017-12-12', 1, 0, 1, 3, '', 'module.php', 0, '', '', 'uz', ''),
(16, 'sidebar2', 'Голосования', 'Голосования', 'mod_polls', 7, 1, 1, '2015-11-03', 0, 1, 1, 3, 'widget popular', '', 0, '', '', 'uz', ''),
(17, 'righsidebar', 'Архив', 'Архив', 'mod_archive', 8, 1, 1, '2015-11-03', 1, 0, 1, 3, '', '', 0, '', '', 'uz', ''),
(18, 'footer1', 'Пастки меню', '', 'mod_menu', 1, 1, 0, '2016-09-27', 1, 0, 1, 0, '', '', 0, '', 'a:3:{s:9:\"showtitle\";i:1;s:8:\"menutype\";s:10:\"footermenu\";s:8:\"cssclass\";s:11:\"footer-menu\";}', 'uz', ''),
(19, 'sidebar1', 'Энг кўп ўқилганлар', '', 'mod_topcontent', 25, 1, 0, '2017-08-13', 0, 1, 1, 2, '', 'module_content2.php', 0, '', 'a:2:{s:4:\"sort\";s:4:\"hits\";s:5:\"limit\";s:1:\"5\";}', 'uz', ''),
(20, 'mainbottom', 'Янгиликлар', '', 'mod_latestnews', 101, 1, 0, '2017-12-11', 1, 1, 1, 2, 'news-section deal-of-day', 'module_content.php', 0, '', 'a:6:{s:6:\"cat_id\";s:3:\"133\";s:9:\"newscount\";s:1:\"3\";s:8:\"showdate\";s:1:\"1\";s:8:\"showdesc\";s:1:\"1\";s:6:\"is_pag\";s:1:\"0\";s:4:\"subs\";s:1:\"1\";}', 'uz', ''),
(21, 'righsidebar', 'Последние новости', '', 'mod_topcontent', 12, 0, 0, '2015-12-22', 0, 0, 1, 3, '', '', 0, '', 'a:2:{s:4:\"sort\";s:10:\"created_at\";s:5:\"limit\";s:2:\"15\";}', 'uz', ''),
(22, 'slider', 'Новости слайдер', '', 'mod_newslider', 13, 1, 0, '2016-05-28', 1, 0, 1, 2, '', '', 0, '', '', 'uz', ''),
(24, 'sidebar2', 'Календарь', '', 'mod_content_calendar', 60, 1, 0, '2016-05-29', 0, 1, 1, 2, 'head_title', 'module2.php', 0, '', '', 'uz', ''),
(37, 'sidebar1', 'Обратный счётчик', 'Обратный счётчик', 'mod_count', 56, 1, 0, '2016-02-11', 0, 0, 1, 2, '', '', 0, '', '', 'uz', ''),
(38, 'sidebar1', 'Обратный звонок', 'Обратный звонок', 'mod_callme', 57, 1, 0, '2016-02-11', 0, 0, 1, 2, '', '', 0, '', '', 'uz', ''),
(39, 'sidebar2', 'Фотостена', 'Модуль Фотостена', 'mod_fotostena', 58, 1, 0, '2016-03-06', 0, 1, 1, 2, 'widget popular', '', 0, '', '', 'uz', ''),
(41, 'fixmodule', 'Меню(Мобил)', '', 'mod_menu_mobile', 63, 1, 0, '2017-08-13', 1, 0, 1, 0, '', 'module.php', 0, '', 'a:3:{s:9:\"showtitle\";i:1;s:8:\"menutype\";s:8:\"mainmenu\";s:8:\"cssclass\";s:0:\"\";}', 'uz', ''),
(43, 'sidebar2', 'Сўровнома', '', 'mod_polls', 66, 1, 0, '2016-07-12', 1, 1, 1, 2, 'section-title', 'module2.php', 0, '', '', 'uz', ''),
(47, 'top3', 'Қисқа сатрлардар', '', 'mod_newslider2', 68, 1, 0, '2016-02-19', 1, 0, 1, 2, '', '', 0, '', '', 'uz', ''),
(52, 'mainbottom', 'Медиа', '', 'mod_media', 72, 1, 0, '2016-09-27', 0, 0, 1, 2, '', 'module3.php', 0, '', 'a:3:{s:5:\"media\";s:5:\"video\";s:9:\"newscount\";s:2:\"15\";s:4:\"back\";s:1:\"1\";}', 'uz', ''),
(53, 'sidebar2', 'Видео ролики', '', 'mod_video_new', 73, 1, 0, '2016-03-04', 0, 1, 1, 2, 'widget popular', '', 0, '', '', 'uz', ''),
(57, 'sidebar-1', 'Календарь', '', 'mod_calendar', 77, 1, 0, '2016-11-24', 1, 1, 1, 2, '', 'module4.php', 0, '', '', 'uz', ''),
(59, 'sidebar1', 'Асосий янгиликлар', '', 'mod_feature', 79, 1, 0, '2017-12-12', 0, 1, 1, 2, '', 'module_content.php', 0, '', 'a:6:{s:6:\"cat_id\";s:3:\"133\";s:9:\"newscount\";s:1:\"5\";s:8:\"showdate\";s:1:\"1\";s:8:\"showdesc\";s:1:\"1\";s:6:\"is_pag\";s:1:\"0\";s:4:\"subs\";s:1:\"1\";}', 'uz', ''),
(64, 'sidebar1', 'Сўнги янгиликлар', '', 'mod_news_block3', 70, 1, 0, '2017-12-12', 1, 1, 1, 3, 'recent-posts', 'module4r.php', 0, '', 'a:5:{s:6:\"cat_id\";s:3:\"133\";s:9:\"newscount\";s:1:\"4\";s:8:\"cssclass\";s:0:\"\";s:3:\"tpl\";s:19:\"mod_news_block4.php\";s:4:\"subs\";s:1:\"1\";}', 'uz', ''),
(79, 'maintop', 'СуперСлайдер', 'СуперСлайдер', 'mod_superslider', 98, 1, 0, '2017-04-24', 0, 1, 1, 3, 'flat-bg-white blog blog-grid pad-top70px pad-bottom20px bg-f4f4f4', 'module_content.php', 0, '', 'a:8:{s:9:\"slider_id\";s:1:\"1\";s:13:\"is_horizontal\";s:1:\"1\";s:7:\"is_auto\";s:1:\"1\";s:6:\"is_nav\";s:1:\"1\";s:7:\"is_dots\";s:1:\"1\";s:10:\"is_reverse\";s:1:\"1\";s:5:\"delay\";s:4:\"3500\";s:5:\"speed\";s:4:\"1000\";}', 'uz', ''),
(80, 'fixmodule', 'Преключения язык', '', 'mod_lang', 99, 1, 0, '2017-04-27', 1, 0, 1, 2, '', 'module.php', 0, '', '', '*', ''),
(90, 'maintop', 'Хизматлар', '', 'mod_content_carusel', 95, 1, 0, '2017-05-05', 0, 1, 1, 2, 'flat-bg-white pad-top70px pad-bottom70px', 'module_content.php', 0, '', 'a:2:{s:6:\"cat_id\";s:2:\"85\";s:9:\"newscount\";s:2:\"50\";}', 'uz', ''),
(92, 'sidebar1', 'Сўнгги янгиликлар', '', 'mod_feature', 100, 1, 0, '2017-12-12', 0, 1, 1, 2, '', 'module.php', 0, '', 'a:6:{s:6:\"cat_id\";s:3:\"133\";s:9:\"newscount\";s:1:\"5\";s:8:\"showdate\";s:1:\"0\";s:8:\"showdesc\";s:1:\"0\";s:6:\"is_pag\";s:1:\"0\";s:4:\"subs\";s:1:\"1\";}', 'uz', ''),
(93, 'sidebar1', 'Тақвим', '', 'mod_clock', 24, 1, 0, '2017-12-12', 0, 0, 1, 2, '', 'module_content2.php', 0, '', '', 'uz', ''),
(95, 'mainbottom', 'Видео из контента', '', 'mod_cvideo', 102, 1, 0, '2017-09-17', 0, 0, 1, 2, '', 'module.php', 0, '', 'a:5:{s:6:\"cat_id\";s:2:\"97\";s:9:\"newscount\";s:1:\"5\";s:5:\"width\";s:3:\"325\";s:6:\"height\";s:3:\"240\";s:4:\"subs\";s:1:\"1\";}', 'uz', ''),
(97, 'maintop', 'Маҳсулотлар', '', '', 103, 1, 0, '2017-12-11', 1, 0, 0, 1, 'products-section-one', 'module_content.php', 0, '<div class=\"row clearfix\">\r\n<div class=\"product-style-one orange-theme col-md-4 col-sm-6 col-xs-12\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"content\">\r\n                            <h3>мева ва сабзавотлар маҳсулотлари</h3>\r\n                            <!--<div class=\"text\">on your first purchase</div>\r\n                            <a href=\"shop.html\" class=\"default-link\">Shop Now</a>-->\r\n                        </div>\r\n                        <figure class=\"food-image wow fadeInUp\" data-wow-delay=\"0ms\" data-wow-duration=\"1500ms\"><img src=\"/theme/ferminvest/images/resource/food-image-5.png\" alt=\"\"></figure>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Product Style One-->\r\n                <div class=\"product-style-one light-theme col-md-4 col-sm-6 col-xs-12\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"content\">\r\n                            <h3>Қишлоқ хўжалик маҳсулотлари</h3>\r\n                            <!--<div class=\"text\">on your first purchase</div>\r\n                            <a href=\"shop.html\" class=\"default-link\">Shop Now</a>-->\r\n                        </div>\r\n                        <figure class=\"food-image wow fadeInUp\" data-wow-delay=\"300ms\" data-wow-duration=\"1500ms\"><img src=\"/theme/ferminvest/images/resource/food-image-6.png\" alt=\"\"></figure>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Product Style One-->\r\n                <div class=\"product-style-one green-theme col-md-4 col-sm-6 col-xs-12\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"content\">\r\n                            <h3>Нон ва нон маҳсулотлари</h3>\r\n                           <!--<div class=\"text\">on order over $ 99</div>\r\n                            <a href=\"shop.html\" class=\"default-link\">Shop Now</a>-->\r\n                        </div>\r\n                        <figure class=\"food-image wow fadeInUp\" data-wow-delay=\"600ms\" data-wow-duration=\"1500ms\"><img src=\"/theme/ferminvest/images/resource/food-image-7.png\" alt=\"\"></figure>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n</div>', '', 'uz', ''),
(98, 'search', 'Жамият хақида', '', '<p>{МАТЕРИАЛИНФО=Жамият хақида}</p>\r\n', 104, 1, 0, '2017-12-11', 1, 1, 0, 1, 'featured-package-section', 'module_content.php', 0, '', '', 'uz', ''),
(99, 'footer1', 'Манзил', '', '<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12 column\">\r\n<div class=\"footer-widget about-widget\">\r\n<p><a href=\"index.html\"><img alt=\"\" src=\"/theme/ferminvest/images/logo-3.png\" /></a></p>\r\n\r\n<div class=\"text\">\r\n<p>&laquo;ВОДИЙ САХОВАТИ АГРОИНВЕСТ УЛГУРЖИ САВДО&raquo; масъулияти чекланган жамияти</p>\r\n\r\n<p>мева-сабзавот махсулотларини тайёрлаш ва ғамлаш корхонаси</p>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"col-lg-4 col-md-4 col-sm-6 col-xs-12 column\">\r\n<div class=\"footer-widget info-widget\">\r\n<h2>Жойлашув</h2>\r\n<ul class=\"info\">\r\n	<li>Манзил : Узбекистон Республикаси, Наманган вилояти Янгиркургон тумани, Ш.Юлдузи КФЙ, Кизил-Киёк МФЙ пункти</li>\r\n	<li>Email : info@vodiysaxovati.uz</li>\r\n</ul>\r\n</div>\r\n</div>\r\n', 105, 1, 0, '2017-12-11', 1, 0, 0, 1, '', 'module.php', 0, '', '', 'uz', ''),
(100, 'mainbottom', 'Маҳсулотлар', '', '', 106, 1, 0, '2017-12-11', 1, 1, 0, 1, 'gallery-section', 'module_content.php', 0, '<div class=\"mixitup-gallery\">\r\n            <!--Filter-->\r\n            <div class=\"filters text-center\">\r\n                <ul class=\"filter-tabs filter-btns clearfix\">\r\n                    <li class=\"active filter\" data-role=\"button\" data-filter=\"all\">Барча</li>\r\n                    <li class=\"filter\" data-role=\"button\" data-filter=\".fruits\">Мевалар</li>\r\n                    <li class=\"filter\" data-role=\"button\" data-filter=\".vegetables\">Сабзавотлар</li>\r\n                    <li class=\"filter\" data-role=\"button\" data-filter=\".breads\">Ун</li>\r\n                    <li class=\"filter\" data-role=\"button\" data-filter=\".juices\">Juices</li>\r\n                </ul>\r\n            </div>\r\n\r\n            <!--Filter List-->\r\n            <div class=\"filter-list row clearfix\">\r\n                <!--Default Food Item-->\r\n                <div class=\"col-md-4 col-sm-6 col-xs-12 default-food-item mix mix_all all juices\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"image-box\">\r\n                            <figure class=\"image\"><a class=\"lightbox-image option-btn\" data-fancybox-group=\"example-gallery\" href=\"/theme/ferminvest/images/gallery/1.jpg\" title=\"Image Title Here\"><img src=\"/theme/ferminvest/images/gallery/1.jpg\" alt=\"\"></a></figure>\r\n                            <div class=\"lower-content\">\r\n                                <h3><a href=\"shop.html\">Passion Fruits</a></h3>\r\n                                <div class=\"price\">25.00</div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Default Food Item-->\r\n                <div class=\"col-md-4 col-sm-6 col-xs-12 default-food-item mix mix_all all breads juices\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"image-box\">\r\n                            <figure class=\"image\"><a class=\"lightbox-image option-btn\" data-fancybox-group=\"example-gallery\" href=\"/theme/ferminvest/images/gallery/2.jpg\" title=\"Image Title Here\"><img src=\"/theme/ferminvest/images/gallery/2.jpg\" alt=\"\"></a></figure>\r\n                            <div class=\"lower-content\">\r\n                                <h3><a href=\"shop.html\">Kiwi Fruits</a></h3>\r\n                                <div class=\"price\">$ 18.00</div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Default Food Item-->\r\n                <div class=\"col-md-4 col-sm-6 col-xs-12 default-food-item mix mix_all all fruits vegetables\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"image-box\">\r\n                            <figure class=\"image\"><a class=\"lightbox-image option-btn\" data-fancybox-group=\"example-gallery\" href=\"/theme/ferminvest/images/gallery/3.jpg\" title=\"Image Title Here\"><img src=\"/theme/ferminvest/images/gallery/3.jpg\" alt=\"\"></a></figure>\r\n                            <div class=\"lower-content\">\r\n                                <h3><a href=\"shop.html\">Tomatoes</a></h3>\r\n                                <div class=\"price\">$ 30.00</div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Default Food Item-->\r\n                <div class=\"col-md-4 col-sm-6 col-xs-12 default-food-item mix mix_all all fruits vegetables breads juices\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"image-box\">\r\n                            <figure class=\"image\"><a class=\"lightbox-image option-btn\" data-fancybox-group=\"example-gallery\" href=\"/theme/ferminvest/images/gallery/4.jpg\" title=\"Image Title Here\"><img src=\"/theme/ferminvest/images/gallery/4.jpg\" alt=\"\"></a></figure>\r\n                            <div class=\"lower-content\">\r\n                                <h3><a href=\"shop.html\">Ripe pea</a></h3>\r\n                                <div class=\"price\">$ 15.00</div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Default Food Item-->\r\n                <div class=\"col-md-4 col-sm-6 col-xs-12 default-food-item mix mix_all all vegetables\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"image-box\">\r\n                            <figure class=\"image\"><a class=\"lightbox-image option-btn\" data-fancybox-group=\"example-gallery\" href=\"/theme/ferminvest/images/gallery/5.jpg\" title=\"Image Title Here\"><img src=\"/theme/ferminvest/images/gallery/5.jpg\" alt=\"\"></a></figure>\r\n                            <div class=\"lower-content\">\r\n                                <h3><a href=\"shop.html\">Figs Sweet</a></h3>\r\n                                <div class=\"price\">$ 18.00</div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n                <!--Default Food Item-->\r\n                <div class=\"col-md-4 col-sm-6 col-xs-12 default-food-item mix mix_all all breads juices\">\r\n                    <div class=\"inner-box\">\r\n                        <div class=\"image-box\">\r\n                            <figure class=\"image\"><a class=\"lightbox-image option-btn\" data-fancybox-group=\"example-gallery\" href=\"/theme/ferminvest/images/gallery/6.jpg\" title=\"Image Title Here\"><img src=\"/theme/ferminvest/images/gallery/6.jpg\" alt=\"\"></a></figure>\r\n                            <div class=\"lower-content\">\r\n                                <h3><a href=\"shop.html\">Rye Bread</a></h3>\r\n                                <div class=\"price\">$ 20.00</div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n            <div class=\"more-btn-outer text-center\"><a href=\"shop.html\" class=\"theme-btn btn-style-four\">View More</a></div>\r\n        </div>', '', 'uz', ''),
(101, 'mainbottom', 'Хужжатлар', '', '', 107, 1, 0, '2017-12-12', 1, 0, 0, 1, '', 'module.php', 0, ' <section class=\"fluid-section-one\">\r\n        <div class=\"oval-cut\"></div>\r\n\r\n        <!--FLoated Image Left-->\r\n        <figure class=\"floated-image-left wow fadeInLeft\" data-wow-delay=\"0ms\" data-wow-duration=\"1500ms\"><img src=\"/theme/ferminvest/images/resource/food-image-2.png\" alt=\"\"></figure>\r\n        <!--FLoated Image Right-->\r\n        <figure class=\"floated-image-right wow fadeInRight\" data-wow-delay=\"0ms\" data-wow-duration=\"1500ms\"><img src=\"/theme/ferminvest/images/resource/food-image-3.png\" alt=\"\"></figure>\r\n\r\n        <div class=\"outer-box clearfix\">\r\n            <!--Left Column-->\r\n            <div class=\"left-column\">\r\n                <div class=\"clearfix\">\r\n                    <div class=\"inner-box\">\r\n                        <h3>Лицензия</h3>\r\n                        <h5>Жамият лицензияси</h5>\r\n                        <a href=\"#\" ></a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n            <!--Right Column-->\r\n            <div class=\"right-column\">\r\n                <div class=\"clearfix\">\r\n                    <div class=\"inner-box\">\r\n                        <h3>Гувоҳнома</h3>\r\n                        <h5>Жамият гувоҳномаси</h5>\r\n                        <a href=\"#\"></a>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n\r\n        </div>\r\n    </section>', '', 'uz', '');

-- --------------------------------------------------------

--
-- Table structure for table `modules_menu`
--

CREATE TABLE `modules_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules_menu`
--

INSERT INTO `modules_menu` (`id`, `menu_id`, `mod_id`, `position`) VALUES
(4, 0, 11, 'top'),
(34, 0, 21, 'slider'),
(41, 0, 13, 'user10'),
(49, 0, 12, 'auth'),
(53, 0, 26, 'sidebar1'),
(98, 0, 37, 'sidebar1'),
(99, 0, 38, 'sidebar1'),
(149, 1, 49, 'maintop'),
(150, 0, 47, 'top3'),
(155, 1, 50, 'maintop'),
(164, 0, 16, 'sidebar2'),
(165, 0, 53, 'sidebar2'),
(168, 0, 39, 'sidebar2'),
(179, 1, 30, 'top1'),
(213, 1, 22, 'slider'),
(227, 0, 24, 'sidebar2'),
(242, 0, 51, 'banner1'),
(289, 0, 43, 'sidebar2'),
(361, 1, 52, 'mainbottom'),
(394, 0, 18, 'footer1'),
(455, 0, 57, 'sidebar-1'),
(561, 1, 79, 'maintop'),
(569, 0, 80, 'fixmodule'),
(578, 1, 81, 'slider'),
(618, 1, 90, 'maintop'),
(619, 1, 91, 'maintop'),
(633, 0, 41, 'fixmodule'),
(637, 0, 19, 'sidebar1'),
(646, 1, 95, 'mainbottom'),
(648, 0, 8, 'topmenu'),
(659, 1, 20, 'mainbottom'),
(662, 1, 97, 'maintop'),
(666, 1, 98, 'maintop'),
(674, 0, 99, 'footer1'),
(680, 1, 100, 'mainbottom'),
(683, 1, 101, 'mainbottom'),
(684, 0, 93, 'sidebar1'),
(687, 242, 92, 'sidebar1'),
(688, 0, 15, 'sidebar1'),
(690, 242, 59, 'sidebar1'),
(692, 242, 64, 'sidebar1');

-- --------------------------------------------------------

--
-- Table structure for table `photoalbums`
--

CREATE TABLE `photoalbums` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `published` int(11) DEFAULT NULL,
  `showdate` int(11) DEFAULT NULL,
  `showtags` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `showtype` varchar(10) NOT NULL,
  `perpage` int(15) NOT NULL,
  `cssprefix` varchar(20) NOT NULL,
  `maxcols` int(11) NOT NULL,
  `orderform` int(11) NOT NULL,
  `orderby` varchar(20) NOT NULL,
  `orderto` varchar(20) NOT NULL,
  `public` int(11) NOT NULL,
  `thumb1` int(11) NOT NULL,
  `thumb2` int(11) NOT NULL,
  `thumbsqr` int(11) NOT NULL,
  `uplimit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photoalbums`
--

INSERT INTO `photoalbums` (`id`, `parent_id`, `title`, `description`, `published`, `showdate`, `showtags`, `ordering`, `pubdate`, `showtype`, `perpage`, `cssprefix`, `maxcols`, `orderform`, `orderby`, `orderto`, `public`, `thumb1`, `thumb2`, `thumbsqr`, `uplimit`) VALUES
(1, 0, '-- Корневой альбом --', NULL, 1, 1, 1, 1, '2014-09-16 01:04:19', 'list', 15, '', 4, 1, 'pubdate', 'asc', 1, 96, 480, 1, 20),
(7, 1, 'Автосалон', '', 1, 0, 0, 0, '2017-05-10 23:26:20', 'lightbox', 20, '', 4, 0, 'title', 'desc', 0, 96, 500, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `photofiles`
--

CREATE TABLE `photofiles` (
  `id` int(11) NOT NULL,
  `photoalbumid` int(11) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `pubdate` datetime DEFAULT NULL,
  `files` text,
  `published` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `showdate` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photofiles`
--

INSERT INTO `photofiles` (`id`, `photoalbumid`, `title`, `description`, `pubdate`, `files`, `published`, `hits`, `comments`, `showdate`, `user_id`) VALUES
(28, 7, 'Фото #1', NULL, '2017-05-11 22:55:25', '48515d329b72c39ef8dfbc80ca91d6aa.jpg', 1, 0, 0, 1, 1),
(29, 7, 'Фото #2', NULL, '2017-05-11 22:55:25', '238815bd4b931a1b4faad35d485904c7.jpg', 1, 0, 0, 1, 1),
(30, 7, 'Фото #3', NULL, '2017-05-11 22:55:25', '0117f943ef0c297abf7f2fd287e2c039.jpg', 1, 0, 0, 1, 1),
(31, 7, 'Фото #4', NULL, '2017-05-11 22:55:25', '1465326ba47351917bf6c3e3ce7cd2a5.jpg', 1, 0, 0, 1, 1),
(32, 7, 'Фото #5', NULL, '2017-05-11 22:55:26', '13344a55a1dbfd26c12d1bb31e51ead0.jpg', 1, 0, 0, 1, 1),
(33, 7, 'Фото #6', NULL, '2017-05-11 22:55:26', '083062019a522a49bf4ad2cfbee7f8bb.jpg', 1, 0, 0, 1, 1),
(34, 7, 'Фото #7', NULL, '2017-05-11 22:55:26', 'dd84e003d86bca70f5c6adc18c9e6f3c.jpg', 1, 0, 0, 1, 1),
(35, 7, 'Фото #8', NULL, '2017-05-11 22:55:26', '183be202d928e2cd42399bf7d2d312eb.jpg', 1, 0, 0, 1, 1),
(36, 7, 'Фото #9', NULL, '2017-05-11 22:55:26', '67f13d740ae1f0e95bbf0e1cd1cce7bd.jpg', 1, 0, 0, 1, 1),
(37, 7, 'Фото #10', NULL, '2017-05-11 22:55:26', '8290f1d5b5eedb2768d773f47dc9075b.jpg', 1, 0, 0, 1, 1),
(38, 7, 'Фото #11', NULL, '2017-05-11 22:55:26', 'ccabcc79a9d72ff3cb327b7df24ffe2d.jpg', 1, 0, 0, 1, 1),
(39, 7, 'Фото #12', NULL, '2017-05-11 22:55:26', '417203ddd4b7133cd1a1ee94d62885ad.jpg', 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `plug_name` varchar(150) NOT NULL DEFAULT '0',
  `plug_type` varchar(150) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `config` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `plug_name`, `plug_type`, `title`, `description`, `active`, `config`) VALUES
(1, 'p_ckeditor', 'wysiwyg', 'CKEditor', 'Визуальный редактор', 1, ''),
(2, 'p_morecontent', 'plugin', 'Похожие статьи', 'Добавляет в конец каждой статьи список похожих статей.', 0, ''),
(4, 'p_photoalbum', '0', 'Фотоалбомь', 'Фотоалбомь', 1, ''),
(5, 'p_twitt', '0', 'Автопостинг Twitter', 'Автопостинг Twitter', 0, 'a:4:{s:8:\"CONS_KEY\";s:25:\"Ee9UgqJZwp9TGRAgwWvybXuJA\";s:11:\"CONS_SECRET\";s:50:\"jfumsWyZzlXZfQXKEU8PpSuwkfKOnEspxruXVZy8JO2oUHHSIl\";s:7:\"O_TOKEN\";s:50:\"4850836234-Ht7hvI9tRqSO7iHRxsojceNsk1FYeZfO5RidOFb\";s:8:\"O_SECRET\";s:45:\"zWdldPgGY8IDNbCytT36toExlCcAxuR1rrtViJkVmCI17\";}'),
(6, 'p_soccontent', 'plugin', 'Социальные закладки', 'Добавляет кнопки социальных закладок в блоги и статьи.', 0, 'a:2:{s:7:\"v_stati\";i:1;s:7:\"v_blogi\";i:1;}'),
(7, 'p_addphoto', '0', 'Плагин фото в статье', 'Добавляет фото в конце каждой статьи', 1, ''),
(8, 'p_like', '0', 'Мне нравится', 'Позволяет пользователям отмечать интересные материалы', 1, ''),
(9, 'p_facebook', '0', 'Автопостинг FaceBook', 'Автопостинг FaceBook', 0, ''),
(10, 'p_link2video', '0', 'Замена Youtube url на видео', 'Ссылки на Youtube заменяются на код плеера с этим видео', 1, ''),
(11, 'p_like_fac', '0', 'Like button to my Facebook', 'Вставляет скрипт кнопки МНЕ НРАВИТСЯ от Фейсбука в статьи и блоги', 0, ''),
(12, 'p_files', '0', 'Мои файлы', 'Выводит список файлов в профиле', 0, ''),
(13, 'p_pushnotifi', '0', 'Отправка рассылки', 'Отправка рассылки', 0, ''),
(14, 'p_tinymce', 'wysiwyg', 'TinyMCE', 'Визуальный редактор', 0, ''),
(15, 'p_elrte', 'wysiwyg', 'elRTE', 'Визуальный редактор', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `plugins_event`
--

CREATE TABLE `plugins_event` (
  `id` int(11) NOT NULL,
  `event` varchar(50) NOT NULL DEFAULT '0',
  `plugin_id` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins_event`
--

INSERT INTO `plugins_event` (`id`, `event`, `plugin_id`) VALUES
(1, 'GET_ARTICLE', '2'),
(2, 'INSERT_WYSIWYG', '1'),
(3, 'ADD_ADMIN_ARTICLE', '0'),
(4, 'GET_ARTICLE', '6'),
(5, 'GET_POST', '6'),
(6, 'GET_ARTICLE', '8'),
(7, 'ADD_ARTICLE_DONE', '5'),
(8, 'ADD_POST_DONE', '5'),
(9, 'ADD_BOARD_DONE', '5'),
(10, 'ADD_ARTICLE_DONE', '9'),
(11, 'GET_ARTICLE', '10'),
(12, 'GET_ARTICLE', '11'),
(13, 'GET_FCATALOG', '6'),
(14, 'ADD_ARTICLE_DONE', '13'),
(15, 'INSERT_WYSIWYG', '14'),
(16, 'INSERT_WYSIWYG', '15');

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `value` varchar(250) NOT NULL,
  `position` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`id`, `question_id`, `value`, `position`) VALUES
(18, 4, 'Аъло', 4),
(17, 4, 'Яхши', 3),
(16, 4, 'Яхши эмас', 2),
(15, 4, 'Қониқарли', 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_questions`
--

CREATE TABLE `poll_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `lang` varchar(50) NOT NULL,
  `ordering` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_questions`
--

INSERT INTO `poll_questions` (`id`, `question`, `startdate`, `enddate`, `lang`, `ordering`, `status`) VALUES
(4, 'Сайт ҳақида фикрингиз', '2016-02-18 12:35:04', '2016-02-18 12:35:04', 'uz', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `poll_votes`
--

CREATE TABLE `poll_votes` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `voted_on` datetime NOT NULL,
  `ip` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `poll_votes`
--

INSERT INTO `poll_votes` (`id`, `option_id`, `voted_on`, `ip`) VALUES
(58, 16, '2016-03-02 12:06:04', '127.0.0.1'),
(59, 18, '2016-04-07 22:19:44', '127.0.0.1'),
(60, 17, '2016-07-12 13:39:08', '213.230.93.71'),
(61, 18, '2016-07-14 13:23:20', '213.230.93.226'),
(62, 17, '2016-07-15 15:45:30', '213.230.93.196'),
(63, 17, '2016-07-15 15:47:04', '213.230.94.148'),
(64, 18, '2016-07-15 17:51:34', '213.230.73.114'),
(65, 18, '2016-07-19 09:58:50', '213.230.94.97'),
(66, 17, '2016-07-21 14:46:44', '213.230.107.65'),
(67, 18, '2016-07-26 23:02:15', '89.236.207.50'),
(68, 18, '2016-07-26 23:02:16', '89.236.207.50'),
(69, 15, '2016-07-27 13:28:52', '89.236.219.118'),
(70, 17, '2016-07-28 12:33:14', '95.213.218.109'),
(71, 15, '2016-07-30 18:32:18', '89.146.73.239'),
(72, 17, '2016-08-01 09:49:15', '213.230.94.7'),
(73, 15, '2016-08-05 12:22:54', '213.230.93.153'),
(74, 17, '2016-08-06 14:03:05', '213.230.68.7'),
(75, 16, '2016-08-08 15:36:39', '213.230.74.211'),
(76, 18, '2016-08-11 10:08:24', '213.230.94.59'),
(77, 17, '2016-08-12 17:59:09', '213.230.95.103'),
(78, 17, '2016-08-16 16:20:08', '213.230.93.136'),
(79, 15, '2016-08-26 14:42:17', '89.236.207.50'),
(80, 17, '2016-08-30 17:55:09', '188.113.197.36'),
(81, 15, '2016-09-04 12:40:26', '89.236.207.50'),
(82, 15, '2016-09-04 12:40:27', '89.236.207.50'),
(83, 18, '2016-09-07 14:46:30', '213.230.72.144'),
(84, 15, '2016-09-08 18:37:50', '213.230.94.250'),
(85, 15, '2016-09-09 11:25:12', '213.230.94.246'),
(86, 18, '2016-09-13 11:48:33', '195.158.31.158'),
(87, 18, '2016-09-17 10:00:46', '91.203.173.224'),
(88, 16, '2016-09-17 14:08:52', '213.230.72.99'),
(89, 16, '2016-09-24 15:13:36', '213.230.75.58');

-- --------------------------------------------------------

--
-- Table structure for table `superslider_sliders`
--

CREATE TABLE `superslider_sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `slides_count` int(11) NOT NULL DEFAULT '0',
  `is_external` tinyint(1) DEFAULT NULL,
  `options` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `superslider_sliders`
--

INSERT INTO `superslider_sliders` (`id`, `title`, `width`, `height`, `slides_count`, `is_external`, `options`) VALUES
(1, 'Демо-слайдер', 580, 280, 4, 0, 'a:7:{s:5:\"table\";s:0:\"\";s:5:\"limit\";s:0:\"\";s:7:\"orderby\";s:0:\"\";s:7:\"orderto\";s:3:\"asc\";s:5:\"where\";s:0:\"\";s:5:\"image\";s:0:\"\";s:3:\"url\";s:0:\"\";}'),
(2, 'Авто: Универсальный каталог', 580, 240, 1, 1, '---\ntable: cms_uc_items\nlimit: 5\norderby: pubdate\norderto: desc\nwhere: published=1 AND on_moderate=0\nimage: \'/images/catalog/medium/{imageurl}.jpg\'\nurl: \'/catalog/item{id}.html\'\n'),
(3, 'Авто: Статьи', 580, 240, 1, 1, 'a:7:{s:5:\"table\";s:7:\"content\";s:5:\"limit\";s:2:\"15\";s:7:\"orderby\";s:2:\"id\";s:7:\"orderto\";s:4:\"desc\";s:5:\"where\";s:25:\"active=1 AND is_archive=0\";s:5:\"image\";s:24:\"/images/content/{images}\";s:3:\"url\";s:15:\"/{seolink}.html\";}'),
(4, 'Авто: Объявления', 580, 240, 1, 1, '---\ntable: cms_board_items\nlimit: 5\norderby: pubdate\norderto: desc\nwhere: published=1\nimage: \'/images/board/medium/{file}\'\nurl: \'/board/read{id}.html\'\n'),
(5, 'Авто: InstantMaps', 580, 240, 1, 1, '---\ntable: cms_map_items\nlimit: 5\norderby: pubdate\norderto: desc\nwhere: published=1 AND on_moderate=0\nimage: \'/images/photos/medium/map{id}.jpg\'\nurl: \'/maps/{seolink}.html\'\n'),
(6, 'Авто: InstantShop', 580, 240, 1, 1, '---\ntable: cms_shop_items\nlimit: 5\norderby: pubdate\norderto: desc\nwhere: published=1\nimage: \'/images/photos/medium/shop{id}.jpg\'\nurl: \'/shop/{seolink}.html\'\n');

-- --------------------------------------------------------

--
-- Table structure for table `superslider_slides`
--

CREATE TABLE `superslider_slides` (
  `id` int(11) NOT NULL,
  `slider_id` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `bg_color` varchar(16) DEFAULT NULL,
  `bg_image` varchar(255) DEFAULT NULL,
  `struct` text,
  `ordering` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `superslider_slides`
--

INSERT INTO `superslider_slides` (`id`, `slider_id`, `title`, `bg_color`, `bg_image`, `struct`, `ordering`) VALUES
(1, 1, 'Добро пожаловать', '#000000', '/images/slider/1/bg-ee48f0f8.jpg', '[{\"id\":2,\"text\":\"На сайт первого космического турагентства\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#96c0ff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"italic\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"76px\",\"top\":\"120px\",\"z-index\":\"1\"}},{\"id\":1,\"text\":\"Добро пожаловать!\",\"href\":\"\",\"styles\":{\"font-family\":\"Impact\",\"font-size\":\"36px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"123px\",\"top\":\"74px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"Подробнее\",\"href\":\"http://www.google.com\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"14px\",\"color\":\"#fafafa\",\"background-color\":\"#d35400\",\"padding\":\"10px\",\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"236px\",\"top\":\"169px\",\"z-index\":\"3\"}},{\"id\":4,\"text\":\"Введите текст\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":\"\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"0px\",\"top\":\"0px\",\"z-index\":\"4\"}}]', 1),
(2, 1, 'Космос', '#000000', '/images/slider/1/bg-2ca0a3dd.jpg', '[{\"id\":1,\"text\":\"Вы уже готовы\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"22px\",\"color\":\"#fffcff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"156px\",\"top\":\"23px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"к путешествию\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"191px\",\"top\":\"53px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"в космос\",\"href\":\"\",\"styles\":{\"font-family\":\"Impact\",\"font-size\":\"24px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"338px\",\"top\":\"48px\",\"z-index\":\"3\"}},{\"id\":4,\"text\":\"?\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"451px\",\"top\":\"53px\",\"z-index\":\"4\"}}]', 2),
(3, 1, 'Земная орбита', '#000000', '/images/slider/1/bg-f15cbe11.jpg', '[{\"id\":3,\"text\":\"$3 000 000 *\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"24px\",\"color\":\"#f5ea75\",\"background-color\":\"\",\"padding\":0,\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"111px\",\"top\":\"197px\",\"z-index\":\"1\"}},{\"id\":1,\"text\":\"Путешествие на земную орбиту\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"20px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"33px\",\"top\":\"166px\",\"z-index\":\"2\"}},{\"id\":2,\"text\":\"всего за\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"34px\",\"top\":\"201px\",\"z-index\":\"3\"}},{\"id\":4,\"text\":\"* предложение ограничено сроком действия\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"11px\",\"color\":\"#707175\",\"background-color\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"340px\",\"top\":\"258px\",\"z-index\":\"4\"}},{\"id\":5,\"text\":\"\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"\",\"background-image\":\"url(/images/slider/1/bg-fc8a2712.png)\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"128px\",\"height\":\"128px\",\"left\":\"345px\",\"top\":\"63px\",\"z-index\":\"5\"}}]', 3),
(8, 1, 'Спец.предложение', '#000000', '/images/slider/1/bg-63c71e60.jpg', '[{\"id\":1,\"text\":\"Специальное предложение\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"26px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"italic\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"198px\",\"top\":\"20px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"для корпоративных клиентов\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#ffb22e\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"283px\",\"top\":\"51px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"Ваш корпоратив в открытом космосе\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#ffffff\",\"background-color\":\"#330e33\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"47px\",\"top\":\"139px\",\"z-index\":\"3\"}},{\"id\":4,\"text\":\"всего за\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"163px\",\"top\":\"183px\",\"z-index\":\"4\"}},{\"id\":5,\"text\":\"12 000 000\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#241024\",\"background-color\":\"#f272f2\",\"padding\":\"10px\",\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"254px\",\"top\":\"183px\",\"z-index\":\"5\"}},{\"id\":6,\"text\":\"рублей\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#ffffff\",\"background-color\":\"\",\"padding\":\"10px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"375px\",\"top\":\"183px\",\"z-index\":\"6\"}}]', 4),
(13, 2, 'Шаблон слайда', '#95a5a6', '', '[{\"id\":1,\"text\":\"{image}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"170px\",\"height\":\"170px\",\"left\":\"50px\",\"top\":\"30px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"{title}\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"22px\",\"color\":\"#000000\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"300px\",\"height\":\"60px\",\"left\":\"240px\",\"top\":\"70px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"{pubdate}\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"12px\",\"color\":\"#2c3e50\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"300px\",\"height\":\"auto\",\"left\":\"240px\",\"top\":\"50px\",\"z-index\":\"3\"}}]', 1),
(14, 3, 'Шаблон слайда', '#95a5a6', '', '[{\"id\":1,\"text\":\"{image}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"170px\",\"height\":\"170px\",\"left\":\"50px\",\"top\":\"30px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"{title}\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"22px\",\"color\":\"#000000\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"300px\",\"height\":\"60px\",\"left\":\"240px\",\"top\":\"70px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"{created_at}\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"12px\",\"color\":\"#2c3e50\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"300px\",\"height\":\"auto\",\"left\":\"240px\",\"top\":\"50px\",\"z-index\":\"3\"}}]', 1),
(15, 4, 'Шаблон слайда', '#95a5a6', '', '[{\"id\":1,\"text\":\"{image}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"400px\",\"height\":\"200px\",\"left\":\"167px\",\"top\":\"7px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"{obtype} {title}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"22px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"background-image\":\"\",\"padding\":\"8px\",\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"12px\",\"top\":\"181px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"{pubdate}\",\"href\":\"\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"12px\",\"color\":\"#ffffff\",\"background-color\":\"#000000\",\"background-image\":\"\",\"padding\":\"5px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"12px\",\"top\":\"156px\",\"z-index\":\"3\"}}]', 1),
(16, 5, 'Шаблон слайда', '#ebebeb', '', '[{\"id\":1,\"text\":\"{image}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"350px\",\"height\":\"220px\",\"left\":\"220px\",\"top\":\"8px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"{title}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"24px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"background-image\":\"\",\"padding\":\"8px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"19px\",\"top\":\"17px\",\"z-index\":\"2\"}}]', 1),
(17, 6, 'Шаблон слайда', '#ebebeb', '', '[{\"id\":1,\"text\":\"{image}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"#ffffff\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"350px\",\"height\":\"220px\",\"left\":\"25px\",\"top\":\"7px\",\"z-index\":\"1\"}},{\"id\":2,\"text\":\"{title}\",\"href\":\"{url}\",\"styles\":{\"font-family\":\"Trebuchet MS\",\"font-size\":\"18px\",\"color\":\"#000000\",\"background-color\":\"\",\"background-image\":\"\",\"padding\":0,\"font-weight\":\"bold\",\"font-style\":\"normal\",\"width\":\"160px\",\"height\":\"auto\",\"left\":\"388px\",\"top\":\"19px\",\"z-index\":\"2\"}},{\"id\":3,\"text\":\"{price} руб.\",\"href\":\"\",\"styles\":{\"font-family\":\"Arial\",\"font-size\":\"14px\",\"color\":\"#ffffff\",\"background-color\":\"#206106\",\"background-image\":\"\",\"padding\":\"8px\",\"font-weight\":\"normal\",\"font-style\":\"normal\",\"width\":\"auto\",\"height\":\"auto\",\"left\":\"376px\",\"top\":\"155px\",\"z-index\":\"3\"}}]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `target` varchar(50) NOT NULL DEFAULT '0',
  `tag_name` varchar(255) NOT NULL DEFAULT '0',
  `item_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `target`, `tag_name`, `item_id`) VALUES
(1577, 'article', 'Халқаро', 122),
(1578, 'article', 'ўқув', 122),
(1579, 'article', 'навбатдаги', 122),
(1580, 'article', 'марказида', 122),
(1581, 'article', 'Имом', 122),
(1582, 'article', 'Бухорий', 122),
(1583, 'article', 'бошланди', 122),
(1584, 'article', 'Фарзанд', 114),
(1585, 'article', 'берувчи', 114),
(1586, 'article', 'Аллоҳдир', 114),
(1587, 'article', 'Наманган', 123),
(1588, 'article', 'китоб', 123),
(1589, 'article', 'олами', 123),
(1590, 'article', 'мажмуаси', 123),
(1591, 'article', 'фойдаланишга', 123),
(1592, 'article', 'топширилди', 123),
(1593, 'article', 'ЮРТ', 124),
(1594, 'article', 'КЕЛАЖАГИ', 124),
(1595, 'article', 'НИНГ', 124),
(1596, 'article', 'НАМАНГАН', 124),
(1597, 'article', 'ВИЛОЯТИ', 124),
(1598, 'article', 'ҒОЛИБЛАРИ', 124),
(1599, 'article', 'АНИҚЛАНДИ', 124),
(1614, 'article', 'яратиш', 125),
(1615, 'article', 'хўжалигида', 125),
(1616, 'article', 'фермер', 125),
(1617, 'article', 'Ўзбекистонда', 125),
(1618, 'article', 'оширилади', 125),
(1619, 'article', 'охиригача', 125),
(1620, 'article', 'мингдан', 125),
(1621, 'article', 'лойиҳалар', 125),
(1622, 'article', 'йил', 125),
(1623, 'article', 'интенсив', 125),
(1624, 'article', 'зиёд', 125),
(1625, 'article', 'бўйича', 125),
(1626, 'article', 'боғ', 125),
(1627, 'article', 'амалга', 125),
(1628, 'article', 'Ниҳол', 126),
(1629, 'article', 'мукофоти', 126),
(1630, 'article', 'танловининг', 126),
(1631, 'article', 'Наманган', 126),
(1632, 'article', 'шаҳар', 126),
(1633, 'article', 'босқичи', 126),
(1634, 'article', 'бўлиб', 126),
(1635, 'article', 'ўтди', 126),
(1643, 'article', 'йилнинг', 128),
(1644, 'article', 'чорагида', 128),
(1645, 'article', 'Ўзбекистонда', 128),
(1646, 'article', 'минг', 128),
(1647, 'article', 'тонна', 128),
(1648, 'article', 'сабзавот', 128),
(1649, 'article', 'етиштирилди', 128),
(1650, 'article', 'KOICA', 129),
(1651, 'article', 'quot', 129),
(1652, 'article', 'Тошкент', 129),
(1653, 'article', 'quot', 129),
(1654, 'article', 'янги', 129),
(1655, 'article', 'аэропорт', 129),
(1656, 'article', 'лойиҳасини', 129),
(1657, 'article', 'ҳукуматга', 129),
(1658, 'article', 'тақдим', 129),
(1659, 'article', 'этди', 129),
(1660, 'article', 'Фойдали', 130),
(1661, 'article', 'шартномалар', 130),
(1662, 'article', 'Тошкентда', 131),
(1663, 'article', 'янги', 131),
(1664, 'article', 'Chevrolet', 131),
(1665, 'article', 'Nexia', 131),
(1666, 'article', 'тақдимоти', 131),
(1667, 'article', 'бўлиб', 131),
(1668, 'article', 'ўтди', 131),
(1669, 'article', 'Сиёсий', 132),
(1670, 'article', 'партиялар', 132),
(1671, 'article', 'учун', 132),
(1672, 'article', 'семинар', 132),
(1673, 'article', 'Жамолиддин', 133),
(1674, 'article', 'отанинг', 133),
(1675, 'article', 'боғи', 133),
(1676, 'article', 'Журналистлар', 134),
(1677, 'article', 'учун', 134),
(1678, 'article', 'видеоконференция', 134),
(1679, 'article', 'Ошкоралик', 135),
(1680, 'article', 'ва', 135),
(1681, 'article', 'очиқлик', 135),
(1682, 'article', 'асосида', 135),
(1683, 'article', 'Наманганда', 136),
(1684, 'article', 'Юксак', 136),
(1685, 'article', 'маънавиятли', 136),
(1686, 'article', 'авлод', 136),
(1687, 'article', 'фестивалининг', 136),
(1688, 'article', 'вилоят', 136),
(1689, 'article', 'босқичи', 136),
(1690, 'article', 'бўлиб', 136),
(1691, 'article', 'ўтди', 136),
(1708, 'article', 'ЮРТ', 138),
(1709, 'article', 'ТАНЛОВИНИНГ', 138),
(1710, 'article', 'НАМАНГАН', 138),
(1711, 'article', 'КЕЛАЖАГИ', 138),
(1712, 'article', 'ВИЛОЯТ', 138),
(1713, 'article', 'БОСҚИЧИ', 138),
(1714, 'article', 'Ўзбек', 137),
(1715, 'article', 'театри', 137),
(1716, 'article', 'Наманганда', 137),
(1717, 'article', 'миллий', 137),
(1718, 'article', 'quot', 139),
(1719, 'article', 'Универсиада', 139),
(1720, 'article', 'quot', 139),
(1721, 'article', 'ғолибларига', 139),
(1722, 'article', 'Президент', 139),
(1723, 'article', 'совғаси', 139),
(1724, 'article', 'quot', 139),
(1725, 'article', 'Дамас', 139),
(1726, 'article', 'quot', 139),
(1727, 'article', 'автомобиллари', 139),
(1728, 'article', 'топширилди', 139),
(1729, 'article', 'ГАЗ', 140),
(1730, 'article', 'БАЛЛОН', 140),
(1731, 'article', 'УСКУНАСИ', 140),
(1732, 'article', 'ЎРНАТИЛГАН', 140),
(1733, 'article', 'АВТОМОБИЛЛАРГА', 140),
(1734, 'article', 'МАХСУС', 140),
(1735, 'article', 'БЕЛГИ', 140),
(1736, 'article', 'ҚЎЙИШ', 140),
(1737, 'article', 'ТАКЛИФ', 140),
(1738, 'article', 'ҚИЛИНДИ', 140),
(1739, 'article', 'Туркия', 141),
(1740, 'article', 'парламенти', 141),
(1741, 'article', 'мамлакатнинг', 141),
(1742, 'article', 'янги', 141),
(1743, 'article', 'ҳукуматига', 141),
(1744, 'article', 'ишонч', 141),
(1745, 'article', 'билдирди', 141),
(1746, 'article', 'Тошкентда', 142),
(1747, 'article', 'қон', 142),
(1748, 'article', 'томир', 142),
(1749, 'article', 'касалликлари', 142),
(1750, 'article', 'диагностикаси', 142),
(1751, 'article', 'ва', 142),
(1752, 'article', 'даволаш', 142),
(1753, 'article', 'масалаларига', 142),
(1754, 'article', 'бағишланган', 142),
(1755, 'article', 'халқаро', 142),
(1756, 'article', 'конференция', 142),
(1757, 'article', 'бўлиб', 142),
(1758, 'article', 'ўтди', 142),
(1759, 'article', 'ОЗОДБЕК', 143),
(1760, 'article', 'НАЗАРБЕКОВ', 143),
(1761, 'article', 'ЯНГИ', 143),
(1762, 'article', 'ЛОЙИҲА', 143),
(1763, 'article', 'УСТИДА', 143),
(1764, 'article', 'ИШ', 143),
(1765, 'article', 'БОШЛАДИ', 143),
(1766, 'article', 'Уммонда', 144),
(1767, 'article', 'чилим', 144),
(1768, 'article', 'чекишга', 144),
(1769, 'article', 'қарши', 144),
(1770, 'article', 'кураш', 144),
(1771, 'article', 'бошланди', 144),
(1772, 'article', 'Дубайда', 145),
(1773, 'article', 'таркибий', 145),
(1774, 'article', 'қисмлари', 145),
(1775, 'article', 'принтерда', 145),
(1776, 'article', 'босилган', 145),
(1777, 'article', 'биринчи', 145),
(1778, 'article', 'бино', 145),
(1779, 'article', 'очилди', 145),
(1784, 'article', 'quot', 147),
(1785, 'article', 'Пахтакор', 147),
(1786, 'article', 'quot', 147),
(1787, 'article', 'бош', 147),
(1788, 'article', 'мураббийи', 147),
(1789, 'article', 'Нўъмон', 147),
(1790, 'article', 'Ҳасанов', 147),
(1791, 'article', 'истеъфога', 147),
(1792, 'article', 'чиқди', 147),
(1798, 'article', 'САВДОСИ,ОДАМ,МУАММО,ГЛОБАЛ', 146),
(1799, 'article', 'Хитойда,Диснейленднинг,рақиби,пайдо,бўлди', 148),
(1800, 'article', 'Роналд,Куман,«МЮ»,ван,Гаалга,бундай,муносабати,билан,Англия,Кубоги,учун,ҳақли,эмас»', 149),
(1801, 'article', 'УЗУМЧИЛИКНИ,РИВОЖЛАНТИРИШ,ЮЗАСИДАН,МАТБУОТ,АНЖУМАНИ,ЎТКАЗИЛДИ', 150),
(1802, 'article', 'ШҲТ,ўтмоқда,ўртасида,ТИВ,раҳбарлари,йиғилиш,бўлиб', 127),
(1804, 'article', 'МУТТАСИЛ,БАНДЛИК,МИЯГА,ЗАРАРЛИМИ', 151),
(1805, 'article', 'Эронликлар,жорий,мавсумда,Маккага,ҳаж,учун,бора,олмайди', 152),
(1806, 'article', 'Паттаяда,Кураш,бўйича,халқаро,турнир,бўлиб,ўтади', 153),
(1808, 'article', 'Иордания,қироли,парламентни,тарқатиб,юборди', 154),
(1809, 'article', 'Ўзбекистон,олий,таълим,тизими,учун,хориж,ўқув,ва,илмий,адабиётини,харид,қилиш,чоралари,тасдиқланди', 155),
(1810, 'article', 'Ҳиндистон,шимолида,юзага,келган,тропик,бўрон,кишини,ҳаётдан,олиб,кетди', 156),
(1811, 'article', '«ТЕНГДОШ,ТЕНГДОШГА»,КЎНИКМА,БЕРМОҚДА', 157),
(1812, 'article', 'Ўзбекистон,Қаҳрамони,Эркин,Воҳидов,оламдан,ўтди', 158),
(1813, 'article', 'Руслан,Чагаев,ва,Лукас,Браун,жанги,расман,ўтказилмаган,деб,топилди', 159),
(1814, 'article', 'Кувайт,амирини,ҳақорат,қилган,ҳукмрон,оила,аъзолари,жазоланди', 160),
(1815, 'article', 'Билол,Исаков,«Сурхон,қизи»,премьера,видео', 161),
(1816, 'article', 'Ўзбекистонда,Ўрта,Осиёдаги,энг,узун,туннел,қурилиши,якунланди', 162),
(1817, 'article', 'Ҳарбийларга,янги,уйлар', 163),
(1818, 'article', 'НАМАНГАНДА,КАСБЛАР,ФЕСТИВАЛИ', 164),
(1819, 'article', '«БОЛАСИНИ,СУЙГАН,ЭЛДА,БАХТЛИ,БОЛАЛАР»', 165),
(1820, 'article', 'Муборак,Рамазон,ойини,муносиб,тарзда,ўтказиш,тўғрисида', 166),
(1821, 'article', 'Дуторнинг,торидай,таранг,рельсларим,Достондан', 167),
(1822, 'article', 'Ўзбекистон,Республикаси,давлат,мустақиллигининг,йигирма,беш,йиллик,байрамига,тайёргарлик,кўриш,ва,уни,ўтказиш,тўғрисида', 168),
(1823, 'article', 'Ёшлар,билан,гавжум,маскан', 169),
(1825, 'article', 'ОАВда,собиқ,боксчи,Муҳаммад,Али,ўлим,тўшагида,ётгани,маълум,қилинди', 171),
(1826, 'article', 'Курашчимиз,Илҳом,Баҳромов,Осиё,чемпиони,бўлди', 172),
(1830, 'article', 'ёшли,япониялик,дунёдаги,энг,кекса,битирувчи,бўлди', 174),
(1831, 'article', '«Гарчи', 173),
(1832, 'article', 'шунча', 173),
(1833, 'article', 'мағрур', 173),
(1834, 'article', 'турса', 173),
(1835, 'article', 'ҳам', 173),
(1836, 'article', 'пиёлага', 173),
(1837, 'article', 'эгилар', 173),
(1838, 'article', 'чойнак»', 173),
(1839, 'article', 'Эркин', 173),
(1840, 'article', 'Воҳидов', 173),
(1841, 'article', 'ўқиган', 173),
(1842, 'article', 'шеърлар', 173),
(1843, 'article', 'видео', 173),
(1853, 'article', 'Ҳамюртимиз', 175),
(1854, 'article', 'Осиё', 175),
(1855, 'article', 'чемпионатида', 175),
(1856, 'article', 'совриндор', 175),
(1857, 'article', 'бўлди', 175),
(1858, 'article', 'Ёш', 176),
(1859, 'article', 'полвонларимиз', 176),
(1860, 'article', 'Осиё', 176),
(1861, 'article', 'чемпионатида', 176),
(1862, 'article', 'муваффақиятли', 176),
(1863, 'article', 'иштирок', 176),
(1864, 'article', 'этишмоқда', 176),
(1875, 'article', 'Америкалик', 178),
(1876, 'article', 'журналист', 178),
(1877, 'article', 'ва', 178),
(1878, 'article', 'унинг', 178),
(1879, 'article', 'таржимони', 178),
(1880, 'article', 'Афғонистонда', 178),
(1881, 'article', 'ўлдирилди', 178),
(1882, 'article', 'ПУШКИН', 179),
(1883, 'article', 'ТАВАЛЛУДИГА', 179),
(1884, 'article', 'БАҒИШЛАНГАН', 179),
(1885, 'article', 'ОНЛАЙН', 179),
(1886, 'article', 'МУЛОҚОТ', 179),
(1887, 'article', 'ЎТКАЗИЛДИ', 179),
(1888, 'article', 'АФҒОНИСТОНДА', 180),
(1889, 'article', 'РАСМИЙ', 180),
(1890, 'article', 'АЁЛЛАР', 180),
(1891, 'article', 'УНИВЕРСИТЕТИ', 180),
(1892, 'article', 'ИШГА', 180),
(1893, 'article', 'ТУШИРИЛДИ', 180),
(1896, 'article', 'ҳамнафасмиз', 177),
(1897, 'article', 'Тадбиркорларга', 177),
(1898, 'article', 'Кўз', 181),
(1899, 'article', 'саратонига', 181),
(1900, 'article', 'қарши', 181),
(1901, 'article', 'дори', 181),
(1902, 'article', 'топилди', 181),
(1903, 'article', 'Муҳаммад', 182),
(1904, 'article', 'Али', 182),
(1905, 'article', 'ўзи', 182),
(1906, 'article', 'туғилиб', 182),
(1907, 'article', 'ўсган', 182),
(1908, 'article', 'Луисвилл', 182),
(1909, 'article', 'шаҳрида', 182),
(1910, 'article', 'ерга', 182),
(1911, 'article', 'қўйилади', 182),
(1945, 'article', 'Рамазон', 184),
(1946, 'article', 'муборак', 184),
(1947, 'article', 'Моҳи', 184),
(1948, 'article', 'Россия', 185),
(1949, 'article', 'халқ', 185),
(1950, 'article', 'артисти', 185),
(1951, 'article', 'Алексей', 185),
(1952, 'article', 'Жарков', 185),
(1953, 'article', 'вафот', 185),
(1954, 'article', 'этди', 185),
(1955, 'article', 'БААда', 186),
(1956, 'article', 'тижоратчи', 186),
(1957, 'article', 'сонидан', 186),
(1958, 'article', 'иборат', 186),
(1959, 'article', 'машина', 186),
(1960, 'article', 'рақами', 186),
(1961, 'article', 'учун', 186),
(1962, 'article', 'млн', 186),
(1963, 'article', 'доллар', 186),
(1964, 'article', 'тўлади', 186),
(1965, 'article', 'Ўзбек', 187),
(1966, 'article', 'олимлари', 187),
(1967, 'article', 'ярани', 187),
(1968, 'article', 'битказувчи', 187),
(1969, 'article', 'восита', 187),
(1970, 'article', 'ихтиро', 187),
(1971, 'article', 'қилишди', 187),
(1972, 'article', 'ҲИНДИСТОНДА', 188),
(1973, 'article', 'МАЙМУН', 188),
(1974, 'article', 'ЗАРГАРЛИК', 188),
(1975, 'article', 'ДЎКОНИНИ', 188),
(1976, 'article', 'ЎМАРДИ', 188),
(1977, 'article', 'ҲИКОЯ', 183),
(1978, 'article', 'қутлуғ', 183),
(1979, 'article', 'ЯХШИ', 183),
(1980, 'article', 'шарафига', 183),
(1981, 'article', 'Ўзбекистон', 183),
(1982, 'article', 'тўйи', 183),
(1983, 'article', 'ТОПИБ', 183),
(1984, 'article', 'ТИНГЛАБ', 183),
(1985, 'article', 'республикаси', 183),
(1986, 'article', 'Публицистика', 183),
(1987, 'article', 'ОДАМЛАРДАН', 183),
(1988, 'article', 'мустақиллигининг', 183),
(1989, 'article', 'йиллик', 183),
(1990, 'article', 'давлат', 183),
(1991, 'article', 'АЙТАДИ', 183),
(1992, 'article', 'Наманганда', 189),
(1993, 'article', 'слаломда', 189),
(1994, 'article', 'эшкак', 189),
(1995, 'article', 'эшиш', 189),
(1996, 'article', 'бўйича', 189),
(1997, 'article', 'Ўзбекистон', 189),
(1998, 'article', 'кубогининг', 189),
(1999, 'article', 'биринчи', 189),
(2000, 'article', 'босқич', 189),
(2001, 'article', 'мусобақалари', 189),
(2002, 'article', 'бўлиб', 189),
(2003, 'article', 'ўтди', 189),
(2004, 'article', 'Наманганда', 190),
(2005, 'article', 'авиамоделчилар', 190),
(2006, 'article', 'мусобақаси', 190),
(2007, 'article', 'СОЛИҚ', 191),
(2008, 'article', 'БИЛИМДОНЛАРИ', 191),
(2009, 'article', 'БЕЛЛАШДИЛАР', 191),
(2013, 'article', 'хорижда', 192),
(2014, 'article', 'Наманган', 192),
(2015, 'article', 'костюмлари', 192),
(2016, 'article', 'Ташаббускорлик', 193),
(2017, 'article', 'етакчилик', 193),
(2018, 'article', 'мезони', 193),
(2019, 'article', 'Луисвиллда', 194),
(2020, 'article', 'Муҳаммад', 194),
(2021, 'article', 'Али', 194),
(2022, 'article', 'билан', 194),
(2023, 'article', 'ислом', 194),
(2024, 'article', 'русумларига', 194),
(2025, 'article', 'мувофиқ', 194),
(2026, 'article', 'хайрлашув', 194),
(2027, 'article', 'маросими', 194),
(2028, 'article', 'бўлиб', 194),
(2029, 'article', 'ўтди', 194),
(2030, 'article', 'Ёшлар', 195),
(2031, 'article', 'иллатларга', 195),
(2032, 'article', 'қарши', 195),
(2033, 'article', 'июндан', 196),
(2034, 'article', 'Ўзбекистонда', 196),
(2035, 'article', 'quot', 196),
(2036, 'article', 'Электрон', 196),
(2037, 'article', 'ҳукумат', 196),
(2038, 'article', 'тўғрисида', 196),
(2039, 'article', 'quot', 196),
(2040, 'article', 'ги', 196),
(2041, 'article', 'қонун', 196),
(2042, 'article', 'кучга', 196),
(2043, 'article', 'кирди', 196),
(2044, 'article', 'Муҳаммад', 197),
(2045, 'article', 'Али', 197),
(2046, 'article', 'она', 197),
(2047, 'article', 'шаҳрида', 197),
(2048, 'article', 'охирги', 197),
(2049, 'article', 'манзилига', 197),
(2050, 'article', 'кузатилди', 197),
(2054, 'article', 'САХОВАТЛИ', 198),
(2055, 'article', 'БЎЛИНГ', 198),
(2056, 'article', 'АЗИЗЛАР', 198),
(2057, 'article', 'йилгача', 199),
(2058, 'article', 'республикадаги', 199),
(2059, 'article', 'автомобиль', 199),
(2060, 'article', 'йўлларида', 199),
(2061, 'article', 'млн', 199),
(2062, 'article', 'доллар', 199),
(2063, 'article', 'қийматидаги', 199),
(2064, 'article', 'лойиҳалар', 199),
(2065, 'article', 'амалга', 199),
(2066, 'article', 'оширилади', 199),
(2067, 'article', 'Таэквондочиларимиз', 200),
(2068, 'article', 'халқаро', 200),
(2069, 'article', 'турнирдан', 200),
(2070, 'article', 'та', 200),
(2071, 'article', 'медаллар', 200),
(2072, 'article', 'билан', 200),
(2073, 'article', 'қайтишди', 200),
(2074, 'article', 'WWDC', 201),
(2075, 'article', 'анжуманида', 201),
(2076, 'article', 'илк', 201),
(2077, 'article', 'маротаба', 201),
(2078, 'article', 'веб', 201),
(2079, 'article', 'сайтлар', 201),
(2080, 'article', 'учун', 201),
(2081, 'article', 'Apple', 201),
(2082, 'article', 'тизими', 201),
(2083, 'article', 'тақдим', 201),
(2084, 'article', 'этилиши', 201),
(2085, 'article', 'мумкин', 201),
(2086, 'article', 'ЯНГИЕРДА', 202),
(2087, 'article', 'ЭКСКВАТОРЛАРНИ', 202),
(2088, 'article', 'ТАЪМИРЛАШ', 202),
(2089, 'article', 'ЗАВОДИ', 202),
(2090, 'article', 'ҚУРИЛАДИ', 202),
(2091, 'article', 'Шогирдлари', 203),
(2092, 'article', 'ютуғидан', 203),
(2093, 'article', 'мамнун', 203),
(2094, 'article', 'чевар', 203),
(2095, 'article', 'Экологик', 204),
(2096, 'article', 'акцияда', 204),
(2097, 'article', 'дан', 204),
(2098, 'article', 'ортиқ', 204),
(2099, 'article', 'тошбақа', 204),
(2100, 'article', 'табиатга', 204),
(2101, 'article', 'қўйиб', 204),
(2102, 'article', 'юборилди', 204),
(2103, 'article', 'ХХР', 205),
(2104, 'article', 'раҳбари', 205),
(2105, 'article', 'Ўзбекистонга', 205),
(2106, 'article', 'давлат', 205),
(2107, 'article', 'ташрифи', 205),
(2108, 'article', 'билан', 205),
(2109, 'article', 'келади', 205),
(2110, 'article', 'Францияда', 206),
(2111, 'article', 'Авиценна', 206),
(2112, 'article', 'халқаро', 206),
(2113, 'article', 'мукофоти', 206),
(2114, 'article', 'таъсис', 206),
(2115, 'article', 'этилди', 206),
(2116, 'article', 'Ғанижон', 207),
(2117, 'article', 'Ортиқов', 207),
(2118, 'article', '“Нуроний”', 207),
(2119, 'article', 'жамғармаси', 207),
(2120, 'article', 'Наманган', 207),
(2121, 'article', 'вилоят', 207),
(2122, 'article', 'бўлими', 207),
(2123, 'article', 'раиси', 207),
(2124, 'article', 'этиб', 207),
(2125, 'article', 'сайланди', 207),
(2126, 'article', 'Ўзи', 208),
(2127, 'article', 'сабабчи…', 208),
(2136, 'article', 'Леонардо', 210),
(2137, 'article', 'Ди', 210),
(2138, 'article', 'Каприо', 210),
(2139, 'article', 'Румийни', 210),
(2140, 'article', 'Роберт', 210),
(2141, 'article', 'Дауни', 210),
(2142, 'article', 'унинг', 210),
(2143, 'article', 'устози', 210),
(2144, 'article', 'ролини', 210),
(2145, 'article', 'ижро', 210),
(2146, 'article', 'этади', 210),
(2147, 'article', 'ТОМА', 209),
(2148, 'article', 'ТОМА', 209),
(2149, 'article', 'КЎЛ', 209),
(2150, 'article', 'БЎЛУР…', 209),
(2151, 'article', 'ҲИНДИСТОНЛИК', 211),
(2152, 'article', 'АЁЛ', 211),
(2153, 'article', 'КУТИЛМАГАНДА', 211),
(2154, 'article', 'ФАРЗАНДНИ', 211),
(2155, 'article', 'ДУНЁГА', 211),
(2156, 'article', 'КЕЛТИРДИ', 211),
(2157, 'article', 'Битирувчиларга', 212),
(2158, 'article', 'диплом', 212),
(2159, 'article', 'топширилди', 212),
(2160, 'article', 'ОАВ', 213),
(2161, 'article', 'Хитойнинг', 213),
(2162, 'article', 'биринчи', 213),
(2163, 'article', 'авиалайнери', 213),
(2164, 'article', 'йили', 213),
(2165, 'article', 'синов', 213),
(2166, 'article', 'парвозларига', 213),
(2167, 'article', 'чиқади', 213),
(2168, 'article', 'Европанинг', 214),
(2169, 'article', 'ARTE', 214),
(2170, 'article', 'телеканалида', 214),
(2171, 'article', 'Ўзбекистон', 214),
(2172, 'article', 'ҳақида', 214),
(2173, 'article', 'фильм', 214),
(2174, 'article', 'намойиш', 214),
(2175, 'article', 'этилди', 214),
(2176, 'article', 'ЎЗБЕКИСТОНДА', 215),
(2177, 'article', 'ҚУВВАТИ', 215),
(2178, 'article', 'МЕГАВАТ', 215),
(2179, 'article', 'БЎЛГАН', 215),
(2180, 'article', 'ШАМОЛ', 215),
(2181, 'article', 'ЭНЕРГИЯСИ', 215),
(2182, 'article', 'ПАРКЛАРИ', 215),
(2183, 'article', 'ТАШКИЛ', 215),
(2184, 'article', 'ЭТИЛАДИ', 215),
(2185, 'article', 'ИНҲА', 216),
(2186, 'article', 'УНИВЕРСИТЕТИДА', 216),
(2187, 'article', 'ЯНГИ', 216),
(2188, 'article', 'ФАКУЛЬТЕТ', 216),
(2189, 'article', 'ОЧИЛАДИ', 216),
(2190, 'article', 'Семиз', 217),
(2191, 'article', 'кишиларнинг', 217),
(2192, 'article', 'мия', 217),
(2193, 'article', 'фаолиятида', 217),
(2194, 'article', 'бузилишлар', 217),
(2195, 'article', 'аниқланди', 217),
(2196, 'article', 'Наманганда', 218),
(2197, 'article', 'картинг', 218),
(2198, 'article', 'бўйича', 218),
(2199, 'article', 'Ўзбекистон', 218),
(2200, 'article', 'кубоги', 218),
(2201, 'article', 'мусобақаларининг', 218),
(2202, 'article', 'биринчи', 218),
(2203, 'article', 'босқичи', 218),
(2204, 'article', 'бўлиб', 218),
(2205, 'article', 'ўтди', 218),
(2206, 'article', '“Энг', 219),
(2207, 'article', 'улуғ', 219),
(2208, 'article', 'энг', 219),
(2209, 'article', 'азиз”', 219),
(2210, 'article', 'Арнасой', 220),
(2211, 'article', 'туманида', 220),
(2212, 'article', 'яшовчи', 220),
(2213, 'article', 'Адҳам', 220),
(2214, 'article', 'Эрдошовлар', 220),
(2215, 'article', 'оиласида', 220),
(2216, 'article', 'бирйўла', 220),
(2217, 'article', 'уч', 220),
(2218, 'article', 'чақалоқ', 220),
(2219, 'article', 'дунёга', 220),
(2220, 'article', 'келди', 220),
(2221, 'article', 'ҲИНДИСТОНДА', 221),
(2222, 'article', 'ЙИЛДАН', 221),
(2223, 'article', 'БЕРИ', 221),
(2224, 'article', 'ОВҚАТ', 221),
(2225, 'article', 'ЕМАЙДИГАН', 221),
(2226, 'article', 'ҚАРИЯ', 221),
(2227, 'article', 'ЯШАЙДИ', 221),
(2228, 'article', 'Жуда', 222),
(2229, 'article', 'иссиқ', 222),
(2230, 'article', 'чой', 222),
(2231, 'article', 'ёки', 222),
(2232, 'article', 'қаҳва', 222),
(2233, 'article', 'саратонни', 222),
(2234, 'article', 'келтириб', 222),
(2235, 'article', 'чиқариши', 222),
(2236, 'article', 'аниқланди', 222),
(2237, 'article', 'Қонун', 223),
(2238, 'article', 'ижроси', 223),
(2239, 'article', 'таҳлил', 223),
(2240, 'article', 'этилди', 223),
(2241, 'article', '“Оқ', 224),
(2242, 'article', 'йўл', 224),
(2243, 'article', 'сенга', 224),
(2244, 'article', 'битирувчи”', 224),
(2245, 'article', 'Тарихий', 225),
(2246, 'article', 'ўзгаришлар', 225),
(2247, 'article', 'даври', 225),
(2248, 'article', 'Индонезияда', 226),
(2249, 'article', 'юз', 226),
(2250, 'article', 'берган', 226),
(2251, 'article', 'сув', 226),
(2252, 'article', 'тошқинлари', 226),
(2253, 'article', 'ва', 226),
(2254, 'article', 'кўчкилар', 226),
(2255, 'article', 'кишининг', 226),
(2256, 'article', 'ҳаётига', 226),
(2257, 'article', 'зомин', 226),
(2258, 'article', 'бўлди', 226),
(2259, 'article', 'Тошкентдаги', 227),
(2260, 'article', 'Инҳа', 227),
(2261, 'article', 'университетида', 227),
(2262, 'article', 'Гарвард', 227),
(2263, 'article', 'ва', 227),
(2264, 'article', 'бошқа', 227),
(2265, 'article', 'нуфузли', 227),
(2266, 'article', 'университет', 227),
(2267, 'article', 'битирувчилари', 227),
(2268, 'article', 'билан', 227),
(2269, 'article', 'учрашув', 227),
(2270, 'article', 'ўтказилди', 227),
(2271, 'article', 'ГИЁХВАНДЛИК', 228),
(2272, 'article', 'АСР', 228),
(2273, 'article', 'ВАБОСИ', 228),
(2281, 'article', 'ҲАҚИДАГИ', 229),
(2282, 'article', 'ОЛМОҚЧИМАН', 229),
(2283, 'article', 'ЙЎЛ', 229),
(2284, 'article', 'ДУНЁГА', 229),
(2285, 'article', 'ВАТАНИМ', 229),
(2286, 'article', 'БИЛАН', 229),
(2287, 'article', 'АСАРЛАРИМ', 229),
(2288, 'article', 'Япония', 230),
(2289, 'article', 'жанубида', 230),
(2290, 'article', 'кучли', 230),
(2291, 'article', 'кўчки', 230),
(2292, 'article', 'ва', 230),
(2293, 'article', 'тошқинлар', 230),
(2294, 'article', 'содир', 230),
(2295, 'article', 'бўлди', 230),
(2296, 'article', 'Ҳашаротлар', 231),
(2297, 'article', 'галаси', 231),
(2298, 'article', 'Тожмаҳал', 231),
(2299, 'article', 'деворидаги', 231),
(2300, 'article', 'нақшларни', 231),
(2301, 'article', 'кўримсизлаштирмоқда', 231),
(2302, 'article', 'ШҲТнинг', 232),
(2303, 'article', 'Тошкент', 232),
(2304, 'article', 'саммитини', 232),
(2305, 'article', 'ёритишда', 232),
(2306, 'article', 'икки', 232),
(2307, 'article', 'юзга', 232),
(2308, 'article', 'яқин', 232),
(2309, 'article', 'чет', 232),
(2310, 'article', 'эллик', 232),
(2311, 'article', 'журналист', 232),
(2312, 'article', 'қатнашади', 232),
(2319, 'article', 'янги', 233),
(2320, 'article', 'Хитой', 233),
(2321, 'article', 'Ўзбекистон', 233),
(2322, 'article', 'саҳифалари', 233),
(2323, 'article', 'ёрқин', 233),
(2324, 'article', 'дўстлигининг', 233),
(2325, 'article', 'ПОЙТАХТДА', 234),
(2326, 'article', 'HYATT', 234),
(2327, 'article', 'REGENCY', 234),
(2328, 'article', 'МЕҲМОНХОНАСИ', 234),
(2329, 'article', 'ҚУРИЛИШИ', 234),
(2330, 'article', 'ЯКУНЛАНДИ', 234),
(2331, 'article', 'ТОҒ', 235),
(2332, 'article', 'ОРАЛАБ', 235),
(2333, 'article', 'ДОВОН', 235),
(2334, 'article', 'ОШИБ', 235),
(2335, 'article', 'Хитой', 236),
(2336, 'article', 'Халқ', 236),
(2337, 'article', 'Республикаси', 236),
(2338, 'article', 'Раисининг', 236),
(2339, 'article', 'Ўзбекистонга', 236),
(2340, 'article', 'давлат', 236),
(2341, 'article', 'ташрифи', 236),
(2342, 'article', 'бошланди', 236),
(2343, 'article', 'Наманганда', 237),
(2344, 'article', 'бадиий', 237),
(2345, 'article', 'гимнастика', 237),
(2346, 'article', 'бўйича', 237),
(2347, 'article', '“Олимпия', 237),
(2348, 'article', 'умидлари”', 237),
(2349, 'article', 'республика', 237),
(2350, 'article', 'очиқ', 237),
(2351, 'article', 'турнири', 237),
(2352, 'article', 'бўлиб', 237),
(2353, 'article', 'ўтди', 237),
(2354, 'article', 'АМЕРИКАЛИК', 238),
(2355, 'article', 'УЧ', 238),
(2356, 'article', 'ДУГОНА', 238),
(2357, 'article', 'ЁШГА', 238),
(2358, 'article', 'ТЎЛГАНЛИКЛАРИНИ', 238),
(2359, 'article', 'БИРГА', 238),
(2360, 'article', 'НИШОНЛАШДИ', 238),
(2361, 'article', 'Apple', 239),
(2362, 'article', 'компанияси', 239),
(2363, 'article', 'хуфёна', 239),
(2364, 'article', 'тил', 239),
(2365, 'article', 'бириктиргани', 239),
(2366, 'article', 'учун', 239),
(2367, 'article', 'млн', 239),
(2368, 'article', 'доллар', 239),
(2369, 'article', 'жарима', 239),
(2370, 'article', 'тўлайди', 239),
(2371, 'article', 'Тошкентда', 240),
(2372, 'article', 'ШҲТга', 240),
(2373, 'article', 'аъзо', 240),
(2374, 'article', 'давлатлар', 240),
(2375, 'article', 'маданият', 240),
(2376, 'article', 'вазирлари', 240),
(2377, 'article', 'Кенгашининг', 240),
(2378, 'article', 'йиғилиши', 240),
(2379, 'article', 'бўлиб', 240),
(2380, 'article', 'ўтди', 240),
(2408, 'article', 'ҳамкорликнинг', 241),
(2409, 'article', 'юксак', 241),
(2410, 'article', 'электрлаштирилган', 241),
(2411, 'article', 'темир', 241),
(2412, 'article', 'стратегик', 241),
(2413, 'article', 'самараси', 241),
(2414, 'article', 'Поп', 241),
(2415, 'article', 'йўли', 241),
(2416, 'article', 'Ангрен', 241),
(2417, 'article', 'ЭРТАМИЗ', 242),
(2418, 'article', 'БУГУНДАН', 242),
(2419, 'article', 'БОШЛАНАДИ', 242),
(2427, 'article', 'Дўстлик', 244),
(2428, 'article', 'ва', 244),
(2429, 'article', 'ҳамкорлик', 244),
(2430, 'article', 'тараннуми', 244),
(2431, 'article', 'Шанхай', 245),
(2432, 'article', 'ҳамкорлик', 245),
(2433, 'article', 'ташкилоти', 245),
(2434, 'article', 'саммити', 245),
(2435, 'article', 'бошланди', 245),
(2436, 'article', 'ШҲТ', 246),
(2437, 'article', 'етакчилари', 246),
(2438, 'article', 'саммит', 246),
(2439, 'article', 'якунида', 246),
(2440, 'article', 'Тошкент', 246),
(2441, 'article', 'декларациясини', 246),
(2442, 'article', 'қабул', 246),
(2443, 'article', 'қилишди', 246),
(2444, 'article', 'ШҲТнинг', 247),
(2445, 'article', 'йилги', 247),
(2446, 'article', 'саммити', 247),
(2447, 'article', 'Қозоғистон', 247),
(2448, 'article', 'пойтахти', 247),
(2449, 'article', 'Остонада', 247),
(2450, 'article', 'бўлиб', 247),
(2451, 'article', 'ўтади', 247),
(2452, 'article', '“Орзу”да', 248),
(2453, 'article', 'орзудаги', 248),
(2454, 'article', 'уйлар', 248),
(2455, 'article', 'Дастур', 249),
(2456, 'article', 'ижросига', 249),
(2457, 'article', 'бағишланди', 249),
(2458, 'article', 'Ёш', 250),
(2459, 'article', 'журналистлар', 250),
(2460, 'article', 'тақдирланди', 250),
(2461, 'article', 'Муфтий', 251),
(2462, 'article', 'Усмонхон', 251),
(2463, 'article', 'Алимов', 251),
(2464, 'article', 'Наманганга', 251),
(2465, 'article', 'ташриф', 251),
(2466, 'article', 'буюрди', 251),
(2469, 'article', 'ШАРАФЛАНДИ', 252),
(2470, 'article', 'ЖУРНАЛИСТЛАР', 252),
(2476, 'article', 'ЭЪЗОЗ', 254),
(2477, 'article', 'ЭЪТИБОР', 254),
(2478, 'article', 'ЭҲТИРОМ', 254),
(2479, 'article', 'Ўзбекистонда', 255),
(2480, 'article', 'тонна', 255),
(2481, 'article', 'гиёҳванд', 255),
(2482, 'article', 'воситалари', 255),
(2483, 'article', 'ёқиб', 255),
(2484, 'article', 'йўқ', 255),
(2485, 'article', 'қилинди', 255),
(2486, 'article', 'Месси', 256),
(2487, 'article', 'Аргентина', 256),
(2488, 'article', 'терма', 256),
(2489, 'article', 'жамоасидаги', 256),
(2490, 'article', 'фаолиятини', 256),
(2491, 'article', 'якунлаши', 256),
(2492, 'article', 'ҳақида', 256),
(2493, 'article', 'эълон', 256),
(2494, 'article', 'қилди', 256),
(2495, 'article', 'БМТ', 257),
(2496, 'article', 'Жаҳонда', 257),
(2497, 'article', 'гуманитар', 257),
(2498, 'article', 'ёрдамга', 257),
(2499, 'article', 'муҳтож', 257),
(2500, 'article', 'инсонлар', 257),
(2501, 'article', 'сони', 257),
(2502, 'article', 'миллионга', 257),
(2503, 'article', 'етди', 257),
(2504, 'article', 'Халқимиз', 258),
(2505, 'article', 'бунёдкорлик', 258),
(2506, 'article', 'салоҳиятининг', 258),
(2507, 'article', 'яна', 258),
(2508, 'article', 'бир', 258),
(2509, 'article', 'ёрқин', 258),
(2510, 'article', 'намойиши', 258),
(2511, 'article', 'энг', 253),
(2512, 'article', 'фаол', 253),
(2513, 'article', 'Маъмуржон', 253),
(2514, 'article', 'йилнинг', 253),
(2515, 'article', 'журналисти', 253),
(2516, 'article', 'Интернетда', 259),
(2517, 'article', 'Истамбул', 259),
(2518, 'article', 'аэропортидаги', 259),
(2519, 'article', 'портлаш', 259),
(2520, 'article', 'видеотасвирлари', 259),
(2521, 'article', 'киши', 259),
(2522, 'article', 'нобуд', 259),
(2523, 'article', 'бўлган', 259),
(2524, 'article', 'киши', 259),
(2525, 'article', 'яраланган', 259),
(2574, 'article', 'чиқилди', 260),
(2575, 'article', 'тиббий', 260),
(2576, 'article', 'Тез', 260),
(2577, 'article', 'ишлаб', 260),
(2578, 'article', 'ёрдам', 260),
(2579, 'article', 'дастури', 260),
(2580, 'article', 'quot', 260),
(2581, 'article', 'quot', 260),
(2582, 'article', 'чиқилди', 261),
(2583, 'article', 'тиббий', 261),
(2584, 'article', 'Тез', 261),
(2585, 'article', 'ишлаб', 261),
(2586, 'article', 'ёрдам', 261),
(2587, 'article', 'дастури', 261),
(2588, 'article', 'quot', 261),
(2589, 'article', 'quot', 261),
(2590, 'article', 'Тезкорхабар', 262),
(2591, 'article', 'Энг', 262),
(2592, 'article', 'намунали', 262),
(2593, 'article', 'маслаҳатчи', 262),
(2594, 'article', 'Энг', 263),
(2595, 'article', 'намунали', 263),
(2596, 'article', 'маслаҳатчи', 263),
(2597, 'article', 'Хуршида', 264),
(2598, 'article', 'энг', 264),
(2599, 'article', 'ёш', 264),
(2600, 'article', 'сиёсатчи', 264),
(2601, 'article', 'Наманганда', 265),
(2602, 'article', 'quot', 265),
(2603, 'article', 'quot', 265),
(2604, 'article', 'акциясига', 265),
(2605, 'article', 'старт', 265),
(2606, 'article', 'берилди', 265),
(2607, 'article', 'Сайловчилар', 266),
(2608, 'article', 'билан', 266),
(2609, 'article', 'учрашув', 266),
(2610, 'article', 'Покистонда', 267),
(2611, 'article', 'яшин', 267),
(2612, 'article', 'уриши', 267),
(2613, 'article', 'оқибатида', 267),
(2614, 'article', 'беш', 267),
(2615, 'article', 'киши', 267),
(2616, 'article', 'ҳалок', 267),
(2617, 'article', 'бўлди', 267),
(2618, 'article', 'Бунёдкор', 268),
(2619, 'article', 'халқимиз', 268),
(2620, 'article', 'салоҳияти', 268),
(2621, 'article', 'самараси', 268),
(2622, 'article', 'Рамазон', 269),
(2623, 'article', 'ҳайитини', 269),
(2624, 'article', 'нишонлаш', 269),
(2625, 'article', 'тўғрисида', 269),
(2626, 'article', '«Ўзбекистон', 270),
(2627, 'article', 'Мустақиллигига', 270),
(2628, 'article', 'йил»', 270),
(2629, 'article', 'эсдалик', 270),
(2630, 'article', 'нишонини', 270),
(2631, 'article', 'таъсис', 270),
(2632, 'article', 'этиш', 270),
(2633, 'article', 'тўғрисида', 270),
(2634, 'article', 'Сайловчилар', 271),
(2635, 'article', 'депутат', 271),
(2636, 'article', 'билан', 271),
(2637, 'article', 'юзма', 271),
(2638, 'article', 'юз', 271),
(2643, 'article', 'ҳуқуқий', 272),
(2644, 'article', 'кенгайтирилди', 272),
(2645, 'article', 'Журналистларнинг', 272),
(2646, 'article', 'билимлари', 272),
(2647, 'article', 'Наманган', 273),
(2648, 'article', '“Зукколар', 273),
(2649, 'article', 'баҳси', 273),
(2650, 'article', 'финал', 273),
(2651, 'article', 'босқичи', 273),
(2652, 'article', 'БУ', 274),
(2653, 'article', 'КУНЛАРГА', 274),
(2654, 'article', 'ЕТГАНЛАР', 274),
(2655, 'article', 'БОР', 274),
(2663, 'article', 'ғалабаси', 275),
(2664, 'article', 'эвазига', 275),
(2665, 'article', 'чиқди', 275),
(2666, 'article', 'финалга', 275),
(2667, 'article', 'Португалия', 275),
(2668, 'article', 'илк', 275),
(2669, 'article', 'Евро', 275),
(2670, 'article', 'Майк', 276),
(2671, 'article', 'Тайсон', 276),
(2672, 'article', 'орадан', 276),
(2673, 'article', 'йил', 276),
(2674, 'article', 'ўтиб', 276),
(2675, 'article', 'бир', 276),
(2676, 'article', 'ҳақиқатни', 276),
(2677, 'article', 'тан', 276),
(2678, 'article', 'олди', 276),
(2679, 'article', 'ОЧИҚ', 277),
(2680, 'article', 'ВА', 277),
(2681, 'article', 'САМИМИЙ', 277),
(2682, 'article', 'МУЛОҚОТЛАР', 277),
(2686, 'article', 'Бағдоддаги', 279),
(2687, 'article', 'теракт', 279),
(2688, 'article', 'қурбонлари', 279),
(2689, 'article', 'сони', 279),
(2690, 'article', 'кишига', 279),
(2691, 'article', 'етди', 279),
(2692, 'article', 'Мамлакатимизда', 280),
(2693, 'article', 'фуқаролар', 280),
(2694, 'article', 'йиғинлари', 280),
(2695, 'article', 'раислари', 280),
(2696, 'article', 'ва', 280),
(2697, 'article', 'уларнинг', 280),
(2698, 'article', 'маслаҳатчилари', 280),
(2699, 'article', 'сайлови', 280),
(2700, 'article', 'якунланди', 280),
(2701, 'article', 'Хитойда', 281),
(2702, 'article', 'юз', 281),
(2703, 'article', 'берган', 281),
(2704, 'article', 'табиий', 281),
(2705, 'article', 'офат', 281),
(2706, 'article', 'қурбонлари', 281),
(2707, 'article', 'сони', 281),
(2708, 'article', 'кишига', 281),
(2709, 'article', 'етди', 281),
(2720, 'article', 'Келажакка', 283),
(2721, 'article', 'ишонч', 283),
(2722, 'article', 'Вояга', 284),
(2723, 'article', 'етмаганлар', 284),
(2724, 'article', 'назоратингизда', 284),
(2725, 'article', 'бўлсин', 284),
(2726, 'article', '“Samsung”', 285),
(2727, 'article', 'совуткичлари', 285),
(2728, 'article', 'Ўзбекистонда', 285),
(2729, 'article', 'ишлаб', 285),
(2730, 'article', 'чиқарилмоқда', 285),
(2731, 'article', 'Ўзбекистонда', 286),
(2732, 'article', 'янги', 286),
(2733, 'article', 'мевали', 286),
(2734, 'article', 'дарахт', 286),
(2735, 'article', 'ўстирилмоқда', 286),
(2736, 'article', 'Тинчлик', 287),
(2737, 'article', 'барқарорлик', 287),
(2738, 'article', 'омили', 287),
(2755, 'article', 'юрт', 288),
(2756, 'article', 'эл', 288),
(2757, 'article', 'Шундай', 288),
(2758, 'article', 'шундай', 288),
(2759, 'article', 'бўлсин…', 288),
(2760, 'article', 'бўлсин', 288),
(2761, 'article', 'бор', 288),
(2762, 'article', 'бор', 288),
(2763, 'article', '“Учқўрғон', 289),
(2764, 'article', 'Кристалл”нинг', 289),
(2765, 'article', 'салқин', 289),
(2766, 'article', 'ичимликлари', 289),
(2767, 'article', 'Наманганлик', 290),
(2768, 'article', 'ёш', 290),
(2769, 'article', 'гимнастикачилар', 290),
(2770, 'article', 'ОТАСИГА', 291),
(2771, 'article', 'ТАРВУЗ', 291),
(2772, 'article', 'УЗИШДА', 291),
(2773, 'article', 'ЁРДАМ', 291),
(2774, 'article', 'БЕРАЁТГАН', 291),
(2775, 'article', 'ХИТОЙЛИК', 291),
(2776, 'article', 'БОЛАКАЙ', 291),
(2777, 'article', 'ИЖТИМОИЙ', 291),
(2778, 'article', 'ТАРМОҚ', 291),
(2779, 'article', 'ЮЛДУЗИГА', 291),
(2780, 'article', 'АЙЛАНДИ', 291),
(2786, 'article', 'Ҳилол', 292),
(2787, 'article', 'севаман»', 292),
(2788, 'article', 'Насимов', 292),
(2789, 'article', 'Наманганни', 292),
(2790, 'article', '«Санъатсевар', 292),
(2791, 'article', 'Ўзбекистонлик', 170),
(2792, 'article', 'тожига', 170),
(2793, 'article', 'талаба', 170),
(2794, 'article', 'сазовор', 170),
(2795, 'article', 'дурдонаси', 170),
(2796, 'article', 'Дунё', 170),
(2797, 'article', 'бўлди', 170),
(2798, 'article', 'quot', 170),
(2799, 'article', 'quot', 170),
(2800, 'article', 'БИЗНЕСГА', 293),
(2801, 'article', 'САЁҲАТ', 293),
(2802, 'article', 'БИЛАН', 293),
(2803, 'article', 'КЕЛАЖАК', 293),
(2804, 'article', 'САРИ', 293),
(2805, 'article', 'Португалия', 294),
(2806, 'article', 'ўз', 294),
(2807, 'article', 'тарихида', 294),
(2808, 'article', 'илк', 294),
(2809, 'article', 'маротаба', 294),
(2810, 'article', 'Европа', 294),
(2811, 'article', 'чемпионига', 294),
(2812, 'article', 'айланди', 294),
(2813, 'article', 'очиқ', 282),
(2814, 'article', 'ости', 282),
(2815, 'article', 'осмон', 282),
(2816, 'article', 'музейи', 282),
(2817, 'article', 'Ахсикент', 282),
(2818, 'article', 'Сирлар', 278),
(2819, 'article', 'саёҳат', 278),
(2820, 'article', 'кентига', 278),
(2821, 'article', 'Наманганда', 295),
(2822, 'article', 'шахмат', 295),
(2823, 'article', 'ва', 295),
(2824, 'article', 'шашка', 295),
(2825, 'article', 'бўйича', 295),
(2826, 'article', '“Биз', 295),
(2827, 'article', 'ақл', 295),
(2828, 'article', 'идрокли', 295),
(2829, 'article', 'оилалармиз”', 295),
(2830, 'article', 'спорт', 295),
(2831, 'article', 'мусобақасининг', 295),
(2832, 'article', 'ҳудудий', 295),
(2833, 'article', 'финал', 295),
(2834, 'article', 'босқичи', 295),
(2835, 'article', 'бўлиб', 295),
(2836, 'article', 'ўтди', 295),
(2837, 'article', 'Машҳур', 296),
(2838, 'article', 'сайёҳ', 296),
(2839, 'article', 'Конюхов', 296),
(2840, 'article', 'ҳаво', 296),
(2841, 'article', 'шарида', 296),
(2842, 'article', 'дунё', 296),
(2843, 'article', 'бўйлаб', 296),
(2844, 'article', 'саёҳатини', 296),
(2845, 'article', 'бошлади', 296),
(2846, 'article', 'БУЮК', 297),
(2847, 'article', 'КЕЛАЖАККА', 297),
(2848, 'article', 'ЭЛТУВЧИ', 297),
(2849, 'article', 'ЙЎЛЛАР', 297),
(2850, 'article', 'Ўзбекистон', 298),
(2851, 'article', 'ҳамда', 298),
(2852, 'article', 'Тожикистон', 298),
(2853, 'article', 'терма', 298),
(2854, 'article', 'жамоалари', 298),
(2855, 'article', 'ўртасидаги', 298),
(2856, 'article', 'ўртоқлик', 298),
(2857, 'article', 'учрашув', 298),
(2858, 'article', 'Ўзбекистон', 299),
(2859, 'article', 'аёллар', 299),
(2860, 'article', 'терма', 299),
(2861, 'article', 'жамоаси', 299),
(2862, 'article', 'Озарбайжон', 299),
(2863, 'article', 'билан', 299),
(2864, 'article', 'ўртоқлик', 299),
(2865, 'article', 'учрашуви', 299),
(2866, 'article', 'ўтказади', 299),
(2867, 'article', 'Гандбол', 300),
(2868, 'article', 'Ёшлар', 300),
(2869, 'article', 'ўртасидаги', 300),
(2870, 'article', 'жаҳон', 300),
(2871, 'article', 'чемпионатида', 300),
(2872, 'article', 'чорак', 300),
(2873, 'article', 'финалчилар', 300),
(2874, 'article', 'номи', 300),
(2875, 'article', 'маълум', 300),
(2876, 'article', 'бўлди', 300),
(2877, 'article', 'АЗИЗ', 301),
(2878, 'article', 'ЙЎЛДОШЕВ', 301),
(2879, 'article', '“МАЖНУНТОЛ”', 301),
(2880, 'article', 'ПРЕМЬЕРА', 301),
(2881, 'article', 'ВИДЕО', 301),
(2882, 'article', 'АЗИЗ', 302),
(2883, 'article', 'ЙЎЛДОШЕВ', 302),
(2884, 'article', '“МАЖНУНТОЛ”', 302),
(2885, 'article', 'ПРЕМЬЕРА', 302),
(2886, 'article', 'ВИДЕО', 302),
(2887, 'article', '“Ўзэкспомарказ”да', 303),
(2888, 'article', 'Халқаро', 303),
(2889, 'article', 'мева', 303),
(2890, 'article', 'сабзавот', 303),
(2891, 'article', 'ярмаркаси', 303),
(2892, 'article', 'очилди', 303),
(2893, 'article', 'Аҳоли', 304),
(2894, 'article', 'саломатлиги', 304),
(2895, 'article', 'йўлида', 304),
(2896, 'article', 'Австралияда', 305),
(2897, 'article', 'бургут', 305),
(2898, 'article', 'кичик', 305),
(2899, 'article', 'болани', 305),
(2900, 'article', 'кўтариб', 305),
(2901, 'article', 'кетмоқчи', 305),
(2902, 'article', 'бўлди', 305),
(2903, 'article', 'Мустақил', 306),
(2904, 'article', 'тараққиёт', 306),
(2905, 'article', 'йўлимизнинг', 306),
(2906, 'article', 'теран', 306),
(2907, 'article', 'таҳлили', 306),
(2908, 'article', 'Риодаги', 307),
(2909, 'article', 'Олимпия', 307),
(2910, 'article', 'ўйинларига', 307),
(2911, 'article', 'фоиздан', 307),
(2912, 'article', 'кўпроқ', 307),
(2913, 'article', 'чипта', 307),
(2914, 'article', 'сотиб', 307),
(2915, 'article', 'бўлинди', 307),
(2930, 'article', 'Япония', 308),
(2931, 'article', 'эгаллайди', 308),
(2932, 'article', 'шаҳзода', 308),
(2933, 'article', 'ўрнини', 308),
(2934, 'article', 'Нарухитога', 308),
(2935, 'article', 'императори', 308),
(2936, 'article', 'Акихито', 308),
(2945, 'article', '“Мадад', 309),
(2946, 'article', 'шаҳридаги', 309),
(2947, 'article', 'шарбатлари”', 309),
(2948, 'article', 'харидорларга', 309),
(2949, 'article', 'Наманган', 309),
(2950, 'article', 'манзур', 309),
(2951, 'article', 'малҳам', 309),
(2952, 'article', 'бўлмоқда', 309),
(2953, 'article', 'Ўртоқлик', 310),
(2954, 'article', 'учрашуви', 310),
(2955, 'article', 'Ўзбекистон', 310),
(2956, 'article', 'Тожикистон', 310),
(2957, 'article', 'ОЛТИН', 311),
(2958, 'article', 'ЁЗ', 311),
(2959, 'article', 'ЎТМОҚДА', 311),
(2960, 'article', 'СОЗ', 311),
(2988, 'article', 'Ҳилол', 312),
(2989, 'article', 'шаҳри', 312),
(2990, 'article', 'Ўзбекистон', 312),
(2991, 'article', 'мамлакати»', 312),
(2992, 'article', 'кинорежиссёр', 312),
(2993, 'article', 'дейди', 312),
(2994, 'article', 'гуллар', 312),
(2995, 'article', 'гуллар', 312),
(2996, 'article', '«Наманган', 312),
(2997, 'article', 'Ўзбекистонда', 313),
(2998, 'article', 'илк', 313),
(2999, 'article', 'марта', 313),
(3000, 'article', 'Халқаро', 313),
(3001, 'article', 'бокс', 313),
(3002, 'article', 'ассоциацияси', 313),
(3003, 'article', 'АIBА', 313),
(3004, 'article', 'йиғилиши', 313),
(3005, 'article', 'бўлиб', 313),
(3006, 'article', 'ўтди', 313),
(3007, 'article', 'Ўзбекистонда', 314),
(3008, 'article', 'илк', 314),
(3009, 'article', 'марта', 314),
(3010, 'article', 'Халқаро', 314),
(3011, 'article', 'бокс', 314),
(3012, 'article', 'ассоциацияси', 314),
(3013, 'article', 'АIBА', 314),
(3014, 'article', 'йиғилиши', 314),
(3015, 'article', 'бўлиб', 314),
(3016, 'article', 'ўтди', 314),
(3017, 'article', '«Менинг', 315),
(3018, 'article', 'юртим', 315),
(3019, 'article', 'менинг', 315),
(3020, 'article', 'бахтим»', 315),
(3021, 'article', 'лойиҳаси', 315),
(3022, 'article', 'кўтаринки', 315),
(3023, 'article', 'кайфиятда', 315),
(3024, 'article', 'ўтказилди', 315),
(3025, 'article', 'Ижтимоий', 316),
(3026, 'article', 'шериклик', 316),
(3027, 'article', 'амалиёт', 316),
(3028, 'article', 'ва', 316),
(3029, 'article', 'самара', 316),
(3040, 'article', 'Ҳусанов', 317),
(3041, 'article', 'яшамоқ', 317),
(3042, 'article', 'тотли', 317),
(3043, 'article', 'тизилгай', 317),
(3044, 'article', 'маржон', 317),
(3045, 'article', 'каби', 317),
(3046, 'article', 'йиллар…»', 317),
(3047, 'article', 'гўзал', 317),
(3048, 'article', 'Афзал', 317),
(3049, 'article', '«Ҳаёт', 317),
(3050, 'article', 'Одил', 318),
(3051, 'article', 'Аҳмедов', 318),
(3052, 'article', 'учинчи', 318),
(3053, 'article', 'марта', 318),
(3054, 'article', 'ота', 318),
(3055, 'article', 'бўлди', 318),
(3056, 'article', 'Ўзбекистонда', 319),
(3057, 'article', 'биринчи', 319),
(3058, 'article', 'автомобиль', 319),
(3059, 'article', 'ишлаб', 319),
(3060, 'article', 'чиқарилганига', 319),
(3061, 'article', 'йил', 319),
(3062, 'article', 'тўлди', 319),
(3063, 'article', 'Бухоролик', 320),
(3064, 'article', 'боғбон', 320),
(3065, 'article', 'битта', 320),
(3066, 'article', 'дарахтдан', 320),
(3067, 'article', 'икки', 320),
(3068, 'article', 'хил', 320),
(3069, 'article', 'мева', 320),
(3070, 'article', 'олмоқда', 320),
(3071, 'article', 'Ёш', 321),
(3072, 'article', 'журналистлар', 321),
(3073, 'article', 'медиа', 321),
(3074, 'article', 'тренинги', 321),
(3075, 'article', 'старт', 321),
(3076, 'article', 'олди', 321),
(3077, 'article', 'Оилавий', 322),
(3078, 'article', 'спортчилар', 322),
(3079, 'article', 'мусобақаси', 322),
(3080, 'article', 'Истиқбол', 323),
(3081, 'article', 'эгалари', 323),
(3082, 'article', 'форуми', 323),
(3083, 'article', 'Тошкентдаги', 324),
(3084, 'article', 'Инҳа', 324),
(3085, 'article', 'Университети', 324),
(3086, 'article', 'талабаси', 324),
(3087, 'article', 'мобиль', 324),
(3088, 'article', 'иловалари', 324),
(3089, 'article', 'ярмаркасида', 324),
(3090, 'article', 'ғолиб', 324),
(3091, 'article', 'бўлишди', 324),
(3092, 'article', 'Японияда', 325),
(3093, 'article', 'бир', 325),
(3094, 'article', 'ҳафта', 325),
(3095, 'article', 'ичида', 325),
(3096, 'article', 'иссиқ', 325),
(3097, 'article', 'уриши', 325),
(3098, 'article', 'натижасида', 325),
(3099, 'article', 'мингдан', 325),
(3100, 'article', 'ортиқ', 325),
(3101, 'article', 'киши', 325),
(3102, 'article', 'шифохонага', 325),
(3103, 'article', 'ётқизилди', 325),
(3104, 'article', 'Ўзбекистон', 326),
(3105, 'article', 'бош', 326),
(3106, 'article', 'вазири', 326),
(3107, 'article', 'Тожикистон', 326),
(3108, 'article', 'ҳукуматига', 326),
(3109, 'article', 'Роғун', 326),
(3110, 'article', 'ГЭСи', 326),
(3111, 'article', 'борасида', 326),
(3112, 'article', 'эътироз', 326),
(3113, 'article', 'мактуби', 326),
(3114, 'article', 'йўллади', 326),
(3115, 'article', 'Чимён', 327),
(3116, 'article', '«Қуёшли»', 327),
(3117, 'article', 'оромгоҳидаги', 327),
(3118, 'article', 'оромижон', 327),
(3119, 'article', 'дамлар', 327),
(3135, 'article', 'саодатдир', 329),
(3136, 'article', 'Кўнгил', 329),
(3137, 'article', 'бутунлиги', 329),
(3142, 'article', 'сайланди', 328),
(3143, 'article', 'раҳбар', 328),
(3144, 'article', 'Наманганда', 328),
(3145, 'article', '«Камолот»га', 328),
(3153, 'article', 'қарийб', 330),
(3154, 'article', 'Ўзбекистон', 330),
(3155, 'article', 'сони', 330),
(3156, 'article', 'нафарга', 330),
(3157, 'article', 'миллион', 330),
(3158, 'article', 'етди', 330),
(3159, 'article', 'аҳолиси', 330),
(3160, 'article', 'Янгиқўрғон', 331),
(3161, 'article', 'марказида', 331),
(3162, 'article', 'кўприк', 331),
(3163, 'article', 'фойдаланишга', 331),
(3164, 'article', 'топширилди', 331),
(3189, 'article', 'энг', 332),
(3190, 'article', 'шаънини', 332),
(3191, 'article', 'улуғлаш', 332),
(3192, 'article', 'Ватан', 332),
(3193, 'article', 'буюк', 332),
(3194, 'article', 'бахт', 332),
(3195, 'article', 'Наманган', 333),
(3196, 'article', 'вилоятида', 333),
(3197, 'article', 'жорий', 333),
(3198, 'article', 'йилнинг', 333),
(3199, 'article', 'олти', 333),
(3200, 'article', 'ойида', 333),
(3201, 'article', 'мингдан', 333),
(3202, 'article', 'зиёд', 333),
(3203, 'article', 'янги', 333),
(3204, 'article', 'иш', 333),
(3205, 'article', 'ўрни', 333),
(3206, 'article', 'яратилди', 333),
(3207, 'article', 'Чилида', 334),
(3208, 'article', 'та', 334),
(3209, 'article', 'китнинг', 334),
(3210, 'article', 'ўлими', 334),
(3211, 'article', 'сабаблари', 334),
(3212, 'article', 'ўрганилмоқда', 334),
(3213, 'article', 'моддий', 243),
(3214, 'article', 'маънавий', 243),
(3215, 'article', 'масъулиятсизлиги', 243),
(3216, 'article', 'Кимнингдир', 243),
(3217, 'article', 'келтиради', 243),
(3218, 'article', 'зарар', 243),
(3219, 'article', 'ва', 243),
(3220, 'article', 'Галдаги', 335),
(3221, 'article', 'вазифа', 335),
(3222, 'article', 'янада', 335),
(3223, 'article', 'масъулиятли', 335),
(3224, 'article', 'Тадбиркор', 336),
(3225, 'article', 'қизлар', 336),
(3226, 'article', 'ПОРТУГАЛИЯДАГИ', 337),
(3227, 'article', 'ХАЛҚАРО', 337),
(3228, 'article', 'АЭРОПОРТГА', 337),
(3229, 'article', 'РОНАЛДУ', 337),
(3230, 'article', 'НОМИ', 337),
(3231, 'article', 'БЕРИЛДИ', 337),
(3232, 'article', 'Олтин', 338),
(3233, 'article', 'медални', 338),
(3234, 'article', 'қўлга', 338),
(3235, 'article', 'киритган', 338),
(3236, 'article', 'спортчимиз', 338),
(3237, 'article', 'АҚШ', 338),
(3238, 'article', 'доллари', 338),
(3239, 'article', 'миқдоридаги', 338),
(3240, 'article', 'мукофот', 338),
(3241, 'article', 'пули', 338),
(3242, 'article', 'билан', 338),
(3243, 'article', 'тақдирланади', 338),
(3244, 'article', '“Солиқ', 339),
(3245, 'article', 'ҳақида', 339),
(3246, 'article', 'Сиз', 339),
(3247, 'article', 'нимани', 339),
(3248, 'article', 'биласиз', 339),
(3249, 'article', 'номли', 339),
(3250, 'article', 'викторина', 339),
(3251, 'article', 'ўтказилди', 339),
(3252, 'article', 'БИТИРУВЧИЛАРГА', 340),
(3253, 'article', 'СОЛИҚ', 340),
(3254, 'article', 'ИМТИЁЗЛАРИ', 340),
(3255, 'article', 'Ўзбекистонда', 341),
(3256, 'article', 'сайғоқлар', 341),
(3257, 'article', 'учун', 341),
(3258, 'article', 'комплекс', 341),
(3259, 'article', 'қўриқхона', 341),
(3260, 'article', 'ташкил', 341),
(3261, 'article', 'этилади', 341),
(3262, 'article', 'УЕФА', 342),
(3263, 'article', 'президентлиги', 342),
(3264, 'article', 'учун', 342),
(3265, 'article', 'номзодлар', 342),
(3266, 'article', 'маълум', 342),
(3267, 'article', 'қилинди', 342),
(3268, 'article', 'сайлов', 342),
(3269, 'article', 'сентябрда', 342),
(3270, 'article', 'Тезкор', 343),
(3271, 'article', 'Маҳалла', 343),
(3272, 'article', 'шаъни', 343),
(3273, 'article', 'учун', 343),
(3274, 'article', 'Ўзбек', 344),
(3275, 'article', 'олималари', 344),
(3276, 'article', 'томонидан', 344),
(3277, 'article', 'ҳомиладорликка', 344),
(3278, 'article', 'боғлиқ', 344),
(3279, 'article', 'бўлган', 344),
(3280, 'article', 'гипертензияни', 344),
(3281, 'article', 'прогнозлаш', 344),
(3282, 'article', 'усули', 344),
(3283, 'article', 'яратилди', 344),
(3284, 'article', 'Ўзбекистонлик', 345),
(3285, 'article', 'боксчи', 345),
(3286, 'article', 'Қудратилло', 345),
(3287, 'article', 'Абдуқаҳҳоров', 345),
(3288, 'article', 'WBC’нинг', 345),
(3289, 'article', 'Asian', 345),
(3290, 'article', 'Boxing', 345),
(3291, 'article', 'Council', 345),
(3292, 'article', 'Silver', 345),
(3293, 'article', 'камарини', 345),
(3294, 'article', 'қўлга', 345),
(3295, 'article', 'киритди', 345),
(3296, 'article', 'Олимпиада', 346),
(3297, 'article', 'машъаласини', 346),
(3298, 'article', 'ким', 346),
(3299, 'article', 'ёқади', 346),
(3300, 'article', 'Пелеми', 346),
(3301, 'article', 'Ернинг', 347),
(3302, 'article', 'миллиардинчи', 347),
(3303, 'article', 'фуқаросининг', 347),
(3304, 'article', 'онаси', 347),
(3305, 'article', 'саратондан', 347),
(3306, 'article', 'ҳаётдан', 347),
(3307, 'article', 'кўз', 347),
(3308, 'article', 'юмди', 347),
(3309, 'article', 'Экологик', 348),
(3310, 'article', 'экспертиза', 348),
(3311, 'article', 'табиатни', 348),
(3312, 'article', 'асраш', 348),
(3313, 'article', 'омили', 348),
(3314, 'article', 'Хитойда', 349),
(3315, 'article', 'генерал', 349),
(3316, 'article', 'порахўрлик', 349),
(3317, 'article', 'учун', 349),
(3318, 'article', 'умрбод', 349),
(3319, 'article', 'қамоқ', 349),
(3320, 'article', 'жазосига', 349),
(3321, 'article', 'ҳукм', 349),
(3322, 'article', 'қилинди', 349),
(3323, 'article', 'ЛИЗИНГ', 350),
(3324, 'article', 'КОМПАНИЯСИ', 350),
(3325, 'article', 'ЯНГИ', 350),
(3326, 'article', 'БИНОДА', 350),
(3327, 'article', 'Наманганда', 351),
(3328, 'article', '«ёш', 351),
(3329, 'article', 'тадбиркор', 351),
(3330, 'article', 'юртга', 351),
(3331, 'article', 'мададкор»', 351),
(3332, 'article', 'танловининг', 351),
(3333, 'article', 'вилоят', 351),
(3334, 'article', 'босқичи', 351),
(3335, 'article', 'бўлиб', 351),
(3336, 'article', 'ўтмоқда', 351),
(3337, 'article', 'Оқ', 352),
(3338, 'article', 'йўл', 352),
(3339, 'article', 'Наманган', 353),
(3340, 'article', 'шаҳридаги', 353),
(3341, 'article', 'Фурқат', 353),
(3342, 'article', 'номидаги', 353),
(3343, 'article', 'маҳалла', 353),
(3344, 'article', 'танлов', 353),
(3345, 'article', 'ғолиби', 353),
(3346, 'article', 'Ташкилотчилик', 354),
(3347, 'article', 'ҳам', 354),
(3348, 'article', 'керак', 354),
(3349, 'article', 'тарғибот', 354),
(3350, 'article', 'ҳам', 354),
(3351, 'article', 'Шерзодбекдан', 355),
(3352, 'article', 'кутилган', 355),
(3353, 'article', 'тарона', 355),
(3370, 'article', 'серқирралик', 356),
(3371, 'article', 'Муратдаги', 356),
(3378, 'article', 'ЯНГИ', 357),
(3379, 'article', 'ЎЗБЕКИСТОНДА', 357),
(3380, 'article', 'ТЕЛЕРАДИОКАНАЛ', 357),
(3381, 'article', 'ИШ', 357),
(3382, 'article', 'ИНТЕРНЕТ', 357),
(3383, 'article', 'БОШЛАДИ', 357),
(3384, 'article', 'Дониёр', 358),
(3385, 'article', 'Ғоипов', 358),
(3386, 'article', 'Ҳаёт', 358),
(3387, 'article', 'қўшиқлари', 358),
(3388, 'article', 'июлга', 359),
(3389, 'article', 'ўтар', 359),
(3390, 'article', 'кечаси', 359),
(3391, 'article', '«Юлдузлар', 359),
(3392, 'article', 'ёмғири»ни', 359),
(3393, 'article', 'кузатиш', 359),
(3394, 'article', 'мумкин', 359),
(3395, 'article', 'бўлади', 359),
(3405, 'article', 'ГИЁХВАНДЛИК', 360),
(3406, 'article', 'ВАБОСИ', 360),
(3407, 'article', 'АСР', 360),
(3408, 'article', 'Ўзбек', 361),
(3409, 'article', 'олимлари', 361),
(3410, 'article', 'йирик', 361),
(3411, 'article', 'ва', 361),
(3412, 'article', 'майда', 361),
(3413, 'article', 'шохли', 361),
(3414, 'article', 'ҳайвонларда', 361),
(3415, 'article', 'учрайдиган', 361),
(3416, 'article', 'касалликка', 361),
(3417, 'article', 'қарши', 361),
(3418, 'article', 'вакцина', 361),
(3419, 'article', 'ихтиро', 361),
(3420, 'article', 'қилишди', 361),
(3421, 'article', 'Ҳиндистонлик', 362),
(3422, 'article', 'миллиардер', 362),
(3423, 'article', 'уйни', 362),
(3424, 'article', 'электр', 362),
(3425, 'article', 'қуввати', 362),
(3426, 'article', 'билан', 362),
(3427, 'article', 'соат', 362),
(3428, 'article', 'таъминлай', 362),
(3429, 'article', 'оладиган', 362),
(3430, 'article', 'жуда', 362),
(3431, 'article', 'арзон', 362),
(3432, 'article', 'ихтиро', 362),
(3433, 'article', 'кашф', 362),
(3434, 'article', 'қилди', 362),
(3435, 'article', 'Ёшлик', 363),
(3436, 'article', 'даври', 363),
(3437, 'article', 'шукуҳи', 363),
(3438, 'article', 'Мустақиллик', 364),
(3439, 'article', 'неъматлари', 364),
(3443, 'article', 'Apple', 366),
(3444, 'article', 'икки', 366),
(3445, 'article', 'картали', 366),
(3446, 'article', 'iPhone', 366),
(3447, 'article', 'чиқариши', 366),
(3448, 'article', 'мумкин', 366),
(3449, 'article', 'Ҳиндистонда', 367),
(3450, 'article', 'чақмоқ', 367),
(3451, 'article', 'уришдан', 367),
(3452, 'article', 'киши', 367),
(3453, 'article', 'ҳалок', 367),
(3454, 'article', 'бўлди', 367),
(3467, 'article', 'ўтказилади', 368),
(3468, 'article', 'Наманганда', 368),
(3469, 'article', 'кунлари', 368),
(3470, 'article', 'гул', 368),
(3471, 'article', 'байрами', 368),
(3472, 'article', 'август', 368),
(3479, 'article', 'Наманганда', 369);
INSERT INTO `tags` (`id`, `target`, `tag_name`, `item_id`) VALUES
(3480, 'article', 'кураш', 369),
(3481, 'article', 'бўйича', 369),
(3482, 'article', '“Маҳалламиз', 369),
(3483, 'article', 'паҳлавонлари”', 369),
(3484, 'article', 'мусобақаси', 369),
(3485, 'article', 'ўтказилди', 369),
(3486, 'article', 'МАРРАНИ', 365),
(3487, 'article', 'КАТТА', 365),
(3488, 'article', 'ОЛЯПМИЗ', 365),
(3489, 'article', 'Тбилисидаги', 370),
(3490, 'article', 'халқаро', 370),
(3491, 'article', 'кимё', 370),
(3492, 'article', 'олимпиадасида', 370),
(3493, 'article', 'ўзбекистонлик', 370),
(3494, 'article', 'иштирокчилар', 370),
(3495, 'article', 'та', 370),
(3496, 'article', 'медални', 370),
(3497, 'article', 'қўлга', 370),
(3498, 'article', 'киритишди', 370),
(3499, 'article', 'Олимпиячиларимиз', 371),
(3500, 'article', 'Бразилияга', 371),
(3501, 'article', 'жўнаб', 371),
(3502, 'article', 'кетди', 371),
(3516, 'article', 'Наманган', 373),
(3517, 'article', 'шаҳридаги', 373),
(3518, 'article', '“Истиқлол', 373),
(3519, 'article', 'дизайн', 373),
(3520, 'article', 'маркази”', 373),
(3521, 'article', 'ички', 373),
(3522, 'article', 'ва', 373),
(3523, 'article', 'ташқи', 373),
(3524, 'article', 'бозорда', 373),
(3525, 'article', 'муносиб', 373),
(3526, 'article', 'ўрин', 373),
(3527, 'article', 'эгаллаган', 373),
(3528, 'article', 'фойдаланишга', 372),
(3529, 'article', 'турар', 372),
(3530, 'article', 'тумани', 372),
(3531, 'article', 'топширилади', 372),
(3532, 'article', 'намунавий', 372),
(3533, 'article', 'Наманган', 372),
(3534, 'article', 'массивида', 372),
(3535, 'article', 'лойиҳалар', 372),
(3536, 'article', 'Косонсой', 372),
(3537, 'article', 'жой', 372),
(3538, 'article', 'вилояти', 372),
(3539, 'article', 'Булоқ', 372),
(3540, 'article', 'асосидаги', 372),
(3541, 'article', 'Муҳаммад', 374),
(3542, 'article', 'Алининг', 374),
(3543, 'article', 'набираси', 374),
(3544, 'article', 'бобоси', 374),
(3545, 'article', 'каби', 374),
(3546, 'article', 'чемпион', 374),
(3547, 'article', 'бўлмоқчи', 374),
(3548, 'article', 'ФАРҒОНАЛИК', 375),
(3549, 'article', 'ЁШЛИ', 375),
(3550, 'article', 'БОЙДАДА', 375),
(3551, 'article', 'Битирувчилар', 376),
(3552, 'article', 'бандлиги', 376),
(3553, 'article', 'таъминланмоқда', 376),
(3554, 'article', 'Рио', 377),
(3555, 'article', 'де', 377),
(3556, 'article', 'Жанейродаги', 377),
(3557, 'article', 'Олимпия', 377),
(3558, 'article', 'шаҳарчасида', 377),
(3559, 'article', 'Ўзбекистон', 377),
(3560, 'article', 'байроғи', 377),
(3561, 'article', 'кўтарилди', 377),
(3584, 'article', 'қуши', 378),
(3585, 'article', 'қанотлари', 378),
(3586, 'article', 'Янги', 378),
(3587, 'article', 'этилади', 378),
(3588, 'article', 'Хумо', 378),
(3589, 'article', 'Тошкент', 378),
(3590, 'article', 'кўринишида', 378),
(3591, 'article', 'барпо', 378),
(3592, 'article', 'аэропорти', 378),
(3593, 'article', 'quot', 378),
(3594, 'article', 'quot', 378),
(3673, 'article', 'қадар', 379),
(3674, 'article', 'янги', 379),
(3675, 'article', 'эфири', 379),
(3676, 'article', 'этади', 379),
(3677, 'article', 'эрталабки', 379),
(3678, 'article', 'туширилди', 379),
(3679, 'article', 'телеканали', 379),
(3680, 'article', 'суткада', 379),
(3681, 'article', 'соат', 379),
(3682, 'article', 'соат', 379),
(3683, 'article', 'соат', 379),
(3684, 'article', 'синов', 379),
(3685, 'article', 'режимида', 379),
(3686, 'article', 'куни', 379),
(3687, 'article', 'кечки', 379),
(3688, 'article', 'Канал', 379),
(3689, 'article', 'ишга', 379),
(3690, 'article', 'дан', 379),
(3691, 'article', 'дан', 379),
(3692, 'article', 'давом', 379),
(3693, 'article', 'га', 379),
(3694, 'article', 'бошлаб', 379),
(3695, 'article', 'август', 379),
(3696, 'article', 'quot', 379),
(3697, 'article', 'quot', 379),
(3698, 'article', 'Milliy', 379),
(3699, 'article', 'Япония', 380),
(3700, 'article', 'императори', 380),
(3701, 'article', 'тахтни', 380),
(3702, 'article', 'топшириш', 380),
(3703, 'article', 'бўйича', 380),
(3704, 'article', 'телемурожаат', 380),
(3705, 'article', 'қилади', 380),
(3706, 'article', 'Rio–', 381),
(3707, 'article', 'Olimpiada', 381),
(3708, 'article', 'o‘yinlarining', 381),
(3709, 'article', 'ochilish', 381),
(3710, 'article', 'marosimini', 381),
(3711, 'article', 'mlrd', 381),
(3712, 'article', 'kishi', 381),
(3713, 'article', 'ko‘radi', 381),
(3714, 'article', 'Сарҳисоб', 382),
(3715, 'article', 'ва', 382),
(3716, 'article', 'таҳлил', 382),
(3717, 'article', 'Жорий', 383),
(3718, 'article', 'йилда', 383),
(3719, 'article', 'мактаб', 383),
(3720, 'article', 'ярмаркалари', 383),
(3721, 'article', 'учун', 383),
(3722, 'article', 'миллион', 383),
(3723, 'article', 'дона', 383),
(3724, 'article', 'ёзув', 383),
(3725, 'article', 'дафтари', 383),
(3726, 'article', 'етказиб', 383),
(3727, 'article', 'берилади', 383),
(3728, 'article', 'Косонсой', 384),
(3729, 'article', 'туманида', 384),
(3730, 'article', '“Қадрлаш”', 384),
(3731, 'article', 'дам', 384),
(3732, 'article', 'олиш', 384),
(3733, 'article', 'маскани', 384),
(3734, 'article', 'фойдаланишга', 384),
(3735, 'article', 'топширилди', 384),
(3746, 'article', 'Шерзодбек', 386),
(3747, 'article', 'премьера', 386),
(3748, 'article', 'ёр»', 386),
(3749, 'article', 'видео', 386),
(3750, 'article', '«Ёр', 386),
(3751, 'article', 'Шерзодбек', 387),
(3752, 'article', '«Ёр', 387),
(3753, 'article', 'ёр»', 387),
(3754, 'article', 'премьера', 387),
(3755, 'article', 'видео', 387),
(3756, 'article', 'ўйинлари', 385),
(3757, 'article', 'Олимпия', 385),
(3758, 'article', 'ёзги', 385),
(3759, 'article', 'бошланди', 385),
(3760, 'article', 'XXXI', 385),
(3761, 'article', 'Диёрбек', 388),
(3762, 'article', 'Ўрозбоев', 388),
(3763, 'article', 'бронза', 388),
(3764, 'article', 'медаль', 388),
(3765, 'article', 'соҳиби', 388),
(3766, 'article', 'Тайвань', 389),
(3767, 'article', 'аэропортида', 389),
(3768, 'article', 'бепарволик', 389),
(3769, 'article', 'сабаб', 389),
(3770, 'article', 'минглаб', 389),
(3771, 'article', 'тўтиқуш', 389),
(3772, 'article', 'нобуд', 389),
(3773, 'article', 'бўлди', 389),
(3774, 'article', 'Наманган', 390),
(3775, 'article', 'театри', 390),
(3776, 'article', 'мавсумини', 390),
(3777, 'article', 'бошлади', 390),
(3778, 'article', 'Ғиёсов', 391),
(3779, 'article', 'Олимпиададаги', 391),
(3780, 'article', 'иштирокини', 391),
(3781, 'article', 'ғалаба', 391),
(3782, 'article', 'билан', 391),
(3783, 'article', 'бошлади', 391),
(3784, 'article', 'Ришод', 392),
(3785, 'article', 'Собиров', 392),
(3786, 'article', 'Ўзбекистонга', 392),
(3787, 'article', 'Олимпиададаги', 392),
(3788, 'article', 'иккинчи', 392),
(3789, 'article', 'медални', 392),
(3790, 'article', 'келтирди', 392),
(3791, 'article', 'Наманганлик', 393),
(3792, 'article', 'футболчи', 393),
(3793, 'article', 'қизлар', 393),
(3794, 'article', 'минтақа', 393),
(3795, 'article', 'ғолиби', 393),
(3796, 'article', 'бўлди', 393),
(3797, 'article', 'Спортсевар', 394),
(3798, 'article', 'ёшлар', 394),
(3799, 'article', 'маскани', 394),
(3800, 'article', 'Рио', 395),
(3801, 'article', 'Ҳасанбой', 395),
(3802, 'article', 'Дўсматов', 395),
(3803, 'article', 'бокс', 395),
(3804, 'article', 'мусобақасининг', 395),
(3805, 'article', 'финалига', 395),
(3806, 'article', 'чиқди', 395),
(3867, 'article', '“Ягонасан', 398),
(3868, 'article', 'ўтди', 398),
(3869, 'article', 'танловининг', 398),
(3870, 'article', 'Пойтахтимизда', 398),
(3871, 'article', 'муқаддас', 398),
(3872, 'article', 'мамлакат', 398),
(3873, 'article', 'кўрик', 398),
(3874, 'article', 'Ватан', 398),
(3875, 'article', 'бўлиб', 398),
(3876, 'article', 'босқичи', 398),
(3877, 'article', '“Ягонасан', 397),
(3878, 'article', 'ўтди', 397),
(3879, 'article', 'танловининг', 397),
(3880, 'article', 'Пойтахтимизда', 397),
(3881, 'article', 'муқаддас', 397),
(3882, 'article', 'мамлакат', 397),
(3883, 'article', 'кўрик', 397),
(3884, 'article', 'Ватан', 397),
(3885, 'article', 'бўлиб', 397),
(3886, 'article', 'босқичи', 397),
(3887, 'article', '“Ягонасан', 396),
(3888, 'article', 'ўтди', 396),
(3889, 'article', 'танловининг', 396),
(3890, 'article', 'Пойтахтимизда', 396),
(3891, 'article', 'муқаддас', 396),
(3892, 'article', 'мамлакат', 396),
(3893, 'article', 'кўрик', 396),
(3894, 'article', 'Ватан', 396),
(3895, 'article', 'бўлиб', 396),
(3896, 'article', 'босқичи', 396),
(3897, 'article', 'Наманганда', 399),
(3898, 'article', 'картинг', 399),
(3899, 'article', 'бўйича', 399),
(3900, 'article', 'Ўзбекистон', 399),
(3901, 'article', 'кубогининг', 399),
(3902, 'article', 'финал', 399),
(3903, 'article', 'босқичи', 399),
(3904, 'article', 'бўлиб', 399),
(3905, 'article', 'ўтди', 399),
(3906, 'article', 'ОТАБЕК', 400),
(3907, 'article', 'МАҲКАМОВ', 400),
(3908, 'article', 'САЛБИЙ', 400),
(3909, 'article', 'РОЛЬ', 400),
(3910, 'article', 'ЎЙНАШДАН', 400),
(3911, 'article', 'ЧЎЧИМАЙДИГАН', 400),
(3912, 'article', 'АКТЁР', 400),
(3913, 'article', 'Олтиариқлик', 401),
(3914, 'article', 'боғбон', 401),
(3915, 'article', 'бир', 401),
(3916, 'article', 'туп', 401),
(3917, 'article', 'олма', 401),
(3918, 'article', 'дарахтидан', 401),
(3919, 'article', 'хил', 401),
(3920, 'article', 'навли', 401),
(3921, 'article', 'ҳосил', 401),
(3922, 'article', 'олиш', 401),
(3923, 'article', 'усулини', 401),
(3924, 'article', 'яратди', 401),
(3925, 'article', 'Илм', 402),
(3926, 'article', 'чўққиси', 402),
(3927, 'article', 'интилганники', 402),
(3928, 'article', 'Тўрақўрғонда', 403),
(3929, 'article', 'ҳар', 403),
(3930, 'article', 'бири', 403),
(3931, 'article', 'мегаваттга', 403),
(3932, 'article', 'эга', 403),
(3933, 'article', 'бўлган', 403),
(3934, 'article', 'иккита', 403),
(3935, 'article', 'буғ', 403),
(3936, 'article', 'газ', 403),
(3937, 'article', 'қурилмаси', 403),
(3938, 'article', 'қурилмоқда', 403),
(3939, 'article', 'Наманган', 404),
(3940, 'article', 'туманида', 404),
(3941, 'article', 'жорий', 404),
(3942, 'article', 'йилда', 404),
(3943, 'article', 'миллион', 404),
(3944, 'article', 'долларлик', 404),
(3945, 'article', 'саноат', 404),
(3946, 'article', 'маҳсулотлари', 404),
(3947, 'article', 'экспорт', 404),
(3948, 'article', 'қилинади', 404),
(3949, 'article', 'Ҳасанбой', 405),
(3950, 'article', 'Дўсматовнинг', 405),
(3951, 'article', 'ғалабали', 405),
(3952, 'article', 'онлари', 405),
(3953, 'article', 'Аҳоли', 406),
(3954, 'article', 'саломатлиги', 406),
(3955, 'article', 'доимий', 406),
(3956, 'article', 'эътиборда', 406),
(3957, 'article', 'Наманган', 407),
(3958, 'article', 'ёшлар', 407),
(3959, 'article', 'маркази', 407),
(3960, 'article', '“Энг', 407),
(3961, 'article', 'улуғ', 407),
(3962, 'article', 'энг', 407),
(3963, 'article', 'азиз', 407),
(3964, 'article', 'танлови', 407),
(3965, 'article', 'Америкалик', 408),
(3966, 'article', 'режиссёр', 408),
(3967, 'article', '«Пахтакор—', 408),
(3968, 'article', 'ҳақида', 408),
(3969, 'article', 'ҳужжатли', 408),
(3970, 'article', 'фильм', 408),
(3971, 'article', 'ишлашга', 408),
(3972, 'article', 'киришди', 408),
(3973, 'article', '“Энг', 409),
(3974, 'article', 'улуғ', 409),
(3975, 'article', 'энг', 409),
(3976, 'article', 'азиз', 409),
(3977, 'article', 'танловининг', 409),
(3978, 'article', 'Наманган', 409),
(3979, 'article', 'вилоят', 409),
(3980, 'article', 'босқичи', 409),
(3981, 'article', 'Киевдаги', 410),
(3982, 'article', 'ҳайвонот', 410),
(3983, 'article', 'боғида', 410),
(3984, 'article', 'оппоқ', 410),
(3985, 'article', 'шер', 410),
(3986, 'article', 'болалари', 410),
(3987, 'article', 'дунёга', 410),
(3988, 'article', 'келди', 410),
(3989, 'article', 'Наманганда', 411),
(3990, 'article', '«Истиқлол', 411),
(3991, 'article', 'фарзандларимиз', 411),
(3992, 'article', 'шиори', 411),
(3993, 'article', 'остида', 411),
(3994, 'article', 'концерт', 411),
(3995, 'article', 'ташкил', 411),
(3996, 'article', 'этилди', 411),
(3997, 'article', 'Наманганда', 412),
(3998, 'article', '«Истиқлол', 412),
(3999, 'article', 'фарзандларимиз', 412),
(4000, 'article', 'шиори', 412),
(4001, 'article', 'остида', 412),
(4002, 'article', 'концерт', 412),
(4003, 'article', 'ташкил', 412),
(4004, 'article', 'этилди', 412),
(4005, 'article', 'Наманганда', 413),
(4006, 'article', '«Истиқлол', 413),
(4007, 'article', 'фарзандларимиз', 413),
(4008, 'article', 'шиори', 413),
(4009, 'article', 'остида', 413),
(4010, 'article', 'концерт', 413),
(4011, 'article', 'ташкил', 413),
(4012, 'article', 'этилди', 413),
(4021, 'article', 'этилди', 414),
(4022, 'article', 'шиори', 414),
(4023, 'article', 'фарзандларимиз', 414),
(4024, 'article', 'ташкил', 414),
(4025, 'article', 'остида', 414),
(4026, 'article', 'Наманганда', 414),
(4027, 'article', 'концерт', 414),
(4028, 'article', '«Истиқлол', 414),
(4029, 'article', 'Рио', 415),
(4030, 'article', 'Ҳасанбой', 415),
(4031, 'article', 'Дўстматовнинг', 415),
(4032, 'article', 'бугунги', 415),
(4033, 'article', 'финал', 415),
(4034, 'article', 'олдидан', 415),
(4035, 'article', 'фикрлари', 415),
(4041, 'article', 'чемпиони', 416),
(4042, 'article', 'ўғлони', 416),
(4043, 'article', 'Ўзбек', 416),
(4044, 'article', 'Рио', 416),
(4045, 'article', 'Олимпия', 416),
(4056, 'article', 'ғалабасидан', 417),
(4057, 'article', 'чемпиони', 417),
(4058, 'article', 'хонадонидан', 417),
(4059, 'article', 'сўнг', 417),
(4060, 'article', 'Олимпиада', 417),
(4061, 'article', 'маҳалла', 417),
(4062, 'article', 'кўчада»', 417),
(4063, 'article', 'Дўстматовнинг', 417),
(4064, 'article', 'бутун', 417),
(4065, 'article', '«Ҳасанбойнинг', 417),
(4066, 'article', 'Рио', 418),
(4067, 'article', 'Элмурод', 418),
(4068, 'article', 'Тасмуродов', 418),
(4069, 'article', 'бронза', 418),
(4070, 'article', 'медали', 418),
(4071, 'article', 'соҳиби', 418),
(4072, 'article', 'бўлди', 418),
(4073, 'article', 'Жорий', 419),
(4074, 'article', 'йилда', 419),
(4075, 'article', 'Наманган', 419),
(4076, 'article', 'вилоятида', 419),
(4077, 'article', 'минг', 419),
(4078, 'article', 'гектардан', 419),
(4079, 'article', 'зиёд', 419),
(4080, 'article', 'майдонда', 419),
(4081, 'article', 'қишлоқ', 419),
(4082, 'article', 'хўжалиги', 419),
(4083, 'article', 'маҳсулотлари', 419),
(4084, 'article', 'етиштирилмоқда', 419),
(4085, 'article', 'Жорий', 420),
(4086, 'article', 'йилда', 420),
(4087, 'article', 'Наманган', 420),
(4088, 'article', 'вилоятида', 420),
(4089, 'article', 'минг', 420),
(4090, 'article', 'гектардан', 420),
(4091, 'article', 'зиёд', 420),
(4092, 'article', 'майдонда', 420),
(4093, 'article', 'қишлоқ', 420),
(4094, 'article', 'хўжалиги', 420),
(4095, 'article', 'маҳсулотлари', 420),
(4096, 'article', 'етиштирилмоқда', 420),
(4097, 'article', 'Сифатли', 421),
(4098, 'article', 'ва', 421),
(4099, 'article', 'бежирим', 421),
(4100, 'article', 'Сифатли', 422),
(4101, 'article', 'ва', 422),
(4102, 'article', 'бежирим', 422),
(4103, 'article', 'Киевда', 423),
(4104, 'article', 'Ravon', 423),
(4105, 'article', 'бренди', 423),
(4106, 'article', 'тақдимоти', 423),
(4107, 'article', 'бўлиб', 423),
(4108, 'article', 'ўтди', 423),
(4109, 'article', 'Руслан', 424),
(4110, 'article', 'Нуриддинов', 424),
(4111, 'article', 'Олимпия', 424),
(4112, 'article', 'ўйинлари', 424),
(4113, 'article', 'рекордини', 424),
(4114, 'article', 'янгилаб', 424),
(4115, 'article', 'Ўзбекистон', 424),
(4116, 'article', 'делегацияси', 424),
(4117, 'article', 'ҳисобига', 424),
(4118, 'article', 'иккинчи', 424),
(4119, 'article', 'олтин', 424),
(4120, 'article', 'медални', 424),
(4121, 'article', 'тақдим', 424),
(4122, 'article', 'этди', 424),
(4123, 'article', 'Экоҳаракатнинг', 425),
(4124, 'article', 'Наманган', 425),
(4125, 'article', 'вилояти', 425),
(4126, 'article', 'ҳудудий', 425),
(4127, 'article', 'бўлими', 425),
(4128, 'article', 'қошида', 425),
(4129, 'article', 'ахборот', 425),
(4130, 'article', 'ресурс', 425),
(4131, 'article', 'маркази', 425),
(4132, 'article', 'очилди', 425),
(4133, 'article', 'Наманганнинг', 426),
(4134, 'article', 'муроди', 426),
(4137, 'article', 'Мутақиллик', 428),
(4138, 'article', 'саёҳати', 428),
(4146, 'article', '“Мустақиллик', 429),
(4147, 'article', 'юқори', 429),
(4148, 'article', 'ўтказилди', 429),
(4149, 'article', 'саёҳати”', 429),
(4150, 'article', 'савияда', 429),
(4151, 'article', 'Наманганда', 429),
(4152, 'article', 'лойиси', 429),
(4153, 'article', 'Муроджон', 430),
(4154, 'article', 'Аҳмадалиев', 430),
(4155, 'article', 'рақибини', 430),
(4156, 'article', 'раунддаёқ', 430),
(4157, 'article', 'нокаутга', 430),
(4158, 'article', 'учратиб', 430),
(4159, 'article', 'камида', 430),
(4160, 'article', 'бронзани', 430),
(4161, 'article', 'нақд', 430),
(4162, 'article', 'қилди', 430),
(4168, 'article', 'ғалабасидир', 431),
(4169, 'article', 'ғалабаси', 431),
(4170, 'article', 'Ўғлимнинг', 431),
(4171, 'article', 'Ўзбекистонимиз', 431),
(4172, 'article', 'бутун', 431),
(4173, 'article', 'Ҳаракатда', 432),
(4174, 'article', 'баракот', 432),
(4175, 'article', 'Олға', 433),
(4176, 'article', 'Мурожджон', 433),
(4179, 'article', 'Олға', 434),
(4180, 'article', 'Муроджон', 434),
(4181, 'article', 'саёҳати', 427),
(4182, 'article', 'Мутақиллик', 427),
(4183, 'article', 'Боксда', 435),
(4184, 'article', 'медаллар', 435),
(4185, 'article', 'жамғариш', 435),
(4186, 'article', 'бўйича', 435),
(4187, 'article', 'Ўзбекистон', 435),
(4188, 'article', 'делегацияси', 435),
(4189, 'article', 'ўринда', 435),
(4202, 'article', 'Ғиёсов', 436),
(4203, 'article', 'Шаҳрам', 436),
(4204, 'article', 'соҳиби', 436),
(4205, 'article', 'Рио', 436),
(4206, 'article', 'медал', 436),
(4207, 'article', 'кумуш', 436),
(4208, 'article', 'Муваффақиятлар', 437),
(4209, 'article', 'бизни', 437),
(4210, 'article', 'марралар', 437),
(4211, 'article', 'сари', 437),
(4212, 'article', 'элтади', 437),
(4213, 'article', 'Нурли', 438),
(4214, 'article', 'келажак', 438),
(4215, 'article', 'ворислари', 438),
(4216, 'article', 'Туркияда', 439),
(4217, 'article', 'соат', 439),
(4218, 'article', 'ичида', 439),
(4219, 'article', 'иккинчи', 439),
(4220, 'article', 'йирик', 439),
(4221, 'article', 'теракт', 439),
(4222, 'article', 'Жабрланганлар', 439),
(4223, 'article', 'сони', 439),
(4224, 'article', 'нафарга', 439),
(4225, 'article', 'яқинлашди', 439),
(4226, 'article', 'Меҳнатга', 440),
(4227, 'article', 'муносиб', 440),
(4228, 'article', 'рағбат', 440),
(4229, 'article', 'Сингапур', 441),
(4230, 'article', 'газетасида', 441),
(4231, 'article', 'ўзбек', 441),
(4232, 'article', 'оши', 441),
(4233, 'article', 'ҳақида', 441),
(4234, 'article', 'мақола', 441),
(4235, 'article', 'чоп', 441),
(4236, 'article', 'этилди', 441),
(4237, 'article', 'Рио', 442),
(4238, 'article', 'Бектемир', 442),
(4239, 'article', 'Мелиқўзиев', 442),
(4240, 'article', 'финалда', 442),
(4241, 'article', 'Муроджон', 442),
(4242, 'article', 'Аҳмадалиев', 442),
(4243, 'article', 'эса', 442),
(4244, 'article', 'бронза', 442),
(4245, 'article', 'медали', 442),
(4246, 'article', 'совриндори', 442),
(4247, 'article', 'Nexia', 443),
(4248, 'article', 'нинг', 443),
(4249, 'article', 'илк', 443),
(4250, 'article', 'харидорлари', 443),
(4251, 'article', 'ўз', 443),
(4252, 'article', 'автомобилларини', 443),
(4253, 'article', 'олишди', 443),
(4254, 'article', 'Муроджон', 444),
(4255, 'article', 'Аҳмадалиев', 444),
(4256, 'article', 'бронза', 444),
(4257, 'article', 'медали', 444),
(4258, 'article', 'соҳиби', 444),
(4259, 'article', 'Наманганда', 445),
(4260, 'article', '“Ҳеч', 445),
(4261, 'article', 'ким', 445),
(4262, 'article', 'меҳр', 445),
(4263, 'article', 'ва', 445),
(4264, 'article', 'эътибордан', 445),
(4265, 'article', 'четда', 445),
(4266, 'article', 'қолмасин', 445),
(4267, 'article', 'шиори', 445),
(4268, 'article', 'остида', 445),
(4269, 'article', 'тиббий', 445),
(4270, 'article', 'ижтимоий', 445),
(4271, 'article', 'акцияда', 445),
(4272, 'article', 'ўтказилмоқда', 445),
(4273, 'article', 'ШЕРЗОДБЕК', 446),
(4274, 'article', 'ЎЗГАРМАЙМАН', 446),
(4275, 'article', 'ЎЗГАРИШДАН', 446),
(4276, 'article', 'ҚЎРҚАМАН', 446),
(4277, 'article', 'Наманганда', 447),
(4278, 'article', '«Фарзандлари', 447),
(4279, 'article', 'соғлом', 447),
(4280, 'article', 'юрт', 447),
(4281, 'article', 'қудратли', 447),
(4282, 'article', 'бўлур', 447),
(4283, 'article', 'шиори', 447),
(4284, 'article', 'остида', 447),
(4285, 'article', 'мусобақа', 447),
(4286, 'article', 'бўлиб', 447),
(4287, 'article', 'ўтди', 447),
(4288, 'article', 'Имтиҳон', 448),
(4289, 'article', 'натижалари', 448),
(4290, 'article', 'эълон', 448),
(4291, 'article', 'қилинмоқда', 448),
(4292, 'article', 'жавоблар', 448),
(4293, 'article', 'тахтаси', 448),
(4294, 'article', 'август', 448),
(4295, 'article', 'тонгида', 448),
(4296, 'article', 'ОТМ', 448),
(4297, 'article', 'ҳудудларида', 448),
(4298, 'article', 'осиғлиқ', 448),
(4299, 'article', 'бўлади', 448),
(4300, 'article', 'Калининграддаги', 449),
(4301, 'article', 'кўча', 449),
(4302, 'article', 'таомлари', 449),
(4303, 'article', 'фестивалида', 449),
(4304, 'article', 'ўзбекча', 449),
(4305, 'article', 'ош', 449),
(4306, 'article', 'дамланди', 449),
(4307, 'article', 'фото', 449),
(4308, 'article', 'ТОШКЕНТДАН', 450),
(4309, 'article', 'ФАРҒОНА', 450),
(4310, 'article', 'ВОДИЙСИГА', 450),
(4311, 'article', 'ИЛК', 450),
(4312, 'article', 'ЙЎЛОВЧИ', 450),
(4313, 'article', 'ПОЕЗДИ', 450),
(4314, 'article', 'ҚАЧОН', 450),
(4315, 'article', 'ИШГА', 450),
(4316, 'article', 'ТУШИРИЛИШИ', 450),
(4317, 'article', 'МАЪЛУМ', 450),
(4318, 'article', 'БЎЛДИ', 450),
(4319, 'article', 'Жаҳон', 451),
(4320, 'article', 'спорт', 451),
(4321, 'article', 'мухлислари', 451),
(4322, 'article', 'эътиборини', 451),
(4323, 'article', 'Ўзбекистонга', 451),
(4324, 'article', 'қаратаётганлар', 451),
(4325, 'article', 'сафида', 451),
(4326, 'article', 'ўғлим', 451),
(4327, 'article', 'ҳам', 451),
(4328, 'article', 'борлигидан', 451),
(4329, 'article', 'фахрланаман', 451),
(4330, 'article', 'Ватан', 452),
(4331, 'article', 'фидоий', 452),
(4332, 'article', 'фарзандларни', 452),
(4333, 'article', 'ҳеч', 452),
(4334, 'article', 'қачон', 452),
(4335, 'article', 'унутмайди', 452),
(4336, 'article', 'Бектемир', 453),
(4337, 'article', 'Мелиқўзиев', 453),
(4338, 'article', 'Ўзбекистонга', 453),
(4339, 'article', 'иккинчи', 453),
(4340, 'article', 'кумуш', 453),
(4341, 'article', 'медаль', 453),
(4342, 'article', 'келтирди', 453),
(4343, 'article', 'Умумжамоа', 454),
(4344, 'article', 'ҳисобида', 454),
(4345, 'article', 'илк', 454),
(4346, 'article', 'бор', 454),
(4347, 'article', 'ўриндамиз', 454),
(4348, 'article', 'МДҲда', 454),
(4349, 'article', 'эса', 454),
(4350, 'article', 'иккинчимиз', 454),
(4351, 'article', 'Ҳасанбой', 455),
(4352, 'article', 'Дўсматов', 455),
(4353, 'article', 'Олимпиаданинг', 455),
(4354, 'article', 'энг', 455),
(4355, 'article', 'яхши', 455),
(4356, 'article', 'боксчиси', 455),
(4357, 'article', 'деб', 455),
(4358, 'article', 'топилди', 455),
(4359, 'article', 'Қойил', 456),
(4360, 'article', 'Боксчиларимиз', 456),
(4361, 'article', 'умумжамоа', 456),
(4362, 'article', 'ҳисобида', 456),
(4363, 'article', 'биринчи', 456),
(4364, 'article', 'бўлишди', 456),
(4365, 'article', 'Фазлиддин', 457),
(4366, 'article', 'Ғоибназаров', 457),
(4367, 'article', 'Олимпиада', 457),
(4368, 'article', 'ғолиби', 457),
(4369, 'article', 'Иш', 458),
(4370, 'article', 'ҳақи', 458),
(4371, 'article', 'пенсиялар', 458),
(4372, 'article', 'стипендиялар', 458),
(4373, 'article', 'ва', 458),
(4374, 'article', 'нафақалар', 458),
(4375, 'article', 'миқдорини', 458),
(4376, 'article', 'ошириш', 458),
(4377, 'article', 'тўғрисида', 458),
(4378, 'article', 'Рустам', 459),
(4379, 'article', 'Тўлқунов', 459),
(4380, 'article', 'Ижод', 459),
(4381, 'article', 'сеҳри', 459),
(4382, 'article', 'Наманганда', 460),
(4383, 'article', 'белбоғли', 460),
(4384, 'article', 'кураш', 460),
(4385, 'article', 'бўйича', 460),
(4386, 'article', 'катталар', 460),
(4387, 'article', 'ўртасида', 460),
(4388, 'article', 'Ўзбекистон', 460),
(4389, 'article', 'чемпионати', 460),
(4390, 'article', 'бўлиб', 460),
(4391, 'article', 'ўтди', 460),
(4392, 'article', 'Ёнғин', 461),
(4393, 'article', 'хавфсизлиги', 461),
(4394, 'article', 'барчамиз', 461),
(4395, 'article', 'масъулмиз', 461),
(4575, 'article', 'ҳаракатланмоқда', 462),
(4576, 'article', 'юк', 462),
(4577, 'article', 'электрлаштирилган', 462),
(4578, 'article', 'темир', 462),
(4579, 'article', 'Поп', 462),
(4580, 'article', 'поездлари', 462),
(4581, 'article', 'йўлида', 462),
(4582, 'article', 'Ангрен', 462),
(4583, 'article', 'Наманган', 463),
(4584, 'article', 'вилояти', 463),
(4585, 'article', 'Бунёдкорлик', 463),
(4586, 'article', 'ва', 463),
(4587, 'article', 'ободлик', 463),
(4588, 'article', 'қадри', 463),
(4589, 'article', 'Тасанно', 464),
(4590, 'article', 'сизга', 464),
(4591, 'article', 'Ватан', 464),
(4592, 'article', 'шарафини', 464),
(4593, 'article', 'юксалтирган', 464),
(4594, 'article', 'спортчилар', 464),
(4595, 'article', 'Тўрт', 465),
(4596, 'article', 'фуқаро', 465),
(4597, 'article', 'Ўзбекистон', 465),
(4598, 'article', 'Қаҳрамони', 465),
(4599, 'article', 'унвонига', 465),
(4600, 'article', 'муносиб', 465),
(4601, 'article', 'топилди', 465),
(4602, 'article', 'Тинчлик', 466),
(4603, 'article', 'осойишталик', 466),
(4604, 'article', 'энг', 466),
(4605, 'article', 'олий', 466),
(4606, 'article', 'неъматдир', 466),
(4607, 'article', 'Ёшларга', 467),
(4608, 'article', 'оид', 467),
(4609, 'article', 'давлат', 467),
(4610, 'article', 'сиёсати', 467),
(4611, 'article', 'жамият', 467),
(4612, 'article', 'ривожининг', 467),
(4613, 'article', 'муҳим', 467),
(4614, 'article', 'омили', 467),
(4615, 'article', 'Наманганда', 468),
(4616, 'article', 'quot', 468),
(4617, 'article', 'Пневматик', 468),
(4618, 'article', 'қуролдан', 468),
(4619, 'article', 'ўқ', 468),
(4620, 'article', 'отиш', 468),
(4621, 'article', 'quot', 468),
(4622, 'article', 'тури', 468),
(4623, 'article', 'бўйича', 468),
(4624, 'article', 'Ўзбекистон', 468),
(4625, 'article', 'кубогининг', 468),
(4626, 'article', 'финал', 468),
(4627, 'article', 'босқичи', 468),
(4628, 'article', 'юқори', 468),
(4629, 'article', 'савияда', 468),
(4630, 'article', 'ўтказилди', 468),
(4640, 'article', 'қонунни', 469),
(4641, 'article', 'қилди', 469),
(4642, 'article', 'қабул', 469),
(4643, 'article', 'Ўзбекистон', 469),
(4644, 'article', 'тўғрисидаги', 469),
(4645, 'article', 'Сенати', 469),
(4646, 'article', 'органлари', 469),
(4647, 'article', 'ишлар', 469),
(4648, 'article', 'ички', 469),
(4649, 'article', 'Интенсив', 470),
(4650, 'article', 'боғнинг', 470),
(4651, 'article', 'ҳосили', 470),
(4668, 'article', '“Фурқат“', 471),
(4669, 'article', 'фуқаролар', 471),
(4670, 'article', 'Учинчи', 471),
(4671, 'article', 'ўринга', 471),
(4672, 'article', 'сазовор', 471),
(4673, 'article', 'маҳалла', 471),
(4674, 'article', 'йиғини', 471),
(4675, 'article', 'бўлди', 471),
(4676, 'article', 'Наманганлик', 472),
(4677, 'article', 'зиёратчиларнинг', 472),
(4678, 'article', 'дастлабки', 472),
(4679, 'article', 'гуруҳи', 472),
(4680, 'article', 'ҳаж', 472),
(4681, 'article', 'сафарига', 472),
(4682, 'article', 'жўнаб', 472),
(4683, 'article', 'кетди', 472),
(4692, 'article', 'фуқаро', 473),
(4693, 'article', 'тақдирланди', 473),
(4694, 'article', 'ошган', 473),
(4695, 'article', 'нафар', 473),
(4696, 'article', 'медали', 473),
(4697, 'article', 'ёшдан', 473),
(4698, 'article', 'билан', 473),
(4699, 'article', '«Шуҳрат»', 473),
(4710, 'article', 'ЭНГ', 474),
(4711, 'article', 'ШАХМАТЧИ', 474),
(4712, 'article', 'УСТАЛИГИГА', 474),
(4713, 'article', 'ЎЗБЕКИСТОНЛИК', 474),
(4714, 'article', 'СПОРТ', 474),
(4715, 'article', 'НОМЗОД', 474),
(4716, 'article', 'ЁШЛИ', 474),
(4717, 'article', 'ЁШ', 474),
(4718, 'article', 'ДУНЁДАГИ', 474),
(4719, 'article', 'БЎЛДИ', 474),
(4720, 'article', 'Шошилинч', 475),
(4721, 'article', 'тиббий', 475),
(4722, 'article', 'ёрдам', 475),
(4723, 'article', 'хизмати', 475),
(4724, 'article', 'Муроджон', 476),
(4725, 'article', 'Аҳмадалиев', 476),
(4726, 'article', '“Ўзбекистон', 476),
(4727, 'article', 'Республикасида', 476),
(4728, 'article', 'хизмат', 476),
(4729, 'article', 'кўрсатган', 476),
(4730, 'article', 'спортчи”', 476),
(4731, 'article', 'унвони', 476),
(4732, 'article', 'билан', 476),
(4733, 'article', 'тақдирланди', 476),
(4755, 'article', 'очилди', 477),
(4756, 'article', 'Наманганда', 477),
(4757, 'article', 'моделлаш', 477),
(4758, 'article', 'марказини', 477),
(4759, 'article', 'либослар', 477),
(4760, 'article', 'дизайни', 477),
(4761, 'article', 'ва', 477),
(4762, 'article', 'Анънавий', 478),
(4763, 'article', 'август', 478),
(4764, 'article', 'кенгаши', 478),
(4770, 'article', 'Эртага', 479),
(4771, 'article', 'фото', 479),
(4772, 'article', 'Наманганда', 479),
(4773, 'article', 'гул', 479),
(4774, 'article', 'байрами', 479),
(4775, 'article', 'Ўзбекистон', 480),
(4776, 'article', 'Республикаси', 480),
(4777, 'article', 'Мустақиллигининг', 480),
(4778, 'article', 'йигирма', 480),
(4779, 'article', 'беш', 480),
(4780, 'article', 'йиллиги', 480),
(4781, 'article', 'нишонланиши', 480),
(4782, 'article', 'муносабати', 480),
(4783, 'article', 'билан', 480),
(4784, 'article', 'дам', 480),
(4785, 'article', 'олиш', 480),
(4786, 'article', 'кунини', 480),
(4787, 'article', 'кўчириш', 480),
(4788, 'article', 'тўғрисида', 480),
(4792, 'article', 'Наманганда', 481),
(4793, 'article', 'гул', 481),
(4794, 'article', 'байрами', 481),
(4807, 'article', '«Тошбулоқ', 483),
(4808, 'article', 'деҳқон', 483),
(4809, 'article', 'бозори»', 483),
(4810, 'article', 'янги', 483),
(4811, 'article', 'қиёфада', 483),
(4812, 'article', 'яшовчи', 482),
(4813, 'article', 'туманида', 482),
(4814, 'article', 'томонидан', 482),
(4815, 'article', 'тақдирланди', 482),
(4816, 'article', 'Президенти', 482),
(4817, 'article', 'Наманган', 482),
(4818, 'article', 'Морияхон', 482),
(4819, 'article', 'момо', 482),
(4820, 'article', 'медали', 482),
(4821, 'article', 'ёшли', 482),
(4822, 'article', 'билан', 482),
(4823, 'article', '«Шуҳрат»', 482),
(4830, 'article', 'Тошкент', 484),
(4831, 'article', 'Андижон', 484),
(4832, 'article', 'поезди', 484),
(4833, 'article', 'қатнови', 484),
(4834, 'article', 'йўлга', 484),
(4835, 'article', 'қўйилди', 484),
(4836, 'article', 'Наманган', 485),
(4837, 'article', 'шаҳрида', 485),
(4838, 'article', '«Аёллар', 485),
(4839, 'article', 'комплекси»', 485),
(4840, 'article', 'очилди', 485),
(4841, 'article', 'Олимпиадада', 486),
(4842, 'article', 'совриндор', 486),
(4843, 'article', 'бўлган', 486),
(4844, 'article', 'ўзбек', 486),
(4845, 'article', 'спортчиларига', 486),
(4846, 'article', 'quot', 486),
(4847, 'article', 'Малибу', 486),
(4848, 'article', 'quot', 486),
(4849, 'article', 'автомобиллари', 486),
(4850, 'article', 'топширилди', 486),
(4861, 'article', '“Malibu”', 487),
(4862, 'article', 'ғолиб', 487),
(4863, 'article', 'топширилди', 487),
(4864, 'article', 'совриндорларига', 487),
(4865, 'article', 'пул', 487),
(4866, 'article', 'Олимпиада', 487),
(4867, 'article', 'мукофоти', 487),
(4868, 'article', 'ва', 487),
(4869, 'article', 'ва', 487),
(4870, 'article', 'автомобиллари', 487),
(4878, 'article', 'Фото', 489),
(4879, 'article', 'Паралимпиячиларни', 489),
(4880, 'article', 'Бразилияга', 489),
(4881, 'article', 'кузатиш', 489),
(4882, 'article', 'маросими', 489),
(4904, 'article', 'хонали', 490),
(4905, 'article', 'хонадон', 490),
(4906, 'article', 'Муроджон', 490),
(4907, 'article', 'калити', 490),
(4908, 'article', 'икки', 490),
(4909, 'article', 'берилди', 490),
(4910, 'article', 'Аҳмадалиевга', 490),
(4928, 'article', 'тантанаси', 492),
(4929, 'article', 'Наманганда', 492),
(4930, 'article', 'мустақиллик', 492),
(4931, 'article', 'Boeing', 493),
(4932, 'article', 'Dreamliner', 493),
(4933, 'article', 'самолёти', 493),
(4934, 'article', '“Тошкент”', 493),
(4935, 'article', 'аэропортига', 493),
(4936, 'article', 'қўнди', 493),
(4937, 'article', 'янги', 488),
(4938, 'article', 'Уйчи', 488),
(4939, 'article', 'туширилди', 488),
(4940, 'article', 'туманида', 488),
(4941, 'article', 'станцияси', 488),
(4942, 'article', 'насос', 488),
(4943, 'article', 'ишга', 488),
(4952, 'article', 'ҚАҲРАМОНЛАРИ', 494),
(4953, 'article', 'ФОТО', 494),
(4954, 'article', 'ТУШДИ', 494),
(4955, 'article', 'СЕЛФИ', 494),
(4956, 'article', 'СЕВАРА', 494),
(4957, 'article', 'РИО', 494),
(4958, 'article', 'НАЗАРХОН', 494),
(4959, 'article', 'БИЛАН', 494),
(4972, 'article', 'Президент', 495),
(4973, 'article', 'Ислом', 495),
(4974, 'article', 'Каримов', 495),
(4975, 'article', 'Ўзбекистон', 495),
(4976, 'article', 'халқига', 495),
(4977, 'article', 'мустақилликнинг', 495),
(4978, 'article', 'йиллиги', 495),
(4979, 'article', 'муносабати', 495),
(4980, 'article', 'билан', 495),
(4981, 'article', 'байрам', 495),
(4982, 'article', 'табригини', 495),
(4983, 'article', 'йўллади', 495),
(4984, 'article', 'iPhone', 496),
(4985, 'article', 'фойдаланувчиларни', 496),
(4986, 'article', 'нима', 496),
(4987, 'article', 'билан', 496),
(4988, 'article', 'ҳайратга', 496),
(4989, 'article', 'солади', 496),
(4990, 'article', 'Тошкент', 497),
(4991, 'article', 'Андижон', 497),
(4992, 'article', 'Тошкент', 497),
(4993, 'article', 'йўналишли', 497),
(4994, 'article', 'поезд', 497),
(4995, 'article', 'чипта', 497),
(4996, 'article', 'нархлари', 497),
(4997, 'article', 'маълум', 497),
(4998, 'article', 'бўлди', 497),
(4999, 'article', 'Дубайдаги', 498),
(5000, 'article', 'энг', 498),
(5001, 'article', 'катта', 498),
(5002, 'article', 'ёпиқ', 498),
(5003, 'article', 'паркни', 498),
(5004, 'article', 'Шайх', 498),
(5005, 'article', 'Муҳаммаднинг', 498),
(5006, 'article', 'ўзи', 498),
(5007, 'article', 'расман', 498),
(5008, 'article', 'очиб', 498),
(5009, 'article', 'берди', 498),
(5010, 'article', 'Сардор', 499),
(5011, 'article', 'Рашидов', 499),
(5012, 'article', '“Фақат', 499),
(5013, 'article', 'ғалаба', 499),
(5014, 'article', 'ғалаба', 499),
(5015, 'article', 'ва', 499),
(5016, 'article', 'яна', 499),
(5017, 'article', 'ғалаба', 499),
(5022, 'article', 'МЕЪМОРИ', 500),
(5023, 'article', 'ИСТИҚЛОЛ', 500),
(5024, 'article', 'Дунё', 501),
(5025, 'article', 'ёшлари', 501),
(5026, 'article', 'билан', 501),
(5027, 'article', 'бахслашишга', 501),
(5028, 'article', 'қодирмиз', 501),
(5029, 'article', 'Муроджон', 502),
(5030, 'article', 'Аҳмадалиев', 502),
(5031, 'article', '“Тарихда', 502),
(5032, 'article', 'бунақаси', 502),
(5033, 'article', 'бўлмаган”', 502),
(5034, 'article', 'Шундай', 503),
(5035, 'article', 'ватан', 503),
(5036, 'article', 'фарзандимиз', 503),
(5039, 'article', 'ўқувчиларига', 504),
(5040, 'article', 'namnews', 504),
(5041, 'article', 'Ҳасанбой', 505),
(5042, 'article', 'Дўсматов', 505),
(5043, 'article', 'ва', 505),
(5044, 'article', 'Руслан', 505),
(5045, 'article', 'Нурудинов', 505),
(5046, 'article', '“Chevrelot', 505),
(5047, 'article', 'Gentra”', 505),
(5048, 'article', 'автомашиналарининг', 505),
(5049, 'article', 'калитлари', 505),
(5050, 'article', 'топширилди', 505),
(5051, 'article', 'Терма', 506),
(5052, 'article', 'жамоамиз', 506),
(5053, 'article', 'Бутунжаҳон', 506),
(5054, 'article', 'шахмат', 506),
(5055, 'article', 'Олимпиадасига', 506),
(5056, 'article', 'йўл', 506),
(5057, 'article', 'олди', 506),
(5058, 'article', 'Ўзбекистон', 507),
(5059, 'article', 'Сурия', 507),
(5060, 'article', 'Live', 507),
(5079, 'article', 'Ўзбекистон', 509),
(5080, 'article', 'Республикаси', 509),
(5081, 'article', 'Вазирлар', 509),
(5082, 'article', 'Маҳкамасининг', 509),
(5083, 'article', 'ахбороти', 509),
(5084, 'article', 'сентябрдан', 510),
(5085, 'article', 'ГМОни', 510),
(5086, 'article', 'аниқлаш', 510),
(5087, 'article', 'стандартлари', 510),
(5088, 'article', 'жорий', 510),
(5089, 'article', 'этилди', 510),
(5090, 'article', 'ҳали', 508),
(5091, 'article', 'қолгани', 508),
(5092, 'article', 'қариб', 508),
(5093, 'article', 'Самвел', 508),
(5094, 'article', 'йўқ', 508),
(5095, 'article', 'Гейнрих', 508),
(5096, 'article', 'Бабаян', 508),
(5097, 'article', 'quot', 508),
(5098, 'article', 'quot', 508),
(5099, 'article', 'Жеки', 511),
(5100, 'article', 'Чан', 511),
(5101, 'article', 'кинематографиядаги', 511),
(5102, 'article', 'буюк', 511),
(5103, 'article', 'хизматлари', 511),
(5104, 'article', 'учун', 511),
(5105, 'article', 'quot', 511),
(5106, 'article', 'Оскар', 511),
(5107, 'article', 'quot', 511),
(5108, 'article', 'билан', 511),
(5109, 'article', 'тақдирланадиган', 511),
(5110, 'article', 'бўлди', 511),
(5118, 'article', 'ҚЎШИҚ', 512),
(5119, 'article', 'ЮРТБОШИМИЗГА', 512),
(5120, 'article', 'РАҲМОНОВ', 512),
(5121, 'article', 'КУЙЛАДИ', 512),
(5122, 'article', 'ВИДЕО', 512),
(5123, 'article', 'БАХТИЁР', 512),
(5124, 'article', 'АТАБ', 512),
(5132, 'article', 'тўйлари', 491),
(5133, 'article', 'нишонланди', 491),
(5134, 'article', 'никоҳ', 491),
(5135, 'article', 'нафар', 491),
(5136, 'article', 'Наманганда', 491),
(5137, 'article', 'куёвнинг', 491),
(5138, 'article', 'келин', 491),
(5139, 'article', '“Мен', 513),
(5140, 'article', 'санъаткор', 513),
(5141, 'article', 'бўламан”', 513),
(5142, 'article', 'дейди', 513),
(5143, 'article', 'Авазхон', 513),
(5144, 'article', 'Сабаралиев', 513),
(5151, 'article', 'Ўзбекистон', 514),
(5152, 'article', 'Республикаси', 514),
(5153, 'article', 'Президенти', 514),
(5154, 'article', 'Каримов', 514),
(5155, 'article', 'Ислом', 514),
(5156, 'article', 'Абдуғаниевич', 514),
(5157, 'article', 'ШҲТ', 515),
(5158, 'article', 'бош', 515),
(5159, 'article', 'қароргоҳида', 515),
(5160, 'article', 'байроқлар', 515),
(5161, 'article', 'туширилди', 515),
(5169, 'article', 'ҳамдардлик', 516),
(5170, 'article', 'халқига', 516),
(5171, 'article', 'Ўзбекистон', 516),
(5172, 'article', 'котиби', 516),
(5173, 'article', 'бош', 516),
(5174, 'article', 'БМТ', 516),
(5175, 'article', 'билдирди', 516),
(5268, 'article', 'Ўзбекистоннинг', 518),
(5269, 'article', 'хориждаги', 518),
(5270, 'article', 'элчихоналарида', 518),
(5271, 'article', 'ҳамдардлик', 518),
(5272, 'article', 'китоблари', 518),
(5273, 'article', 'очилди', 518),
(5274, 'article', 'Пётр', 519),
(5275, 'article', 'Порошенко', 519),
(5276, 'article', 'Ислом', 519),
(5277, 'article', 'Каримов', 519),
(5278, 'article', 'атоқли', 519),
(5279, 'article', 'сиёсий', 519),
(5280, 'article', 'арбоб', 519),
(5281, 'article', 'қайта', 519),
(5282, 'article', 'туғилган', 519),
(5283, 'article', 'Ўзбекистоннинг', 519),
(5284, 'article', 'ёрқин', 519),
(5285, 'article', 'етакчиси', 519),
(5286, 'article', 'ваУкраинанинг', 519),
(5287, 'article', 'садоқатли', 519),
(5288, 'article', 'дўсти', 519),
(5289, 'article', 'эди', 519),
(5290, 'article', 'қилинди', 517),
(5291, 'article', 'эълон', 517),
(5292, 'article', 'этди', 517),
(5293, 'article', 'элчихоналарида', 517),
(5294, 'article', 'Шу', 517),
(5295, 'article', 'хорижий', 517),
(5296, 'article', 'халқимиз', 517),
(5297, 'article', 'учради', 517),
(5298, 'article', 'уч', 517),
(5299, 'article', 'Ўзбекистоннинг', 517),
(5300, 'article', 'Ўзбекистон', 517),
(5301, 'article', 'Ўзбекистон', 517),
(5302, 'article', 'Ўзбекистон', 517),
(5303, 'article', 'туширилди', 517),
(5304, 'article', 'сентябрь', 517),
(5305, 'article', 'сентябрдан', 517),
(5306, 'article', 'Республикасининг', 517),
(5307, 'article', 'Республикасининг', 517),
(5308, 'article', 'Республикаси', 517),
(5309, 'article', 'Президенти', 517),
(5310, 'article', 'Президенти', 517),
(5311, 'article', 'оғир', 517),
(5312, 'article', 'муносабат', 517),
(5313, 'article', 'мотам', 517),
(5314, 'article', 'мамлакатимизда', 517),
(5315, 'article', 'Мамлакатимизда', 517),
(5316, 'article', 'кунлик', 517),
(5317, 'article', 'куни', 517),
(5318, 'article', 'Каримов', 517),
(5319, 'article', 'Каримов', 517),
(5320, 'article', 'йил', 517),
(5321, 'article', 'йил', 517),
(5322, 'article', 'Ислом', 517),
(5323, 'article', 'Ислом', 517),
(5324, 'article', 'жудоликка', 517),
(5325, 'article', 'давлатлардаги', 517),
(5326, 'article', 'давлат', 517),
(5327, 'article', 'видолашувМамлакатимиз', 517),
(5328, 'article', 'вафот', 517),
(5329, 'article', 'ва', 517),
(5330, 'article', 'бутун', 517),
(5331, 'article', 'Биринчи', 517),
(5332, 'article', 'Биринчи', 517),
(5333, 'article', 'билан', 517),
(5334, 'article', 'билан', 517),
(5335, 'article', 'байроқлари', 517),
(5336, 'article', 'Мактабларда', 520),
(5337, 'article', 'ўқув', 520),
(5338, 'article', 'йили', 520),
(5339, 'article', 'хотира', 520),
(5340, 'article', 'дарслари', 520),
(5341, 'article', 'билан', 520),
(5342, 'article', 'бошланди', 520),
(5343, 'article', 'Хитой', 521),
(5344, 'article', 'Ўзбекистон', 521),
(5345, 'article', 'Каримовнинг', 521),
(5346, 'article', 'бошлаган', 521),
(5347, 'article', 'ишини', 521),
(5348, 'article', 'давом', 521),
(5349, 'article', 'эттиришига', 521),
(5350, 'article', 'ишончи', 521),
(5351, 'article', 'комил', 521),
(5352, 'article', 'эканлигини', 521),
(5353, 'article', 'билдирди', 521),
(5354, 'article', 'Бердимуҳамедов', 522),
(5355, 'article', '«Туркманистон', 522),
(5356, 'article', 'майдонларига', 522),
(5357, 'article', 'Ислом', 522),
(5358, 'article', 'Каримов', 522),
(5359, 'article', 'номи', 522),
(5360, 'article', 'берилади»', 522),
(5366, 'article', 'ғалабалари', 523),
(5367, 'article', 'Шахматчиларимизнинг', 523),
(5368, 'article', 'шахмат', 523),
(5369, 'article', 'олимпиадасидаги', 523),
(5370, 'article', 'жаҳон', 523),
(5379, 'article', 'қарори', 524),
(5380, 'article', 'қалбимиздасиз', 524),
(5381, 'article', 'ота', 524),
(5382, 'article', 'Наманганликларнинг', 524),
(5383, 'article', 'муҳтарам', 524),
(5384, 'article', 'Ислом', 524),
(5385, 'article', 'азму', 524),
(5386, 'article', '«Доимо', 524),
(5387, 'article', 'Кубада', 525),
(5388, 'article', 'Ислом', 525),
(5389, 'article', 'Каримов', 525),
(5390, 'article', 'вафоти', 525),
(5391, 'article', 'муносабати', 525),
(5392, 'article', 'билан', 525),
(5393, 'article', 'мотам', 525),
(5394, 'article', 'эълон', 525),
(5395, 'article', 'қилинди', 525),
(5396, 'article', 'Иқбол', 526),
(5397, 'article', 'Мирзо', 526),
(5398, 'article', '“Бирлаштирди', 526),
(5399, 'article', 'ҳаттоки', 526),
(5400, 'article', 'элни', 526),
(5401, 'article', 'қайғу', 526),
(5402, 'article', 'андуҳи”', 526),
(5403, 'article', 'Аёллар', 527),
(5404, 'article', 'ўртасидаги', 527),
(5405, 'article', 'Осиё', 527),
(5406, 'article', 'Кубоги', 527),
(5407, 'article', 'мезбони', 527),
(5408, 'article', 'маълум', 527),
(5416, 'article', 'Бутунжаҳон', 529),
(5417, 'article', 'шахмат', 529),
(5418, 'article', 'Олимпиадаси', 529),
(5419, 'article', 'Қизларимиз', 529),
(5420, 'article', 'ҳам', 529),
(5421, 'article', 'ютқазишди', 529),
(5429, 'article', 'ғалаба', 530),
(5430, 'article', 'турнири', 530),
(5431, 'article', 'саралашини', 530),
(5432, 'article', 'Омонмуродова', 530),
(5433, 'article', 'Будапешт', 530),
(5434, 'article', 'бошлади', 530),
(5435, 'article', 'билан', 530),
(5436, 'article', 'Эркаклар', 528),
(5437, 'article', 'шахмат', 528),
(5438, 'article', 'Олимпиадаси', 528),
(5439, 'article', 'мағлубият', 528),
(5440, 'article', 'илк', 528),
(5441, 'article', 'жамоамизда', 528),
(5442, 'article', 'Бутунжаҳон', 528),
(5443, 'article', 'Ёшлар', 531),
(5444, 'article', 'ўртасидаги', 531),
(5445, 'article', 'Жаҳон', 531),
(5446, 'article', 'чемпионати', 531),
(5447, 'article', 'Ғуломжон', 531),
(5448, 'article', 'Абдуллаев', 531),
(5449, 'article', 'бронза', 531),
(5450, 'article', 'медали', 531),
(5451, 'article', 'соҳиби', 531),
(5452, 'article', 'Мессининг', 532),
(5453, 'article', 'тақдири', 532),
(5454, 'article', 'шифокорлар', 532),
(5455, 'article', 'қўлида', 532),
(5470, 'article', 'Ўзбекистон', 535),
(5471, 'article', 'ўсмирлар', 535),
(5472, 'article', 'терма', 535),
(5473, 'article', 'жамоасининг', 535),
(5474, 'article', 'Осиё', 535),
(5475, 'article', 'чемпионатига', 535),
(5476, 'article', 'борадиган', 535),
(5477, 'article', 'таркиби', 535),
(5478, 'article', 'маълум', 535),
(5479, 'article', 'ўтказмоқда', 534),
(5480, 'article', 'Ўзбекистон', 534),
(5481, 'article', 'терма', 534),
(5482, 'article', 'йиғин', 534),
(5483, 'article', 'Испанияда', 534),
(5484, 'article', 'жамоаси', 534),
(5494, 'article', 'янги', 536),
(5495, 'article', 'фильми', 536),
(5496, 'article', 'ўтди', 536),
(5497, 'article', 'премьераси', 536),
(5498, 'article', 'Мэл', 536),
(5499, 'article', 'кинофестивалида', 536),
(5500, 'article', 'Гибсоннинг', 536),
(5501, 'article', 'Венеция', 536),
(5502, 'article', 'бўлиб', 536),
(5503, 'article', 'Селена', 537),
(5504, 'article', 'Гомес', 537),
(5505, 'article', 'жиддий', 537),
(5506, 'article', 'хасталик', 537),
(5507, 'article', 'туфайли', 537),
(5508, 'article', 'гастролларини', 537),
(5509, 'article', 'тўхтатади', 537),
(5532, 'article', 'ҳеч', 538),
(5533, 'article', 'ҳаққи', 538),
(5534, 'article', 'Ҳасанбой', 538),
(5535, 'article', 'унутишга', 538),
(5536, 'article', 'Президентимизни', 538),
(5537, 'article', 'кимнинг', 538),
(5538, 'article', 'йўқ', 538),
(5539, 'article', 'Дўстматов', 538),
(5540, 'article', 'ВИДЕО', 538),
(5541, 'article', 'quot', 538),
(5542, 'article', 'quot', 538),
(5565, 'article', 'Ҳамдардлар', 533),
(5566, 'article', 'тўхтамайди', 533),
(5567, 'article', 'оқими', 533),
(5568, 'article', 'Наманган', 533),
(5569, 'article', 'қайғуси', 539),
(5570, 'article', 'эзгу', 539),
(5571, 'article', 'фото', 539),
(5572, 'article', 'наманганликлар', 539),
(5573, 'article', 'йўлида', 539),
(5574, 'article', 'ишлар', 539),
(5575, 'article', 'дейишмоқда', 539),
(5576, 'article', 'бирлаштирди»', 539),
(5577, 'article', 'бизни', 539),
(5578, 'article', '«Эл', 539),
(5579, 'article', 'ЖЧ', 540),
(5580, 'article', 'саралаши', 540),
(5581, 'article', 'Осиё', 540),
(5582, 'article', 'қитъаси', 540),
(5583, 'article', 'Бугун', 540),
(5584, 'article', 'Қатар', 540),
(5585, 'article', 'Ўзбекистон', 540),
(5586, 'article', 'учрашуви', 540),
(5587, 'article', 'бўлади', 540),
(5588, 'article', 'Қозонда', 541),
(5589, 'article', 'мусулмон', 541),
(5590, 'article', 'кинолари', 541),
(5591, 'article', 'фестивали', 541),
(5592, 'article', 'ўз', 541),
(5593, 'article', 'ишини', 541),
(5594, 'article', 'бошлайди', 541),
(5595, 'article', 'Samsung’нинг', 542),
(5596, 'article', 'Galaxy', 542),
(5597, 'article', 'Note', 542),
(5598, 'article', 'смартфонларини', 542),
(5599, 'article', 'қайтариб', 542),
(5600, 'article', 'олиш', 542),
(5601, 'article', 'дастури', 542),
(5602, 'article', 'миллиард', 542),
(5603, 'article', 'долларга', 542),
(5604, 'article', 'баҳоланди', 542),
(5617, 'article', 'Самарқандга', 543),
(5618, 'article', 'Путин', 543),
(5619, 'article', 'келди', 543),
(5620, 'article', 'Владимир', 543),
(5621, 'article', 'Ёдгор', 544),
(5622, 'article', 'Саъдиев', 544),
(5623, 'article', 'Қорақалпоғистон', 544),
(5624, 'article', 'халқ', 544),
(5625, 'article', 'артисти', 544),
(5626, 'article', 'унвони', 544),
(5627, 'article', 'билан', 544),
(5628, 'article', 'тақдирланди', 544),
(5629, 'article', '«Тошкент', 545),
(5630, 'article', 'Андижон»', 545),
(5631, 'article', 'темирйўл', 545),
(5632, 'article', 'йўналиши', 545),
(5633, 'article', 'бўйлаб', 545),
(5634, 'article', 'мунтазам', 545),
(5635, 'article', 'қатновлар', 545),
(5636, 'article', 'бошланди', 545),
(5637, 'article', 'фото', 545),
(5638, 'article', 'ва', 545),
(5639, 'article', 'видео', 545),
(5645, 'article', 'Қатар', 546),
(5646, 'article', 'ғалабага', 546),
(5647, 'article', 'эришди', 546),
(5648, 'article', 'устидан', 546),
(5649, 'article', 'Ўзбекистон', 546),
(5653, 'article', 'Самвел', 548),
(5654, 'article', 'Бабаян', 548),
(5655, 'article', 'quot', 548),
(5656, 'article', 'Биз', 548),
(5657, 'article', 'бугун', 548),
(5658, 'article', 'юракдан', 548),
(5659, 'article', 'ўйнадик', 548),
(5660, 'article', 'Бошқача', 548),
(5661, 'article', 'бўлиши', 548),
(5662, 'article', 'мумкин', 548),
(5663, 'article', 'ҳам', 548),
(5664, 'article', 'эмасди', 548),
(5665, 'article', 'quot', 548),
(5669, 'article', '“ДУНЁ', 547),
(5670, 'article', 'УЛАМОЛАРИ', 547),
(5671, 'article', 'МУРОЖААТИ”', 547),
(5672, 'article', 'Самвел', 549),
(5673, 'article', 'Бабаян', 549),
(5674, 'article', 'Биз', 549),
(5675, 'article', 'бугун', 549),
(5676, 'article', 'юракдан', 549),
(5677, 'article', 'ўйнадик', 549),
(5678, 'article', 'Бошқача', 549),
(5679, 'article', 'бўлиши', 549),
(5680, 'article', 'мумкин', 549),
(5681, 'article', 'эмасди', 549),
(5682, 'article', '«Навбаҳор»', 550),
(5683, 'article', 'Назорат', 550),
(5684, 'article', 'ўйинида', 550),
(5685, 'article', '«қизиллар»', 550),
(5686, 'article', 'устун', 550),
(5687, 'article', 'келди', 550),
(5688, 'article', 'Футбол', 551),
(5689, 'article', 'бўйича', 551),
(5690, 'article', 'йилги', 551),
(5691, 'article', 'жаҳон', 551),
(5692, 'article', 'чемпионати', 551),
(5693, 'article', 'учта', 551),
(5694, 'article', 'мамлакатда', 551),
(5695, 'article', 'ўтиши', 551),
(5696, 'article', 'мумки', 551),
(5721, 'article', 'қочиб', 552),
(5722, 'article', 'қашшоқлик', 552),
(5723, 'article', 'ЮНИСЕФ', 552),
(5724, 'article', 'этдиЖамият', 552),
(5725, 'article', 'уйини', 552),
(5726, 'article', 'ўз', 552),
(5727, 'article', 'тарк', 552),
(5728, 'article', 'миллион', 552),
(5729, 'article', 'зўравонлик', 552),
(5730, 'article', 'зиддиятлардан', 552),
(5731, 'article', 'ва', 552),
(5732, 'article', 'бола', 552),
(5733, 'article', 'Ҳудудларда', 553),
(5734, 'article', 'илмий', 553),
(5735, 'article', 'лойиҳа', 553),
(5736, 'article', 'ишлаб', 553),
(5737, 'article', 'чиқариш', 553),
(5738, 'article', 'марказлари', 553),
(5739, 'article', 'иш', 553),
(5740, 'article', 'бошлади', 553),
(5741, 'article', 'Луиш', 554),
(5742, 'article', 'Фигу', 554),
(5743, 'article', 'Роналду', 554),
(5744, 'article', '«Барселона»га', 554),
(5745, 'article', 'ўтиши', 554),
(5746, 'article', 'мумкинми', 554),
(5747, 'article', 'Ўзбекистон', 555),
(5748, 'article', 'МТЖ', 555),
(5749, 'article', 'ўз', 555),
(5750, 'article', 'тарихида', 555),
(5751, 'article', 'янги', 555),
(5752, 'article', 'саҳифа', 555),
(5753, 'article', 'очди', 555),
(5754, 'article', 'Нью', 556),
(5755, 'article', 'Йоркда', 556),
(5756, 'article', 'БМТ', 556),
(5757, 'article', 'байроғи', 556),
(5758, 'article', 'туширилди', 556),
(5759, 'article', 'Apple', 557),
(5760, 'article', 'компанияси', 557),
(5761, 'article', 'iPhone', 557),
(5762, 'article', 'смартфони', 557),
(5763, 'article', 'тақдимотини', 557),
(5764, 'article', 'ўтказади', 557),
(5771, 'article', 'ҳам', 558),
(5772, 'article', 'хорижда', 558),
(5773, 'article', 'харидорлар', 558),
(5774, 'article', 'пойабзалларига', 558),
(5775, 'article', 'Наманган', 558),
(5776, 'article', 'кўпаймоқда', 558),
(5777, 'article', 'Наманган', 559),
(5778, 'article', 'пойабзалларига', 559),
(5779, 'article', 'хорижда', 559),
(5780, 'article', 'ҳам', 559),
(5781, 'article', 'харидорлар', 559),
(5782, 'article', 'кўпаймоқда', 559),
(5783, 'article', 'фото', 559),
(5784, 'article', 'Apple', 560),
(5785, 'article', 'iPhone', 560),
(5786, 'article', 'смартфонини', 560),
(5787, 'article', 'тақдим', 560),
(5788, 'article', 'этди', 560),
(5789, 'article', 'Бугун', 561),
(5790, 'article', 'парламент', 561),
(5791, 'article', 'Президент', 561),
(5792, 'article', 'вазифаларини', 561),
(5793, 'article', 'вақтинча', 561),
(5794, 'article', 'бажаришни', 561),
(5795, 'article', 'юклаш', 561),
(5796, 'article', 'тўғрисидаги', 561),
(5797, 'article', 'масалани', 561),
(5798, 'article', 'кўриб', 561),
(5799, 'article', 'чиқади', 561),
(5800, 'article', 'Олимпия', 562),
(5801, 'article', 'ва', 562),
(5802, 'article', 'Паралимпия', 562),
(5803, 'article', 'шахарчасида', 562),
(5804, 'article', 'Ўзбекистон', 562),
(5805, 'article', 'байроғи', 562),
(5806, 'article', 'кўтарилди', 562),
(5809, 'article', '«Олмалиқ»', 563),
(5810, 'article', '«Навбаҳор»', 563),
(5811, 'article', 'Роналдиньо', 564),
(5812, 'article', 'фаолиятини', 564),
(5813, 'article', 'якунлашини', 564),
(5814, 'article', 'эълон', 564),
(5815, 'article', 'қилди', 564),
(5828, 'article', 'қўлларидан', 565),
(5829, 'article', 'Ғоибназаров', 565),
(5830, 'article', 'юртбошимиз', 565),
(5831, 'article', 'этмади', 565),
(5832, 'article', 'фахрий', 565),
(5833, 'article', 'Фазлиддин', 565),
(5834, 'article', 'унвонини', 565),
(5835, 'article', 'олиш', 565),
(5836, 'article', 'насиб', 565),
(5837, 'article', 'ифтихори»', 565),
(5838, 'article', 'Афсус', 565),
(5839, 'article', '«Ўзбекистон', 565),
(5840, 'article', 'сентябрь', 566),
(5841, 'article', 'Халқаро', 566),
(5842, 'article', 'саводхонлик', 566),
(5843, 'article', 'куни', 566),
(5844, 'article', 'Немис', 567),
(5845, 'article', 'тилида', 567),
(5846, 'article', 'сўзлашувчи', 567),
(5847, 'article', 'ҳаваскор', 567),
(5848, 'article', 'театр', 567),
(5849, 'article', 'гуруҳларининг', 567),
(5850, 'article', 'театр', 567),
(5851, 'article', 'фестивали', 567),
(5852, 'article', 'Шавкат', 568),
(5853, 'article', 'Мирзиёев', 568),
(5854, 'article', 'Ўзбекистон', 568),
(5855, 'article', 'президенти', 568),
(5856, 'article', 'вазифасини', 568),
(5857, 'article', 'вақтинча', 568),
(5858, 'article', 'бажарувчи', 568),
(5859, 'article', 'этиб', 568),
(5860, 'article', 'тайинланди', 568),
(5872, 'article', 'Биологлар', 570),
(5873, 'article', 'саратонга', 570),
(5874, 'article', 'қарши', 570),
(5875, 'article', 'янги', 570),
(5876, 'article', 'восита', 570);
INSERT INTO `tags` (`id`, `target`, `tag_name`, `item_id`) VALUES
(5877, 'article', 'ҳақида', 570),
(5878, 'article', 'маълум', 570),
(5879, 'article', 'қилди', 570),
(5880, 'article', 'Наманганнинг', 571),
(5881, 'article', 'момиқ', 571),
(5882, 'article', 'сочиқлари', 571),
(5894, 'article', 'Наманганда', 573),
(5895, 'article', 'ойнаванд', 573),
(5896, 'article', 'жиҳозлар', 573),
(5897, 'article', 'ишлаб', 573),
(5898, 'article', 'чиқарувчи', 573),
(5899, 'article', 'корхона', 573),
(5900, 'article', 'ишга', 573),
(5901, 'article', 'тушди', 573),
(5902, 'article', 'Паралимпия', 574),
(5903, 'article', 'ўйинлари', 574),
(5904, 'article', 'Дзюдочиларимиздан', 574),
(5905, 'article', 'яна', 574),
(5906, 'article', 'битта', 574),
(5907, 'article', 'олтин', 574),
(5908, 'article', 'медал', 574),
(5909, 'article', 'Паралимпия', 575),
(5910, 'article', 'ўйинлари', 575),
(5911, 'article', 'Сузувчиларимиздан', 575),
(5912, 'article', 'тадан', 575),
(5913, 'article', 'кумуш', 575),
(5914, 'article', 'ва', 575),
(5915, 'article', 'бронза', 575),
(5916, 'article', 'Ҳусанбой', 572),
(5917, 'article', 'қиламан”', 572),
(5918, 'article', 'қабрини', 572),
(5919, 'article', 'чекиб', 572),
(5920, 'article', 'ота', 572),
(5921, 'article', 'Наманганлик', 572),
(5922, 'article', 'машаққат', 572),
(5923, 'article', 'Каримов', 572),
(5924, 'article', 'Ислом', 572),
(5925, 'article', 'зиёрат', 572),
(5926, 'article', 'дейди', 572),
(5927, 'article', 'Илк', 576),
(5928, 'article', 'куниёқ', 576),
(5929, 'article', 'та', 576),
(5930, 'article', 'медал', 576),
(5931, 'article', 'паралимпиячиларимиз', 576),
(5932, 'article', 'умумжамоа', 576),
(5933, 'article', 'ҳисобида', 576),
(5934, 'article', 'ўринда', 576),
(5935, 'article', 'Ҳусанбой', 569),
(5936, 'article', 'ҳақига', 569),
(5937, 'article', 'ўқиш', 569),
(5938, 'article', 'учун', 569),
(5939, 'article', 'ота', 569),
(5940, 'article', 'Наманганлик', 569),
(5941, 'article', 'Каримов', 569),
(5942, 'article', 'Ислом', 569),
(5943, 'article', 'дуо', 569),
(5944, 'article', 'велосипедда', 569),
(5945, 'article', 'бормоқда', 569),
(5946, 'article', 'Ўзбекистон', 577),
(5947, 'article', 'Республикаси', 577),
(5948, 'article', 'Бош', 577),
(5949, 'article', 'вазири', 577),
(5950, 'article', 'Шавкат', 577),
(5951, 'article', 'Миромонович', 577),
(5952, 'article', 'Мирзиёевнинг', 577),
(5953, 'article', 'Олий', 577),
(5954, 'article', 'Мажлис', 577),
(5955, 'article', 'Қонунчилик', 577),
(5956, 'article', 'палатаси', 577),
(5957, 'article', 'ва', 577),
(5958, 'article', 'Сенатининг', 577),
(5959, 'article', 'қўшма', 577),
(5960, 'article', 'мажлисидаги', 577),
(5961, 'article', 'нутқи', 577),
(5962, 'article', 'Британиялик', 578),
(5963, 'article', 'моноциклда', 578),
(5964, 'article', 'жаҳон', 578),
(5965, 'article', 'рекордини', 578),
(5966, 'article', 'ўрнатди', 578),
(5977, 'article', 'ЎЗБЕКИСТОНГА', 579),
(5978, 'article', 'КОТИБИ', 579),
(5979, 'article', 'КЕЛДИ', 579),
(5980, 'article', 'ИҲТ', 579),
(5981, 'article', 'БОШ', 579),
(5982, 'article', 'Хитой', 580),
(5983, 'article', 'футбол', 580),
(5984, 'article', 'майдонига', 580),
(5985, 'article', 'тенг', 580),
(5986, 'article', 'келувчи', 580),
(5987, 'article', 'радиотелескопни', 580),
(5988, 'article', 'эксплуатацияга', 580),
(5989, 'article', 'топширади', 580),
(5990, 'article', 'Президент', 581),
(5991, 'article', 'сайлови', 581),
(5992, 'article', 'куни', 581),
(5993, 'article', 'белгиланди', 581),
(5994, 'article', 'Қурбон', 582),
(5995, 'article', 'ҳайити', 582),
(5996, 'article', 'сентябрда', 582),
(5997, 'article', 'нишонланади', 582),
(5998, 'article', 'Бартомеу', 583),
(5999, 'article', 'Месси', 583),
(6000, 'article', '«Барселона»да', 583),
(6001, 'article', 'қанча', 583),
(6002, 'article', 'қолишни', 583),
(6003, 'article', 'ўзи', 583),
(6004, 'article', 'ҳал', 583),
(6005, 'article', 'қилади', 583),
(6006, 'article', '«Навбаҳор»', 584),
(6007, 'article', '«Олмалиқ»', 584),
(6008, 'article', 'Жанговар', 584),
(6009, 'article', 'дуранг', 584),
(6010, 'article', 'қандай', 584),
(6011, 'article', 'қайд', 584),
(6012, 'article', 'этилди', 584),
(6013, 'article', 'Футзал', 585),
(6014, 'article', 'Ўзбекистон', 585),
(6015, 'article', 'Панама', 585),
(6016, 'article', 'учрашуви', 585),
(6017, 'article', 'ҳакамлари', 585),
(6018, 'article', 'маълум', 585),
(6019, 'article', 'Шахмат', 586),
(6020, 'article', 'Олимпиадаси', 586),
(6021, 'article', 'Эркаклар', 586),
(6022, 'article', 'жамоамиз', 586),
(6023, 'article', 'Никарагуани', 586),
(6024, 'article', 'мағлуб', 586),
(6025, 'article', 'этди', 586),
(6026, 'article', 'ҲАМЮРТЛАРИМИЗДАН', 587),
(6027, 'article', 'ЯНА', 587),
(6028, 'article', 'ТА', 587),
(6029, 'article', 'БРОНЗА', 587),
(6030, 'article', 'МЕДАЛЬ', 587),
(6031, 'article', 'Одил', 588),
(6032, 'article', 'Тўлендибоев', 588),
(6033, 'article', 'Паралимпия', 588),
(6034, 'article', 'ўйинлари', 588),
(6035, 'article', 'чемпиони', 588),
(6036, 'article', 'Футзал', 589),
(6037, 'article', 'Ўзбекистон', 589),
(6038, 'article', 'ЖЧдаги', 589),
(6039, 'article', 'дебют', 589),
(6040, 'article', 'ўйинида', 589),
(6041, 'article', 'мағлуб', 589),
(6042, 'article', 'бўлди', 589),
(6043, 'article', '«Реал»', 590),
(6044, 'article', 'примерадаги', 590),
(6045, 'article', 'йил', 590),
(6046, 'article', 'олдинги', 590),
(6047, 'article', 'рекордини', 590),
(6048, 'article', 'такрорлади', 590),
(6049, 'article', 'Нурсултон', 591),
(6050, 'article', 'Назарбоев', 591),
(6051, 'article', 'Ислом', 591),
(6052, 'article', 'Каримов', 591),
(6053, 'article', 'хотирасига', 591),
(6054, 'article', 'ҳурмат', 591),
(6055, 'article', 'бажо', 591),
(6056, 'article', 'келтирди', 591),
(6057, 'article', 'РИО–', 592),
(6058, 'article', 'ЎЗБЕКИСТОН', 592),
(6059, 'article', 'ПАРАЛИМПИАДАДА', 592),
(6060, 'article', 'МЕДАЛЛАР', 592),
(6061, 'article', 'ЖАМҒАРИШ', 592),
(6062, 'article', 'БЎЙИЧА', 592),
(6063, 'article', 'ДУНЁДА', 592),
(6064, 'article', 'ЎРИНДА', 592),
(6065, 'article', 'БОРМОҚДА', 592),
(6105, 'article', 'Шоҳжахон', 594),
(6106, 'article', 'Жўраевдан', 594),
(6107, 'article', 'тақдимот', 594),
(6108, 'article', '“Ким', 594),
(6109, 'article', 'эдигу', 594),
(6110, 'article', 'ким', 594),
(6111, 'article', 'бўлдик”', 594),
(6112, 'article', 'видео', 594),
(6113, 'article', 'қурилаётган', 593),
(6114, 'article', 'қайта', 593),
(6115, 'article', 'Тошкентда', 593),
(6116, 'article', 'Тиллаева', 593),
(6117, 'article', 'ота', 593),
(6118, 'article', 'номи', 593),
(6119, 'article', 'масжидга', 593),
(6120, 'article', 'Лола', 593),
(6121, 'article', 'Каримова', 593),
(6122, 'article', 'Ислом', 593),
(6123, 'article', 'берилади', 593),
(6124, 'article', 'quot', 593),
(6125, 'article', 'quot', 593),
(6136, 'article', 'қурилмалар', 595),
(6137, 'article', 'Учувчисиз', 595),
(6138, 'article', 'учар', 595),
(6139, 'article', 'ўтказилади', 595),
(6140, 'article', 'рўйхатдан', 595),
(6141, 'article', 'Термизда', 596),
(6142, 'article', 'археолог', 596),
(6143, 'article', 'Кюдзо', 596),
(6144, 'article', 'Като', 596),
(6145, 'article', 'вафот', 596),
(6146, 'article', 'этди', 596),
(6162, 'article', 'Қосимов', 597),
(6163, 'article', 'этиб', 597),
(6164, 'article', 'ўрта', 597),
(6165, 'article', 'ўринбосари', 597),
(6166, 'article', 'таълим', 597),
(6167, 'article', 'тайинланди', 597),
(6168, 'article', 'Рустам', 597),
(6169, 'article', 'олий', 597),
(6170, 'article', 'махсус', 597),
(6171, 'article', 'вазири', 597),
(6172, 'article', 'вазир', 597),
(6173, 'article', 'ва', 597),
(6174, 'article', 'бош', 597),
(6175, 'article', 'Арипов', 597),
(6176, 'article', 'Абдулла', 597),
(6188, 'article', 'АВСТРАЛИЯДА', 599),
(6189, 'article', 'ДУНЁДАГИ', 599),
(6190, 'article', 'ЭНГ', 599),
(6191, 'article', 'УЗУН', 599),
(6192, 'article', 'ВЕЛОСИПЕД', 599),
(6193, 'article', 'ЯРАТИЛДИ', 599),
(6194, 'article', 'ВИДЕО', 599),
(6195, 'article', 'Оиладан', 600),
(6196, 'article', 'бошланар', 600),
(6197, 'article', 'Ватан', 600),
(6198, 'article', 'Ўзбекистонликлар', 601),
(6199, 'article', 'Риода', 601),
(6200, 'article', 'та', 601),
(6201, 'article', 'медални', 601),
(6202, 'article', 'қўлга', 601),
(6203, 'article', 'киритди', 601),
(6204, 'article', 'Газ', 602),
(6205, 'article', 'нархи', 602),
(6206, 'article', 'фоизга', 602),
(6207, 'article', 'қимматлади', 602),
(6208, 'article', 'Наманганда', 603),
(6209, 'article', 'Халқаро', 603),
(6210, 'article', 'озон', 603),
(6211, 'article', 'қатламини', 603),
(6212, 'article', 'муҳофаза', 603),
(6213, 'article', 'қилиш', 603),
(6214, 'article', 'куни', 603),
(6215, 'article', 'муносабати', 603),
(6216, 'article', 'билан', 603),
(6217, 'article', 'медиатур', 603),
(6218, 'article', 'ташкил', 603),
(6219, 'article', 'этилди', 603),
(6220, 'article', 'хизмат', 598),
(6221, 'article', 'тиббий', 598),
(6222, 'article', 'тиббиёт', 598),
(6223, 'article', 'тармоқли', 598),
(6224, 'article', 'сифатли', 598),
(6225, 'article', 'Наманган', 598),
(6226, 'article', 'марказида', 598),
(6227, 'article', 'кўрсатилмоқда', 598),
(6228, 'article', 'кўп', 598),
(6229, 'article', 'вилояти', 598),
(6230, 'article', 'аҳолига', 598),
(6239, 'article', 'қилди', 604),
(6240, 'article', 'қабрини', 604),
(6241, 'article', 'раҳбари', 604),
(6242, 'article', 'Каримов', 604),
(6243, 'article', 'Ислом', 604),
(6244, 'article', 'ИИВ', 604),
(6245, 'article', 'зиёрат', 604),
(6246, 'article', 'БАА', 604),
(6247, 'article', 'Наманганлик', 605),
(6248, 'article', 'ёшли', 605),
(6249, 'article', 'велосаёҳатчига', 605),
(6250, 'article', 'велосипед', 605),
(6251, 'article', 'ва', 605),
(6252, 'article', 'музлаткич', 605),
(6253, 'article', 'тортиқ', 605),
(6254, 'article', 'қилинди', 605),
(6255, 'article', 'фото', 605),
(6256, 'article', 'Поплик', 606),
(6257, 'article', 'ғолиб', 606),
(6258, 'article', 'фермерлар', 606),
(6259, 'article', 'Норинлик', 607),
(6260, 'article', 'илғорлар', 607),
(6261, 'article', 'Ўзбекистонда', 608),
(6262, 'article', 'янги', 608),
(6263, 'article', 'қонун', 608),
(6264, 'article', 'кучга', 608),
(6265, 'article', 'кирди', 608),
(6266, 'article', 'Парламент', 609),
(6267, 'article', 'комиссияси', 609),
(6268, 'article', 'йиғилиши', 609),
(6273, 'article', 'юрт', 610),
(6274, 'article', 'нуронийлар', 610),
(6275, 'article', 'Наманганлик', 610),
(6276, 'article', 'ардоғида', 610),
(6277, 'article', 'Ўзбекистон', 611),
(6278, 'article', 'ва', 611),
(6279, 'article', 'Таиланд', 611),
(6280, 'article', 'ўртасида', 611),
(6281, 'article', 'туризм', 611),
(6282, 'article', 'соҳасидаги', 611),
(6283, 'article', 'ҳамкорлик', 611),
(6284, 'article', 'бўйича', 611),
(6285, 'article', 'келишув', 611),
(6286, 'article', 'имзоланади', 611),
(6293, 'article', 'ўқиб', 612),
(6294, 'article', 'ўрганмоқдалар', 612),
(6295, 'article', 'Наманганликлар', 612),
(6296, 'article', 'Каримов', 612),
(6297, 'article', 'Ислом', 612),
(6298, 'article', 'асарларини', 612),
(6308, 'article', 'қонун', 613),
(6309, 'article', 'қониқиш', 613),
(6310, 'article', 'қарши', 613),
(6311, 'article', 'янги', 613),
(6312, 'article', 'олинди', 613),
(6313, 'article', 'Наманган', 613),
(6314, 'article', 'зўр', 613),
(6315, 'article', 'вилоятида', 613),
(6316, 'article', 'билан', 613),
(6317, 'article', '«Миллий', 614),
(6318, 'article', 'тикланиш»', 614),
(6319, 'article', 'пленумида', 614),
(6320, 'article', 'Сарвар', 614),
(6321, 'article', 'Отамуратов', 614),
(6322, 'article', 'Президент', 614),
(6323, 'article', 'лавозимига', 614),
(6324, 'article', 'номзод', 614),
(6325, 'article', 'сифатида', 614),
(6326, 'article', 'маъқулланди', 614),
(6327, 'article', 'O‘ZLIDEP', 615),
(6328, 'article', 'Ўзбекистон', 615),
(6329, 'article', 'Президенти', 615),
(6330, 'article', 'лавозимига', 615),
(6331, 'article', 'Шавкат', 615),
(6332, 'article', 'Миромонович', 615),
(6333, 'article', 'Мирзиёев', 615),
(6334, 'article', 'номзодини', 615),
(6335, 'article', 'кўрсатди', 615),
(6336, 'article', 'ЛИОНЕЛЬ', 616),
(6337, 'article', 'МЕССИНИНГ', 616),
(6338, 'article', 'АКАСИ', 616),
(6339, 'article', 'СУДЛАНДИ', 616),
(6342, 'article', 'Ўзи', 618),
(6343, 'article', 'хон', 618),
(6344, 'article', 'кўланкаси', 618),
(6345, 'article', 'майдон', 618),
(6346, 'article', '«Дамас»чилар', 618),
(6347, 'article', 'Бетартиб', 617),
(6348, 'article', '«Дамас»чилар', 617),
(6349, 'article', 'Лицензиясиз', 619),
(6350, 'article', '«Дамас»чилар', 619),
(6369, 'article', 'ҳурмат', 620),
(6370, 'article', 'хотирасига', 620),
(6371, 'article', 'келтирди', 620),
(6372, 'article', 'Каримов', 620),
(6373, 'article', 'Ислом', 620),
(6374, 'article', 'Бош', 620),
(6375, 'article', 'БМТ', 620),
(6376, 'article', 'бажо', 620),
(6377, 'article', 'Ассамблеяси', 620),
(6378, 'article', 'Олимпиада', 621),
(6379, 'article', 'чемпиони', 621),
(6380, 'article', 'Фазлиддин', 621),
(6381, 'article', 'Ғоибназаров', 621),
(6382, 'article', 'билан', 621),
(6383, 'article', 'интервью', 621),
(6384, 'article', '«Адолат»', 622),
(6385, 'article', 'СДП', 622),
(6386, 'article', 'пленумида', 622),
(6387, 'article', 'Нариман', 622),
(6388, 'article', 'Умаров', 622),
(6389, 'article', 'Президент', 622),
(6390, 'article', 'лавозимига', 622),
(6391, 'article', 'номзод', 622),
(6392, 'article', 'сифатида', 622),
(6393, 'article', 'маъқулланди', 622),
(6406, 'article', 'Хотамжон', 623),
(6407, 'article', 'Халқ', 623),
(6408, 'article', 'Ўзбекистон', 623),
(6409, 'article', 'сифатида', 623),
(6410, 'article', 'Президент', 623),
(6411, 'article', 'пленумида', 623),
(6412, 'article', 'партияси', 623),
(6413, 'article', 'номзод', 623),
(6414, 'article', 'маъқулланди', 623),
(6415, 'article', 'лавозимига', 623),
(6416, 'article', 'Кетмонов', 623),
(6417, 'article', 'демократик', 623),
(6418, 'article', 'Наманган', 624),
(6419, 'article', 'истиқлол', 624),
(6420, 'article', 'йилларида', 624),
(6421, 'article', '«Поедем', 625),
(6422, 'article', 'Поедим', 625),
(6423, 'article', 'кўрсатувининг', 625),
(6424, 'article', 'яна', 625),
(6425, 'article', 'бир', 625),
(6426, 'article', 'сони', 625),
(6427, 'article', 'Ўзбекистонда', 625),
(6428, 'article', 'суратга', 625),
(6429, 'article', 'олинади', 625),
(6430, 'article', '«Навбаҳор»', 626),
(6431, 'article', 'Изоҳга', 626),
(6432, 'article', 'хожат', 626),
(6433, 'article', 'йўқ', 626),
(6454, 'article', 'қандай', 627),
(6455, 'article', 'Юнайтед»', 627),
(6456, 'article', 'этди', 627),
(6457, 'article', 'Сити»', 627),
(6458, 'article', 'Моуриньони', 627),
(6459, 'article', 'мағлуб', 627),
(6460, 'article', 'Ёҳуд', 627),
(6461, 'article', 'Гвардиола', 627),
(6462, 'article', '«Манчестер', 627),
(6463, 'article', '«Манчестер', 627),
(6464, 'article', 'Шавкат', 628),
(6465, 'article', 'Мирзиёев', 628),
(6466, 'article', '«Ички', 628),
(6467, 'article', 'ишлар', 628),
(6468, 'article', 'органлари', 628),
(6469, 'article', 'тўғрисида»ги', 628),
(6470, 'article', 'қонунни', 628),
(6471, 'article', 'имзолади', 628),
(6472, 'article', 'ВИРУСЛИ', 629),
(6473, 'article', 'ГЕПАТИТДАН', 629),
(6474, 'article', 'САҚЛАНИНГ', 629),
(6475, 'article', 'Ислом', 630),
(6476, 'article', 'КАРИМОВ', 630),
(6477, 'article', '“ЎРГАНИШ', 630),
(6478, 'article', 'ЎРГАНИШ', 630),
(6479, 'article', 'ВА', 630),
(6480, 'article', 'ЯНА', 630),
(6481, 'article', 'БИР', 630),
(6482, 'article', 'БОР', 630),
(6483, 'article', 'ЎРГАНИШ', 630),
(6484, 'article', 'КЕРАК”', 630),
(6485, 'article', 'Ислом', 631),
(6486, 'article', 'КАРИМОВ', 631),
(6487, 'article', '“МАРРАНИ', 631),
(6488, 'article', 'БАЛАНД', 631),
(6489, 'article', 'ОЛИНГ', 631),
(6497, 'article', 'харакатидан', 633),
(6498, 'article', 'маршрутдаги', 633),
(6499, 'article', 'мамнунмиз»', 633),
(6500, 'article', 'автобус', 633),
(6501, 'article', 'Паралимпия', 634),
(6502, 'article', 'нафар', 634),
(6503, 'article', 'спортчимиз', 634),
(6504, 'article', 'та', 634),
(6505, 'article', 'медални', 634),
(6506, 'article', 'қўлга', 634),
(6507, 'article', 'киритди', 634),
(6508, 'article', 'Наманган', 635),
(6509, 'article', 'Автобуслар', 635),
(6510, 'article', 'ҳаракати', 635),
(6511, 'article', 'узлуксиз', 635),
(6512, 'article', 'бўлса', 635),
(6513, 'article', '«Дамас»чилар', 636),
(6514, 'article', 'йўлкирани', 636),
(6515, 'article', 'қимматлаштирди', 636),
(6516, 'article', 'Нью', 637),
(6517, 'article', 'Йорк', 637),
(6518, 'article', 'ва', 637),
(6519, 'article', 'Нью', 637),
(6520, 'article', 'Жерсида', 637),
(6521, 'article', 'портлаган', 637),
(6522, 'article', 'бомбалар', 637),
(6523, 'article', 'бир', 637),
(6524, 'article', 'одам', 637),
(6525, 'article', 'томонидан', 637),
(6526, 'article', 'тайёрлангани', 637),
(6527, 'article', 'маълум', 637),
(6528, 'article', 'бўлди', 637),
(6529, 'article', 'йилги', 638),
(6530, 'article', 'ҳосилга', 638),
(6531, 'article', 'тегишли', 638),
(6532, 'article', 'пахта', 638),
(6533, 'article', 'хом', 638),
(6534, 'article', 'ашёсининг', 638),
(6535, 'article', 'харид', 638),
(6536, 'article', 'баҳолари', 638),
(6537, 'article', 'тасдиқланди', 638),
(6542, 'article', 'қўлланади', 632),
(6543, 'article', 'жарималар', 632),
(6544, 'article', '«Дамас»чиларга', 632),
(6549, 'article', 'ЮРТ', 639),
(6550, 'article', 'ТАЯНЧИ', 639),
(6551, 'article', 'БАРКАМОЛ', 639),
(6552, 'article', 'АВЛОД', 639),
(6553, 'article', 'Наманганлик', 640),
(6554, 'article', 'ҳожиларнинг', 640),
(6555, 'article', 'дастлабки', 640),
(6556, 'article', 'гуруҳлари', 640),
(6557, 'article', 'соғ', 640),
(6558, 'article', 'саломат', 640),
(6559, 'article', 'қайтдилар', 640),
(6563, 'article', 'этмоқда', 641),
(6564, 'article', 'Тарғиботлар', 641),
(6565, 'article', 'давом', 641),
(6566, 'article', '“ДАМАС”', 642),
(6567, 'article', 'масаласи', 642),
(6568, 'article', 'ва', 642),
(6569, 'article', 'Навоий', 642),
(6570, 'article', 'кўчасидаги', 642),
(6571, 'article', 'тирбандлик', 642),
(6572, 'article', 'сабаби', 642),
(6573, 'article', 'Facebook’да', 643),
(6574, 'article', 'ишлайдиган', 643),
(6575, 'article', 'ўзбекистонлик', 643),
(6576, 'article', 'Азиз', 643),
(6577, 'article', 'Муртазоев', 643),
(6578, 'article', 'билан', 643),
(6579, 'article', 'суҳбат', 643),
(6582, 'article', 'Ўзбекистон', 645),
(6583, 'article', 'қиличбозлик', 645),
(6584, 'article', 'федерациясига', 645),
(6585, 'article', 'янги', 645),
(6586, 'article', 'раҳбар', 645),
(6587, 'article', 'тайинланди', 645),
(6588, 'article', 'якдиллик', 644),
(6589, 'article', 'Коллежлардаги', 644),
(6590, 'article', 'Алмазбек', 646),
(6591, 'article', 'Атамбаев', 646),
(6592, 'article', 'ой', 646),
(6593, 'article', 'охиригача', 646),
(6594, 'article', 'Туркияда', 646),
(6595, 'article', 'қолади', 646),
(6596, 'article', 'Наманган', 647),
(6597, 'article', 'вилоят', 647),
(6598, 'article', 'кенгашининг', 647),
(6599, 'article', 'сессияси', 647),
(6600, 'article', 'бўлди', 647),
(6601, 'article', 'Огоҳлик', 648),
(6602, 'article', 'замон', 648),
(6603, 'article', 'талаби', 648),
(6604, 'article', 'Фото', 649),
(6605, 'article', 'Паралимпиячилар', 649),
(6606, 'article', 'даблдекерларда', 649),
(6607, 'article', 'Тошкент', 649),
(6608, 'article', 'бўйлаб', 649),
(6609, 'article', 'турне', 649),
(6610, 'article', 'уюштиради', 649),
(6611, 'article', 'ЖЧ', 650),
(6612, 'article', 'Ўзбекистоннинг', 650),
(6613, 'article', 'Эрон', 650),
(6614, 'article', 'ва', 650),
(6615, 'article', 'Хитойга', 650),
(6616, 'article', 'қарши', 650),
(6617, 'article', 'ўйинлари', 650),
(6618, 'article', 'санаси', 650),
(6619, 'article', 'маълум', 650),
(6620, 'article', 'бўлди', 650),
(6621, 'article', 'Фото', 651),
(6622, 'article', 'Паралимпия', 651),
(6623, 'article', 'термаси', 651),
(6624, 'article', 'тантанали', 651),
(6625, 'article', 'кутиб', 651),
(6626, 'article', 'олинди', 651),
(6627, 'article', 'Аёл', 652),
(6628, 'article', 'гроссмейстерларимиз', 652),
(6629, 'article', 'икки', 652),
(6630, 'article', 'нафарга', 652),
(6631, 'article', 'етди', 652),
(6632, 'article', 'улар', 652),
(6633, 'article', 'эса', 652),
(6634, 'article', 'опа', 652),
(6635, 'article', 'сингил', 652),
(6636, 'article', 'Наманган', 653),
(6637, 'article', 'ўқув', 653),
(6638, 'article', 'юртларида', 653),
(6639, 'article', 'тарғибот', 653),
(6640, 'article', 'гуруҳи', 653),
(6641, 'article', 'декабрь', 654),
(6642, 'article', 'куни', 654),
(6643, 'article', 'старт', 654),
(6644, 'article', 'оладиган', 654),
(6645, 'article', 'клублар', 654),
(6646, 'article', 'ўртасидаги', 654),
(6647, 'article', 'Жаҳон', 654),
(6648, 'article', 'Чемпионатига', 654),
(6649, 'article', 'қуръа', 654),
(6650, 'article', 'ташланди', 654),
(6651, 'article', 'Наманганда', 655),
(6652, 'article', '“ICTExpo', 655),
(6653, 'article', 'ахборот', 655),
(6654, 'article', 'коммуникация', 655),
(6655, 'article', 'технологиялари', 655),
(6656, 'article', 'миллий', 655),
(6657, 'article', 'кўргазмаси', 655),
(6658, 'article', 'бўлиб', 655),
(6659, 'article', 'ўтди', 655),
(6660, 'article', 'Олимлар', 656),
(6661, 'article', 'чекишнинг', 656),
(6662, 'article', 'янги', 656),
(6663, 'article', 'хавфини', 656),
(6664, 'article', 'аниқлашди', 656),
(6665, 'article', 'Қозоғистон', 657),
(6666, 'article', 'бош', 657),
(6667, 'article', 'вазир', 657),
(6668, 'article', 'ўринбосари', 657),
(6669, 'article', 'Тошкентга', 657),
(6670, 'article', 'ташриф', 657),
(6671, 'article', 'буюрди', 657),
(6672, 'article', 'Фото', 658),
(6673, 'article', 'Паралимпиячиларга', 658),
(6674, 'article', 'совға', 658),
(6675, 'article', 'қилинадиган', 658),
(6676, 'article', 'Malibu', 658),
(6677, 'article', 'автомобиллари', 658),
(6678, 'article', 'ўз', 658),
(6679, 'article', 'соҳибларини', 658),
(6680, 'article', 'кутмоқда', 658),
(6681, 'article', 'Фото', 659),
(6682, 'article', 'Паралимпиячиларга', 659),
(6683, 'article', 'совға', 659),
(6684, 'article', 'қилинадиган', 659),
(6685, 'article', 'Malibu', 659),
(6686, 'article', 'автомобиллари', 659),
(6687, 'article', 'ўз', 659),
(6688, 'article', 'соҳибларини', 659),
(6689, 'article', 'кутмоқда', 659),
(6690, 'article', 'Наманган', 660),
(6691, 'article', 'коллежларидаги', 660),
(6692, 'article', 'учрашувлар', 660),
(6693, 'article', 'Наманган', 661),
(6694, 'article', 'вилоятида', 661),
(6695, 'article', 'йилга', 661),
(6696, 'article', 'бориб', 661),
(6697, 'article', 'саноат', 661),
(6698, 'article', 'маҳсулотлари', 661),
(6699, 'article', 'ишлаб', 661),
(6700, 'article', 'чиқариш', 661),
(6701, 'article', 'ҳажми', 661),
(6702, 'article', 'баробар', 661),
(6703, 'article', 'ортади', 661),
(6704, 'article', 'Фото', 662),
(6705, 'article', 'Паралимпиячилар', 662),
(6706, 'article', 'тақдирланди', 662),
(6707, 'article', 'Афғонистондаги', 663),
(6708, 'article', 'машҳур', 663),
(6709, 'article', 'ўзбек', 663),
(6710, 'article', 'алломалари', 663),
(6711, 'article', 'қабрлари', 663),
(6712, 'article', 'ободонлаштирилди', 663),
(6713, 'article', 'Ўзбекистон', 664),
(6714, 'article', 'Президенти', 664),
(6715, 'article', 'сайловини', 664),
(6716, 'article', 'ўтказувчи', 664),
(6717, 'article', 'округ', 664),
(6718, 'article', 'комиссиялари', 664),
(6719, 'article', 'таркибига', 664),
(6720, 'article', 'номзодлар', 664),
(6721, 'article', 'тавсия', 664),
(6722, 'article', 'этилди', 664),
(6723, 'article', 'Ўзбекистонлик', 665),
(6724, 'article', 'футболчи', 665),
(6725, 'article', 'Виталий', 665),
(6726, 'article', 'Денисов', 665),
(6727, 'article', 'гемотология', 665),
(6728, 'article', 'марказида', 665),
(6729, 'article', 'болаларга', 665),
(6730, 'article', 'қувонч', 665),
(6731, 'article', 'улашди', 665),
(6747, 'article', 'Қизил', 666),
(6748, 'article', 'фуқаро', 666),
(6749, 'article', 'Ўзбекистон', 666),
(6750, 'article', 'тутиб', 666),
(6751, 'article', 'тортилди', 666),
(6752, 'article', 'сотиш', 666),
(6753, 'article', 'олган', 666),
(6754, 'article', 'мақсадида', 666),
(6755, 'article', 'китоб', 666),
(6756, 'article', 'киритилган', 666),
(6757, 'article', 'ига', 666),
(6758, 'article', 'жайронни', 666),
(6759, 'article', 'жазога', 666),
(6760, 'article', 'quot', 666),
(6761, 'article', 'quot', 666),
(6762, 'article', 'Ҳамкорлик', 667),
(6763, 'article', 'масалалари', 667),
(6764, 'article', 'муҳокама', 667),
(6765, 'article', 'қилинди', 667),
(6766, 'article', 'Мўғул', 668),
(6767, 'article', 'мураббийлари', 668),
(6768, 'article', 'Риодаги', 668),
(6769, 'article', 'ҳаракатлари', 668),
(6770, 'article', 'учун', 668),
(6771, 'article', 'спортдан', 668),
(6772, 'article', 'четлатилди', 668),
(6783, 'article', 'қатнашди', 669),
(6784, 'article', 'учрашувида', 669),
(6785, 'article', 'ташқи', 669),
(6786, 'article', 'Комилов', 669),
(6787, 'article', 'ИҲТга', 669),
(6788, 'article', 'ишлар', 669),
(6789, 'article', 'давлатлар', 669),
(6790, 'article', 'вазирлари', 669),
(6791, 'article', 'аъзо', 669),
(6792, 'article', 'Абдулазиз', 669),
(6793, 'article', 'ҲАЛОКАТ', 670),
(6794, 'article', 'ЎПКОНИ', 670),
(6795, 'article', 'Халқаро', 671),
(6796, 'article', 'даражадаги', 671),
(6797, 'article', 'спорт', 671),
(6798, 'article', 'юристи', 671),
(6799, 'article', 'дипломини', 671),
(6800, 'article', 'черковда', 671),
(6801, 'article', 'қабул', 671),
(6802, 'article', 'қилиб', 671),
(6803, 'article', 'олган', 671),
(6804, 'article', 'Санъат', 671),
(6805, 'article', 'Шарипов', 671),
(6806, 'article', 'бу', 671),
(6807, 'article', 'борада', 671),
(6808, 'article', 'биринчи', 671),
(6809, 'article', 'ўзбекистонлик', 671),
(6810, 'article', 'бўлди', 671),
(6825, 'article', 'Япония', 672),
(6826, 'article', 'Фидел', 672),
(6827, 'article', 'учрашув', 672),
(6828, 'article', 'ўтказди', 672),
(6829, 'article', 'ташриф', 672),
(6830, 'article', 'Кубага', 672),
(6831, 'article', 'Кастро', 672),
(6832, 'article', 'илк', 672),
(6833, 'article', 'вазири', 672),
(6834, 'article', 'ва', 672),
(6835, 'article', 'буюрди', 672),
(6836, 'article', 'бош', 672),
(6837, 'article', 'бор', 672),
(6838, 'article', 'билан', 672),
(6846, 'article', 'қатнашишга', 673),
(6847, 'article', 'сайловида', 673),
(6848, 'article', 'президент', 673),
(6849, 'article', 'партияларга', 673),
(6850, 'article', 'ижозат', 673),
(6851, 'article', 'берилди', 673),
(6852, 'article', 'Барча', 673),
(6863, 'article', 'ўтказилди', 674),
(6864, 'article', 'Ўзбекистон', 674),
(6865, 'article', 'сайлови', 674),
(6866, 'article', 'сайлов', 674),
(6867, 'article', 'Президенти', 674),
(6868, 'article', 'кампаниясининг', 674),
(6869, 'article', 'бўйича', 674),
(6870, 'article', 'брифинг', 674),
(6871, 'article', 'боришига', 674),
(6872, 'article', 'бағишланган', 674),
(6877, 'article', 'Ўзбекистонлик', 675),
(6878, 'article', 'киритди', 675),
(6879, 'article', 'дарвозабон', 675),
(6880, 'article', 'гол', 675),
(6881, 'article', 'Мираброр', 676),
(6882, 'article', 'Усмонов', 676),
(6883, 'article', 'давлат', 676),
(6884, 'article', 'мукофоти', 676),
(6885, 'article', 'билан', 676),
(6886, 'article', 'тақдирланди', 676),
(6887, 'article', 'ЖАВОҲИР', 677),
(6888, 'article', 'ЗОКИРОВ', 677),
(6889, 'article', 'ЎЗИ', 677),
(6890, 'article', 'ҲАҚИДАГИ', 677),
(6891, 'article', 'ЭНГ', 677),
(6892, 'article', 'ЁҚИМСИЗ', 677),
(6893, 'article', 'МИШ', 677),
(6894, 'article', 'МИШ', 677),
(6895, 'article', 'ҲАҚИДА', 677),
(6896, 'article', 'ГАПИРДИ', 677),
(6897, 'article', 'Тошкент', 678),
(6898, 'article', 'Афғонистоннинг', 678),
(6899, 'article', 'донор', 678),
(6900, 'article', 'мамлакатларини', 678),
(6901, 'article', 'мажбуриятларини', 678),
(6902, 'article', 'бажаришга', 678),
(6903, 'article', 'чақирди', 678),
(6939, 'article', 'фото', 679),
(6940, 'article', 'ўтмоқда', 679),
(6941, 'article', 'Тур»', 679),
(6942, 'article', 'Наманганда', 679),
(6943, 'article', 'веломарафони', 679),
(6944, 'article', 'бўлиб', 679),
(6945, 'article', '«Камолот', 679),
(6953, 'article', 'фото', 680),
(6954, 'article', 'ўтмоқда', 680),
(6955, 'article', 'Тур»', 680),
(6956, 'article', 'Наманганда', 680),
(6957, 'article', 'веломарафони', 680),
(6958, 'article', 'бўлиб', 680),
(6959, 'article', '«Камолот', 680),
(6960, 'article', 'Наманганда', 681),
(6961, 'article', '«Камолот', 681),
(6962, 'article', 'Тур»', 681),
(6963, 'article', 'веломарафони', 681),
(6964, 'article', 'старт', 681),
(6965, 'article', 'олмокда', 681),
(6966, 'article', 'фото', 681),
(6976, 'article', 'Йўлнинг', 683),
(6977, 'article', 'ўтиш', 683),
(6978, 'article', 'қисмида', 683),
(6979, 'article', 'телефондан', 683),
(6980, 'article', 'фойдаланган', 683),
(6981, 'article', 'пиёдалар', 683),
(6982, 'article', 'учун', 683),
(6983, 'article', 'жарима', 683),
(6984, 'article', 'миқдори', 683),
(6985, 'article', 'белгиланди', 683),
(6986, 'article', 'учун', 682),
(6987, 'article', 'транспорт', 682),
(6988, 'article', 'мувофиқ', 682),
(6989, 'article', 'ЙҲҚга', 682),
(6990, 'article', 'жиҳозланмаган', 682),
(6991, 'article', 'жарималар', 682),
(6992, 'article', 'воситаларини', 682),
(6993, 'article', 'бошқарганлик', 682),
(6994, 'article', 'белгиланди', 682),
(7003, 'article', 'Наманганлик', 685),
(7004, 'article', 'Нозимахон', 685),
(7005, 'article', 'Қаюмовага', 685),
(7006, 'article', 'янги', 685),
(7007, 'article', 'уй', 685),
(7008, 'article', 'калити', 685),
(7009, 'article', 'топширилди', 685),
(7010, 'article', 'фото', 685),
(7017, 'article', '“УНУТМА”', 686),
(7018, 'article', 'ҲОЖИАКБАР', 686),
(7019, 'article', 'ҲАЙДАРОВДАН', 686),
(7020, 'article', 'ЯНГИ', 686),
(7021, 'article', 'ТАРОНА', 686),
(7022, 'article', 'ВИДЕО', 686),
(7031, 'article', 'ҳолларига', 684),
(7032, 'article', 'фуқаролигидан', 684),
(7033, 'article', 'Ўзбекистон', 684),
(7034, 'article', 'Республикаси', 684),
(7035, 'article', 'ойдинлик', 684),
(7036, 'article', 'маҳрум', 684),
(7037, 'article', 'киритилди', 684),
(7038, 'article', 'бўлиш', 684),
(7232, 'article', 'Автомобил,юриш,кисми,таъмири', 6),
(7233, 'article', 'Uzbekistan,КК', 7),
(7234, 'article', 'Ўзавтотеххизмат,МЧЖ', 8),
(7235, 'article', 'AVTOSANOATINVEST,МЧЖ', 9),
(7236, 'article', 'AVTOSANOT,PLAST,МЧЖ', 10),
(7237, 'article', 'Тошкент,шахридаги,Турин,Политехника,Университети', 11),
(7259, 'article', 'Жамият,тарихи', 13),
(7262, 'article', 'Жиззах,Аккумулятор,Заводи,ОАО', 12),
(7263, 'article', 'Саноат,ярмаркаси,фойдали,шартномалар,имзоланди', 15),
(7264, 'article', 'Uzbekistan,tomonidan,Ikkinchi,jahon,urushi,qatnashchilariga,hurmat,ehtirom,tarzida,xayriya,aksiyasi,uyushtirilib', 14),
(7266, 'article', 'Автомат,ва,механик,узатиш,коробкалари,таъмири', 18),
(7267, 'article', 'Автомат,ва,механик,узатиш,коробкалари,таъмири', 19),
(7268, 'article', 'Кузовлар,таъмири,ва,алмаштириш', 20),
(7269, 'article', 'Автомобилларга,кафолатли,техник,хизмат,курсатиш', 21),
(7270, 'article', 'Двигателларни,таъмирлаш,ва,созлаш', 22),
(7271, 'article', 'Компьютер,диагностикаси,буйича,хизмат,курсатиш', 23),
(7272, 'article', 'Двигатель,блоклари,таъмири', 24),
(7273, 'article', 'Автомобилга,газ,балон,жихозларини,урнатиш,ва,созлаш', 25),
(7274, 'article', 'Токарлик,ишлари,ва,хизматлари', 26),
(7275, 'article', 'Автомобилларни,ювиш,ва,косметик,ишлов,бериш', 27),
(7276, 'article', 'Шина,монтаж,ишлари', 28),
(7277, 'article', 'Гилдираклар,укининг,развал,ва,схождениялари', 29),
(7278, 'article', 'Гилдираклар,балансировкаси', 30),
(7279, 'article', 'Инжекторларни,таъмирлаш,ва,тозалаш', 31),
(7280, 'article', 'Автомобил,техник,жихозларига,техник,хизмат,курсатиш', 32),
(7281, 'article', 'Қўшимча,жихозлар,ўрнатиш', 33),
(7282, 'article', 'Автомобил,бамперларини,таъмирлаш,ва,бўяш', 34),
(7283, 'article', 'Автомобил,эшиклари,олди,ва,орка,капотларини,созлаш', 35),
(7284, 'article', 'Газ,жихозларини,урнатиш,ва,таъмирлаш', 36),
(7285, 'article', 'Ремонт,ходовой,части,автомобиля', 37),
(7286, 'article', 'Ремонт,автоматических,механических,коробок,передач', 38),
(7288, 'article', 'Косметическая,обработка,покраска,кузовов', 40),
(7289, 'article', 'Ремонт,замена,кузовов', 39),
(7290, 'article', 'Оказание,гарантийного,технического,обслуживания,автомобилей', 41),
(7291, 'article', 'Ремонт,наладка,двигателей', 42),
(7292, 'article', 'Оказание,услуг,по,компьютерной,диагностике', 43),
(7293, 'article', 'Ремонт,блоков,двигателей', 44),
(7294, 'article', 'Установка,наладка,газобаллонного,оборудования,автомобилей', 45),
(7295, 'article', 'Токарные,работы,услуги', 46),
(7296, 'article', 'Косметическая,обработка,мойка,автомобилей', 47),
(7297, 'article', 'Шиномонтажные,работы', 48),
(7298, 'article', 'Развал,схождение,оси,колёс', 49),
(7299, 'article', 'Балансировка,колёс', 50),
(7300, 'article', 'Оказание,технического,обслуживания,электроприборов,автомобиля', 51),
(7301, 'article', 'Установка,дополнительного,оборудования', 52),
(7302, 'article', 'Ремонт,покраска,переднего,заднего,бамперов,автомобиля', 53),
(7303, 'article', 'Наладка,дверей,переднего,заднего,капотов,автомобиля', 54),
(7304, 'article', 'Установка,ремонт,газооборудования', 55),
(7305, 'article', 'Касательно,производства,автомобилей,Tico,Epica,Nexia,поколения,АО,Uzbekistan', 56),
(7306, 'article', 'УЧАСТИЕ,НА,ОТРАСЛЕВОЙ,ПРОМЫШЛЕННОЙ,ЯРМАРКЕ', 57),
(7307, 'article', 'ОБ,УЧАСТИИ,НА,ОТРАСЛЕВОЙ,ПРОМЫШЛЕННОЙ,ЯРМАРКЕ', 58),
(7308, 'article', 'Актуальные,проблемы,динамических,систем,их,применение', 59),
(7314, 'article', 'Гувохнома', 60),
(7316, 'article', 'Сертификат', 64),
(7317, 'article', 'Лицензия', 63),
(7319, 'article', 'Dinamik,sistemalarning,dolzarb,muammolari,mavzusida,ilmiy,konferensiya', 62),
(7322, 'article', 'BUGUN,ZEKSPOMARKAZ,PAVILYONLARIDA,NAVBATDAGI,SANOAT,YARMARKASI,KOOPERATSION,BIRJA,ISHINI,BOSHLADI', 61),
(7323, 'article', 'BUTKUL,YANGILANGAN,ZAMONAVIY,ISHONCHLI,AVTOMOBIL,UZBEKISTАN,CHEVROLET,MALIBU,SEDANINING,YANGI,AVLODI', 17),
(7327, 'article', 'Дамас', 65),
(7329, 'article', 'комании', 16),
(7330, 'article', 'Ласетти', 66),
(7333, 'article', 'Бир,оят,тафсири', 68),
(7334, 'article', 'Қироат,имомлари', 69),
(7335, 'article', 'Қироатлар,видео,ва,аудио', 70),
(7336, 'article', 'Юртимиздан,чиққан,қорилар', 71),
(7351, 'article', 'Абдуллоҳ,ибн,Муборак,раҳматуллоҳи,алайҳининг,қимматли,ҳикматлари', 84),
(7354, 'article', 'Бўйдоқлик,ва,никоҳнинг,ундан,афзаллиги', 80),
(7355, 'article', 'Фарзандларга,Аллоҳнинг,Китобини,ва,Расулуллоҳ,соллаллоҳу,алайҳи,васалламнинг,суннатларини,ўргатиш', 82),
(7356, 'article', 'Аёл,мўътабар,зот', 81),
(7357, 'article', 'Хурмо,билан,оғиз,очиш,набавий,суннатдаги,тиббий,мўъжизадир', 73),
(7358, 'article', 'Қуръондаги,илмий,мўжизалар', 72),
(7359, 'article', 'Қуръон,қироатига,бериладиган,ажр', 67),
(7360, 'article', 'Аллоҳнинг,борлигини,баён,қилувчи,энг,катта,далил', 76),
(7361, 'article', 'Албатта,кулдирган,ҳам,йиғлатган,ҳам,Унинг,Ўзидир', 75),
(7362, 'article', 'Аллоҳнинг,гўзал,исмлари', 74),
(7363, 'article', 'Имом,Абу,Ҳанифа,раҳимаҳуллоҳнинг,заковати', 83),
(7364, 'article', 'Ҳамкорликка,шошилинг', 85),
(7366, 'article', 'Шумланиш,ва,фолбинлик', 86),
(7367, 'article', 'РАМАЗОН,ШУКУХИ', 87),
(7368, 'article', 'Minor,jome,masjidi', 88),
(7370, 'article', 'Оила,жанг,майдони,эмас', 89),
(7373, 'article', 'Намоздаги,қиём,ҳолатининг,ҳанафий,мазҳабидаги,кўриниши', 77),
(7374, 'article', 'Садақа,ҳақида,бебаҳо,фикрлар', 79),
(7375, 'article', 'Рўзанинг,мукофоти', 78),
(7377, 'article', 'МИСВОК', 91),
(7380, 'article', 'Намоздаги,холатлар', 92),
(7419, 'article', 'Қишлоқ', 2),
(7420, 'article', 'хўжалиги', 2),
(7421, 'article', 'ходимлари', 2),
(7422, 'article', 'нишонланди', 2),
(7423, 'article', 'куни', 2),
(7424, 'article', 'кенг', 2),
(7425, 'article', 'ҳисса', 1),
(7426, 'article', 'қўшган', 1),
(7427, 'article', 'Қишлоқ', 1),
(7428, 'article', 'юртдошларимиздан', 1),
(7429, 'article', 'хўжалиги', 1),
(7430, 'article', 'ходимлари', 1),
(7431, 'article', 'тўғрисида', 1),
(7432, 'article', 'соҳа', 1),
(7433, 'article', 'ривожига', 1),
(7434, 'article', 'муносиб', 1),
(7435, 'article', 'муносабати', 1),
(7436, 'article', 'мукофотлаш', 1),
(7437, 'article', 'куни', 1),
(7438, 'article', 'гуруҳини', 1),
(7439, 'article', 'бир', 1),
(7440, 'article', 'билан', 1),
(7457, 'article', 'қишлоқ', 3),
(7458, 'article', 'янги', 3),
(7459, 'article', 'хўжалиги', 3),
(7460, 'article', 'ходимлари', 3),
(7461, 'article', 'улуғлаш', 3),
(7462, 'article', 'соҳа', 3),
(7463, 'article', 'рўзимиз', 3),
(7464, 'article', 'Ризқ', 3),
(7465, 'article', 'ривожини', 3),
(7466, 'article', 'меҳнатини', 3),
(7467, 'article', 'кўтариш', 3),
(7468, 'article', 'вазифамиздир', 3),
(7469, 'article', 'бунёдкори', 3),
(7470, 'article', 'бўлган', 3),
(7471, 'article', 'босқичга', 3),
(7472, 'article', 'асосий', 3),
(7491, 'article', 'ҳажми', 5),
(7492, 'article', 'қишлоқ', 5),
(7493, 'article', 'хўжалиги', 5),
(7494, 'article', 'умумий', 5),
(7495, 'article', 'триллион', 5),
(7496, 'article', 'сўмлик', 5),
(7497, 'article', 'миллиард', 5),
(7498, 'article', 'маҳсулотлари', 5),
(7499, 'article', 'Жиззахда', 5),
(7500, 'article', 'етиштирилди', 5),
(7507, 'article', 'хақида', 4),
(7508, 'article', 'Жамият', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fbid` int(11) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastip` varchar(16) DEFAULT NULL,
  `userlevel` tinyint(1) DEFAULT NULL,
  `access` text,
  `fb_link` varchar(100) DEFAULT NULL,
  `tw_link` varchar(100) DEFAULT NULL,
  `gp_link` varchar(100) DEFAULT NULL,
  `vk_link` varchar(100) DEFAULT NULL,
  `active` enum('y','n','t','b') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fbid`, `username`, `password`, `email`, `created_at`, `update_at`, `lastlogin`, `lastip`, `userlevel`, `access`, `fb_link`, `tw_link`, `gp_link`, `vk_link`, `active`) VALUES
(1, 0, 'admin', '309ce9ea687fee6ac7eb72651ad22c11', 'bahrom1982@gmail.com', '2017-04-28 11:14:20', '2015-12-28 14:01:03', '2017-12-11 10:55:27', '::1', 1, NULL, 'sd', 'asd', 'asd', 'adsd', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `users_message`
--

CREATE TABLE `users_message` (
  `id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL DEFAULT '0',
  `from_id` int(11) NOT NULL DEFAULT '0',
  `senddate` datetime NOT NULL,
  `is_new` tinyint(4) NOT NULL,
  `message` text NOT NULL,
  `to_del` tinyint(4) NOT NULL,
  `from_del` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_black`
--

CREATE TABLE `user_black` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_friends`
--

CREATE TABLE `user_friends` (
  `id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL DEFAULT '0',
  `from_id` int(11) NOT NULL DEFAULT '0',
  `logdate` datetime NOT NULL,
  `is_accepted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `isadmin` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`group_id`, `title`, `name`, `description`, `isadmin`) VALUES
(1, 'Суперадмин', 'superadmin', 'Root Superadmin , should be as top level group', 1),
(2, 'Администратор', 'administrator', 'Administrator level, level No 2', 1),
(3, 'Пользователь', 'users', '<p>Users as registered / member</p>', 0),
(4, 'Гость', 'guest', 'Гость', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT '0',
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `info` text,
  `gender` enum('m','f') DEFAULT NULL,
  `newsletter` int(11) DEFAULT '0',
  `avatar` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `city_id`, `fname`, `lname`, `birthdate`, `website`, `phone`, `info`, `gender`, `newsletter`, `avatar`) VALUES
(1, 1, 1, 'Парпиев', 'Бахром', '1982-02-08', 'www.livenews.uz', '+998902194617', 'фқфвқв қввфқвфқвфқвфв', 'm', 0, 'c4ca4238a0b923820dcc509a6f75849b.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `file` text NOT NULL,
  `fileurl` text NOT NULL,
  `tags` text NOT NULL,
  `seolink` varchar(200) NOT NULL,
  `provider` varchar(200) NOT NULL,
  `pubdate` date NOT NULL,
  `published` int(11) NOT NULL,
  `img` varchar(150) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_category`
--

CREATE TABLE `video_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `seolink` varchar(155) NOT NULL,
  `meta_name` varchar(155) NOT NULL,
  `meta_desc` varchar(250) NOT NULL,
  `meta_key` varchar(155) NOT NULL,
  `h1name` varchar(100) NOT NULL,
  `destext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pubdate` (`pubdate`);

--
-- Indexes for table `audio_album`
--
ALTER TABLE `audio_album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `audio_genre`
--
ALTER TABLE `audio_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio_pl`
--
ALTER TABLE `audio_pl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `audio_pl_list`
--
ALTER TABLE `audio_pl_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `audio_singer`
--
ALTER TABLE `audio_singer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs_cats`
--
ALTER TABLE `blogs_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs_photos`
--
ALTER TABLE `blogs_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_comments_articles` (`target_id`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_access`
--
ALTER TABLE `content_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content_photos`
--
ALTER TABLE `content_photos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `content_video`
--
ALTER TABLE `content_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files_access`
--
ALTER TABLE `files_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files_cat`
--
ALTER TABLE `files_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files_rating`
--
ALTER TABLE `files_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files_reclama`
--
ALTER TABLE `files_reclama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `filter_rules`
--
ALTER TABLE `filter_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `like_item`
--
ALTER TABLE `like_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Indexes for table `menus_type`
--
ALTER TABLE `menus_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules_menu`
--
ALTER TABLE `modules_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photoalbums`
--
ALTER TABLE `photoalbums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photofiles`
--
ALTER TABLE `photofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins_event`
--
ALTER TABLE `plugins_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_questions`
--
ALTER TABLE `poll_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superslider_sliders`
--
ALTER TABLE `superslider_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `superslider_slides`
--
ALTER TABLE `superslider_slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slider_id` (`slider_id`),
  ADD KEY `ordering` (`ordering`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_message`
--
ALTER TABLE `users_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_black`
--
ALTER TABLE `user_black`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usr` (`user_id`);

--
-- Indexes for table `user_friends`
--
ALTER TABLE `user_friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seolink` (`seolink`);

--
-- Indexes for table `video_category`
--
ALTER TABLE `video_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `audio_album`
--
ALTER TABLE `audio_album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `audio_genre`
--
ALTER TABLE `audio_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `audio_pl`
--
ALTER TABLE `audio_pl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `audio_pl_list`
--
ALTER TABLE `audio_pl_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `audio_singer`
--
ALTER TABLE `audio_singer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blogs_cats`
--
ALTER TABLE `blogs_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blogs_photos`
--
ALTER TABLE `blogs_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `content_access`
--
ALTER TABLE `content_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `content_photos`
--
ALTER TABLE `content_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `content_video`
--
ALTER TABLE `content_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files_access`
--
ALTER TABLE `files_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files_cat`
--
ALTER TABLE `files_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `files_rating`
--
ALTER TABLE `files_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `files_reclama`
--
ALTER TABLE `files_reclama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `filter_rules`
--
ALTER TABLE `filter_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `like_item`
--
ALTER TABLE `like_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `menus_type`
--
ALTER TABLE `menus_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `modules_menu`
--
ALTER TABLE `modules_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;
--
-- AUTO_INCREMENT for table `photoalbums`
--
ALTER TABLE `photoalbums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `photofiles`
--
ALTER TABLE `photofiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `plugins_event`
--
ALTER TABLE `plugins_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `poll_questions`
--
ALTER TABLE `poll_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `poll_votes`
--
ALTER TABLE `poll_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `superslider_sliders`
--
ALTER TABLE `superslider_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `superslider_slides`
--
ALTER TABLE `superslider_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7509;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_message`
--
ALTER TABLE `users_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_black`
--
ALTER TABLE `user_black`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_friends`
--
ALTER TABLE `user_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `video_category`
--
ALTER TABLE `video_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;