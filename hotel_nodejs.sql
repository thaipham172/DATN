-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2024 at 03:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_nodejs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `FullName`, `Phone`, `Email`, `Username`, `Password`, `createdAt`, `updatedAt`) VALUES
(1, 'Nguyễn Văn An', '0999666888', 'nguyenvanan@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2024-05-09 19:19:21', '2024-05-09 13:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Avatar` text NOT NULL,
  `Slug` text NOT NULL,
  `Type` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Id`, `Name`, `Avatar`, `Slug`, `Type`, `createdAt`, `updatedAt`) VALUES
(4, 'Chuyên mục ', 'http://127.0.0.1:3001/uploads/1702205588116.jpg', 'chuyen-muc-2', 1, '2023-12-06 16:26:31', '2023-12-10 10:53:16'),
(5, 'Phòng Vip', 'http://127.0.0.1:3001/uploads/1702205865034.jpg', 'cong-nghe-thong-tin', 2, '2023-12-10 10:57:45', '2023-12-10 10:57:45'),
(6, 'Mục mới', 'http://127.0.0.1:3001/uploads/1702219094767.jpg', 'muc-moi', 1, '2023-12-10 14:38:14', '2023-12-10 14:38:14');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `Id` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `Message` text NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`Id`, `CustomerId`, `Message`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'Nội dung liên hệ mẫu', '2024-05-09 10:50:52', '2024-05-09 10:50:52'),
(2, 1, 'Liên hệ 2', '2024-05-09 10:54:35', '2024-05-09 10:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `FullName`, `Phone`, `Email`, `Username`, `Password`, `createdAt`, `updatedAt`) VALUES
(1, 'Nguyễn Văn An', '0999888999', 'nguyenvana@gmail.com', 'nguyenvana', '20ca70c7c8f494c7bd1d54ad23d40cde', '2023-12-27 15:58:48', '2023-12-27 15:58:48'),
(6, 'Nguyễn Văn Bình', '0966999999', 'nguyenvanb@gmail.com', 'nguyenvanb', '23280a0ad9238d00c62b0272af265c57', '2023-12-27 10:08:29', '2023-12-27 10:08:29'),
(7, 'Nguyễn Văn Dũng', '0555333777', 'nguyenvandung@gmail.com', 'nguyenvandung', '51752c3ea2747aa2bd18f98bffdc923c', '2024-05-09 10:53:09', '2024-05-09 10:53:09');

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `Id` int(11) NOT NULL,
  `RoomId` int(11) NOT NULL,
  `Wifi` int(11) NOT NULL,
  `Washer` int(11) NOT NULL,
  `Bed` int(11) NOT NULL,
  `Gym` int(11) NOT NULL,
  `Kitchen` int(11) NOT NULL,
  `Air` int(11) NOT NULL,
  `Support` int(11) NOT NULL,
  `Storage` int(11) NOT NULL,
  `Bathroom` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`Id`, `RoomId`, `Wifi`, `Washer`, `Bed`, `Gym`, `Kitchen`, `Air`, `Support`, `Storage`, `Bathroom`, `createdAt`, `updatedAt`) VALUES
(6, 7, 0, 0, 3, 0, 0, 1, 0, 0, 1, '2023-12-11 10:13:38', '2023-12-11 10:15:05'),
(7, 6, 0, 0, 2, 0, 0, 0, 0, 0, 0, '2023-12-11 10:20:00', '2023-12-11 10:20:13'),
(8, 8, 1, 1, 3, 1, 1, 1, 1, 1, 1, '2023-12-11 11:45:23', '2023-12-23 20:47:05'),
(9, 9, 0, 0, 1, 0, 0, 0, 0, 0, 0, '2024-01-20 13:23:03', '2024-01-20 13:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `Id` int(11) NOT NULL,
  `RoomId` int(11) NOT NULL,
  `Image` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`Id`, `RoomId`, `Image`, `createdAt`, `updatedAt`) VALUES
(29, 7, 'http://127.0.0.1:3001/uploads/1703377253590.jpg', '2023-12-24 00:20:53', '2023-12-24 00:20:53'),
(30, 7, 'http://127.0.0.1:3001/uploads/1703377253592.jpg', '2023-12-24 00:20:53', '2023-12-24 00:20:53'),
(31, 7, 'http://127.0.0.1:3001/uploads/1703377253595.jpg', '2023-12-24 00:20:53', '2023-12-24 00:20:53'),
(32, 7, 'http://127.0.0.1:3001/uploads/1703377253597.jpg', '2023-12-24 00:20:53', '2023-12-24 00:20:53'),
(33, 8, 'http://127.0.0.1:3001/uploads/1703378680730.jpg', '2023-12-24 00:44:10', '2023-12-24 00:44:40'),
(34, 8, 'http://127.0.0.1:3001/uploads/1703378680731.webp', '2023-12-24 00:44:10', '2023-12-24 00:44:40'),
(35, 8, 'http://127.0.0.1:3001/uploads/1703378650754.jpg', '2023-12-24 00:44:10', '2023-12-24 00:44:10'),
(36, 8, 'http://127.0.0.1:3001/uploads/1703378687839.jpg', '2023-12-24 00:44:10', '2023-12-24 00:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `Id` int(11) NOT NULL,
  `Title` varchar(500) NOT NULL,
  `Content` text NOT NULL,
  `Avatar` text NOT NULL,
  `Tag` varchar(255) NOT NULL,
  `Slug` text NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`Id`, `Title`, `Content`, `Avatar`, `Tag`, `Slug`, `CategoryId`, `createdAt`, `updatedAt`) VALUES
(15, 'ABCD', '<p>abcd</p>\r\n', 'http://127.0.0.1:3001/uploads/1703956138008.jpg', 'apple, iphone 14, iphone', 'abcd', 4, '2023-12-10 13:35:01', '2024-01-04 10:41:30'),
(16, 'ABCD1111', '<p>&Ocirc;ng Ho&agrave;ng Quốc Vượng, cựu thứ trưởng C&ocirc;ng Thương, bị bắt một ng&agrave;y sau khi nghỉ hưu với c&aacute;o buộc sai phạm li&ecirc;n quan vụ &aacute;n xảy ra tại Tập đo&agrave;n điện lực Việt Nam (EVN).</p>\r\n\r\n<p>Chiều 4/1, trung tướng T&ocirc; &Acirc;n X&ocirc;, người ph&aacute;t ng&ocirc;n Bộ C&ocirc;ng an, cho biết &ocirc;ng Vượng bị Cơ quan An ninh điều tra Bộ C&ocirc;ng an khởi tố, tạm giam hai ng&agrave;y trước để điều tra về tội&nbsp;<em>Lợi dụng chức vụ quyền hạn trong khi thi h&agrave;nh c&ocirc;ng vụ</em>.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Cựu thứ trưởng Công Thương Hoàng Quốc Vượng tại cơ quan điều tra. Ảnh: Bộ Công an\" src=\"https://i1-vnexpress.vnecdn.net/2024/01/04/cuu-thu-truong-7346-1704362931.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=2T0P8hUbXLDN10Ke3cS9Og\" /></p>\r\n\r\n<p>Cựu thứ trưởng C&ocirc;ng Thương Ho&agrave;ng Quốc Vượng tại cơ quan điều tra. Ảnh:&nbsp;<em>Bộ C&ocirc;ng an</em></p>\r\n\r\n<p>&Ocirc;ng Ho&agrave;ng Quốc Vượng, 61 tuổi, tốt nghiệp Trường mỏ MGRI tại Moskva (Nga), sau đ&oacute; trải qua nhiều vị tr&iacute; như Ph&oacute; chủ tịch UBND tỉnh Th&aacute;i Nguy&ecirc;n trước khi được bổ nhiệm giữ chức thứ trưởng Bộ C&ocirc;ng Thương từ th&aacute;ng 8/2010. Đến th&aacute;ng 9/2012, &ocirc;ng Vượng được điều động sang Tập đo&agrave;n Điện lực Việt Nam (EVN) giữ vai tr&ograve; l&agrave; Chủ tịch hội đồng th&agrave;nh vi&ecirc;n, B&iacute; thư Đảng ủy tập đo&agrave;n. Ba năm sau, &ocirc;ng th&ocirc;i cương vị ở EVN để trở lại l&agrave;m Thứ trưởng C&ocirc;ng thương.</p>\r\n\r\n<p>Trong thời kỳ l&agrave;m Thứ trưởng C&ocirc;ng Thương từ 2015 đến 2020, &ocirc;ng Vượng được giao chỉ đạo c&ocirc;ng t&aacute;c trong lĩnh vực điện lực, năng lượng t&aacute;i tạo, m&ocirc;i trường v&agrave; ph&aacute;t triển bền vững, an to&agrave;n, c&ocirc;ng nghệ th&ocirc;ng tin, ph&aacute;t triển thị trường. Th&aacute;ng 11/2020, &ocirc;ng Vượng được điều động, bổ nhiệm l&agrave;m Chủ tịch hội đồng th&agrave;nh vi&ecirc;n Tập đo&agrave;n Dầu kh&iacute; Việt Nam (PVN) v&agrave; nghỉ hưu hưởng chế độ hưu tr&iacute; từ 1/1.</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"Bị can Nguyễn Danh Sơn, Giám đốc Công ty mua bán điện. Ảnh: Bộ Công an\" src=\"https://i1-vnexpress.vnecdn.net/2024/01/04/die-n-lu-c-jpeg-8845-169953314-9927-3601-1704361853.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=l0WbfnHyiLb1sIGEA8ETjw\" /></p>\r\n\r\n<p>Bị can Nguyễn Danh Sơn, Gi&aacute;m đốc C&ocirc;ng ty mua b&aacute;n điện. Ảnh:<em>&nbsp;Bộ C&ocirc;ng an</em></p>\r\n\r\n<p>Li&ecirc;n quan vụ &aacute;n tại Tập đo&agrave;n điện lực Việt Nam (EVN), Bộ C&ocirc;ng Thương, hồi th&aacute;ng 11, Cơ quan An ninh điều tra Bộ C&ocirc;ng an đ&atilde; khởi tố 6 người để điều tra tội&nbsp;<em>Lợi dụng chức vụ quyền hạn trong khi thi h&agrave;nh c&ocirc;ng vụ.</em></p>\r\n\r\n<p>Trong số n&agrave;y c&oacute; &ocirc;ng Nguyễn Danh Sơn, Gi&aacute;m đốc C&ocirc;ng ty mua b&aacute;n điện c&ugrave;ng ba cấp dưới, Trần Quốc H&ugrave;ng v&agrave; Trịnh Văn Đo&agrave;n, ph&oacute; ph&ograve;ng v&agrave; chuy&ecirc;n vi&ecirc;n ph&ograve;ng Cấp ph&eacute;p v&agrave; Quan hệ c&ocirc;ng ch&uacute;ng, Cục Điều tiết Điện lực, Bộ C&ocirc;ng Thương.</p>\r\n', 'http://127.0.0.1:3001/uploads/1704363692561.png', 'apple, nam14, iphone', 'muc-moi', 4, '2024-01-04 10:21:32', '2024-05-09 13:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `Code` varchar(12) NOT NULL,
  `RoomId` int(11) NOT NULL,
  `Start` datetime NOT NULL,
  `End` datetime NOT NULL,
  `Total` int(11) NOT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `FullName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `StatusOrder` int(1) NOT NULL DEFAULT 1,
  `StatusPay` int(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Code`, `RoomId`, `Start`, `End`, `Total`, `CustomerId`, `FullName`, `Email`, `Phone`, `StatusOrder`, `StatusPay`, `createdAt`, `updatedAt`) VALUES
(19, 'HFVPFZEJKSPZ', 8, '2023-12-27 00:00:00', '2023-12-30 00:00:00', 600000, 1, 'Nguyễn Văn An', 'nguyenvana@gmail.com', '0999888999', 3, 0, '2023-12-27 14:42:35', '2024-01-20 13:59:24'),
(20, 'OGOEHXFVUEFA', 7, '2023-12-27 00:00:00', '2024-01-06 00:00:00', 13200000, 1, 'Nguyễn Văn An', 'nguyenvana@gmail.com', '0999888999', 1, 0, '2023-12-27 14:43:04', '2024-01-20 13:15:11'),
(21, 'ZLMPYCNSLAHY', 6, '2023-12-27 00:00:00', '2024-01-06 00:00:00', 13200000, NULL, 'Nguyễn Văn Bình', 'chuminhnamma@gmail.com', '0999999999', 0, 2, '2023-12-27 14:50:40', '2024-01-20 13:47:42'),
(22, 'TODSBGTKMLOE', 8, '2023-12-27 00:00:00', '2023-12-30 00:00:00', 600000, 1, 'Nguyễn Văn An', 'nguyenvana@gmail.com', '0999888999', 0, 2, '2023-12-29 15:00:56', '2024-01-20 13:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Avatar` text NOT NULL,
  `Price` int(11) NOT NULL,
  `People` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Slug` text NOT NULL,
  `Status` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`Id`, `Name`, `Description`, `Avatar`, `Price`, `People`, `CategoryId`, `Slug`, `Status`, `createdAt`, `updatedAt`) VALUES
(6, 'Phòng 01', '<p>abcded</p>\r\n', 'http://127.0.0.1:3001/uploads/1702292412972.webp', 1500000, 5, 5, 'cong-nghe-thong-tin1', 1, '2023-12-10 16:08:08', '2023-12-23 20:06:11'),
(7, 'Phòng 02', '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>\r\n', 'http://127.0.0.1:3001/uploads/1702292396085.jpg', 1500000, 5, 5, 'phong-02', 1, '2023-12-10 20:10:14', '2023-12-11 11:07:14'),
(8, 'Công Nghệ Thông Tin', '<p><strong>abacded</strong></p>\r\n', 'http://127.0.0.1:3001/uploads/1702293627373.webp', 150000, 5, 5, 'cong-nghe-thong-tin', 0, '2023-12-11 11:20:27', '2024-01-20 15:11:16'),
(9, 'Phòng mới', '<p>abcde</p>\r\n', 'http://127.0.0.1:3001/uploads/1704812770657.jpg', 1300000, 15, 5, 'phong-02a', 1, '2024-01-09 15:06:10', '2024-01-09 15:06:10');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `Id` int(11) NOT NULL,
  `RoomId` int(11) NOT NULL,
  `Rules` text DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`Id`, `RoomId`, `Rules`, `createdAt`, `updatedAt`) VALUES
(33, 6, 'aaaa', '2023-12-10 16:34:52', '2023-12-10 16:34:52'),
(34, 6, 'baaabcdes', '2023-12-10 16:34:52', '2023-12-10 16:34:52'),
(35, 6, 'cabascdw', '2023-12-10 16:34:52', '2023-12-10 16:34:52'),
(36, 6, 'd', '2023-12-10 16:34:52', '2023-12-10 16:34:52'),
(37, 6, 'ggggg', '2023-12-10 16:34:52', '2023-12-10 16:34:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RoomId` (`RoomId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RoomId` (`RoomId`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RoomId` (`RoomId`,`CustomerId`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CategoryId` (`CategoryId`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `RoomId` (`RoomId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `facility`
--
ALTER TABLE `facility`
  ADD CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`RoomId`) REFERENCES `rooms` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`RoomId`) REFERENCES `rooms` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`RoomId`) REFERENCES `rooms` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `rule`
--
ALTER TABLE `rule`
  ADD CONSTRAINT `rule_ibfk_1` FOREIGN KEY (`RoomId`) REFERENCES `rooms` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
