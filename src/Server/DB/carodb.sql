-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 12, 2021 lúc 05:28 PM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `carodb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gamematch`
--

CREATE TABLE `gamematch` (
  `ID` int(11) NOT NULL,
  `PlayerID1` int(11) NOT NULL,
  `PlayerID2` int(11) NOT NULL,
  `WinnerID` int(11) DEFAULT NULL,
  `PlayTime` int(11) NOT NULL,
  `TotalMove` int(11) NOT NULL,
  `StartedTime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Chat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `gamematch`
--

INSERT INTO `gamematch` (`ID`, `PlayerID1`, `PlayerID2`, `WinnerID`, `PlayTime`, `TotalMove`, `StartedTime`, `Chat`) VALUES
(1, 1, 2, 1, 10, 15, '2020-11-23T17:22:06.081', NULL),
(2, 2, 3, 2, 20, 25, '2020-11-23T17:22:06.081', NULL),
(3, 3, 4, 4, 30, 35, '2020-11-23T17:22:06.081', NULL),
(4, 1, 4, 4, 40, 45, '2020-11-23T17:22:06.081', NULL),
(5, 3, 2, 3, 50, 55, '2020-11-23T17:22:06.081', NULL),
(6, 4, 5, 5, 90, 50, '2020-11-23T17:22:06.081', NULL),
(7, 6, 9, 6, 11, 10, '2021-11-23T09:48:35.031623200', NULL),
(8, 7, 7, -1, 0, 2, '2021-11-30T19:55:52.387027700', NULL),
(9, 6, 6, -1, 0, 6, '2021-11-30T19:58:03.643849900', NULL),
(10, 6, 6, -1, 0, 25, '2021-11-30T20:03:42.354865100', NULL),
(11, 8, 8, -1, 0, 24, '2021-11-30T20:37:21.006294300', NULL),
(12, 11, 12, 11, 23, 10, '2021-12-12T22:26:20.011934800', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `player`
--

CREATE TABLE `player` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Avatar` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Nam',
  `YearOfBirth` int(4) NOT NULL DEFAULT 2000,
  `Score` int(11) NOT NULL DEFAULT 0,
  `MatchCount` int(11) NOT NULL DEFAULT 0,
  `WinCount` int(11) NOT NULL DEFAULT 0,
  `LoseCount` int(11) NOT NULL DEFAULT 0,
  `CurrentStreak` int(11) NOT NULL DEFAULT 0,
  `Rank` int(11) NOT NULL DEFAULT -1,
  `Blocked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `player`
--

INSERT INTO `player` (`ID`, `Email`, `Password`, `Avatar`, `Name`, `Gender`, `YearOfBirth`, `Score`, `MatchCount`, `WinCount`, `LoseCount`, `CurrentStreak`, `Rank`, `Blocked`) VALUES
(11, 'huy123@gmail.com', 'b8dc042d8cf7deefb0ec6a264c930b02', 'icons8_trollface_96px.png', 'QuocHuy', 'Nam', 2000, 2, 0, 1, 0, 0, -1, 0),
(12, 'thanh123@gmail.com', '893c3fd491f30b629fde7abe2ba1b516', 'icons8_circled_user_male_skin_type_7_96px.png', 'Thanh', 'Nam', 2000, -2, 0, 0, -1, 0, -1, 0),
(13, 'lam123@gmail.com', '740273e48aa999a020df445d4e429517', 'icons8_circled_user_male_skin_type_7_96px.png', 'Lam', 'Nam', 2000, 0, 0, 0, 0, 0, -1, 0),
(14, 'van123@gmail.com', 'a0e70be9e8f538282678aecf1ecc1f43', 'icons8_circled_user_male_skin_type_7_96px.png', 'Huy', 'Nam', 2000, 0, 0, 0, 0, 0, -1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `gamematch`
--
ALTER TABLE `gamematch`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UNIQUE` (`Email`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `gamematch`
--
ALTER TABLE `gamematch`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `player`
--
ALTER TABLE `player`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
