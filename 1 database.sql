-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 06:00 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `door2door_courier`
--
CREATE DATABASE IF NOT EXISTS `door2door_courier` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `door2door_courier`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `full_address` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`full_address`, `city`, `state`, `zip_code`) VALUES
('123 Main St, Anytown USA', 'Anytown', 'USA', '12345'),
('123,example', 'galle', 'usa', '12345'),
('123,example,example', 'mata', 'usa', '123456'),
('135 Oak St, Anytown USA', 'Anytown', 'USA', '34568'),
('246 Main Ave, Anycity USA', 'Anycity', 'USA', '34567'),
('321 Pine St, Anytown USA', 'Anytown', 'USA', '67890'),
('357 Maple Blvd, Anyville USA', 'Anyville', 'USA', '45678'),
('456 Oak Ave, Anycity USA', 'Anycity', 'USA', '87654'),
('468 Pine St, Anytown USA', 'Anytown', 'USA', '23456'),
('654 Elm Ave, Anycity USA', 'Anycity', 'USA', '98765'),
('789 Maple Blvd, Anyville USA', 'Anyville', 'USA', '65432'),
('987 Cedar Blvd, Anyville USA', 'Anyville', 'USA', '54321'),
('saxasxa,saxascxa.ascxas', 'safsdfsd', 'dsfsdf', '46546'),
('saxasxa,saxascxa.ascxas5', 'hgh', 'sfsdf', '5343'),
('saxasxa,saxascxa.ascxas54', 'matara', 'dcsd', '5343'),
('saxasxa,saxascxa.ascxas55', 'hghggj', 'lklklk', '3543543'),
('saxasxa,saxascxa.ascxass', 'galle', 'usa', '456');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `branch_address` varchar(100) DEFAULT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `branch_address`, `emp_id`) VALUES
(10003, 'anuradhapura', '324, Anuradhapura', 116);

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `b_id` int(11) NOT NULL,
  `b_name` varchar(50) DEFAULT NULL,
  `b_phone` varchar(20) DEFAULT NULL,
  `full_address` varchar(100) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`b_id`, `b_name`, `b_phone`, `full_address`, `payment_id`) VALUES
(1111, 'example', '01234', '123,example', 100009),
(1234, 'example123', '012345', '123,example,example', 100018),
(8767, 'dsgdsvg', '01345545', 'saxasxa,saxascxa.ascxas', 100002),
(12345, 'scdsdv sdvsd', '453456', 'saxasxa,saxascxa.ascxas54', 100010);

-- --------------------------------------------------------

--
-- Table structure for table `delivers_to`
--

DROP TABLE IF EXISTS `delivers_to`;
CREATE TABLE `delivers_to` (
  `b_id` int(11) NOT NULL,
  `dm_name` varchar(50) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `tracking_number` int(11) NOT NULL,
  `expected_deliver_date` date DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`tracking_number`, `expected_deliver_date`, `location`) VALUES
(3214, '2024-03-06', 'matara'),
(3215, '2024-03-06', 'galle'),
(4445, '2023-05-05', 'galle'),
(5415, '2023-05-12', 'galle'),
(12345, '2023-05-26', 'badulla'),
(44455, '2023-05-12', 'galle'),
(324132, '2023-05-30', 'ssdaf');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man`
--

DROP TABLE IF EXISTS `delivery_man`;
CREATE TABLE `delivery_man` (
  `dm_name` varchar(50) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `working_hours` int(11) DEFAULT NULL,
  `time_shift` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_man`
--

