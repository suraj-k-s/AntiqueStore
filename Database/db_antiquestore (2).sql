-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2024 at 07:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_username`, `admin_password`, `admin_id`) VALUES
('sarath', 'sarath123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anticat`
--

CREATE TABLE `tbl_anticat` (
  `anticat_id` int(10) UNSIGNED NOT NULL,
  `anticat_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_anticat`
--

INSERT INTO `tbl_anticat` (`anticat_id`, `anticat_name`) VALUES
(1, 'Phone'),
(2, 'TV'),
(3, 'Chair'),
(4, 'CLOCK'),
(5, 'CUP');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assignedloc`
--

CREATE TABLE `tbl_assignedloc` (
  `dboyassignedloc_id` int(10) UNSIGNED NOT NULL,
  `dboy_id` int(10) UNSIGNED DEFAULT NULL,
  `dboy_pincodes` varchar(50) DEFAULT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_assignedloc`
--

INSERT INTO `tbl_assignedloc` (`dboyassignedloc_id`, `dboy_id`, `dboy_pincodes`, `place_id`) VALUES
(1, 2, '685605', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assignorder`
--

CREATE TABLE `tbl_assignorder` (
  `assignorder_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `dboy_id` int(10) UNSIGNED DEFAULT NULL,
  `dboy_pstatus` varchar(50) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_biddingproduct`
--

INSERT INTO `tbl_biddingproduct` (`bp_id`, `anticat_id`, `bp_name`, `bp_description`, `bp_aboutproduct`, `bp_rate`, `bp_startdate`, `bp_enddate`, `bp_starttime`, `bp_endtime`, `shop_id`, `bp_update`, `bp_vstatus`, `bp_cstatus`) VALUES
(1, '1', 'xffgjhk', 'dxgfghjb', 'Biddingproductphoto_1796.jpg', '100', '2024-04-04', '2024-04-05', '10:40', '00:50', 1, '2024-04-04', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bpgallery`
--

CREATE TABLE `tbl_bpgallery` (
  `bpgallery_id` int(10) UNSIGNED NOT NULL,
  `bproduct_id` int(10) UNSIGNED DEFAULT NULL,
  `bpgallery_image` varchar(50) DEFAULT NULL,
  `bpgallery_caption` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cartbody`
--

INSERT INTO `tbl_cartbody` (`cbody_id`, `cart_id`, `product_id`, `cart_qty`, `cart_status`) VALUES
(1, 1, 2, '1', '1'),
(2, 1, 3, '1', '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_carthead`
--

INSERT INTO `tbl_carthead` (`cart_id`, `customer_id`, `booking_status`, `booking_date`, `payment_status`, `grand_total`, `dboy_id`) VALUES
(1, 4, '7', '2024-04-04', '1', 600000, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complainttype_id`, `complaint_title`, `complaint_content`, `customer_id`, `shop_id`, `dboy_id`, `complaint_status`, `complaint_reply`, `complaint_date`) VALUES
(1, 2, 'about the delivery boy', 'jfjfjjf', 1, 0, 0, '1', 'Sorry', '2024-02-21'),
(2, 1, 'about the product', 'awessome...', 1, 0, 0, '1', 'ok', '2024-02-21'),
(3, 1, 'kkk', 'have no\r\n', 4, 0, 0, '1', 'sorry for that ', '2024-04-04'),
(4, 1, 'kkk', 'have no\r\n', 4, 0, 0, '0', 'Not Yet Viewed', '2024-04-04'),
(5, 1, 'kkk', 'have no\r\n', 4, 0, 0, '0', 'Not Yet Viewed', '2024-04-04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complainttype`
--

CREATE TABLE `tbl_complainttype` (
  `complainttype_id` int(10) UNSIGNED NOT NULL,
  `complainttype_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_complainttype`
--

INSERT INTO `tbl_complainttype` (`complainttype_id`, `complainttype_name`) VALUES
(1, 'good'),
(2, 'Average');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_id`, `customer_name`, `customer_contact`, `customer_email`, `customer_gender`, `place_id`, `customer_address`, `customer_adhaarno`, `customer_proof`, `customer_username`, `customer_password`, `customer_doj`) VALUES
(1, 'SIYAD NISSAR', '9876543200', 'siyadj@gmail.com', 'Male', 1, 'edavaetty (H) Thodupuzha', '1232256567876', 'Customerproof_2043.jpg', 'Siyad', 'siyad1234', '2024-02-14'),
(2, 'NAMASURYA PP', '9876543210', 'Namasurya@gmail.com', 'Male', 2, 'Parayil(H) Kochin Buildings , Flat No 32, Kochi', '223454336789', 'Customerproof_1974.png', 'Namasurya', 'Namasurya123', '2024-02-14'),
(3, 'ASWIN', '7689098765', 'Aswin@gmail.com', 'Male', 3, 'arayil(H) deyhard Buildings ,  Ambalappuzha', '211111126789', 'Customerproof_1932.jpg', 'Aswin', 'Aswin123', '2024-02-14'),
(4, 'SHYAM REJI', '9876543290', 'Shyam@gmail.com', 'Male', 4, 'Puzhayil (H) Second street , Ambalappuzha', '223245345889', 'Customerproof_1659.webp', 'Shyam', 'Shyam123', '2024-02-14');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_dboy`
--

INSERT INTO `tbl_dboy` (`dboy_id`, `dboy_name`, `dboy_contact1`, `dboy_contact2`, `dboy_email`, `dboy_gender`, `dboy_address`, `district_id`, `dboy_username`, `dboy_password`, `dboy_isactive`, `shop_id`) VALUES
(1, 'THANSEER', 9876543210, 9876543210, 'Thanseer@gmail.com', 'Male', 'jjjjjjjj', 2, 'Thanseer', 'Thanseeer123', '0', 2),
(2, 'dev', 9876543210, 9876543210, 'dev@gmail.com', 'Male', 'fhfhfh', 1, 'dev', 'Dev123', '0', 1),
(3, 'Athil', 9876549290, 9876549210, 'Athil@gmail.com', 'Male', 'tdpa', 1, 'Athil', 'athil1234', '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(10) UNSIGNED NOT NULL,
  `district_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(1, 'IDUKKI'),
(2, 'ERNAKULAM'),
(3, 'KOTTAYAM'),
(4, 'ALAPPUZHA');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pgallery`
--

CREATE TABLE `tbl_pgallery` (
  `pgallery_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `pgallery_image` varchar(50) DEFAULT NULL,
  `pgallery_caption` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pgallery`
--

INSERT INTO `tbl_pgallery` (`pgallery_id`, `product_id`, `pgallery_image`, `pgallery_caption`) VALUES
(4, 1, 'Productphoto_1084.jpg', 'Since 1972'),
(5, 5, 'Productphoto_1649.jpg', 'dsede'),
(6, 6, 'Productphoto_1847.jpg', 'Since 1972');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(10) UNSIGNED NOT NULL,
  `place_name` varchar(50) DEFAULT NULL,
  `place_pincode` int(10) UNSIGNED DEFAULT NULL,
  `district_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `place_pincode`, `district_id`) VALUES
(1, 'THODUPUZHA', 685605, 1),
(2, 'KOCHI', 67564, 2),
(3, 'PALA', 675433, 3),
(4, 'AMBALAPPUZHA', 765543, 4);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `anticat_id`, `product_description`, `product_image`, `product_rate`, `shop_id`) VALUES
(2, 'VINTAGE TV', 2, 'It was the old Telivision since it is developed on 1957 USA, In the upcoming years this Telivision have high demand, Mre about the Telivision is it is on working condition.', 'Productphoto_1968.jpg', 100000, 1),
(3, 'KINGS CHAIR', 3, 'It was the most and high demanding antique product. It was the very rare and one of the chair of King from Thiruvananthapuram Palace', 'Productphoto_1294.jpg', 500000, 1),
(4, 'NOKIA 3310', 1, 'It is the most and high demanded Nokia Phone Since 1992', 'Productphoto_1588.jpg', 15000, 1),
(5, 'C1840 WALL CLOCK', 4, 'One of the most demanded antique item is available for you', 'Productphoto_1331.jpg', 65000, 2),
(6, 'VINTAGE TELEPHONE', 1, ' old telephone since it is developed in 1960, And most demanded anique item in this generation', 'Productphoto_1086.jpg', 15000, 2),
(7, 'C1840 WALL CLOCK', 4, 'It is the most and high demanded Antique item', 'Productphoto_1983.jpg', 5000, 1),
(8, 'VINTAGE TELEPHONE', 1, 'It was the old telephone since it is developed in 1960, And most demanded anique item in this generation', 'Productphoto_1299.jpg', 7000, 1),
(9, 'VINTAGE CUP', 5, 'Rare and most valuable', 'Productphoto_1696.jpg', 5000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productstock`
--

CREATE TABLE `tbl_productstock` (
  `pstock_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `pstock_qty` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_productstock`
--

INSERT INTO `tbl_productstock` (`pstock_id`, `product_id`, `pstock_qty`) VALUES
(1, 1, '17'),
(2, 2, '4'),
(3, 3, '1'),
(4, 4, '8'),
(5, 5, '10');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_shop`
--

INSERT INTO `tbl_shop` (`shop_id`, `shop_name`, `shop_contact`, `shop_email`, `shop_photo`, `shop_licno`, `shop_proof`, `shop_address`, `place_id`, `shop_username`, `shop_password`, `shop_isactive`, `shop_doj`) VALUES
(1, 'VINTIQUE', '7306833451', 'Vintique@gmail.com', 'shop_1240.png', 'Rd223343252', 'shopproof_2103.png', 'Opposite Canara bank vengalloor road, Thodupuzha', 1, 'Vintique', 'Vintique123', 1, '2024-02-14'),
(2, 'COPELAND', '7390876543', 'Copeland@gmail.com', 'shop_1737.jpg', 'Rf223343052', 'shopproof_1501.jpg', 'Opposite Fedrala bank , Kochin road, Kochi', 2, 'Copeland', 'Copeland123', 1, '2024-02-14'),
(3, 'ggggg', '6787676549', 'sarath@gmail.com', 'shop_1480.jpg', 'Rd223343252', 'shopproof_1087.jpg', 'kkkk', 2, 'aadi', 'aadi123', 2, '2024-02-21'),
(4, 'afkk', '6789575678', 'skk@gmail.com', 'shop_1539.jpg', 'Rd223343252', 'shopproof_1988.jpg', 'ddddd', 1, 'skk', 'sk123', 0, '2024-02-21'),
(5, 'RTY OLDERS', '8988766655', 'RTY@gmail.com', 'shop_1166.jpg', '4454433', 'shopproof_1358.jpg', 'jjjjdk', 3, 'RTY', 'rty12345', 0, '2024-03-02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shopowner`
--

CREATE TABLE `tbl_shopowner` (
  `shopowner_id` int(10) UNSIGNED NOT NULL,
  `shopowner_name` varchar(50) DEFAULT NULL,
  `shopowner_contact` int(10) UNSIGNED DEFAULT NULL,
  `shopowner_email` varchar(50) DEFAULT NULL,
  `place_id` int(10) UNSIGNED DEFAULT NULL,
  `shopowner_address` varchar(50) DEFAULT NULL,
  `shopowner_gender` varchar(50) DEFAULT NULL,
  `shop_id` int(10) UNSIGNED DEFAULT NULL,
  `shopowner_adhaarno` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indexes for table `tbl_assignorder`
--
ALTER TABLE `tbl_assignorder`
  ADD PRIMARY KEY (`assignorder_id`),
  ADD UNIQUE KEY `assignorder_id` (`assignorder_id`);

--
-- Indexes for table `tbl_biddingproduct`
--
ALTER TABLE `tbl_biddingproduct`
  ADD PRIMARY KEY (`bp_id`),
  ADD UNIQUE KEY `bp_id` (`bp_id`);

--
-- Indexes for table `tbl_bpgallery`
--
ALTER TABLE `tbl_bpgallery`
  ADD PRIMARY KEY (`bpgallery_id`),
  ADD UNIQUE KEY `bpgallery_id` (`bpgallery_id`);

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
-- Indexes for table `tbl_shopowner`
--
ALTER TABLE `tbl_shopowner`
  ADD PRIMARY KEY (`shopowner_id`),
  ADD UNIQUE KEY `shopowner_id` (`shopowner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_anticat`
--
ALTER TABLE `tbl_anticat`
  MODIFY `anticat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_assignedloc`
--
ALTER TABLE `tbl_assignedloc`
  MODIFY `dboyassignedloc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_assignorder`
--
ALTER TABLE `tbl_assignorder`
  MODIFY `assignorder_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_biddingproduct`
--
ALTER TABLE `tbl_biddingproduct`
  MODIFY `bp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bpgallery`
--
ALTER TABLE `tbl_bpgallery`
  MODIFY `bpgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cartbody`
--
ALTER TABLE `tbl_cartbody`
  MODIFY `cbody_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_carthead`
--
ALTER TABLE `tbl_carthead`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_complainttype`
--
ALTER TABLE `tbl_complainttype`
  MODIFY `complainttype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_dboy`
--
ALTER TABLE `tbl_dboy`
  MODIFY `dboy_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_pgallery`
--
ALTER TABLE `tbl_pgallery`
  MODIFY `pgallery_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_productstock`
--
ALTER TABLE `tbl_productstock`
  MODIFY `pstock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_request`
--
ALTER TABLE `tbl_request`
  MODIFY `request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_shop`
--
ALTER TABLE `tbl_shop`
  MODIFY `shop_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_shopowner`
--
ALTER TABLE `tbl_shopowner`
  MODIFY `shopowner_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
