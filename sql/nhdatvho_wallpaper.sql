-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 17, 2024 lúc 01:10 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhdatvho_wallpaper`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `thumbnail`, `createdAt`, `updatedAt`) VALUES
(1, 'Cute girl', 'uploads/1718593017373image 20.png', '2024-06-17 02:56:57', '2024-06-17 02:56:57'),
(2, 'For Male', NULL, '2024-06-17 02:57:05', '2024-06-17 02:57:05'),
(3, 'For Female', NULL, '2024-06-17 02:57:23', '2024-06-17 02:57:23'),
(4, 'Funny', 'uploads/1718609506153image 22.png', '2024-06-17 07:31:46', '2024-06-17 07:31:46'),
(5, 'Football', 'uploads/1718609531219image 23.png', '2024-06-17 07:32:11', '2024-06-17 07:32:11'),
(6, 'Sad', NULL, '2024-06-17 08:52:06', '2024-06-17 08:52:06'),
(7, 'Happy', NULL, '2024-06-17 08:52:14', '2024-06-17 08:52:14'),
(8, 'Need motivation', NULL, '2024-06-17 08:52:24', '2024-06-17 08:52:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `countryCode` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `name`, `countryCode`, `thumbnail`, `createdAt`, `updatedAt`) VALUES
(1, 'English', 'en', 'https://flagcdn.com/w320/us.png', '2024-06-17 06:43:51', '2024-06-17 06:43:51'),
(2, 'Español', 'es', 'https://flagcdn.com/w320/es.png', '2024-06-17 06:44:32', '2024-06-17 06:44:32'),
(3, 'عربي', 'ar', 'https://flagcdn.com/w320/sa.png', '2024-06-17 06:44:50', '2024-06-17 06:44:50'),
(4, 'Português', 'pt', 'https://flagcdn.com/w320/pt.png', '2024-06-17 06:45:04', '2024-06-17 06:45:04'),
(5, 'Français', 'fr', 'https://flagcdn.com/w320/fr.png', '2024-06-17 06:45:18', '2024-06-17 06:45:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL,
  `wallpaperId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `item_categories`
--

