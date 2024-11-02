-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Nov 2024 pada 16.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbjfd_sep24`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `id` int(11) NOT NULL,
  `nama` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`id`, `nama`) VALUES
(1, 'Islam'),
(2, 'Katolik'),
(3, 'Kristen'),
(4, 'Budha'),
(5, 'Konghucu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `kode`, `nama`) VALUES
(1, 'IT', 'Information Technology'),
(2, 'FIN', 'Finance'),
(3, 'HR', 'Human Resources'),
(4, 'CS', 'Customer Services');

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `gender` char(1) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `nik` varchar(15) NOT NULL,
  `agama_id` varchar(15) DEFAULT NULL,
  `jabatan_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `tanggal_lahir`, `gender`, `alamat`, `nik`, `agama_id`, `jabatan_id`) VALUES
(1, 'Haruto', NULL, 'L', 'Jepang', '637372828', NULL, NULL),
(2, 'Sakura Haruno', NULL, 'P', 'Konoha', '63732736', NULL, NULL),
(3, 'Sasuke Uchiha', NULL, 'L', 'Konoha', '63732736', NULL, NULL),
(4, 'Naruto Uzumakiu', NULL, 'L', 'Konoha', '63732736', NULL, NULL),
(5, 'Kakashi Hatake', NULL, 'L', 'Konoha', '63732736', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_produk`
--

CREATE TABLE `master_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto1` varchar(250) NOT NULL,
  `foto2` varchar(250) DEFAULT NULL,
  `foto3` varchar(250) DEFAULT NULL,
  `video` varchar(250) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `spesifikasi` text DEFAULT NULL,
  `info_penting` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `master_produk`
--

INSERT INTO `master_produk` (`id`, `nama`, `kategori_id`, `harga`, `stok`, `foto1`, `foto2`, `foto3`, `video`, `deskripsi`, `spesifikasi`, `info_penting`, `created_at`, `created_by`, `update_at`, `update_by`, `active`) VALUES
(1, 'Baju 1 set anak', 4, 75000, 26, '2f3b48303fd22113220bddd7c0ecf9a6.jpg', '', '', '', 'Baju anak bagus untuk umur 6-11 tahun', 'Ukuran: All size', 'Pengiriman: Si Badai', '2024-10-19 11:02:04', 1, NULL, NULL, 1),
(2, 'Jaket bomber Army', 4, 120000, 26, '', '', '', '', 'Jaket bomber motif Army, cocok untuk dipakai keluar dan hangout ', 'Bahan: katun 50% polyester 50%\r\nUkuran: M,L,XL,XXL', 'Pesanan wajib mencantumkan alamat dengan rinci dna jelas, serta terdapat nomor hp yang bisa dihubungi', '2024-10-21 19:19:03', 1, NULL, NULL, 1),
(4, 'figure family kirito', 10, 500000, 10, 'mhardiansyah1334@gmail.com_20241021, 204113_2f3b48303fd22113220bddd7c0ecf9a6.jpg', NULL, NULL, NULL, 'Figure SAO terkeren 2024', 'bahan: aluminium', 'limited edision', '2024-10-21 20:41:13', 1, NULL, NULL, 1),
(5, 'Foto Capres 2024', 12, 150000, 10, 'mhardiansyah1334@gmail.com_20241021, 212440_anies.jpeg', 'mhardiansyah1334@gmail.com_20241021, 212440_prabowo.jpg', 'mhardiansyah1334@gmail.com_20241021, 212440_ganjar.jpeg', NULL, '', '', '', '2024-10-21 21:24:40', 1, NULL, NULL, 1),
(6, 'Foto Rohis', 12, 50000, 15, 'mhardiansyah1334@gmail.com_20241021, 214520_IMG_9492 (1).JPG', 'mhardiansyah1334@gmail.com_20241021, 214520_HardiRohis.jpg', 'mhardiansyah1334@gmail.com_20241021, 214520_', NULL, '', '', '', '2024-10-21 21:45:20', 1, NULL, NULL, 1),
(8, 'figure hachiman', 0, 100000, 46, '', NULL, NULL, NULL, 'bagus banget!!!', 'ukuran:ll size', 'mantap dah', '2024-10-31 21:14:38', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_produk_kategori`
--

CREATE TABLE `master_produk_kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `master_produk_kategori`
--

INSERT INTO `master_produk_kategori` (`id`, `nama`) VALUES
(1, 'Buku'),
(2, 'Dapur'),
(3, 'Elektronik'),
(4, 'Fashion'),
(5, 'Film & Musik'),
(6, 'Gadget'),
(7, 'Perawatan'),
(8, 'Kesehatan'),
(9, 'Logam Mulia'),
(10, 'Mainan & Hobi'),
(11, 'Makanan & Minuman'),
(12, 'Office & Stationery'),
(13, 'Olahraga'),
(14, 'Otomotif'),
(15, 'Properti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_keranjang`
--

CREATE TABLE `trans_keranjang` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_keranjang`
--

INSERT INTO `trans_keranjang` (`id`, `id_produk`, `id_user`, `qty`, `updated_at`) VALUES
(1, 3, 1, 1, '2024-10-23 09:51:17'),
(2, 4, 1, 1, '2024-10-23 09:52:37'),
(3, 5, 1, 1, '2024-10-23 09:53:13'),
(10, 6, 4, 1, '2024-10-26 22:48:38'),
(11, 3, 4, 1, '2024-10-26 22:48:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_pembelian`
--

CREATE TABLE `trans_pembelian` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `dikirim` tinyint(4) DEFAULT NULL,
  `diterima` tinyint(4) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_pembelian`
--

INSERT INTO `trans_pembelian` (`id`, `id_produk`, `id_user`, `qty`, `harga`, `dikirim`, `diterima`, `updated_at`) VALUES
(1, 3, 2, 1, 5, 1, NULL, '2024-10-31 19:53:39'),
(2, 3, 2, 5, 2, 1, NULL, '2024-10-31 19:53:39'),
(3, 3, 2, 1, 5000, 1, NULL, '2024-10-31 19:53:39'),
(4, 2, 2, 1, 120000, 1, NULL, '2024-10-31 19:53:39'),
(5, 6, 2, 1, 50000, 1, NULL, '2024-10-31 19:53:39'),
(6, 5, 2, 1, 150000, 1, NULL, '2024-10-31 19:53:39'),
(7, 3, 2, 1, 5000, 1, NULL, '2024-10-31 19:53:39'),
(8, 3, 2, 1, 5, 1, NULL, '2024-10-31 19:53:39'),
(9, 3, 7, 1, 5, 1, NULL, '2024-10-31 05:48:49'),
(10, 6, 3, 1, 50000, 1, NULL, '2024-10-31 19:53:36'),
(11, 4, 3, 1, 500000, 1, NULL, '2024-10-31 19:53:36'),
(12, 7, 7, 1, 6, 1, NULL, '2024-10-31 05:48:49'),
(13, 3, 3, 1, 5000, 1, NULL, '2024-10-31 19:53:36'),
(14, 5, 3, 1, 150000, 1, NULL, '2024-10-31 19:53:36'),
(15, 3, 3, 1, 5000, 1, NULL, '2024-10-31 19:53:36'),
(16, 4, 3, 1, 500000, 1, NULL, '2024-10-31 19:53:36'),
(17, 3, 2, 1, 5, 1, NULL, '2024-10-31 19:53:39'),
(18, 2, 5, 1, 120000, 1, NULL, '2024-11-02 21:54:57'),
(19, 5, 5, 1, 150000, 1, NULL, '2024-11-02 21:54:57'),
(20, 4, 5, 1, 500000, 1, NULL, '2024-11-02 21:54:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `nama_lengkap`, `foto`, `last_update`, `role_id`) VALUES
(1, 'naruto@gmail.com', '$2a$10$glPN9vu91Gu/tVgiaghP3O9He6N9zppf5yttEGm3Yx2BGs.B45VE.', 'Watanabe Haruto', 'mhardiansyah1334@gmail.com_20241027, 143057_kirito2.jpg', '2024-10-27 14:30:57', 1),
(2, 'mhardiansyah0406@gmail.com', '$2a$10$fMfhytaPFVzDTibRcTbhFOKJLPiBZisoPItbD8hopZr0HrhEqxuTO', 'Kirigaya Kirito', 'mhardiansyah0406@gmail.com_20241027, 220433_kirito1.jpg', '2024-10-27 22:04:33', 2),
(3, 'm.hardiansyah0406@gmail.com', '$2y$10$7reu0PDYmvYAj8Jot0SPyefOpBsNjmCXpmDPiFSCAD8x2YYF4Z.Xu', 'Hikigaya Hachiman', 'm.hardiansyah0406@gmail.com_20241027, 220841_hachiman.png', '2024-10-27 22:08:41', 2),
(4, 'mhardiansyah1306@gmail.com', '$2a$10$3.btyCW6U66yJ2wAu.Esk.6lkygRUWvn0m/eMe5M1H6kVExycW6g.', 'Eren Yeager', 'mhardiansyah1306@gmail.com_20241027, 221016_fotor-ai-20240829121355.jpg', '2024-10-27 22:10:16', 2),
(5, 'mikasa@gmail.com', '$2a$10$lJmpd69ybXiaQLTnofiqYedS3QjpizdCvCQ5LGgxl4pN3rnYEUWtm', 'Mikasa Ackerman', 'mhardiansyah13344@gmail.com_20241027, 221821_mikasa.png', '2024-10-27 22:18:21', 2),
(6, 'asuna@gmail.com', '$2a$10$PwifCMU6aRTjOfLLtQyAs.XAJ3mtB8c3n3DsuLcd.2oWz.wvrP4FS', 'Yuuki Asuna', 'asuna@gmail.com_20241031, 054609_asuna.png', '2024-10-31 05:46:09', 2),
(7, 'naruto@gmail.com', '$2a$10$0L8t.CpAI.ccPfJNLYrXTOl7xsOPnoosivHrzB0v.DQP.xCjG/nga', 'Uzumaki Naruto', 'naruto@gmail.com_20241031, 052141_narutokecil.png', '2024-10-31 05:21:41', 2),
(10, 'Sasuke@gmail.com', '$2a$10$pWC10qptHosh.jj6TJQObesizdOD96zcy1Yu48T1N9PAXclUhY91O', '', NULL, NULL, 2),
(11, 'mikasa@gmail.com', '$2a$10$Y3EIyku4hc0E7e6XYsMVO./JX5l1JDbUTZ1cpresB3ToSyC5lZccC', 'Uchiha Itachi', 'itachi@gmail.com_20241031, 210912_kirito2.jpg', '2024-10-31 21:09:12', 2),
(12, 'mikasa@gmail.com', '$2a$10$hRrKdTVqRe/iMYNW.tC9ueus7EvASm7VQWnPDzD/pmMY7w0ZZVZVG', '', NULL, NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `master_produk_kategori`
--
ALTER TABLE `master_produk_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_keranjang`
--
ALTER TABLE `trans_keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_pembelian`
--
ALTER TABLE `trans_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `agama`
--
ALTER TABLE `agama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `master_produk_kategori`
--
ALTER TABLE `master_produk_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `trans_keranjang`
--
ALTER TABLE `trans_keranjang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `trans_pembelian`
--
ALTER TABLE `trans_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
