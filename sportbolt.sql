-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Dec 15. 11:30
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `sportbolt`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alkalmazott`
--

CREATE TABLE `alkalmazott` (
  `Alkalmazott_ID` varchar(255) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `beosztas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `aru`
--

CREATE TABLE `aru` (
  `C_szam` varchar(255) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `egyseg` varchar(255) NOT NULL,
  `ketegoria` varchar(255) NOT NULL,
  `afa` double NOT NULL,
  `ar` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szallitolevel`
--

CREATE TABLE `szallitolevel` (
  `szallitolevel_szama` varchar(255) NOT NULL,
  `Alkalmazott_ID` varchar(255) NOT NULL,
  `Vasarlo_ID` varchar(255) NOT NULL,
  `szallitasi_cim` varchar(255) NOT NULL,
  `datum` varchar(255) NOT NULL,
  `osszertek` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szallitolevel_tetel`
--

CREATE TABLE `szallitolevel_tetel` (
  `szalittolevel_szam` varchar(255) NOT NULL,
  `C_szam` varchar(255) NOT NULL,
  `mennyiseg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vásárló`
--

CREATE TABLE `vásárló` (
  `id` varchar(255) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `L_cim` varchar(255) NOT NULL,
  `t_szam` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cegnev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alkalmazott`
--
ALTER TABLE `alkalmazott`
  ADD PRIMARY KEY (`Alkalmazott_ID`);

--
-- A tábla indexei `aru`
--
ALTER TABLE `aru`
  ADD PRIMARY KEY (`C_szam`);

--
-- A tábla indexei `szallitolevel`
--
ALTER TABLE `szallitolevel`
  ADD PRIMARY KEY (`szallitolevel_szama`),
  ADD KEY `Alkalmazott_ID` (`Alkalmazott_ID`),
  ADD KEY `Vasarlo_ID` (`Vasarlo_ID`);

--
-- A tábla indexei `szallitolevel_tetel`
--
ALTER TABLE `szallitolevel_tetel`
  ADD PRIMARY KEY (`szalittolevel_szam`),
  ADD KEY `C_szam` (`C_szam`);

--
-- A tábla indexei `vásárló`
--
ALTER TABLE `vásárló`
  ADD PRIMARY KEY (`id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `szallitolevel`
--
ALTER TABLE `szallitolevel`
  ADD CONSTRAINT `szallitolevel_ibfk_1` FOREIGN KEY (`Alkalmazott_ID`) REFERENCES `alkalmazott` (`Alkalmazott_ID`),
  ADD CONSTRAINT `szallitolevel_ibfk_2` FOREIGN KEY (`Vasarlo_ID`) REFERENCES `vásárló` (`id`);

--
-- Megkötések a táblához `szallitolevel_tetel`
--
ALTER TABLE `szallitolevel_tetel`
  ADD CONSTRAINT `szallitolevel_tetel_ibfk_1` FOREIGN KEY (`szalittolevel_szam`) REFERENCES `szallitolevel` (`szallitolevel_szama`),
  ADD CONSTRAINT `szallitolevel_tetel_ibfk_2` FOREIGN KEY (`C_szam`) REFERENCES `aru` (`C_szam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
