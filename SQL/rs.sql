-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2018 at 04:38 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rs`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrasi`
--

CREATE TABLE `administrasi` (
  `id_administrasi` char(6) NOT NULL,
  `tanggal_administrasi` date DEFAULT NULL,
  `id_dokter` char(6) DEFAULT NULL,
  `id_kamar` char(6) DEFAULT NULL,
  `id_resep` char(6) DEFAULT NULL,
  `id_pemeriksaan` char(6) DEFAULT NULL,
  `id_pasien` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrasi`
--

INSERT INTO `administrasi` (`id_administrasi`, `tanggal_administrasi`, `id_dokter`, `id_kamar`, `id_resep`, `id_pemeriksaan`, `id_pasien`) VALUES
('AD0001', '2018-12-28', 'D00010', NULL, 'R00001', 'PM0001', 'P00001'),
('AD0002', '2018-12-28', 'D00010', NULL, 'R00002', 'PM0002', 'P00002'),
('AD0003', '2018-12-29', 'D00004', NULL, 'R00003', 'PM0003', 'P00003'),
('AD0004', '2018-12-30', 'D00003', NULL, 'R00004', 'PM0004', 'P00004'),
('AD0005', '2018-12-26', 'D00009', NULL, 'R00005', 'PM0005', 'P00005'),
('AD0006', '2018-12-28', 'D00009', NULL, 'R00006', 'PM0006', 'P00006'),
('AD0007', '2018-12-26', 'D00001', 'RI0005', NULL, 'PM0007', 'P00007'),
('AD0008', '2018-12-27', 'D00003', NULL, NULL, 'PM0008', 'P00008'),
('AD0009', '2018-12-28', 'D00002', 'RI0009', NULL, 'PM0009', 'P00009'),
('AD0010', '2018-12-26', 'D00001', 'RI0002', 'R00007', 'PM0010', 'P00010'),
('AD0011', '2018-12-28', 'D00005', NULL, 'R00008', 'PM0011', 'P00011'),
('AD0012', '2018-12-29', 'D00003', NULL, 'R00009', 'PM0012', 'P00012'),
('AD0013', '2018-12-27', 'D00004', NULL, 'R00010', 'PM0013', 'P00013');

-- --------------------------------------------------------

--
-- Table structure for table `asuransi`
--

CREATE TABLE `asuransi` (
  `id_asuransi` char(6) NOT NULL,
  `rujukan` tinytext,
  `nama_asuransi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asuransi`
--

INSERT INTO `asuransi` (`id_asuransi`, `rujukan`, `nama_asuransi`) VALUES
('A00001', NULL, 'Bangkit Lagi'),
('A00002', NULL, 'Tolak Sakit'),
('A00003', NULL, 'Bejane Urip'),
('A00004', NULL, 'Tolak Sakit'),
('A00005', NULL, 'Baru Bersinar'),
('A00006', NULL, 'Tunas Jaya'),
('A00007', NULL, 'Sehat Segera'),
('A00008', NULL, 'Sakti'),
('A00009', NULL, 'Bejane Urip'),
('A00010', NULL, 'Sehat Segera'),
('A00011', NULL, 'Nafas Lega');

-- --------------------------------------------------------

--
-- Table structure for table `bagian_dari`
--

CREATE TABLE `bagian_dari` (
  `id_radiologi` char(6) DEFAULT NULL,
  `id_pemeriksaan` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bagian_dari`
--

INSERT INTO `bagian_dari` (`id_radiologi`, `id_pemeriksaan`) VALUES
('RD0001', 'PM0001'),
('RD0002', 'PM0002'),
('RD0003', 'PM0003'),
('RD0004', 'PM0004'),
('RD0005', 'PM0005'),
('RD0006', 'PM0006'),
('RD0007', 'PM0007'),
('RD0008', 'PM0008'),
('RD0009', 'PM0009'),
('RD0010', 'PM0010'),
('RD0011', 'PM0011'),
('RD0012', 'PM0012'),
('RD0013', 'PM0013');

-- --------------------------------------------------------

--
-- Table structure for table `dibutuhkan`
--

CREATE TABLE `dibutuhkan` (
  `id_IGD` char(6) DEFAULT NULL,
  `id_pasien` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dibutuhkan`
--

INSERT INTO `dibutuhkan` (`id_IGD`, `id_pasien`) VALUES
('IGD001', 'P00004'),
('IGD003', 'P00005'),
('IGD003', 'P00007'),
('IGD001', 'P00010');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` char(6) NOT NULL,
  `nama_dokter` varchar(25) DEFAULT NULL,
  `nama_spesialisasi` varchar(20) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp_dokter` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `nama_spesialisasi`, `gender`, `alamat`, `no_telp_dokter`) VALUES
('D00001', 'Suran Ibrahim', 'Spesialis Mata', 'L', 'Klaten', '085375625380'),
('D00002', 'Albus Dumbledore', 'Spesialis Saraf', 'L', 'Hogwarts', '081635584736'),
('D00003', 'Trafalgar Law', NULL, 'L', 'Sragen', '087647264352'),
('D00004', 'Asun Margarita', 'Spesialis Gigi', 'P', 'Ngawi', '089216345172'),
('D00005', 'Ljubomir Jaakko', 'Spesialis Bedah', 'L', 'Tawangmangu', '087635273827'),
('D00006', 'Katelynn Storm', NULL, 'P', 'Boyolali', '085382746241'),
('D00007', 'Émeline Eberhard', 'Spesialis Andrologi', 'P', 'Tegal', '085375746382'),
('D00008', 'Vasilije Tamanna', NULL, 'L', 'Salatiga', '087325467754'),
('D00009', 'Mnason Constantinus', NULL, 'L', 'Solo', '086354287615'),
('D00010', 'Oxana Giuseppe', 'Spesialis Anak', 'P', 'Temanggung', '085728463826');

-- --------------------------------------------------------

--
-- Table structure for table `icu`
--

CREATE TABLE `icu` (
  `id_ICU` char(6) NOT NULL,
  `nama_ruang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icu`
--

INSERT INTO `icu` (`id_ICU`, `nama_ruang`) VALUES
('ICU001', 'ICU unit 01'),
('ICU002', 'ICU unit 02'),
('ICU003', 'ICU unit 03');

-- --------------------------------------------------------

--
-- Table structure for table `igd`
--

CREATE TABLE `igd` (
  `id_IGD` char(6) NOT NULL,
  `nama_ruang` varchar(20) DEFAULT NULL,
  `id_dokter` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `igd`
--

INSERT INTO `igd` (`id_IGD`, `nama_ruang`, `id_dokter`) VALUES
('IGD001', 'IGD_Mata', 'D00001'),
('IGD002', 'IGD_saraf', 'D00002'),
('IGD003', 'IGD_Bedah', 'D00005');

-- --------------------------------------------------------

--
-- Table structure for table `laboratorium`
--

CREATE TABLE `laboratorium` (
  `id_lab` char(6) NOT NULL,
  `nama_ruang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratorium`
--

INSERT INTO `laboratorium` (`id_lab`, `nama_ruang`) VALUES
('LB0001', 'lab 1'),
('LB0002', 'lab 2'),
('LB0003', 'lab 3'),
('LB0004', 'lab 4'),
('LB0005', 'lab 5');

-- --------------------------------------------------------

--
-- Table structure for table `melayani`
--

CREATE TABLE `melayani` (
  `id_staff` char(6) DEFAULT NULL,
  `id_pasien` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `melayani`
--

INSERT INTO `melayani` (`id_staff`, `id_pasien`) VALUES
('ST0220', 'P00001'),
('ST0205', 'P00002'),
('ST0204', 'P00003'),
('ST0201', 'P00004'),
('ST0117', 'P00005'),
('ST0334', 'P00006'),
('ST0113', 'P00007'),
('ST0105', 'P00008'),
('ST0204', 'P00009'),
('ST0101', 'P00010'),
('ST0105', 'P00011'),
('ST0102', 'P00012'),
('ST0201', 'P00013');

-- --------------------------------------------------------

--
-- Table structure for table `meliputi`
--

CREATE TABLE `meliputi` (
  `id_administrasi` char(6) DEFAULT NULL,
  `id_asuransi` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meliputi`
--

INSERT INTO `meliputi` (`id_administrasi`, `id_asuransi`) VALUES
('AD0001', 'A00001'),
('AD0002', 'A00002'),
('AD0003', 'A00003'),
('AD0004', 'A00004'),
('AD0005', 'A00005'),
('AD0006', 'A00006'),
('AD0007', 'A00007'),
('AD0008', 'A00008'),
('AD0009', 'A00009'),
('AD0010', 'A00010'),
('AD0011', 'A00004'),
('AD0012', 'A00006'),
('AD0013', 'A00011');

-- --------------------------------------------------------

--
-- Table structure for table `memeriksa`
--

CREATE TABLE `memeriksa` (
  `id_dokter` char(6) DEFAULT NULL,
  `id_pasien` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memeriksa`
--

INSERT INTO `memeriksa` (`id_dokter`, `id_pasien`) VALUES
('D00010', 'P00001'),
('D00010', 'P00002'),
('D00004', 'P00003'),
('D00003', 'P00004'),
('D00009', 'P00005'),
('D00009', 'P00006'),
('D00001', 'P00007'),
('D00003', 'P00009'),
('D00002', 'P00010'),
('D00001', 'P00011'),
('D00005', 'P00012'),
('D00008', 'P00013'),
('D00004', 'P00008');

-- --------------------------------------------------------

--
-- Table structure for table `memerlukan`
--

CREATE TABLE `memerlukan` (
  `id_pemeriksaan` char(6) DEFAULT NULL,
  `id_lab` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memerlukan`
--

INSERT INTO `memerlukan` (`id_pemeriksaan`, `id_lab`) VALUES
('PM0001', 'LB0001'),
('PM0002', 'LB0004'),
('PM0003', 'LB0004'),
('PM0004', 'LB0002'),
('PM0005', 'LB0002'),
('PM0006', 'LB0003'),
('PM0007', 'LB0005'),
('PM0008', 'LB0005'),
('PM0009', 'LB0001'),
('PM0010', 'LB0001'),
('PM0011', 'LB0003'),
('PM0012', 'LB0002'),
('PM0013', 'LB0004');

-- --------------------------------------------------------

--
-- Table structure for table `memiliki`
--

CREATE TABLE `memiliki` (
  `id_dokter` char(6) DEFAULT NULL,
  `id_poli` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memiliki`
--

INSERT INTO `memiliki` (`id_dokter`, `id_poli`) VALUES
('D00001', 'PO0003'),
('D00002', 'PO0006'),
('D00003', 'PO0001'),
('D00004', 'PO0004'),
('D00005', 'PO0010'),
('D00006', 'PO0001'),
('D00007', 'PO0001'),
('D00008', 'PO0001'),
('D00009', 'PO0001'),
('D00010', 'PO0002');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` char(6) NOT NULL,
  `nama_pasien` varchar(25) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat_pasien` varchar(40) DEFAULT NULL,
  `no_telp_pasien` varchar(15) DEFAULT NULL,
  `id_ICU` char(6) DEFAULT NULL,
  `id_perawat` char(6) DEFAULT NULL,
  `id_poli` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `gender`, `alamat_pasien`, `no_telp_pasien`, `id_ICU`, `id_perawat`, `id_poli`) VALUES
('P00001', 'Prometheus Hilbert', 'L', 'Karanganyar', '08854653221454', NULL, 'N00003', 'PO0002'),
('P00002', 'Priyanka Milanka', 'P', 'Solo', '087765345', NULL, 'N00001', 'PO0002'),
('P00003', 'Ljuban Jessenia', 'P', 'Blora', '0876567321543', NULL, 'N00010', 'PO0004'),
('P00004', 'Alexander Khalifa', 'L', 'Brebes', '087543444564', 'ICU001', 'N00012', 'PO0005'),
('P00005', 'Mia Fatima', 'P', 'Pekalongan', '085462714237', 'ICU002', 'N00006', 'PO0001'),
('P00006', 'Clemens Luciana', 'P', 'Sleman', '087463526382', NULL, 'N00012', 'PO0001'),
('P00007', 'Marcus Xun', 'L', 'Malang', '08736283645', 'ICU003', 'N00011', 'PO0003'),
('P00008', 'Arminius Roland', 'L', 'Bogor', '087263726152', NULL, 'N00008', 'PO0004'),
('P00009', 'Aiman Mawunyo', 'L', 'Solo', '085263524172', NULL, 'N00007', 'PO0007'),
('P00010', 'Hebe Mirko', 'L', 'Batam', '085263816273', 'ICU001', 'N00007', 'PO0006'),
('P00011', 'Sawomira Madog', 'P', 'Demak', '087888654376', NULL, 'N00009', 'PO0003'),
('P00012', 'Ural Rafal', 'L', 'Gresik', '087263826123', NULL, 'N00008', 'PO0010'),
('P00013', 'Nikica Erna', 'P', 'Sragen', '087865476547', NULL, 'N00008', 'PO0005');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `id_pemeriksaan` char(6) NOT NULL,
  `cat_pemeriksaan` text,
  `jenis_pemeriksaan` varchar(30) DEFAULT NULL,
  `id_poli` char(6) DEFAULT NULL,
  `id_ICU` char(6) DEFAULT NULL,
  `id_IGD` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`id_pemeriksaan`, `cat_pemeriksaan`, `jenis_pemeriksaan`, `id_poli`, `id_ICU`, `id_IGD`) VALUES
('PM0001', NULL, NULL, 'PO0002', NULL, NULL),
('PM0002', NULL, NULL, 'PO0002', NULL, NULL),
('PM0003', NULL, NULL, 'PO0004', NULL, NULL),
('PM0004', NULL, NULL, 'PO0005', 'ICU001', 'IGD001'),
('PM0005', NULL, NULL, 'PO0001', 'ICU002', NULL),
('PM0006', NULL, NULL, 'PO0001', NULL, NULL),
('PM0007', NULL, NULL, 'PO0003', 'ICU003', 'IGD003'),
('PM0008', NULL, NULL, 'PO0004', NULL, NULL),
('PM0009', NULL, NULL, 'PO0007', NULL, NULL),
('PM0010', NULL, NULL, 'PO0006', 'ICU001', NULL),
('PM0011', NULL, NULL, 'PO0003', NULL, NULL),
('PM0012', NULL, NULL, 'PO0010', NULL, NULL),
('PM0013', NULL, NULL, 'PO0005', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` char(6) NOT NULL,
  `nama_perawat` varchar(25) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `jam_jaga` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perawat`
--

INSERT INTO `perawat` (`id_perawat`, `nama_perawat`, `gender`, `jam_jaga`) VALUES
('N00001', 'Muthoni Genista', 'L', '07.00-15.00'),
('N00002', 'Robert Fadila', 'P', '07.00-15.00'),
('N00003', 'Anuj Astrid', 'P', '15.00-23.00'),
('N00004', 'Gudrun Sif', 'L', '15.00-23.00'),
('N00005', 'Dre Hannah', 'P', '23.00-07.00'),
('N00006', 'Meena Kisha', 'P', '23.00-07.00'),
('N00007', 'Albina Lamar', 'P', '07.00-15.00'),
('N00008', 'Lotario Carina', 'P', '07.00-15.00'),
('N00009', 'Ima Thanatos', 'P', '07.00-15.00'),
('N00010', 'Malene Galena', 'P', '15.00-23.00'),
('N00011', 'Ouida Italus', 'L', '23.00-07.00'),
('N00012', 'RIcardo Fellini', 'L', '15.00-23.00');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` char(6) NOT NULL,
  `nama_poli` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`) VALUES
('PO0001', 'Poliklinik Umum'),
('PO0002', 'Poliklinik Anak'),
('PO0003', 'Poliklinik Mata'),
('PO0004', 'Poliklinik Gigi'),
('PO0005', 'Poliklinik Kulit'),
('PO0006', 'Poliklinik saraf'),
('PO0007', 'Poliklinik Jiwa'),
('PO0008', 'Poliklinik Gizi'),
('PO0009', 'Poliklinik THT'),
('PO0010', 'Poliklinik Bedah');

-- --------------------------------------------------------

--
-- Table structure for table `radiologi`
--

CREATE TABLE `radiologi` (
  `id_radiologi` char(6) NOT NULL,
  `tindakan_radiologi` varchar(30) DEFAULT NULL,
  `id_rekammedis` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radiologi`
--

INSERT INTO `radiologi` (`id_radiologi`, `tindakan_radiologi`, `id_rekammedis`) VALUES
('RD0001', NULL, 'RK0001'),
('RD0002', NULL, 'RK0002'),
('RD0003', NULL, 'RK0003'),
('RD0004', NULL, 'RK0004'),
('RD0005', NULL, 'RK0005'),
('RD0006', NULL, 'RK0006'),
('RD0007', NULL, 'RK0007'),
('RD0008', NULL, 'RK0008'),
('RD0009', NULL, 'RK0009'),
('RD0010', NULL, 'RK0010'),
('RD0011', NULL, 'RK0011'),
('RD0012', NULL, 'RK0012'),
('RD0013', NULL, 'RK0013');

-- --------------------------------------------------------

--
-- Table structure for table `rawat_inap`
--

CREATE TABLE `rawat_inap` (
  `id_kamar` char(6) NOT NULL,
  `nama_kelas` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rawat_inap`
--

INSERT INTO `rawat_inap` (`id_kamar`, `nama_kelas`) VALUES
('RI0001', 'Kelas 1'),
('RI0002', 'Kelas 2'),
('RI0003', 'Kelas 2'),
('RI0004', 'Kelas 3'),
('RI0005', 'Kelas 1'),
('RI0006', 'VIP'),
('RI0007', 'VVIP'),
('RI0008', 'Kelas 3'),
('RI0009', 'Kelas 2'),
('RI0010', 'VIP');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id_rekammedis` char(6) NOT NULL,
  `cat_rekammedis` tinytext,
  `id_pasien` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekam_medis`
--

INSERT INTO `rekam_medis` (`id_rekammedis`, `cat_rekammedis`, `id_pasien`) VALUES
('RK0001', NULL, 'P00001'),
('RK0002', NULL, 'P00002'),
('RK0003', NULL, 'P00003'),
('RK0004', NULL, 'P00004'),
('RK0005', NULL, 'P00005'),
('RK0006', NULL, 'P00006'),
('RK0007', NULL, 'P00007'),
('RK0008', NULL, 'P00008'),
('RK0009', NULL, 'P00009'),
('RK0010', NULL, 'P00010'),
('RK0011', NULL, 'P00011'),
('RK0012', NULL, 'P00012'),
('RK0013', NULL, 'P00013');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` char(6) NOT NULL,
  `tanggal_resep` varchar(15) DEFAULT NULL,
  `id_dokter` char(6) NOT NULL,
  `id_pasien` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`id_resep`, `tanggal_resep`, `id_dokter`, `id_pasien`) VALUES
('R00001', '2018-12-19', 'D00010', 'P00001'),
('R00002', '2018-12-11', 'D00010', 'P00002'),
('R00003', '2018-12-21', 'D00004', 'P00003'),
('R00004', '2018-12-20', 'D00003', 'P00004'),
('R00005', '2018-12-18', 'D00009', 'P00005'),
('R00006', '2018-12-14', 'D00009', 'P00006'),
('R00007', '2018-12-11', 'D00002', 'P00010'),
('R00008', '2018-12-10', 'D00001', 'P00011'),
('R00009', '2018-12-11', 'D00005', 'P00012'),
('R00010', '2018-12-10', 'D00008', 'P00013');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id_staff` char(6) NOT NULL,
  `nama_staff` varchar(25) DEFAULT NULL,
  `gender` enum('L','P') DEFAULT NULL,
  `alamat` varchar(40) DEFAULT NULL,
  `no_telp_staff` varchar(15) DEFAULT NULL,
  `divisi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id_staff`, `nama_staff`, `gender`, `alamat`, `no_telp_staff`, `divisi`) VALUES
('ST0101', 'Sin-Ahhi-Eriba Alea', 'L', 'Solo', '087473827482', 'Kebersihan'),
('ST0102', 'Gerhild Renatus', 'L', 'Klaten', '085362718234', 'Kebersihan'),
('ST0103', 'Rostislav Sevda', 'P', 'Karanganyar', '081526384625', 'Kebersihan'),
('ST0104', 'Teo Winifrid', 'L', 'Sragen', '083526382736', 'Kebersihan'),
('ST0105', 'Barabal Lal', 'L', 'Temanggung', '087625142111', 'Kebersihan'),
('ST0113', 'Lasse Imanol', 'L', 'Purwokerto', '087826352415', 'Kebersihan'),
('ST0117', 'Nancy Željko', 'P', 'Solo', '086483727888', 'Kebersihan'),
('ST0201', 'Lazzaro Udo', 'L', 'Semarang', '087654786787', 'Gizi'),
('ST0204', 'Joandra Emerson', 'L', 'Tegal', '086827645623', 'Gizi'),
('ST0205', 'Aubrey Feride', 'L', 'Surabaya', '082637847362', 'Gizi'),
('ST0220', 'Kathy Yohannes', 'P', 'Solo', '087444355726', 'Gizi'),
('ST0302', 'Pyrrhus Dema', 'P', 'Surabaya', '082738276457', 'Keamanan'),
('ST0334', 'Mildred Terminus', 'L', 'Purworejo', '0876253726162', 'Keamanan');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`id_pasien` char(6)
,`nama_pasien` varchar(25)
,`gender` enum('L','P')
,`alamat_pasien` varchar(40)
,`no_telp_pasien` varchar(15)
,`id_ICU` char(6)
,`id_perawat` char(6)
,`id_poli` char(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
CREATE TABLE `view2` (
`id_dokter` char(6)
,`nama_dokter` varchar(25)
,`nama_spesialisasi` varchar(20)
,`gender` enum('L','P')
,`alamat` varchar(50)
,`no_telp_dokter` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view3`
-- (See below for the actual view)
--
CREATE TABLE `view3` (
`id_pasien` char(6)
,`nama_pasien` varchar(25)
,`gender` enum('L','P')
,`alamat_pasien` varchar(40)
,`no_telp_pasien` varchar(15)
,`id_ICU` char(6)
,`id_perawat` char(6)
,`id_poli` char(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view4`
-- (See below for the actual view)
--
CREATE TABLE `view4` (
`id_pasien` char(6)
,`nama_pasien` varchar(25)
,`gender` enum('L','P')
,`alamat_pasien` varchar(40)
,`no_telp_pasien` varchar(15)
,`id_ICU` char(6)
,`id_perawat` char(6)
,`id_poli` char(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view5`
-- (See below for the actual view)
--
CREATE TABLE `view5` (
`id_pasien` char(6)
,`nama_pasien` varchar(25)
,`gender` enum('L','P')
,`alamat_pasien` varchar(40)
,`no_telp_pasien` varchar(15)
,`id_ICU` char(6)
,`id_perawat` char(6)
,`id_poli` char(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view6`
-- (See below for the actual view)
--
CREATE TABLE `view6` (
`id_pasien` char(6)
,`nama_pasien` varchar(25)
,`gender` enum('L','P')
,`alamat_pasien` varchar(40)
,`no_telp_pasien` varchar(15)
,`id_ICU` char(6)
,`id_perawat` char(6)
,`id_poli` char(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view7`
-- (See below for the actual view)
--
CREATE TABLE `view7` (
`id_dokter` char(6)
,`nama_dokter` varchar(25)
,`nama_spesialisasi` varchar(20)
,`gender` enum('L','P')
,`alamat` varchar(50)
,`no_telp_dokter` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view8`
-- (See below for the actual view)
--
CREATE TABLE `view8` (
`id_perawat` char(6)
,`nama_perawat` varchar(25)
,`gender` enum('L','P')
,`jam_jaga` varchar(12)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view9`
-- (See below for the actual view)
--
CREATE TABLE `view9` (
`id_perawat` char(6)
,`nama_perawat` varchar(25)
,`gender` enum('L','P')
,`jam_jaga` varchar(12)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view10`
-- (See below for the actual view)
--
CREATE TABLE `view10` (
`id_staff` char(6)
,`nama_staff` varchar(25)
,`gender` enum('L','P')
,`alamat` varchar(40)
,`no_telp_staff` varchar(15)
,`divisi` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `pasien`.`id_pasien` AS `id_pasien`,`pasien`.`nama_pasien` AS `nama_pasien`,`pasien`.`gender` AS `gender`,`pasien`.`alamat_pasien` AS `alamat_pasien`,`pasien`.`no_telp_pasien` AS `no_telp_pasien`,`pasien`.`id_ICU` AS `id_ICU`,`pasien`.`id_perawat` AS `id_perawat`,`pasien`.`id_poli` AS `id_poli` from `pasien` where ((`pasien`.`alamat_pasien` = 'Solo') and `pasien`.`id_pasien` in (select `melayani`.`id_pasien` from `melayani` where `melayani`.`id_staff` in (select `staff`.`id_staff` from `staff` where (`staff`.`gender` = 'L')))) ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS  select distinct `dokter`.`id_dokter` AS `id_dokter`,`dokter`.`nama_dokter` AS `nama_dokter`,`dokter`.`nama_spesialisasi` AS `nama_spesialisasi`,`dokter`.`gender` AS `gender`,`dokter`.`alamat` AS `alamat`,`dokter`.`no_telp_dokter` AS `no_telp_dokter` from `dokter` where ((`dokter`.`nama_spesialisasi` = 'Spesialis Mata') and `dokter`.`id_dokter` in (select `memeriksa`.`id_dokter` from `memeriksa` where `memeriksa`.`id_pasien` in (select `pasien`.`id_pasien` from `pasien` where (`pasien`.`alamat_pasien` = 'Karanganyar')))) ;

-- --------------------------------------------------------

--
-- Structure for view `view3`
--
DROP TABLE IF EXISTS `view3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view3`  AS  select `pasien`.`id_pasien` AS `id_pasien`,`pasien`.`nama_pasien` AS `nama_pasien`,`pasien`.`gender` AS `gender`,`pasien`.`alamat_pasien` AS `alamat_pasien`,`pasien`.`no_telp_pasien` AS `no_telp_pasien`,`pasien`.`id_ICU` AS `id_ICU`,`pasien`.`id_perawat` AS `id_perawat`,`pasien`.`id_poli` AS `id_poli` from `pasien` where `pasien`.`id_pasien` in (select `administrasi`.`id_pasien` from `administrasi` where ((`administrasi`.`id_pemeriksaan` is not null) and isnull(`administrasi`.`id_resep`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view4`
--
DROP TABLE IF EXISTS `view4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view4`  AS  select `pasien`.`id_pasien` AS `id_pasien`,`pasien`.`nama_pasien` AS `nama_pasien`,`pasien`.`gender` AS `gender`,`pasien`.`alamat_pasien` AS `alamat_pasien`,`pasien`.`no_telp_pasien` AS `no_telp_pasien`,`pasien`.`id_ICU` AS `id_ICU`,`pasien`.`id_perawat` AS `id_perawat`,`pasien`.`id_poli` AS `id_poli` from `pasien` where (`pasien`.`id_pasien` in (select `administrasi`.`id_pasien` from `administrasi` where (`administrasi`.`id_kamar` is not null)) and `pasien`.`id_pasien` in (select `resep`.`id_pasien` from `resep` where `resep`.`id_dokter` in (select `dokter`.`id_dokter` from `dokter` where (`dokter`.`gender` = 'L')))) ;

-- --------------------------------------------------------

--
-- Structure for view `view5`
--
DROP TABLE IF EXISTS `view5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view5`  AS  select `pasien`.`id_pasien` AS `id_pasien`,`pasien`.`nama_pasien` AS `nama_pasien`,`pasien`.`gender` AS `gender`,`pasien`.`alamat_pasien` AS `alamat_pasien`,`pasien`.`no_telp_pasien` AS `no_telp_pasien`,`pasien`.`id_ICU` AS `id_ICU`,`pasien`.`id_perawat` AS `id_perawat`,`pasien`.`id_poli` AS `id_poli` from `pasien` where ((`pasien`.`gender` = 'P') and `pasien`.`id_pasien` in (select `memeriksa`.`id_pasien` from `memeriksa` where `memeriksa`.`id_dokter` in (select `dokter`.`id_dokter` from `dokter` where (`dokter`.`nama_spesialisasi` = 'spesialis gigi')))) ;

-- --------------------------------------------------------

--
-- Structure for view `view6`
--
DROP TABLE IF EXISTS `view6`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view6`  AS  select `pasien`.`id_pasien` AS `id_pasien`,`pasien`.`nama_pasien` AS `nama_pasien`,`pasien`.`gender` AS `gender`,`pasien`.`alamat_pasien` AS `alamat_pasien`,`pasien`.`no_telp_pasien` AS `no_telp_pasien`,`pasien`.`id_ICU` AS `id_ICU`,`pasien`.`id_perawat` AS `id_perawat`,`pasien`.`id_poli` AS `id_poli` from `pasien` where ((`pasien`.`id_poli` is not null) and isnull(`pasien`.`id_ICU`) and `pasien`.`id_perawat` in (select `perawat`.`id_perawat` from `perawat` where (`perawat`.`gender` = 'L'))) ;

-- --------------------------------------------------------

--
-- Structure for view `view7`
--
DROP TABLE IF EXISTS `view7`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view7`  AS  select `dokter`.`id_dokter` AS `id_dokter`,`dokter`.`nama_dokter` AS `nama_dokter`,`dokter`.`nama_spesialisasi` AS `nama_spesialisasi`,`dokter`.`gender` AS `gender`,`dokter`.`alamat` AS `alamat`,`dokter`.`no_telp_dokter` AS `no_telp_dokter` from `dokter` where (`dokter`.`id_dokter` in (select `memiliki`.`id_dokter` from `memiliki` where `memiliki`.`id_poli` in (select `poli`.`id_poli` from `poli` where (`poli`.`nama_poli` = 'poli mata'))) and `dokter`.`id_dokter` in (select `memeriksa`.`id_dokter` from `memeriksa` where `memeriksa`.`id_pasien` in (select `pasien`.`id_pasien` from `pasien` where (`pasien`.`alamat_pasien` = 'karanganyar')))) ;

-- --------------------------------------------------------

--
-- Structure for view `view8`
--
DROP TABLE IF EXISTS `view8`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view8`  AS  select `perawat`.`id_perawat` AS `id_perawat`,`perawat`.`nama_perawat` AS `nama_perawat`,`perawat`.`gender` AS `gender`,`perawat`.`jam_jaga` AS `jam_jaga` from `perawat` where (`perawat`.`id_perawat` in (select `pasien`.`id_perawat` from `pasien` where (`pasien`.`id_ICU` is not null)) and (`perawat`.`gender` = 'P')) ;

-- --------------------------------------------------------

--
-- Structure for view `view9`
--
DROP TABLE IF EXISTS `view9`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view9`  AS  select `perawat`.`id_perawat` AS `id_perawat`,`perawat`.`nama_perawat` AS `nama_perawat`,`perawat`.`gender` AS `gender`,`perawat`.`jam_jaga` AS `jam_jaga` from `perawat` where `perawat`.`id_perawat` in (select `pasien`.`id_perawat` from `pasien` where `pasien`.`id_pasien` in (select `administrasi`.`id_pasien` from `administrasi` where `administrasi`.`id_kamar` in (select `rawat_inap`.`id_kamar` from `rawat_inap` where (`rawat_inap`.`nama_kelas` = 'Kelas 1')))) ;

-- --------------------------------------------------------

--
-- Structure for view `view10`
--
DROP TABLE IF EXISTS `view10`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view10`  AS  select `staff`.`id_staff` AS `id_staff`,`staff`.`nama_staff` AS `nama_staff`,`staff`.`gender` AS `gender`,`staff`.`alamat` AS `alamat`,`staff`.`no_telp_staff` AS `no_telp_staff`,`staff`.`divisi` AS `divisi` from `staff` where ((`staff`.`divisi` = 'Gizi') and `staff`.`id_staff` in (select `melayani`.`id_staff` from `melayani` where `melayani`.`id_pasien` in (select `administrasi`.`id_pasien` from `administrasi` where `administrasi`.`id_kamar` in (select `rawat_inap`.`id_kamar` from `rawat_inap` where (`rawat_inap`.`nama_kelas` = 'VVIP'))))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`id_administrasi`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_pemeriksaan` (`id_pemeriksaan`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `asuransi`
--
ALTER TABLE `asuransi`
  ADD PRIMARY KEY (`id_asuransi`);

--
-- Indexes for table `bagian_dari`
--
ALTER TABLE `bagian_dari`
  ADD KEY `id_radiologi` (`id_radiologi`),
  ADD KEY `id_pemeriksaan` (`id_pemeriksaan`);

--
-- Indexes for table `dibutuhkan`
--
ALTER TABLE `dibutuhkan`
  ADD KEY `id_IGD` (`id_IGD`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `icu`
--
ALTER TABLE `icu`
  ADD PRIMARY KEY (`id_ICU`);

--
-- Indexes for table `igd`
--
ALTER TABLE `igd`
  ADD PRIMARY KEY (`id_IGD`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `laboratorium`
--
ALTER TABLE `laboratorium`
  ADD PRIMARY KEY (`id_lab`);

--
-- Indexes for table `melayani`
--
ALTER TABLE `melayani`
  ADD KEY `id_staff` (`id_staff`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `meliputi`
--
ALTER TABLE `meliputi`
  ADD KEY `id_administrasi` (`id_administrasi`),
  ADD KEY `id_asuransi` (`id_asuransi`);

--
-- Indexes for table `memeriksa`
--
ALTER TABLE `memeriksa`
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `memerlukan`
--
ALTER TABLE `memerlukan`
  ADD KEY `id_pemeriksaan` (`id_pemeriksaan`),
  ADD KEY `id_lab` (`id_lab`);

--
-- Indexes for table `memiliki`
--
ALTER TABLE `memiliki`
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_ICU` (`id_ICU`),
  ADD KEY `id_perawat` (`id_perawat`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`id_pemeriksaan`),
  ADD KEY `id_poli` (`id_poli`),
  ADD KEY `id_ICU` (`id_ICU`),
  ADD KEY `id_IGD` (`id_IGD`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indexes for table `radiologi`
--
ALTER TABLE `radiologi`
  ADD PRIMARY KEY (`id_radiologi`),
  ADD KEY `id_rekammedis` (`id_rekammedis`);

--
-- Indexes for table `rawat_inap`
--
ALTER TABLE `rawat_inap`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id_rekammedis`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD CONSTRAINT `administrasi_ibfk_1` FOREIGN KEY (`id_pemeriksaan`) REFERENCES `pemeriksaan` (`id_pemeriksaan`),
  ADD CONSTRAINT `administrasi_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `administrasi_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `administrasi_ibfk_4` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`),
  ADD CONSTRAINT `administrasi_ibfk_5` FOREIGN KEY (`id_kamar`) REFERENCES `rawat_inap` (`id_kamar`);

--
-- Constraints for table `bagian_dari`
--
ALTER TABLE `bagian_dari`
  ADD CONSTRAINT `bagian_dari_ibfk_1` FOREIGN KEY (`id_radiologi`) REFERENCES `radiologi` (`id_radiologi`),
  ADD CONSTRAINT `bagian_dari_ibfk_2` FOREIGN KEY (`id_pemeriksaan`) REFERENCES `pemeriksaan` (`id_pemeriksaan`);

--
-- Constraints for table `dibutuhkan`
--
ALTER TABLE `dibutuhkan`
  ADD CONSTRAINT `dibutuhkan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `dibutuhkan_ibfk_2` FOREIGN KEY (`id_IGD`) REFERENCES `igd` (`id_IGD`);

--
-- Constraints for table `igd`
--
ALTER TABLE `igd`
  ADD CONSTRAINT `igd_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `melayani`
--
ALTER TABLE `melayani`
  ADD CONSTRAINT `melayani_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `melayani_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`);

--
-- Constraints for table `meliputi`
--
ALTER TABLE `meliputi`
  ADD CONSTRAINT `meliputi_ibfk_1` FOREIGN KEY (`id_asuransi`) REFERENCES `asuransi` (`id_asuransi`),
  ADD CONSTRAINT `meliputi_ibfk_2` FOREIGN KEY (`id_administrasi`) REFERENCES `administrasi` (`id_administrasi`);

--
-- Constraints for table `memeriksa`
--
ALTER TABLE `memeriksa`
  ADD CONSTRAINT `memeriksa_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `memeriksa_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `memerlukan`
--
ALTER TABLE `memerlukan`
  ADD CONSTRAINT `memerlukan_ibfk_1` FOREIGN KEY (`id_pemeriksaan`) REFERENCES `pemeriksaan` (`id_pemeriksaan`),
  ADD CONSTRAINT `memerlukan_ibfk_2` FOREIGN KEY (`id_lab`) REFERENCES `laboratorium` (`id_lab`);

--
-- Constraints for table `memiliki`
--
ALTER TABLE `memiliki`
  ADD CONSTRAINT `memiliki_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `memiliki_ibfk_2` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`);

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`id_perawat`) REFERENCES `perawat` (`id_perawat`),
  ADD CONSTRAINT `pasien_ibfk_2` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`),
  ADD CONSTRAINT `pasien_ibfk_3` FOREIGN KEY (`id_ICU`) REFERENCES `icu` (`id_ICU`);

--
-- Constraints for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`id_IGD`) REFERENCES `igd` (`id_IGD`),
  ADD CONSTRAINT `pemeriksaan_ibfk_2` FOREIGN KEY (`id_ICU`) REFERENCES `icu` (`id_ICU`),
  ADD CONSTRAINT `pemeriksaan_ibfk_3` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`);

--
-- Constraints for table `radiologi`
--
ALTER TABLE `radiologi`
  ADD CONSTRAINT `radiologi_ibfk_1` FOREIGN KEY (`id_rekammedis`) REFERENCES `rekam_medis` (`id_rekammedis`);

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `resep_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
