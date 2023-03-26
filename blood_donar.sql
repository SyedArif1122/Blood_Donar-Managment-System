-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2023 at 08:35 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blood donar`
--

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `donation_id` int(11) NOT NULL,
  `donor_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `donation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`donation_id`, `donor_id`, `recipient_id`, `donation_date`) VALUES
(1, 1, 1, '2022-02-01'),
(2, 3, 2, '2022-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `donor_id` int(11) NOT NULL,
  `donor_name` varchar(50) NOT NULL,
  `donor_blood_type` varchar(3) NOT NULL,
  `donor_phone` varchar(15) NOT NULL,
  `donor_email` varchar(50) NOT NULL,
  `donor_address` varchar(100) NOT NULL,
  `last_donation_date` date NOT NULL,
  `is_available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donors`
--

INSERT INTO `donors` (`donor_id`, `donor_name`, `donor_blood_type`, `donor_phone`, `donor_email`, `donor_address`, `last_donation_date`, `is_available`) VALUES
(1, 'John Doe', 'A+', '123-456-7890', 'johndoe@email.com', '123 Main St, Anytown, USA', '2022-01-01', 1),
(2, 'Jane Smith', 'B-', '555-555-1212', 'janesmith@email.com', '456 Oak St, Anytown, USA', '2021-11-01', 0),
(3, 'Bob Johnson', 'AB+', '123-456-5555', 'bobjohnson@email.com', '789 Elm St, Anytown, USA', '2022-02-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

CREATE TABLE `recipients` (
  `recipient_id` int(11) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `recipient_blood_type` varchar(3) NOT NULL,
  `recipient_phone` varchar(15) NOT NULL,
  `recipient_email` varchar(50) NOT NULL,
  `recipient_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`recipient_id`, `recipient_name`, `recipient_blood_type`, `recipient_phone`, `recipient_email`, `recipient_address`) VALUES
(1, 'Samantha Brown', 'A+', '555-123-4567', 'samanthabrown@email.com', '321 High St, Anytown, USA'),
(2, 'Mike Davis', 'B+', '555-555-1212', 'mikedavis@email.com', '654 Low St, Anytown, USA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`donation_id`),
  ADD KEY `donor_id` (`donor_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`donor_id`);

--
-- Indexes for table `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`donor_id`),
  ADD CONSTRAINT `donations_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `recipients` (`recipient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
