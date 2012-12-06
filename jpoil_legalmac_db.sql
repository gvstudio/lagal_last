-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 06, 2012 at 10:49 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jpoil_legalmac`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising_campaign`
--

CREATE TABLE IF NOT EXISTS `advertising_campaign` (
  `id` int(10) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `advertising_campaign`
--


-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) NOT NULL auto_increment,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_uk` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_uk` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_uk` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_en` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_ru` varchar(255) collate utf8_unicode_ci NOT NULL,
  `smallcontent_uk` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `content_uk` text collate utf8_unicode_ci NOT NULL,
  `uri` varchar(512) collate utf8_unicode_ci NOT NULL,
  `user_uri` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `date` int(11) NOT NULL default '0',
  `picture` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `thumb` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `protected` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name_ru`, `name_en`, `name_uk`, `title_ru`, `title_en`, `title_uk`, `keywords_ru`, `keywords_en`, `keywords_uk`, `description_ru`, `description_en`, `description_uk`, `smallcontent_en`, `smallcontent_ru`, `smallcontent_uk`, `content_ru`, `content_en`, `content_uk`, `uri`, `user_uri`, `date`, `picture`, `thumb`, `enable`, `protected`) VALUES
(1, 'ИСТОРИЯ КОМПАНИИ', 'Текст', 'Текст', '', '', '', '', '', '', '', '', '', '<p>\r\n	&nbsp;</p>\r\n<div>\r\n	<p>\r\n		Текст&nbsp;Текст&nbsp;Текст&nbsp;Текст &nbsp;Текст&nbsp;Текст&nbsp;Текст</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '<p>\r\n	&nbsp;</p>\r\n<div>\r\n	<p>\r\n		Текст&nbsp;Текст&nbsp;Текст&nbsp;Текст &nbsp;Текст&nbsp;Текст&nbsp;Текст</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	Более 50 лет существует в России бренд &laquo;Детский мир&raquo;. За это время внут сети сформировались традиции, позволившие с успехом пройти через все испытания прошлого века. Сочетание традиций и стремления не отставать от возрастающих требований времени позволило &laquo;Детскому миру&raquo; выйти на</p>\r\n', '<p>\r\n	&nbsp;</p>\r\n<div>\r\n	<p>\r\n		Текст&nbsp;Текст&nbsp;Текст&nbsp;Текст &nbsp;Текст&nbsp;Текст&nbsp;Текст</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', '<p>\r\n	&nbsp;</p>\r\n<div>\r\n	<p>\r\n		Текст&nbsp;Текст&nbsp;Текст&nbsp;Текст &nbsp;Текст&nbsp;Текст&nbsp;Текст</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 'istoriya_kompanii', '', 1327442400, '/img/1f2fefe5d3793f31.jpg', '/img/1f2fefe5d3793f31_small.jpg', 1, 0),
(2, 'ИГРУШКИ МИРОВЫХ БРЕНДОВ', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	О качестве игрушек известных мировых брэндов говорить не приходится - ИМЯ само говорит за себя!</p>\r\n', '', '<p>\r\n	О качестве игрушек известных мировых брэндов говорить не приходится - ИМЯ само говорит за себя! Этим игрушкам доверяют во всем мире: CRAYOLA, KS KIDS, Tiny Love, Rubiks, Heros, Trefl - игрушки этих и других торговых марок - в нашем Магазине мировых брэндовО качестве игрушек известных мировых брэндов</p>\r\n<p>\r\n	О качестве игрушек известных мировых брэндов говорить не приходится - ИМЯ само говорит за себя! Этим игрушкам доверяют во всем мире: CRAYOLA, KS KIDS, Tiny Love, Rubiks, Heros, Trefl - игрушки этих и других торговых марок - в нашем Магазине мировых брэндовО качестве игрушек известных мировых брэндов</p>\r\n<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', '', 'igrushki_mirovyih_brendov', '', 1337266448, '/img/173cdc7c7d50dc76.jpg', '/img/173cdc7c7d50dc76_small.jpg', 1, 0),
(4, 'test 1', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	axsdcf</p>\r\n', '', '<p>\r\n	dwefrgt</p>\r\n', '', '', 'test_1', '', 1339139674, '/img/a4f39e3689d035b3.jpg', '/img/a4f39e3689d035b3_small.jpg', 1, 0),
(8, 'test 3', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	sdwfegrthyj</p>\r\n', '', '<p>\r\n	dfgrthyjui</p>\r\n', '', '', 'test_3', '', 1339487825, '/img/c7cde45163b22f9f.jpg', '/img/c7cde45163b22f9f_small.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `position` int(5) NOT NULL default '0',
  `url` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `html` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `enable` int(1) NOT NULL default '0',
  `protected` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `position`, `url`, `html`, `enable`, `protected`) VALUES
(2, 'Банер', 0, '', '<img src="/img/7fad89e1bc7568c1.jpg" alt="" />', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_brands`
--

CREATE TABLE IF NOT EXISTS `catalog_brands` (
  `id` int(11) NOT NULL auto_increment,
  `name_ru` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `name_en` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(255) NOT NULL default '',
  `picture` varchar(255) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `enable` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `catalog_brands`
--

INSERT INTO `catalog_brands` (`id`, `name_ru`, `name_en`, `name_uk`, `picture`, `thumb`, `enable`) VALUES
(1, 'Kiddieland', '', '', '', '', 1),
(2, 'Bratz', '', '', '', '', 1),
(3, 'Aria', '', '', '', '', 1),
(4, 'Atest', '', '', '', '', 1),
(5, 'Paola Reina', '', '', '', '', 1),
(6, 'Куклы Братц', '', '', '', '', 1),
(7, 'Tiny Love', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_comments`
--

CREATE TABLE IF NOT EXISTS `catalog_comments` (
  `id` int(10) NOT NULL auto_increment,
  `product_id` int(10) NOT NULL default '0',
  `name` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `message` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `date` int(10) NOT NULL default '0',
  `enable` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `catalog_comments`
--

INSERT INTO `catalog_comments` (`id`, `product_id`, `name`, `message`, `date`, `enable`) VALUES
(1, 149, 'Вася Пупкин', 'Удобный и практичный пенал World Champions с наполнением, украшенный оригинальными принтами на спортивную тематику, станет хорошим подарком юному любителю спорта и верным помощником в учебе. Пенал односекционный, с удобной застежкой-молнией. Содержит 18 предметов — практически все, что только может понадобиться школьнику. Все предметы фиксируются на местах креплением на резинке', 1338290928, 1),
(7, 155, 'Ксения ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1339141397, 1),
(8, 155, 'Ксения ', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1339141419, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_gallery`
--

CREATE TABLE IF NOT EXISTS `catalog_gallery` (
  `id` int(10) NOT NULL auto_increment,
  `owner_id` int(10) NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `picture` varchar(255) NOT NULL default '',
  `sort` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `catalog_gallery`
--

INSERT INTO `catalog_gallery` (`id`, `owner_id`, `thumb`, `picture`, `sort`) VALUES
(9, 155, '/img/bf067f914d0f700f_small.jpg', '/img/bf067f914d0f700f.jpg', 2),
(8, 155, '/img/af622ec373e839ca_small.jpg', '/img/af622ec373e839ca.jpg', 1),
(7, 155, '/img/258ea726a6c11809_small.jpg', '/img/258ea726a6c11809.jpg', 0),
(10, 155, '/img/26f499e1f34891cc_small.jpg', '/img/26f499e1f34891cc.jpg', 3),
(11, 155, '/img/a5dfb90a36dabd73_small.jpg', '/img/a5dfb90a36dabd73.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_items`
--

CREATE TABLE IF NOT EXISTS `catalog_items` (
  `id` int(10) NOT NULL auto_increment,
  `parent_id` int(10) NOT NULL,
  `depth` int(5) NOT NULL default '0',
  `sort` int(10) NOT NULL default '0',
  `name_ru` varchar(1024) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `name_en` varchar(1024) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `content_ru` text NOT NULL,
  `picture` varchar(255) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `uri` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `catalog_items`
--

INSERT INTO `catalog_items` (`id`, `parent_id`, `depth`, `sort`, `name_ru`, `name_en`, `name_uk`, `content_ru`, `picture`, `thumb`, `enable`, `uri`) VALUES
(42, 0, 0, 1, 'Игры и игрушки', '', '', '', '', '', 1, ''),
(43, 42, 1, 2, 'Идем купаться!', '', '', '', '', '', 1, ''),
(44, 42, 1, 3, 'Велосипеды', '', '', '', '', '', 1, ''),
(45, 42, 1, 4, 'Ролики', '', '', '', '', '', 1, ''),
(47, 45, 2, 5, 'Идем купаться!', '', '', '', '', '', 1, ''),
(48, 42, 1, 8, 'Велосипеды', '', '', '', '', '', 1, ''),
(49, 42, 1, 9, 'Ролики', '', '', '', '', '', 1, ''),
(50, 42, 1, 10, 'Самокаты', '', '', '', '', '', 1, ''),
(51, 42, 1, 11, 'Домики, качели, горки', '', '', '', '', '', 1, ''),
(52, 42, 1, 12, 'Спортивные игры', '', '', '', '', '', 1, ''),
(53, 0, 0, 13, 'Lego', '', '', '', '', '', 1, ''),
(54, 0, 0, 14, 'Спорт и отдых', '', '', '', '', '', 1, ''),
(55, 0, 0, 15, 'Кормление и гигиена', '', '', '', '', '', 1, ''),
(56, 0, 0, 16, 'Безопасность', '', '', '', '', '', 1, ''),
(57, 0, 0, 17, 'Хобби и творчество', '', '', '', '', '', 1, ''),
(58, 0, 0, 18, 'Малышам', '', '', '', '', '', 1, ''),
(59, 0, 0, 19, 'Игры на улице', '', '', '', '', '', 1, ''),
(60, 0, 0, 20, 'Интерьер', '', '', '', '', '', 1, ''),
(61, 0, 0, 21, 'Школа', '', '', '', '', '', 1, ''),
(62, 45, 2, 6, 'test 1', '', '', '<p>\r\n	test</p>\r\n', '', '', 1, ''),
(63, 42, 1, 7, 'test 2', '', '', '<p>\r\n	test</p>\r\n', '', '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_notify`
--

CREATE TABLE IF NOT EXISTS `catalog_notify` (
  `id` int(10) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `product_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `catalog_notify`
--

INSERT INTO `catalog_notify` (`id`, `email`, `product_id`) VALUES
(2, 'doom4eg@gmail.com', 160),
(3, 'oksana@gvstudio.com.ua', 158);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_orders`
--

CREATE TABLE IF NOT EXISTS `catalog_orders` (
  `id` int(10) NOT NULL auto_increment,
  `date` int(10) NOT NULL default '0',
  `user_id` int(10) NOT NULL default '0',
  `info` text collate utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_orders`
--

INSERT INTO `catalog_orders` (`id`, `date`, `user_id`, `info`, `status`) VALUES
(3, 1338989727, 0, '<h4>ИНФОРМАЦИЯ О ЗАКАЗЕ</h4>\n                <dl>\n                    <dt>Имя:</dt>\n                    <dd>Васьок</dd>\n                    <dt>Контактный телефон:</dt>\n                    <dd>1239021038</dd>\n                    <dt>Контактный email:</dt>\n                    <dd>doom4eg@gmail.com</dd>\n                    <dt>Доставить по адресу:</dt>\n                    <dd>asdasda</dd>\n                    <dt>Желаемое время доставки:</dt>\n                    <dd>20:20</dd>\n                    <dt>Способ оплаты:</dt>\n                    <dd>Наличный расчёт</dd>\n                    <dt>Способ доставки:</dt>\n                    <dd>Курьером</dd>\n                    <dt>Примечание:</dt>\n                    <dd>aaaaaaaaaaaaaaaa</dd>', 0),
(2, 1338989286, 0, '<h4>ИНФОРМАЦИЯ О ЗАКАЗЕ</h4>\n                <dl>\n                    <dt>Имя:</dt>\n                    <dd>Вася</dd>\n                    <dt>Контактный телефон:</dt>\n                    <dd>0953659318</dd>\n                    <dt>Контактный email:</dt>\n                    <dd>doom4eg@gmail.com</dd>\n                    <dt>Доставить по адресу:</dt>\n                    <dd>sadasdasda</dd>\n                    <dt>Желаемое время доставки:</dt>\n                    <dd>20:00</dd>\n                    <dt>Способ оплаты:</dt>\n                    <dd>Наличный расчёт</dd>\n                    <dt>Способ доставки:</dt>\n                    <dd>Самовывоз</dd>\n                    <dt>Примечание:</dt>\n                    <dd>wsdasdsadas</dd>', 0),
(4, 1339140908, 0, '<h4>\r\n	ИНФОРМАЦИЯ О ЗАКАЗЕ</h4>\r\n<dl>\r\n	<dt>\r\n		Имя:</dt>\r\n	<dd>\r\n		reflection</dd>\r\n	<dt>\r\n		Контактный телефон:</dt>\r\n	<dd>\r\n		12345678</dd>\r\n	<dt>\r\n		Контактный email:</dt>\r\n	<dd>\r\n		def</dd>\r\n	<dt>\r\n		Доставить по адресу:</dt>\r\n	<dd>\r\n		wsedrty</dd>\r\n	<dt>\r\n		Желаемое время доставки:</dt>\r\n	<dd>\r\n		sdrftgh</dd>\r\n	<dt>\r\n		Способ оплаты:</dt>\r\n	<dd>\r\n		Наличный расчёт</dd>\r\n	<dt>\r\n		Способ доставки:</dt>\r\n	<dd>\r\n		Самовывоз</dd>\r\n	<dt>\r\n		Примечание:</dt>\r\n	<dd>\r\n		sdfrtgyhu</dd>\r\n</dl>\r\n', 1),
(5, 1339158231, 0, '<h4>ИНФОРМАЦИЯ О ЗАКАЗЕ</h4>\n                <dl>\n                    <dt>Имя:</dt>\n                    <dd>fdljvgkhn</dd>\n                    <dt>Контактный телефон:</dt>\n                    <dd>safdlkj</dd>\n                    <dt>Контактный email:</dt>\n                    <dd>aslkdjfhb</dd>\n                    <dt>Доставить по адресу:</dt>\n                    <dd></dd>\n                    <dt>Желаемое время доставки:</dt>\n                    <dd></dd>\n                    <dt>Способ оплаты:</dt>\n                    <dd>Наличный расчёт</dd>\n                    <dt>Способ доставки:</dt>\n                    <dd>Курьером</dd>\n                    <dt>Примечание:</dt>\n                    <dd></dd>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_orders_products`
--

CREATE TABLE IF NOT EXISTS `catalog_orders_products` (
  `id` int(10) NOT NULL auto_increment,
  `order_id` int(10) NOT NULL default '0',
  `product_id` int(10) NOT NULL default '0',
  `count` int(5) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `catalog_orders_products`
--

INSERT INTO `catalog_orders_products` (`id`, `order_id`, `product_id`, `count`) VALUES
(1, 1, 148, 5),
(3, 2, 149, 1),
(4, 2, 153, 20),
(5, 3, 149, 1),
(6, 3, 151, 1),
(7, 4, 157, 2),
(8, 5, 162, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_products`
--

CREATE TABLE IF NOT EXISTS `catalog_products` (
  `id` int(10) NOT NULL auto_increment,
  `catalog_id` int(10) NOT NULL,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_uk` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_uk` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_uk` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_en` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_ru` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL default '0',
  `price` float NOT NULL default '0',
  `articul` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `picture` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `thumb` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `order` int(1) NOT NULL,
  `gallery` text collate utf8_unicode_ci NOT NULL,
  `brand_id` int(4) NOT NULL default '0',
  `action` int(1) NOT NULL default '0',
  `popular` int(1) NOT NULL default '0',
  `new` int(1) NOT NULL default '0',
  `protected` int(1) NOT NULL default '0',
  `exist` tinyint(4) NOT NULL default '0',
  `showmain` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=164 ;

--
-- Dumping data for table `catalog_products`
--

INSERT INTO `catalog_products` (`id`, `catalog_id`, `name_ru`, `name_en`, `name_uk`, `title_ru`, `title_en`, `title_uk`, `keywords_ru`, `keywords_en`, `keywords_uk`, `description_ru`, `description_en`, `description_uk`, `smallcontent_en`, `smallcontent_ru`, `content_ru`, `content_en`, `date`, `price`, `articul`, `picture`, `thumb`, `enable`, `order`, `gallery`, `brand_id`, `action`, `popular`, `new`, `protected`, `exist`, `showmain`) VALUES
(155, 43, 'test 1', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 200.3, '1234567', '/img/1b5ba63e2cff1d6a.jpg', '/img/1b5ba63e2cff1d6a_small.jpg', 1, 0, '', 1, 1, 0, 0, 0, 1, 0),
(156, 43, 'test', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s,&nbsp;</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 56, '145', '/img/2485a52335657add.jpg', '/img/2485a52335657add_small.jpg', 1, 0, '', 1, 0, 1, 0, 0, 0, 0),
(157, 43, 'test 4', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 350, '12456', '/img/1382008e925c8fa4.jpg', '/img/1382008e925c8fa4_small.jpg', 1, 0, '', 2, 0, 0, 1, 0, 1, 1),
(158, 43, 'test 2', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 32, '123', '/img/0f9888fbc69fd197.jpg', '/img/0f9888fbc69fd197_small.jpg', 1, 0, '', 1, 0, 1, 0, 0, 1, 0),
(159, 43, 'test5', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 600, '1234567', '/img/8f0704473855a191.jpg', '/img/8f0704473855a191_small.jpg', 1, 0, '', 3, 0, 0, 0, 0, 1, 1),
(160, 43, 'test 3', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 21, '1567', '/img/f1b914f48f28060f.jpg', '/img/f1b914f48f28060f_small.jpg', 1, 0, '', 2, 1, 0, 0, 0, 0, 1),
(161, 43, 'test6', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 280, '1234567', '/img/54ac98763ffc60c4.jpg', '/img/54ac98763ffc60c4_small.jpg', 1, 0, '', 4, 0, 0, 1, 0, 0, 1),
(162, 43, 'test 7', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', 0, 500, '5678', '/img/dc0a3e4cd60faa4e.jpg', '/img/dc0a3e4cd60faa4e_small.jpg', 1, 0, '', 4, 0, 0, 1, 0, 1, 1),
(163, 43, 'test 8', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 355, '234567', '', '', 1, 0, '', 4, 1, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_similar`
--

CREATE TABLE IF NOT EXISTS `catalog_similar` (
  `id` int(11) NOT NULL auto_increment,
  `owner_id` int(11) NOT NULL default '0',
  `similar` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `catalog_similar`
--

INSERT INTO `catalog_similar` (`id`, `owner_id`, `similar`) VALUES
(51, 149, 150),
(52, 149, 151),
(53, 149, 152),
(66, 155, 155),
(67, 155, 157),
(68, 155, 160),
(69, 155, 162);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL auto_increment,
  `name` text collate utf8_unicode_ci NOT NULL,
  `district` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1111 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `district`) VALUES
(2, 'Абаза', 'Хакасия'),
(3, 'Абакан', 'Хакасия'),
(4, 'Абдулино', 'Оренбургская область'),
(5, 'Абинск', 'Краснодарский край'),
(6, 'Агидель', 'Башкортостан'),
(7, 'Агрыз', 'Татарстан'),
(8, 'Адыгейск', 'Адыгея'),
(9, 'Азнакаево', 'Татарстан'),
(10, 'Азов', 'Ростовская область'),
(11, 'Ак-Довурак', 'Тува'),
(12, 'Аксай', 'Ростовская область'),
(13, 'Алагир', 'Северная Осетия'),
(14, 'Алапаевск', 'Свердловская область'),
(15, 'Алатырь', 'Чувашия'),
(16, 'Алдан', 'Якутия'),
(17, 'Алейск', 'Алтайский край'),
(18, 'Александров', 'Владимирская область'),
(19, 'Александровск', 'Пермский край'),
(20, 'Александровск-Сахалинский', 'Сахалинская область'),
(21, 'Алексеевка', 'Белгородская область'),
(22, 'Алексин', 'Тульская область'),
(23, 'Алзамай', 'Иркутская область'),
(24, 'Альметьевск', 'Татарстан'),
(25, 'Амурск', 'Хабаровский край'),
(26, 'Анадырь', 'Чукотский автономный округ'),
(27, 'Анапа', 'Краснодарский край'),
(28, 'Ангарск', 'Иркутская область'),
(29, 'Андреаполь', 'Тверская область'),
(30, 'Анжеро-Судженск', 'Кемеровская область'),
(31, 'Анива', 'Сахалинская область'),
(32, 'Апатиты', 'Мурманская область'),
(33, 'Апрелевка', 'Московская область'),
(34, 'Апшеронск', 'Краснодарский край'),
(35, 'Арамиль', 'Свердловская область'),
(36, 'Аргун', 'Чечня'),
(37, 'Ардатов', 'Мордовия'),
(38, 'Ардон', 'Северная Осетия'),
(39, 'Арзамас', 'Нижегородская область'),
(40, 'Аркадак', 'Саратовская область'),
(41, 'Армавир', 'Краснодарский край'),
(42, 'Арсеньев', 'Приморский край'),
(43, 'Арск', 'Татарстан'),
(44, 'Артём', 'Приморский край'),
(45, 'Артёмовск', 'Красноярский край'),
(46, 'Артёмовский', 'Свердловская область'),
(47, 'Архангельск', 'Архангельская область'),
(48, 'Асбест', 'Свердловская область'),
(49, 'Асино', 'Томская область'),
(50, 'Астрахань', 'Астраханская область'),
(51, 'Аткарск', 'Саратовская область'),
(52, 'Ахтубинск', 'Астраханская область'),
(53, 'Ачинск', 'Красноярский край'),
(54, 'Аша', 'Челябинская область'),
(55, 'Бабаево', 'Вологодская область'),
(56, 'Бабушкин', 'Бурятия'),
(57, 'Бавлы', 'Татарстан'),
(58, 'Багратионовск', 'Калининградская область'),
(59, 'Байкальск', 'Иркутская область'),
(60, 'Баймак', 'Башкортостан'),
(61, 'Бакал', 'Челябинская область'),
(62, 'Баксан', 'Кабардино-Балкария'),
(63, 'Балабаново', 'Калужская область'),
(64, 'Балаково', 'Саратовская область'),
(65, 'Балахна', 'Нижегородская область'),
(66, 'Балашиха', 'Московская область'),
(67, 'Балашов', 'Саратовская область'),
(68, 'Балей', 'Читинская область'),
(69, 'Балтийск', 'Калининградская область'),
(70, 'Барабинск', 'Новосибирская область'),
(71, 'Барнаул', 'Алтайский край'),
(72, 'Барыш', 'Ульяновская область'),
(73, 'Батайск', 'Ростовская область'),
(74, 'Бежецк', 'Тверская область'),
(75, 'Белая Калитва', 'Ростовская область'),
(76, 'Белая Холуница', 'Кировская область'),
(77, 'Белгород', 'Белгородская область'),
(78, 'Белебей', 'Башкортостан'),
(79, 'Белёв', 'Тульская область'),
(80, 'Белинский', 'Пензенская область'),
(81, 'Белово', 'Кемеровская область'),
(82, 'Белогорск', 'Амурская область'),
(83, 'Белозерск', 'Вологодская область'),
(84, 'Белокуриха', 'Алтайский край'),
(85, 'Беломорск', 'Карелия'),
(86, 'Белорецк', 'Башкортостан'),
(87, 'Белореченск', 'Краснодарский край'),
(88, 'Белоусово', 'Калужская область'),
(89, 'Белоярский', 'Ханты-Мансийский автономный округ'),
(90, 'Белый', 'Тверская область'),
(91, 'Бердск', 'Новосибирская область'),
(92, 'Березники', 'Пермский край'),
(93, 'Берёзовский', 'Кемеровская область'),
(94, 'Берёзовский', 'Свердловская область'),
(95, 'Беслан', 'Северная Осетия'),
(96, 'Бийск', 'Алтайский край'),
(97, 'Бикин', 'Хабаровский край'),
(98, 'Билибино', 'Чукотский автономный округ'),
(99, 'Биробиджан', 'Еврейская автономная область'),
(100, 'Бирск', 'Башкортостан'),
(101, 'Бирюсинск', 'Иркутская область'),
(102, 'Бирюч', 'Белгородская область'),
(103, 'Благовещенск', 'Амурская область'),
(104, 'Благовещенск', 'Башкортостан'),
(105, 'Благодарный', 'Ставропольский край'),
(106, 'Бобров', 'Воронежская область'),
(107, 'Богданович', 'Свердловская область'),
(108, 'Богородицк', 'Тульская область'),
(109, 'Богородск', 'Нижегородская область'),
(110, 'Боготол', 'Красноярский край'),
(111, 'Богучар', 'Воронежская область'),
(112, 'Бодайбо', 'Иркутская область'),
(113, 'Бокситогорск', 'Ленинградская область'),
(114, 'Болгар', 'Татарстан'),
(115, 'Бологое', 'Тверская область'),
(116, 'Болотное', 'Новосибирская область'),
(117, 'Болохово', 'Тульская область'),
(118, 'Болхов', 'Орловская область'),
(119, 'Большой Камень', 'Приморский край'),
(120, 'Бор', 'Нижегородская область'),
(121, 'Борзя', 'Читинская область'),
(122, 'Борисоглебск', 'Воронежская область'),
(123, 'Боровичи', 'Новгородская область'),
(124, 'Боровск', 'Калужская область'),
(125, 'Бородино', 'Красноярский край'),
(126, 'Братск', 'Иркутская область'),
(127, 'Бронницы', 'Московская область'),
(128, 'Брянск', 'Брянская область'),
(129, 'Бугульма', 'Татарстан'),
(130, 'Бугуруслан', 'Оренбургская область'),
(131, 'Будённовск', 'Ставропольский край'),
(132, 'Бузулук', 'Оренбургская область'),
(133, 'Буинск', 'Татарстан'),
(134, 'Буй', 'Костромская область'),
(135, 'Буйнакск', 'Дагестан'),
(136, 'Бутурлиновка', 'Воронежская область'),
(137, 'Валдай', 'Новгородская область'),
(138, 'Валуйки', 'Белгородская область'),
(139, 'Велиж', 'Смоленская область'),
(140, 'Великие Луки', 'Псковская область'),
(141, 'Великий Новгород', 'Новгородская область'),
(142, 'Великий Устюг', 'Вологодская область'),
(143, 'Вельск', 'Архангельская область'),
(144, 'Венёв', 'Тульская область'),
(145, 'Верещагино', 'Пермский край'),
(146, 'Верея', 'Московская область'),
(147, 'Верхнеуральск', 'Челябинская область'),
(148, 'Верхний Тагил', 'Свердловская область'),
(149, 'Верхний Уфалей', 'Челябинская область'),
(150, 'Верхняя Пышма', 'Свердловская область'),
(151, 'Верхняя Салда', 'Свердловская область'),
(152, 'Верхняя Тура', 'Свердловская область'),
(153, 'Верхотурье', 'Свердловская область'),
(154, 'Верхоянск', 'Якутия'),
(155, 'Весьегонск', 'Тверская область'),
(156, 'Ветлуга', 'Нижегородская область'),
(157, 'Видное', 'Московская область'),
(158, 'Вилюйск', 'Якутия'),
(159, 'Вилючинск', 'Камчатский край'),
(160, 'Вихоревка', 'Иркутская область'),
(161, 'Вичуга', 'Ивановская область'),
(162, 'Владивосток', 'Приморский край'),
(163, 'Владикавказ', 'Северная Осетия'),
(164, 'Владимир', 'Владимирская область'),
(165, 'Волгоград', 'Волгоградская область'),
(166, 'Волгодонск', 'Ростовская область'),
(167, 'Волгореченск', 'Костромская область'),
(168, 'Волжск', 'Марий Эл'),
(169, 'Волжский', 'Волгоградская область'),
(170, 'Вологда', 'Вологодская область'),
(171, 'Володарск', 'Нижегородская область'),
(172, 'Волоколамск', 'Московская область'),
(173, 'Волосово', 'Ленинградская область'),
(174, 'Волхов', 'Ленинградская область'),
(175, 'Волчанск', 'Свердловская область'),
(176, 'Вольск', 'Саратовская область'),
(177, 'Воркута', 'Республика Коми'),
(178, 'Воронеж', 'Воронежская область'),
(179, 'Ворсма', 'Нижегородская область'),
(180, 'Воскресенск', 'Московская область'),
(181, 'Воткинск', 'Удмуртская республика'),
(182, 'Всеволожск', 'Ленинградская область'),
(183, 'Вуктыл', 'Республика Коми'),
(184, 'Выборг', 'Ленинградская область'),
(185, 'Выкса', 'Нижегородская область'),
(186, 'Высоковск', 'Московская область'),
(187, 'Высоцк', 'Ленинградская область'),
(188, 'Вытегра', 'Вологодская область'),
(189, 'Вышний Волочёк', 'Тверская область'),
(190, 'Вяземский', 'Хабаровский край'),
(191, 'Вязники', 'Владимирская область'),
(192, 'Вязьма', 'Смоленская область'),
(193, 'Вятские Поляны', 'Кировская область'),
(194, 'Гаврилов Посад', 'Ивановская область'),
(195, 'Гаврилов-Ям', 'Ярославская область'),
(196, 'Гагарин', 'Смоленская область'),
(197, 'Гаджиево', 'Мурманская область'),
(198, 'Гай', 'Оренбургская область'),
(199, 'Галич', 'Костромская область'),
(200, 'Гатчина', 'Ленинградская область'),
(201, 'Гвардейск', 'Калининградская область'),
(202, 'Гдов', 'Псковская область'),
(203, 'Геленджик', 'Краснодарский край'),
(204, 'Георгиевск', 'Ставропольский край'),
(205, 'Глазов', 'Удмуртия'),
(206, 'Голицыно', 'Московская область'),
(207, 'Горбатов', 'Нижегородская область'),
(208, 'Горно-Алтайск', 'Республика Алтай'),
(209, 'Горнозаводск', 'Пермский край'),
(210, 'Горняк', 'Алтайский край'),
(211, 'Городец', 'Нижегородская область'),
(212, 'Городище', 'Пензенская область'),
(213, 'Городовиковск', 'Калмыкия'),
(214, 'Гороховец', 'Владимирская область'),
(215, 'Горячий Ключ', 'Краснодарский край'),
(216, 'Грайворон', 'Белгородская область'),
(217, 'Гремячинск', 'Пермский край'),
(218, 'Грозный', 'Чечня'),
(219, 'Грязи', 'Липецкая область'),
(220, 'Грязовец', 'Вологодская область'),
(221, 'Губаха', 'Пермский край'),
(222, 'Губкин', 'Белгородская область'),
(223, 'Губкинский', 'Ямало-Ненецкий автономный округ'),
(224, 'Гудермес', 'Чечня'),
(225, 'Гуково', 'Ростовская область'),
(226, 'Гулькевичи', 'Краснодарский край'),
(227, 'Гурьевск', 'Калининградская область'),
(228, 'Гурьевск', 'Кемеровская область'),
(229, 'Гусев', 'Калининградская область'),
(230, 'Гусиноозёрск', 'Бурятия'),
(231, 'Гусь-Хрустальный', 'Владимирская область'),
(232, 'Давлеканово', 'Башкортостан'),
(233, 'Дагестанские Огни', 'Дагестан'),
(234, 'Далматово', 'Курганская область'),
(235, 'Дальнегорск', 'Приморский край'),
(236, 'Дальнереченск', 'Приморский край'),
(237, 'Данилов', 'Ярославская область'),
(238, 'Данков', 'Липецкая область'),
(239, 'Дегтярск', 'Свердловская область'),
(240, 'Дедовск', 'Московская область'),
(241, 'Демидов', 'Смоленская область'),
(242, 'Дербент', 'Дагестан'),
(243, 'Десногорск', 'Смоленская область'),
(244, 'Дзержинск', 'Нижегородская область'),
(245, 'Дзержинский', 'Московская область'),
(246, 'Дивногорск', 'Красноярский край'),
(247, 'Дигора', 'Северная Осетия'),
(248, 'Димитровград', 'Ульяновская область'),
(249, 'Дмитриев-Льговский', 'Курская область'),
(250, 'Дмитров', 'Московская область'),
(251, 'Дмитровск', 'Орловская область'),
(252, 'Дно', 'Псковская область'),
(253, 'Добрянка', 'Пермский край'),
(254, 'Долгопрудный', 'Московская область'),
(255, 'Долинск', 'Сахалинская область'),
(256, 'Домодедово', 'Московская область'),
(257, 'Донецк', 'Ростовская область'),
(258, 'Донской', 'Тульская область'),
(259, 'Дорогобуж', 'Смоленская область'),
(260, 'Дрезна', 'Московская область'),
(261, 'Дубна', 'Московская область'),
(262, 'Дубовка', 'Волгоградская область'),
(263, 'Дудинка', 'Красноярский край'),
(264, 'Духовщина', 'Смоленская область'),
(265, 'Дюртюли', 'Башкортостан'),
(266, 'Дятьково', 'Брянская область'),
(267, 'Егорьевск', 'Московская область'),
(268, 'Ейск', 'Краснодарский край'),
(269, 'Екатеринбург', 'Свердловская область'),
(270, 'Елабуга', 'Татарстан'),
(271, 'Елец', 'Липецкая область'),
(272, 'Елизово', 'Камчатский край'),
(273, 'Ельня', 'Смоленская область'),
(274, 'Еманжелинск', 'Челябинская область'),
(275, 'Емва', 'Коми'),
(276, 'Енисейск', 'Красноярский край'),
(277, 'Ершов', 'Саратовская область'),
(278, 'Ессентуки', 'Ставропольский край'),
(279, 'Ефремов', 'Тульская область'),
(280, 'Железноводск', 'Ставропольский край'),
(281, 'Железногорск', 'Красноярский край'),
(282, 'Железногорск', 'Курская область'),
(283, 'Железногорск-Илимский', 'Иркутская область'),
(284, 'Железнодорожный', 'Московская область'),
(285, 'Жердевка', 'Тамбовская область'),
(286, 'Жигулёвск', 'Самарская область'),
(287, 'Жиздра', 'Калужская область'),
(288, 'Жирновск', 'Волгоградская область'),
(289, 'Жуков', 'Калужская область'),
(290, 'Жуковка', 'Брянская область'),
(291, 'Жуковский', 'Московская область'),
(292, 'Завитинск', 'Амурская область'),
(293, 'Заводоуковск', 'Тюменская область'),
(294, 'Заволжск', 'Ивановская область'),
(295, 'Заволжье', 'Нижегородская область'),
(296, 'Задонск', 'Липецкая область'),
(297, 'Заинск', 'Татарстан'),
(298, 'Закаменск', 'Бурятия'),
(299, 'Заозёрный', 'Красноярский край'),
(300, 'Заозёрск', 'Мурманская область'),
(301, 'Западная Двина', 'Тверская область'),
(302, 'Заполярный', 'Мурманская область'),
(303, 'Зарайск', 'Московская область'),
(304, 'Заречный', 'Пензенская область'),
(305, 'Заречный', 'Свердловская область'),
(306, 'Заринск', 'Алтайский край'),
(307, 'Звенигово', 'Марий Эл'),
(308, 'Звенигород', 'Московская область'),
(309, 'Зверево', 'Ростовская область'),
(310, 'Зеленогорск', 'Красноярский край'),
(311, 'Зеленогорск', 'Санкт-Петербург'),
(312, 'Зеленоград', 'Москва'),
(313, 'Зеленоградск', 'Калининградская область'),
(314, 'Зеленодольск', 'Татарстан'),
(315, 'Зеленокумск', 'Ставропольский край'),
(316, 'Зерноград', 'Ростовская область'),
(317, 'Зея', 'Амурская область'),
(318, 'Зима', 'Иркутская область'),
(319, 'Златоуст', 'Челябинская область'),
(320, 'Злынка', 'Брянская область'),
(321, 'Змеиногорск', 'Алтайский край'),
(322, 'Знаменск', 'Астраханская область'),
(323, 'Зубцов', 'Тверская область'),
(324, 'Зуевка', 'Кировская область'),
(325, 'Ивангород', 'Ленинградская область'),
(326, 'Иваново', 'Ивановская область'),
(327, 'Ивантеевка', 'Московская область'),
(328, 'Ивдель', 'Свердловская область'),
(329, 'Игарка', 'Красноярский край'),
(330, 'Ижевск', 'Удмуртия'),
(331, 'Избербаш', 'Дагестан'),
(332, 'Изобильный', 'Ставропольский край'),
(333, 'Иланский', 'Красноярский край'),
(334, 'Инза', 'Ульяновская область'),
(335, 'Инсар', 'Мордовия'),
(336, 'Инта', 'Республика Коми'),
(337, 'Ипатово', 'Ставропольский край'),
(338, 'Ирбит', 'Свердловская область'),
(339, 'Иркутск', 'Иркутская область'),
(340, 'Исилькуль', 'Омская область'),
(341, 'Искитим', 'Новосибирская область'),
(342, 'Истра', 'Московская область'),
(343, 'Ишим', 'Тюменская область'),
(344, 'Ишимбай', 'Башкортостан'),
(345, 'Йошкар-Ола', 'Марий Эл'),
(346, 'Кадников', 'Вологодская область'),
(347, 'Казань', 'Татарстан'),
(348, 'Калач', 'Воронежская область'),
(349, 'Калач-на-Дону', 'Волгоградская область'),
(350, 'Калачинск', 'Омская область'),
(351, 'Калининград', 'Калининградская область'),
(352, 'Калининск', 'Саратовская область'),
(353, 'Калтан', 'Кемеровская область'),
(354, 'Калуга', 'Калужская область'),
(355, 'Калязин', 'Тверская область'),
(356, 'Камбарка', 'Удмуртия'),
(357, 'Каменка', 'Пензенская область'),
(358, 'Каменногорск', 'Ленинградская область'),
(359, 'Каменск-Уральский', 'Свердловская область'),
(360, 'Каменск-Шахтинский', 'Ростовская область'),
(361, 'Камень-на-Оби', 'Алтайский край'),
(362, 'Камешково', 'Владимирская область'),
(363, 'Камызяк', 'Астраханская область'),
(364, 'Камышин', 'Волгоградская область'),
(365, 'Камышлов', 'Свердловская область'),
(366, 'Канаш', 'Чувашия'),
(367, 'Кандалакша', 'Мурманская область'),
(368, 'Канск', 'Красноярский край'),
(369, 'Карабаново', 'Владимирская область'),
(370, 'Карабаш', 'Челябинская область'),
(371, 'Карабулак', 'Ингушетия'),
(372, 'Карасук', 'Новосибирская область'),
(373, 'Карачаевск', 'Карачаево-Черкесия'),
(374, 'Карачев', 'Брянская область'),
(375, 'Каргат', 'Новосибирская область'),
(376, 'Каргополь', 'Архангельская область'),
(377, 'Карпинск', 'Свердловская область'),
(378, 'Карталы', 'Челябинская область'),
(379, 'Касимов', 'Рязанская область'),
(380, 'Касли', 'Челябинская область'),
(381, 'Каспийск', 'Дагестан'),
(382, 'Катав-Ивановск', 'Челябинская область'),
(383, 'Катайск', 'Курганская область'),
(384, 'Качканар', 'Свердловская область'),
(385, 'Кашин', 'Тверская область'),
(386, 'Кашира', 'Московская область'),
(387, 'Кедровый', 'Томская область'),
(388, 'Кемерово', 'Кемеровская область'),
(389, 'Кемь', 'Карелия'),
(390, 'Кизел', 'Пермский край'),
(391, 'Кизилюрт', 'Дагестан'),
(392, 'Кизляр', 'Дагестан'),
(393, 'Кимовск', 'Тульская область'),
(394, 'Кимры', 'Тверская область'),
(395, 'Кингисепп', 'Ленинградская область'),
(396, 'Кинель', 'Самарская область'),
(397, 'Кинешма', 'Ивановская область'),
(398, 'Киреевск', 'Тульская область'),
(399, 'Киренск', 'Иркутская область'),
(400, 'Киржач', 'Владимирская область'),
(401, 'Кириллов', 'Вологодская область'),
(402, 'Кириши', 'Ленинградская область'),
(403, 'Киров', 'Калужская область'),
(404, 'Киров', 'Кировская область'),
(405, 'Кировград', 'Свердловская область'),
(406, 'Кирово-Чепецк', 'Кировская область'),
(407, 'Кировск', 'Ленинградская область'),
(408, 'Кировск', 'Мурманская область'),
(409, 'Кирс', 'Кировская область'),
(410, 'Кирсанов', 'Тамбовская область'),
(411, 'Киселёвск', 'Кемеровская область'),
(412, 'Кисловодск', 'Ставропольский край'),
(413, 'Климовск', 'Московская область'),
(414, 'Клин', 'Московская область'),
(415, 'Клинцы', 'Брянская область'),
(416, 'Княгинино', 'Нижегородская область'),
(417, 'Ковдор', 'Мурманская область'),
(418, 'Ковров', 'Владимирская область'),
(419, 'Ковылкино', 'Мордовия'),
(420, 'Когалым', 'Ханты-Мансийский автономный округ'),
(421, 'Кодинск', 'Красноярский край'),
(422, 'Козельск', 'Калужская область'),
(423, 'Козловка', 'Чувашия'),
(424, 'Козьмодемьянск', 'Марий Эл'),
(425, 'Кола', 'Мурманская область'),
(426, 'Кологрив', 'Костромская область'),
(427, 'Коломна', 'Московская область'),
(428, 'Колпашево', 'Томская область'),
(429, 'Колпино', 'Санкт-Петербург'),
(430, 'Кольчугино', 'Владимирская область'),
(431, 'Коммунар', 'Ленинградская область'),
(432, 'Комсомольск', 'Ивановская область'),
(433, 'Комсомольск-на-Амуре', 'Хабаровский край'),
(434, 'Конаково', 'Тверская область'),
(435, 'Кондопога', 'Карелия'),
(436, 'Кондрово', 'Калужская область'),
(437, 'Константиновск', 'Ростовская область'),
(438, 'Копейск', 'Челябинская область'),
(439, 'Кораблино', 'Рязанская область'),
(440, 'Кореновск', 'Краснодарский край'),
(441, 'Коркино', 'Челябинская область'),
(442, 'Королёв', 'Московская область'),
(443, 'Короча', 'Белгородская область'),
(444, 'Корсаков', 'Сахалинская область'),
(445, 'Коряжма', 'Архангельская область'),
(446, 'Костерёво', 'Владимирская область'),
(447, 'Костомукша', 'Карелия'),
(448, 'Кострома', 'Костромская область'),
(449, 'Котельники', 'Московская область'),
(450, 'Котельниково', 'Волгоградская область'),
(451, 'Котельнич', 'Кировская область'),
(452, 'Котлас', 'Архангельская область'),
(453, 'Котово', 'Волгоградская область'),
(454, 'Котовск', 'Тамбовская область'),
(455, 'Кохма', 'Ивановская область'),
(456, 'Красавино', 'Вологодская область'),
(457, 'Красноармейск', 'Московская область'),
(458, 'Красноармейск', 'Саратовская область'),
(459, 'Красновишерск', 'Пермский край'),
(460, 'Красногорск', 'Московская область'),
(461, 'Краснодар', 'Краснодарский край'),
(462, 'Краснозаводск', 'Московская область'),
(463, 'Краснознаменск', 'Калининградская область'),
(464, 'Краснознаменск', 'Московская область'),
(465, 'Краснокаменск', 'Читинская область'),
(466, 'Краснокамск', 'Пермский край'),
(467, 'Краснослободск', 'Волгоградская область'),
(468, 'Краснослободск', 'Мордовия'),
(469, 'Краснотурьинск', 'Свердловская область'),
(470, 'Красноуральск', 'Свердловская область'),
(471, 'Красноуфимск', 'Свердловская область'),
(472, 'Красноярск', 'Красноярский край'),
(473, 'Красный Кут', 'Саратовская область'),
(474, 'Красный Сулин', 'Ростовская область'),
(475, 'Красный Холм', 'Тверская область'),
(476, 'Кремёнки', 'Калужская область'),
(477, 'Кронштадт', 'Санкт-Петербург'),
(478, 'Кропоткин', 'Краснодарский край'),
(479, 'Крымск', 'Краснодарский край'),
(480, 'Кстово', 'Нижегородская область'),
(481, 'Кубинка', 'Московская область'),
(482, 'Кувандык', 'Оренбургская область'),
(483, 'Кувшиново', 'Тверская область'),
(484, 'Кудымкар', 'Пермский край'),
(485, 'Кузнецк', 'Пензенская область'),
(486, 'Куйбышев', 'Новосибирская область'),
(487, 'Кулебаки', 'Нижегородская область'),
(488, 'Кумертау', 'Башкортостан'),
(489, 'Кунгур', 'Пермский край'),
(490, 'Купино', 'Новосибирская область'),
(491, 'Курган', 'Курганская область'),
(492, 'Курганинск', 'Краснодарский край'),
(493, 'Курильск', 'Сахалинская область'),
(494, 'Курлово', 'Владимирская область'),
(495, 'Куровское', 'Московская область'),
(496, 'Курск', 'Курская область'),
(497, 'Куртамыш', 'Курганская область'),
(498, 'Курчатов', 'Курская область'),
(499, 'Куса', 'Челябинская область'),
(500, 'Кушва', 'Свердловская область'),
(501, 'Кызыл', 'Тува'),
(502, 'Кыштым', 'Челябинская область'),
(503, 'Кяхта', 'Бурятия'),
(504, 'Лабинск', 'Краснодарский край'),
(505, 'Лабытнанги', 'Ямало-Ненецкий автономный округ'),
(506, 'Лагань', 'Калмыкия'),
(507, 'Ладушкин', 'Калининградская область'),
(508, 'Лаишево', 'Татарстан'),
(509, 'Лакинск', 'Владимирская область'),
(510, 'Лангепас', 'Ханты-Мансийский автономный округ'),
(511, 'Лахденпохья', 'Карелия'),
(512, 'Лебедянь', 'Липецкая область'),
(513, 'Лениногорск', 'Татарстан'),
(514, 'Ленинск', 'Волгоградская область'),
(515, 'Ленинск-Кузнецкий', 'Кемеровская область'),
(516, 'Ленск', 'Якутия'),
(517, 'Лермонтов', 'Ставропольский край'),
(518, 'Лесной', 'Свердловская область'),
(519, 'Лесозаводск', 'Приморский край'),
(520, 'Лесосибирск', 'Красноярский край'),
(521, 'Ливны', 'Орловская область'),
(522, 'Ликино-Дулёво', 'Московская область'),
(523, 'Липецк', 'Липецкая область'),
(524, 'Липки', 'Тульская область'),
(525, 'Лиски', 'Воронежская область'),
(526, 'Лихославль', 'Тверская область'),
(527, 'Лобня', 'Московская область'),
(528, 'Лодейное Поле', 'Ленинградская область'),
(529, 'Ломоносов', 'Город Санкт-Петербург'),
(530, 'Лосино-Петровский', 'Московская область'),
(531, 'Луга', 'Ленинградская область'),
(532, 'Луза', 'Кировская область'),
(533, 'Лукоянов', 'Нижегородская область'),
(534, 'Луховицы', 'Московская область'),
(535, 'Лысково', 'Нижегородская область'),
(536, 'Лысьва', 'Пермский край'),
(537, 'Лыткарино', 'Московская область'),
(538, 'Льгов', 'Курская область'),
(539, 'Любань', 'Ленинградская область'),
(540, 'Люберцы', 'Московская область'),
(541, 'Любим', 'Ярославская область'),
(542, 'Людиново', 'Калужская область'),
(543, 'Лянтор', 'Ханты-Мансийский автономный округ'),
(544, 'Магадан', 'Магаданская область'),
(545, 'Магас', 'Ингушетия'),
(546, 'Магнитогорск', 'Челябинская область'),
(547, 'Майкоп', 'Адыгея'),
(548, 'Майский', 'Кабардино-Балкария'),
(549, 'Макаров', 'Сахалинская область'),
(550, 'Макарьев', 'Костромская область'),
(551, 'Макушино', 'Курганская область'),
(552, 'Малая Вишера', 'Новгородская область'),
(553, 'Малгобек', 'Ингушетия'),
(554, 'Малмыж', 'Кировская область'),
(555, 'Малоархангельск', 'Орловская область'),
(556, 'Малоярославец', 'Калужская область'),
(557, 'Мамадыш', 'Татарстан'),
(558, 'Мамоново', 'Калининградская область'),
(559, 'Мантурово', 'Костромская область'),
(560, 'Мариинск', 'Кемеровская область'),
(561, 'Мариинский Посад', 'Чувашия'),
(562, 'Маркс', 'Саратовская область'),
(563, 'Махачкала', 'Дагестан'),
(564, 'Мглин', 'Брянская область'),
(565, 'Мегион', 'Ханты-Мансийский автономный округ - Югра'),
(566, 'Медвежьегорск', 'Карелия'),
(567, 'Медногорск', 'Оренбургская область'),
(568, 'Медынь', 'Калужская область'),
(569, 'Межгорье', 'Башкортостан'),
(570, 'Междуреченск', 'Кемеровская область'),
(571, 'Мезень', 'Архангельская область'),
(572, 'Меленки', 'Владимирская область'),
(573, 'Мелеуз', 'Башкортостан'),
(574, 'Менделеевск', 'Татарстан'),
(575, 'Мензелинск', 'Татарстан'),
(576, 'Мещовск', 'Калужская область'),
(577, 'Миасс', 'Челябинская область'),
(578, 'Микунь', 'Коми'),
(579, 'Миллерово', 'Ростовская область'),
(580, 'Минеральные Воды', 'Ставропольский край'),
(581, 'Минусинск', 'Красноярский край'),
(582, 'Миньяр', 'Челябинская область'),
(583, 'Мирный', 'Архангельская область'),
(584, 'Мирный', 'Якутия'),
(585, 'Михайлов', 'Рязанская область'),
(586, 'Михайловка', 'Волгоградская область'),
(587, 'Михайловск', 'Свердловская область'),
(588, 'Михайловск', 'Ставропольский край'),
(589, 'Мичуринск', 'Тамбовская область'),
(590, 'Могоча', 'Читинская область'),
(591, 'Можайск', 'Московская область'),
(592, 'Можга', 'Удмуртия'),
(593, 'Моздок', 'Северная Осетия'),
(594, 'Мончегорск', 'Мурманская область'),
(595, 'Морозовск', 'Ростовская область'),
(596, 'Моршанск', 'Тамбовская область'),
(597, 'Мосальск', 'Калужская область'),
(598, 'Москва', 'Московская область'),
(599, 'Московский', 'Московская область'),
(600, 'Муравленко', 'Ямало-Ненецкий автономный округ'),
(601, 'Мураши', 'Кировская область'),
(602, 'Мурманск', 'Мурманская область'),
(603, 'Муром', 'Владимирская область'),
(604, 'Мценск', 'Орловская область'),
(605, 'Мыски', 'Кемеровская область'),
(606, 'Мытищи', 'Московская область'),
(607, 'Мышкин', 'Ярославская область'),
(608, 'Набережные Челны', 'Татарстан'),
(609, 'Навашино', 'Нижегородская область'),
(610, 'Наволоки', 'Ивановская область'),
(611, 'Надым', 'Ямало-Ненецкий автономный округ'),
(612, 'Назарово', 'Красноярский край'),
(613, 'Назрань', 'Ингушетия'),
(614, 'Называевск', 'Омская область'),
(615, 'Нальчик', 'Кабардино-Балкария'),
(616, 'Нариманов', 'Астраханская область'),
(617, 'Наро-Фоминск', 'Московская область'),
(618, 'Нарткала', 'Кабардино-Балкария'),
(619, 'Нарьян-Мар', 'Ненецкий автономный округ'),
(620, 'Находка', 'Приморский край'),
(621, 'Невель', 'Псковская область'),
(622, 'Невельск', 'Сахалинская область'),
(623, 'Невинномысск', 'Ставропольский край'),
(624, 'Невьянск', 'Свердловская область'),
(625, 'Нелидово', 'Тверская область'),
(626, 'Неман', 'Калининградская область'),
(627, 'Нерехта', 'Костромская область'),
(628, 'Нерчинск', 'Читинская область'),
(629, 'Нерюнгри', 'Якутия'),
(630, 'Нестеров', 'Калининградская область'),
(631, 'Нефтегорск', 'Самарская область'),
(632, 'Нефтекамск', 'Башкортостан'),
(633, 'Нефтекумск', 'Ставропольский край'),
(634, 'Нефтеюганск', 'Ханты-Мансийский автономный округ - Югра'),
(635, 'Нея', 'Костромская область'),
(636, 'Нижневартовск', 'Ханты-Мансийский автономный округ - Югра'),
(637, 'Нижнекамск', 'Татарстан'),
(638, 'Нижнеудинск', 'Иркутская область'),
(639, 'Нижние Серги', 'Свердловская область'),
(640, 'Нижний Ломов', 'Пензенская область'),
(641, 'Нижний Новгород', 'Нижегородская область'),
(642, 'Нижний Тагил', 'Свердловская область'),
(643, 'Нижняя Салда', 'Свердловская область'),
(644, 'Нижняя Тура', 'Свердловская область'),
(645, 'Николаевск', 'Волгоградская область'),
(646, 'Николаевск-на-Амуре', 'Хабаровский край'),
(647, 'Никольск', 'Вологодская область'),
(648, 'Никольск', 'Пензенская область'),
(649, 'Никольское', 'Ленинградская область'),
(650, 'Новая Ладога', 'Ленинградская область'),
(651, 'Новая Ляля', 'Свердловская область'),
(652, 'Новоалександровск', 'Ставропольский край'),
(653, 'Новоалтайск', 'Алтайский край'),
(654, 'Новоаннинский', 'Волгоградская область'),
(655, 'Нововоронеж', 'Воронежская область'),
(656, 'Новодвинск', 'Архангельская область'),
(657, 'Новозыбков', 'Брянская область'),
(658, 'Новокубанск', 'Краснодарский край'),
(659, 'Новокузнецк', 'Кемеровская область'),
(660, 'Новокуйбышевск', 'Самарская область'),
(661, 'Новомичуринск', 'Рязанская область'),
(662, 'Новомосковск', 'Тульская область'),
(663, 'Новопавловск', 'Ставропольский край'),
(664, 'Новоржев', 'Псковская область'),
(665, 'Новороссийск', 'Краснодарский край'),
(666, 'Новосибирск', 'Новосибирская область'),
(667, 'Новосиль', 'Орловская область'),
(668, 'Новосокольники', 'Псковская область'),
(669, 'Новотроицк', 'Оренбургская область'),
(670, 'Новоузенск', 'Саратовская область'),
(671, 'Новоульяновск', 'Ульяновская область'),
(672, 'Новоуральск', 'Свердловская область'),
(673, 'Новохопёрск', 'Воронежская область'),
(674, 'Новочебоксарск', 'Чувашия'),
(675, 'Новочеркасск', 'Ростовская область'),
(676, 'Новошахтинск', 'Ростовская область'),
(677, 'Новый Оскол', 'Белгородская область'),
(678, 'Новый Уренгой', 'Ямало-Ненецкий автономный округ'),
(679, 'Ногинск', 'Московская область'),
(680, 'Нолинск', 'Кировская область'),
(681, 'Норильск', 'Красноярский край'),
(682, 'Ноябрьск', 'Ямало-Ненецкий автономный округ'),
(683, 'Нурлат', 'Татарстан'),
(684, 'Нытва', 'Пермский край'),
(685, 'Нюрба', 'Якутия'),
(686, 'Нягань', 'Ханты-Мансийский автономный округ - Югра'),
(687, 'Нязепетровск', 'Челябинская область'),
(688, 'Няндома', 'Архангельская область'),
(689, 'Облучье', 'Еврейская автономная область'),
(690, 'Обнинск', 'Калужская область'),
(691, 'Обоянь', 'Курская область'),
(692, 'Обь', 'Новосибирская область'),
(693, 'Одинцово', 'Московская область'),
(694, 'Ожерелье', 'Московская область'),
(695, 'Озёрск', 'Калининградская область'),
(696, 'Озёрск', 'Челябинская область'),
(697, 'Озёры', 'Московская область'),
(698, 'Октябрьск', 'Самарская область'),
(699, 'Октябрьский', 'Башкортостан'),
(700, 'Окуловка', 'Новгородская область'),
(701, 'Олёкминск', 'Якутия'),
(702, 'Оленегорск', 'Мурманская область'),
(703, 'Олонец', 'Карелия'),
(704, 'Омск', 'Омская область'),
(705, 'Омутнинск', 'Кировская область'),
(706, 'Онега', 'Архангельская область'),
(707, 'Опочка', 'Псковская область'),
(708, 'Орёл', 'Орловская область'),
(709, 'Оренбург', 'Оренбургская область'),
(710, 'Орехово-Зуево', 'Московская область'),
(711, 'Орлов', 'Кировская область'),
(712, 'Орск', 'Оренбургская область'),
(713, 'Оса', 'Пермский край'),
(714, 'Осинники', 'Кемеровская область'),
(715, 'Осташков', 'Тверская область'),
(716, 'Остров', 'Псковская область'),
(717, 'Островной', 'Мурманская область'),
(718, 'Острогожск', 'Воронежская область'),
(719, 'Отрадное', 'Ленинградская область'),
(720, 'Отрадный', 'Самарская область'),
(721, 'Оха', 'Сахалинская область'),
(722, 'Оханск', 'Пермский край'),
(723, 'Очёр', 'Пермский край'),
(724, 'Павлово', 'Нижегородская область'),
(725, 'Павловск', 'Воронежская область'),
(726, 'Павловск', 'Санкт-Петербург'),
(727, 'Павловский Посад', 'Московская область'),
(728, 'Палласовка', 'Волгоградская область'),
(729, 'Партизанск', 'Приморский край'),
(730, 'Певек', 'Чукотский автономный округ'),
(731, 'Пенза', 'Пензенская область'),
(732, 'Первомайск', 'Нижегородская область'),
(733, 'Первоуральск', 'Свердловская область'),
(734, 'Перевоз', 'Нижегородская область'),
(735, 'Пересвет', 'Московская область'),
(736, 'Переславль-Залесский', 'Ярославская область'),
(737, 'Пермь', 'Пермский край'),
(738, 'Пестово', 'Новгородская область'),
(739, 'Петергоф', 'Санкт-Петербург'),
(740, 'Петров Вал', 'Волгоградская область'),
(741, 'Петровск', 'Саратовская область'),
(742, 'Петровск-Забайкальский', 'Читинская область'),
(743, 'Петрозаводск', 'Карелия'),
(744, 'Петропавловск-Камчатский', 'Камчатская область'),
(745, 'Петухово', 'Курганская область'),
(746, 'Петушки', 'Владимирская область'),
(747, 'Печора', 'Коми'),
(748, 'Печоры', 'Псковская область'),
(749, 'Пикалёво', 'Ленинградская область'),
(750, 'Пионерский', 'Калининградская область'),
(751, 'Питкяранта', 'Карелия'),
(752, 'Плёс', 'Ивановская область'),
(753, 'Плавск', 'Тульская область'),
(754, 'Пласт', 'Челябинская область'),
(755, 'Поворино', 'Воронежская область'),
(756, 'Подольск', 'Московская область'),
(757, 'Подпорожье', 'Ленинградская область'),
(758, 'Покачи', 'Ханты-Мансийский автономный округ'),
(759, 'Покров', 'Владимирская область'),
(760, 'Покровск', 'Якутия'),
(761, 'Полевской', 'Свердловская область'),
(762, 'Полесск', 'Калининградская область'),
(763, 'Полысаево', 'Кемеровская область'),
(764, 'Полярные Зори', 'Мурманская область'),
(765, 'Полярный', 'Мурманская область'),
(766, 'Поронайск', 'Сахалинская область'),
(767, 'Порхов', 'Псковская область'),
(768, 'Похвистнево', 'Самарская область'),
(769, 'Почеп', 'Брянская область'),
(770, 'Починок', 'Смоленская область'),
(771, 'Пошехонье', 'Ярославская область'),
(772, 'Правдинск', 'Калининградская область'),
(773, 'Приволжск', 'Ивановская область'),
(774, 'Приморск', 'Ленинградская область'),
(775, 'Приморско-Ахтарск', 'Краснодарский край'),
(776, 'Приозерск', 'Ленинградская область'),
(777, 'Прокопьевск', 'Кемеровская область'),
(778, 'Пролетарск', 'Ростовская область'),
(779, 'Протвино', 'Московская область'),
(780, 'Прохладный', 'Кабардино-Балкария'),
(781, 'Псков', 'Псковская область'),
(782, 'Пугачёв', 'Саратовская область'),
(783, 'Пудож', 'Карелия'),
(784, 'Пустошка', 'Псковская область'),
(785, 'Пучеж', 'Ивановская область'),
(786, 'Пушкин', 'Санкт-Петербург'),
(787, 'Пушкино', 'Московская область'),
(788, 'Пущино', 'Московская область'),
(789, 'Пыталово', 'Псковская область');
INSERT INTO `city` (`id`, `name`, `district`) VALUES
(790, 'Пыть-Ях', 'Ханты-Мансийский автономный округ'),
(791, 'Пятигорск', 'Ставропольский край'),
(792, 'Радужный', 'Владимирская область'),
(793, 'Радужный', 'Ханты-Мансийский автономный округ'),
(794, 'Райчихинск', 'Амурская область'),
(795, 'Раменское', 'Московская область'),
(796, 'Рассказово', 'Тамбовская область'),
(797, 'Ревда', 'Свердловская область'),
(798, 'Реж', 'Свердловская область'),
(799, 'Реутов', 'Московская область'),
(800, 'Ржев', 'Тверская область'),
(801, 'Родники', 'Ивановская область'),
(802, 'Рославль', 'Смоленская область'),
(803, 'Россошь', 'Воронежская область'),
(804, 'Ростов', 'Ярославская область'),
(805, 'Ростов-на-Дону', 'Ростовская область'),
(806, 'Рошаль', 'Московская область'),
(807, 'Ртищево', 'Саратовская область'),
(808, 'Рубцовск', 'Алтайский край'),
(809, 'Рудня', 'Смоленская область'),
(810, 'Руза', 'Московская область'),
(811, 'Рузаевка', 'Мордовия'),
(812, 'Рыбинск', 'Ярославская область'),
(813, 'Рыбное', 'Рязанская область'),
(814, 'Рыльск', 'Курская область'),
(815, 'Ряжск', 'Рязанская область'),
(816, 'Рязань', 'Рязанская область'),
(817, 'Салават', 'Башкортостан'),
(818, 'Салаир', 'Кемеровская область'),
(819, 'Салехард', 'Ямало-Ненецкий автономный округ'),
(820, 'Сальск', 'Ростовская область'),
(821, 'Самара', 'Самарская область'),
(822, 'Санкт-Петербург', 'Ленинградская область'),
(823, 'Саранск', 'Республика Мордовия'),
(824, 'Сарапул', 'Удмуртия'),
(825, 'Саратов', 'Саратовская область'),
(826, 'Саров', 'Нижегородская область'),
(827, 'Сасово', 'Рязанская область'),
(828, 'Сатка', 'Челябинская область'),
(829, 'Сафоново', 'Смоленская область'),
(830, 'Саяногорск', 'Хакасия'),
(831, 'Саянск', 'Иркутская область'),
(832, 'Светлогорск', 'Калининградская область'),
(833, 'Светлоград', 'Ставропольский край'),
(834, 'Светлый', 'Калининградская область'),
(835, 'Светогорск', 'Ленинградская область'),
(836, 'Свирск', 'Иркутская область'),
(837, 'Свободный', 'Амурская область'),
(838, 'Себеж', 'Псковская область'),
(839, 'Северо-Курильск', 'Сахалинская область'),
(840, 'Северобайкальск', 'Бурятия'),
(841, 'Северодвинск', 'Архангельская область'),
(842, 'Североморск', 'Мурманская область'),
(843, 'Североуральск', 'Свердловская область'),
(844, 'Северск', 'Томская область'),
(845, 'Севск', 'Брянская область'),
(846, 'Сегежа', 'Республика Карелия'),
(847, 'Сельцо', 'Брянская область'),
(848, 'Семёнов', 'Нижегородская область'),
(849, 'Семикаракорск', 'Ростовская область'),
(850, 'Семилуки', 'Воронежская область'),
(851, 'Сенгилей', 'Ульяновская область'),
(852, 'Серафимович', 'Волгоградская область'),
(853, 'Сергач', 'Нижегородская область'),
(854, 'Сергиев Посад', 'Московская область'),
(855, 'Сердобск', 'Пензенская область'),
(856, 'Серов', 'Свердловская область'),
(857, 'Серпухов', 'Московская область'),
(858, 'Сертолово', 'Ленинградская область'),
(859, 'Сестрорецк', 'город Санкт-Петербург'),
(860, 'Сибай', 'Башкортостан'),
(861, 'Сим', 'Челябинская область'),
(862, 'Сковородино', 'Амурская область'),
(863, 'Скопин', 'Рязанская область'),
(864, 'Славгород', 'Алтайский край'),
(865, 'Славск', 'Калининградская область'),
(866, 'Славянск-на-Кубани', 'Краснодарский край'),
(867, 'Сланцы', 'Ленинградская область'),
(868, 'Слободской', 'Кировская область'),
(869, 'Слюдянка', 'Иркутская область'),
(870, 'Смоленск', 'Смоленская область'),
(871, 'Снежинск', 'Челябинская область'),
(872, 'Снежногорск', 'Мурманская область'),
(873, 'Собинка', 'Владимирская область'),
(874, 'Советск', 'Калининградская область'),
(875, 'Советск', 'Кировская область'),
(876, 'Советск', 'Тульская область'),
(877, 'Советская Гавань', 'Хабаровский край'),
(878, 'Советский', 'Ханты-Мансийский автономный округ - Югра'),
(879, 'Сокол', 'Вологодская область'),
(880, 'Сокольники', 'Тульская область'),
(881, 'Солигалич', 'Костромская область'),
(882, 'Соликамск', 'Пермский край'),
(883, 'Солнечногорск', 'Московская область'),
(884, 'Соль-Илецк', 'Оренбургская область'),
(885, 'Сольвычегодск', 'Архангельская область'),
(886, 'Сольцы', 'Новгородская область'),
(887, 'Сорочинск', 'Оренбургская область'),
(888, 'Сорск', 'Хакасия'),
(889, 'Сортавала', 'Республика Карелия'),
(890, 'Сосенский', 'Калужская область'),
(891, 'Сосновка', 'Кировская область'),
(892, 'Сосновоборск', 'Красноярский край'),
(893, 'Сосновый Бор', 'Ленинградская область'),
(894, 'Сосногорск', 'Коми'),
(895, 'Сочи', 'Краснодарский край'),
(896, 'Спас-Деменск', 'Калужская область'),
(897, 'Спас-Клепики', 'Рязанская область'),
(898, 'Спасск', 'Пензенская область'),
(899, 'Спасск-Дальний', 'Приморский край'),
(900, 'Спасск-Рязанский', 'Рязанская область'),
(901, 'Среднеколымск', 'Якутия'),
(902, 'Среднеуральск', 'Свердловская область'),
(903, 'Сретенск', 'Читинская область'),
(904, 'Ставрополь', 'Ставропольский край'),
(905, 'Старая Купавна', 'Московская область'),
(906, 'Старая Русса', 'Новгородская область'),
(907, 'Старица', 'Тверская область'),
(908, 'Стародуб', 'Брянская область'),
(909, 'Старый Оскол', 'Белгородская область'),
(910, 'Стерлитамак', 'Башкортостан'),
(911, 'Стрежевой', 'Томская область'),
(912, 'Строитель', 'Белгородская область'),
(913, 'Струнино', 'Владимирская область'),
(914, 'Ступино', 'Московская область'),
(915, 'Суворов', 'Тульская область'),
(916, 'Суджа', 'Курская область'),
(917, 'Судогда', 'Владимирская область'),
(918, 'Суздаль', 'Владимирская область'),
(919, 'Суоярви', 'Республика Карелия'),
(920, 'Сураж', 'Брянская область'),
(921, 'Сургут', 'Ханты-Мансийский автономный округ - Югра'),
(922, 'Суровикино', 'Волгоградская область'),
(923, 'Сурск', 'Пензенская область'),
(924, 'Сусуман', 'Магаданская область'),
(925, 'Сухиничи', 'Калужская область'),
(926, 'Сухой Лог', 'Свердловская область'),
(927, 'Сходня', 'Московская область'),
(928, 'Сызрань', 'Самарская область'),
(929, 'Сыктывкар', 'Республика Коми'),
(930, 'Сысерть', 'Свердловская область'),
(931, 'Сычёвка', 'Смоленская область'),
(932, 'Сясьстрой', 'Ленинградская область'),
(933, 'Тавда', 'Свердловская область'),
(934, 'Таганрог', 'Ростовская область'),
(935, 'Тайга', 'Кемеровская область'),
(936, 'Тайшет', 'Иркутская область'),
(937, 'Талдом', 'Московская область'),
(938, 'Талица', 'Свердловская область'),
(939, 'Тамбов', 'Тамбовская область'),
(940, 'Тара', 'Омская область'),
(941, 'Тарко-Сале', 'Ямало-Ненецкий автономный округ'),
(942, 'Таруса', 'Калужская область'),
(943, 'Татарск', 'Новосибирская область'),
(944, 'Таштагол', 'Кемеровская область'),
(945, 'Тверь', 'Тверская область'),
(946, 'Теберда', 'Карачаево-Черкесия'),
(947, 'Тейково', 'Ивановская область'),
(948, 'Темников', 'Мордовия'),
(949, 'Темрюк', 'Краснодарский край'),
(950, 'Терек', 'Кабардино-Балкария'),
(951, 'Тетюши', 'Татарстан'),
(952, 'Тимашёвск', 'Краснодарский край'),
(953, 'Тихвин', 'Ленинградская область'),
(954, 'Тихорецк', 'Краснодарский край'),
(955, 'Тобольск', 'Тюменская область'),
(956, 'Тогучин', 'Новосибирская область'),
(957, 'Тольятти', 'Самарская область'),
(958, 'Томари', 'Сахалинская область'),
(959, 'Томмот', 'Якутия'),
(960, 'Томск', 'Томская область'),
(961, 'Топки', 'Кемеровская область'),
(962, 'Торжок', 'Тверская область'),
(963, 'Торопец', 'Тверская область'),
(964, 'Тосно', 'Ленинградская область'),
(965, 'Тотьма', 'Вологодская область'),
(966, 'Трёхгорный', 'Челябинская область'),
(967, 'Троицк', 'Московская область'),
(968, 'Троицк', 'Челябинская область'),
(969, 'Трубчевск', 'Брянская область'),
(970, 'Туапсе', 'Краснодарский край'),
(971, 'Туймазы', 'Башкортостан'),
(972, 'Тула', 'Тульская область'),
(973, 'Тулун', 'Иркутская область'),
(974, 'Туран', 'Тува'),
(975, 'Туринск', 'Свердловская область'),
(976, 'Тутаев', 'Ярославская область'),
(977, 'Тында', 'Амурская область'),
(978, 'Тырныауз', 'Кабардино-Балкарская Республика'),
(979, 'Тюкалинск', 'Омская область'),
(980, 'Тюмень', 'Тюменская область'),
(981, 'Уварово', 'Тамбовская область'),
(982, 'Углегорск', 'Сахалинская область'),
(983, 'Углич', 'Ярославская область'),
(984, 'Удачный', 'Якутия'),
(985, 'Удомля', 'Тверская область'),
(986, 'Ужур', 'Красноярский край'),
(987, 'Узловая', 'Тульская область'),
(988, 'Улан-Удэ', 'Бурятия'),
(989, 'Ульяновск', 'Ульяновская область'),
(990, 'Унеча', 'Брянская область'),
(991, 'Урай', 'Ханты-Мансийский автономный округ'),
(992, 'Урень', 'Нижегородская область'),
(993, 'Уржум', 'Кировская область'),
(994, 'Урус-Мартан', 'Чечня'),
(995, 'Урюпинск', 'Волгоградская область'),
(996, 'Усинск', 'Коми'),
(997, 'Усмань', 'Липецкая область'),
(998, 'Усолье', 'Пермский край'),
(999, 'Усолье-Сибирское', 'Иркутская область'),
(1000, 'Уссурийск', 'Приморский край'),
(1001, 'Усть-Джегута', 'Карачаево-Черкесия'),
(1002, 'Усть-Илимск', 'Иркутская область'),
(1003, 'Усть-Катав', 'Челябинская область'),
(1004, 'Усть-Кут', 'Иркутская область'),
(1005, 'Усть-Лабинск', 'Краснодарский край'),
(1006, 'Устюжна', 'Вологодская область'),
(1007, 'Уфа', 'Башкортостан'),
(1008, 'Ухта', 'Коми'),
(1009, 'Учалы', 'Башкортостан'),
(1010, 'Уяр', 'Красноярский край'),
(1011, 'Фатеж', 'Курская область'),
(1012, 'Фокино', 'Брянская область'),
(1013, 'Фокино', 'Приморский край'),
(1014, 'Фролово', 'Волгоградская область'),
(1015, 'Фрязино', 'Московская область'),
(1016, 'Фурманов', 'Ивановская область'),
(1017, 'Хабаровск', 'Хабаровский край'),
(1018, 'Хадыженск', 'Краснодарский край'),
(1019, 'Ханты-Мансийск', 'Ханты-Мансийский автономный округ - Югра'),
(1020, 'Харабали', 'Астраханская область'),
(1021, 'Харовск', 'Вологодская область'),
(1022, 'Хасавюрт', 'Дагестан'),
(1023, 'Хвалынск', 'Саратовская область'),
(1024, 'Хилок', 'Читинская область'),
(1025, 'Химки', 'Московская область'),
(1026, 'Холм', 'Новгородская область'),
(1027, 'Холмск', 'Сахалинская область'),
(1028, 'Хотьково', 'Московская область'),
(1029, 'Цивильск', 'Чувашия'),
(1030, 'Цимлянск', 'Ростовская область'),
(1031, 'Чадан', 'Тува'),
(1032, 'Чайковский', 'Пермский край'),
(1033, 'Чапаевск', 'Самарская область'),
(1034, 'Чаплыгин', 'Липецкая область'),
(1035, 'Чебаркуль', 'Челябинская область'),
(1036, 'Чебоксары', 'Чувашия'),
(1037, 'Чегем', 'Кабардино-Балкария'),
(1038, 'Чекалин', 'Тульская область'),
(1039, 'Челябинск', 'Челябинская область'),
(1040, 'Чердынь', 'Пермский край'),
(1041, 'Черемхово', 'Иркутская область'),
(1042, 'Черепаново', 'Новосибирская область'),
(1043, 'Череповец', 'Вологодская область'),
(1044, 'Черкесск', 'Карачаево-Черкесия'),
(1045, 'Чермоз', 'Пермский край'),
(1046, 'Черноголовка', 'Московская область'),
(1047, 'Черногорск', 'Хакасия'),
(1048, 'Чернушка', 'Пермский край'),
(1049, 'Черняховск', 'Калининградская область'),
(1050, 'Чехов', 'Московская область'),
(1051, 'Чистополь', 'Татарстан'),
(1052, 'Чита', 'Читинская область'),
(1053, 'Чкаловск', 'Нижегородская область'),
(1054, 'Чудово', 'Новгородская область'),
(1055, 'Чулым', 'Новосибирская область'),
(1056, 'Чусовой', 'Пермский край'),
(1057, 'Чухлома', 'Костромская область'),
(1058, 'Шагонар', 'Тува'),
(1059, 'Шадринск', 'Курганская область'),
(1060, 'Шали', 'Чечня'),
(1061, 'Шарыпово', 'Красноярский край'),
(1062, 'Шарья', 'Костромская область'),
(1063, 'Шатура', 'Московская область'),
(1064, 'Шахтёрск', 'Сахалинская область'),
(1065, 'Шахты', 'Ростовская область'),
(1066, 'Шахунья', 'Нижегородская область'),
(1067, 'Шацк', 'Рязанская область'),
(1068, 'Шебекино', 'Белгородская область'),
(1069, 'Шелехов', 'Иркутская область'),
(1070, 'Шенкурск', 'Архангельская область'),
(1071, 'Шилка', 'Читинская область'),
(1072, 'Шимановск', 'Амурская область'),
(1073, 'Шиханы', 'Саратовская область'),
(1074, 'Шлиссельбург', 'Ленинградская область'),
(1075, 'Шумерля', 'Чувашия'),
(1076, 'Шумиха', 'Курганская область'),
(1077, 'Шуя', 'Ивановская область'),
(1078, 'Щёкино', 'Тульская область'),
(1079, 'Щёлково', 'Московская область'),
(1080, 'Щербинка', 'Московская область'),
(1081, 'Щигры', 'Курская область'),
(1082, 'Щучье', 'Курганская область'),
(1083, 'Электрогорск', 'Московская область'),
(1084, 'Электросталь', 'Московская область'),
(1085, 'Электроугли', 'Московская область'),
(1086, 'Элиста', 'Калмыкия'),
(1087, 'Энгельс', 'Саратовская область'),
(1088, 'Эртиль', 'Воронежская область'),
(1089, 'Юбилейный', 'Московская область'),
(1090, 'Югорск', 'Ханты-Мансийский автономный округ'),
(1091, 'Южа', 'Ивановская область'),
(1092, 'Южно-Сахалинск', 'Сахалинская область'),
(1093, 'Южно-Сухокумск', 'Дагестан'),
(1094, 'Южноуральск', 'Челябинская область'),
(1095, 'Юрга', 'Кемеровская область'),
(1096, 'Юрьев-Польский', 'Владимирская область'),
(1097, 'Юрьевец', 'Ивановская область'),
(1098, 'Юрюзань', 'Челябинская область'),
(1099, 'Юхнов', 'Калужская область'),
(1100, 'Ядрин', 'Чувашия'),
(1101, 'Якутск', 'Якутия'),
(1102, 'Ялуторовск', 'Тюменская область'),
(1103, 'Янаул', 'Башкортостан'),
(1104, 'Яранск', 'Кировская область'),
(1105, 'Яровое', 'Алтайский край'),
(1106, 'Ярославль', 'Ярославская область'),
(1107, 'Ярцево', 'Смоленская область'),
(1108, 'Ясногорск', 'Тульская область'),
(1109, 'Ясный', 'Оренбургская область'),
(1110, 'Яхрома', 'Московская область');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL default '0',
  `name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `info` text collate utf8_unicode_ci NOT NULL,
  `logotip` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `delegate_name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `delegate_sex` int(1) NOT NULL default '0',
  `delegate_phone` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `delegate_email` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `user_id`, `name`, `info`, `logotip`, `delegate_name`, `delegate_sex`, `delegate_phone`, `delegate_email`) VALUES
(1, 5, 'Company', '', '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `company_workers`
--

CREATE TABLE IF NOT EXISTS `company_workers` (
  `id` int(10) NOT NULL auto_increment,
  `company_id` int(10) NOT NULL,
  `jurist_id` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `company_workers`
--


-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(10) NOT NULL auto_increment,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_uk` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_uk` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_uk` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `content_uk` text collate utf8_unicode_ci NOT NULL,
  `uri` varchar(512) collate utf8_unicode_ci NOT NULL default '',
  `user_uri` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `protected` int(1) NOT NULL default '0',
  `sort` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `name_ru`, `name_en`, `name_uk`, `title_ru`, `title_en`, `title_uk`, `keywords_ru`, `keywords_en`, `keywords_uk`, `description_ru`, `description_en`, `description_uk`, `content_ru`, `content_en`, `content_uk`, `uri`, `user_uri`, `enable`, `protected`, `sort`) VALUES
(1, 'Главная', '', '', 'Главная страница | Славушка. Магазин игрушек', '', '', '', '', '', '', '', '', '<h3>\r\n	ГДЕ НАЙТИ ДЕТСКИЕ ИГРУШКИ И ТОВАРЫ В МОСКВЕ? КОНЕЧНО В ИНТЕРНЕТ МАГАЗИНЕ ДЕТСКИХ ТОВАРОВ И ИГРУШЕК &ldquo;ДЕТСКИЙ МИР&rdquo;! КАК ВЫБРАТЬ ЛУЧШИЙ ИНТЕРНЕТ МАГАЗИН ДЕТСКИХ ТОВАРОВ В МОСКВЕ?</h3>\r\n<div class="text">\r\n	<p>\r\n		Ищете, где можно купить все необходимые детские товары и игрушки для малыша?</p>\r\n	<p>\r\n		Предпочитаете доверять известным брендам с проверенным качеством товара?</p>\r\n	<p>\r\n		Вам хочется найти портал с привлекательными ценами на детские товары и игрушки?</p>\r\n	<p>\r\n		Какой малыш не смотрит широко раскрытыми восхищенными глазами на пестрящее всеми красками радуги великолепие игрушек в огромном супермаркете? Какая мама не ловила своего кроху, несущегося между рядов детских товаров с восхитительными нарядными куклами и конструкторами? Какие родители не мечтали о самых современных и качественных игрушках для своего ребенка? Как было бы здорово найти волшебную страну чудес, где сбываются и сокровенные мечты ребенка, и заветные желания заботливых мам и пап, где можно выбрать самые разные детские товары в Москве и Подмосковье: и такой удобный стульчик для кормления самого маленького члена семьи, и пушистые пледы с теплыми одеяльцами, и любой товар для ухода за малышом...</p>\r\n	<p>\r\n		Хотите найти интернет магазин игрушек и лучших брендовых детских товаров по выгодным ценам? Заглянув в наш каталог, вы окунетесь в целое созвездие известных детских марок и широкий выбор всех необходимых товаров для вашего малыша!</p>\r\n	<p>\r\n		Сегодня &laquo;Детский мир&raquo; &mdash; это более 130 просторных супермаркетов детских товаров в Москве и более чем 60 регионах страны. Мы шагаем в ногу со временем, у нас не только огромные складские комплексы, но и уютный интернет магазин детских игрушек и других товаров для малышей, заветный уголок всемирной сети, который может стать местом ваших покупок. Сотрудничая с нами, вы получаете:</p>\r\n</div>\r\n', '', '', 'glavnaya', '', 1, 1, 0),
(2, 'Информация', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Уважаемые покупатели!</p>\r\n<p>\r\n	Вы можете сделать заказ на сайте круглосуточно.</p>\r\n<p>\r\n	Операторы интернет-магазина осуществляют обработку заказов с 9:00 до 21:00 ежедневно.</p>\r\n<p>\r\n	Доставка осуществляется в следующие города: Москва и Московская область, Санкт-Петербург и Ленинградская область, Брянск, Владимир, Екатеринбург, Иваново, Казань, Калуга, Кострома, Набережные Челны, Нижний Новгород, Новосибирск, Омск, Пермь, Рязань, Тула, Тюмень, Чебоксары, Челябинск, Ярославль.</p>\r\n<p>\r\n	Города и районы доставки в Подмосковье</p>\r\n<p>\r\n	Подробнее о зонах и условиях доставки</p>\r\n<p>\r\n	Вы можете сделать заказ на сайте круглосуточно.</p>\r\n<p>\r\n	Операторы интернет-магазина осуществляют обработку заказов с 9:00 до 21:00 ежедневно.</p>\r\n', '', '', 'informatsiya', '', 1, 1, 0),
(3, 'О нас', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	<img alt="" src="/img/images/ig3.jpg" style="margin: 3pt 15pt 0px 0px; float: left; width: 300px; height: 199px; " />Более 50 лет существует в России бренд &laquo;Детский мир&raquo;. За это время внутри сети сформировались традиции, позволившие с успехом пройти через все испытания прошлого века.Сочетание традиций и стремления не отставать от возрастающих требований времени позволило &laquo;Детскому миру&raquo; выйти на новый этап развития &mdash; создание общенациональной сети магазинов детских товаров 21 века.</p>\r\n<p>\r\n	Самый крупный в Европе, старейший магазин сети &laquo;Детский мир&raquo; открылся в 1957 году. Всего за три года было построено здание общей площадью 54,5 тыс. м2, из них 22,5 тыс. м2 приходилось непосредственно на торговые площади. Уникальность сооружения была также в том, что это было первое здание, спроектированное и построенное именно для магазина детских товаров.</p>\r\n', '', '', 'o_nas', '', 1, 0, 0),
(4, 'Оплата/Доставка', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Более 50 лет существует в России бренд &laquo;Детский мир&raquo;. За это время внутри сети сформировались традиции, позволившие с успехом пройти через все испытания прошлого века.Сочетание традиций и стремления не отставать от возрастающих требований времени позволило &laquo;Детскому миру&raquo; выйти на новый этап развития &mdash; создание общенациональной сети магазинов детских товаров 21 века.</p>\r\n<p>\r\n	Самый крупный в Европе, старейший магазин сети &laquo;Детский мир&raquo; открылся в 1957 году. Всего за три года было построено здание общей площадью 54,5 тыс. м2, из них 22,5 тыс. м2 приходилось непосредственно на торговые площади. Уникальность сооружения была также в том, что это было первое здание, спроектированное и построенное именно для магазина детских товаров.</p>', '', '', 'oplatadostavka', '', 1, 0, 0),
(5, 'Помощь', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Более 50 лет существует в России бренд &laquo;Детский мир&raquo;. За это время внутри сети сформировались традиции, позволившие с успехом пройти через все испытания прошлого века.Сочетание традиций и стремления не отставать от возрастающих требований времени позволило &laquo;Детскому миру&raquo; выйти на новый этап развития &mdash; создание общенациональной сети магазинов детских товаров 21 века.</p>\r\n<p>\r\n	Самый крупный в Европе, старейший магазин сети &laquo;Детский мир&raquo; открылся в 1957 году. Всего за три года было построено здание общей площадью 54,5 тыс. м2, из них 22,5 тыс. м2 приходилось непосредственно на торговые площади. Уникальность сооружения была также в том, что это было первое здание, спроектированное и построенное именно для магазина детских товаров.</p>\r\n', '', '', 'pomosch', '', 1, 0, 0),
(6, 'Уважаемые покупатели!', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Уважаемые покупатели!</p>\r\n<p>\r\n	Вы можете сделать заказ на сайте круглосуточно. Операторы интернет-магазина осуществляют обработку заказов с 9:00 до 21:00 ежедневно.</p>\r\n', '', '', 'uvajaemyie_pokupateli', '', 1, 1, 0),
(7, 'Обратная связь', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	г. Москва, м. Цветной бульвар</p>\r\n<p>\r\n	Цветной бульвар дом 21 строение 2</p>\r\n<p>\r\n	<span>Телефон:</span> +7(495) 760-34-94 (для Москвы)</p>\r\n<p>\r\n	<span>Телефон:</span> +7(985) 760-34-94 (для регинов)</p>\r\n<p>\r\n	<span>Ежедневно с 10.00 до 18.00</span></p>\r\n', '', '', 'contacts', 'contacts', 1, 1, 0),
(8, 'test', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', '', 'test', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `id` int(10) NOT NULL auto_increment,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_ka` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_ka` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_ka` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_ka` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `content_ka` text collate utf8_unicode_ci NOT NULL,
  `username` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `useremail` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `date` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `name_ru`, `name_en`, `name_ka`, `title_ru`, `title_en`, `title_ka`, `keywords_ru`, `keywords_en`, `keywords_ka`, `description_ru`, `description_en`, `description_ka`, `content_ru`, `content_en`, `content_ka`, `username`, `useremail`, `enable`, `date`) VALUES
(2, 'Есть ли сертификаты на Вашу продукцию?', 'Городенка', 'Городенка', '', '', '', '', '', '', '', '', '', '<p>\r\n	Да. Есть. При покупке у нас товара, мы предоставляем покупателю (по требованию) копию.</p>\r\n<p>\r\n	С уважением, Коллектив Sandaleta</p>\r\n', '', '', '', '', 1, 1333141200),
(3, 'Самовывоз покупки?', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Да. Возможен самовывоз покупки. Адрес уточняете при заказе.</p>\r\n<p>\r\n	С уважением, коллектив Sandaleta</p>\r\n', '', '', '', '', 1, 1333227600);

-- --------------------------------------------------------

--
-- Table structure for table `gall`
--

CREATE TABLE IF NOT EXISTS `gall` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `author` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `gall`
--

INSERT INTO `gall` (`id`, `title`, `author`, `filename`, `views`) VALUES
(2, '123', 1, '123', 5),
(3, '123', 2, '123', 15),
(4, '123', 4, '123', 5),
(5, '123', 3, '123', 5),
(6, '123', 2, '123', 5),
(7, '123', 2, '123', 5),
(8, '123', 1, '123', 5),
(9, '123', 3, '123', 5);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int(10) NOT NULL auto_increment,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_uk` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_uk` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_uk` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_en` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_ru` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_uk` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `content_uk` text collate utf8_unicode_ci NOT NULL,
  `translit_url` varchar(512) collate utf8_unicode_ci NOT NULL,
  `picture` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `thumb` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `gallery` text collate utf8_unicode_ci NOT NULL,
  `enable` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `name_ru`, `name_en`, `name_uk`, `title_ru`, `title_en`, `title_uk`, `keywords_ru`, `keywords_en`, `keywords_uk`, `description_ru`, `description_en`, `description_uk`, `smallcontent_en`, `smallcontent_ru`, `smallcontent_uk`, `content_ru`, `content_en`, `content_uk`, `translit_url`, `picture`, `thumb`, `gallery`, `enable`) VALUES
(2, 'Торты', 'Галерея', 'Галерея', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '/design/images/410943aca9f4fb7e.jpg', '/design/images/410943aca9f4fb7e_small.jpg', '/design/images/67473e0c199dcf32.jpg;/design/images/67473e0c199dcf32_small.jpg|/design/images/0ba9f117f1f52b9f.jpg;/design/images/0ba9f117f1f52b9f_small.jpg|/design/images/b9888e35698f66a6.jpg;/design/images/b9888e35698f66a6_small.jpg|/design/images/74ab4c859b3717f2.jpg;/design/images/74ab4c859b3717f2_small.jpg', 1),
(3, 'Торты 2', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '/design/images/3c28f32969881aae.jpg', '/design/images/3c28f32969881aae_small.jpg', '/design/images/c1e2d3b9a1af5399.jpg;/design/images/c1e2d3b9a1af5399_small.jpg|/design/images/aa23d291fddf2f63.jpg;/design/images/aa23d291fddf2f63_small.jpg|/design/images/c7db27ec1d036368.jpg;/design/images/c7db27ec1d036368_small.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL default '0',
  `content` text collate utf8_unicode_ci NOT NULL,
  `requirements` text collate utf8_unicode_ci NOT NULL,
  `price` int(10) NOT NULL default '0',
  `experience` varchar(10) collate utf8_unicode_ci NOT NULL default '',
  `city_id` int(10) NOT NULL default '0',
  `user_id` int(10) NOT NULL default '0',
  `views` int(5) NOT NULL default '0',
  `enable` int(1) NOT NULL default '1',
  `date` int(10) NOT NULL default '0',
  `answers` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `type`, `content`, `requirements`, `price`, `experience`, `city_id`, `user_id`, `views`, `enable`, `date`, `answers`) VALUES
(1, 'Работа 1', 0, 'Работа 1\r\nРабота 2\r\nРабота 3', 'Работа 1', 10000, '2', 598, 7, 33, 1, 1278381611, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_specialization_assoc`
--

CREATE TABLE IF NOT EXISTS `jobs_specialization_assoc` (
  `id` int(10) NOT NULL auto_increment,
  `job_id` int(10) NOT NULL,
  `specialization_id` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `jobs_specialization_assoc`
--

INSERT INTO `jobs_specialization_assoc` (`id`, `job_id`, `specialization_id`) VALUES
(1, 1, 23),
(22, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jurist`
--

CREATE TABLE IF NOT EXISTS `jurist` (
  `id` int(10) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL default '0',
  `company_id` int(10) NOT NULL default '0',
  `profstatus_id` int(10) NOT NULL default '0',
  `job` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `experience` int(3) NOT NULL default '0',
  `education_city_id` int(10) NOT NULL default '0',
  `education_name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `education_year` varchar(10) collate utf8_unicode_ci NOT NULL default '',
  `education_notcomplited` int(1) NOT NULL default '0',
  `education_achieve` varchar(1000) collate utf8_unicode_ci NOT NULL default '',
  `jurist_number` varchar(32) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jurist`
--

INSERT INTO `jurist` (`id`, `user_id`, `company_id`, `profstatus_id`, `job`, `experience`, `education_city_id`, `education_name`, `education_year`, `education_notcomplited`, `education_achieve`, `jurist_number`) VALUES
(1, 6, 0, 0, '', 0, 0, '', '', 0, '', ''),
(2, 10, 0, 1, 'GlobalVision', 16, 598, 'Вуз №1', '1977', 0, 'Нет!', '7890'),
(3, 11, 0, 0, '', 0, 0, '', '', 0, '', ''),
(4, 13, 0, 0, '', 0, 0, '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jurist_profstatus`
--

CREATE TABLE IF NOT EXISTS `jurist_profstatus` (
  `id` int(3) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jurist_profstatus`
--

INSERT INTO `jurist_profstatus` (`id`, `name`) VALUES
(1, 'адвокат'),
(2, 'нотариус'),
(3, 'судья'),
(4, 'стажер'),
(5, 'студент'),
(6, 'юрист'),
(7, 'госслужащий'),
(8, 'помощник юриста'),
(9, 'помощник адвоката');

-- --------------------------------------------------------

--
-- Table structure for table `jurist_specialization`
--

CREATE TABLE IF NOT EXISTS `jurist_specialization` (
  `id` int(10) NOT NULL auto_increment,
  `jurist_id` int(10) NOT NULL default '0',
  `specialization_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jurist_specialization`
--

INSERT INTO `jurist_specialization` (`id`, `jurist_id`, `specialization_id`) VALUES
(1, 2, 15),
(2, 2, 16),
(3, 2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(10) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `user_id`) VALUES
(1, 7),
(2, 9),
(3, 12),
(4, 14),
(5, 15),
(6, 16),
(7, 17),
(8, 18),
(9, 19);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `protected` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `protected`) VALUES
(1, 'Верхнее меню', 1),
(4, 'Левое меню', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) NOT NULL auto_increment,
  `menu_id` int(5) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `depth` int(5) NOT NULL default '0',
  `sort` int(10) NOT NULL default '0',
  `name_ru` varchar(1024) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `name_en` varchar(1024) NOT NULL default '',
  `name_uk` varchar(255) NOT NULL,
  `href` varchar(1024) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `module` varchar(255) NOT NULL default '',
  `controller` varchar(255) NOT NULL default '',
  `route` varchar(255) NOT NULL default '',
  `params` varchar(1024) NOT NULL default '',
  `model` varchar(255) NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  `route_params` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `parent_id`, `depth`, `sort`, `name_ru`, `name_en`, `name_uk`, `href`, `module`, `controller`, `route`, `params`, `model`, `enable`, `url`, `route_params`) VALUES
(1, 0, 0, 0, 1, 'Главная', '', '', 'route=default', '', '', 'default', '', '', 1, '', ''),
(2, 0, 0, 0, 2, 'О нас', '', '', 'model=Content_Model_Content|params=id:3', '', '', 'content', 'id:3', 'Content_Model_Content', 1, '', 'uri:o_nas'),
(3, 0, 0, 0, 6, 'Оплата/Доставка', '', '', 'model=Content_Model_Content|params=id:4', '', '', 'content', 'id:4', 'Content_Model_Content', 1, '', 'uri:oplatadostavka'),
(4, 0, 0, 0, 7, 'Помощь', '', '', 'model=Content_Model_Content|params=id:5', '', '', 'content', 'id:5', 'Content_Model_Content', 1, '', 'uri:pomosch'),
(5, 0, 0, 0, 8, 'Обратная связь', '', '', 'route=contacts', '', '', 'contacts', '', '', 1, '', ''),
(6, 0, 2, 1, 3, 'О компании', '', '', 'model=Content_Model_Content|params=id:8', '', '', 'content', 'id:8', 'Content_Model_Content', 1, '', 'uri:test'),
(7, 0, 2, 1, 4, 'Новости', '', '', 'module=news|route=news', 'news', '', 'news', '', '', 1, '', ''),
(9, 0, 2, 1, 5, 'Полезная информация', '', '', 'module=articles|route=articles', 'articles', '', 'articles', '', '', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) NOT NULL auto_increment,
  `from_id` int(10) NOT NULL,
  `to_id` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) NOT NULL auto_increment,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_uk` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_uk` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_uk` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_en` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_ru` varchar(403) collate utf8_unicode_ci NOT NULL,
  `smallcontent_uk` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `content_uk` text collate utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL default '0',
  `picture` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `thumb` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `protected` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `name_ru`, `name_en`, `name_uk`, `title_ru`, `title_en`, `title_uk`, `keywords_ru`, `keywords_en`, `keywords_uk`, `description_ru`, `description_en`, `description_uk`, `smallcontent_en`, `smallcontent_ru`, `smallcontent_uk`, `content_ru`, `content_en`, `content_uk`, `date`, `picture`, `thumb`, `enable`, `protected`) VALUES
(15, 'Нежнейший торт', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с легким творожным кремомзамечательныдесерт.</p>\r\n', '', '<p>\r\n	Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с легким творожным кремомзамечательныдесерт.Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с</p>\r\n', '', '', 1333486800, '/img/2b2d10ce4f7d6087.jpg', '/img/2b2d10ce4f7d6087_small.jpg', 1, 0),
(16, 'Тонки кофейно', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с легким творожным кремомзамечательныдесерт</p>\r\n', '', '<p>\r\n	Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с легким творожным кремомзамечательныдесерт.Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат</p>\r\n', '', '', 1333918800, '/img/1e5c8445702b6b93.jpg', '/img/1e5c8445702b6b93_small.jpg', 1, 0),
(17, 'Нежнейший торт', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с легким творожным кремомзамечательныдесерт.Нежнейший торт</p>\r\n', '', '<p>\r\n	Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат коржей в сочетании с легким творожным кремомзамечательныдесерт.Нежнейший торт для таких же поклонников кофе и шоколада, как я. Тонки кофейно- шоколадный аромат</p>\r\n', '', '', 1333918800, '/img/52129af0a55ed9c4.jpg', '/img/52129af0a55ed9c4_small.jpg', 1, 0),
(20, 'test 1', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the ', '', '<p>\r\n	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '', '', 1339140168, '/img/a6b7c7b88172476c.jpg', '/img/a6b7c7b88172476c_small.jpg', 1, 0),
(21, 'test 3', '', '', '', '', '', '', '', '', '', '', '', '', '<p>\r\n	sdfghtyjui</p>\r\n', '', '<p>\r\n	sedfrtgyhjui</p>\r\n', '', '', 1339487428, '/img/44ab5b961ff93e44.jpg', '/img/44ab5b961ff93e44_small.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE IF NOT EXISTS `partners` (
  `id` int(10) NOT NULL auto_increment,
  `name_ru` varchar(1024) collate utf8_unicode_ci NOT NULL,
  `name_en` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `name_uk` varchar(1024) collate utf8_unicode_ci NOT NULL default '',
  `title_ru` text collate utf8_unicode_ci NOT NULL,
  `title_en` text collate utf8_unicode_ci NOT NULL,
  `title_uk` text collate utf8_unicode_ci NOT NULL,
  `keywords_ru` text collate utf8_unicode_ci NOT NULL,
  `keywords_en` text collate utf8_unicode_ci NOT NULL,
  `keywords_uk` text collate utf8_unicode_ci NOT NULL,
  `description_ru` text collate utf8_unicode_ci NOT NULL,
  `description_en` text collate utf8_unicode_ci NOT NULL,
  `description_uk` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_en` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_ru` text collate utf8_unicode_ci NOT NULL,
  `smallcontent_uk` text collate utf8_unicode_ci NOT NULL,
  `content_ru` text collate utf8_unicode_ci NOT NULL,
  `content_en` text collate utf8_unicode_ci NOT NULL,
  `content_uk` text collate utf8_unicode_ci NOT NULL,
  `date` int(11) NOT NULL default '0',
  `picture` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `thumb` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `enable` tinyint(1) NOT NULL default '0',
  `city_ru` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `city_en` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `city_uk` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `production_ru` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `production_en` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `production_uk` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `url` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name_ru`, `name_en`, `name_uk`, `title_ru`, `title_en`, `title_uk`, `keywords_ru`, `keywords_en`, `keywords_uk`, `description_ru`, `description_en`, `description_uk`, `smallcontent_en`, `smallcontent_ru`, `smallcontent_uk`, `content_ru`, `content_en`, `content_uk`, `date`, `picture`, `thumb`, `enable`, `city_ru`, `city_en`, `city_uk`, `production_ru`, `production_en`, `production_uk`, `url`) VALUES
(1, 'Вася', 'Vasa', 'Вася', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '\\design\\images\\36090cca3c80550c.jpg', '\\design\\images\\36090cca3c80550c_small.jpg', 1, 'Вася', 'Вася', 'Вася', 'Вася', 'Вася', 'Вася', 'http://google.com/'),
(2, 'Микола', 'Mykola', 'Микола', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '\\design\\images\\27ad5ec630147bba.jpg', '\\design\\images\\27ad5ec630147bba_small.jpg', 1, 'Микола', 'Микола', 'Микола', 'Микола', 'Микола', 'Микола', 'http://ya.ru/');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `content` text collate utf8_unicode_ci NOT NULL,
  `type` int(1) NOT NULL default '0',
  `paid` int(1) NOT NULL default '0',
  `price` int(10) NOT NULL default '0',
  `user_id` int(10) NOT NULL default '0',
  `views` int(10) NOT NULL default '0',
  `date` int(10) NOT NULL default '0',
  `enable` int(1) NOT NULL default '0',
  `answers` int(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `name`, `content`, `type`, `paid`, `price`, `user_id`, `views`, `date`, `enable`, `answers`) VALUES
(1, 'Спасайте, посоны!', 'Что будет если в унитаз поезда на полном ходу бросить лом?', 0, 0, 0, 7, 24, 1340026057, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `question_tags`
--

CREATE TABLE IF NOT EXISTS `question_tags` (
  `id` int(10) NOT NULL auto_increment,
  `type` int(1) NOT NULL default '0',
  `name` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `categories` text character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `question_tags`
--

INSERT INTO `question_tags` (`id`, `type`, `name`, `categories`) VALUES
(1, 0, 'Семья', 'брак, имущество супругов, алименты и другие вопросы семейного'),
(2, 0, 'Труд. Занятость', 'трудоустройство и увольнение, заработная плата, гарантии прав работников и другие вопросы трудового права'),
(3, 0, 'Недвижимость. Жилье', 'сделки с недвижимостью, ТСЖ, другие вопросы связанные с недвижимостью'),
(22, 1, 'Судебные и досудебные процедуры. Исполнение решений', 'гражданский и арбитражный процесс, досудебное урегулирование, исполнение судебных решений'),
(4, 0, 'Транспорт ', 'ДТП, взаимоотношение с ГИБДД, другие вопросы участников дорожного движения\r\n'),
(5, 0, 'Документы. Договоры', 'формы документов, нотариальное заверение документов, документооборот'),
(21, 1, 'Интеллектуальная собственность ', 'права на результаты интеллектуальной деятельности и их защита'),
(6, 0, 'Кредиты', 'различные виды кредитования, взаимоотношения с коллекторами'),
(7, 0, 'Социальное обеспечение', 'пенсии, пособия'),
(8, 0, 'Финансы. Налоги', 'налоги и сборы, налоговые вычеты, ценные бумаги и другие вопросы'),
(9, 0, 'Страхование', 'КАСКО различные виды страхования и вопросы, касающиеся страхового права'),
(10, 0, 'Воинская обязанность и военная служба', 'военная и альтернативная служба, социальная защита военнослужащих и другие вопросы'),
(11, 0, 'Гражданство. Миграция', 'вопросы гражданства и миграции'),
(19, 1, 'Государственные органы', 'проверки, взаимоотношение с государственными органами'),
(20, 1, 'Корпоративное управление', 'корпоративные процедуры, банкротство, взаимоотношение с органами управления, учредителями, акционерами'),
(12, 0, 'Наследство', 'наследование по закону и по завещанию, наследственные споры'),
(13, 0, 'Судебные и досудебные процедуры. Исполнение решений', 'привлечение к ответственности, процессуальные вопросы участия, исполнение судебных решений'),
(18, 1, 'Обслуживание основной деятельности', 'аренда, обработка персональных данных, автотранспорт и другие вопросы'),
(14, 0, 'Другие вопросы', 'взаимоотношение с органами власти, защита прав, возмещение ущерба и другие правовые вопросы'),
(17, 1, 'Основная бизнес-деятельность', 'продажи, производство, услуги, контрагенты, логистика и другие вопросы'),
(15, 1, 'Сотрудники', 'взаимоотношения с сотрудниками, вопросы трудового права'),
(16, 1, 'Налоги. Бухучет. Финансы ', 'налоговые обязательства, бухгалтерский учет, банки, ценные бумаги');

-- --------------------------------------------------------

--
-- Table structure for table `question_tags_assoc`
--

CREATE TABLE IF NOT EXISTS `question_tags_assoc` (
  `id` int(10) NOT NULL auto_increment,
  `question_id` int(10) NOT NULL,
  `tag_id` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `question_tags_assoc`
--

INSERT INTO `question_tags_assoc` (`id`, `question_id`, `tag_id`) VALUES
(16, 1, 2),
(15, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE IF NOT EXISTS `specialization` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`id`, `name`) VALUES
(1, 'Гражданское право'),
(2, 'Трудовое право'),
(3, 'Семейное право'),
(4, 'Административное право'),
(5, 'Налоговое право'),
(6, 'Корпоративное право'),
(7, 'Уголовное право'),
(8, 'Право интеллектуальной собственности'),
(9, 'Земельное право'),
(10, 'Таможенное право'),
(13, 'Антимонопольное право'),
(12, 'Жилищное право'),
(14, 'Страховое право'),
(15, 'Международное право'),
(16, 'Конституционное право'),
(17, 'Право социального обеспечения'),
(18, 'Финансовое право'),
(19, 'Экологическое право'),
(20, 'Ардитражно-процессуальное право'),
(21, 'Гражданско-процессуальное право'),
(22, 'Уголовно-процессуальное право'),
(23, 'Морское право'),
(24, 'lkj');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL auto_increment,
  `login` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `lang` varchar(5) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `role` varchar(32) NOT NULL,
  `table_rows` int(10) NOT NULL default '20',
  `table_lang` varchar(4) NOT NULL,
  `city_id` int(10) NOT NULL default '0',
  `bday` int(3) NOT NULL default '0',
  `bmonth` int(3) NOT NULL default '0',
  `byear` int(5) NOT NULL default '0',
  `sex` int(1) NOT NULL default '0',
  `photo` varchar(255) NOT NULL default '',
  `phone` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `name`, `lang`, `role`, `table_rows`, `table_lang`, `city_id`, `bday`, `bmonth`, `byear`, `sex`, `photo`, `phone`) VALUES
(2, 'Rastor', '4297f44b13955235245b2497399d7a93', 'doom4eg@gmail.com', 'Буджак Орест Любомирович', 'ru', 'superadmin', 100, 'ru', 0, 6, 6, 1966, 2, '/img/30ed5632c798d80f.jpg', ''),
(3, 'demo', '4297f44b13955235245b2497399d7a93', 'oksana@gvstudio.com.ua', 'Буджак Орест Любомирович', 'ru', 'admin', 10, 'ru', 0, 1, 2, 1943, 2, '', ''),
(5, 'company', '4297f44b13955235245b2497399d7a93', 'demo@demo.com', 'Буджак Орест Любомирович', '', 'company', 20, '', 0, 0, 0, 0, 0, '', ''),
(6, 'jurist', '4297f44b13955235245b2497399d7a93', 'demo@demo.com', 'Буджак Орест Любомирович', '', 'jurist', 20, '', 0, 0, 0, 0, 0, '', ''),
(7, 'member', '4297f44b13955235245b2497399d7a93', 'demo@demo.com', 'Буджак Орест Любомирович', '', 'member', 20, '', 598, 0, 0, 0, 0, '', ''),
(9, '', '4297f44b13955235245b2497399d7a93', 'i@i.ua', 'Вася Пупкин', '', 'member', 20, '', 0, 11, 1, 1958, 1, '/img/98a150c7b059008b.jpg', ''),
(10, '', '4297f44b13955235245b2497399d7a93', 'j@i.ua', 'Юрист Петя', '', 'jurist', 20, '', 0, 3, 6, 1948, 1, '/img/dc20c63093a4b488.jpg', ''),
(11, '', '1eec1fab6c59c23fa21988fc15d3da6c', 'gleba.vladimir@gmail.com', 'Глеба Владимир Васильевич', '', 'jurist', 20, '', 312, 8, 5, 1944, 1, '/img/e312b492da223624.jpg', ''),
(12, '', '6b52d7712c7190df4540d3dea37fd7f6', 'joseph72@hotmail.com', 'gordon', '', 'member', 20, '', 319, 0, 0, 0, 0, '', ''),
(13, '', 'e34a8899ef6468b74f8a1048419ccc8b', 'z3rgatul@gmail.com', ''';delete from users;--', '', 'jurist', 20, '', 279, 0, 0, 0, 0, '', ''),
(14, '', '4124bc0a9335c27f086f24ba207a4912', 'z3rgatul@gmail.com', '<script>alert(''huy'');</script>', '', 'member', 20, '', 8, 0, 0, 0, 0, '', ''),
(15, '', '343d9040a671c45832ee5381860e2996', 'z3rgatul@gmail.com', '</table>', '', 'member', 20, '', 8, 0, 0, 0, 0, '', ''),
(16, '', 'bb697d88efe64d7ba2b6b06edb81e384', 'impurript@gmail.com', 'Nersslalkneah', '', 'member', 20, '', 8, 0, 0, 0, 0, '', ''),
(17, '', '2897cd787b876eb6a284235743063a3f', 'kis.valentin@gmail.com', 'Кислый Валентин Анатольевич', '', 'member', 20, '', 461, 0, 0, 0, 0, '', ''),
(18, '', '202cb962ac59075b964b07152d234b70', 'gamsigamsa@gmail.com', 'Галлямов Марат', '', 'member', 20, '', 347, 0, 0, 0, 0, '/img/ce090fefc0c11cc8.jpg', ''),
(19, '', '1eec1fab6c59c23fa21988fc15d3da6c', 'gleba.vladimir@gmail.com', 'Глеба Владимир', '', 'member', 20, '', 515, 0, 0, 0, 0, '/img/93365129a4aa556a.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_services`
--

CREATE TABLE IF NOT EXISTS `user_services` (
  `id` int(10) NOT NULL auto_increment,
  `user_id` int(10) NOT NULL,
  `name` varchar(244) collate utf8_unicode_ci NOT NULL default '',
  `price` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_services`
--

INSERT INTO `user_services` (`id`, `user_id`, `name`, `price`) VALUES
(1, 5, 'Услуга 1', 1000),
(2, 3, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `variables`
--

CREATE TABLE IF NOT EXISTS `variables` (
  `id` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `value` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `variables`
--

INSERT INTO `variables` (`id`, `value`) VALUES
('lol', 'lol123'),
('lol1', 'lol'),
('mailform_content', '2'),
('mainpage_content', '11');
