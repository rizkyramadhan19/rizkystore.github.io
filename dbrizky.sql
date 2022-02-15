-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 02:58 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbrizky`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_nama` varchar(100) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_nama`, `admin_username`, `admin_password`, `admin_foto`) VALUES
(1, 'Rizky Ramadhan', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1352025327_avatar.png'),
(8, 'Rizky Ramadhan', 'rizkyr', 'a57c6d955a1bf314aa97b688f780270e', '971713598_1352025327_avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_nama` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_hp` varchar(20) NOT NULL,
  `customer_alamat` text NOT NULL,
  `customer_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_nama`, `customer_email`, `customer_hp`, `customer_alamat`, `customer_password`) VALUES
(5, 'Jamaika Bob', 'jamaika@gmail.com', '08262122771', 'jalan rasta uye nomor 1', '91ec1f9324753048c0096d036a694f86'),
(6, 'Rosalina', 'rosalina@gmail.com', '082827287', 'jalan meruakaja', '91ec1f9324753048c0096d036a694f86'),
(7, 'suleha alala', 'suleha@gmail.com', '982737383737', 'sasdkajndkasjdn', 'ae2831cce9ac4de6a703a728f26cc07b'),
(8, 'rizky ramadhan', 'rizkyr@gmail.com', '0823189319', 'bekasi', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_tanggal` date NOT NULL,
  `invoice_customer` int(11) NOT NULL,
  `invoice_nama` varchar(255) NOT NULL,
  `invoice_hp` varchar(255) NOT NULL,
  `invoice_alamat` text NOT NULL,
  `invoice_provinsi` varchar(255) NOT NULL,
  `invoice_kabupaten` varchar(255) NOT NULL,
  `invoice_kurir` varchar(255) NOT NULL,
  `invoice_berat` int(11) NOT NULL,
  `invoice_ongkir` int(11) NOT NULL,
  `invoice_total_bayar` int(11) NOT NULL,
  `invoice_status` int(11) NOT NULL,
  `invoice_resi` varchar(255) NOT NULL,
  `invoice_bukti` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_tanggal`, `invoice_customer`, `invoice_nama`, `invoice_hp`, `invoice_alamat`, `invoice_provinsi`, `invoice_kabupaten`, `invoice_kurir`, `invoice_berat`, `invoice_ongkir`, `invoice_total_bayar`, `invoice_status`, `invoice_resi`, `invoice_bukti`) VALUES
(5, '2019-06-13', 5, 'Jamaika / Ibu ida', '9828272723', 'JL. makmur no.17 , rumahw arna putih', '1', '1', 'JNE', 300, 24000, 960000, 0, '', ''),
(6, '2019-06-13', 5, 'Jamaika Bob', '08272263637', 'Jalan Pentolan Nomor 1C, Rasta mania', 'Maluku', 'Maluku Tenggara', 'JNE - OKE', 300, 108000, 808500, 3, '', '577813088.jpg'),
(7, '2019-06-14', 6, 'Rosalina / Ibu Ros', '08282723833', 'jalan mewawaw nomor 34 A. Komplek Pertamburan,', 'Kalimantan Utara', 'Nunukan', 'Pos Indonesia - Paket Kilat Khusus', 200, 71500, 351500, 5, '', '2001382847.jpg'),
(8, '2019-07-25', 7, 'Suleha', '0897273737383', 'jalan merpati putih nomor 21, surabaya', 'Banten', 'Pandeglang', 'Pos Indonesia - Paket Kilat Khusus', 200, 13000, 353000, 5, '', '1048853755.jpg'),
(9, '2020-12-02', 8, 'rizky', '0832198392131', 'bekasi', 'Jawa Barat', '', ' - ', 100, 0, 2300000, 0, '', ''),
(10, '2020-12-02', 8, 'joko', '083219312731', 'bekasi', 'Jawa Barat', 'Bekasi', 'Pos Indonesia - Paket Kilat Khusus', 100, 7000, 1107000, 0, '', ''),
(11, '2020-12-03', 8, 'johan', '0812392172174', 'bekasi', 'DI Yogyakarta', 'Gunung Kidul', 'Pos Indonesia - Paket Kilat Khusus', 200, 17000, 3617000, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Razer'),
(2, 'Sades'),
(3, 'Steelseries'),
(4, 'HyperX'),
(5, 'Logitech');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `produk_nama` varchar(255) NOT NULL,
  `produk_kategori` int(11) NOT NULL,
  `produk_harga` int(11) NOT NULL,
  `produk_keterangan` text NOT NULL,
  `produk_jumlah` int(11) NOT NULL,
  `produk_berat` int(11) NOT NULL,
  `produk_foto1` varchar(255) DEFAULT NULL,
  `produk_foto2` varchar(255) DEFAULT NULL,
  `produk_foto3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_nama`, `produk_kategori`, `produk_harga`, `produk_keterangan`, `produk_jumlah`, `produk_berat`, `produk_foto1`, `produk_foto2`, `produk_foto3`) VALUES
(6, 'Sades Scythe RGB Gaming Mouse', 2, 245000, 'Sades Scythe, 7 Programmable buttons, 11 RGB Lightning Mode<br>Mouse Scythe membawa kinerja yang sangat baik dalam sensor, akurasi, dan presisi di semua FPS Game Title. Ini memungkinkan konsumen untuk menyesuaikan fungsi dan mode pencahayaan RGB<br>DESIGN<br>- Ergonomic, Right-Handed<br>- Grip Style: Palm, Claw, Fingertip<br>- Buttons: 7<br>', 10, 100, 'sades1.png', '', ''),
(8, 'Steelseries Apex 3 Water Resistant Gaming Keyboard', 3, 1110000, '<p>APEX 3\r\nWater resistant gaming keyboard\r\nIP32 water resistant for protection against spills\r\nCustomizable 10-zone RGB illumination reacts to games and Discord\r\nWhisper quiet gaming switches last for over 20 million keypresses\r\nPremium magnetic wrist rest provides full palm support and comfortable feel\r\nDedicated multimedia controls for easily adjusting volume and media<br></p>', 2, 100, 'ss4.jpg', '', ''),
(9, 'HyperX PULSEFIRE FPS PRO Gaming Mouse', 4, 700000, '<p>Pro-level gamers know that if you’re not improving, you’re just a stepping stone for someone who is, and the same goes for your gear. Upgrade your mouse to the HyperX Pulsefire FPS Pro RGB Gaming Mouse and give your setup a shot of RGB style and headshots to anyone foolhardy enough to drop near you.<br> The Pulsefire FPS Pro uses the premium Pixart 3389 sensor, which is capable of tracking at up to 16,000 DPI with no hardware acceleration, to give you the reliable precision you need to hit your shots before your enemy lines up theirs. The ergonomic design is crafted to comfortably fit in your hand and not slip when victory is on the line.<br> Set up your mouse just the way you like with its six programmable buttons in the easy-to-use HyperX NGenuity software, and save your config directly to the onboard memory. Omron switches provide crisp, tactile feedback so you’ll know that your clicks have been registered. Extra-large skates give the Pulsefire FPS Pro a solid base for smooth, controlled gliding that allows you to both track and flick with ease.<br></p>', 4, 200, 'hyperx3.jpg', '', ''),
(10, 'HyperX QuadCast USB Condenser Gaming Microphone for Streaming', 4, 2500000, '<p>HyperX QuadCast\r\nThe HyperX QuadCast™ is the ideal all-inclusive standalone microphone for the aspiring streamer or podcaster looking for a condenser mic with quality sound. QuadCast comes with its own anti-vibration shock mount to help reduce the rumbles of daily life and a built-in pop filter to muffle pesky percussive sounds. Instantly know your mic status with the LED indicator, and simply tap-to-mute to avoid awkward broadcasting accidents. Select between the four polar patterns (stereo, omnidirectional, cardioid, bidirectional) and use the conveniently-located gain control dial to quickly adjust your mic input sensitivity. The included mount adapter fits both 3/8” and 5/8” thread sizes and is compatible with most stands.\r\n\r\nMonitor your mic input with the built-in headphone jack, and QuadCast is certified by Discord and TeamSpeak™ so you can ensure that your microphone is broadcasting loud and clear for all your followers and listeners. Whether you’re plugging into a PC, PS4™, or Mac® you’ll be able to deliver quality sound to anyone tuning in.<br><br>Microphone<br>Power consumption : 5V 125mA<br>Sample/bit rate : 48kHz/16-bit<br>Elemen : Electret condenser microphone<br>Condenser type : Three 14mm condensers<br></p>', 4, 100, 'hyperx.jpg', '', ''),
(11, 'Steelseries Sensei Ten Neon Rider edition Gaming Mouse', 3, 1100000, '<p>SENSEI TEN\r\nNeon Rider Edition\r\nLimited edition RGB gaming mouse featuring the infamous Neon Rider. Each mouse is uniquely numbered for authenticity.\r\n\r\nLimited edition Neon Rider design from CS:GO, uniquely numbered for authenticity\r\nAll-new TrueMove Pro sensor and on-board memory\r\n60 million click mechanical switches\r\nComfortable ambidextrous design for left and right-handed players\r\nHyper durable build to withstand the most intense wear and tear<br>The best sensor in gaming\r\nDesigned exclusively by SteelSeries and PixArt to outperform any mouse on any mousepad, the TrueMove Pro has pinpoint precision like never before.\r\n\r\nBalanced for Performance\r\nWith an unreal 18,000 CPI, 450 IPS, and 50G acceleration, the TrueMove Pro sensor is optimized specifically to track better than any other sensor on the market, so your aim is more precise than ever.\r\n\r\nTilt Tracking\r\nEven when repositioning your mouse by lifting it up and placing it back down at tilted angles, the TrueMove Pro’s precision tracking stays consistent, eliminating tracking errors during the most intense gameplay.<br>Sensor\r\nTrueMove Pro\r\n\r\nSensor Type\r\nOptical\r\n\r\nCPI\r\n50–18,000 in 50 CPI Increments\r\n\r\nIPS\r\n450, on SteelSeries QcK surfaces\r\n\r\nAcceleration\r\n50G\r\n\r\nPolling Rate\r\n1000Hz 1 ms\r\n\r\nHardware Acceleration\r\nNone (Zero Hardware Acceleration)\r\n\r\nBack Cover Material\r\nMatte Finish\r\n\r\nCore Construction\r\nABS Plastic\r\n\r\nShape\r\nAmbidextrous\r\n\r\nGrip Style\r\nClaw, Fingertip, or Palm\r\n\r\nNumber of Buttons\r\n8\r\n\r\nSwitch Type\r\nSteelSeries mechanical switches, rated for 60 million clicks\r\n\r\nIllumination\r\n2 RGB Zones, Independently Controlled<br>Weight\r\n92g (3.25oz) without cable\r\n\r\nLength\r\n126mm / 4.96 inches\r\n\r\nWidth\r\n63mm / 2.48 inches (front), 68mm / 2.67 inches (back)\r\n\r\nHeight\r\n21mm / 0.83 inches (front), 39mm / 1.54 inches (back)\r\n\r\nRubber Cable Length\r\n2m / 6.75 feet.<br></p>', 20, 100, 'ss3.jpg', '', ''),
(12, 'Steelseries Arctis 5 White Gaming Headset', 3, 2300000, '<p>- stiker vinyl dan laminasi glitter kualitas 1\r\n- semua bahan pake kualitas super yang ramah lingkungan dan aman bagi kesehatan\r\n- rapih dengan packaging exclusive\r\n- desain stiker resolus HD (high definition)<br><br></p>', 2, 100, 'ss1.png', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `transaksi_invoice` int(11) NOT NULL,
  `transaksi_produk` int(11) NOT NULL,
  `transaksi_jumlah` int(11) NOT NULL,
  `transaksi_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `transaksi_invoice`, `transaksi_produk`, `transaksi_jumlah`, `transaksi_harga`) VALUES
(1, 0, 3, 1, 120000),
(2, 0, 1, 1, 1234),
(3, 0, 3, 1, 120000),
(4, 0, 1, 1, 1234),
(5, 1, 3, 1, 120000),
(6, 1, 1, 1, 1234),
(9, 3, 3, 1, 120000),
(10, 4, 4, 1, 123000),
(11, 5, 7, 2, 240000),
(12, 5, 8, 1, 80000),
(13, 5, 10, 1, 400000),
(14, 6, 10, 1, 400000),
(15, 6, 9, 1, 300500),
(16, 7, 11, 2, 80000),
(17, 7, 12, 1, 120000),
(19, 8, 11, 1, 80000),
(20, 9, 12, 1, 2300000),
(21, 10, 11, 1, 1100000),
(22, 11, 11, 1, 1100000),
(23, 11, 10, 1, 2500000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
