-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2022 at 04:01 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academy`
--
CREATE DATABASE IF NOT EXISTS `academy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `academy`;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1648954815),
('m220330_162243_create_tbl_user', 1648954821),
('m220401_163852_create_tbl_dept', 1648954821),
('m220403_083451_create_tbl_notification', 1648975466),
('m220419_154955_create_tbl_course', 1650558260),
('m220421_154217_add_column_image_to_tbl_course', 1650558418),
('m220421_154646_create_tbl_feed', 1650558757),
('m220421_155013_create_tbl_chapter', 1650558870),
('m220421_155808_create_tbl_image', 1650558870),
('m220421_160242_create_tbl_discussion', 1650558870),
('m220421_160759_create_tbl_follow', 1650558870),
('m220421_161110_create_tbl_social_link', 1650558870),
('m220421_161515_create_tbl_like', 1650558870),
('m220421_161721_create_tbl_skill', 1650558870);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_chapter`
--

CREATE TABLE `tbl_chapter` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `desciption` text DEFAULT NULL,
  `dificulty` tinyint(3) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE `tbl_course` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desciption` varchar(5000) DEFAULT NULL,
  `dificulty` tinyint(3) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_discussion`
--

CREATE TABLE `tbl_discussion` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT 1,
  `replied_to` int(11) DEFAULT 1,
  `message` varchar(255) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feed`
--

CREATE TABLE `tbl_feed` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `state_id` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_follow`
--

CREATE TABLE `tbl_follow` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_follow`
--

