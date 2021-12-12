-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 12, 2021 lúc 10:27 PM
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
(1, 1, 2, 1, 10, 15, '2021-11-23T17:22:06.081', NULL),
(2, 2, 3, 2, 20, 25, '2021-11-23T17:22:06.081', NULL),
(3, 3, 4, 4, 30, 35, '2021-11-23T17:22:06.081', NULL),
(4, 1, 4, 4, 40, 45, '2021-11-23T17:22:06.081', NULL),
(5, 3, 2, 3, 50, 55, '2021-11-23T17:22:06.081', NULL),
(6, 4, 5, 5, 90, 50, '2021-11-23T17:22:06.081', NULL),
(7, 1, 3, 1, 12, 10, '2021-12-13T03:28:36.415594700', NULL),
(8, 3, 1, 3, 11, 10, '2021-12-13T03:55:25.981215900', NULL),
(9, 3, 1, 3, 10, 11, '2021-12-13T04:23:19.010888900', NULL);

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
(1, 'huy123@gmail.com', 'b8dc042d8cf7deefb0ec6a264c930b02', 'icons8_trollface_96px.png', 'QuocHuy', 'Nam', 2000, 13, 21, 11, 8, 2, 1, 0),
(2, 'lam123@gmail.com', '740273e48aa999a020df445d4e429517', 'icons8_circled_user_male_skin_type_7_96px.png', 'Lam', 'Nam', 2000, 34, 20, 16, 9, 4, 4, 0),
(3, 'thanh123@gmail.com', '893c3fd491f30b629fde7abe2ba1b516', 'icons8_circled_user_male_skin_type_7_96px.png', 'Thanh', 'Nam', 2000, 28, 35, 17, 3, 8, 2, 0),
(4, 'van123@gmail.com', 'a0e70be9e8f538282678aecf1ecc1f43', 'icons8_circled_user_male_skin_type_7_96px.png', 'Huy', 'Nam', 2000, 12, 34, 10, 7, 5, 3, 0),
(5, 'g@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'nam', 'Nam', 2000, 13, 36, 12, 5, 2, -1, 0),
(6, 'f@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'hoa', 'Nữ', 2001, 40, 15, 9, 7, 3, -1, 0),
(7, 'e@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'dung', 'Nữ', 2001, 7, 25, 8, 12, 4, -1, 0),
(8, 'd@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'trang', 'Nữ', 2001, 3, 36, 15, 20, 6, -1, 0),
(9, 'c@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'an', 'Nam', 2000, 14, 27, 2, 15, 1, -1, 0),
(10, 'b@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'anh', 'Nam', 1998, 20, 19, 8, 8, 2, -1, 0),
(11, 'a@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'min', 'Nam', 1999, 16, 17, 7, 6, 2, -1, 0),
(12, 'h@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'phuong', 'Nam', 2000, 27, 6, 1, 4, 1, -1, 0),
(13, 'k@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'icons8_circled_user_male_skin_type_7_96px.png', 'lan', 'Nữ', 1999, 17, 25, 14, 6, 5, -1, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `player`
--
ALTER TABLE `player`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
