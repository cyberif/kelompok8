-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2022 at 10:30 AM
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
-- Database: `db_bioskoptrue`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `booking`
-- (See below for the actual view)
--
CREATE TABLE `booking` (
);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--
-- Error reading structure for table db_bioskoptrue.film: #1932 - Table &#039;db_bioskoptrue.film&#039; doesn&#039;t exist in engine
-- Error reading data for table db_bioskoptrue.film: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_bioskoptrue`.`film`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--
-- Error reading structure for table db_bioskoptrue.pembeli: #1932 - Table &#039;db_bioskoptrue.pembeli&#039; doesn&#039;t exist in engine
-- Error reading data for table db_bioskoptrue.pembeli: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_bioskoptrue`.`pembeli`&#039; at line 1

-- --------------------------------------------------------

--
-- Stand-in structure for view `pembelian`
-- (See below for the actual view)
--
CREATE TABLE `pembelian` (
);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--
-- Error reading structure for table db_bioskoptrue.pemesanan: #1932 - Table &#039;db_bioskoptrue.pemesanan&#039; doesn&#039;t exist in engine
-- Error reading data for table db_bioskoptrue.pemesanan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_bioskoptrue`.`pemesanan`&#039; at line 1

--
-- Triggers `pemesanan`
--
DELIMITER $$
CREATE TRIGGER `pendapatan` AFTER INSERT ON `pemesanan` FOR EACH ROW BEGIN
SET @pendapatan = (SELECT SUM(total_harga) FROM pemesanan);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `penghasilan` AFTER INSERT ON `pemesanan` FOR EACH ROW BEGIN
SET @penghasilan = (SELECT SUM(total_harga) FROM pemesanan);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--
-- Error reading structure for table db_bioskoptrue.ruangan: #1932 - Table &#039;db_bioskoptrue.ruangan&#039; doesn&#039;t exist in engine
-- Error reading data for table db_bioskoptrue.ruangan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_bioskoptrue`.`ruangan`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--
-- Error reading structure for table db_bioskoptrue.tiket: #1932 - Table &#039;db_bioskoptrue.tiket&#039; doesn&#039;t exist in engine
-- Error reading data for table db_bioskoptrue.tiket: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `db_bioskoptrue`.`tiket`&#039; at line 1

-- --------------------------------------------------------

--
-- Structure for view `booking`
--
DROP TABLE IF EXISTS `booking`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `booking`  AS SELECT `pemesanan`.`kd_pembeli` AS `kd_pembeli`, `tiket`.`judul_film` AS `judul_film`, `pemesanan`.`total_harga` AS `total_harga` FROM (`tiket` join `pemesanan` on(`tiket`.`id_tiket` = `pemesanan`.`id_tiket`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pembelian`
--
DROP TABLE IF EXISTS `pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`` SQL SECURITY DEFINER VIEW `pembelian`  AS SELECT `tiket`.`id_tiket` AS `id_tiket`, `pemesanan`.`kd_pembeli` AS `kd_pembeli`, `tiket`.`judul_film` AS `judul_film`, `pemesanan`.`jml_beli` AS `jml_beli`, `pemesanan`.`total_harga` AS `total_harga` FROM (`tiket` join `pemesanan` on(`tiket`.`id_tiket` = `pemesanan`.`id_tiket`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
