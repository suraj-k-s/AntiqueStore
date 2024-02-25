-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2024 at 09:53 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_antiquestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_username` varchar(50) DEFAULT NULL,
  `admin_password` varchar(50) DEFAULT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anticat`
--

CREATE TABLE `tbl_anticat` (
  `anticat_id` int(10) UNSIGNED NOT NULL,
  `anticat_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assignedloc`
--

CREATE TABLE `tbl_assignedloc` (
  `dboyassignedloc_id` int(10) UNSIGNED NOT NULL,
  `dboy_id` int(10) UNSIGNED DEFAULT NULL,
  `dboy_pincodes` varchar(50) DEFAULT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biddingproduct`
--

CREATE TABLE `tbl_biddingproduct` (
  `bp_id` int(10) UNSIGNED NOT NULL,
  `anticat_id` varchar(500) DEFAULT NULL,
  `bp_name` varchar(500) DEFAULT NULL,
  `bp_description` varchar(500) DEFAULT NULL,
  `bp_aboutproduct` varchar(500) DEFAULT NULL,
  `bp_rate` varchar(500) DEFAULT NULL,
  `bp_startdate` varchar(100) DEFAULT NULL,
  `bp_enddate` varchar(100) DEFAULT NULL,
  `bp_starttime` varchar(100) DEFAULT NULL,
  `bp_endtime` varchar(100) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `bp_update` varchar(50) DEFAULT '0',
  `bp_vstatus` int(50) UNSIGNED DEFAULT 0,
  `bp_cstatus` int(50) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cartbody`
--

CREATE TABLE `tbl_cartbody` (
  `cbody_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_qty` varchar(50) DEFAULT '1',
  `cart_status` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carthead`
--

CREATE TABLE `tbl_carthead` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `booking_status` varchar(50) DEFAULT '0',
  `booking_date` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT '0',
  `grand_total` int(10) UNSIGNED DEFAULT 0,
  `dboy_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complainttype_id` int(11) DEFAULT NULL,
  `complaint_title` varchar(500) DEFAULT NULL,
  `complaint_content` varchar(50) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT 0,
  `shop_id` int(10) UNSIGNED DEFAULT 0,
  `dboy_id` int(10) UNSIGNED DEFAULT 0,
  `complaint_status` varchar(50) DEFAULT '0',
  `complaint_reply` varchar(50) DEFAULT 'Not Yet Viewed',
  `complaint_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complainttype`
--

CREATE TABLE `tbl_complainttype` (
  `complainttype_id` int(10) UNSIGNED NOT NULL,
  `complainttype_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_id` int(10) UNSIGNED NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_contact` varchar(50) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_gender` varchar(50) DEFAULT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `customer_adhaarno` varchar(50) DEFAULT NULL,
  `customer_proof` varchar(50) DEFAULT NULL,
  `customer_username` varchar(50) DEFAULT NULL,
  `customer_password` varchar(50) DEFAULT NULL,
  `customer_doj` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dboy`
--

CREATE TABLE `tbl_dboy` (
  `dboy_id` int(10) NOT NULL,
  `dboy_name` varchar(50) DEFAULT NULL,
  `dboy_contact1` bigint(20) UNSIGNED DEFAULT NULL,
  `dboy_contact2` bigint(20) UNSIGNED DEFAULT NULL,
  `dboy_email` varchar(50) DEFAULT NULL,
  `dboy_gender` varchar(50) DEFAULT NULL,
  `dboy_address` varchar(50) DEFAULT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL,
  `dboy_username` varchar(50) DEFAULT NULL,
  `dboy_password` varchar(50) DEFAULT NULL,
  `dboy_isactive` varchar(50) DEFAULT '0',
  `shop_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(10) UNSIGNED NOT NULL,
  `district_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pgallery`
--

CREATE TABLE `tbl_pgallery` (
  `pgallery_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `pgallery_image` varchar(50) DEFAULT NULL,
  `pgallery_caption` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `place_name` varchar(50) DEFAULT NULL,
  `place_pincode` int(10) UNSIGNED DEFAULT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `anticat_id` int(10) UNSIGNED DEFAULT NULL,
  `product_description` varchar(500) DEFAULT NULL,
  `product_image` varchar(50) DEFAULT NULL,
  `product_rate` float UNSIGNED DEFAULT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productstock`
--

CREATE TABLE `tbl_productstock` (
  `pstock_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `pstock_qty` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `request_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `bp_id` int(10) UNSIGNED DEFAULT NULL,
  `bid_rate` int(100) UNSIGNED NOT NULL,
  `req_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop`
--

CREATE TABLE `tbl_shop` (
  `shop_id` int(10) UNSIGNED NOT NULL,
  `shop_name` varchar(50) DEFAULT NULL,
  `shop_contact` varchar(50) DEFAULT NULL,
  `shop_email` varchar(50) DEFAULT NULL,
  `shop_photo` varchar(50) DEFAULT NULL,
  `shop_licno` varchar(100) NOT NULL,
  `shop_proof` varchar(50) DEFAULT NULL,
  `shop_address` varchar(50) DEFAULT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL,
  `shop_username` varchar(50) DEFAULT NULL,
  `shop_password` varchar(50) DEFAULT NULL,
  `shop_isactive` int(50) DEFAULT 0,
  `shop_doj` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_anticat`
--
ALTER TABLE `tbl_anticat`
  ADD PRIMARY KEY (`anticat_id`),
  ADD UNIQUE KEY `anticat_id` (`anticat_id`);

--
-- Indexes for table `tbl_assignedloc`
--
ALTER TABLE `tbl_assignedloc`
  ADD PRIMARY KEY (`dboyassignedloc_id`),
  ADD UNIQUE KEY `dboyassignedloc_id` (`dboyassignedloc_id`);

--
-- Indexes for table `tbl_biddingproduct`
--
ALTER TABLE `tbl_biddingproduct`
  ADD PRIMARY KEY (`bp_id`),
  ADD UNIQUE KEY `bp_id` (`bp_id`);

--
-- Indexes for table `tbl_cartbody`
--
ALTER TABLE `tbl_cartbody`
  ADD PRIMARY KEY (`cbody_id`),
  ADD UNIQUE KEY `cartbody_id` (`cbody_id`);

--
-- Indexes for table `tbl_carthead`
--
ALTER TABLE `tbl_carthead`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  ADD PRIMARY KEY (`complainttype_id`),
  ADD UNIQUE KEY `complainttype_id` (`complainttype_id`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`);

--
-- Indexes for table `tbl_dboy`
--
ALTER TABLE `tbl_dboy`
  ADD PRIMARY KEY (`dboy_id`),
  ADD UNIQUE KEY `dboy_id` (`dboy_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`),
  ADD UNIQUE KEY `district_id` (`district_id`);

--
-- Indexes for table `tbl_pgallery`
--
ALTER TABLE `tbl_pgallery`
  ADD PRIMARY KEY (`pgallery_id`),
  ADD UNIQUE KEY `pgallery_id` (`pgallery_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`),
  ADD UNIQUE KEY `place_id` (`place_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_productstock`
--
ALTER TABLE `tbl_productstock`
  ADD PRIMARY KEY (`pstock_id`),
  ADD UNIQUE KEY `pstock_id` (`pstock_id`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  ADD PRIMARY KEY (`shop_id`),
  ADD UNIQUE KEY `shop_id` (`shop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_anticat`
--
ALTER TABLE `tbl_anticat`
  MODIFY `anticat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_assignedloc`
--
ALTER TABLE `tbl_assignedloc`
  MODIFY `dboyassignedloc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_biddingproduct`
--
ALTER TABLE `tbl_biddingproduct`
  MODIFY `bp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cartbody`
--
ALTER TABLE `tbl_cartbody`
  MODIFY `cbody_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_carthead`
--
ALTER TABLE `tbl_carthead`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  MODIFY `complainttype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_dboy`
--
ALTER TABLE `tbl_dboy`
  MODIFY `dboy_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pgallery`
--
ALTER TABLE `tbl_pgallery`
  MODIFY `pgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_productstock`
--
ALTER TABLE `tbl_productstock`
  MODIFY `pstock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  MODIFY `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
