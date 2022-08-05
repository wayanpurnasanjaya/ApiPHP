-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Agu 2022 pada 14.24
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_berita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(125) NOT NULL,
  `isi` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `tgl_berita` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `foto`, `tgl_berita`) VALUES
(1, 'Belajar flutter besic', 'Flutter adalah framework untuk pengembangan aplikasi mobile open source yang\r\ndikembangkan oleh Google, versi pertama dari flutter dinamai dengan codename Sky dan\r\nberjalan pada sistem operasi Android, lalu pada Desember 2018 flutter stabil versi 1 dirilis', 'flutter.jpeg', '2022-07-30 16:32:50'),
(2, 'Belajar Laravel', 'Laravel adalah framework atau platform yang berfungsi untuk mengembangkan aplikasi web dengan bahasa pemrograman PHP.\r\n\r\nAplikasi web sendiri merupakan aplikasi yang dapat diakses melalui web browser saat tersambung dengan internet', 'laravel.png', '2022-07-30 16:37:41'),
(3, 'Belajar PHP', 'PHP memang bukan istilah asing bagi orang-orang yang pernah belajar bahasa pemrograman. Namun, bagi Anda yang masih awam atau baru terjun ke dunia pemrograman, Anda pasti bertanya-tanya tentang apa itu PHP.\r\n\r\nNah, dalam artikel ini, kami akan menjelaskan semua yang perlu Anda ketahui tentang bahasa pemrograman ini, termasuk pengertian PHP, fungsi PHP, dan contoh coding PHP', 'php.png', '2022-08-05 12:55:19'),
(4, 'Belajar Javascript', 'JavaScript adalah bahasa pemrograman yang digunakan dalam pengembangan website agar lebih dinamis dan interaktif. Kalau sebelumnya kamu hanya mengenal HTML dan CSS, nah sekarang kamu jadi tahu bahwa JavaScript dapat meningkatkan fungsionalitas pada halaman web. Bahkan dengan JavaScript ini kamu bisa membuat aplikasi, tools, atau bahkan game pada web.\r\n\r\nBicara teknis, JavaScript atau kita singkat menjadi JS merupakan bahasa pemrograman jenis interpreter, sehingga kamu tidak memerlukan compiler untuk menjalankannya. JavaScript memiliki fitur-fitur seperti berorientasi objek, client-side, high-level programming, dan loosely typed.', 'javascript.png', '2022-08-05 13:05:46'),
(5, 'Belajar Python', 'Phyton adalah bahasa pemrograman yang digunakan untuk mengembangkan situs web dan software, otomatisasi tugas, analisis serta visualisasi data.\r\n\r\nHal ini memungkinkan karena Phyton relatif mudah untuk dipelajari, sehingga ia diadopsi oleh banyak non-programmer seperti akuntan dan ilmuwan, untuk berbagai tugas sehari-hari.\r\n\r\nBahkan, seiring berkembangnya teknologi dan zaman, Phyton juga sering digunakan untuk berbagai keperluan lainnya.', 'python.jpeg', '2022-08-05 14:19:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `full_name` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `tgl_daftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `email`, `full_name`, `password`, `tgl_daftar`) VALUES
(1, 'wayanpurna', 'wayanpurnasanjaya@gmail.com', 'I Wayan Purna Sanjaya', '827ccb0eea8a706c4c34a16891f84e7b', '2022-07-30 16:44:13'),
(2, 'admin', 'admin@gmail.com', 'administrator', '827ccb0eea8a706c4c34a16891f84e7b', '2022-08-05 13:08:04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
