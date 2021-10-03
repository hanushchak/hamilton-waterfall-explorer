-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2020 at 01:30 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

--
-- Database: `hamilton_waterfall_explorer`
--

-- --------------------------------------------------------

--
-- Table structure for table `fp_reviews`
--

CREATE TABLE `fp_reviews` (
  `review_id` int(11) NOT NULL,
  `waterfall_id` int(11) NOT NULL,
  `review_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `review_rating` int(11) DEFAULT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fp_reviews`
--

INSERT INTO `fp_reviews` (`review_id`, `waterfall_id`, `review_text`, `review_rating`, `review_date`, `review_name`) VALUES
(1, 70, 'Cool waterfall!', 3, '2020-03-16 00:10:28', 'Rob'),
(2, 70, 'Really nice experience :)', 5, '2020-03-16 00:10:46', 'Bobbie'),
(3, 70, 'Had a great time here with family!', 2, '2020-03-16 00:11:17', 'Amanda'),
(4, 70, 'Great site!!!', 5, '2020-03-16 00:11:41', 'Angela'),
(5, 17, 'Muddy and gross :CC', 1, '2020-03-16 00:12:08', 'Dan'),
(6, 26, 'Great place and the nature around!', 4, '2020-03-16 00:13:07', 'Anonymous'),
(7, 26, 'Amazing waterfall, will visit again!', 5, '2020-03-16 00:13:26', 'Wow'),
(8, 55, 'Unforgettable experience!!', 5, '2020-03-16 00:13:49', 'John'),
(9, 55, 'Great place, lots of nice trails around!', 5, '2020-03-16 00:14:30', 'Jessica'),
(10, 55, 'I was stunned, one of my favorite spots in the city!', 3, '2020-03-16 00:14:57', 'Wow!!'),
(11, 24, 'I love this place', 4, '2020-03-16 00:15:25', 'Jeremy'),
(12, 24, 'I&#39;ll definitely visit this place again, GREAT!!', 5, '2020-03-16 00:15:46', 'Carolina'),
(13, 24, 'Great place to go on a weekend', 5, '2020-03-16 00:16:12', 'Alina'),
(14, 45, 'It&#39;s a pretty cool waterfall \\_o_/', 3, '2020-03-16 00:17:43', 'Susan'),
(15, 45, 'I&#39;ve seen better waterfalls..', 2, '2020-03-16 00:18:00', 'Sam'),
(16, 73, 'Great experience!', 4, '2020-03-16 00:18:28', 'I like it !!'),
(17, 73, 'It&#39;s worth going here :)', 5, '2020-03-16 00:18:40', 'No name'),
(18, 15, 'It&#39;s barely a waterfall :D', 1, '2020-03-16 00:19:05', 'Set'),
(19, 69, 'Not too bad, worth seeing once', 3, '2020-03-16 00:19:25', 'Alan'),
(20, 30, 'This park is amazing, definitely check it out!!', 5, '2020-03-16 00:20:00', 'Johny'),
(21, 30, 'Great place!', 5, '2020-03-16 00:24:57', 'Stunned!'),
(22, 30, 'Greattt!', 5, '2020-03-16 00:25:16', 'Lion');

-- --------------------------------------------------------

--
-- Table structure for table `fp_waterfalls`
--

CREATE TABLE `fp_waterfalls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `community` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `height` decimal(3,1) NOT NULL,
  `ownership` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_from` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` decimal(7,5) NOT NULL,
  `latitude` decimal(7,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fp_waterfalls`
--

INSERT INTO `fp_waterfalls` (`id`, `name`, `community`, `type`, `height`, `ownership`, `access_from`, `longitude`, `latitude`) VALUES
(1, 'Billy Green Falls', 'Stoney Creek', 'Waterfall', '17.0', 'public', 'Centennial Pky.', '-79.76657', '43.20723'),
(2, 'Harvey Falls', 'Stoney Creek', 'Waterfall', '16.0', 'private', 'Fifty Rd.', '-79.65919', '43.20029'),
(3, 'Promontory Falls', 'Stoney Creek', 'Waterfall', '18.0', 'private', 'Fifty Rd.', '-79.65217', '43.19846'),
(4, 'Jones Rd. Falls', 'Stoney Creek', 'Cascade', '6.0', 'private', 'McNeilly Rd.', '-79.69562', '43.20352'),
(5, 'Upper Quarry Cascade', 'Flamborough', 'Cascade', '4.0', 'private', 'Mountain Brow Rd.', '-79.90643', '43.31342'),
(6, 'Lower Hopkins Cascade', 'Flamborough', 'Cascade', '6.0', 'public', 'Valley Rd.', '-79.92924', '43.29663'),
(7, 'Rock Chapel Falls', 'Flamborough', 'Waterfall', '8.0', 'public', 'Rock Chapel Rd.', '-79.93660', '43.29112'),
(8, 'Dyment Falls', 'Flamborough', 'Waterfall', '15.7', 'public', 'Sydenham Rd. lookout', '-79.94915', '43.27819'),
(9, 'East Greensville Falls', 'Flamborough', 'Cascade', '5.5', 'public', 'Crooks Hollow Rd / Crooks Hollow CA', '-79.99145', '43.27943'),
(10, 'East Iroquoia Falls', 'Hamilton', 'Waterfall', '20.0', 'public', 'Hwy 403', '-79.93858', '43.24478'),
(11, 'Veevers Falls', 'Hamilton', 'Cascade', '14.0', 'private', 'Greenhill Ave.', '-79.78090', '43.20819'),
(12, 'Centennial Falls', 'Stoney Creek', 'Cascade', '10.0', 'public', 'Centennial Pky.', '-79.76850', '43.20864'),
(13, 'Patterson West Cascade', 'Dundas', 'Cascade', '4.3', 'public', 'Patterson Road', '-79.92770', '43.29793'),
(14, 'Patterson East Cascade', 'Dundas', 'Cascade', '4.6', 'public', 'Patterson Road', '-79.92708', '43.29815'),
(15, 'Auchmar Falls', 'Hamilton', 'Waterfall', '12.0', 'public', 'Beckett Drive', '-79.89116', '43.24358'),
(16, 'Lewis Rd. West Falls', 'Stoney Creek', 'Waterfall', '9.0', 'private', 'McNeilly Rd.', '-79.66582', '43.20069'),
(17, 'Beckett Falls', 'Hamilton', 'Waterfall', '3.0', 'public', 'Beckett Drive', '-79.88584', '43.24487'),
(18, 'Grand Cascade', 'Stoney Creek', 'Cascade', '4.0', 'private', 'Fifty Rd.', '-79.64932', '43.19702'),
(19, 'West of Fifty Upper Cascade', 'Stoney Creek', 'Cascade', '8.0', 'public', 'Fifty Rd.', '-79.64693', '43.19582'),
(20, 'Fifty Rd. Cascade', 'Stoney Creek', 'Cascade', '10.0', 'public', 'Fifty Rd.', '-79.64443', '43.19532'),
(21, 'East of Fifty Falls', 'Stoney Creek', 'Waterfall', '10.0', 'private', 'Fifty Rd.', '-79.64142', '43.19492'),
(22, 'Puddicombe Falls', 'Stoney Creek', 'Cascade', '6.0', 'public', 'Fifty Rd.', '-79.63794', '43.19505'),
(23, 'Heritage Green Falls', 'Hamilton', 'Waterfall', '12.2', 'public', 'Ackland Street', '-79.78752', '43.20472'),
(24, 'Webster\'s Falls', 'Flamborough', 'Waterfall', '22.0', 'public', 'Fallsview Rd. / Spencer Gorge / Webster\'s Falls CA', '-79.98092', '43.27617'),
(25, 'Baby Webster\'s Falls', 'Flamborough', 'Waterfall', '9.0', 'public', 'Fallsview Rd. / Spencer Gorge / Webster\'s Falls CA', '-79.98190', '43.27568'),
(26, 'Darnley Cascade', 'Flamborough', 'Cascade', '4.0', 'public', 'Crooks Hollow Rd / Darnley Mill ruins', '-80.00679', '43.27721'),
(27, 'Dundas Falls', 'Dundas', 'Waterfall', '6.4', 'private', 'King St.', '-79.97216', '43.27304'),
(28, 'Mineral Springs Falls', 'Ancaster', 'Cascade', '3.0', 'private', 'Must view from owner\'s driveway only', '-80.01244', '43.23637'),
(29, 'Hermitage Cascade', 'Ancaster', 'Cascade', '4.0', 'public', 'Sulphur Springs Rd. / Hermitage ruins', '-79.99804', '43.23637'),
(30, 'Heritage Falls', 'Ancaster', 'Cascade', '5.0', 'public', 'Sulphur Springs Rd. / Hermitage ruins', '-80.00378', '43.23994'),
(31, 'Mill Falls', 'Ancaster', 'Waterfall', '7.0', 'private', 'Old Dundas Rd. / Old Mill Rest.', '-79.97390', '43.23335'),
(32, 'Lower Mill Falls', 'Ancaster', 'Cascade', '6.0', 'private', 'Old Dundas Rd. / Old Mill Rest.', '-79.97352', '43.23399'),
(33, 'Canterbury Falls', 'Ancaster', 'Cascade', '9.0', 'public', 'Old Dundas Rd.', '-79.98070', '43.23698'),
(34, 'Little Canterbury Falls', 'Ancaster', 'Cascade', '5.0', 'public', 'Old Dundas Rd.', '-79.98002', '43.23689'),
(35, 'Sherman Falls', 'Ancaster', 'Waterfall', '17.0', 'private', 'Lions Club Rd.', '-79.97293', '43.23812'),
(36, 'Middle Glendale Falls', 'Hamilton', 'Cascade', '3.1', 'public', 'Bruce Trail', '-79.80941', '43.20250'),
(37, 'Mountain Spring Falls', 'Hamilton', 'Waterfall', '15.0', 'public', 'Ackland Street', '-79.78795', '43.20451'),
(38, 'Valley Falls', 'Flamborough', 'Waterfall', '4.3', 'public', 'Bruce Trail at Valley Road', '-79.92825', '43.29749'),
(39, 'Pritchard Falls', 'Hamilton', 'Waterfall', '4.5', 'public', 'Mountain Brow Blvd. / King\'s Forest Park', '-79.81633', '43.20111'),
(40, 'Billy Monkley Cascade', 'Hamilton', 'Cascade', '3.0', 'public', 'Chippewa Rail Trail via Rymal Road/Billy Monkley Bird Sanctuary', '-79.83045', '43.19040'),
(41, 'Broman Falls', 'Hamilton', 'Waterfall', '7.0', 'public', 'Bruce Trail Escarpment Rail Trail at Mohawk Sports Park', '-79.81600', '43.21424'),
(42, 'Baby Albion Falls', 'Hamilton', 'Waterfall', '8.5', 'public', 'Mountain Brow Blvd. / King\'s Forest Park', '-79.81966', '43.20016'),
(43, 'Lower Punchbowl Falls', 'Stoney Creek', 'Waterfall', '6.0', 'public', 'Mountain Ave.', '-79.75717', '43.21121'),
(44, 'Devil\'s Punchbowl Falls', 'Stoney Creek', 'Waterfall', '37.0', 'public', 'Ridge Rd. / Devil\'s Punchbowl CA', '-79.75591', '43.21035'),
(45, 'Dewitt Falls', 'Stoney Creek', 'Cascade', '7.0', 'public', 'Dewitt Rd.', '-79.71843', '43.20681'),
(46, 'Lower Little Falls', 'Ancaster', 'Cascade', '8.2', 'public', 'Wilson St. E.', '-79.96576', '43.24000'),
(47, 'Ancaster Heights Falls', 'Ancaster', 'Cascade', '13.4', 'public', 'Wilson St. E.', '-79.96284', '43.23974'),
(48, 'West Iroquoia Falls', 'Hamilton', 'Waterfall', '19.8', 'public', 'Hwy 403', '-79.94049', '43.24440'),
(49, 'Sugar Shack Falls', 'Dundas', 'Waterfall', '9.0', 'public', 'Rock Chapel Rd. / Rock Chapel Sanctuary', '-79.93754', '43.28449'),
(50, 'Progreston Falls', 'Flamborough', 'Waterfall', '6.7', 'private', 'Progreston Rd.', '-79.95992', '43.39810'),
(51, 'Great Falls', 'Flamborough', 'Waterfall', '10.0', 'public', 'Mill St / Smokey Hollow Resource Management Area', '-79.88724', '43.33054'),
(52, 'Grindstone Cascade', 'Flamborough', 'Cascade', '3.0', 'public', 'Mill St / Smokey Hollow Resource Management Area', '-79.88692', '43.32844'),
(53, 'Borer\'s Falls', 'Flamborough', 'Waterfall', '15.0', 'public', 'Rock Chapel Rd. / Rock Chapel Sanctuary', '-79.93679', '43.29381'),
(54, 'Lower Sydenham Falls', 'Dundas', 'Waterfall', '4.0', 'private', 'Livingstone Dr. / Cascades Park', '-79.95835', '43.27396'),
(55, 'Tew\'s Falls', 'Flamborough', 'Waterfall', '41.0', 'public', 'Harvest Rd. / Spencer Gorge / Webster\'s Falls CA', '-79.97827', '43.28071'),
(56, 'Lewis Rd. East Falls', 'Stoney Creek', 'Cascade', '8.0', 'private', 'McNeilly Rd.', '-79.66503', '43.20113'),
(57, 'Little Falls', 'Ancaster', 'Cascade', '7.0', 'public', 'Wilson St. E.', '-79.96558', '43.23955'),
(58, 'Tiffany Falls', 'Ancaster', 'Waterfall', '21.0', 'public', 'Wilson St. E. / Tiffany Falls CA', '-79.95811', '43.23816'),
(59, 'Scenic Falls', 'Hamilton', 'Cascade', '20.0', 'public', 'Scenic Dr. / Chedoke Radial Trail Head', '-79.93481', '43.24418'),
(60, 'Lower Princess Falls', 'Hamilton', 'Cascade', '39.5', 'public', 'Hwy 403', '-79.92992', '43.24594'),
(61, 'Princess Falls', 'Hamilton', 'Waterfall', '7.0', 'public', 'Scenic Dr. / Chedoke Radial Trail Land', '-79.92992', '43.24584'),
(62, 'Upper Sanatorium Falls', 'Hamilton', 'Cascade', '9.0', 'public', 'Sanatorium Rd. / Chedoke Civic Golf Course', '-79.91470', '43.24495'),
(63, 'Lower Sanatorium Cascade', 'Hamilton', 'Cascade', '4.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course', '-79.91495', '43.24598'),
(64, 'Mountview Falls', 'Hamilton', 'Cascade', '10.0', 'public', 'Scenic Dr. / Chedoke Radial Trail Land', '-79.92144', '43.24550'),
(65, 'Lower Westcliffe Falls', 'Hamilton', 'Cascade', '9.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course', '-79.90842', '43.24569'),
(66, 'Lower Cliffview Falls', 'Hamilton', 'Cascade', '4.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course', '-79.90836', '43.24567'),
(67, 'Westcliffe Falls', 'Hamilton', 'Cascade', '15.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course', '-79.90852', '43.24540'),
(68, 'Cliffview Falls', 'Hamilton', 'Cascade', '15.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course / Scenic Dr. / Cliffview Park', '-79.90785', '43.24426'),
(69, 'Lower Chedoke Falls', 'Hamilton', 'Cascade', '6.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course', '-79.90041', '43.24424'),
(70, 'Chedoke Falls', 'Hamilton', 'Waterfall', '18.0', 'public', 'Beddoe Dr. / Chedoke Civic Golf Course / Scenic Dr', '-79.90066', '43.24172'),
(71, 'Upper Glendale Falls', 'Hamilton', 'Waterfall', '3.0', 'public', 'Kingsview Dr.', '-79.80966', '43.20227'),
(72, 'Buttermilk Falls', 'Hamilton', 'Waterfall', '23.0', 'public', 'Mountain Brow Blvd. / Oak-Knoll Park', '-79.81957', '43.20532'),
(73, 'Albion Falls', 'Hamilton', 'Cascade', '19.0', 'public', 'Mountain Brow Blvd. / King\'s Forest Park', '-79.81963', '43.20039'),
(74, 'Little Davis Falls', 'Hamilton', 'Waterfall', '3.0', 'public', 'Quigley Rd.', '-79.78892', '43.20675'),
(75, 'Felker\'s Falls', 'Hamilton', 'Waterfall', '22.0', 'public', 'Ackland St. / Felker\'s Falls CA', '-79.79015', '43.20352');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fp_reviews`
--
ALTER TABLE `fp_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `waterfall_id` (`waterfall_id`);

--
-- Indexes for table `fp_waterfalls`
--
ALTER TABLE `fp_waterfalls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fp_reviews`
--
ALTER TABLE `fp_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `fp_waterfalls`
--
ALTER TABLE `fp_waterfalls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fp_reviews`
--
ALTER TABLE `fp_reviews`
  ADD CONSTRAINT `fp_reviews_ibfk_1` FOREIGN KEY (`waterfall_id`) REFERENCES `fp_waterfalls` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
