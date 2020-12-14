-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2017 at 12:28 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasilagi`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_anggota`
--

CREATE TABLE `t_anggota` (
  `kode_anggota` char(5) NOT NULL,
  `kode_tabungan` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat_anggota` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `telp` varchar(12) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_anggota`
--

INSERT INTO `t_anggota` (`kode_anggota`, `kode_tabungan`, `nama_anggota`, `alamat_anggota`, `jenis_kelamin`, `pekerjaan`, `tgl_masuk`, `telp`, `tempat_lahir`, `tgl_lahir`, `u_entry`, `tgl_entri`) VALUES
('A0001', 31, 'Rino Oktavianto', 'Baron', 'Laki-laki', 'Sepak Bola', '2017-02-16', '091', 'Nganjuk', '2017-02-01', 'OKtavianto', '2017-02-16'),
('A0002', 32, 'Siti Verida', 'Baron', 'Perempuan', 'Guru', '2017-02-16', '091', 'Nganjuk', '2017-02-02', 'OKtavianto', '2017-02-16'),
('A0003', 33, 'Veno', 'Baron', 'Laki-laki', 'Siswa', '2017-02-16', '091', 'Nganjuk', '2017-02-03', 'OKtavianto', '2017-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `t_angsur`
--

CREATE TABLE `t_angsur` (
  `kode_angsur` int(11) NOT NULL,
  `kode_pinjam` int(11) NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `sisa_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_angsur`
--

INSERT INTO `t_angsur` (`kode_angsur`, `kode_pinjam`, `angsuran_ke`, `besar_angsuran`, `denda`, `sisa_pinjam`, `kode_anggota`, `u_entry`, `tgl_entri`) VALUES
(120, 50, 1, 27000, 0, 73000, 'A0003', 'OKtavianto', '2017-02-17'),
(119, 49, 1, 270000, 0, 730000, 'A0002', 'OKtavianto', '2017-02-17'),
(118, 48, 1, 540000, 0, 1460000, 'A0001', 'OKtavianto', '2017-02-17'),
(121, 49, 2, 270000, 0, 460000, 'A0002', 'OKtavianto', '2017-02-18'),
(122, 49, 3, 270000, 0, 190000, 'A0002', 'OKtavianto', '2017-02-18'),
(123, 49, 4, 270000, 0, -80000, 'A0002', 'OKtavianto', '2017-02-18'),
(124, 51, 1, 135000, 0, 365000, 'A0002', 'OKtavianto', '2017-02-19'),
(125, 50, 2, 27000, 0, 46000, 'A0003', 'operator', '2017-02-20'),
(126, 51, 2, 135000, 0, 230000, 'A0002', 'operator', '2017-02-20');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_pinjam`
--

CREATE TABLE `t_jenis_pinjam` (
  `kode_jenis_pinjam` char(5) NOT NULL,
  `nama_pinjaman` varchar(50) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `maks_pinjam` double NOT NULL,
  `bunga` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jenis_pinjam`
--

INSERT INTO `t_jenis_pinjam` (`kode_jenis_pinjam`, `nama_pinjaman`, `lama_angsuran`, `maks_pinjam`, `bunga`, `u_entry`, `tgl_entri`) VALUES
('P0001', 'biasa', 4, 2000000, 2, 'okta', '2017-02-01'),
('P0002', 'Menengah', 8, 4000000, 4, '', '2017-03-09');

-- --------------------------------------------------------

--
-- Table structure for table `t_jenis_simpan`
--

CREATE TABLE `t_jenis_simpan` (
  `kode_jenis_simpan` char(5) NOT NULL,
  `nama_simpanan` varchar(50) NOT NULL,
  `besar_simpanan` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_jenis_simpan`
--

INSERT INTO `t_jenis_simpan` (`kode_jenis_simpan`, `nama_simpanan`, `besar_simpanan`, `u_entry`, `tgl_entri`) VALUES
('S0001', 'pokok', 10000, 'OKtavianto', '2017-03-09'),
('S0002', 'wajib', 70000, 'OKtavianto', '2017-04-08'),
('S0003', 'sukarela', 0, 'OKtavianto', '2017-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `t_pengajuan`
--

CREATE TABLE `t_pengajuan` (
  `kode_pengajuan` int(4) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_jenis_pinjam` varchar(10) NOT NULL,
  `besar_pinjam` int(11) NOT NULL,
  `tgl_acc` date NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengajuan`
--

INSERT INTO `t_pengajuan` (`kode_pengajuan`, `tgl_pengajuan`, `kode_anggota`, `kode_jenis_pinjam`, `besar_pinjam`, `tgl_acc`, `status`) VALUES
(1, '2017-02-19', 'A0002', 'P0001', 1000000, '0000-00-00', 'ditolak'),
(2, '2017-02-19', 'A0001', 'P0001', 100000, '0000-00-00', 'ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `t_pengambilan`
--

CREATE TABLE `t_pengambilan` (
  `kode_ambil` int(5) NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_tabungan` int(5) NOT NULL,
  `besar_ambil` int(20) NOT NULL,
  `tgl_ambil` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengambilan`
--

INSERT INTO `t_pengambilan` (`kode_ambil`, `kode_anggota`, `kode_tabungan`, `besar_ambil`, `tgl_ambil`) VALUES
(9, 'A0001', 31, 50000, '2017-02-17'),
(10, 'A0002', 32, 1000, '2017-02-17'),
(11, 'A0002', 32, 50000, '2017-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `t_petugas`
--

CREATE TABLE `t_petugas` (
  `kode_petugas` char(5) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `alamat_petugas` varchar(100) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_petugas`
--

INSERT INTO `t_petugas` (`kode_petugas`, `nama_petugas`, `alamat_petugas`, `no_telp`, `jenis_kelamin`, `u_entry`, `tgl_entri`) VALUES
('P0001', 'operator', 'Baron', '0918', 'Laki-laki', 'OKtavianto', '2017-02-16');

-- --------------------------------------------------------

--
-- Table structure for table `t_pinjam`
--

CREATE TABLE `t_pinjam` (
  `kode_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `kode_jenis_pinjam` char(5) NOT NULL,
  `besar_pinjam` double NOT NULL,
  `besar_angsuran` double NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `sisa_angsuran` int(11) NOT NULL,
  `sisa_pinjaman` double NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  `tgl_tempo` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pinjam`
--

INSERT INTO `t_pinjam` (`kode_pinjam`, `kode_anggota`, `kode_jenis_pinjam`, `besar_pinjam`, `besar_angsuran`, `lama_angsuran`, `sisa_angsuran`, `sisa_pinjaman`, `u_entry`, `tgl_entri`, `tgl_tempo`, `status`) VALUES
(48, 'A0001', 'P0001', 2000000, 540000, 4, 1, 1460000, 'OKtavianto', '2017-02-16', '2017-04-17', 'belum lunas'),
(49, 'A0002', 'P0001', 1000000, 270000, 4, 4, -80000, 'OKtavianto', '2017-02-17', '2017-06-17', 'lunas'),
(50, 'A0003', 'P0001', 100000, 27000, 4, 2, 46000, 'OKtavianto', '2017-02-17', '2017-05-18', 'belum lunas'),
(51, 'A0002', 'P0001', 500000, 135000, 4, 2, 230000, 'OKtavianto', '2017-02-18', '2017-05-19', 'belum lunas');

-- --------------------------------------------------------

--
-- Table structure for table `t_simpan`
--

CREATE TABLE `t_simpan` (
  `kode_simpan` int(11) NOT NULL,
  `jenis_simpan` varchar(10) NOT NULL,
  `besar_simpanan` double NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_simpan`
--

INSERT INTO `t_simpan` (`kode_simpan`, `jenis_simpan`, `besar_simpanan`, `kode_anggota`, `u_entry`, `tgl_mulai`, `tgl_entri`) VALUES
(130, 'wajib', 70000, 'A0001', 'OKtavianto', '2017-02-23', '2017-02-16'),
(129, 'pokok', 10000, 'A0003', 'OKtavianto', '2017-02-16', '2017-02-16'),
(128, 'pokok', 10000, 'A0002', 'OKtavianto', '2017-02-16', '2017-02-16'),
(127, 'pokok', 10000, 'A0001', 'OKtavianto', '2017-02-16', '2017-02-16'),
(131, 'sukarela', 100000, 'A0001', 'OKtavianto', '2017-02-17', '2017-02-17'),
(132, 'wajib', 70000, 'A0003', 'OKtavianto', '2017-02-24', '2017-02-17'),
(133, 'wajib', 70000, 'A0002', 'OKtavianto', '2017-02-24', '2017-02-17'),
(134, 'sukarela', 1000, 'A0002', 'OKtavianto', '2017-02-17', '2017-02-17'),
(135, 'sukarela', 10000, 'A0002', 'OKtavianto', '2017-02-18', '2017-02-18'),
(136, 'sukarela', 5000, 'A0001', 'OKtavianto', '2017-02-18', '2017-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `t_tabungan`
--

CREATE TABLE `t_tabungan` (
  `kode_tabungan` int(11) NOT NULL,
  `kode_anggota` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `besar_tabungan` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `t_tabungan`
--

INSERT INTO `t_tabungan` (`kode_tabungan`, `kode_anggota`, `tgl_mulai`, `besar_tabungan`) VALUES
(32, 'A0002', '2017-02-16', 40000),
(31, 'A0001', '2017-02-16', 135000),
(33, 'A0003', '2017-02-16', 80000);

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `kode_user` char(5) NOT NULL,
  `kode_petugas` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `tgl_entri` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` char(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`kode_user`, `kode_petugas`, `username`, `password`, `nama`, `tgl_entri`, `foto`, `level`) VALUES
('U0001', '', 'rino', 'rino', 'oktavianto', '2017-02-15', 'I-love-you-hearts.PNG', 'operator'),
('U0002', '', 'admin', 'admin', 'OKtavianto', '2017-02-15', 'dd.jpg', 'admin'),
('U0003', 'P0001', 'operator', 'operator', 'operator', '2017-02-16', 'OKtavianto', 'operator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_anggota`
--
ALTER TABLE `t_anggota`
  ADD PRIMARY KEY (`kode_anggota`);

--
-- Indexes for table `t_angsur`
--
ALTER TABLE `t_angsur`
  ADD PRIMARY KEY (`kode_angsur`);

--
-- Indexes for table `t_jenis_pinjam`
--
ALTER TABLE `t_jenis_pinjam`
  ADD PRIMARY KEY (`kode_jenis_pinjam`);

--
-- Indexes for table `t_jenis_simpan`
--
ALTER TABLE `t_jenis_simpan`
  ADD PRIMARY KEY (`kode_jenis_simpan`);

--
-- Indexes for table `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  ADD PRIMARY KEY (`kode_pengajuan`);

--
-- Indexes for table `t_pengambilan`
--
ALTER TABLE `t_pengambilan`
  ADD PRIMARY KEY (`kode_ambil`);

--
-- Indexes for table `t_petugas`
--
ALTER TABLE `t_petugas`
  ADD PRIMARY KEY (`kode_petugas`);

--
-- Indexes for table `t_pinjam`
--
ALTER TABLE `t_pinjam`
  ADD PRIMARY KEY (`kode_pinjam`);

--
-- Indexes for table `t_simpan`
--
ALTER TABLE `t_simpan`
  ADD PRIMARY KEY (`kode_simpan`);

--
-- Indexes for table `t_tabungan`
--
ALTER TABLE `t_tabungan`
  ADD PRIMARY KEY (`kode_tabungan`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_angsur`
--
ALTER TABLE `t_angsur`
  MODIFY `kode_angsur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  MODIFY `kode_pengajuan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `t_pengambilan`
--
ALTER TABLE `t_pengambilan`
  MODIFY `kode_ambil` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `t_pinjam`
--
ALTER TABLE `t_pinjam`
  MODIFY `kode_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `t_simpan`
--
ALTER TABLE `t_simpan`
  MODIFY `kode_simpan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;
--
-- AUTO_INCREMENT for table `t_tabungan`
--
ALTER TABLE `t_tabungan`
  MODIFY `kode_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
