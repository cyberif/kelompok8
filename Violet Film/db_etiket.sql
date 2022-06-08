-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 02:47 PM
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
`kd_pembeli` char(4)
,`judul_film` varchar(50)
,`total_harga` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `kd_film` char(4) NOT NULL,
  `judul_film` varchar(50) NOT NULL,
  `tgl_rilis` date NOT NULL,
  `harga` int(10) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`kd_film`, `judul_film`, `tgl_rilis`, `harga`, `keterangan`) VALUES
('0001', 'KKN Di Desa Penari', '2022-04-30', 50000, 'Horror'),
('0002', 'Doctor Strange In The Multiverse Of Madness', '2022-05-05', 50000, 'Action'),
('0003', 'Kukira Kau Rumah', '2022-02-03', 45000, 'Romance'),
('0004', 'Detective Conan Movie 25: The Bride Of Halloween', '2022-04-15', 45000, 'Animation'),
('0005', 'Jujutsu Kaisen Movie 0', '2022-03-16', 45000, 'Animation'),
('0006', 'Fantasic Beasts: The Secret Of Dumbledore', '2022-04-13', 45000, 'Fantasy'),
('0007', 'Dear Nathan Thank You Salma', '2022-01-13', 45000, 'Romance'),
('0008', 'Cinta Subuh', '2022-05-19', 45000, 'Drama'),
('0009', 'Makmum 2', '2022-03-16', 50000, 'Horror'),
('0010', 'Kuntilanak 3', '2022-04-14', 50000, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `kd_pembeli` char(4) NOT NULL,
  `kd_pemesanan` char(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`kd_pembeli`, `kd_pemesanan`, `email`, `no_telp`) VALUES
('VF01', '220V', 'takaradjiman@gmail.com', '-'),
('VF02', '223V', 'saegusaakina@gmail.com', '089623881760'),
('VF03', '228V', 'zeacornelia@gmail.com', '086652902784'),
('VF04', '22BV', 'kuzuha@gmail.com', '-'),
('VF05', '229V', 'anyafolger@gmail.com', '089538671274');

-- --------------------------------------------------------

--
-- Stand-in structure for view `pembelian`
-- (See below for the actual view)
--
CREATE TABLE `pembelian` (
`id_tiket` int(20)
,`kd_pembeli` char(4)
,`judul_film` varchar(50)
,`jml_beli` int(3)
,`total_harga` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `kd_pemesanan` char(4) NOT NULL,
  `kd_pembeli` char(4) NOT NULL,
  `id_tiket` int(20) NOT NULL,
  `jml_beli` int(3) DEFAULT NULL,
  `total_harga` int(10) NOT NULL,
  `tgl_pembelian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`kd_pemesanan`, `kd_pembeli`, `id_tiket`, `jml_beli`, `total_harga`, `tgl_pembelian`) VALUES
('220V', 'VF01', 12022, 1, 50000, '2022-05-01'),
('223V', 'VF02', 22022, 2, 90000, '2022-04-14'),
('228V', 'VF03', 32022, 5, 225000, '2022-02-06'),
('229V', 'VF05', 52022, 1, 45000, '2022-04-14'),
('22BV', 'VF04', 42022, 3, 150000, '2022-05-05'),
('22CV', 'VF06', 74022, 1, 50000, '2022-05-06');

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

CREATE TABLE `ruangan` (
  `kd_ruangan` char(4) NOT NULL,
  `kd_kursi` char(4) NOT NULL,
  `kapasitas` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`kd_ruangan`, `kd_kursi`, `kapasitas`) VALUES
('STD1', 'C8', 153),
('STD2', 'E3', 153),
('STD3', 'C10', 153),
('STD4', 'J7', 153),
('STD5', 'C10', 153);

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` int(20) NOT NULL,
  `judul_film` varchar(50) NOT NULL,
  `kd_ruangan` char(4) NOT NULL,
  `jam_tayang` time NOT NULL,
  `kd_kursi` char(4) NOT NULL,
  `kd_film` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `judul_film`, `kd_ruangan`, `jam_tayang`, `kd_kursi`, `kd_film`) VALUES
(12022, 'KKN Di Desa Penari', 'STD1', '19:25:00', 'C8', '0001'),
(22022, 'Jujutsu Kaisen Movie 0', 'STD2', '16:00:20', 'E3', '0005'),
(32022, 'Kukira Kau Rumah', 'STD3', '11:45:10', 'C10', '0003'),
(42022, 'Doctor Strange In The Multiverse Of Madness', 'STD4', '13:40:01', 'J7', '0002'),
(52022, 'Fantastic Beasts: The Secret Of Dumbledore', 'STD5', '16:20:40', 'C10', '0006');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`kd_film`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`kd_pembeli`),
  ADD KEY `kd_pemesanan` (`kd_pemesanan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`kd_pemesanan`),
  ADD KEY `id_tiket` (`id_tiket`),
  ADD KEY `kd_pembeli` (`kd_pembeli`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`kd_ruangan`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `kd_ruangan` (`kd_ruangan`),
  ADD KEY `kd_film` (`kd_film`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD CONSTRAINT `pembeli_ibfk_1` FOREIGN KEY (`kd_pemesanan`) REFERENCES `pemesanan` (`kd_pemesanan`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`kd_pembeli`) REFERENCES `pembeli` (`kd_pembeli`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`kd_ruangan`) REFERENCES `ruangan` (`kd_ruangan`),
  ADD CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`kd_film`) REFERENCES `film` (`kd_film`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;