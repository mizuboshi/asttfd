-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql300.infinityfree.com
-- Время создания: Апр 02 2024 г., 16:55
-- Версия сервера: 10.4.17-MariaDB
-- Версия PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `if0_36217105_T`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Battletypes`
--

CREATE TABLE `Battletypes` (
  `N` int(11) NOT NULL,
  `way` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Battletypes`
--

INSERT INTO `Battletypes` (`N`, `way`) VALUES
(1, 'Str'),
(2, 'Agi'),
(3, 'Int'),
(6, 'Agi+Int'),
(5, 'Str+Int'),
(4, 'Str+Agi'),
(7, 'Str+Agi+Int'),
(8, '2Str+Agi'),
(9, 'Str+2Agi'),
(10, '2Str+Int'),
(11, 'Str+2Int'),
(12, '2Agi+Int'),
(13, 'Agi+2Int');

-- --------------------------------------------------------

--
-- Структура таблицы `heroes`
--

CREATE TABLE `heroes` (
  `N` int(11) NOT NULL,
  `name` text NOT NULL,
  `class` text NOT NULL,
  `Battletype` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `heroes`
--

INSERT INTO `heroes` (`N`, `name`, `class`, `Battletype`) VALUES
(1, 'Youmu', 'Samurai', 9),
(2, 'Saber', 'Knight', 10),
(3, 'Jane', 'Blood Lord', 10),
(4, 'Fubuki', 'Martial Artist', 2),
(5, 'FNC', 'FN FNC', 2),
(6, 'Ganuy', 'Bow Master', 2),
(7, 'Ayaka', 'FrostLord', 3),
(8, 'Yaya', 'Fighter', 2),
(9, 'Hu Tao', 'Ghost', 10),
(10, 'Keqing', 'Thunder', 2),
(11, 'Black Gold Saw', 'Berserker', 1),
(12, 'Gray', 'Reaper', 2),
(13, 'Lucia', 'Crimson Abyss', 12),
(14, 'Saori', '?', 2),
(15, 'Shiina Mashiro', 'Healer', 3),
(16, 'Dorothy', 'Mage of Darkness', 3),
(17, 'Megas', 'Lightning', 3),
(18, 'Iroha', 'Captain', 9),
(19, 'Azusa', 'Shooter', 2),
(20, 'Tohka', 'Paladin', 10),
(21, 'Saber Alter', 'Dark Knight', 10),
(22, 'Gawr Gura', 'King of Sea', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `items`
--

CREATE TABLE `items` (
  `N` int(11) NOT NULL,
  `name` text NOT NULL,
  `type` int(11) NOT NULL,
  `tier` text NOT NULL,
  `spec` text NOT NULL DEFAULT '0',
  `Battletype` int(11) NOT NULL,
  `stats` text NOT NULL,
  `getM` text NOT NULL COMMENT 'id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `items`
--

INSERT INTO `items` (`N`, `name`, `type`, `tier`, `spec`, `Battletype`, `stats`, `getM`) VALUES
(1, 'Amashiro Natsuki Tier 1', 0, '1', '0', 7, '', '0'),
(2, 'Amashiro Natsuki Tier 2', 0, '1', '0', 7, '', '0'),
(3, 'Venom of Sword', 1, '1', '0', 4, '', '0'),
(4, 'Spider Fang', 1, '1', '0', 7, '', '0'),
(5, 'Waterlord Shoes', 4, '1', '0', 7, '', '0'),
(6, 'Murloc Amulet', 5, '1', '0', 7, '', '0'),
(7, 'Sea Crown', 3, '1', '0', 7, '', '0'),
(8, 'Sharpened Blade', 1, '1', '0', 4, '', '0'),
(9, 'Crown of Unholy', 3, '1', '0', 7, '', '0'),
(10, 'Bones Dagger', 1, '1', '0', 2, '', '0'),
(11, 'Dual Dagger', 1, '1', '0', 2, '', '0'),
(22, 'Plates of Steel Monster', 2, '2', '0', 1, '', '0'),
(23, 'Vest of Vampiric', 2, '2', '0', 2, '', '0'),
(24, 'Helmet of Rage', 3, '2', '0', 2, '', '0'),
(25, 'Corrosive Lord Armor', 2, '2', '0', 2, '', '0'),
(26, 'Corruption Dagger', 1, '2', '0', 2, '', '0'),
(27, 'Corruption Shoes', 4, '2', '0', 7, '', '0'),
(28, 'Greatsword Blade', 1, '3', '0', 4, '', '0'),
(29, 'Glove of Firelord', 1, '3', '0', 2, '', '0'),
(30, 'Crown of Fevor', 3, '3', '0', 7, '', '0'),
(31, 'Fireshard Plates', 2, '3', '0', 1, '', '0'),
(32, 'Book of Firelord', 5, '3', '0', 3, '', '0'),
(33, 'Firelord Nightmare', 5, '3', '0', 7, '', '0'),
(34, 'Blade of Frost Overlord', 1, '3', '0', 4, '', '0'),
(35, 'Burning Dagger', 1, '3', '0', 2, '', '0'),
(36, 'Berserker Boots', 4, '3', '0', 7, '', '0'),
(37, 'Flamelord Hood', 3, '3', '0', 5, '', '0'),
(38, 'Frostlord Mantle', 2, '3', '0', 3, '', '0'),
(39, 'Bow of Older Forest', 1, '4', '0', 2, '', '0'),
(40, 'Monster Hunter', 1, '4', '5', 2, '', '0'),
(41, 'Older Agility of Sword', 1, '4', '0', 2, '', '0'),
(42, 'Older Greatsword of Nature', 1, '4', '0', 1, '', '0'),
(43, 'Older Corrosive Dagger', 1, '4', '0', 2, '', '0'),
(44, 'Staff of Overlord Earth', 1, '4', '0', 3, '', '0'),
(45, 'Claws of Older Nature', 1, '4', '4,8', 2, '', '0'),
(46, 'Ancient Nature Wings', 4, '4', '0', 7, '', '0'),
(47, 'Hood of the Flame Nightmare', 3, '4', '0', 3, '', '0'),
(48, 'Judgment Lord', 3, '4', '0', 4, '', '0'),
(49, 'Heaven Mantle', 2, '4', '0', 3, '', '0'),
(50, 'Amashiro Natsuki Tier 3', 0, '5', '0', 7, '', '0'),
(51, 'Overlord Ring', 5, '5', '0', 7, '', '0'),
(52, 'Black Hunter Armor', 2, '5', '0', 2, '', '0'),
(53, 'Black Hunter Plates', 2, '5', '0', 1, '', '0'),
(54, 'Judgment Greatsword of Heaven', 1, '5', '0', 4, '', '0'),
(55, 'Ancient Ent of Claws', 1, '5', '4,8', 2, '', '0'),
(56, 'Ancient Katana', 1, '5', '1', 2, '', '0'),
(57, 'Greatsword of the Bloodlord', 1, '5', '3', 1, '', '0'),
(58, 'Inferno Staff', 1, '5', '0', 3, '', '0'),
(59, 'Master Hunter of Dagger Posion', 1, '5', '0', 2, '', '0'),
(60, 'Master Hunter', 1, '5', '5', 2, '', '0'),
(61, 'Ancient Shoes of Master', 4, '6', '0', 9, '', '0'),
(62, 'Vampiric Bat Wings', 4, '6', '0', 5, '', '0'),
(63, 'Vest of Forest Master', 2, '6', '0', 0, '', '0'),
(64, 'Frostshard Plates', 2, '6', '0', 1, '', '0'),
(65, 'Helm of the Ice Wings', 3, '6', '0', 2, '', '0'),
(66, 'Elite Druid Mantle', 2, '6', '0', 3, '', '0'),
(67, 'King the Ring of Overlord', 5, '6', '0', 7, '', '0'),
(68, 'Crown of the Deadmaster', 3, '6', '0', 7, '', '0'),
(69, 'Heavy Blade of the Death Blood', 1, '6', '11', 8, '', '0'),
(70, 'Shadow of the Scythe', 1, '7', '12', 2, '', '0'),
(71, 'Dread', 1, '7', '6', 2, '', '0'),
(72, 'Elite Fairy Wings', 4, '7', '0', 3, '', '0'),
(73, 'Orb of the Demon King', 5, '7', '0', 4, '', '0'),
(74, 'Master Magic of the Book', 5, '7', '0', 3, '', '0'),
(75, 'Vest of the Lord Fury', 2, '7', '0', 2, '', '0'),
(76, 'Crown of the Lord Lich', 3, '7', '0', 3, '', '0'),
(77, 'Bloodlust of the Lord', 1, '7', '0', 4, '', '0'),
(78, 'Amashiro Natsuki Tier 4', 0, '8', '0', 0, '', '0'),
(79, 'Lord Chaos of the Sword Nightmare', 1, '8', '0', 4, '', '0'),
(80, 'Lord Infernal Claws', 1, '8', '4,8', 2, '', '0'),
(81, 'Master Grove of the Staff Earth', 1, '8', '0', 3, '', '0'),
(82, 'Lord Overlord Mask', 3, '8', '0', 2, '', '0'),
(83, 'The Lich Lord of Geater Mana', 3, '8', '0', 3, '', '0'),
(84, 'Plate of the Grove Lord', 2, '8', '0', 1, '', '0'),
(85, 'Mantle of the Grove Lord', 2, '8', '0', 3, '', '0'),
(86, 'The Infernal Mask', 3, '8', '0', 4, '', '0'),
(87, 'Lord Katana', 1, '8', '1', 2, '', '0'),
(88, 'Flame Wings of Nightmare', 4, '8', '0', 7, '', '0'),
(89, 'Dragon Knight of the Greatsword', 1, '9', '0', 10, '', '0'),
(90, 'Magma Dragon Lord of the Glove', 1, '9', '4', 2, '', '0'),
(91, 'Master Dagger', 1, '9', '0', 2, '', '0'),
(92, 'Master Hunter of the Dragon', 1, '9', '5', 2, '', '0'),
(93, 'Hellfire of Spear', 1, '9', '9', 10, '', '0'),
(94, 'Master Fairy Wings', 4, '9', '0', 3, '', '0'),
(95, 'Killer of the Helm', 3, '9', '0', 2, '', '0'),
(96, 'Killer of the Armor', 2, '9', '0', 2, '', '0'),
(97, 'Flame Lord of the Helmet', 3, '9', '0', 4, '', '0'),
(98, 'Thunder Blade', 1, '9', '10', 2, '', '0'),
(99, 'Storm Essence', 5, '9', '0', 7, '', '0'),
(100, 'Master Mage of the Staff Lord', 1, '10', '0', 3, '', '0'),
(101, 'Orb of the Magma Lord', 5, '10', '0', 4, '', '0'),
(102, 'Master Overlord of the Ring Flame King', 5, '10', '0', 4, '', '0'),
(103, 'Heavy Blood of the Knight Dead', 1, '10', '11', 1, '', '0'),
(104, 'Light Wings', 4, '10', '0', 7, '', '0'),
(105, 'Wings of Corrupted', 4, '10', '11', 1, '', '0'),
(106, 'Corruption of the Dead Claws', 1, '10', '4,8', 2, '', '0'),
(107, 'Crown of the Corruption', 3, '10', '0', 7, '', '0'),
(108, 'Wings of the Corruption Flame', 4, '10', '11', 1, '', '0'),
(109, 'Ring of the Holy Light', 5, '10', '0', 10, '', '0'),
(110, 'Wings of Phoenix', 4, '11', '4', 2, '', '0'),
(111, 'Corruption of the Helm', 3, '11', '0', 2, '', '0'),
(112, 'Demon Lord of the Armor', 2, '11', '0', 2, '', '0'),
(113, 'Bloodlord of the Crimson Armor', 2, '11', '0', 2, '', '0'),
(114, 'Archangel Wings', 4, '11', '15', 7, '', '0'),
(115, 'Dread of the Book', 5, '11', '0', 3, '', '0'),
(116, 'Heaven of the Guardian Sword', 1, '11', '2', 5, '', '0'),
(117, 'Magma Dragon King of the Glove', 1, '11', '4', 2, '', '0'),
(118, 'Halo of the Archangel', 3, '11', '0', 1, '', '0'),
(119, 'Shadowshard Plates', 2, '11', '11,21', 1, '', '0'),
(120, 'Heart of the Storm', 4, '11', '8,10,17', 6, '', '0'),
(121, 'God Water of the Blade Nightmare', 1, '12', '0', 4, '', '0'),
(122, 'God Water of the Master Staff', 1, '12', '0', 3, '', '0'),
(123, 'Reactive Plates', 2, '12', '0', 1, '', '0'),
(124, 'Sea God of the Fury Armor', 2, '12', '0', 2, '', '0'),
(125, 'Death Hunter of the Scythe', 1, '12', '12', 2, '', '0'),
(126, 'Crimson of the Blood Orb', 5, '12', '0', 4, '', '0'),
(127, 'Crimson of the Book', 5, '12', '0', 3, '', '0'),
(128, 'Bloodblue of the Steel Armor', 2, '12', '0', 2, '', '0'),
(129, 'Heaven Divine Wings', 4, '12', '0', 5, '', '0'),
(130, 'Crimson of the Blood Robe', 2, '12', '0', 3, '', '0'),
(131, 'Hellfire the Bow of Divine Fury', 1, '13', '6', 2, '', '0'),
(132, 'Greatsword of the Crimson Blood', 1, '13', '0', 10, '', '0'),
(133, 'Wings of Freeze Hunter', 4, '13', '0', 2, '', '0'),
(134, 'Dead of the Master Dagger', 1, '13', '0', 2, '', '0'),
(135, 'Fury God of the Death Helm', 3, '13', '0', 2, '', '0'),
(136, 'Demon Lord of the Death Armor', 2, '13', '0', 2, '', '0'),
(137, 'Deathlord of the Crimson Claws', 1, '13', '4,8', 2, '', '0'),
(138, 'The Frost Lord of Lich Hood', 3, '13', '0', 3, '', '0'),
(139, 'The Archangel Hood', 3, '13', '0', 3, '', '0'),
(140, 'Ring of the True Guardian', 5, '13', '2,15.20', 10, '', '0'),
(141, 'Wings of the Deep Frost', 4, '13', '0', 9, '', '0'),
(142, 'Heaven Golded Plates', 2, '14', '2', 1, '', '0'),
(143, 'Master Shadow the Ring', 5, '14', '0', 4, '', '0'),
(144, 'Wings of the Shadow', 4, '14', '11', 1, '', '0'),
(145, 'The Crown of the Heaven King', 3, '14', '0', 7, '', '0'),
(146, 'Halo of True Judgment', 3, '14', '0', 8, '', '0'),
(147, 'Fury True God of the Dragon Helm', 3, '14', '0', 2, '', '0'),
(148, 'Shadowshard Armor', 2, '14', '11,21', 1, '', '0'),
(149, 'Wings of True Phoenix', 4, '14', '4,8', 2, '', '0'),
(150, 'Moonlight of the Shadow Dead Ring', 5, '14', '0', 4, '', '0'),
(151, 'Lord Sakura of the Katana', 1, '14', '1,13', 2, '', '0'),
(152, 'Moonlight Hunter of the Dragon', 1, '14', '5', 2, '', '0'),
(153, 'Void of the Wings', 4, '15', '0', 9, '', '0'),
(154, 'Eye of the Storm', 4, '15', '8,10,17', 6, '', '0'),
(155, 'Shadow Evil of the Book', 5, '15', '0', 3, '', '0'),
(156, 'Golden Knight of the Guardian Greatsword', 1, '15', '2,20', 5, '', '0'),
(157, 'Shadow Dead of the Robe Abyss', 2, '15', '0', 3, '', '0'),
(158, 'Death of Soul Ender the Spear', 1, '15', '9', 5, '', '0'),
(159, 'Heavy Crimson Blood of the Knight Dead', 1, '15', '11', 1, '', '0'),
(160, 'Thunder True Blade', 1, '15', '10', 2, '', '0'),
(161, 'Devilangel Hood', 3, '15', '0', 3, '', '0'),
(162, 'Crown of the Deep Mana', 3, '15', '0', 3, '', '0'),
(163, 'True Archangel Wings', 4, '15', '15', 3, '', '0'),
(164, 'Soul of Abyss', 1, '16', '0', 3, '', '0'),
(165, 'Halo of Radiance', 3, '16', '0', 8, '', '0'),
(166, 'Bell of Light', 5, '16', '2,15,20', 10, '', '0'),
(167, 'Heaven Knight Plates', 2, '16', '2', 10, '', '0'),
(168, 'Bloodsoul Plates', 2, '16', '3', 5, '', '0'),
(169, 'Vampiric King of the Crimson Star Greatsword', 1, '16', '3', 5, '', '0'),
(170, 'Cosmic Chaos of Orb', 5, '16', '0', 1, '', '0'),
(171, 'Bone Lord of the Death Armor', 2, '16', '0', 2, '', '0'),
(172, 'Frost Wings of Nightmare', 4, '16', '7', 3, '', '0'),
(173, 'Wings of the Deep Shadow', 4, '16', '11', 1, '', '0'),
(174, 'Wings of Eternal Phoenix', 4, '16', '4,8', 2, '', '0'),
(175, 'Shadow Soul of the Dead', 1, '17', '11,20,21', 10, '', '0'),
(176, 'Fire and Frost God of the Claws Nightmare', 1, '17', '4,8', 2, '', '0'),
(177, 'Ring of the Reaper', 5, '17', '0', 2, '', '0'),
(178, 'Triple Abyss of the Reaper Lord', 1, '17', '12', 2, '', '0'),
(179, 'Dead of the Deep Darkness', 5, '17', '16', 3, '', '0'),
(180, 'Demonblood of the Crimson Armor Lord', 2, '17', '0', 2, '', '0'),
(181, 'Hellfire the Bow of Fury Lord', 1, '17', '6', 2, '', '0'),
(182, 'Eternal Orb the Electricity Lord', 1, '17', '17', 7, '', '0'),
(183, 'Hellshard Plates of Fury', 2, '17', '11', 1, '', '0'),
(184, 'Soul of Deep Abyss', 1, '17', '16', 3, '', '0'),
(185, 'Grove Strength of the Lord Helm', 3, '17', '0', 10, '', '0'),
(186, 'Blood Fury of the Lord Headwear Dead', 3, '18', '0', 2, '', '0'),
(187, 'Orb of Fire/Frost Lord', 5, '18', '0', 4, '', '0'),
(188, 'Bloodstorm', 4, '18', '3,11', 5, '', '0'),
(189, 'Death Lord of the Sacrifice Armor', 2, '18', '0', 2, '', '0'),
(190, 'Vampiric King the Robe of Sacrifice', 2, '18', '0', 3, '', '0'),
(191, 'Fury True God of Eye the Abyss', 3, '18', '0', 2, '', '0'),
(192, 'Dragonbone God Lord of Dagger', 1, '18', '0', 2, '', '0'),
(193, 'Deathbone Lord of the Reaper Armor', 2, '18', '12', 2, '', '0'),
(194, 'Ring of Deep the Flame King Wings', 4, '18', '0', 4, '', '0'),
(195, 'Crown the True Mana of Crystal', 3, '18', '0', 3, '', '0'),
(196, 'Angel of Death the Hood Lord', 3, '18', '0', 3, '', '0'),
(197, 'Guardian Wings', 4, '19', '2,20', 5, '', '0'),
(198, 'Frost Wings of Nightmare Robe', 2, '19', '7', 3, '', '0'),
(199, 'Lord Sakura of the True Katana', 1, '19', '1', 9, '', '0'),
(200, 'Lord Abyss of the True Katana', 1, '19', '13', 6, '', '0'),
(201, 'Heart of the Deep Void', 4, '19', '0', 7, '', '0'),
(202, 'Deathlord of Soul Ender the Spear', 1, '19', '9', 5, '', '0'),
(203, 'Acrane of the Eye Lord', 5, '19', '16', 11, '', '0'),
(204, 'Plates of Fury Guardian', 2, '19', '0', 4, '', '0'),
(205, 'Soul of Hell Abyss', 1, '19', '16', 3, '', '0'),
(206, 'Eternal Orb the Electricity God', 1, '19', '17', 3, '', '0'),
(207, 'Plates of Lightning Lord', 2, '19', '0', 4, '', '0'),
(208, 'Knight of the Wraithlord', 3, '19', '0', 8, '', '0'),
(209, 'Blood Plates', 2, '1', '0', 10, '', '0'),
(210, 'Bloodstone Plates', 2, '1', '0', 10, '', '0'),
(211, 'Ring of Darkness', 5, '1', '0', 3, '', '0'),
(212, 'Ring of Eye Darkness', 5, '1', '0', 3, '', '0'),
(213, 'Blood', 4, 'Second', '0', 7, '', '0'),
(217, 'Potion of Blood', 0, '0', '0', 0, '', 'Deadlord(Undead)'),
(218, 'Firelord Shield', 0, '0', '0', 0, '', 'Hellstone Golem (Volcanic Lands) - 5%'),
(219, 'Earth Shield', 0, '0', '0', 0, '', 'Giant Rock Golem (Mines Underground) - 10%'),
(220, 'Potion of Fire', 0, '0', '0', 0, '', 'Hellstone Golem (Volcanic Lands) - 5%'),
(221, 'Frost Knight of Greatsword', 1, '0', '0', 0, '', 'Polar Furbolg Lord (Snowland)'),
(222, 'Death of Frost', 5, '0', '0', 0, '', 'Polar Furbolg Lord (Snowland)'),
(223, 'Blade Harpoon', 1, '0', '0', 0, '', 'Mulgul Command (DeepSea) - 50%'),
(224, 'Mulgul Head', 3, '0', '0', 0, '', 'Mulgul Command (DeepSea) - 25%'),
(225, 'Sea Boots', 4, '0', '0', 0, '', 'Mulgul Command (DeepSea) - 10%'),
(226, 'Water Armor', 2, '0', '0', 0, '', 'Waterlord Elemental - 50%'),
(227, 'Fire Necklace', 5, '0', '0', 0, '', 'Hellstone Golem (Volcanic Lands) - 18.5%'),
(228, 'Vampire Greatsword', 1, '0', '0', 0, '', 'Vampiric Lord - 18.5%'),
(229, 'Fragment of Final Toxin', 7, 'The Captain', '0', 0, '', '0'),
(230, 'Fragment of Final Deep Sea', 7, 'The Captain', '0', 0, '', '0'),
(231, 'Plate of Steel Health', 2, '0', '0', 0, '', 'Giant Rock Golem (Mines Underground) - 30%'),
(232, 'Armor of Steel Lord', 2, '0', '0', 0, '', 'Skeletal Lord - 30%'),
(233, 'Hellfire Helmet', 3, '0', '0', 0, '', 'Hellstone Golem (Volcanic Lands)'),
(234, 'Vampire Sword', 1, '0', '0', 0, '', 'Vampiric Lord - 18.5%'),
(235, 'Skeletal Axe', 1, '0', '0', 0, '', 'Skeletal Lord - 30%'),
(236, 'Water Gloves', 1, '0', '0', 0, '', 'Deeplord Revenant -8.5%'),
(237, 'Revenant Crown', 3, '0', '0', 0, '', 'Deeplord Revenant - 8.5%'),
(238, 'Firelord Necklace', 5, '0', '0', 0, '', 'Firelord Dragon - 10%'),
(239, 'Book', 5, '0', '0', 0, '', 'Deeplord Revenant - 5%'),
(240, 'Water True Armor', 2, '0', '0', 0, '', 'Deeplord Revenant (DeepSea)'),
(241, 'Fireshard Helmet', 3, '0', '0', 0, '', 'Firelord Dragon - 10%'),
(242, 'Corruption Robe', 2, '0', '0', 0, '', 'Deeplord Revenant - 8.5%'),
(243, 'Undead Bow', 1, '0', '0', 0, '', 'Vampiric Lord - 18.5%'),
(244, 'Fire Rifle', 1, '0', '0', 0, '', 'Hellstone Golem (Volcanic Lands)'),
(245, 'Greatsword of Frostlord', 1, '0', '0', 0, '', 'Frostlord Overlord - 9%'),
(246, 'Staff of Frost Overlord', 1, '0', '0', 0, '', 'Frostlord Overlord - 9%'),
(248, 'Judgment Halo', 3, '0', '0', 0, '', 'Judgment - 5.5%'),
(249, 'Potion of Holy Light', 0, '0', '0', 0, '', 'Judgment - 5.5%'),
(250, 'Sword of the Wraith Lord', 1, '0', '0', 0, '', 'Wraith Lord - 5.5%'),
(251, 'Frostlord Ring', 5, '0', '0', 0, '', 'Frostlord Overlord - 9%'),
(252, 'Holy Armor', 2, '0', '0', 0, '', 'Judgment - 5.5%'),
(253, 'Holy Greatsword', 1, '0', '0', 0, '', 'Judgment - 5.5%'),
(254, 'Scythe of Nature', 1, '0', '0', 0, '', 'Ancient Ent - 6.6%'),
(255, 'Ancient Forest of Spear', 1, '0', '9', 0, '', 'Elite Genesaur - 3%'),
(256, 'Elite Forest Crown', 3, '0', '0', 0, '', 'Elite Genesaur - 3%'),
(257, 'Master Magma of the Shield', 0, '0', '0', 0, '', 'Ancient Sea Turtle Flame - 0.5%'),
(258, 'Plate of Ancient', 2, '0', '0', 0, '', 'Elite Genesaur - 3%'),
(259, 'Necklane of Lightning', 5, '0', '0', 0, '', 'Electricity Lord - 0.88%'),
(260, 'Pure Chaos of the Accessory', 5, '0', '0', 0, '', 'Elite Infernal - 0.9%'),
(261, 'Ring of Light', 5, '0', '0', 0, '', 'Judgment - 5.5%'),
(262, 'Divine Wings', 4, '0', '0', 0, '', 'Heaven Golem King - 0.75%'),
(263, 'Roots Greatsword of Protection', 1, '0', '0', 0, '', 'Corrupted Smoldering Treant - 2%'),
(264, 'Guardian Blade of the Heaven', 1, '0', '11', 0, '', 'Heaven Golem King - 0.9%'),
(265, 'The Wraith of the Hood Lord', 2, '0', '0', 0, '', 'Flame Lord of the Wraith - 1.1%'),
(266, 'Nightstalker of the Flame and Frost Ring', 5, '0', '0', 0, '', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.5%'),
(267, 'Dragonbone Dagger', 1, '0', '0', 0, '', 'Dragonbone God of the Reaper [3rd] - 0.33%'),
(268, 'Shadow Dagger', 1, '0', '0', 0, '', 'Shadow King Elemental - 1.5%'),
(269, 'Amashiro Natsuki Tier 5', 0, 'The Captain', '0', 7, '', '0'),
(270, 'Potion of Crimson Star', 0, '0', '0', 0, '', 'Vampiric King - 0.9%'),
(272, 'Amashiro Natsuki Tier 6', 0, 'The King', '0', 7, '', '0'),
(273, 'Rainbow Tier 1', 7, 'The Captain', '0', 0, '', '0'),
(274, 'Rainbow Tier 2', 7, 'The Captain', '0', 0, '', '0'),
(275, 'Rainbow Tier 3', 7, 'The Captain', '0', 0, '', '0'),
(276, 'Soul Book of Abyss', 5, '0', '16', 3, '', 'Shadow Phoenix of Abyss [4Th] - 0.44%');

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `N` int(11) NOT NULL,
  `name` text NOT NULL,
  `getM` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`N`, `name`, `getM`) VALUES
(1, 'Red Crystal', 'Polar Furbolg Lord(Snowlands) - 25%'),
(2, 'Blue Crystal', 'Polar Furbolg Lord(Snowlands) - 25%'),
(3, 'Emeralds', 'Polar Furbolg Lord(Snowlands) - 25%'),
(4, 'Spider Queen Web', 'Polar Furbolg Lord(Snowlands) - 25%'),
(5, 'Spider Queen Fang', 'Polar Furbolg Lord(Snowlands) - 25%'),
(6, 'Potion', 'Mulgul Command (DeepSea) - 25%'),
(7, 'Water', 'Waterlord Elemental - 50%'),
(8, 'Earth Sphere', 'Giant Rock Golem (Mines Underground) - 10%'),
(9, 'Rock', 'Giant Rock Golem (Mines Underground) - 20%'),
(10, 'Skeletal Head', 'Skeletal Lord - 30%'),
(11, 'Skeletal Death', 'Skeletal Lord -30%'),
(12, 'Fire Crystal Element', 'Hellstone Golem (Volcanic Lands)'),
(13, 'Lava Magic', 'Hellstone Golem (Volcanic Lands)'),
(14, 'Lava Rock', 'Hellstone Golem (Volcanic Lands)'),
(15, 'Vampiric Orb', 'Vampiric Lord'),
(16, 'Vampiric Batwings', 'Vampiric Lord'),
(17, 'Bloodstone', 'Vampiric Lord'),
(18, 'Hourglass', 'Vampiric Lord'),
(19, 'Stone of Sea', 'Deeplord Revenant - 10%'),
(20, 'Deeplord Water', 'Deeplord Revenant - 10%'),
(21, 'Firelord Egg', 'Firelord Dragon - 9%'),
(22, 'Eye of the Firelord', 'Firelord Dragon - 9%'),
(23, 'Essence of Icecrown', 'Frostlord Overlord - 8%'),
(24, 'Frozen', 'Frostlord Overlord - 8%'),
(25, 'Ice Crystal Element', 'Frostlord Overlord - 8%'),
(26, 'Icecrown Core', 'Frostlord Overlord - 8%'),
(27, 'Sphere Nature', 'Ancient Ent - 6%'),
(28, 'Orb of Nature', 'Ancient Ent - 6%'),
(29, 'Mana Spirit', 'Ancient Ent - 6%'),
(30, 'Earth Sphere', 'Ancient Ent - 6%'),
(31, 'Ancient Nature', 'Ancient Ent - 6%'),
(32, 'Wisp', 'Ancient Ent - 6%'),
(33, 'Fragment of God Nature', 'Ancient Ent - 0.5%, Elite Infernal - 5%'),
(34, 'Ancient Light', 'Judgment - 5.15%'),
(35, 'Essence of Light', 'Judgment - 5.15%'),
(36, 'Dark Matter', 'Wraith Lord - 5%'),
(37, 'Dark Haunter', 'Wraith Lord - 5%'),
(38, 'Fragment of Broken Darkness', 'Wraith Lord - 5%'),
(39, 'Katana Broken', 'Wraith Lord - 10%'),
(40, 'Dark Forest', 'Elite Genesaur - 3%'),
(41, 'Forest Amulet', 'Elite Genesaur - 3%'),
(42, 'Faith Angel', 'Commander 1st - 5%, 2nd - 10%'),
(43, 'Essence of Elite Light', 'Commander 1st - 5%, 2nd - 10%'),
(44, 'Holy Scriptures', 'Commander 1st - 5%, 2nd - 10%'),
(45, 'Essence of Magma', 'Ancient Sea Turtle Flame - 1.8%'),
(46, 'Magma Carapace', 'Ancient Sea Turtle Flame - 1.8%'),
(47, 'Orb of Faeries', 'Ancient Sea Turtle Flame - 1.8%'),
(48, 'Orb of the Magma', 'Ancient Sea Turtle Flame - 1.8%'),
(49, 'Pure Orb of Chaos', 'Elite Infernal - 1%'),
(50, 'EvilLord Chaos', 'Elite Infernal - 1%'),
(51, 'Orb of the Pure Evil', 'Elite Infernal - 1%'),
(53, 'Fragment of Final Chaos', 'Elite Infernal - 0.15%, Corrupted Smoldering Treant - 1%'),
(54, 'Essence of Flame', 'Flame Lord of the Wraith - 0.99%'),
(55, 'Flame Soul', 'Flame Lord of the Wraith - 0.99%'),
(56, 'Flame Spirit', 'Flame Lord of the Wraith - 0.99%'),
(57, 'Fragment of Final Flame', 'Flame Lord of the Wraith - 0.15%, Corrupted Smoldering Treant - 1%'),
(58, 'Thunder of God', 'Electricity Lord - 0.75%, Older Electricity (Electricity Lord Summon) - 0.225%'),
(59, 'Rune Electricity', 'Electricity Lord - 0.75%, Older Electricity (Electricity Lord Summon) - 0.225%'),
(60, 'Orb of Electricity', 'Electricity Lord - 0.75%, Older Electricity (Electricity Lord Summon) - 0.225%'),
(61, 'Energy Electricity', 'Electricity Lord - 0.75%, Older Electricity (Electricity Lord Summon) - 0.225%'),
(62, 'Electricity Lord of Heart', 'Electricity Lord - 0.75%, Older Electricity (Electricity Lord Summon) - 0.225%'),
(63, 'Storm Essence Broken', 'Electricity Lord - 0.75%, Older Electricity (Electricity Lord Summon) - 0.225%'),
(64, 'Fragment of Final Electricity', 'Electricity Lord - 0.5%, Older Electricity (Electricity Lord Summon) - 0.15%, Corrupted Smoldering Treant - 1%'),
(66, 'Corrupted Flame Forest', 'Corrupted Smoldering Treant - 1%'),
(67, 'Corrupted Seed', 'Corrupted Smoldering Treant - 1%'),
(68, 'Corrupted Thorns', 'Corrupted Smoldering Treant - 1%'),
(69, 'Essence of Corruption', 'Corrupted Smoldering Treant - 1%'),
(70, 'Fragment of Final Corruption', 'Corrupted Smoldering Treant - 0.15%'),
(71, 'Essence of Divine Light', 'Heaven Golem King - 0.9%'),
(72, 'Energy Divine', 'Heaven Golem King - 0.9%'),
(73, 'Chaos of Divine Light', 'Heaven Golem King - 0.9%'),
(74, 'Fragment of Final Divine', 'Heaven Golem King - 0.5%'),
(75, 'Deep Sea Sapphire', 'Giant Dragon Turtle Lord - 0.75%'),
(76, 'Orb of Deep Sea', 'Giant Dragon Turtle Lord - 0.75%'),
(77, 'Turtle Lord Scale', 'Giant Dragon Turtle Lord - 0.75%'),
(78, 'Fragment of Final Water', 'Giant Dragon Turtle Lord - 0.5%'),
(79, 'Fragment of the Final Deep Sea Broken', 'Giant Dragon Turtle Lord - 1%'),
(80, 'Essence of Blood', 'Vampiric King - 0.75%'),
(81, 'Crimson Rose', 'Vampiric King - 0.75%'),
(82, 'Vampiric King Book', 'Vampiric King - 0.75%'),
(83, 'Fragment of Final Blood', 'Vampiric King - 0.5%'),
(84, 'Rainbow Tier 1', 'Vampiric King - 1%, Shadow King Elemental - 1%, Respawns Endgame God of the Elemental Lord - 5%, Corrupted Ancient of the Moon - 1%, craft'),
(85, 'Rainbow Tier 2', 'Vampiric King - 0.5%, Shadow King Elemental - 0.5%, Respawn Endgame God of the Elemental Lord - 2.5%, Corrupted Ancient of the Moon - 0.5%, craft'),
(86, 'Orb of Shadow', 'Shadow King Elemental - 2.2%'),
(87, 'Fragment of Chaos', 'Shadow King Elemental - 2.2%, Shadow Phoenix of Abyss [4Th] - 2%'),
(88, 'Fragment of Final Shadow', 'Shadow King Elemental - 2.2%'),
(89, 'Fragment1', 'God of the Elemental Lord - 10%'),
(90, 'Fragment2', 'God of the Elemental Lord - 5%'),
(91, 'Fragment3', 'God of the Elemental Lord - 2.5%'),
(92, 'Shadow of the Moon', 'Corrupted Ancient of the Moon - 1%'),
(93, 'Void of the Moon', 'Corrupted Ancient of the Moon - 1%'),
(94, 'Corrupted of the Moonlight', 'Corrupted Ancient of the Moon - 1%'),
(95, 'Orb of True Shadow', 'Corrupted Ancient of the Moon - 1%'),
(96, 'Fragment of Final True Forest', 'Corrupted Ancient of the Moon - 0.15%'),
(97, 'Fragment of the Final Toxin Broken', 'Corrupted Ancient of the Moon - 1%'),
(98, 'Deep Frozen', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(99, 'Orb of True Flame Wings', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(100, 'Orb of Core Frost Clash', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(101, 'Orb of the Flame/Frost Wings', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(103, 'Heartfrost', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(104, 'Orb of Chaos the Flame Wings', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(105, 'Token of Flame Wings of Nightmare', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.5%'),
(106, 'Token of Frost Wings of Nightmare', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.5%'),
(107, 'Orb of True Abyss', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(108, 'Essence of Dark Storm', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(109, 'Essence of Abyss', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(110, 'Soul Abyss', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(111, 'Spirit of Abyss', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(112, 'Soul of Death', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(113, 'Moon of the Abyss', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(114, 'Abyss of Matter', 'Shadow Phoenix of Abyss [4Th] - 0.66%'),
(115, 'Token of Shadow Phoenix of Abyss', 'Shadow Phoenix of Abyss [4Th] - 0.5%'),
(116, 'Rainbow Tier 3', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.5%, Shadow Phoenix of Abyss [4Th] - 0.5%, Dragonbone God of the Reaper [3rd] - 1%, Volt of the Electricity God [2nd] - 1%, Spirit of Electrcity Volt Boss Summon - 0.15%, craft'),
(117, 'Dragonbone Skull', 'Dragonbone God of the Reaper [3rd] - 0.55%'),
(118, 'Fragment of Deep Chaos', 'Dragonbone God of the Reaper [3rd] - 0.55%'),
(119, 'Token of Dragonbone Heart', 'Dragonbone God of the Reaper [3rd] - 0.5%'),
(120, 'Steel of Electricity God', 'Volt of the Electricity God [2nd] - 0.75%, Spirit of Electrcity Volt Boss Summon - 0,001125%'),
(121, 'Essence of Electricity God', 'Volt of the Electricity God [2nd] - 0.75%, Spirit of Electrcity Volt Boss Summon - 0,001125%'),
(122, 'Spirit of Electricity', 'Volt of the Electricity God [2nd] - 0.75%, Spirit of Electrcity Volt Boss Summon - 0,1125%'),
(123, 'Token of the Volt of the Electricity God', 'Volt of the Electricity God [2nd] - 0.5%, Spirit of Electrcity Volt Boss Summon - 0,0225%'),
(127, 'Firelord Wings', 'Firelord Dragon - 9%'),
(128, 'Deep Freezing', 'Flame Wings of Nightmare/Frost Wings of Nightmare (Endgame) [5Th] - 0.99%'),
(229, 'Fragment of Final Toxin', ''),
(230, 'Fragment of Final Deep Sea', '');

-- --------------------------------------------------------

--
-- Структура таблицы `parameters`
--

CREATE TABLE `parameters` (
  `N` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `parameters`
--

INSERT INTO `parameters` (`N`, `name`) VALUES
(1, 'STR'),
(2, 'AGI'),
(3, 'INT'),
(4, 'Damage'),
(5, 'Attack Speed'),
(6, 'Armor'),
(7, 'Health'),
(8, 'All Stats'),
(9, 'Passive: Venom\r\n'),
(10, 'Movement Speed'),
(11, 'STR/AGI'),
(12, 'STR/INT'),
(13, 'AGI/INT'),
(14, 'Critical Chance'),
(15, 'Life Regeneration'),
(16, 'STR+AGI'),
(17, 'STR+INT'),
(18, 'AGI+INT'),
(19, 'Heal'),
(20, 'Healing Regeneration');

-- --------------------------------------------------------

--
-- Структура таблицы `recipes`
--

CREATE TABLE `recipes` (
  `N` int(11) NOT NULL,
  `link` int(11) NOT NULL,
  `item1` int(11) NOT NULL DEFAULT 0,
  `item2` int(11) NOT NULL DEFAULT 0,
  `item3` int(11) NOT NULL DEFAULT 0,
  `item4` int(11) NOT NULL DEFAULT 0,
  `item5` int(11) NOT NULL DEFAULT 0,
  `mat1` int(11) NOT NULL DEFAULT 0,
  `mat2` int(11) NOT NULL DEFAULT 0,
  `mat3` int(11) NOT NULL DEFAULT 0,
  `mat4` int(11) NOT NULL DEFAULT 0,
  `mat5` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `recipes`
--

INSERT INTO `recipes` (`N`, `link`, `item1`, `item2`, `item3`, `item4`, `item5`, `mat1`, `mat2`, `mat3`, `mat4`, `mat5`) VALUES
(1, 1, 217, 0, 0, 0, 0, 1, 2, 3, 5, 0),
(2, 2, 1, 218, 219, 220, 0, 15, 0, 0, 0, 0),
(3, 3, 221, 0, 0, 0, 0, 2, 3, 4, 0, 0),
(4, 4, 222, 0, 0, 0, 0, 1, 2, 3, 5, 0),
(5, 5, 225, 0, 0, 0, 0, 4, 6, 7, 0, 0),
(6, 6, 217, 222, 0, 0, 0, 5, 7, 0, 0, 0),
(7, 7, 224, 0, 0, 0, 0, 2, 6, 7, 0, 0),
(8, 8, 3, 223, 0, 0, 0, 4, 6, 7, 0, 0),
(9, 9, 7, 0, 0, 0, 0, 1, 2, 8, 10, 0),
(10, 10, 8, 0, 0, 0, 0, 8, 9, 11, 0, 0),
(11, 11, 10, 0, 0, 0, 0, 10, 12, 16, 0, 0),
(12, 22, 231, 219, 0, 0, 0, 9, 11, 16, 0, 0),
(13, 23, 232, 218, 0, 0, 0, 11, 14, 16, 0, 0),
(14, 24, 9, 233, 234, 0, 0, 10, 12, 0, 0, 0),
(15, 25, 23, 226, 0, 0, 0, 8, 11, 19, 0, 0),
(16, 26, 11, 0, 0, 0, 0, 8, 11, 19, 20, 0),
(17, 27, 5, 0, 0, 0, 0, 8, 11, 19, 20, 0),
(18, 28, 228, 235, 0, 0, 0, 18, 21, 14, 0, 0),
(19, 29, 11, 236, 0, 0, 0, 18, 127, 14, 0, 0),
(20, 30, 9, 237, 0, 0, 0, 22, 13, 14, 0, 0),
(21, 33, 227, 238, 0, 0, 0, 21, 22, 12, 0, 0),
(22, 32, 239, 238, 0, 0, 0, 12, 21, 22, 0, 0),
(23, 31, 22, 240, 0, 0, 0, 12, 21, 14, 0, 0),
(24, 34, 28, 0, 0, 0, 0, 23, 24, 25, 0, 0),
(25, 35, 26, 0, 0, 0, 0, 14, 21, 23, 0, 0),
(26, 36, 27, 0, 0, 0, 0, 26, 25, 23, 0, 0),
(27, 37, 30, 241, 32, 0, 0, 26, 25, 0, 0, 0),
(28, 38, 242, 0, 0, 0, 0, 24, 25, 26, 0, 0),
(29, 39, 243, 0, 0, 0, 0, 28, 27, 31, 23, 0),
(30, 40, 244, 0, 0, 0, 0, 28, 27, 31, 23, 0),
(31, 41, 34, 0, 0, 0, 0, 28, 27, 31, 23, 0),
(32, 42, 245, 0, 0, 0, 0, 28, 27, 31, 23, 0),
(33, 43, 35, 0, 0, 0, 0, 28, 27, 31, 23, 0),
(34, 44, 246, 0, 0, 0, 0, 28, 32, 31, 23, 0),
(35, 45, 29, 0, 0, 0, 0, 23, 28, 27, 31, 0),
(36, 46, 36, 0, 0, 0, 0, 31, 34, 35, 0, 0),
(37, 47, 37, 0, 0, 0, 0, 35, 22, 29, 0, 0),
(38, 48, 248, 0, 0, 0, 0, 35, 34, 33, 0, 0),
(39, 49, 38, 0, 0, 0, 0, 36, 37, 34, 0, 0),
(40, 50, 2, 249, 250, 0, 0, 33, 38, 0, 0, 0),
(41, 51, 33, 251, 0, 0, 0, 36, 37, 0, 0, 0),
(42, 52, 252, 0, 0, 0, 0, 36, 37, 33, 0, 0),
(43, 53, 252, 0, 0, 0, 0, 36, 37, 35, 0, 0),
(44, 54, 41, 42, 253, 254, 0, 33, 0, 0, 0, 0),
(45, 55, 45, 0, 0, 0, 0, 40, 41, 33, 0, 0),
(46, 56, 41, 253, 0, 0, 0, 40, 41, 39, 0, 0),
(47, 57, 255, 228, 0, 0, 0, 40, 41, 0, 0, 0),
(48, 58, 44, 0, 0, 0, 0, 22, 21, 41, 0, 0),
(49, 59, 43, 0, 0, 0, 0, 40, 41, 33, 0, 0),
(50, 60, 40, 0, 0, 0, 0, 36, 37, 38, 0, 0),
(51, 61, 46, 0, 0, 0, 0, 40, 41, 8, 0, 0),
(52, 62, 46, 0, 0, 0, 0, 40, 41, 16, 0, 0),
(53, 63, 52, 0, 0, 0, 0, 40, 41, 33, 0, 0),
(54, 64, 31, 53, 0, 0, 0, 23, 24, 33, 0, 0),
(55, 67, 51, 0, 0, 0, 0, 43, 18, 38, 0, 0),
(56, 69, 57, 228, 0, 0, 0, 15, 35, 0, 0, 0),
(57, 68, 256, 0, 0, 0, 0, 43, 42, 44, 10, 0),
(58, 65, 256, 0, 0, 0, 0, 23, 40, 26, 0, 0),
(59, 66, 49, 0, 0, 0, 0, 40, 41, 3, 0, 0),
(60, 70, 254, 0, 0, 0, 0, 36, 37, 41, 11, 0),
(61, 71, 39, 0, 0, 0, 0, 11, 36, 37, 41, 0),
(62, 72, 46, 0, 0, 0, 0, 41, 29, 35, 0, 0),
(63, 73, 51, 0, 0, 0, 0, 15, 13, 43, 0, 0),
(64, 74, 32, 0, 0, 0, 0, 20, 22, 29, 43, 0),
(65, 75, 63, 0, 0, 0, 0, 40, 41, 0, 0, 0),
(66, 76, 256, 0, 0, 0, 0, 23, 42, 24, 25, 0),
(67, 77, 57, 228, 0, 0, 0, 15, 37, 40, 0, 0),
(68, 78, 50, 257, 0, 0, 0, 84, 72, 73, 0, 0),
(69, 79, 54, 41, 0, 0, 0, 50, 49, 53, 0, 0),
(70, 80, 55, 0, 0, 0, 0, 49, 50, 0, 0, 0),
(71, 81, 58, 0, 0, 0, 0, 8, 41, 49, 0, 0),
(72, 82, 65, 0, 0, 0, 0, 50, 49, 127, 15, 0),
(73, 83, 76, 0, 0, 0, 0, 49, 23, 24, 29, 0),
(74, 84, 258, 0, 0, 0, 0, 41, 8, 50, 33, 0),
(75, 85, 66, 0, 0, 0, 0, 28, 29, 50, 33, 0),
(76, 86, 48, 0, 0, 0, 0, 49, 51, 50, 0, 0),
(77, 87, 56, 0, 0, 0, 0, 43, 38, 53, 51, 0),
(78, 88, 0, 0, 0, 0, 0, 127, 21, 13, 53, 0),
(79, 89, 54, 0, 0, 0, 0, 45, 13, 47, 22, 0),
(80, 90, 29, 0, 0, 0, 0, 45, 48, 12, 14, 0),
(81, 91, 59, 0, 0, 0, 0, 43, 42, 54, 53, 0),
(82, 92, 60, 0, 0, 0, 0, 55, 54, 57, 0, 0),
(83, 93, 255, 0, 0, 0, 0, 54, 45, 56, 0, 0),
(84, 94, 72, 0, 0, 0, 0, 56, 54, 57, 127, 0),
(85, 95, 82, 0, 0, 0, 0, 45, 55, 46, 53, 0),
(86, 96, 75, 0, 0, 0, 0, 45, 55, 46, 53, 0),
(87, 97, 86, 0, 0, 0, 0, 45, 48, 46, 57, 0),
(88, 98, 59, 0, 0, 0, 0, 62, 60, 47, 64, 0),
(89, 99, 259, 260, 0, 0, 0, 63, 0, 0, 0, 0),
(90, 100, 81, 0, 0, 0, 0, 43, 55, 61, 57, 0),
(91, 101, 73, 259, 260, 0, 0, 48, 57, 0, 0, 0),
(92, 102, 67, 260, 0, 0, 0, 57, 64, 53, 0, 0),
(93, 103, 69, 79, 0, 0, 0, 53, 57, 64, 0, 0),
(94, 104, 46, 0, 0, 0, 0, 43, 42, 44, 57, 0),
(95, 105, 36, 0, 0, 0, 0, 36, 37, 54, 53, 0),
(96, 106, 80, 0, 0, 0, 0, 36, 66, 38, 87, 0),
(97, 107, 68, 0, 0, 0, 0, 69, 56, 61, 38, 0),
(98, 108, 105, 0, 0, 0, 0, 69, 54, 38, 70, 0),
(99, 109, 261, 0, 0, 0, 0, 43, 46, 47, 58, 0),
(100, 110, 61, 88, 0, 0, 0, 66, 54, 57, 0, 0),
(101, 111, 95, 0, 0, 0, 0, 69, 0, 0, 0, 0),
(102, 112, 96, 0, 0, 0, 0, 47, 68, 59, 70, 0),
(103, 113, 96, 0, 0, 0, 0, 17, 67, 46, 70, 0),
(104, 114, 104, 262, 0, 0, 0, 72, 74, 71, 0, 0),
(105, 115, 74, 0, 0, 0, 0, 53, 57, 64, 74, 0),
(106, 116, 89, 263, 264, 0, 0, 71, 72, 0, 0, 0),
(107, 117, 90, 0, 0, 0, 0, 46, 73, 57, 0, 0),
(108, 118, 97, 0, 0, 0, 0, 71, 58, 74, 0, 0),
(109, 119, 64, 0, 0, 0, 0, 73, 69, 36, 84, 0),
(110, 120, 61, 0, 0, 0, 0, 72, 61, 58, 64, 0),
(111, 121, 79, 264, 0, 0, 0, 76, 75, 78, 0, 0),
(112, 122, 100, 0, 0, 0, 0, 76, 84, 74, 78, 0),
(113, 123, 84, 0, 0, 0, 0, 76, 71, 73, 78, 0),
(114, 124, 96, 0, 0, 0, 0, 76, 75, 84, 78, 0),
(115, 125, 70, 0, 0, 0, 0, 11, 73, 38, 70, 0),
(116, 126, 101, 0, 0, 0, 0, 80, 76, 0, 0, 0),
(117, 127, 115, 0, 0, 0, 0, 84, 83, 82, 0, 0),
(118, 128, 113, 0, 0, 0, 0, 80, 75, 1, 2, 0),
(119, 129, 262, 0, 0, 0, 0, 71, 42, 74, 70, 0),
(120, 130, 85, 0, 0, 0, 0, 80, 83, 29, 32, 0),
(121, 131, 71, 0, 0, 0, 0, 71, 54, 56, 0, 0),
(122, 132, 57, 0, 0, 0, 0, 80, 75, 29, 0, 0),
(123, 133, 61, 88, 0, 0, 0, 75, 24, 25, 0, 0),
(124, 134, 91, 0, 0, 0, 0, 80, 69, 68, 83, 0),
(125, 135, 111, 0, 0, 0, 0, 36, 80, 48, 49, 0),
(126, 136, 112, 0, 0, 0, 0, 69, 81, 75, 49, 0),
(127, 137, 106, 117, 0, 0, 0, 80, 83, 84, 0, 0),
(128, 138, 83, 265, 0, 0, 0, 75, 24, 84, 0, 0),
(129, 139, 83, 265, 0, 0, 0, 75, 71, 44, 0, 0),
(130, 140, 109, 0, 0, 0, 0, 71, 74, 81, 84, 0),
(131, 141, 133, 0, 0, 0, 0, 76, 75, 24, 84, 0),
(132, 142, 123, 0, 0, 0, 0, 71, 75, 77, 83, 0),
(133, 143, 102, 0, 0, 0, 0, 86, 51, 38, 5, 0),
(134, 144, 108, 0, 0, 0, 0, 86, 87, 84, 88, 0),
(135, 145, 107, 76, 0, 0, 0, 88, 80, 116, 0, 0),
(136, 146, 118, 0, 0, 0, 0, 53, 87, 84, 0, 0),
(137, 147, 135, 0, 0, 0, 0, 88, 87, 56, 84, 0),
(138, 148, 119, 0, 0, 0, 0, 87, 80, 84, 85, 0),
(139, 149, 110, 101, 0, 0, 0, 87, 84, 85, 0, 0),
(140, 150, 126, 0, 0, 0, 0, 92, 94, 95, 96, 0),
(141, 151, 87, 0, 0, 0, 0, 96, 53, 87, 85, 0),
(142, 152, 92, 0, 0, 0, 0, 96, 88, 87, 85, 0),
(143, 153, 141, 0, 0, 0, 0, 93, 95, 85, 88, 0),
(144, 154, 120, 0, 0, 0, 0, 62, 59, 95, 85, 0),
(145, 155, 127, 0, 0, 0, 0, 95, 88, 85, 96, 0),
(146, 156, 116, 0, 0, 0, 0, 93, 71, 34, 85, 0),
(147, 157, 130, 0, 0, 0, 0, 94, 88, 84, 85, 0),
(148, 158, 93, 0, 0, 0, 0, 92, 95, 88, 85, 0),
(149, 159, 103, 0, 0, 0, 0, 94, 81, 83, 85, 0),
(150, 160, 98, 0, 0, 0, 0, 92, 58, 59, 85, 0),
(151, 161, 139, 0, 0, 0, 0, 94, 86, 69, 116, 0),
(152, 162, 107, 0, 0, 0, 0, 32, 29, 116, 229, 0),
(153, 163, 114, 129, 0, 0, 0, 71, 72, 116, 0, 0),
(154, 164, 122, 0, 0, 0, 0, 95, 92, 85, 230, 0),
(155, 165, 146, 0, 0, 0, 0, 71, 86, 74, 116, 0),
(156, 166, 140, 0, 0, 0, 0, 71, 74, 72, 116, 0),
(157, 167, 142, 0, 0, 0, 0, 71, 77, 116, 230, 0),
(158, 168, 210, 0, 0, 0, 0, 81, 80, 83, 116, 0),
(159, 169, 132, 0, 0, 0, 0, 80, 81, 116, 0, 0),
(160, 170, 102, 150, 0, 0, 0, 104, 99, 116, 0, 0),
(161, 171, 136, 0, 0, 0, 0, 101, 11, 116, 229, 0),
(162, 172, 94, 0, 0, 0, 0, 128, 103, 100, 116, 0),
(163, 173, 144, 0, 0, 0, 0, 128, 88, 95, 116, 0),
(164, 174, 149, 0, 0, 0, 0, 104, 99, 57, 116, 0),
(165, 175, 103, 156, 0, 0, 0, 100, 88, 116, 0, 0),
(166, 176, 137, 0, 0, 0, 0, 101, 104, 100, 116, 0),
(167, 177, 102, 150, 0, 0, 0, 112, 87, 116, 0, 0),
(168, 178, 125, 0, 0, 0, 0, 112, 113, 95, 116, 0),
(169, 179, 212, 155, 0, 0, 0, 114, 109, 87, 0, 0),
(170, 180, 128, 0, 0, 0, 0, 80, 81, 110, 116, 0),
(171, 181, 131, 0, 0, 0, 0, 104, 99, 110, 116, 0),
(172, 182, 0, 0, 0, 0, 0, 60, 59, 108, 109, 116),
(173, 183, 119, 0, 0, 0, 0, 109, 99, 104, 116, 0),
(174, 183, 148, 0, 0, 0, 0, 109, 99, 104, 116, 0),
(175, 184, 164, 0, 0, 0, 0, 110, 95, 109, 116, 0),
(176, 185, 146, 0, 0, 0, 0, 112, 96, 116, 229, 0),
(177, 186, 135, 0, 0, 0, 0, 112, 108, 83, 116, 0),
(178, 187, 170, 177, 266, 0, 0, 105, 106, 0, 0, 0),
(179, 188, 213, 0, 0, 0, 0, 80, 108, 112, 115, 0),
(180, 189, 136, 0, 0, 0, 0, 108, 112, 87, 115, 0),
(181, 190, 130, 0, 0, 0, 0, 81, 83, 105, 106, 0),
(182, 191, 147, 0, 0, 0, 0, 114, 108, 87, 115, 0),
(183, 192, 134, 267, 268, 0, 0, 116, 119, 0, 0, 0),
(184, 193, 171, 0, 0, 0, 0, 119, 118, 116, 117, 0),
(185, 194, 150, 266, 0, 0, 0, 105, 118, 116, 0, 0),
(186, 195, 162, 0, 0, 0, 0, 75, 100, 119, 106, 0),
(187, 196, 161, 0, 0, 0, 0, 118, 109, 115, 116, 0),
(188, 197, 129, 0, 0, 0, 0, 74, 71, 115, 119, 0),
(189, 198, 130, 0, 0, 0, 0, 100, 128, 106, 116, 0),
(190, 199, 151, 0, 0, 0, 0, 115, 119, 111, 110, 0),
(191, 200, 151, 0, 0, 0, 0, 116, 119, 60, 75, 0),
(192, 201, 153, 0, 0, 0, 0, 115, 119, 92, 109, 0),
(193, 202, 158, 0, 0, 0, 0, 115, 119, 118, 29, 0),
(194, 203, 179, 0, 0, 0, 0, 115, 119, 109, 118, 0),
(195, 204, 124, 0, 0, 0, 0, 119, 75, 59, 116, 0),
(196, 205, 184, 0, 0, 0, 0, 104, 118, 115, 119, 0),
(197, 206, 182, 0, 0, 0, 0, 121, 120, 122, 123, 0),
(198, 207, 204, 0, 0, 0, 0, 123, 108, 121, 76, 0),
(199, 208, 165, 0, 0, 0, 0, 69, 120, 118, 119, 0),
(200, 209, 258, 0, 0, 0, 0, 17, 33, 29, 0, 0),
(201, 210, 209, 0, 0, 0, 0, 17, 54, 15, 0, 0),
(202, 211, 32, 261, 0, 0, 0, 36, 37, 49, 0, 0),
(203, 212, 211, 259, 0, 0, 0, 67, 75, 85, 0, 0),
(204, 213, 0, 0, 0, 0, 0, 16, 80, 81, 0, 0),
(205, 230, 0, 0, 0, 0, 0, 78, 74, 88, 79, 0),
(206, 229, 0, 0, 0, 0, 0, 96, 70, 33, 97, 0),
(207, 269, 270, 78, 78, 0, 0, 85, 116, 0, 0, 0),
(208, 273, 0, 0, 0, 0, 0, 53, 57, 64, 70, 74),
(209, 275, 0, 0, 0, 0, 0, 84, 85, 88, 229, 230),
(210, 274, 0, 0, 0, 0, 0, 84, 74, 78, 83, 88),
(211, 272, 269, 0, 0, 0, 0, 119, 105, 106, 115, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Battletypes`
--
ALTER TABLE `Battletypes`
  ADD PRIMARY KEY (`N`);

--
-- Индексы таблицы `heroes`
--
ALTER TABLE `heroes`
  ADD PRIMARY KEY (`N`);

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`N`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`N`);

--
-- Индексы таблицы `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`N`);

--
-- Индексы таблицы `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`N`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Battletypes`
--
ALTER TABLE `Battletypes`
  MODIFY `N` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `heroes`
--
ALTER TABLE `heroes`
  MODIFY `N` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `items`
--
ALTER TABLE `items`
  MODIFY `N` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `N` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT для таблицы `parameters`
--
ALTER TABLE `parameters`
  MODIFY `N` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `recipes`
--
ALTER TABLE `recipes`
  MODIFY `N` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