INSERT INTO `tbl_follow` (`id`, `model`, `model_id`, `user_id`, `created_on`, `updated_on`) VALUES
(105, 'app\\models\\Users', 1, 1, '2022-05-25 06:11:50', '2022-05-25 06:11:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE `tbl_image` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_like`
--

CREATE TABLE `tbl_like` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `type_id` tinyint(4) NOT NULL,
  `state_id` tinyint(3) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `model` varchar(25) DEFAULT NULL,
  `model_id` int(10) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_notification`
--

INSERT INTO `tbl_notification` (`id`, `title`, `type_id`, `state_id`, `to_user_id`, `model`, `model_id`, `icon`, `created_on`, `created_by_id`) VALUES
(911, 'Followed by Admin', 1, 1, 1, 'app\\models\\Follow', 1, 'users', '2022-05-25 06:11:50', 1),
(912, 'Updated social link', 3, 1, 1, 'app\\models\\SocialLink', 40, 'share-alt', '2022-05-25 06:14:31', 1),
(913, 'Updated social link', 3, 1, 1, 'app\\models\\SocialLink', 41, 'share-alt', '2022-05-25 06:14:31', 1),
(914, 'Updated social link', 3, 1, 1, 'app\\models\\SocialLink', 42, 'share-alt', '2022-05-25 06:14:31', 1),
(915, 'New Manager', 1, 1, 1, 'app\\models\\Users', 90, 'user', '2022-05-25 06:36:07', 1),
(916, 'New Manager', 1, 1, 90, 'app\\models\\Users', 90, 'user', '2022-05-25 06:36:07', 1),
(917, 'Welcome', 4, 1, 90, 'app\\models\\Users', 90, 'user', '2022-05-25 06:36:07', 1),
(918, 'New Trainer', 1, 1, 1, 'app\\models\\Users', 91, 'user', '2022-05-25 06:36:55', 1),
(919, 'New Trainer', 1, 1, 90, 'app\\models\\Users', 91, 'user', '2022-05-25 06:36:55', 1),
(920, 'New Trainer', 1, 1, 91, 'app\\models\\Users', 91, 'user', '2022-05-25 06:36:55', 1),
(921, 'Welcome', 4, 1, 91, 'app\\models\\Users', 91, 'user', '2022-05-25 06:36:55', 1),
(922, 'New Student', 1, 1, 1, 'app\\models\\Users', 92, 'user', '2022-05-25 06:37:38', 1),
(923, 'New Student', 1, 1, 90, 'app\\models\\Users', 92, 'user', '2022-05-25 06:37:38', 1),
(924, 'New Student', 1, 1, 91, 'app\\models\\Users', 92, 'user', '2022-05-25 06:37:38', 1),
(925, 'Welcome', 4, 1, 92, 'app\\models\\Users', 92, 'user', '2022-05-25 06:37:38', 1),
(926, 'Updated : Student', 3, 1, 92, 'app\\models\\Users', 92, 'user', '2022-05-25 06:38:12', 1),
(927, 'Updated : Trainer', 3, 1, 91, 'app\\models\\Users', 91, 'user', '2022-05-25 06:38:58', 1),
(928, 'Updated : Manager', 3, 1, 90, 'app\\models\\Users', 90, 'user', '2022-05-25 06:39:27', 1),
(929, 'Updated : Admin', 3, 1, 1, 'app\\models\\Users', 1, 'user', '2022-05-25 06:39:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_skill`
--

CREATE TABLE `tbl_skill` (
  `id` int(11) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `skill` varchar(25) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_skill`
--

INSERT INTO `tbl_skill` (`id`, `model`, `model_id`, `skill`, `created_on`, `updated_on`, `level`) VALUES
(69, 'app\\models\\Users', 1, 'Management', '2022-05-25 06:12:06', '2022-05-25 06:12:06', 2),
(70, 'app\\models\\Users', 1, 'Comunication skills', '2022-05-25 06:12:26', '2022-05-25 06:12:26', 2),
(71, 'app\\models\\Users', 1, 'Logic building', '2022-05-25 06:12:43', '2022-05-25 06:12:43', 1),
(72, 'app\\models\\Users', 1, 'Teaching', '2022-05-25 06:13:18', '2022-05-25 06:13:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_link`
--

CREATE TABLE `tbl_social_link` (
  `id` int(11) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_social_link`
--

INSERT INTO `tbl_social_link` (`id`, `platform`, `link`, `user_id`, `created_on`, `updated_on`) VALUES
(40, 'website', 'www.example.com', 1, '2022-05-25 06:14:31', '2022-05-25 06:14:31'),
(41, 'github', 'github.com/admin', 1, '2022-05-25 06:14:31', '2022-05-25 06:14:31'),
(42, 'instagram', '@amin_on_insta', 1, '2022-05-25 06:14:31', '2022-05-25 06:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `roll_id` tinyint(3) NOT NULL,
  `state_id` tinyint(3) NOT NULL,
  `dob` date DEFAULT NULL,
  `authKey` varchar(10) NOT NULL,
  `accessToken` varchar(10) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `profile_picture` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by_id` int(25) DEFAULT 1,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `email`, `password`, `roll_id`, `state_id`, `dob`, `authKey`, `accessToken`, `gender`, `profile_picture`, `created_on`, `created_by_id`, `updated_on`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin@123', 1, 1, '2000-01-01', 'admin99', '99tokens', 'Male', 'hp6A9.tmp.jpg', '2022-04-03 05:50:08', 1, '2022-05-25 06:39:44'),
(90, 'Manager', 'manager@gmail.com', 'admin@123', 2, 1, '2000-01-01', 'test653', '653-token', 'Male', 'hpC52B.tmp.jpg', '2022-05-25 06:36:06', 1, '2022-05-25 06:39:27'),
(91, 'Trainer', 'trainer@gmail.com', 'admin@123', 3, 1, '2002-08-07', 'test264', '264-token', 'Female', 'hp53D2.tmp.jpg', '2022-05-25 06:36:55', 1, '2022-05-25 06:38:58'),
(92, 'Student', 'student@gmail.com', 'admin@123', 4, 1, '2009-05-05', 'test987', '987-token', 'Female', 'hpA14A.tmp.jpg', '2022-05-25 06:37:37', 1, '2022-05-25 06:38:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `tbl_chapter`
--
ALTER TABLE `tbl_chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_discussion`
--
ALTER TABLE `tbl_discussion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_feed`
--
ALTER TABLE `tbl_feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_follow`
--
ALTER TABLE `tbl_follow`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `model` (`model`,`model_id`,`user_id`);

--
-- Indexes for table `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-dept-created_by_id` (`created_by_id`);

--
-- Indexes for table `tbl_like`
--
ALTER TABLE `tbl_like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`model`,`model_id`,`user_id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`to_user_id`);

--
-- Indexes for table `tbl_skill`
--
ALTER TABLE `tbl_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social_link`
--
ALTER TABLE `tbl_social_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`platform`,`link`,`user_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`username`,`email`,`roll_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_chapter`
--
ALTER TABLE `tbl_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_course`
--
ALTER TABLE `tbl_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_discussion`
--
ALTER TABLE `tbl_discussion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_feed`
--
ALTER TABLE `tbl_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_follow`
--
ALTER TABLE `tbl_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `tbl_image`
--
ALTER TABLE `tbl_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_like`
--
ALTER TABLE `tbl_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=930;

--
-- AUTO_INCREMENT for table `tbl_skill`
--
ALTER TABLE `tbl_skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `tbl_social_link`
--
ALTER TABLE `tbl_social_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD CONSTRAINT `fk-post-created_by_id` FOREIGN KEY (`created_by_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