INSERT INTO `delivery_man` (`dm_name`, `emp_id`, `working_hours`, `time_shift`) VALUES
('Chris Lee', 119, 8, 'Morning'),
('David Brown', 107, 6, 'Morning'),
('Emily Davis', 110, 8, 'Morning'),
('Eric Chen', 109, 7, 'Evening'),
('Grace Kim', 116, 6, 'Morning'),
('Karen Wong', 112, 6, 'Evening'),
('Kevin Lee', 115, 8, 'Evening'),
('Lisa Jackson', 104, 7, 'Morning'),
('Mark Johnson', 113, 7, 'Morning'),
('Mike Johnson', 103, 6, 'Evening'),
('Sara Patel', 118, 7, 'Evening'),
('Sarah Lee', 106, 8, 'Evening');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `designation` enum('Manager','Delivery Man') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `salary`, `designation`) VALUES
(103, 'Mike Johnson', '40000.00', 'Delivery Man'),
(104, 'Lisa Jackson', '55000.00', 'Delivery Man'),
(105, 'Tom Wilson', '48000.00', 'Manager'),
(106, 'Sarah Lee', '42000.00', 'Delivery Man'),
(107, 'David Brown', '52000.00', 'Delivery Man'),
(108, 'Jessica Kim', '47000.00', 'Manager'),
(109, 'Eric Chen', '41000.00', 'Delivery Man'),
(110, 'Emily Davis', '53000.00', 'Delivery Man'),
(111, 'Paul Singh', '46000.00', 'Manager'),
(112, 'Karen Wong', '44000.00', 'Delivery Man'),
(113, 'Mark Johnson', '51000.00', 'Delivery Man'),
(114, 'Amy Chen', '49000.00', 'Manager'),
(115, 'Kevin Lee', '43000.00', 'Delivery Man'),
(116, 'Grace Kim', '50000.00', 'Delivery Man'),
(117, 'Jacob Davis', '47000.00', 'Manager'),
(118, 'Sara Patel', '42000.00', 'Delivery Man'),
(119, 'Chris Lee', '54000.00', 'Delivery Man'),
(120, 'Jenny Kim', '46000.00', 'Manager'),
(1111, 'example', '80000.00', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_data_with`
--

DROP TABLE IF EXISTS `exchange_data_with`;
CREATE TABLE `exchange_data_with` (
  `branch_id` int(11) NOT NULL,
  `dm_name` varchar(50) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gives`
--

DROP TABLE IF EXISTS `gives`;
CREATE TABLE `gives` (
  `seller_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gives`
--

INSERT INTO `gives` (`seller_id`, `product_id`) VALUES
(10001, 'A01'),
(10001, 'A11'),
(10001, 'A21'),
(10002, 'L02'),
(10002, 'L12'),
(10002, 'L22'),
(10003, 'G03'),
(10003, 'G13'),
(10004, 'S04'),
(10004, 'S14'),
(10005, 'A001'),
(10005, 'B05'),
(10005, 'B15'),
(10005, 'L07'),
(10006, 'A06'),
(10006, 'A16'),
(10007, 'L07'),
(10007, 'L17'),
(10008, 'A005'),
(10008, 'G08'),
(10008, 'G18'),
(10009, 'S09'),
(10009, 'S19'),
(10010, 'B10'),
(10010, 'B20');

-- --------------------------------------------------------

--
-- Table structure for table `handled_by`
--

DROP TABLE IF EXISTS `handled_by`;
CREATE TABLE `handled_by` (
  `transport_method` varchar(50) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `dm_name` varchar(50) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handled_by`
--

INSERT INTO `handled_by` (`transport_method`, `product_id`, `dm_name`, `emp_id`) VALUES
('Bike', 'A21', 'Mark Johnson', 113),
('Bike', 'L12', 'Lisa Jackson', 104),
('Bike', 'L22', 'Karen Wong', 112),
('Bike', 'S09', 'Lisa Jackson', 104),
('Car', 'A16', 'Emily Davis', 110),
('Car', 'B05', 'Kevin Lee', 115),
('Car', 'G18', 'Karen Wong', 112),
('Car', 'L17', 'Grace Kim', 116),
('ThreeWheel', 'A06', 'Grace Kim', 116),
('ThreeWheel', 'B10', 'Eric Chen', 109),
('ThreeWheel', 'G08', 'Chris Lee', 119),
('Truck', 'A01', 'Kevin Lee', 115),
('Truck', 'A11', 'Chris Lee', 119),
('Truck', 'G03', 'Sara Patel', 118),
('Truck', 'G13', 'Mark Johnson', 113),
('Truck', 'L02', 'Mark Johnson', 113),
('Truck', 'S04', 'Mark Johnson', 113),
('Van', 'B15', 'Grace Kim', 116),
('Van', 'B20', 'Mark Johnson', 113),
('Van', 'L07', 'Karen Wong', 112),
('Van', 'S14', 'Lisa Jackson', 104),
('Van', 'S19', 'Chris Lee', 119);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` varchar(100) NOT NULL,
  `placed_date` date DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `emp_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `placed_date`, `price`, `emp_id`, `b_id`) VALUES
('ORD0000001', '2023-05-04', '65.00', 103, 8767),
('ORD0000002', '2023-05-04', '149.99', 103, 12345);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `method` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `method`, `total_price`) VALUES
(100001, 'credit card', '999.99'),
(100002, 'bill', '500.00'),
(100003, 'mobile payment', '1499.99'),
(100004, 'crypto', '999.99'),
(100005, 'store credit', '399.99'),
(100006, 'paypal', '299.99'),
(100007, 'debit card', '149.99'),
(100008, 'credit card', '299.99'),
(100009, 'mobile payment', '49.99'),
(100010, 'gift card', '799.99'),
(100011, 'debit card', '399.99'),
(100012, 'crypto', '99.99'),
(100013, 'paypal', '99.99'),
(100014, 'store credit', '1499.99'),
(100015, 'credit card', '1499.99'),
(100016, 'debit card', '99.99'),
(100017, 'gift card', '599.99'),
(100018, 'store credit', '129.99'),
(100019, 'crypto', '849.99'),
(100020, 'paypal', '349.99'),
(100021, 'mobile payment', '649.99'),
(100022, 'credit card', '249.99');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `total_price`, `delivery_address`, `quantity`) VALUES
('A001', 'Bottle', '65.00', 'asddasd', 20),
('A005', 'brush', '65.00', 'asddasd', 20),
('A01', 'Apple iPhone 13', '999.99', '123 Main St, Anytown USA', 10),
('A06', 'Apple AirPods Pro', '249.99', '987 Cedar Blvd, Anyville USA', 12),
('A11', 'Apple MacBook Pro', '1499.99', '123 Main St, Anytown USA', 3),
('A16', 'Apple iPad Pro', '999.99', '987 Cedar Blvd, Anyville USA', 5),
('A21', 'Apple Watch Series 7', '399.99', '123 Main St, Anytown USA', 4),
('B05', 'Bose QuietComfort 35 II', '299.99', '654 Elm Ave, Anycity USA', 8),
('B10', 'Beats Studio Buds', '149.99', '468 Pine St, Anytown USA', 18),
('B15', 'Bose SoundLink Revolve+', '299.99', '654 Elm Ave, Anycity USA', 6),
('B20', 'Beats Flex', '49.99', '468 Pine St, Anytown USA', 25),
('G03', 'Google Pixel 6', '799.99', '789 Maple Blvd, Anyville USA', 20),
('G08', 'GoPro HERO10 Black', '399.99', '246 Main Ave, Anycity USA', 4),
('G13', 'Google Nest Audio', '99.99', '789 Maple Blvd, Anyville USA', 14),
('G18', 'Google Nest Hub (2nd gen)', '99.99', '246 Main Ave, Anycity USA', 20),
('L02', 'Lenovo ThinkPad X1 Carbon', '1499.99', '456 Oak Ave, Anycity USA', 5),
('L07', 'New Product', '400.00', '111,example', 5),
('L12', 'Logitech MX Master 3', '99.99', '456 Oak Ave, Anycity USA', 7),
('L17', 'Lenovo IdeaPad Flex 5', '599.99', '135 Oak St, Anytown USA', 12),
('L22', 'Logitech G Pro X Superlight', '129.99', '456 Oak Ave, Anycity USA', 6),
('S04', 'Samsung Galaxy S21', '849.99', '321 Pine St, Anytown USA', 15),
('S09', 'Sony WH-1000XM4', '349.99', '357 Maple Blvd, Anyville USA', 6),
('S14', 'Samsung Galaxy Tab S7', '649.99', '321 Pine St, Anytown USA', 9),
('S19', 'Samsung Galaxy Watch4', '249.99', '357 Maple Blvd, Anyville USA', 8);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(50) NOT NULL,
  `seller_address` varchar(100) DEFAULT NULL,
  `phone_num` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `seller_name`, `seller_address`, `phone_num`) VALUES
(10001, 'John', '123 Main St, Anytown USA', '0123456789'),
(10002, 'Mike', '456 Oak Ave, Anycity USA', '0234567890'),
(10003, 'Sarah', '789 Maple Blvd, Anyville USA', '0345678901'),
(10004, 'Emily', '321 Pine St, Anytown USA', '0456789012'),
(10005, 'David', '654 Elm Ave, Anycity USA', '0567890123'),
(10006, 'Chris', '987 Cedar Blvd, Anyville USA', '0678901234'),
(10007, 'Jessica', '135 Oak St, Anytown USA', '0789012345'),
(10008, 'Matt', '246 Main Ave, Anycity USA', '0890123456'),
(10009, 'Alex', '357 Maple Blvd, Anyville USA', '0901234567'),
(10010, 'Kim', '468 Pine St, Anytown USA', '0012345678');

-- --------------------------------------------------------

--
-- Table structure for table `serves`
--

DROP TABLE IF EXISTS `serves`;
CREATE TABLE `serves` (
  `seller_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `serves`
--

INSERT INTO `serves` (`seller_id`, `emp_id`) VALUES
(10001, 117),
(10002, 114),
(10003, 120),
(10004, 111),
(10005, 108),
(10006, 114),
(10007, 105),
(10008, 105),
(10009, 120),
(10010, 108);

-- --------------------------------------------------------

--
-- Table structure for table `special_package`
--

DROP TABLE IF EXISTS `special_package`;
CREATE TABLE `special_package` (
  `package_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `gift_or_not` tinyint(1) NOT NULL,
  `extra_charges` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_package`
--

INSERT INTO `special_package` (`package_id`, `product_id`, `gift_or_not`, `extra_charges`) VALUES
(1001, 'A01', 1, '50.00'),
(1002, 'L02', 0, NULL),
(1003, 'G03', 1, '25.00'),
(1008, 'G08', 0, NULL),
(1009, 'S09', 1, '20.00'),
(1010, 'B10', 0, NULL),
(1011, 'A11', 1, '75.00'),
(1012, 'L12', 0, NULL),
(1013, 'G13', 1, '15.00'),
(1021, 'A21', 1, '80.00'),
(1022, 'L22', 0, NULL),
(1023, 'A001', 0, '6.50'),
(1024, 'A01', 1, '100.00'),
(1025, 'A01', 1, '100.00'),
(1027, 'A01', 0, '1099.99'),
(1028, 'L07', 1, '440.00');

-- --------------------------------------------------------

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `transport_method` varchar(50) DEFAULT NULL,
  `distance` decimal(10,2) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `product_id` varchar(10) NOT NULL,
  `dm_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transport`
--

INSERT INTO `transport` (`transport_method`, `distance`, `weight`, `product_id`, `dm_name`) VALUES
('Truck', '80.94', '88.29', 'A01', 'Kevin Lee'),
('ThreeWheel', '41.35', '31.70', 'A06', 'Grace Kim'),
('Truck', '56.62', '89.31', 'A11', 'Chris Lee'),
('Car', '33.00', '70.05', 'A16', 'Emily Davis'),
('Bike', '50.44', '25.76', 'A21', 'Mark Johnson'),
('Car', '11.35', '81.33', 'B05', 'Kevin Lee'),
('ThreeWheel', '11.95', '16.89', 'B10', 'Eric Chen'),
('Van', '37.06', '8.18', 'B15', 'Grace Kim'),
('Van', '70.93', '91.42', 'B20', 'Mark Johnson'),
('Truck', '15.08', '64.04', 'G03', 'Sara Patel'),
('ThreeWheel', '70.03', '68.45', 'G08', 'Chris Lee'),
('Truck', '0.04', '69.43', 'G13', 'Mark Johnson'),
('Car', '35.14', '88.79', 'G18', 'Karen Wong'),
('Truck', '69.32', '25.17', 'L02', 'Mark Johnson'),
('Van', '4.93', '84.00', 'L07', 'Karen Wong'),
('Bike', '8.04', '97.25', 'L12', 'Lisa Jackson'),
('Car', '94.01', '56.21', 'L17', 'Grace Kim'),
('Bike', '50.53', '37.79', 'L22', 'Karen Wong'),
('Truck', '29.50', '52.28', 'S04', 'Mark Johnson'),
('Bike', '95.29', '61.01', 'S09', 'Lisa Jackson'),
('Van', '5.70', '8.27', 'S14', 'Lisa Jackson'),
('Van', '38.64', '21.26', 'S19', 'Chris Lee'),
('Truck', '100.00', '45.00', 'A005', 'Lisa Jackson'),
('ThreeWheel', '1000.00', '45.00', 'A005', 'Grace Kim'),
('Car', '100.00', '10.00', 'L07', 'Sara Patel');

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
CREATE TABLE `updates` (
  `branch_id` int(11) NOT NULL,
  `tracking_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`full_address`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`b_id`),
  ADD KEY `full_address` (`full_address`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `delivers_to`
--
ALTER TABLE `delivers_to`
  ADD PRIMARY KEY (`b_id`,`dm_name`,`emp_id`),
  ADD KEY `dm_name` (`dm_name`,`emp_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`tracking_number`);

--
-- Indexes for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`dm_name`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `dm_name` (`dm_name`,`emp_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `exchange_data_with`
--
ALTER TABLE `exchange_data_with`
  ADD PRIMARY KEY (`branch_id`,`dm_name`,`emp_id`),
  ADD KEY `dm_name` (`dm_name`,`emp_id`);

--
-- Indexes for table `gives`
--
ALTER TABLE `gives`
  ADD PRIMARY KEY (`seller_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `handled_by`
--
ALTER TABLE `handled_by`
  ADD PRIMARY KEY (`transport_method`,`product_id`,`dm_name`,`emp_id`),
  ADD KEY `dm_name` (`dm_name`,`emp_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `b_id` (`b_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `serves`
--
ALTER TABLE `serves`
  ADD PRIMARY KEY (`seller_id`,`emp_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `special_package`
--
ALTER TABLE `special_package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `transport`
--
ALTER TABLE `transport`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `dm_name` (`dm_name`),
  ADD KEY `transport_method` (`transport_method`,`product_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`branch_id`,`tracking_number`),
  ADD KEY `tracking_number` (`tracking_number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`full_address`) REFERENCES `address` (`full_address`),
  ADD CONSTRAINT `buyer_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `delivers_to`
--
ALTER TABLE `delivers_to`
  ADD CONSTRAINT `delivers_to_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `buyer` (`b_id`),
  ADD CONSTRAINT `delivers_to_ibfk_2` FOREIGN KEY (`dm_name`,`emp_id`) REFERENCES `delivery_man` (`dm_name`, `emp_id`);

--
-- Constraints for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD CONSTRAINT `delivery_man_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `exchange_data_with`
--
ALTER TABLE `exchange_data_with`
  ADD CONSTRAINT `exchange_data_with_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `exchange_data_with_ibfk_2` FOREIGN KEY (`dm_name`,`emp_id`) REFERENCES `delivery_man` (`dm_name`, `emp_id`);

--
-- Constraints for table `gives`
--
ALTER TABLE `gives`
  ADD CONSTRAINT `gives_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`),
  ADD CONSTRAINT `gives_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `handled_by`
--
ALTER TABLE `handled_by`
  ADD CONSTRAINT `handled_by_ibfk_1` FOREIGN KEY (`transport_method`,`product_id`) REFERENCES `transport` (`transport_method`, `product_id`),
  ADD CONSTRAINT `handled_by_ibfk_2` FOREIGN KEY (`dm_name`) REFERENCES `delivery_man` (`dm_name`),
  ADD CONSTRAINT `handled_by_ibfk_3` FOREIGN KEY (`dm_name`,`emp_id`) REFERENCES `delivery_man` (`dm_name`, `emp_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `buyer` (`b_id`);

--
-- Constraints for table `serves`
--
ALTER TABLE `serves`
  ADD CONSTRAINT `serves_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`),
  ADD CONSTRAINT `serves_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);

--
-- Constraints for table `special_package`
--
ALTER TABLE `special_package`
  ADD CONSTRAINT `special_package_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `transport`
--
ALTER TABLE `transport`
  ADD CONSTRAINT `transport_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `transport_ibfk_2` FOREIGN KEY (`dm_name`) REFERENCES `delivery_man` (`dm_name`);

--
-- Constraints for table `updates`
--
ALTER TABLE `updates`
  ADD CONSTRAINT `updates_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  ADD CONSTRAINT `updates_ibfk_2` FOREIGN KEY (`tracking_number`) REFERENCES `delivery` (`tracking_number`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

DROP TABLE IF EXISTS `pma__bookmark`;
CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

DROP TABLE IF EXISTS `pma__central_columns`;
CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

DROP TABLE IF EXISTS `pma__column_info`;
CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

DROP TABLE IF EXISTS `pma__designer_settings`;
CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

DROP TABLE IF EXISTS `pma__export_templates`;
CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'Door2Door', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"door2door_courier\",\"phpmyadmin\",\"userd2d\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

DROP TABLE IF EXISTS `pma__favorite`;
CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

DROP TABLE IF EXISTS `pma__history`;
CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

DROP TABLE IF EXISTS `pma__navigationhiding`;
CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

DROP TABLE IF EXISTS `pma__pdf_pages`;
CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

DROP TABLE IF EXISTS `pma__recent`;
CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"door2door_courier\",\"table\":\"address\"},{\"db\":\"userd2d\",\"table\":\"users\"},{\"db\":\"door2door_courier\",\"table\":\"special_package\"},{\"db\":\"door2door_courier\",\"table\":\"employee\"},{\"db\":\"door2door_courier\",\"table\":\"transport\"},{\"db\":\"door2door_courier\",\"table\":\"orders\"},{\"db\":\"door2door_courier\",\"table\":\"product\"},{\"db\":\"door2door_courier\",\"table\":\"buyer\"},{\"db\":\"door2door_courier\",\"table\":\"payment\"},{\"db\":\"door2door_courier\",\"table\":\"delivery_man\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

DROP TABLE IF EXISTS `pma__relation`;
CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

DROP TABLE IF EXISTS `pma__savedsearches`;
CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

DROP TABLE IF EXISTS `pma__table_coords`;
CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

DROP TABLE IF EXISTS `pma__table_info`;
CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

DROP TABLE IF EXISTS `pma__table_uiprefs`;
CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'door2door_courier', 'product', '{\"sorted_col\":\"`product`.`total_price` ASC\"}', '2023-05-04 08:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

DROP TABLE IF EXISTS `pma__tracking`;
CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

DROP TABLE IF EXISTS `pma__userconfig`;
CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-05-04 14:05:49', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

DROP TABLE IF EXISTS `pma__usergroups`;
CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

DROP TABLE IF EXISTS `pma__users`;
CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `userd2d`
--
CREATE DATABASE IF NOT EXISTS `userd2d` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `userd2d`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(6) UNSIGNED NOT NULL,
  `persons` int(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `persons`, `email`, `name`, `username`, `address`, `password`) VALUES
(3, 2, 'John12334@gmail.com', 'John Lockey', 'John0091', 'wdfefee,erferf,referf', '123'),
(4, 1, 'John123d@gmail.com1', 'John Locker', 'john0095', 'sdcsdfsw', '123'),
(5, 3, 'John123dd@gmail.com1', 'John Locks', 'John0093', 'jkfgkjd', '123'),
(6, 4, 'John12ff3dd@gmail.com1', 'John Locksf', 'John0092', 'jkfgkjdf', '123'),
(7, 1, 'admin@gmail.com', 'admin admin', 'admin123', '123,test,admin,', 'admin123'),
(8, 3, 'seller@gmail.com', 'seller seller', 'seller123', '123,seller,seller', 'seller123'),
(9, 2, 'employee@gmail.com', 'employee employee', 'emp123', '123,emp,emp', 'emp123'),
(10, 4, 'buyer@gmail.com', 'buyer buyer', 'buyer123', '123,buyer,buyer', 'buyer123'),
(11, 1, 'example@gmail.com', 'example name', 'example', '123,example', 'example123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