INSERT INTO `item_categories` (`id`, `wallpaperId`, `categoryId`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2024-06-17 03:35:43', '2024-06-17 03:35:43'),
(2, 1, 3, '2024-06-17 03:35:43', '2024-06-17 03:35:43'),
(3, 2, 1, '2024-06-17 03:36:07', '2024-06-17 03:36:07'),
(4, 2, 2, '2024-06-17 03:36:07', '2024-06-17 03:36:07'),
(5, 3, 1, '2024-06-17 04:43:35', '2024-06-17 04:43:35'),
(6, 3, 2, '2024-06-17 04:43:35', '2024-06-17 04:43:35'),
(7, 4, 1, '2024-06-17 04:45:30', '2024-06-17 04:45:30'),
(8, 4, 2, '2024-06-17 04:45:30', '2024-06-17 04:45:30'),
(9, 5, 1, '2024-06-17 07:05:22', '2024-06-17 07:05:22'),
(10, 5, 2, '2024-06-17 07:05:22', '2024-06-17 07:05:22'),
(11, 6, 3, '2024-06-17 07:54:59', '2024-06-17 07:54:59'),
(12, 6, 4, '2024-06-17 07:54:59', '2024-06-17 07:54:59'),
(13, 6, 5, '2024-06-17 07:54:59', '2024-06-17 07:54:59'),
(14, 7, 2, '2024-06-17 07:58:24', '2024-06-17 07:58:24'),
(15, 8, 2, '2024-06-17 08:01:48', '2024-06-17 08:01:48'),
(16, 9, 2, '2024-06-17 08:10:52', '2024-06-17 08:10:52'),
(17, 10, 2, '2024-06-17 10:39:24', '2024-06-17 10:39:24'),
(18, 11, 2, '2024-06-17 10:40:49', '2024-06-17 10:40:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item_countries`
--

CREATE TABLE `item_countries` (
  `id` int(11) NOT NULL,
  `wallpaperId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `item_countries`
--

INSERT INTO `item_countries` (`id`, `wallpaperId`, `countryId`, `createdAt`, `updatedAt`) VALUES
(4, 4, 2, '2024-06-17 04:45:30', '2024-06-17 04:45:30'),
(5, 4, 3, '2024-06-17 04:45:30', '2024-06-17 04:45:30'),
(6, 4, 4, '2024-06-17 04:45:30', '2024-06-17 04:45:30'),
(7, 5, 1, '2024-06-17 07:05:22', '2024-06-17 07:05:22'),
(8, 5, 3, '2024-06-17 07:05:22', '2024-06-17 07:05:22'),
(9, 5, 4, '2024-06-17 07:05:22', '2024-06-17 07:05:22'),
(10, 6, 1, '2024-06-17 07:54:59', '2024-06-17 07:54:59'),
(11, 7, 1, '2024-06-17 07:58:24', '2024-06-17 07:58:24'),
(12, 8, 1, '2024-06-17 08:01:48', '2024-06-17 08:01:48'),
(13, 9, 1, '2024-06-17 08:10:52', '2024-06-17 08:10:52'),
(14, 10, 1, '2024-06-17 10:39:24', '2024-06-17 10:39:24'),
(15, 11, 1, '2024-06-17 10:40:49', '2024-06-17 10:40:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wallpapers`
--

CREATE TABLE `wallpapers` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `filePath` varchar(255) NOT NULL,
  `isHot` tinyint(1) DEFAULT NULL,
  `isRecommend` tinyint(1) DEFAULT NULL,
  `isPremium` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wallpapers`
--

INSERT INTO `wallpapers` (`id`, `title`, `filePath`, `isHot`, `isRecommend`, `isPremium`, `createdAt`, `updatedAt`) VALUES
(1, 'Wallpaper 6', 'uploads/1718595343107pexels-eberhardgross-1366919.jpg', 1, 0, 0, '2024-06-17 03:35:43', '2024-06-17 03:35:43'),
(2, 'Wallpaper 1', 'uploads/1718595367768pexels-eberhardgross-1366919.jpg', 0, 1, 0, '2024-06-17 03:36:07', '2024-06-17 03:36:07'),
(3, 'Wallpaper 1', 'uploads/1718599415308pexels-eberhardgross-1366919.jpg', 1, 0, 0, '2024-06-17 04:43:35', '2024-06-17 04:43:35'),
(4, 'Wallpaper 1', 'uploads/1718599530820pexels-eberhardgross-1366919.jpg', 1, 0, 0, '2024-06-17 04:45:30', '2024-06-17 04:45:30'),
(5, 'Wallpaper 1', 'uploads/1718607922432brent-cox-lRM-J3q2Z3k-unsplash.jpg', 1, 0, 0, '2024-06-17 07:05:22', '2024-06-17 07:05:22'),
(6, 'Wallpaper 1', 'uploads/1718610899740ambrose-chua-zxbNbuncq1g-unsplash.jpg', 1, 0, 0, '2024-06-17 07:54:59', '2024-06-17 07:54:59'),
(7, 'Wallpaper 1', 'uploads/17186111045493371612-hd_1080_1920_30fps.mp4', 1, 1, 0, '2024-06-17 07:58:24', '2024-06-17 07:58:24'),
(8, 'Wallpaper 1', 'uploads/1718611308001earth-waterfall.gif', 1, 1, 0, '2024-06-17 08:01:48', '2024-06-17 08:01:48'),
(9, 'Wallpaper 1', 'uploads/17186118520045.mp4', 1, 1, 0, '2024-06-17 08:10:52', '2024-06-17 08:10:52'),
(10, 'Wallpaper 1', 'uploads/171862076494357615b8c0092a66c1d4058b1692955cc.gif', 1, 1, 0, '2024-06-17 10:39:24', '2024-06-17 10:39:24'),
(11, 'Wallpaper 1', 'uploads/1718620849805nbdne.gif', 1, 1, 0, '2024-06-17 10:40:49', '2024-06-17 10:40:49');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_categories_categoryId_wallpaperId_unique` (`wallpaperId`,`categoryId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Chỉ mục cho bảng `item_countries`
--
ALTER TABLE `item_countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_countries_countryId_wallpaperId_unique` (`wallpaperId`,`countryId`),
  ADD KEY `countryId` (`countryId`);

--
-- Chỉ mục cho bảng `wallpapers`
--
ALTER TABLE `wallpapers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `item_countries`
--
ALTER TABLE `item_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `wallpapers`
--
ALTER TABLE `wallpapers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_ibfk_1` FOREIGN KEY (`wallpaperId`) REFERENCES `wallpapers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_categories_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `item_countries`
--
ALTER TABLE `item_countries`
  ADD CONSTRAINT `item_countries_ibfk_1` FOREIGN KEY (`wallpaperId`) REFERENCES `wallpapers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_countries_ibfk_2` FOREIGN KEY (`countryId`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
