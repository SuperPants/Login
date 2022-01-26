-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 26 jan 2022 om 15:40
-- Serverversie: 10.4.22-MariaDB
-- PHP-versie: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `remas_db`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `apparaten`
--

CREATE TABLE `apparaten` (
  `id` int(11) NOT NULL,
  `naam` varchar(40) NOT NULL,
  `omschrijving` varchar(200) DEFAULT NULL,
  `vergoeding` decimal(6,2) NOT NULL,
  `gewichtGram` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `apparaten`
--

INSERT INTO `apparaten` (`id`, `naam`, `omschrijving`, `vergoeding`, `gewichtGram`) VALUES
(1, 'Centrifuge', 'Losse centrifuge', '5.56', 25800),
(2, 'Centrifuge', 'Losse centrifuge', '5.00', 25800),
(3, 'Centrifuge', 'Losse centrifuge', '5.56', 25800),
(4, 'Desktop PC', 'Desktop pc zonderbeeldscherm', '7.60', 2250),
(5, 'Koffiezetapparaat', 'Koffiezetapparaat inclusief glazen kan', '2.22', 560),
(6, 'Toetsenbord', 'Los toetsenbord', '1.10', 200);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `innameapparaat`
--

CREATE TABLE `innameapparaat` (
  `id` int(11) NOT NULL,
  `inname_ID` int(11) NOT NULL,
  `apparaat_ID` int(11) NOT NULL,
  `ontleed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `innames`
--

CREATE TABLE `innames` (
  `id` int(11) NOT NULL,
  `medewerker_ID` int(11) NOT NULL,
  `tijdstip` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `innames`
--

INSERT INTO `innames` (`id`, `medewerker_ID`, `tijdstip`) VALUES
(1, 2, '2022-01-26 11:15:40'),
(2, 3, '2022-01-26 11:15:40'),
(3, 1, '2022-01-26 11:15:59'),
(4, 1, '2022-01-26 11:15:59'),
(5, 1, '2022-01-26 11:16:15'),
(6, 2, '2022-01-26 11:16:15');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `medewerkers`
--

CREATE TABLE `medewerkers` (
  `id` int(11) NOT NULL,
  `rol_ID` int(11) NOT NULL,
  `naam` varchar(40) NOT NULL,
  `wachtwoord` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `medewerkers`
--

INSERT INTO `medewerkers` (`id`, `rol_ID`, `naam`, `wachtwoord`, `email`) VALUES
(1, 1, 'admin', 'admin', 'Jos.Debet@emserveen.nl'),
(2, 2, 'algemeen', 'algemeen', 'Edgar.Credit@emserveen.nl'),
(3, 3, 'uitgifte', 'uitgifte', 'Pieter.Storms@emserveen.nl'),
(4, 4, 'verwerking', 'verwerking', 'Jannie.Heins@emserveen.nl'),
(5, 5, 'inname', 'inname', 'inname@emserveen.nl'),
(6, 6, 'ab', 'ab', 'ab@emserveen.nl');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdeelapparaat`
--

CREATE TABLE `onderdeelapparaat` (
  `id` int(11) NOT NULL,
  `onderdeel_ID` int(11) NOT NULL,
  `apparaat_ID` int(11) NOT NULL,
  `percentage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderdelen`
--

CREATE TABLE `onderdelen` (
  `id` int(11) NOT NULL,
  `naam` varchar(40) NOT NULL,
  `omschrijving` varchar(200) DEFAULT NULL,
  `voorraadKg` decimal(6,2) NOT NULL,
  `prijsPerKg` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `onderdelen`
--

INSERT INTO `onderdelen` (`id`, `naam`, `omschrijving`, `voorraadKg`, `prijsPerKg`) VALUES
(1, 'Behuizing algemeen', 'Ijzer, aluminium, plaatstaal', '138.69', '2.50'),
(2, 'Electromotoren', 'Zowel zwakstroom als 220/380 volt', '456.78', '7.89'),
(3, 'Glas', 'Glazen onderdelen zoals kannen, ruitjes', '10.59', '0.67'),
(4, 'Hout', 'Houten behuizing', '32.25', '0.01'),
(5, 'Kunststof isolatiemateriaal', 'Piepschuim, schuimrubber', '0.00', '0.05'),
(6, 'Plastic onderelen', 'Hard plastic', '0.00', '0.12'),
(7, 'Printplaat', 'Inclusief kleine componenten, zonder ventilator, koeling, voeding of stekkers', '467.35', '21.15'),
(8, 'Snoeren', 'Snoeren met stekker, koperen bedrading en koperen plaatmateriaal', '512.26', '25.31');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rollen`
--

CREATE TABLE `rollen` (
  `id` int(11) NOT NULL,
  `naam` varchar(40) NOT NULL,
  `omschrijving` varchar(200) DEFAULT NULL,
  `waarde` bit(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rollen`
--

INSERT INTO `rollen` (`id`, `naam`, `omschrijving`, `waarde`) VALUES
(1, 'Admin', 'Administrator', b'000011'),
(2, 'Algemeen', 'Algemeen medewerker', b'000100'),
(3, 'Uitgifte', 'Medewerker Uitgifte', b'001100'),
(4, 'Verwerking', 'Medewerker Verwerking', b'010100'),
(5, 'Inname', 'Medewerker Inname', b'100100'),
(6, 'Applicatiebeheerder', 'Applicatie-beheerder', b'111110');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `uitgiftes`
--

CREATE TABLE `uitgiftes` (
  `id` int(11) NOT NULL,
  `medewerker_ID` int(11) NOT NULL,
  `onderdeel_ID` int(11) NOT NULL,
  `tijdstip` datetime NOT NULL,
  `gewichtKg` int(11) NOT NULL,
  `prijs` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `apparaten`
--
ALTER TABLE `apparaten`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `innameapparaat`
--
ALTER TABLE `innameapparaat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inname_ID` (`inname_ID`),
  ADD KEY `apparaat_ID` (`apparaat_ID`);

--
-- Indexen voor tabel `innames`
--
ALTER TABLE `innames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medewerker_ID` (`medewerker_ID`);

--
-- Indexen voor tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_ID` (`rol_ID`);

--
-- Indexen voor tabel `onderdeelapparaat`
--
ALTER TABLE `onderdeelapparaat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onderdeel_ID` (`onderdeel_ID`),
  ADD KEY `apparaat_ID` (`apparaat_ID`);

--
-- Indexen voor tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rollen`
--
ALTER TABLE `rollen`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `uitgiftes`
--
ALTER TABLE `uitgiftes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medewerker_ID` (`medewerker_ID`),
  ADD KEY `onderdeel_ID` (`onderdeel_ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `apparaten`
--
ALTER TABLE `apparaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `innameapparaat`
--
ALTER TABLE `innameapparaat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `innames`
--
ALTER TABLE `innames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `onderdeelapparaat`
--
ALTER TABLE `onderdeelapparaat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `onderdelen`
--
ALTER TABLE `onderdelen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `rollen`
--
ALTER TABLE `rollen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `uitgiftes`
--
ALTER TABLE `uitgiftes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `innameapparaat`
--
ALTER TABLE `innameapparaat`
  ADD CONSTRAINT `innameapparaat_ibfk_1` FOREIGN KEY (`inname_ID`) REFERENCES `innames` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `innameapparaat_ibfk_2` FOREIGN KEY (`apparaat_ID`) REFERENCES `apparaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `innames`
--
ALTER TABLE `innames`
  ADD CONSTRAINT `innames_ibfk_1` FOREIGN KEY (`medewerker_ID`) REFERENCES `medewerkers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `medewerkers`
--
ALTER TABLE `medewerkers`
  ADD CONSTRAINT `medewerkers_ibfk_1` FOREIGN KEY (`rol_ID`) REFERENCES `rollen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `onderdeelapparaat`
--
ALTER TABLE `onderdeelapparaat`
  ADD CONSTRAINT `onderdeelapparaat_ibfk_1` FOREIGN KEY (`apparaat_ID`) REFERENCES `apparaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `onderdeelapparaat_ibfk_2` FOREIGN KEY (`onderdeel_ID`) REFERENCES `onderdelen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `uitgiftes`
--
ALTER TABLE `uitgiftes`
  ADD CONSTRAINT `uitgiftes_ibfk_1` FOREIGN KEY (`medewerker_ID`) REFERENCES `medewerkers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uitgiftes_ibfk_2` FOREIGN KEY (`onderdeel_ID`) REFERENCES `onderdelen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
