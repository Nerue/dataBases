-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2021 at 03:24 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `collage`
--

-- --------------------------------------------------------

--
-- Table structure for table `final_decision`
--

CREATE TABLE `final_decision` (
  `id` int(11) DEFAULT NULL,
  `pre_decision_id` int(11) DEFAULT NULL,
  `programid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) DEFAULT NULL,
  `news` varchar(20) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  `pdf` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pre_decision`
--

CREATE TABLE `pre_decision` (
  `id` int(11) NOT NULL,
  `studentid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int(11) NOT NULL,
  `program` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_eng` varchar(255) DEFAULT NULL,
  `socail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_requirments`
--

CREATE TABLE `student_requirments` (
  `id` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `raghba1` int(11) DEFAULT NULL,
  `raghba2` int(11) DEFAULT NULL,
  `raghba3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `final_decision`
--
ALTER TABLE `final_decision`
  ADD KEY `pre_decision_id` (`pre_decision_id`),
  ADD KEY `programid` (`programid`);

--
-- Indexes for table `pre_decision`
--
ALTER TABLE `pre_decision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentid` (`studentid`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD KEY `studentid` (`studentid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_requirments`
--
ALTER TABLE `student_requirments`
  ADD KEY `studentid` (`studentid`),
  ADD KEY `raghba1` (`raghba1`),
  ADD KEY `raghba2` (`raghba2`),
  ADD KEY `raghba3` (`raghba3`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `final_decision`
--
ALTER TABLE `final_decision`
  ADD CONSTRAINT `final_decision_ibfk_1` FOREIGN KEY (`pre_decision_id`) REFERENCES `pre_decision` (`id`),
  ADD CONSTRAINT `final_decision_ibfk_2` FOREIGN KEY (`programid`) REFERENCES `programs` (`id`);

--
-- Constraints for table `pre_decision`
--
ALTER TABLE `pre_decision`
  ADD CONSTRAINT `pre_decision_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`id`);

--
-- Constraints for table `student_requirments`
--
ALTER TABLE `student_requirments`
  ADD CONSTRAINT `student_requirments_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_requirments_ibfk_2` FOREIGN KEY (`raghba1`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `student_requirments_ibfk_3` FOREIGN KEY (`raghba2`) REFERENCES `programs` (`id`),
  ADD CONSTRAINT `student_requirments_ibfk_4` FOREIGN KEY (`raghba3`) REFERENCES `programs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
