-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 03, 2025 at 12:34 AM
-- Server version: 8.0.27
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weddingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `catering`
--

CREATE TABLE `catering` (
  `venue_id` int NOT NULL,
  `grade` int NOT NULL,
  `cost` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catering`
--

INSERT INTO `catering` (`venue_id`, `grade`, `cost`) VALUES
(1, 3, 15),
(1, 4, 20),
(2, 4, 22),
(2, 5, 28),
(3, 3, 15),
(3, 4, 22),
(3, 5, 26),
(4, 2, 10),
(4, 3, 14),
(4, 4, 20),
(4, 5, 24),
(5, 4, 26),
(5, 5, 30),
(6, 1, 6),
(6, 2, 10),
(6, 3, 14),
(7, 2, 10),
(7, 3, 15),
(7, 4, 20),
(7, 5, 24),
(8, 1, 7),
(8, 2, 10),
(8, 3, 14),
(8, 4, 19),
(8, 5, 25),
(9, 1, 6),
(9, 2, 10),
(9, 3, 15),
(9, 4, 22),
(9, 5, 28),
(10, 1, 8),
(10, 2, 12),
(10, 3, 17),
(10, 4, 22);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `venue_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `capacity` int NOT NULL,
  `weekend_price` int NOT NULL,
  `weekday_price` int NOT NULL,
  `licensed` tinyint(1) NOT NULL,
  `latitude` decimal(7,4) NOT NULL,
  `longitude` decimal(7,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`venue_id`, `name`, `capacity`, `weekend_price`, `weekday_price`, `licensed`, `latitude`, `longitude`) VALUES
(1, 'Central Plaza', 200, 2000, 1750, 1, '51.5078', '-0.0749'),
(2, 'Pacific Towers Hotel', 250, 3000, 2400, 1, '52.4790', '-1.8945'),
(3, 'Sky Center Complex', 100, 2500, 1900, 0, '52.7630', '-1.2375'),
(4, 'Sea View Tavern', 300, 2200, 2000, 0, '52.9354', '-1.1382'),
(5, 'Ashby Castle', 1000, 8000, 7000, 1, '53.4794', '-2.2472'),
(6, 'Fawlty Towers', 50, 600, 400, 1, '53.9626', '-1.0767'),
(7, 'Hilltop Mansion', 120, 3000, 2200, 0, '53.4118', '-2.9803'),
(8, 'Haslegrave Hotel', 200, 2000, 1500, 0, '51.4545', '-2.6136'),
(9, 'Forest Inn', 260, 1800, 1600, 1, '50.8236', '-0.1380'),
(10, 'Southwestern Estate', 500, 4000, 3000, 0, '51.5229', '-0.1625');

-- --------------------------------------------------------

--
-- Table structure for table `venue_booking`
--

CREATE TABLE `venue_booking` (
  `venue_id` int NOT NULL,
  `booking_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venue_booking`
--

INSERT INTO `venue_booking` (`venue_id`, `booking_date`) VALUES
(1, '2024-01-17'),
(1, '2024-01-18'),
(1, '2024-01-24'),
(1, '2024-01-29'),
(1, '2024-01-30'),
(1, '2024-02-01'),
(1, '2024-02-06'),
(1, '2024-02-12'),
(1, '2024-02-16'),
(1, '2024-02-21'),
(1, '2024-02-27'),
(1, '2024-02-28'),
(1, '2024-03-01'),
(1, '2024-03-06'),
(1, '2024-03-10'),
(1, '2024-03-15'),
(1, '2024-03-17'),
(1, '2024-03-23'),
(1, '2024-03-24'),
(1, '2024-03-26'),
(1, '2024-03-30'),
(1, '2024-04-01'),
(1, '2024-04-02'),
(1, '2024-04-08'),
(1, '2024-04-09'),
(1, '2024-04-11'),
(1, '2024-04-13'),
(1, '2024-04-16'),
(1, '2024-04-22'),
(1, '2024-04-25'),
(1, '2024-04-27'),
(1, '2024-04-28'),
(1, '2024-05-01'),
(1, '2024-05-03'),
(1, '2024-05-09'),
(1, '2024-05-13'),
(1, '2024-05-16'),
(1, '2024-05-20'),
(1, '2024-05-24'),
(1, '2024-05-25'),
(1, '2024-05-27'),
(1, '2024-05-30'),
(1, '2024-06-01'),
(1, '2024-06-07'),
(1, '2024-06-09'),
(1, '2024-06-14'),
(1, '2024-06-19'),
(1, '2024-06-23'),
(1, '2024-06-28'),
(1, '2024-07-01'),
(1, '2024-07-06'),
(1, '2024-07-08'),
(1, '2024-07-12'),
(1, '2024-07-18'),
(1, '2024-07-19'),
(1, '2024-07-23'),
(1, '2024-07-24'),
(1, '2024-07-27'),
(1, '2024-07-28'),
(1, '2024-07-29'),
(1, '2024-08-01'),
(1, '2024-08-04'),
(1, '2024-08-05'),
(1, '2024-08-07'),
(1, '2024-08-11'),
(1, '2024-08-12'),
(1, '2024-08-18'),
(1, '2024-08-24'),
(1, '2024-08-28'),
(1, '2024-09-01'),
(1, '2024-09-07'),
(1, '2024-09-13'),
(1, '2024-09-18'),
(1, '2024-09-19'),
(1, '2024-09-25'),
(1, '2024-09-26'),
(1, '2024-10-01'),
(1, '2024-10-06'),
(1, '2024-10-10'),
(1, '2024-10-14'),
(1, '2024-10-18'),
(1, '2024-10-21'),
(1, '2024-10-26'),
(1, '2024-10-27'),
(1, '2024-10-29'),
(1, '2024-11-01'),
(1, '2024-11-06'),
(1, '2024-11-09'),
(1, '2024-11-11'),
(1, '2024-11-17'),
(1, '2024-11-21'),
(1, '2024-11-22'),
(1, '2024-11-24'),
(1, '2024-11-29'),
(1, '2024-12-01'),
(1, '2024-12-06'),
(1, '2024-12-11'),
(1, '2024-12-13'),
(1, '2024-12-18'),
(1, '2024-12-20'),
(1, '2024-12-24'),
(1, '2024-12-28'),
(1, '2024-12-29'),
(2, '2024-01-01'),
(2, '2024-01-05'),
(2, '2024-01-06'),
(2, '2024-01-09'),
(2, '2024-01-12'),
(2, '2024-01-17'),
(2, '2024-01-18'),
(2, '2024-01-24'),
(2, '2024-01-26'),
(2, '2024-01-29'),
(2, '2024-02-01'),
(2, '2024-02-04'),
(2, '2024-02-09'),
(2, '2024-02-14'),
(2, '2024-02-16'),
(2, '2024-02-18'),
(2, '2024-02-19'),
(2, '2024-02-20'),
(2, '2024-02-25'),
(2, '2024-02-26'),
(2, '2024-02-28'),
(2, '2024-03-01'),
(2, '2024-03-04'),
(2, '2024-03-05'),
(2, '2024-03-06'),
(2, '2024-03-10'),
(2, '2024-03-15'),
(2, '2024-03-17'),
(2, '2024-03-18'),
(2, '2024-03-21'),
(2, '2024-03-24'),
(2, '2024-03-27'),
(2, '2024-03-28'),
(2, '2024-04-01'),
(2, '2024-04-06'),
(2, '2024-04-09'),
(2, '2024-04-11'),
(2, '2024-04-17'),
(2, '2024-04-20'),
(2, '2024-04-24'),
(2, '2024-04-26'),
(2, '2024-04-28'),
(2, '2024-04-29'),
(2, '2024-04-30'),
(2, '2024-05-01'),
(2, '2024-05-03'),
(2, '2024-05-05'),
(2, '2024-05-11'),
(2, '2024-05-14'),
(2, '2024-05-20'),
(2, '2024-05-21'),
(2, '2024-05-26'),
(2, '2024-05-29'),
(2, '2024-06-01'),
(2, '2024-06-06'),
(2, '2024-06-09'),
(2, '2024-06-10'),
(2, '2024-06-14'),
(2, '2024-06-19'),
(2, '2024-06-20'),
(2, '2024-06-21'),
(2, '2024-06-23'),
(2, '2024-06-27'),
(2, '2024-06-28'),
(2, '2024-07-01'),
(2, '2024-07-04'),
(2, '2024-07-08'),
(2, '2024-07-14'),
(2, '2024-07-16'),
(2, '2024-07-22'),
(2, '2024-07-26'),
(2, '2024-07-30'),
(2, '2024-08-01'),
(2, '2024-08-05'),
(2, '2024-08-09'),
(2, '2024-08-11'),
(2, '2024-08-17'),
(2, '2024-08-23'),
(2, '2024-08-24'),
(2, '2024-08-26'),
(2, '2024-09-01'),
(2, '2024-09-03'),
(2, '2024-09-09'),
(2, '2024-09-11'),
(2, '2024-09-15'),
(2, '2024-09-19'),
(2, '2024-09-24'),
(2, '2024-09-29'),
(2, '2024-10-01'),
(2, '2024-10-04'),
(2, '2024-10-09'),
(2, '2024-10-11'),
(2, '2024-10-15'),
(2, '2024-10-18'),
(2, '2024-10-20'),
(2, '2024-10-22'),
(2, '2024-10-28'),
(2, '2024-11-01'),
(2, '2024-11-03'),
(2, '2024-11-04'),
(2, '2024-11-10'),
(2, '2024-11-15'),
(2, '2024-11-20'),
(2, '2024-11-21'),
(2, '2024-11-24'),
(2, '2024-11-27'),
(2, '2024-11-29'),
(2, '2024-12-01'),
(2, '2024-12-03'),
(2, '2024-12-06'),
(2, '2024-12-09'),
(2, '2024-12-10'),
(2, '2024-12-14'),
(2, '2024-12-16'),
(2, '2024-12-19'),
(2, '2024-12-21'),
(2, '2024-12-27'),
(2, '2024-12-28'),
(3, '2024-01-01'),
(3, '2024-01-03'),
(3, '2024-01-07'),
(3, '2024-01-12'),
(3, '2024-01-15'),
(3, '2024-01-16'),
(3, '2024-01-17'),
(3, '2024-01-22'),
(3, '2024-01-25'),
(3, '2024-02-01'),
(3, '2024-02-06'),
(3, '2024-02-11'),
(3, '2024-02-12'),
(3, '2024-02-16'),
(3, '2024-02-20'),
(3, '2024-02-25'),
(3, '2024-03-01'),
(3, '2024-03-07'),
(3, '2024-03-08'),
(3, '2024-03-14'),
(3, '2024-03-16'),
(3, '2024-03-19'),
(3, '2024-03-22'),
(3, '2024-03-26'),
(3, '2024-03-29'),
(3, '2024-04-01'),
(3, '2024-04-07'),
(3, '2024-04-13'),
(3, '2024-04-14'),
(3, '2024-04-20'),
(3, '2024-04-21'),
(3, '2024-04-22'),
(3, '2024-04-23'),
(3, '2024-04-27'),
(3, '2024-05-01'),
(3, '2024-05-05'),
(3, '2024-05-10'),
(3, '2024-05-16'),
(3, '2024-05-19'),
(3, '2024-05-21'),
(3, '2024-05-26'),
(3, '2024-05-27'),
(3, '2024-06-01'),
(3, '2024-06-07'),
(3, '2024-06-11'),
(3, '2024-06-14'),
(3, '2024-06-18'),
(3, '2024-06-21'),
(3, '2024-06-24'),
(3, '2024-06-29'),
(3, '2024-07-01'),
(3, '2024-07-05'),
(3, '2024-07-06'),
(3, '2024-07-10'),
(3, '2024-07-11'),
(3, '2024-07-15'),
(3, '2024-07-19'),
(3, '2024-07-20'),
(3, '2024-07-24'),
(3, '2024-07-29'),
(3, '2024-08-01'),
(3, '2024-08-05'),
(3, '2024-08-10'),
(3, '2024-08-11'),
(3, '2024-08-12'),
(3, '2024-08-15'),
(3, '2024-08-19'),
(3, '2024-08-24'),
(3, '2024-08-26'),
(3, '2024-08-27'),
(3, '2024-08-28'),
(3, '2024-08-29'),
(3, '2024-08-30'),
(3, '2024-09-01'),
(3, '2024-09-07'),
(3, '2024-09-12'),
(3, '2024-09-14'),
(3, '2024-09-18'),
(3, '2024-09-19'),
(3, '2024-09-23'),
(3, '2024-09-26'),
(3, '2024-09-29'),
(3, '2024-10-01'),
(3, '2024-10-05'),
(3, '2024-10-06'),
(3, '2024-10-08'),
(3, '2024-10-09'),
(3, '2024-10-13'),
(3, '2024-10-16'),
(3, '2024-10-20'),
(3, '2024-10-22'),
(3, '2024-10-24'),
(3, '2024-10-26'),
(3, '2024-10-27'),
(3, '2024-10-30'),
(3, '2024-11-01'),
(3, '2024-11-04'),
(3, '2024-11-10'),
(3, '2024-11-11'),
(3, '2024-11-16'),
(3, '2024-11-17'),
(3, '2024-11-18'),
(3, '2024-11-24'),
(3, '2024-11-25'),
(3, '2024-11-26'),
(3, '2024-12-01'),
(3, '2024-12-07'),
(3, '2024-12-09'),
(3, '2024-12-13'),
(3, '2024-12-14'),
(3, '2024-12-20'),
(3, '2024-12-26'),
(3, '2024-12-29'),
(3, '2024-12-30'),
(4, '2024-01-01'),
(4, '2024-01-05'),
(4, '2024-01-08'),
(4, '2024-01-12'),
(4, '2024-01-13'),
(4, '2024-01-19'),
(4, '2024-01-21'),
(4, '2024-01-24'),
(4, '2024-01-25'),
(4, '2024-01-28'),
(4, '2024-02-01'),
(4, '2024-02-04'),
(4, '2024-02-08'),
(4, '2024-02-14'),
(4, '2024-02-17'),
(4, '2024-02-22'),
(4, '2024-02-27'),
(4, '2024-03-01'),
(4, '2024-03-07'),
(4, '2024-03-11'),
(4, '2024-03-15'),
(4, '2024-03-21'),
(4, '2024-03-24'),
(4, '2024-03-28'),
(4, '2024-03-30'),
(4, '2024-04-01'),
(4, '2024-04-05'),
(4, '2024-04-07'),
(4, '2024-04-13'),
(4, '2024-04-14'),
(4, '2024-04-17'),
(4, '2024-04-19'),
(4, '2024-04-23'),
(4, '2024-04-28'),
(4, '2024-05-01'),
(4, '2024-05-06'),
(4, '2024-05-10'),
(4, '2024-05-11'),
(4, '2024-05-12'),
(4, '2024-05-17'),
(4, '2024-05-20'),
(4, '2024-05-24'),
(4, '2024-05-26'),
(4, '2024-06-01'),
(4, '2024-06-05'),
(4, '2024-06-10'),
(4, '2024-06-15'),
(4, '2024-06-17'),
(4, '2024-06-19'),
(4, '2024-06-23'),
(4, '2024-06-29'),
(4, '2024-07-01'),
(4, '2024-07-04'),
(4, '2024-07-07'),
(4, '2024-07-10'),
(4, '2024-07-15'),
(4, '2024-07-17'),
(4, '2024-07-23'),
(4, '2024-07-29'),
(4, '2024-08-01'),
(4, '2024-08-02'),
(4, '2024-08-04'),
(4, '2024-08-07'),
(4, '2024-08-11'),
(4, '2024-08-12'),
(4, '2024-08-14'),
(4, '2024-08-16'),
(4, '2024-08-20'),
(4, '2024-08-23'),
(4, '2024-08-26'),
(4, '2024-08-29'),
(4, '2024-09-01'),
(4, '2024-09-02'),
(4, '2024-09-07'),
(4, '2024-09-12'),
(4, '2024-09-17'),
(4, '2024-09-20'),
(4, '2024-09-23'),
(4, '2024-09-24'),
(4, '2024-09-29'),
(4, '2024-09-30'),
(4, '2024-10-01'),
(4, '2024-10-05'),
(4, '2024-10-09'),
(4, '2024-10-11'),
(4, '2024-10-17'),
(4, '2024-10-19'),
(4, '2024-10-23'),
(4, '2024-10-29'),
(4, '2024-10-30'),
(4, '2024-11-01'),
(4, '2024-11-07'),
(4, '2024-11-09'),
(4, '2024-11-11'),
(4, '2024-11-15'),
(4, '2024-11-17'),
(4, '2024-11-21'),
(4, '2024-11-26'),
(4, '2024-12-01'),
(4, '2024-12-07'),
(4, '2024-12-09'),
(4, '2024-12-12'),
(4, '2024-12-16'),
(4, '2024-12-18'),
(4, '2024-12-19'),
(4, '2024-12-22'),
(4, '2024-12-28'),
(5, '2024-01-01'),
(5, '2024-01-06'),
(5, '2024-01-12'),
(5, '2024-01-14'),
(5, '2024-01-19'),
(5, '2024-01-25'),
(5, '2024-01-30'),
(5, '2024-02-01'),
(5, '2024-02-03'),
(5, '2024-02-08'),
(5, '2024-02-12'),
(5, '2024-02-17'),
(5, '2024-02-21'),
(5, '2024-02-25'),
(5, '2024-03-01'),
(5, '2024-03-05'),
(5, '2024-03-11'),
(5, '2024-03-17'),
(5, '2024-03-18'),
(5, '2024-03-20'),
(5, '2024-03-24'),
(5, '2024-03-29'),
(5, '2024-04-01'),
(5, '2024-04-04'),
(5, '2024-04-05'),
(5, '2024-04-09'),
(5, '2024-04-10'),
(5, '2024-04-12'),
(5, '2024-04-17'),
(5, '2024-04-20'),
(5, '2024-04-22'),
(5, '2024-04-24'),
(5, '2024-04-26'),
(5, '2024-04-28'),
(5, '2024-05-01'),
(5, '2024-05-02'),
(5, '2024-05-03'),
(5, '2024-05-05'),
(5, '2024-05-08'),
(5, '2024-05-11'),
(5, '2024-05-12'),
(5, '2024-05-18'),
(5, '2024-05-19'),
(5, '2024-05-23'),
(5, '2024-05-27'),
(5, '2024-06-01'),
(5, '2024-06-03'),
(5, '2024-06-06'),
(5, '2024-06-10'),
(5, '2024-06-12'),
(5, '2024-06-17'),
(5, '2024-06-18'),
(5, '2024-06-19'),
(5, '2024-06-25'),
(5, '2024-06-29'),
(5, '2024-06-30'),
(5, '2024-07-01'),
(5, '2024-07-06'),
(5, '2024-07-09'),
(5, '2024-07-11'),
(5, '2024-07-13'),
(5, '2024-07-18'),
(5, '2024-07-22'),
(5, '2024-07-26'),
(5, '2024-08-01'),
(5, '2024-08-02'),
(5, '2024-08-06'),
(5, '2024-08-07'),
(5, '2024-08-09'),
(5, '2024-08-15'),
(5, '2024-08-18'),
(5, '2024-08-21'),
(5, '2024-08-26'),
(5, '2024-08-30'),
(5, '2024-09-01'),
(5, '2024-09-03'),
(5, '2024-09-05'),
(5, '2024-09-06'),
(5, '2024-09-11'),
(5, '2024-09-17'),
(5, '2024-09-20'),
(5, '2024-09-23'),
(5, '2024-09-24'),
(5, '2024-09-27'),
(5, '2024-09-30'),
(5, '2024-10-01'),
(5, '2024-10-04'),
(5, '2024-10-10'),
(5, '2024-10-13'),
(5, '2024-10-19'),
(5, '2024-10-20'),
(5, '2024-10-24'),
(5, '2024-10-28'),
(5, '2024-11-01'),
(5, '2024-11-02'),
(5, '2024-11-06'),
(5, '2024-11-11'),
(5, '2024-11-15'),
(5, '2024-11-20'),
(5, '2024-11-21'),
(5, '2024-11-25'),
(5, '2024-11-26'),
(5, '2024-11-29'),
(5, '2024-12-01'),
(5, '2024-12-06'),
(5, '2024-12-09'),
(5, '2024-12-14'),
(5, '2024-12-15'),
(5, '2024-12-19'),
(5, '2024-12-22'),
(5, '2024-12-28'),
(6, '2024-01-01'),
(6, '2024-01-07'),
(6, '2024-01-13'),
(6, '2024-01-16'),
(6, '2024-01-18'),
(6, '2024-01-22'),
(6, '2024-01-28'),
(6, '2024-01-30'),
(6, '2024-02-01'),
(6, '2024-02-06'),
(6, '2024-02-09'),
(6, '2024-02-12'),
(6, '2024-02-15'),
(6, '2024-02-16'),
(6, '2024-02-20'),
(6, '2024-02-26'),
(6, '2024-03-01'),
(6, '2024-03-03'),
(6, '2024-03-07'),
(6, '2024-03-12'),
(6, '2024-03-17'),
(6, '2024-03-22'),
(6, '2024-03-24'),
(6, '2024-03-25'),
(6, '2024-03-29'),
(6, '2024-04-01'),
(6, '2024-04-07'),
(6, '2024-04-11'),
(6, '2024-04-12'),
(6, '2024-04-14'),
(6, '2024-04-17'),
(6, '2024-04-18'),
(6, '2024-04-20'),
(6, '2024-04-23'),
(6, '2024-04-26'),
(6, '2024-04-30'),
(6, '2024-05-01'),
(6, '2024-05-03'),
(6, '2024-05-08'),
(6, '2024-05-14'),
(6, '2024-05-15'),
(6, '2024-05-16'),
(6, '2024-05-19'),
(6, '2024-05-22'),
(6, '2024-05-24'),
(6, '2024-05-30'),
(6, '2024-06-01'),
(6, '2024-06-02'),
(6, '2024-06-04'),
(6, '2024-06-10'),
(6, '2024-06-16'),
(6, '2024-06-22'),
(6, '2024-06-27'),
(6, '2024-06-28'),
(6, '2024-06-29'),
(6, '2024-07-01'),
(6, '2024-07-05'),
(6, '2024-07-11'),
(6, '2024-07-16'),
(6, '2024-07-21'),
(6, '2024-07-23'),
(6, '2024-07-25'),
(6, '2024-08-01'),
(6, '2024-08-05'),
(6, '2024-08-10'),
(6, '2024-08-13'),
(6, '2024-08-14'),
(6, '2024-08-19'),
(6, '2024-08-23'),
(6, '2024-08-29'),
(6, '2024-09-01'),
(6, '2024-09-05'),
(6, '2024-09-06'),
(6, '2024-09-12'),
(6, '2024-09-13'),
(6, '2024-09-15'),
(6, '2024-09-21'),
(6, '2024-09-23'),
(6, '2024-09-25'),
(6, '2024-09-26'),
(6, '2024-09-28'),
(6, '2024-09-29'),
(6, '2024-09-30'),
(6, '2024-10-01'),
(6, '2024-10-02'),
(6, '2024-10-03'),
(6, '2024-10-05'),
(6, '2024-10-10'),
(6, '2024-10-11'),
(6, '2024-10-12'),
(6, '2024-10-16'),
(6, '2024-10-19'),
(6, '2024-10-21'),
(6, '2024-10-25'),
(6, '2024-11-01'),
(6, '2024-11-02'),
(6, '2024-11-08'),
(6, '2024-11-09'),
(6, '2024-11-14'),
(6, '2024-11-17'),
(6, '2024-11-23'),
(6, '2024-11-26'),
(6, '2024-11-27'),
(6, '2024-12-01'),
(6, '2024-12-03'),
(6, '2024-12-04'),
(6, '2024-12-06'),
(6, '2024-12-08'),
(6, '2024-12-11'),
(6, '2024-12-14'),
(6, '2024-12-16'),
(6, '2024-12-21'),
(6, '2024-12-25'),
(6, '2024-12-27'),
(7, '2024-01-01'),
(7, '2024-01-06'),
(7, '2024-01-09'),
(7, '2024-01-15'),
(7, '2024-01-19'),
(7, '2024-01-23'),
(7, '2024-01-29'),
(7, '2024-02-01'),
(7, '2024-02-07'),
(7, '2024-02-09'),
(7, '2024-02-14'),
(7, '2024-02-20'),
(7, '2024-02-23'),
(7, '2024-02-27'),
(7, '2024-03-01'),
(7, '2024-03-02'),
(7, '2024-03-03'),
(7, '2024-03-09'),
(7, '2024-03-13'),
(7, '2024-03-15'),
(7, '2024-03-21'),
(7, '2024-03-27'),
(7, '2024-03-30'),
(7, '2024-04-01'),
(7, '2024-04-02'),
(7, '2024-04-08'),
(7, '2024-04-12'),
(7, '2024-04-14'),
(7, '2024-04-18'),
(7, '2024-04-19'),
(7, '2024-04-23'),
(7, '2024-04-26'),
(7, '2024-05-01'),
(7, '2024-05-07'),
(7, '2024-05-09'),
(7, '2024-05-12'),
(7, '2024-05-15'),
(7, '2024-05-17'),
(7, '2024-05-22'),
(7, '2024-05-25'),
(7, '2024-05-29'),
(7, '2024-06-01'),
(7, '2024-06-03'),
(7, '2024-06-09'),
(7, '2024-06-10'),
(7, '2024-06-12'),
(7, '2024-06-13'),
(7, '2024-06-14'),
(7, '2024-06-16'),
(7, '2024-06-20'),
(7, '2024-06-23'),
(7, '2024-06-24'),
(7, '2024-06-27'),
(7, '2024-07-01'),
(7, '2024-07-02'),
(7, '2024-07-05'),
(7, '2024-07-09'),
(7, '2024-07-13'),
(7, '2024-07-18'),
(7, '2024-07-20'),
(7, '2024-07-25'),
(7, '2024-07-27'),
(7, '2024-08-01'),
(7, '2024-08-06'),
(7, '2024-08-07'),
(7, '2024-08-13'),
(7, '2024-08-15'),
(7, '2024-08-19'),
(7, '2024-08-20'),
(7, '2024-08-26'),
(7, '2024-09-01'),
(7, '2024-09-06'),
(7, '2024-09-09'),
(7, '2024-09-11'),
(7, '2024-09-15'),
(7, '2024-09-18'),
(7, '2024-09-22'),
(7, '2024-09-27'),
(7, '2024-10-01'),
(7, '2024-10-06'),
(7, '2024-10-08'),
(7, '2024-10-14'),
(7, '2024-10-19'),
(7, '2024-10-24'),
(7, '2024-10-29'),
(7, '2024-11-01'),
(7, '2024-11-02'),
(7, '2024-11-04'),
(7, '2024-11-08'),
(7, '2024-11-14'),
(7, '2024-11-18'),
(7, '2024-11-20'),
(7, '2024-11-21'),
(7, '2024-11-22'),
(7, '2024-11-23'),
(7, '2024-11-25'),
(7, '2024-11-26'),
(7, '2024-11-28'),
(7, '2024-12-01'),
(7, '2024-12-03'),
(7, '2024-12-04'),
(7, '2024-12-09'),
(7, '2024-12-15'),
(7, '2024-12-18'),
(7, '2024-12-19'),
(7, '2024-12-22'),
(7, '2024-12-28'),
(8, '2024-01-01'),
(8, '2024-01-02'),
(8, '2024-01-05'),
(8, '2024-01-08'),
(8, '2024-01-11'),
(8, '2024-01-14'),
(8, '2024-01-16'),
(8, '2024-01-17'),
(8, '2024-01-18'),
(8, '2024-01-19'),
(8, '2024-01-21'),
(8, '2024-01-24'),
(8, '2024-01-29'),
(8, '2024-01-30'),
(8, '2024-02-01'),
(8, '2024-02-02'),
(8, '2024-02-03'),
(8, '2024-02-04'),
(8, '2024-02-05'),
(8, '2024-02-08'),
(8, '2024-02-10'),
(8, '2024-02-12'),
(8, '2024-02-13'),
(8, '2024-02-16'),
(8, '2024-02-19'),
(8, '2024-02-25'),
(8, '2024-02-27'),
(8, '2024-03-01'),
(8, '2024-03-07'),
(8, '2024-03-12'),
(8, '2024-03-17'),
(8, '2024-03-21'),
(8, '2024-03-27'),
(8, '2024-03-29'),
(8, '2024-03-30'),
(8, '2024-04-01'),
(8, '2024-04-05'),
(8, '2024-04-07'),
(8, '2024-04-10'),
(8, '2024-04-14'),
(8, '2024-04-17'),
(8, '2024-04-21'),
(8, '2024-04-22'),
(8, '2024-04-24'),
(8, '2024-04-29'),
(8, '2024-04-30'),
(8, '2024-05-01'),
(8, '2024-05-07'),
(8, '2024-05-09'),
(8, '2024-05-11'),
(8, '2024-05-13'),
(8, '2024-05-16'),
(8, '2024-05-20'),
(8, '2024-05-23'),
(8, '2024-05-28'),
(8, '2024-05-29'),
(8, '2024-06-01'),
(8, '2024-06-02'),
(8, '2024-06-08'),
(8, '2024-06-10'),
(8, '2024-06-15'),
(8, '2024-06-19'),
(8, '2024-06-25'),
(8, '2024-06-29'),
(8, '2024-07-01'),
(8, '2024-07-07'),
(8, '2024-07-13'),
(8, '2024-07-16'),
(8, '2024-07-18'),
(8, '2024-07-20'),
(8, '2024-07-21'),
(8, '2024-07-26'),
(8, '2024-08-01'),
(8, '2024-08-02'),
(8, '2024-08-08'),
(8, '2024-08-12'),
(8, '2024-08-13'),
(8, '2024-08-15'),
(8, '2024-08-19'),
(8, '2024-08-21'),
(8, '2024-08-25'),
(8, '2024-08-30'),
(8, '2024-09-01'),
(8, '2024-09-03'),
(8, '2024-09-04'),
(8, '2024-09-07'),
(8, '2024-09-09'),
(8, '2024-09-12'),
(8, '2024-09-16'),
(8, '2024-09-17'),
(8, '2024-09-22'),
(8, '2024-09-24'),
(8, '2024-09-28'),
(8, '2024-10-01'),
(8, '2024-10-07'),
(8, '2024-10-10'),
(8, '2024-10-14'),
(8, '2024-10-19'),
(8, '2024-10-24'),
(8, '2024-10-30'),
(8, '2024-11-01'),
(8, '2024-11-06'),
(8, '2024-11-10'),
(8, '2024-11-11'),
(8, '2024-11-17'),
(8, '2024-11-21'),
(8, '2024-11-26'),
(8, '2024-12-01'),
(8, '2024-12-07'),
(8, '2024-12-09'),
(8, '2024-12-11'),
(8, '2024-12-14'),
(8, '2024-12-20'),
(8, '2024-12-26'),
(8, '2024-12-30'),
(9, '2024-01-01'),
(9, '2024-01-04'),
(9, '2024-01-09'),
(9, '2024-01-13'),
(9, '2024-01-19'),
(9, '2024-01-24'),
(9, '2024-01-26'),
(9, '2024-01-28'),
(9, '2024-02-01'),
(9, '2024-02-07'),
(9, '2024-02-08'),
(9, '2024-02-14'),
(9, '2024-02-17'),
(9, '2024-02-23'),
(9, '2024-02-27'),
(9, '2024-03-01'),
(9, '2024-03-02'),
(9, '2024-03-05'),
(9, '2024-03-11'),
(9, '2024-03-13'),
(9, '2024-03-15'),
(9, '2024-03-19'),
(9, '2024-03-25'),
(9, '2024-03-27'),
(9, '2024-03-30'),
(9, '2024-04-01'),
(9, '2024-04-05'),
(9, '2024-04-11'),
(9, '2024-04-12'),
(9, '2024-04-16'),
(9, '2024-04-20'),
(9, '2024-04-22'),
(9, '2024-04-28'),
(9, '2024-04-30'),
(9, '2024-05-01'),
(9, '2024-05-07'),
(9, '2024-05-08'),
(9, '2024-05-09'),
(9, '2024-05-10'),
(9, '2024-05-14'),
(9, '2024-05-20'),
(9, '2024-05-22'),
(9, '2024-05-25'),
(9, '2024-05-28'),
(9, '2024-05-30'),
(9, '2024-06-01'),
(9, '2024-06-06'),
(9, '2024-06-09'),
(9, '2024-06-12'),
(9, '2024-06-17'),
(9, '2024-06-21'),
(9, '2024-06-26'),
(9, '2024-06-29'),
(9, '2024-07-01'),
(9, '2024-07-07'),
(9, '2024-07-13'),
(9, '2024-07-17'),
(9, '2024-07-20'),
(9, '2024-07-25'),
(9, '2024-07-30'),
(9, '2024-08-01'),
(9, '2024-08-03'),
(9, '2024-08-09'),
(9, '2024-08-15'),
(9, '2024-08-19'),
(9, '2024-08-24'),
(9, '2024-08-30'),
(9, '2024-09-01'),
(9, '2024-09-07'),
(9, '2024-09-08'),
(9, '2024-09-09'),
(9, '2024-09-15'),
(9, '2024-09-17'),
(9, '2024-09-21'),
(9, '2024-09-24'),
(9, '2024-09-28'),
(9, '2024-10-01'),
(9, '2024-10-02'),
(9, '2024-10-08'),
(9, '2024-10-09'),
(9, '2024-10-15'),
(9, '2024-10-18'),
(9, '2024-10-23'),
(9, '2024-10-25'),
(9, '2024-11-01'),
(9, '2024-11-06'),
(9, '2024-11-07'),
(9, '2024-11-10'),
(9, '2024-11-11'),
(9, '2024-11-17'),
(9, '2024-11-19'),
(9, '2024-11-20'),
(9, '2024-11-21'),
(9, '2024-11-23'),
(9, '2024-11-24'),
(9, '2024-11-28'),
(9, '2024-12-01'),
(9, '2024-12-07'),
(9, '2024-12-09'),
(9, '2024-12-15'),
(9, '2024-12-21'),
(9, '2024-12-24'),
(9, '2024-12-29'),
(10, '2024-01-01'),
(10, '2024-01-07'),
(10, '2024-01-08'),
(10, '2024-01-13'),
(10, '2024-01-17'),
(10, '2024-01-19'),
(10, '2024-01-24'),
(10, '2024-01-28'),
(10, '2024-01-30'),
(10, '2024-02-01'),
(10, '2024-02-03'),
(10, '2024-02-06'),
(10, '2024-02-07'),
(10, '2024-02-13'),
(10, '2024-02-17'),
(10, '2024-02-21'),
(10, '2024-02-22'),
(10, '2024-02-25'),
(10, '2024-03-01'),
(10, '2024-03-03'),
(10, '2024-03-06'),
(10, '2024-03-12'),
(10, '2024-03-14'),
(10, '2024-03-15'),
(10, '2024-03-21'),
(10, '2024-03-23'),
(10, '2024-03-25'),
(10, '2024-03-30'),
(10, '2024-04-01'),
(10, '2024-04-06'),
(10, '2024-04-10'),
(10, '2024-04-13'),
(10, '2024-04-17'),
(10, '2024-04-22'),
(10, '2024-04-24'),
(10, '2024-04-26'),
(10, '2024-04-27'),
(10, '2024-05-01'),
(10, '2024-05-06'),
(10, '2024-05-08'),
(10, '2024-05-09'),
(10, '2024-05-10'),
(10, '2024-05-14'),
(10, '2024-05-16'),
(10, '2024-05-17'),
(10, '2024-05-18'),
(10, '2024-05-23'),
(10, '2024-05-25'),
(10, '2024-05-28'),
(10, '2024-06-01'),
(10, '2024-06-04'),
(10, '2024-06-10'),
(10, '2024-06-13'),
(10, '2024-06-18'),
(10, '2024-06-24'),
(10, '2024-06-27'),
(10, '2024-07-01'),
(10, '2024-07-03'),
(10, '2024-07-05'),
(10, '2024-07-06'),
(10, '2024-07-07'),
(10, '2024-07-12'),
(10, '2024-07-16'),
(10, '2024-07-20'),
(10, '2024-07-24'),
(10, '2024-07-29'),
(10, '2024-08-01'),
(10, '2024-08-05'),
(10, '2024-08-09'),
(10, '2024-08-13'),
(10, '2024-08-18'),
(10, '2024-08-23'),
(10, '2024-08-27'),
(10, '2024-08-30'),
(10, '2024-09-01'),
(10, '2024-09-05'),
(10, '2024-09-09'),
(10, '2024-09-13'),
(10, '2024-09-18'),
(10, '2024-09-19'),
(10, '2024-09-20'),
(10, '2024-09-22'),
(10, '2024-09-28'),
(10, '2024-10-01'),
(10, '2024-10-07'),
(10, '2024-10-13'),
(10, '2024-10-14'),
(10, '2024-10-20'),
(10, '2024-10-22'),
(10, '2024-10-24'),
(10, '2024-10-25'),
(10, '2024-10-27'),
(10, '2024-10-28'),
(10, '2024-11-01'),
(10, '2024-11-07'),
(10, '2024-11-11'),
(10, '2024-11-13'),
(10, '2024-11-18'),
(10, '2024-11-19'),
(10, '2024-11-25'),
(10, '2024-11-28'),
(10, '2024-12-01'),
(10, '2024-12-05'),
(10, '2024-12-11'),
(10, '2024-12-14'),
(10, '2024-12-17'),
(10, '2024-12-21'),
(10, '2024-12-27'),
(10, '2024-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `venue_review_score`
--

CREATE TABLE `venue_review_score` (
  `review_id` int NOT NULL,
  `venue_id` int NOT NULL,
  `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venue_review_score`
--

INSERT INTO `venue_review_score` (`review_id`, `venue_id`, `score`) VALUES
(1, 10, 8),
(2, 3, 7),
(3, 10, 6),
(4, 3, 7),
(5, 8, 9),
(6, 9, 7),
(7, 8, 10),
(8, 7, 0),
(9, 3, 9),
(10, 8, 8),
(11, 4, 7),
(12, 9, 10),
(13, 8, 8),
(14, 8, 8),
(15, 9, 8),
(16, 1, 7),
(17, 5, 8),
(18, 8, 10),
(19, 9, 8),
(20, 9, 6),
(21, 9, 8),
(22, 7, 1),
(23, 8, 9),
(24, 3, 8),
(25, 6, 7),
(26, 6, 7),
(27, 9, 7),
(28, 5, 9),
(29, 9, 9),
(30, 9, 6),
(31, 8, 9),
(32, 1, 6),
(33, 4, 8),
(34, 6, 4),
(35, 2, 5),
(36, 3, 5),
(37, 10, 10),
(38, 9, 7),
(39, 3, 5),
(40, 6, 6),
(41, 1, 7),
(42, 1, 7),
(43, 8, 10),
(44, 9, 9),
(45, 6, 7),
(46, 10, 9),
(47, 1, 7),
(48, 3, 6),
(49, 9, 7),
(50, 1, 9),
(51, 6, 6),
(52, 4, 7),
(53, 6, 6),
(54, 5, 9),
(55, 7, 4),
(56, 5, 10),
(57, 10, 7),
(58, 9, 8),
(59, 5, 9),
(60, 3, 6),
(61, 3, 8),
(62, 10, 5),
(63, 9, 9),
(64, 6, 5),
(65, 9, 9),
(66, 4, 8),
(67, 6, 8),
(68, 4, 7),
(69, 9, 8),
(70, 1, 6),
(71, 10, 10),
(72, 9, 8),
(73, 4, 5),
(74, 7, 6),
(75, 6, 7),
(76, 6, 7),
(77, 5, 10),
(78, 9, 8),
(79, 6, 5),
(80, 10, 10),
(81, 3, 8),
(82, 6, 4),
(83, 9, 9),
(84, 3, 5),
(85, 1, 6),
(86, 9, 9),
(87, 6, 6),
(88, 9, 10),
(89, 6, 7),
(90, 1, 8),
(91, 7, 5),
(92, 8, 9),
(93, 1, 8),
(94, 8, 8),
(95, 2, 4),
(96, 6, 7),
(97, 1, 7),
(98, 3, 8),
(99, 2, 7),
(100, 5, 10),
(101, 6, 6),
(102, 9, 10),
(103, 5, 10),
(104, 5, 9),
(105, 9, 10),
(106, 10, 10),
(107, 6, 8),
(108, 8, 9),
(109, 2, 6),
(110, 8, 7),
(111, 5, 8),
(112, 8, 9),
(113, 5, 9),
(114, 8, 10),
(115, 10, 6),
(116, 9, 5),
(117, 8, 10),
(118, 9, 8),
(119, 6, 8),
(120, 8, 8),
(121, 2, 5),
(122, 3, 7),
(123, 2, 5),
(124, 3, 7),
(125, 10, 10),
(126, 8, 10),
(127, 8, 9),
(128, 4, 7),
(129, 9, 6),
(130, 1, 6),
(131, 3, 6),
(132, 2, 8),
(133, 4, 6),
(134, 8, 10),
(135, 6, 8),
(136, 1, 6),
(137, 9, 8),
(138, 10, 5),
(139, 7, 7),
(140, 7, 5),
(141, 6, 5),
(142, 10, 9),
(143, 10, 8),
(144, 4, 7),
(145, 3, 6),
(146, 1, 7),
(147, 6, 1),
(148, 9, 9),
(149, 8, 9),
(150, 7, 6),
(151, 3, 8),
(152, 10, 10),
(153, 9, 5),
(154, 7, 7),
(155, 7, 5),
(156, 6, 6),
(157, 10, 10),
(158, 1, 5),
(159, 8, 7),
(160, 6, 1),
(161, 7, 5),
(162, 3, 8),
(163, 1, 9),
(164, 6, 8),
(165, 7, 6),
(166, 3, 7),
(167, 6, 6),
(168, 4, 8),
(169, 3, 9),
(170, 9, 6),
(171, 7, 7),
(172, 9, 6),
(173, 6, 8),
(174, 3, 8),
(175, 9, 6),
(176, 5, 7),
(177, 8, 9),
(178, 3, 7),
(179, 1, 9),
(180, 9, 7),
(181, 3, 9),
(182, 9, 6),
(183, 1, 8),
(184, 6, 6),
(185, 10, 10),
(186, 7, 5),
(187, 4, 6),
(188, 6, 8),
(189, 6, 5),
(190, 4, 8),
(191, 6, 5),
(192, 8, 9),
(193, 9, 7),
(194, 8, 7),
(195, 1, 6),
(196, 3, 7),
(197, 8, 7),
(198, 1, 7),
(199, 5, 8),
(200, 6, 5),
(201, 2, 6),
(202, 5, 10),
(203, 9, 8),
(204, 9, 8),
(205, 1, 7),
(206, 3, 7),
(207, 6, 7),
(208, 3, 6),
(209, 8, 10),
(210, 6, 5),
(211, 8, 9),
(212, 9, 7),
(213, 8, 10),
(214, 5, 9),
(215, 1, 8),
(216, 8, 10),
(217, 1, 8),
(218, 8, 9),
(219, 8, 9),
(220, 9, 6),
(221, 3, 6),
(222, 6, 6),
(223, 6, 5),
(224, 7, 2),
(225, 6, 6),
(226, 2, 5),
(227, 8, 8),
(228, 10, 10),
(229, 8, 8),
(230, 5, 10),
(231, 4, 6),
(232, 3, 8),
(233, 3, 8),
(234, 8, 9),
(235, 7, 5),
(236, 8, 7),
(237, 1, 8),
(238, 4, 6),
(239, 1, 7),
(240, 9, 5),
(241, 10, 9),
(242, 8, 8),
(243, 2, 1),
(244, 6, 6),
(245, 10, 9),
(246, 6, 8),
(247, 8, 10),
(248, 7, 6),
(249, 10, 9),
(250, 8, 9),
(251, 8, 6),
(252, 5, 10),
(253, 9, 5),
(254, 9, 10),
(255, 8, 10),
(256, 3, 6),
(257, 6, 7),
(258, 9, 10),
(259, 4, 6),
(260, 8, 10),
(261, 7, 6),
(262, 4, 7),
(263, 3, 8),
(264, 9, 7),
(265, 9, 6),
(266, 8, 10),
(267, 10, 8),
(268, 8, 10),
(269, 8, 9),
(270, 3, 7),
(271, 7, 5),
(272, 8, 8),
(273, 10, 10),
(274, 7, 6),
(275, 9, 4),
(276, 2, 1),
(277, 2, 6),
(278, 8, 7),
(279, 4, 6),
(280, 5, 9),
(281, 8, 10),
(282, 7, 6),
(283, 1, 8),
(284, 8, 9),
(285, 3, 7),
(286, 7, 4),
(287, 6, 7),
(288, 3, 7),
(289, 6, 5),
(290, 8, 9),
(291, 2, 8),
(292, 9, 7),
(293, 9, 8),
(294, 1, 7),
(295, 6, 7),
(296, 9, 5),
(297, 9, 7),
(298, 10, 7),
(299, 6, 6),
(300, 5, 9),
(301, 2, 4),
(302, 2, 9),
(303, 9, 9),
(304, 4, 2),
(305, 9, 8),
(306, 1, 10),
(307, 10, 6),
(308, 7, 5),
(309, 9, 9),
(310, 4, 7),
(311, 2, 6),
(312, 3, 6),
(313, 6, 7),
(314, 6, 5),
(315, 3, 9),
(316, 1, 10),
(317, 1, 8),
(318, 7, 4),
(319, 1, 9),
(320, 9, 9),
(321, 7, 0),
(322, 10, 9),
(323, 9, 10),
(324, 6, 6),
(325, 9, 7),
(326, 7, 4),
(327, 6, 6),
(328, 4, 8),
(329, 2, 6),
(330, 3, 7),
(331, 4, 7),
(332, 3, 6),
(333, 10, 8),
(334, 10, 10),
(335, 3, 9),
(336, 1, 9),
(337, 6, 6),
(338, 8, 8),
(339, 5, 9),
(340, 1, 8),
(341, 4, 4),
(342, 6, 5),
(343, 9, 7),
(344, 8, 8),
(345, 9, 8),
(346, 7, 7),
(347, 9, 6),
(348, 10, 6),
(349, 3, 8),
(350, 1, 8),
(351, 6, 7),
(352, 9, 7),
(353, 8, 9),
(354, 10, 9),
(355, 3, 7),
(356, 8, 10),
(357, 5, 10),
(358, 10, 8),
(359, 9, 5),
(360, 10, 8),
(361, 8, 9),
(362, 4, 8),
(363, 10, 10),
(364, 3, 5),
(365, 2, 2),
(366, 6, 3),
(367, 9, 8),
(368, 9, 8),
(369, 9, 5),
(370, 8, 9),
(371, 3, 7),
(372, 1, 8),
(373, 1, 9),
(374, 8, 7),
(375, 2, 4),
(376, 8, 8),
(377, 8, 8),
(378, 8, 10),
(379, 2, 2),
(380, 7, 1),
(381, 7, 5),
(382, 8, 9),
(383, 6, 8),
(384, 8, 6),
(385, 1, 6),
(386, 8, 9),
(387, 1, 8),
(388, 8, 10),
(389, 6, 7),
(390, 8, 9),
(391, 8, 8),
(392, 6, 7),
(393, 8, 9),
(394, 7, 8),
(395, 4, 5),
(396, 3, 6),
(397, 3, 5),
(398, 9, 8),
(399, 6, 6),
(400, 8, 10),
(401, 1, 9),
(402, 6, 3),
(403, 7, 5),
(404, 5, 9),
(405, 2, 7),
(406, 10, 10),
(407, 10, 9),
(408, 9, 7),
(409, 8, 8),
(410, 8, 9),
(411, 1, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catering`
--
ALTER TABLE `catering`
  ADD PRIMARY KEY (`venue_id`,`grade`,`cost`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`venue_id`);

--
-- Indexes for table `venue_booking`
--
ALTER TABLE `venue_booking`
  ADD PRIMARY KEY (`venue_id`,`booking_date`);

--
-- Indexes for table `venue_review_score`
--
ALTER TABLE `venue_review_score`
  ADD PRIMARY KEY (`review_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `venue_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `venue_review_score`
--
ALTER TABLE `venue_review_score`
  MODIFY `review_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=412;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
