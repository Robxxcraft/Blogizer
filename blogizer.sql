-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jan 2025 pada 07.53
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
-- Database: `blogizer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'sehat', 'sehat', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(2, 'makanan', 'makanan', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(3, 'teknologi', 'teknologi', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(4, 'wisata', 'wisata', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(5, 'fashion', 'fashion', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(6, 'lifestyle', 'lifestyle', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(7, 'musik', 'musik', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(8, 'pengetahuan', 'pengetahuan', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(9, 'otomotif', 'otomotif', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(10, 'bisnis', 'bisnis', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(11, 'horor', 'horor', '2024-12-21 01:50:35', '2024-12-21 01:50:35'),
(12, 'olahraga', 'olahraga', '2024-12-21 01:50:35', '2024-12-21 01:50:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `body` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 'keren', '2025-01-12 09:41:26', '2025-01-12 09:41:26'),
(2, 5, 5, 'Nguawor', '2025-01-15 02:34:20', '2025-01-15 02:34:20'),
(3, 5, 5, 'amba=hama', '2025-01-15 05:31:38', '2025-01-15 05:31:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(1, 4, 4),
(2, 5, 5),
(3, 1, 11),
(4, 1, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2021_11_28_010733_create_categories_table', 1),
(5, '2021_11_28_010909_create_posts_table', 1),
(6, '2021_11_28_010919_create_comments_table', 1),
(7, '2021_11_28_010927_create_tags_table', 1),
(8, '2021_11_28_013002_post_tag', 1),
(9, '2021_12_08_025836_create_likes_table', 1),
(10, '2021_12_08_030058_create_settings_table', 1),
(11, '2021_12_17_065113_create_user_details_table', 1),
(12, '2022_01_02_112340_create_roles_table', 1),
(13, '2024_09_15_100432_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'Browser', 'b49449462a8ec3cc9481240af88b775abcfc1a24694a8ab7d6f2e4a49e2900cb', '[\"*\"]', '2024-09-16 07:52:16', NULL, '2024-09-16 07:48:02', '2024-09-16 07:52:16'),
(2, 'App\\Models\\User', 2, 'Browser', 'd029e71b37e336b1d4174b72ce9a3b4f7d113c18f3363a3373910be68fe27451', '[\"*\"]', '2024-12-21 01:26:54', NULL, '2024-11-21 02:02:24', '2024-12-21 01:26:54'),
(7, 'App\\Models\\User', 4, 'Browser', 'abb141ca53f3eb3c6d6dadba47eb802a9eba1a58e13bf65b55d7ffff55d58c05', '[\"*\"]', '2025-01-12 09:43:08', NULL, '2025-01-12 08:24:38', '2025-01-12 09:43:08'),
(16, 'App\\Models\\User', 1, 'Browser', 'c685b44d4a761c1f22bb351e9424f4fa0b638aaf50b2c4cc8774d927db56392d', '[\"*\"]', '2025-01-16 23:49:13', NULL, '2025-01-16 23:49:11', '2025-01-16 23:49:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `photo` text DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `user_id`, `category_id`, `photo`, `content`, `created_at`, `updated_at`) VALUES
(3, '10 Tempat Wisata Terbaik di Indonesia yang Mendunia, Alamnya Indah', '10-tempat-wisata-terbaik-di-indonesia-yang-mendunia-alamnya-indah', 1, 4, 'https://res.cloudinary.com/robxxx/image/upload/v1737093482/blogizer/2024-12-30_3.jpg', '<h3><span style=\"color: rgb(0, 0, 0)\"><strong>10 Tempat Wisata Terbaik di Indonesia</strong></span><br></h3><p>Banyak sekali tempat wisata yang unik dan tidak bisa ditemukan di tempat lainnya yang ada di Indonesia. Bahkan Indonesia memang sudah menjadi tempat favorit untuk liburan para turis mancanegara, beberapa bintang Hollywood pernah menikmati keindahan wisata Indonesia.</p><p></p><p><span style=\"color: rgb(0, 0, 0)\">1. Labuan Bajo</span></p><p></p><img src=\"https://awsimages.detik.net.id/community/media/visual/2024/09/05/biawak-komodo-di-loh-sebita-pulau-komodo-taman-nasional-komodo-kamis-592024-1_169.jpeg?w=620\"><p></p><p><span style=\"color: rgb(0, 0, 0)\">Labuan Bajo yang terletak di Nusa Tenggara Timur (NTT) disebut-sebut sebagai \"surga\" di wilayah timur Indonesia. Tak heran banyak yang memasukkan tempat wisata ini ke dalam wishlist liburan mereka.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Di sana, traveler dapat menemukan gugusan kepulauan eksotis seperti Pulau Komodo, Pulau Manjarite, Pulau Padar, dan Pulau Kelor. Pantai cantik dengan pasir pink dan perbukitan hijau juga bisa dikunjungi. Uniknya, kamu bisa menyaksikan komodo, spesies kadal terbesar yang telah ada sejak zaman pra sejarah.</span><br></p><p><span style=\"color: rgb(0, 0, 0)\">2. Gunung Bromo</span></p><p></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2022/01/04/nikmati-hijaunya-padang-savana-dan-bukit-teletubbies-di-bromo-16_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Bukit Teletubbies di Bromo. Foto: Rachman_punyaFOTO</span><br><span style=\"color: rgb(0, 0, 0)\">Bromo terletak di Taman Nasional Bromo Tengger Semeru (TNBTS). Gunung ini termasuk salah satu gunung berapi aktif di Jawa Timur yang selalu dipadati wisatawan.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Traveler dapat menyaksikan panorama matahari terbit dari berbagai spot yang ada, menunggang kuda dan mobil jip di area Pasir Berbisik, berfoto di padang rumput hijau bernama Bukit Teletubbies, hingga mencapai puncak untuk melihat Kawah Bromo.</span><br><br><span style=\"color: rgb(0, 0, 0)\">3. Raja Ampat</span></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2023/11/04/keindahan-bawah-laut-raja-ampat-1_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Pemandangan bawah laut Raja Ampat akan sangat disayangkan apabila terlewatkan. Tempat ini merupakan rumah bagi lebih dari 530 spesies karang, 700 spesies moluska, dan 1.300 jenis ikan. Sebab itu, perairan Raja Ampat disebut-sebut sebagai \"surga\" bagi para penyelam.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Selain itu, gugusan Pulau Karst, Pantai Pasir Putih, Puncak Pianemo, Telaga Bintang, hingga Pulau Wayag adalah destinasi yang tidak boleh diabaikan jika traveler datang ke sana.</span><br><br><span style=\"color: rgb(0, 0, 0)\">4. Kepulauan Derawan</span><br></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2018/10/21/726f178c-2af6-4fb0-bb0f-954e72519b6c_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Kepulauan di Kalimantan Timur ini terdiri dari beberapa pulau, antara lain Derawan, Maratua, Sangalaki, dan Kakaban. Sejumlah pulau tersebut memiliki pesonanya masing-masing.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Traveler dapat melakukan snorkeling atau diving untuk menikmati panorama bawah lautnya yang dipenuhi karang, ubur-ubur, penyu, hingga ikan pari. Menyaksikan sunset dan sunrise serta melihat fenomena langka yaitu munculnya hiu paus (whale shark).</span><br><br><span style=\"color: rgb(0, 0, 0)\">5. Bali</span></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2022/06/22/pura-ulun-danu-di-tabanan-bali-5.jpeg?w=800\"><p><br><span style=\"color: rgb(0, 0, 0)\">Pura Ulun Danu di Tabanan, Bali. Foto: (Syanti/detikcom)</span><br><span style=\"color: rgb(0, 0, 0)\">Bali sudah tersohor dengan kecantikan alamnya, baik di Indonesia maupun dunia. Bukan hanya pantainya, Pulau Dewata menyimpan hutan rimbun, persawahan hijau, air terjun cantik, sampai kawasan pedesaan dengan arsitektur tradisional yang masih asri.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Kamu bisa mengunjungi Pantai Kuta, Pantai Pandawa, hingga Pantai Melasti kalau ingin bersantai di tepi pantai. Mengunjungi Air Terjun Tibumana dan Sumampan, mandi di Pemandian Tukad Arca, atau mendatangi sejumlah pura yang indah.</span><br><br><span style=\"color: rgb(0, 0, 0)\">6. Candi Borobudur</span></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2022/06/15/candi-borobudur-1_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Candi Borobudur di Jawa Tengah merupakan monumen Buddha terbesar di dunia. Bukan hanya untuk beribadah, tapi kamu dapat mengunjungi candi ini untuk menikmati kemegahan bangunan yang telah ditetapkan sebagai warisan dunia oleh UNESCO tersebut.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Diperkirakan berdiri sejak abad ke-8, Candi Borobudur terkenal dengan pahatan dan relief bersejarah yang terukir di batuan penyusunnya. Setiap reliefnya menggambarkan kisah kehidupan manusia yang bermakna amat dalam.</span><br><br><span style=\"color: rgb(0, 0, 0)\">7. Kepulauan Gili</span><br></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2021/09/14/ilustrasi-pulau-gili-lombok_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Selain NTT, Nusa Tenggara Barat (NTB) mempunyai tempat wisata cantik yang tak kalah yaitu Kepulauan Gili, yang terdiri dari Gili Trawangan, Gili Meno, dan Gili Air. Kepulauan ini terkenal dengan keelokan bawah lautnya untuk melakukan snorkeling dan diving.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Kalau tidak jago berenang, traveler tetap bisa kok menyaksikan panorama perairan Gili dengan mengikuti tur kapal yang dilengkapi kaca transparan di bagian bawahnya. Kamu juga dapat berkeliling pulau, mencicipi kuliner khas, hingga berkuda di pantai Kepulauan Gili.</span><br><br><span style=\"color: rgb(0, 0, 0)\">8. Danau Toba</span></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2023/03/26/explore-kaldera-dan-pulau-samosir-danau-toba-part-2-5_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Toba di Sumatera Utara merupakan danau terbesar di Tanah Air. Mengutip laman Kemenparekraf, danau ini juga tercatat jadi yang terbesar di Asia Tenggara dan di urutan kedua paling besar di dunia.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Kalau ke sana, pastikan traveler mengunjungi Pulau Samosir yang berada di tengah-tengah Danau Toba. Pulau itu menyajikan lanskap alam memukau dan suasana yang sejuk. Uniknya, ditemukan dua danau di pulau tersebut yaitu Sidihoni dan Aek Natonang. Sehingga bisa dibilang terdapat danau di atas danau.</span><br><br><span style=\"color: rgb(0, 0, 0)\">9. Kepulauan Wakatobi</span></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2021/12/04/menyelami-keindahan-bawah-laut-wakatobi_43.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Wakatobi di Sulawesi Tenggara terdiri gugusan empat pulau utama yaitu Wangi-Wangi, Kaledupa, Tomia, dan Binongko serta deretan pulau kecil lain. Nama Wakatobi sendiri merupakan akronim keempat pulau besarnya itu.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Kepulauan ini dikenal sebagai \"surganya\" bawah laut lantaran hampir sekitar 90% jenis karang di dunia terdapat di sana. Wakatobi juga tersohor sebagai salah satu world class diving site. Pada 2012, UNESCO bahkan menetapkan kepulauan tersebut sebagai Cagar Biosfer Bumi ke-8.</span><br><br><span style=\"color: rgb(0, 0, 0)\">10. Tanjung Kelayang</span></p><p></p><img src=\"https://akcdn.detik.net.id/community/media/visual/2018/10/31/76d17552-30da-4317-aa9c-cdaa3165be13_169.jpeg?w=620\"><p><br><span style=\"color: rgb(0, 0, 0)\">Wisata di Pulau Belitung ini menawarkan pantai eksotis dengan pasir putih yang berhias bebatuan granit besar. Kawasan batu granitnya ini menjadi destinasi Geopark Belitong yang ditetapkan UNESCO pada 2021 silam.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Lautnya juga tak indah dengan perairan biru kehijauan yang jernih dan berombak tenang. Traveler dapat bermain air atau berenang di tepian, bermain pasir, maupun menelusuri pantainya.</span><br><br><span style=\"color: rgb(0, 0, 0)\">Nah, itu tadi 10 wisata alam terbaik di Indonesia. Jadi, traveler pernah ke tempat mana saja nih?</span></p>', '2024-12-30 04:35:44', '2025-01-16 22:57:59'),
(4, 'Keren! 10 outfit kasual pria dan wanita terbaru', 'keren-10-outfit-kasual-pria-dan-wanita-terbaru', 4, 5, 'https://res.cloudinary.com/robxxx/image/upload/v1736700075/blogizer/post-2025-01-12_4.jpg', '<p>Tampil keren itu jangan hanya pas ada acara penting. Tapi biasakan memperhatikan penampilan setiap hari agar selalu terlihat menarik, termasuk saat ada di rumah. Makanya, kamu juga perlu <em>update </em>tren <em>fashion </em>kasual terbaru biar bisa semakin percaya diri saat pasang foto OOTD. Apalagi, desain <em>outfit </em>terkini semakin variatif dengan model – model terbaru yang mengagumkan. Mulai dari pilihan kaus, celana, rok, serta berbagai aksesori penunjang lainnya, seperti topi, kacamata, bandana, dan lain lainnya. Lantas, bagaimanakah <em>outfit </em>kasual yang keren untuk pria maupun wanita? Simak rekomendasinya berikut ini.&nbsp;</p><p></p><p><strong>Rekomendasi Oufit Kasual Keren Untuk Pria</strong></p><p>Mencari <em>outfit </em>keren untuk pria terbilang mudah. Karena jumlah <em>item fashion </em>pria lebih sedikit daripada kebutuhan <em>outfit </em>wanita. Kunci tampil keren untuk pria adalah memadupadankan <em>item fashion </em>dengan model dan warna yang tepat. Pastikan juga bahannya berkualitas agar tetap terasa nyaman dipakai sepanjang hari. Berikut <em>outfit </em>kasual keren yang wajib dimiliki pria.</p><p></p><p><strong>1. Jaket Denim + Celana Jeans</strong></p><p>Perpaduan nan klasik ini memang tidak pernah ada matinya, <em>guys! </em>Kamu bisa memakai kaus polos, celana <em>jeans</em>, lalu tambahkan <em>outer </em>berbahan denim. Gunakan jenis sepatu <em>sneaker </em>sebagai alas kaki dan pakai kaca mata untuk menambah gaya.</p><p></p><p><strong>2. Serba Putih</strong></p><p>Ingin tampil kasual namun tetap elegan? Coba gunakan <em>outfit </em>serba putih dari atas hingga bawah. Kamu bisa memakai kaus dan celana polos berwarna putih. Atau gunakan kemeja panjang juga bisa. Tapi jangan lupa biarkan kancing bagian atas terbuka agar tetap terlihat santai.</p><p></p><p><strong>3. All Black</strong></p><p>Jika kamu takut kotor saat berpakaian serba putih, lebih baik gunakan <em>outfit </em>serba hitam dari atas sampai bawah. Penampilan serba hitam ini akan membuatmu terlihat lebih <em>cool </em>dan karismatik. Lalu sebagai pemanisnya, kamu bisa memakai sepatu berwarna lain.</p><p></p><p><strong>4. Oversized Shirt + Sepatu Putih</strong></p><p>Rekomendasi <em>outfit </em>kasual selanjutnya yaitu dengan memadukan celana <em>jeans</em> biru dengan kaus <em>oversized. </em>Sebaiknya pilih kaus polos atau yang tidak terlalu banyak elemen grafis, sehingga terlihat lebih <em>cool.</em></p><p></p><p><strong>5. Kaus Polo + Chino</strong></p><p>Kaus polo juga bisa menjadi <em>outfit </em>kasual andalanmu. Terlihat santai, namun terkesan rapi dan <em>macho</em>. Kamu bisa memadukannya dengan celana <em>chino </em>polos dan sepatu <em>slip on</em> bertali untuk menambah <em>look </em>kasual yang keren.</p><p></p><p><strong>6. Cardigan + Plaid Pants</strong></p><p>Tidak cuma cewek yang bisa bergaya kasual dengan <em>cardigan. </em>Saat ini juga tersedia banyak model <em>cardigan </em>khusus cowok yang bisa kamu pilih. Gabungkan dengan kaus putih dan celana bahan <em>plaids </em>berwarna netral. Kamu pun akan terlihat semakin keren!</p><p></p><p><strong>7. Kaus dan Sepatu Loafers</strong></p><p>Kalau yang ini <em>outfit </em>semi formal yang terlihat santai, namun tetap rapi dan elegan. Gunakan celana <em>jeans</em> dan kaus polos sebagai atasan. Lalu pilih jenis sepatu <em>loafers </em>untuk menampilkan kesan formal.</p><p></p><p><strong>8. Sweater + Jeans</strong></p><p>Selain memadukan kaus polos dan <em>cardigan</em>, kamu juga bisa memakai <em>sweater </em>favorit sebagai <em>outer. </em>Gunakan celana <em>jeans</em> agar terlihat santai dan pilih model sepatu <em>sneaker</em>, seperti Converse, Vans, dan lain lain.</p><p></p><p><strong>9. Long Sleeve</strong></p><p>Baju lengan panjang yang mirip <em>sweater </em>ini juga terlihat keren untuk pakaian kasual pria sehari – hari. Pilih <em>long sleeve </em>berwarna gelap atau netral dan padukan dengan sepatu Vans hitam putih untuk menambah gaya.</p><p></p><p><strong>10. Neon Oversized Shirt</strong></p><p>Selain bermain dengan warna – warna netral seperti hitam dan putih, kamu juga bisa memakai&nbsp; <em>outfit </em>berwarna neon yang terlihat super cerah. Tapi ingat, jika menggunakan atasan berwarna neon, pakai celana berwarna gelap agar tetap terlihat <em>cool.</em></p><p></p><p><strong>Rekomendasi Oufit Kasual Keren Untuk Wanita</strong></p><p>Saat ini gaya berpakaian ala Korea tengah menjadi tren, terutama bagi kaum hawa. Salah satu ciri khasnya yaitu menggunakan desain <em>outfit </em>simpel dengan warna – warna <em>soft </em>dan cenderung feminin. Berikut beberapa rekomendasi <em>outfit </em>kasual untuk wanita yang bisa kamu tiru.</p><p></p><p><strong>1. Kaus Putih Dan Flower A-Line Skirt</strong></p><p>Tampil feminin itutidakharus ribet kok. Kamu bisa memakai kaus putih polos dengan rok A-Line motif bunga – bunga yang cantik. Pilih warna rok yang cerah agar kamu terlihat semakin <em>stunning!</em></p><p></p><p><strong>2. V-Neck Blouse Dan Straight Pants</strong></p><p>Masih dengan rekomendasi <em>outfit </em>yang <em>effortlessly stunning, </em>kamu bisa memadukan <em>v-neck blouse </em>putih dengan <em>straight pants </em>berwarna cerah. Lalu gunakan sepatu model <em>slipper </em>untuk menambah kesan feminin.</p><p></p><p><strong>3. Kaus + Cardigan Dan Check Skirt</strong></p><p><em>Outfit </em>ala Korea ini juga bisa kamu tiru dengan mudah. Cukup gunakan kaus putih sebagai pakaian <em>basic, </em>lalu tambahkan <em>outer </em>berupa <em>cardigan </em>atau <em>sweater </em>berwarna <em>soft. </em>Kemudian, pakai <em>check skirt </em>berwarna senada dengan <em>outer.</em></p><p></p><p><strong>4. Shirt Dress Dan Neck Scarf</strong></p><p>Salah satu <em>outfit </em>kasual andalan wanita adalah <em>shirt dress </em>atau kemeja <em>dress </em>berwarna polos. Lalu, gunakan hiasan leher berupa <em>scarf </em>berwarna kontras. Gunakan model sepatu <em>sneaker </em>untuk menambah <em>look </em>kasual yang modis.</p><p></p><p><strong>5. Mini Dress Dan Denim</strong></p><p><em>Outer </em>denim juga tidak hanya cocok untuk pria. Buat kamu yang ingin tampil feminin dengan <em>outer </em>berbahan denim, coba gunakan mini <em>dress </em>sebagai pakaian <em>basic. </em>Lalu pakai <em>flat shoes </em>berwarna senada dengan <em>dress </em>untuk mempercantik penampilanmu.</p><p></p><p><strong>6. Sleeveless Top Dan Striped Pants</strong></p><p><em>Striped pants </em>adalah pilihan tepat agar kamu terlihat lebih jenjang. Kamu bisa memadukannya dengan <em>sleeveless top </em>berwarna putih atau krem untuk menghasilkan tampilan <em>stylish </em>dan minimalis.</p><p></p><p><strong>7. Celana Jeans Dan Tie Front Shirt</strong></p><p>Perpaduan <em>outfit </em>yang satu ini terlihat lebih <em>fresh </em>dan <em>timeless. </em>Celana <em>jeans</em> yang terlihat kasual akan <em>match </em>dengan <em>tie front shirt </em>alias kemeja model ikat yang cantik. Kamu pun bisa menggunakannya untuk <em>hangout </em>bersama teman – teman.</p><p></p><p><strong>9. Pinafore Dress</strong></p><p>Satu lagi <em>outfit </em>kasual ala Korea yang sangat simpel, namun terlihat super keren. Coba padukan <em>pinafore dress </em>dengan <em>long sleeve t-shirt </em>berwarna netral. Lalu gunakan <em>sneaker </em>sebagai alas kakinya.</p><p></p><p><strong>10. Celana Kulot Dan Kemeja</strong></p><p>Buat kamu yang ingin tampil kasual dengan lengan panjang, kemeja juga bisa menjadi <em>outfit </em>tepat yang dipadukan dengan celana kulot <em>jeans</em>. Pilih kemeja bermotif cerah dan sepatu <em>sneaker </em>putih agar terlihat kasual dan <em>stylish.</em></p>', '2025-01-12 09:41:00', '2025-01-12 09:41:10'),
(5, '10 Festival Musik Terbesar di Dunia', '10-festival-musik-terbesar-di-dunia', 5, 7, 'https://res.cloudinary.com/robxxx/image/upload/v1736933372/blogizer/post-2025-01-15_5.jpg', '<h2><strong>Deretan Festival Musik Terbesar di Dunia</strong></h2><p>Jika Anda sangat mencintai musik sekaligus ambience-nya saat berada di festival, maka acara-acara di bawah ini perlu Anda sambangi setidaknya sekali dalam hidup:</p><p></p><h3>1. Donauinselfest</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_Donauinselfest_jambase_6682f23abb.jpg\" alt=\"Donauinselfest\"><p></p><p>Donauinselfest memiliki rata-rata 2 juta pengunjung setiap tahunnya, dan 3,1 juta pengunjung pada tahun 2016.</p><p>Diselenggarakan di sebuah pulau di tengah-tengah sungai Danube, Wina, festival musik ini merupakan surga bagi para pencinta musik karena digelar secara terbuka dan gratis selama tiga hari di setiap bulan Juni.</p><p>Donauinselfest juga adalah rumah bagi para seniman lokal dan internasional di seluruh Eropa karena menyajikan berbagai pertunjukan dari semua genre musik, mulai dari pop, rock, hip-hop, folk, metal, blues, EDM, hingga reggae.</p><p>Pada tahun 2019, Donauinselfest sukses menghadirkan 13 panggung dengan 600 jam musik dan 17 tema yang berbeda.&nbsp;</p><p>Kabarnya, meski diselenggarakan secara cuma-cuma, Donauinselfest selalu memperoleh keuntungan fantastis yang tidak terduga setiap tahunnya.</p><p></p><h3>2. Mawazine</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_mawazine_festival_ec41513de1.jpg\" alt=\"Mawazine fest\"><p></p><p>Mawazine adalah festival musik tahunan asal Maroko yang berhasil menghadirkan 2,65 juta penonton pada tahun 2015.</p><p>Digelar setiap bulan Juni, Mawazine awalnya dicetuskan oleh sekretaris pribadi Raja Mohammad IV sebagai penghormatan kepada musik Afrika. Kata Mawazine sendiri berasal dari bahasa Maroko yang memiliki arti ‘Ritme Dunia’.</p><p>Pada tahun 2013, festival musik ini pernah dicatat sebagai festival paling menghebohkan dengan 90 pertunjukan yang tampil di tujuh panggung dan total pengunjung hingga 2,5 juta orang.</p><p>Adapun artis-artis dunia kelas A yang pernah tampil di panggung Mawazine di antaranya adalah Justin Timberlake, Christina Aguilera, Whitney Houston, Iggy Azalea, David Guetta, dan masih banyak lagi.</p><p>Selain pertunjukan musik, Mawazine juga menampilkan berbagai promosi budaya Maroko kepada para pengunjungnya.</p><p></p><h3>3. The Festival International de Jazz de Montreal</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_The_Festival_International_de_Jazz_de_Montreal_jazz_festival_canada_e61c9e12a9.jpg\" alt=\"The Festival International de Jazz de Montreal.\"><p></p><p>Jika Anda pencinta musik dengan aliran jazz, maka The Festival International de Jazz de Montreal adalah festival musik yang tidak boleh Anda lewatkan.</p><p>Festival musik yang diselenggarakan setiap tahun di Quebec, Kanada ini dicetuskan pertama kali pada tahun 1980-an dan selalu sukses menarik setidaknya 2 juta pengunjung di setiap tahunnya.</p><p>Pada 2004, The Festival International de Jazz de Montreal bahkan dinobatkan sebagai festival musik jazz terbesar oleh <em>Guinness World Record.</em></p><p>Diselenggarakan di jantung kota Montreal, festival ini biasanya berlangsung selama 10 hari dengan panggung indoor dan outdoor yang menampilkan ratusan musisi jazz ternama dari berbagai penjuru dunia.</p><p></p><h3>4. Summerfest</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_summerfest_milwaukee_magazine_c9c4557c7d.jpg\" alt=\"Summerfest\"><p></p><p>Summerfest adalah festival musik yang sudah berlangsung sejak tahun 1968 di Milwaukee, Wincounsin, Amerika.</p><p>Selain pertunjukan musik, festival ini juga menyajikan pertunjukan komedi, bazaar, kembang api, pesta kuliner, hingga berbagai permainan luar ruangan hanya dengan tarif masuk sebesar 20 dolar atau setara dengan 323.240 rupiah saja.</p><p>Setiap tahunnya, festival musik yang diadakan selama 11 hari, mulai dari akhir Juni hingga awal Juli ini selalu berhasil menarik lebih dari 850.000 penonton dari seluruh penjuru dunia.</p><p>Musisi-musisi yang pernah tampil di Summerfest di antaranya adalah Red Hot Chili Peppers, Bob Dylan, Pink, dan Paul McCartney</p><p></p><h3>5. Woodstock</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_woodstock_2f25364e00.jpg\" alt=\"Woodstock\"><p></p><p>Woodstock biasa dikenal sebagai Festival Rock Bethel karena digelar di Bethel, New York.</p><p>Berlangsung setiap bulan Agustus, festival musik ini berhasil menorehkan sejarah dalam pertunjukan musik <em>rock n roll </em>dunia karena berhasil mengumpulkan hingga 750.000 penonton pada 2014.</p><p>Di luar musik rock, festival musik ini juga menghadirkan berbagai jenis penampilan musik lainnya seperti metal, pop, hingga musik rakyat atau folk.&nbsp;</p><p>Menariknya, meskipun termasuk sebagai salah satu acara dengan tingkat partisipasi yang tinggi di New York, festival ini tidak memungut biaya bagi para pengunjungnya, alias dapat dihadiri secara gratis.</p><p></p><h3>6. Rock in Rio</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_rock_in_rio_rock_rage_radio_c8b51307a5.jpg\" alt=\"Rock in Rio\"><p></p><p>Rock in Rio adalah festival musik dua tahun sekali di Rio de Janeiro, Brazil yang selalu berhasil menarik lebih dari 700 ribu penonton di tiap <em>event</em>-nya.</p><p>Meskipun memiliki nama Rock in Rio, nyatanya festival musik ini menampilkan berbagai genre musik lain selain musik rock dalam pertunjukannya, seperti pop, funk, EDM, dan lain sebagainya.</p><p>Dalam festival ini juga terdapat pesta kembang api dan pertunjukan-pertunjukan lain yang dapat mengguncang kota.</p><p>Red Hot Chili Peppers, Jessie J, Charlie Puth, hingga Drake adalah sederet musisi besar yang pernah tampil di Rock in Rio.</p><p></p><h3>7. Sziget</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_sziget_daily_news_hungary_98d637a094.jpg\" alt=\"sziget fest\"><p></p><p>Sziget adalah festival seni paling terkenal di Eropa yang diselenggarakan setiap bulan Agustus di Budapest, Hongaria.</p><p>Dibuka pertama kali pada tahun 1993, hingga kini Sziget selalu berhasil menarik lebih dari 550 ribu orang setiap tahunnya.</p><p>Festival ini biasanya berlangsung selama tujuh hari dan menampilkan bukan hanya pertunjukan musik, tetapi juga sirkus, film, dan olahraga sekaligus.</p><p>Genre musik yang dimainkan di festival ini pun beragam, mulai dari jazz, rock, blues, dan lain sebagainya.</p><p>Artis-artis yang ditampilkan pun tak main-main. Sejumlah musisi besar seperti Rihanna, Muse, Sia, hingga Kendrick Lamar pernah tampil di panggung Sziget.</p><p></p><h3>8. Coachella</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_coachella_b5a028e5ae.jpg\" alt=\"coachella\"><p></p><p>Bukan hanya terdaftar sebagai salah satu festival musik terbesar di dunia, Coachella juga merupakan festival musik paling terkenal dan paling menguntungkan di Amerika Serikat.</p><p>Selain menampilkan pertunjukan musik dengan berbagai macam genre, festival ini juga menampilkan pagelaran seni patung di dalamnya.</p><p>Coachella merupakan salah satu festival musik yang berlangsung cukup lama, yakni sekitar dua hingga tiga minggu.</p><p>Sederet artis besar dunia, mulai dari musisi Hollywood, K-Pop, hingga J-Pop pun dihadirkan untuk memeriahkan festival musik ini.</p><p>Festival yang digelar setiap bulan Juli di Indio, California ini, selalu berhasil mengumpulkan setidaknya 500 ribu penonton setiap tahunnya.</p><p></p><h3>9. Essence</h3><p></p><img src=\"https://c.inilah.com/reborn/2024/04/festival_musik_terbesar_di_dunia_Essence_NOLA_Concert_2b531f22ee.jpg\" alt=\"Essence\"><p></p><p>Essence adalah festival musik yang awalnya dibentuk pada tahun 1994 untuk merayakan ulang tahun ke-25 Majalah Essence yang merupakan majalah <em>fashion</em> wanita Afrika-Amerika.</p><p>Festival ini kemudian memiliki dampak yang cukup signifikan terhadap industri <em>fashion</em> dan sejarah mode seiring perkembangannya sebagai festival musik budaya Afrika-Amerika di Amerika Serikat.</p><p>Tidak seperti festival sebelumnya yang menampilkan berbagai genre musik secara luas, Essence hanya menampilkan musik bergenre soul, gospel, blues, jazz, hip-hop, dan R&amp;B.</p><p>Berlangsung setiap bulan Juli di New Orleans, Louisiana, Amerika Serikat, festival musik ini memiliki kehadiran rata-rata hingga 500.000 orang setiap tahunnya.</p><p></p><ol start=\"10\"><li><p>Ngawi Festival Musik</p><p></p></li></ol><img src=\"https://hiphopcorner.fr/wp-content/uploads/2019/05/image-dosseh-colors-vrai-1024x887.png\"><p></p><p>Siapa sih yang gakenal dengan Ngawi Musical? yap, adalah konser besar yang berlokasi di Kabupaten Ngawi, Jawa Timur. Konser Ngawi Musical telah ditonton jutaan warga Ngawi. Mas Rusdi dan Mas Amba selaku musisi Ngawi Musical juga ikut meramaikan festival musik Ngawi. dan tidak lupa Penyanyi utama Ngawi Musical yaitu Mas Hardin.</p>', '2025-01-15 02:29:22', '2025-01-15 05:30:33'),
(6, 'Mengenal Tren Gaya Hidup \"Slow Living\" yang Banyak Digandrungi Anak Muda Masa Kini', 'mengenal-tren-gaya-hidup-slow-living-yang-banyak-digandrungi-anak-muda-masa-kini', 5, 6, 'https://res.cloudinary.com/robxxx/image/upload/v1736944093/blogizer/post-2025-01-15_6.jpg', '<p><span style=\"color: #000000\">Generasi muda tidak pernah bosan melahirkan pola pemikiran dan trend baru dalam lingkungan masyarakat. Selain karena zaman yang terus maju, informasi yang saat ini dengan mudah untuk diakses oleh masyarakat membuat tatanan sosial di kalangan anak muda pun terus mengalami perubahan secara dinamis.</span></p><p></p><p><span style=\"color: #000000\">Apalagi saat ini setiap anak muda pasti hampir semuanya memiliki social media. Di mana social media saat ini seolah menjadi tempat mereka untuk ajang unjuk diri. Sebenarnya ini bisa dimaknai dengan dua sisi yaitu sisi positif dan sisi negatif.</span></p><p></p><p><span style=\"color: #000000\">Mereka yang bisa memanfaatkan social media dengan baik, maka ajang ujuk diri ini dapat dijadikan sebagai sebuah media kreatif sehingga bisa menghasilkan konten yang menarik dan mampu menghasilkan uang yang bisa menjadi pendapatan pribadi.</span></p><p></p><p>Tetapi jika mereka tidak menggunakannya dengan baik, maka ajang ujuk diri hanyalah sebagai bentuk dari kegiatan yang tidak berfaedah dan biasanya akan menjerus ke arah flexing.&nbsp;</p><p>Di mana orang-orang akan berlomba untuk memerkan barang-barang atau kegiatan mahalnya yang kemudian akan menimbulkan berbagai permasalahan lain dalam kehidupan sosial masyarakat.</p><p></p><p>Saat ini yang sedang hits dilakukan oleh banyak muda di social media adalah berlomba-lomba mengikuti tren terkini. Dalam hal ini biasanya terdapat sebuah tren yang digagas oleh seorang atau sekelompok orang yang kemudian akhirnya diikuti oleh orang-orang yang berada di sosial media.</p><p></p><p>Misalnya, tren menari dengan lagu terbaru yang ada di social media TikTok, mencoba mendatangi tempat-tempat hits yang masih belum banyak orang datangi, hingga kebiasaan atau aktivitas menarik yang membuat banyak orang ingin mencobanya sebagai sebuah pengalaman baru yang bisa menarik perhatian pengguna sosial media lainnya.</p><p></p><p>Beberapa waktu ini banyak anak muda yang sedang mengikutin tren life style \"slow living\" dengan pergi dan menetap ke daerah lain baik di dalam maupun luar negeri.&nbsp;</p><p></p><p>Tren ini muncul sebagai bentuk perhatian anak muda terhadap isu kesehatan mental dengan cara hidup menyepi di tempat yang jauh dari rumah dan mencoba memperbaiki diri.</p><p></p><p>Meskipun sarat akan makna, namun banyak juga yang akhirnya melakukan tren ini sebagai kegiatan traveling \'hemat biaya\' sehingga mereka bisa memanfaatkan masa mudanya dengan pergi ke berbagai tempat, yang kemudian bisa mereka abadikan melalui konten video yang dibagikan di platform social media seperti Youtube dan bisa mendapatkan pundi-pundi uang dari kegiatan tersebut.</p><p></p><img src=\"https://assets.kompasiana.com/items/album/2024/05/10/slow-663d82ca1470930dd235f4e2.jpg?t=o&amp;v=555\"><p></p><p>Jadi, apa sebenernya itu konsep hidup \"slow living\"</p><p>Konsep hidup slow living merupakan bagian dari gerakan \"slow movement\" yang menyoroti isu masuknya restoran cepat saji di jantung kota Roma, Italia pada tahun 1980-an. Carlo Petrini dan sekelompok aktivis membentuk gerakan \"slow food\" yang digaungkan untuk memperjuangkan tradisi makanan daerah.</p><p></p><p>Gerakan slow food ini kemudian memiliki pendukung di lebih dari 150 negara dan untuk terus melindungi hidangan tradisional, mempromosikan upah yang adil bagi para pekerja, mendorong makanan dengan kualitas yang baik, dan melakukan kegiatan-kegiatan yang berakitan dengan keberlanjutan lingkunan.</p><p></p><img src=\"https://assets.kompasiana.com/items/album/2024/05/10/slow-living-2-663d86afde948f67b42fbc72.jpeg?t=o&amp;v=555\"><p></p><p>Slow living bisa menjadi solusi atau sebatas tren belaka?</p><p>Terdapat beberapa penelitian yang menunjukkan bahwa slow living ini memiliki dampak yang besar terhadap kehidupan manusia. Misalnya&nbsp;Diana dan Eva&nbsp;yang melihat konsep hidup slow living memiliki kaitannya dengan green economy.</p><p></p><p>Di mana konsep hidup dari slow living yang memperhatikan keseimbangan dan kualitas hidup, dianggap sebagai sebuah hal yang berlawanan dengan pandangan konsumeris pada ilmu ekonomi tradisional. Sehingga slow living dianggap sebagai sebuah gaya hidup yang sustainable dan bisa menjadi solusi dalam krisis ekonomi.</p><p></p><p>Lebih lanjut lagi Adrian dkk dalam tulisannya yang berjudul&nbsp;\"Responsible consumer and lifestyle: Sustainability insights\", melihat konsep hidup slow living ini sebagai gaya hidup seorang konsumen yang bertanggung jawab.</p><p></p><p>Konsep slow living identik dengan konsumsi barang dan jasa yang rasional. Di mana mereka yang menerapkan konsep hidup ini akan lebih bijak dalam menggunakan sumber daya yang ada, lebih sedikit melakukan aktivitas yang dapat merusak lingkungan, dan yang paling penting adalah membangun hubungan interpersonal yang positif antar sesama manusia dan lingkungan.</p><p>Oleh karena, dengan mengusung konsep gaya hidup berkelanjutan pada slow living dapat memungkinkan menjadi sebuah inisiasi baru dalam masyarakat untuk menghadapi konsep pembangunan berkelanjutan.&nbsp;</p><p></p><p>Dalam hal ini dengan menciptakan masyarakat yang bertanggung jawab, maka pembangunan berkelanjutan tidak hanya bisa berhasil tetapi dapat menghasilkan dampak jangka panjang yang menjanjikan bagi kehidupan manusia kedepannya.</p><p> </p><p>Namun yang terjadi saat ini, generasi muda melihat konsep hidup slow living sebagai sebuah tren sekaligus \"konten\" menjanjikan yang bisa dibagikan melalui sosial media. Meskipun masih banyak juga dari mereka yang menerapkan konsep hidup ini untuk bisa \"healing\" dari hiruk pikuk percepatan dunia.</p><p></p><p>Allison Grundy dalam tulisannya yang berjudul&nbsp;\"slow living: is it a trend or a revolution?\"&nbsp;menyoriti dua sisi dari konsep hidup slow living tersebut yaitu dari sisi positif dan sisi negatif. Sisi positif dari gerakan ini adalah banyak orang yang akhirnya sadar akan&nbsp; pentingnya keseimbangan dalam hidup antara pekerjaan dan kehidupan pribadi agar menjaganya terus berkualitas.</p><p></p><p>Namun dari sisi negatifnya, saat ini banyak orang yang melakukan tren slow living untuk sebuah \"konten\" semata yang dibagikan di sosial media. Yang mana seharusnya konsep hidup ini menjauhkan diri dari internet untuk bisa menata hidup yang berkualitas tetapi justru sebaliknya.</p><p></p><p>Selain itu yang seharusnya dalam fase slow living ini seseorang bisa memperbaiki dan menikmati hidupnya dengan kegiatan-kegiatan positif, tetapi itu semua berubah ketika banyak orang yang pada akhirnya menjadikan kegiatan slow livingnya sebagai konten dan pada akhirnya berakhir sebagai perlombaan ajang unjuk diri di sosial media.</p><p></p><p>Semua akan kembali lagi kepada perspektif. Di mana kita bisa memilih untuk melakukan kegiatan yang dapat berdampak pada diri pribadi atau hanya untuk sekedar memenuhi hasrat tren yang ada di lingkungan masyarakat.&nbsp;</p><p></p><p>Namun yang terpenting adalah konsep hidup slow living ternyata layak untuk dicoba dan bisa menjadi solusi terbaik untuk mengatasi permasalahan sosio-ekonomi yang ada di dalam masyarakat saat ini.</p>', '2025-01-15 05:28:06', '2025-01-15 05:28:12'),
(7, 'Mengadopsi Teknologi Kecerdasan Buatan Kunci Bisa Maju di masa depan', 'mengadopsi-teknologi-kecerdasan-buatan-kunci-bisa-maju-di-masa-depan', 17, 8, 'https://res.cloudinary.com/robxxx/image/upload/v1737008405/blogizer/post-2025-01-16_7.jpg', '<p><span style=\"color: #000000\">Mengalir deras arus <em>artificial intelligence</em> (AI) membawa masa depan APAC, dimana pemerintah dan dunia usaha sama-sama memanfaatkan teknologi mutakhir untuk memecahkan tantangan-tantangan penting. Urbanisasi yang pesat dan pertumbuhan ekonomi digital di kawasan ini menjadikannya lingkungan yang ideal untuk menerapkan solusi AI yang inovatif, terutama di bidang-bidang seperti efisiensi energi, manajemen <em>cloud hybrid</em>, dan otomatisasi cerdas.</span></p><p></p><p><span style=\"color: #000000\">Negara-negara tersebut berada di jantung transformasi digital, namun kebutuhan energi mereka meroket. Untuk mengatasi hal ini, perusahaan beralih ke digital twin yang didukung AI model infrastruktur fisik virtual untuk mengoptimalkan penggunaan energi dan mensimulasikan peningkatan efisiensi sebelum penerapan.</span></p><p></p><p><span style=\"color: #000000\">Pendekatan ini tidak hanya bersifat teoretis; melengkapi pusat data yang ada dengan teknologi ini telah mengurangi konsumsi daya menjadi lebih hemat energi. Di Asia Tenggara saja, pasar pusat data diproyeksikan tumbuh lebih dari 5% per tahun hingga tahun 2029, mencapai US$14,41 miliar perubahan ini akan berdampak besar pada keberlanjutan dan penghematan biaya.</span></p><p></p><p><span style=\"color: #000000\">Matthew Hardman, <em>Chief Technology Officer</em>, APAC, Hitachi Vantara menjelaskan dalam manajemen energi, AI merevolusi teknologi jaringan pintar di seluruh wilayah. “Kunci dalam mengintegrasikan model pembelajaran mesin ke dalam operasi jaringan listrik, pemerintah dan penyedia layanan utilitas dapat mengoptimalkan distribusi energi, memprediksi fluktuasi permintaan, dan menggabungkan sumber terbarukan seperti tenaga surya dan angin dengan lancar,” ujar Matthew dikutip dalam keterangan tertulis, Rabu (15/1/2025)</span></p><p></p><p><span style=\"color: #000000\">Di samping itu, arsitektur <em>hybrid cloud </em>mengalami adopsi yang cepat seiring dengan upaya perusahaan untuk menyeimbangkan fleksibilitas cloud publik dengan keamanan infrastruktur lokal. Menggabungkan alat manajemen berbasis AI dengan Kubernetes untuk orkestrasi container, perusahaan-perusahaan di kawasan ini dapat menerapkan aplikasi secara dinamis sambil menjaga kedaulatan data sebuah kebutuhan penting mengingat lanskap kepatuhan yang terus berkembang di negara-negara di APAC.</span></p><p></p><p><span style=\"color: #000000\">Solusi penyimpanan objek yang dapat diakses melalui protokol standar industri menyediakan platform yang terukur dan hemat biaya untuk mengelola data berskala besar dibandingkan dengan sistem penyimpanan blok tradisional. Terkait keamanan siber, AI memainkan peran penting dalam memerangi ancaman yang meningkat.</span></p><p></p><p><span style=\"color: #000000\">Sistem deteksi ancaman tingkat lanjut yang menggunakan model deteksi anomali memungkinkan respons real-time terhadap serangan siber, sementara AI generatif membantu bisnis menyimulasikan skenario ancaman untuk memperkuat pertahanan mereka. Seiring dengan berlakunya peraturan seperti Model AI Governance Framework di Singapura dan undang-undang kedaulatan data di Indonesia, alat kepatuhan yang didukung AI membantu organisasi mengatasi kompleksitas ini sekaligus menjaga operasi mereka.</span></p><p></p><p><span style=\"color: #000000\">Usaha kecil dan menengah (UKM) menjadi tulang punggung perekonomian di kawasan ini, juga memperoleh manfaat dari solusi AI yang terukur. Mulai dari mengotomatiskan layanan pelanggan dengan model bahasa kecil (SLM) multibahasa hingga mengoptimalkan manajemen inventaris dengan analisis prediktif, UKM memanfaatkan AI untuk bersaing dalam skala besar.</span></p><p></p><p><span style=\"color: #000000\">Saat kita melihat ke depan, teknologi-teknologi baru semakin meningkatkan kemampuan AI di APAC, sehingga memungkinkan dunia usaha untuk mengatasi tantangan-tantangan lokal dengan ketepatan yang belum pernah terjadi sebelumnya. “AI bukan lagi sekedar kata kunci—AI merupakan pendorong penting keberlanjutan, keamanan, dan ketahanan, membantu kawasan ini membangun perekonomian yang siap menghadapi masa depan,” ujar Matthew. (*)</span></p>', '2025-01-15 23:19:58', '2025-01-15 23:20:04'),
(8, 'Pengetahuan Konseptual: Pengertian dan Fungsi Pentingnya', 'pengetahuan-konseptual-pengertian-dan-fungsi-pentingnya', 17, 8, 'https://res.cloudinary.com/robxxx/image/upload/v1737008947/blogizer/post-2025-01-16_8.jpg', '<p><span style=\"color: #000000\">Pengetahuan konseptual adalah jenis ilmu pengetahuan yang memiliki fungsi penting untuk diterapkan. Pengetahuan ini membantu orang-orang untuk memahami mengapa dan bagaimana sesuatu bekerja, sehingga mereka mampu menerapkannya dalam berbagai situasi</span></p><p></p><p><span style=\"color: #000000\">Dengan memahami konsep lebih mendalam, semua orang bisa menerapkan pengetahuan tersebut untuk menemukan solusi terbaik. Bahkan jika berada dalam situasi yang berbeda dari pengalaman sebelumnya.</span></p><p></p><h2><span style=\"color: #000000\"><strong>Pengetahuan Konseptual adalah Jenis Pengetahuan yang Berfokus pada Pemahaman tentang Konsep, Prinsip, dan Hubungan antara Ide-Ide</strong></span></h2><p></p><img src=\"https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1634025439/01jfnvqd4vp03mevk2wfn10h5z.jpg\" alt=\"Ilustrasi pengetahuan konseptual adalah - Sumber: pixabay.com/wal_172619\"><img src=\"https://blue.kumparan.com/uikit-assets/assets/icons/zoom-in-white-86764a09a22e8c325202d741307c1377.svg\" alt=\"zoom-in-white\"><p><span style=\"color: #000000\">Pengertian pengetahuan konseptual adalah jenis pengetahuan yang berkaitan dengan pemahaman tentang konsep, prinsip, dan hubungan antara ide-ide atau fenomena yang berbeda. Pengetahuan ini memotivasi individu untuk mempertanyakan, menganalisis, dan mengevaluasi informasi.</span></p><p><span style=\"color: #000000\">Selain itu, pengetahuan ini juga melibatkan penguasaan kerangka kerja yang lebih abstrak, yang memudahkan seseorang memahami, menganalisis, dan mengintegrasikan informasi. Sehingga mereka dapat memecahkan masalah atau membuat keputusan yang kompleks.</span></p><p><span style=\"color: #000000\">Ciri-ciri khusus dari ilmu pengetahuan konseptual antara lain:</span></p><p></p><ol><li><p><span style=\"color: #000000\">Berfokus pada ide-ide abstrak yang dapat diterapkan dalam berbagai situasi, bukan hanya fakta atau prosedur tertentu.</span></p></li><li><p><span style=\"color: #000000\">Membantu menghubungkan fakta-fakta terpisah menjadi gambaran yang lebih besar.</span></p></li><li><p><span style=\"color: #000000\">Berhubungan dengan prinsip, hukum, atau teori yang menjadi dasar untuk memahami fenomena.</span></p></li><li><p><span style=\"color: #000000\">Membantu seseorang untuk menerapkan pemahaman mereka dalam situasi baru atau untuk memecahkan masalah yang kompleks.</span></p><p></p></li></ol><h2><span style=\"color: #000000\"><strong>Pentingnya Pengetahuan Konseptual</strong></span></h2><p></p><img src=\"https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1634025439/01jfnvvxh7xqe0rx4x8wvs55hv.jpg\" alt=\"Ilustrasi pengetahuan konseptual adalah - Sumber: pixabay.com\"><img src=\"https://blue.kumparan.com/uikit-assets/assets/icons/zoom-in-white-86764a09a22e8c325202d741307c1377.svg\" alt=\"zoom-in-white\"><p><span style=\"color: #000000\">Beberapa fungsi penting dari pengetahuan konseptual yang menjadikannya perlu diterapkan adalah sebagai berikut :</span></p><p></p><h3><span style=\"color: #000000\"><strong>1. Meningkatkan Pemahaman Mendalam</strong></span></h3><p><span style=\"color: #000000\">Pengetahuan konseptual membantu siswa atau individu memahami mengapa sesuatu terjadi, bukan hanya bagaimana.</span></p><p></p><h3><span style=\"color: #000000\"><strong>2. Mengembangkan Kemampuan Berpikir Kritis</strong></span></h3><p><span style=\"color: #000000\">Dengan memahami prinsip dan konsep, seseorang dapat menganalisis masalah secara kritis dan mencari solusi yang logis.</span></p><p></p><h3><span style=\"color: #000000\"><strong>3. Mendorong Transfer Pengetahuan</strong></span></h3><p><span style=\"color: #000000\">Pengetahuan konseptual memberikan kesempatan bagi individu untuk menerapkan berbagai ide yang sudah dipelajari dalam situasi baru.</span></p><p><span style=\"color: #000000\">ADVERTISEMENT</span></p><p></p><h3><span style=\"color: #000000\"><strong>4. Mendukung Pembelajaran Berkelanjutan</strong></span></h3><p><span style=\"color: #000000\">Berdasarkan buku <em>Inovasi Pembelajaran</em>, Ridwan Abdullah, Ridwan Abdullah Sani, (2013), disebutkan bahwa pengetahuan ini menjadi dasar untuk mempelajari hal-hal baru dan memperluas pemahaman di bidang tertentu.</span></p><p><span style=\"color: #000000\">Pengetahuan konseptual adalah prinsip yang membantu seseorang menghubungkan pembelajaran dari satu bidang ke bidang lain. Dengan pemahaman yang kuat, mereka dapat memahami dunia secara lebih mendalam, berpikir kritis, dan menghadapi tantangan dengan solusi yang lebih inovatif. (DNR)</span></p>', '2025-01-15 23:29:02', '2025-01-15 23:29:05'),
(9, 'Apa itu Cryptocurrency ?', 'apa-itu-cryptocurrency', 17, 10, 'https://res.cloudinary.com/robxxx/image/upload/v1737009153/blogizer/post-2025-01-16_9.jpg', '<p>Cryptocurrency merupakan sebuah mata uang digital atau virtual yang dirancang untuk bekerja sebagai media pertukaran yang menggunakan kriptografi yang kuat untuk mengamankan transaksi keuangan, mengontrol proses pembuatan unit tambahan, dan memverifikasi transfer aset.</p><p></p><p>Mata uang digital ini secara resmi dizinkan oleh Republik indonesia, pengakuan ini dituangkan dalam Peraturan Badan pengawas Perdagangan Berjangka Komoditi no 7 tentang penetapan daftar aset kripto yang dapat diperdagangkan di pasar fisik Aset Kripto, peraturan tersebut mulai berlaku pada 17 Desember 2020.</p><p></p><p><strong>Fungsi Cryptocurrency</strong></p><p></p><ol><li><p>Membeli Barang atau Jasa</p></li></ol><p>Jika sebelumnya kamu sudah akrab dengan mata uang digital ini pasti tidak asing dengan transaksi jual beli bara atau jasa, banyak toko yang menerima pembayaran penggunakan uang kripto, di Indonesia sendiri sudah cukup banyak toko yang menerima pembayaran uang kripto terlebih setelah pengakuan resmi dari pemerintah.</p><p>Perlu diketahui bahwa mata uang kripto cukup beraneka ragam namun yang paling sering digunakan dan cukup populer dikalangan penggiat kripto adalah mata uang bitCoin.</p><p></p><ol start=\"2\"><li><p>Investasi</p></li></ol><p>Crytocurrency juga dapat dijadikan sebagai landang investasi yang menggiurkan dan lumayan menguntungkan, setelah peresmian uang kripto di Indonesia banyak platform yang dibuat khusus untuk melakukan investasi uang kripto.</p><p>Sebenarnya banyak platform yang ada namun kebanyakan orang kurang percaya karena tidak ada hukum dari pemerintah atau jaminan jika uang investasi kamu akan baik-baik saja.</p><p>Padahal jika kamu sudah mulai investasi pada tahun-tahun sebelumnya dan saat uang kripto sedang naik banyak jutawan lahir dari situ karena sebelumnya sudah membeli uang kripto dengan harga murah dan menjualnya saat harga sedang tinggi-tingginya.</p><p>Prinsip memahami investasi kripto kurang lebih sama dengan prinsip ekonomi, yaitu harga akan naik ketika ada banyak permintaan. Walaupun banyak juga faktor yang mempengaruhi nilai tukar uang kripto tersebut.</p><p>Investasi dengan Cryptocurrency juga termasuk dalam kategori high risk, karena bisa jadi kamu akan mengalami kerugian 100%.</p><p></p><ol start=\"3\"><li><p>Mining</p></li></ol><p>Berbeda dengan investasi Cryptocurrency, istilah mining dalam cryptocurrency sudah sangat populer sebelumnya, bahkan banyak orang juga yang sudah melakukan kegiatan tersebut karena memberikan benefit yang lumayan tinggi.</p><p>Pada dasarnya kegiatan mining atau menambang uang kripto ini dilakukan dengan cara memecahkan teka-teki cryptography yang rumit untuk mengkonfirmasi transaksi dan mencatatnya dalam blokchain.</p><p>Setelah memecahkan teka-teki tersebut, kamu akan menerima hadiah yakni uang kripto. Perlu diperhatikan bahwa modal yang dikeluarkan untuk mining sangatlah besar, jika kamu tidak memiliki perangkat yang memadai sangat tidak disarankan untuk mencoba mining.</p><p></p><p><strong>Jenis-jenis uang Crytocurrency</strong></p><p></p><p>Dikutip dari nerdwallet.com, lebih dari 10.000 jenis uang kripto yag diperdagangkan secara publik. Dengan banyaknya jenis uang krito yang ada dapat membuktikan bahwa publik percaya dengan mata uang digital ini. Tidak semua uang kripto memiliki kelebihan dan kekurangan yang sama seringkali uang kripto yang tercipta disesuaikan dengan kebutuhan transaksi yang akan berlangsung.</p><p>Berikut beberapa jenis mata uang kripto yang populer dan sering diperdagangkan dalam dunia digital.</p><p></p><ol><li><p>BitCoin</p></li></ol><p>Bitcoin merupakan jenis cryptocurrency pertama yang masih sangat populer hingga saat ini, diciptakan pada tahun 2009 oleh Satoshi Nakamoto. BTC atau bitcoin adalah mata uang online terdesentralisasi pertama dan paling banyak digunakan dengan kapitalisasi pasar tertinggi.</p><p>Tujuan BTC sendiri adalah untuk menyediakan sistem pembayaran peer to peer tanpa membutuhkan pihak ketiga. Total pasokan BTC terbatas pada 21 juta keping saja dan pada Oktober 2020 ada lebih dari 85% BTC yang telah beredar.</p><p></p><ol start=\"2\"><li><p>Ethereum</p></li></ol><p>Ethereum merupakan mata uang crypto populer urutan kedua setelah BTC, mata uang kripto ini dirancang untuk aplikasi terdesentralisasi dan penerapan kontrak pintar, dibuat dan dioperasikan tanpa penipuan, gangguan, kontrol, atau gangguan dari pihak ketiga.</p><p></p><ol start=\"3\"><li><p>Ripple</p></li></ol><p>Mata uang kripto Ripple diciptakan untuk menjadi alternatif yang cepat, lebih murah, dan skalabel untuk aset digital lain dan platform pembayaran moneter, jaringan ini dirancang untuk menyediakan metode pembayaran tanpa batas, dan memungkinkan pembayaran yang sangat cepat dan penerimaan nilai oleh individu dan bisnis.</p><p></p><ol start=\"4\"><li><p>Synthetix</p></li></ol><p>Synthetix atau SNX adalah protokol keuangan terdesentralisasi (DeFi) yang menyediakan eksposur on-chain ke berbagai aset kripto dan non-kripto. Platform ini memungkinkan pengguna untuk berdagang dan bertukar aset sintetis yang sangat liquid secara mandiri.</p><p></p><ol start=\"5\"><li><p>THETA</p></li></ol><p>THETA adalah mata uang kripto dengan jaringan bertenaga blockchain yang dibuat khusus untuk streaming video. Konsep bisnis uatama Theta adalah mendesentraslisasi streaming video, pengiriman data, dan edge computing. Menjadikannya lebih efisien, hemat biaya, dan adil bagi pelaku industri.</p><p></p><p></p><p></p><p>Source :</p><p></p><p>https://www.cnbcindonesia.com/tech/20210122132253-37-218020/resmi-ini-cryptocurrency-yang-diakui-di-ri-termasuk-bitcoin</p><p>https://glints.com/id/lowongan/cryptocurrency-adalah/#.YTbsiJtR3IU</p><p>https://katadata.co.id/muchamadnafi/finansial/60d5a2c4583f4/crypto-mengenal-uang-kripto-sampai-cara-transaksinya</p><p>https://id.wikipedia.org/wiki/Mata_uang_kripto</p><p>https://www.nerdwallet.com/article/investing/cryptocurrency-7-things-to-know#2.-how-many-cryptocurrencies-are-there-what-are-they-worth</p>', '2025-01-15 23:32:28', '2025-01-15 23:32:30');
INSERT INTO `posts` (`id`, `title`, `slug`, `user_id`, `category_id`, `photo`, `content`, `created_at`, `updated_at`) VALUES
(10, '100 Makanan Internasional Terpopuler yang Ada di Indonesia', '100-makanan-internasional-terpopuler-yang-ada-di-indonesia', 22, 2, 'https://res.cloudinary.com/robxxx/image/upload/v1737009523/blogizer/post-2025-01-16_10.jpg', '<p>Globalisasi telah membawa beragam kuliner dunia terasa lebih dekat. Kehadiran makanan internasional di pusat perbelanjaan dan bahkan pasar malam di Indonesia adalah bukti nyata dari fenomena ini. Hingga kini setidaknya ada 100 makanan internasional yang populer di Indonesia.</p><p></p><p>Masuknya 100 makanan tersebut adalah cerminan keberhasilan berbagai hidangan asing dalam beradaptasi dengan selera lokal, menciptakan perpaduan unik yang disukai banyak orang karena menghadirkan perpaduan unik yang disukai banyak orang.</p><p>Lantas dari 100 makanan internasional terpopuler yang ada di Indonesia ini, yang mana jadi favorit Anda?</p><p></p><h2><strong>Makanan Jepang di Indonesia</strong></h2><p>Makanan internasional yang populer di Indonesia ini ternyata berasal dari Negara Jepang.</p><h3><strong>1. Sushi dan Sashimi</strong></h3><p>Sushi adalah nasi yang dibungkus dengan lembaran nori (rumput laut) dengan berbagai isian, seperti sayuran,&nbsp; ikan mentah, sayuran dan juga telur. Sementara Sashimi adalah irisan ikan mentah segar yang disajikan tanpa nasi.</p><h3><strong>2. Ramen</strong></h3><p>Hidangan mie khas Jepang ini terdiri dari mie kenyal yang dimasukkan dalam kuah kaldu gurih, ditambah topping seperti chashu (daging babi), telur rebus, nori, dan daun bawang.</p><h3><strong>3. Takoyaki</strong></h3><p>Takoyaki adalah camilan ekonomis yang lezat berbentuk bola-bola yang adonannya terbuat dari tepung yang berisi potongan gurita, daging dan lain sebagainya. Setelah itu makanan internasional ini biasanya disajikan dengan saus takoyaki, bonito flakes dan mayones</p><h3><strong>4. Udon</strong></h3><p>Mie Udon menjadi salah satu hidangan mie khas Jepang yang sering dinikmati sebagai sarapan,makan siang sampai makan malam.</p><p>Mie Udon lebih tebal dibandingkan Mie Rame. Kemudian Mie Udon disiram dengan kuah gurih.</p><h3><strong>5. Okonomiyaki</strong></h3><p>Okonomiyaki adalah makanan internasional dari Jepang yang kerap disebut dengan pancake Jepang. Rasanya gurih karena terbuat dari adonan tepung terigu, kol, dan berbagai topping seperti daging babi, udang, atau sayuran.</p><h3><strong>6. Yakitori</strong></h3><p>Yakitori disebut sebagai sate dari Jepang karena penyajian Yakitori menyerupai sate di Indonesia pada umumnya yaitu dengan potongan daging ayam yang ditusuk.</p><p>Namun Yakitori juga menusukkan potongan sayuran diantara potongan ayam-ayam tersebut.</p><p>Makanan Internasional ini menonjolkan rasa yang gurih sementara Sate Indonesia menonjolkan bumbu kacangnya yang manis gurih dan sedikit pedas.</p><p><strong>7. Oyakodon</strong></p><p>Perpaduan nasi hangat dengan potongan ayam lembut dan telur orak-arik yang lezat, disiram saus gurih, menciptakan cita rasa yang unik.</p><p>Dalam Bahasa Jepang, Oyakodon berarti \"donburi (mangkuk nasi) anak dan induk\". Makanan internasional yang ada di Indonesia ini adalah pilihan tepat bagi pecinta kuliner Jepang yang ingin menikmati hidangan sederhana namun kaya rasa.</p><h3><strong>8. Teppanyaki</strong></h3><p>Teppanyaki di Indonesia sangat digemari karena pertunjukan memasak yang menghibur. Sensasi menyantap makanan yang baru saja dimasak di depan mata membuat pengalaman makan Teppanyaki semakin istimewa.</p><h3><strong>9. Soba</strong></h3><p>Soba, mie Jepang yang terbuat dari tepung gandum hitam yang teksturnya kenyal dan rasa gurihnya yang khas membuat soba menjadi pilihan populer.</p><p>Makanan Internasional ini sering disajikan dengan kuah kaldu hangat atau dingin, serta berbagai macam topping seperti tempura, onigiri, atau wasabi.</p><p>Soba dapat dinikmati di restoran ala Jepang yang mulai banyak tersebar di Indonesia.</p><h3><strong>10. Sup Miso</strong></h3><p>Kuah kaldu gurih yang dipadukan dengan pasta miso fermentasi, serta tambahan tofu lembut dan daun bawang, menciptakan harmoni rasa yang unik.</p><p>Hangatnya semangkuk sup miso menjadikannya pilihan sempurna untuk menghangatkan tubuh saat cuaca dingin. Tak heran jika sup miso selalu menjadi favorit bagi pecinta kuliner Jepang di Indonesia.</p><p></p><h2><strong>Makanan Korea di Indonesia</strong></h2><p>Selain budaya dan keseniannya, beberapa orang di Indonesia menyukai Korea dari kuliner-kuliner yang berikut ini:</p><h3><strong>11. Bibimbap</strong></h3><p>Hidangan Korea yang kaya akan warna dan rasa ada di semangkok Bibimbap. Nasi putih hangat menjadi dasar yang kemudian dilapisi berbagai macam sayuran segar, irisan daging, dan telur mentah. Sebelum disantap, semua bahan dicampur rata dengan saus gochujang yang pedas dan manis sehingga menciptakan ledakan rasa yang unik di setiap suapan.</p><h3><strong>12. Jjajangmyeon</strong></h3><p>Mie khas Korea Jjajangmyeon mudah dikenal karena makanan internasional ini yang mudah dikenali dari warnanya yang hitam.</p><p>Mie kenyal ini disajikan dengan saus kental berwarna hitam yang terbuat dari pasta kacang hitam. Perpaduan rasa gurih dan sedikit manis dari saus membuat jajangmyeon menjadi hidangan yang sangat populer, terutama di kalangan anak muda.</p><h3><strong>13. Kimbap</strong></h3><p>Kimbap sering dianggap sebagai versi Korea dari sushi. Bedanya, nasi kimbap dibumbui dengan minyak wijen yang memberikan rasa gurih, sedangkan nasi sushi dibumbui dengan cuka. Isi kimbap pun beragam, mulai dari sayuran, telur, daging, hingga olahan laut, yang kemudian digulung dengan lembaran rumput laut.</p><h3><strong>14. Bulgogi</strong></h3><p>Irisan tipis daging sapi dimarinasi dengan bumbu khas yang terbuat dari saus gochujang, kecap asin, bawang putih dan sedikit gula menghasilkan makanan Internasional kha Korea bernama Bulgogi.</p><p>Daging yang dimarinasi itu kemudian dipanggang hingga matang dan mengeluarkan aroma yang sangat nikmat.</p><h3><strong>15. Tteokbokki</strong></h3><p>Tteokbokki&nbsp; terbuat dari kue beras kenyal yang dimasak dengan saus gochujang yang pedas dan manis yang kerap dijadikan sebagai makan ringan.</p><p>Selain kue beras, Tteokbokki juga sering ditambahkan fish cake dan sayuran seperti wortel dan daun bawang. Tekstur kue beras yang kenyal berpadu dengan saus yang kaya rasa membuat tteokbokki menjadi hidangan yang sangat addictive.</p><h3><strong>16. Odeng</strong></h3><p>Selain Tteokbokki, ada pun Odeng sebagai jajanan kaki lima khas Korea yang terbuat dari ikan yang digiling halus, kemudian dibentuk menjadi batang-batang panjang.</p><p>Odeng direbus dalam kuah kaldu yang gurih dan biasanya disajikan dengan saus mustard. Odeng sering menjadi pilihan untuk menghangatkan badan saat cuaca dingin.</p><h3><strong>17. Corn Dog</strong></h3><p>Jajanan bernama Corn Dog yang sangat populer di kalangan anak muda Korea. Corn Dog pada dasarnya adalah sosis atau keju mozzarella yang ditusuk, kemudian dilapisi dengan adonan tebal yang terbuat dari tepung jagung, lalu digoreng hingga berwarna kecoklatan.</p><p>Alasan Corn Dog menjadi makanan internasional khas Korea dengan tekstur luarnya yang renyah berpadu dengan isian yang lembut membuat corn dog menjadi camilan yang sangat menyenangkan.</p><h3><strong>18. Kimchi</strong></h3><p>Kimchi adalah makanan fermentasi khas Korea yang terbuat dari berbagai jenis sayuran, seperti kubis, lobak, dan timun. Sayuran tersebut difermentasi dengan bumbu pedas yang terbuat dari gochugaru (cabai bubuk Korea), bawang putih, jahe, dan ikan teri. Kimchi memiliki rasa yang khas, yaitu asam, pedas, dan sedikit asin.</p><h3><strong>19. Ramyeon</strong></h3><p>Mie instan yang sangat populer di Korea karena memiliki tekstur yang kenyal dan rasa yang gurih serta sedikit pedas. Makanan internasional dari Korea ini biasanya dimasak dengan cara direbus bersama dengan bumbu instan yang sudah disediakan.</p><h3><strong>20. Bungeoppang</strong></h3><p>Bungeoppang identik dengan bentuknya yang unik yaitu bentuk ikan. Adonannya yang lembut dan harum membuat makanan internasional dari Korea ini sesuai dengan selera anak muda di Indonesia.</p><p>Bungeoppang di Indonesia diisi dengan bahan lain seperti coklat, keju, atau krim custard. Bungeoppang sering dijadikan sebagai cemilan atau oleh-oleh.</p><p></p><h2><strong>Makanan China di Indonesia</strong></h2><p>Makanan internasional dari China yang ada di Indonesia berikut ini pasti pernah Anda cicipi:</p><h3><strong>21. Bakso</strong></h3><p>Meskipun asalnya dari China, bakso di Indonesia telah mengalami adaptasi dan menjadi makanan khas Indonesia.</p><h3><strong>22. Capcay</strong></h3><p>Makanan Internasional \"Capcay\" asalnya dari Canton, Tiongkok ini dahulu adalah makanan bagi golongan kelas bawah. Kata \"Cap\" artinya sepuluh sementara \"Cay (chai)\" artinya sayuran.</p><h3><strong>23. Fuyunghai</strong></h3><p>Omelet tebal yang berisi sayuran dan daging cincang, biasanya disajikan dengan saus kental.</p><h3><strong>24. Dimsum</strong></h3><p>Makanan China ini bentuknya kecil-kecil dengan beraneka macam. Kemudian cara memasaknya dengan cara dikukus dalam keranjang bambu.</p><h3><strong>25. Bebek Peking</strong></h3><p>Bebek Peking adalah bebek yang dipanggang sehingga tekstur kulitnya renyah dan dagingnya lembut. Biasanya makanan internasional ini disajikan dengan kulit panggang yang renyah dan saus hoisin.</p><h3><strong>26. Sapo Tahu</strong></h3><p>Tahu yang lembut dimasak dengan kuah kental yang berisi udang, jamur, dan sayuran.</p><h3><strong>27. Nasi Hainan</strong></h3><p>Nasi putih yang disajikan dengan ayam rebus dan kuah kaldu.</p><h3><strong>28. Kwetiau</strong></h3><p>Mie lebar yang dimasak dengan saus kental, biasanya disajikan dengan sayuran dan daging.</p><h3><strong>29. Nasi Goreng China</strong></h3><p>Perbedaan nasi goreng China dan nasi goreng Indonesia yaitu dari penambahan saus tiram dan kecap asin yang khas.</p><h3><strong>30. Bakpau</strong></h3><p>Roti khas China yang berwarna putih dengan beraneka isian yang rasanya manis dan gurih.</p><p>Kini bakpau di Indonesia dikreasikan lagi dengan berbagai bentuk yang menarik.</p><p></p><h2><strong>Makanan Internasional Negara Italia yang Ada di Indonesia</strong></h2><p>Negara Italia di Indonesia tidak hanya terkenal akan Pizza melainkan beberapa makanan internasional berikut ini:</p><h3><strong>41. Spaghetti Carbonara</strong></h3><p>Pasta spaghetti yang dimasak dengan saus creamy yang terbuat dari telur, keju parmesan, dan daging asap (bacon atau pancetta).</p><h3><strong>42. Spaghetti Bolognese</strong></h3><p>Pasta spaghetti dengan saus bolognese yang kaya rasa, terbuat dari daging cincang, tomat, dan rempah-rempah Italia.</p><h3><strong>43. Ravioli</strong></h3><p>Semacam Pasta namun makanan Internasional dari Italia ini berbentuk kotak kecil yang diisi dengan berbagai macam isian, seperti keju ricotta, daging, atau sayuran.</p><h3><strong>44. Lasagna</strong></h3><p>Lapisan-lapisan pasta yang diisi dengan saus daging, saus bechamel, dan keju mozzarella, kemudian panggang hingga kecoklatan.</p><h3><strong>45. Risotto</strong></h3><p>Nasi yang dimasak dengan kaldu, mentega, dan keju parmesan, biasanya ditambahkan bahan lain seperti jamur, seafood, atau sayuran.</p><h3><strong>46. Makaroni</strong></h3><p>Makanan Internasional ini semacam pasta kering yang terbuat dari gandum. Bentuk makaroni bisa lurus atau melengkung. Makaroni biasanya diolah dengan tambahan daging, sayuran, keju, atau saus.</p><h3><strong>47. Zuppa Soup</strong></h3><p>Zuppa Soup di negara asalnya, Italia, disebut dengan Zuppa Toscana.</p><p>Zuppa Toscana&nbsp;terbuat&nbsp; dari bahan-bahan seperti kale, zucchini, kacang cannellini, kentang, seledri, wortel, bawang, bubur tomat, minyak zaitun extra virgin, garam, cabai bubuk, roti Tuscan panggang dan rigatino.</p><h3><strong>48. Tiramisu</strong></h3><p>Dessert Italia yang terkenal dengan lapisan-lapisan biskuit savoiardi yang dibasahi dengan kopi dan dilapisi dengan krim mascarpone.</p><h3><strong>49. Bruschetta</strong></h3><p>Roti panggang yang diolesi dengan minyak zaitun, bawang putih, dan tomat segar</p><h3><strong>50. Caprese Salad</strong></h3><p>Salad yang terdiri dari tomat, mozzarella, dan basil segar, disiram dengan minyak zaitun dan balsamic.</p><p></p><h2><strong>Makanan Khas Timur Tengah di Indonesia</strong></h2><p>Makanan Timur Tengah diterima oleh lidah masyarakat Indonesia karena memakai beragam rempah sehingga makanannya terasa lebih nikmat sehingga memunculkan makanan internasional asli timur Tengah di Indonesia sebagai berikut ini:</p><h3><strong>51. Kebab</strong></h3><p>Daging panggang yang dibungkus lembut dalam roti khas, disajikan dengan berbagai topping segar, membuat kebab menjadi makanan internasional khas Timur Tengah yang sangat populer di Indonesia, mudah ditemukan di berbagai tempat.</p><h3><strong>52. Sambosa</strong></h3><p>Seperti martabak mini yang renyah di luar, lembut di dalam, sambosa menawarkan cita rasa unik dengan isian daging dan sayuran yang menggugah selera.</p><h3><strong>53. Nasi Kebuli</strong></h3><p>Nasi gurih beraroma rempah yang dimasak dengan susu kambing, disajikan dengan daging kambing atau lauk khas Timur Tengah lainnya, membuat nasi kebuli menjadi hidangan istimewa.</p><h3><strong>54. Roti Maryam</strong></h3><p>Mirip roti canai atau roti japati, roti maryam menawarkan fleksibilitas dengan berbagai varian rasa dan topping, namun di Timur Tengah sering dinikmati dengan kari kambing yang kaya rasa.</p><h3><strong>55. Tabouleh</strong></h3><p>Makanan internasional khas Timur Tengah ini adalah salad segar dengan potongan sayuran kecil-kecil dan bumbu khas yang menyegarkan, memberikan pengalaman kuliner yang berbeda.</p><h3><strong>56. Manakeesh</strong></h3><p>Mirip Pizza namun dengan cita rasa Timur Tengah yang lebih kuat karena Manakeesh terbuat dari roti pipih dengan&nbsp;<em>topping</em>&nbsp;daging cincang, keju dan bumbu khas yang kaya rempah.</p><h3><strong>57. Nasi Biryani</strong></h3><p>Nasi khas Timur Tengah dengan butiran beras panjang berwarna kuning, dimasak dengan rempah-rempah dan yogurt, memberikan cita rasa yang kaya dan unik.</p><h3><strong>58. Nasi Mandhi</strong></h3><p>Makanan Internasional berupa nasi gurih dengan rasa rempah yang lebih ringan dibandingkan nasi biryani, sering disajikan dengan kismis atau kurma sebagai pelengkap.</p><h3><strong>59. Baklava</strong></h3><p>Hidangan penutup manis yang terbuat dari lapisan filo yang renyah, diisi kacang cincang manis dan disiram sirup atau madu, memberikan kelezatan yang tak terlupakan.</p><h3><strong>60. Yughmish</strong></h3><p>Roti gurih dengan isian daging berbumbu khas Timur Tengah, cocok dinikmati sebagai camilan sore hari bersama teh hangat.</p><h3><strong>61. Katayef</strong></h3><p>Pastel khas Timur Tengah dengan aroma kayu manis yang menggoda, diisi kacang kenari dan gula, sering dijadikan hidangan berbuka puasa atau pencuci mulut.</p><h3><strong>62. Hummus</strong></h3><p>Pasta kacang Arab yang creamy dan lezat, sering dijadikan cocolan untuk roti pita atau sebagai saus pelengkap hidangan lainnya.</p><h3><strong>63. Falafel</strong></h3><p>Bola-bola kacang fava yang renyah di luar, lembut di dalam, disajikan dengan sayuran segar dalam bungkusan roti pita, menjadi makanan Timur Tengah yang populer di Indonesia.</p><h3><strong>64. Mugalgal</strong></h3><p>Hidangan daging domba yang dimasak dengan tomat, paprika, dan rempah-rempah khas, memberikan cita rasa yang kaya dan aroma yang menggugah selera.</p><h3><strong>65. Maraq</strong></h3><p>Sup kambing dengan kuah bening dan bumbu khas Timur Tengah, menawarkan cita rasa yang hangat dan menggugah selera.</p><h2><strong>Makanan Amerika di Indonesia</strong></h2><p>Makanan Amerika juga masuk ke Indonesia dan dengan cepat disukai oleh masyarakat Indonesia seperti yang berikut ini:</p><p>Baca Juga:</p><p>Makanan Orang Amerika yang Lezat</p><h3><strong>66. Burger</strong></h3><p>Roti lapis yang berisi daging sapi panggang, selada, tomat, keju, dan saus. Burger menjadi salah satu makanan cepat saji yang sangat digemari.</p><h3><strong>67. Hot Dog</strong></h3><p>Makanan internasional dari Amerika Serikat ini terdiri dari sosis yang disajikan di dalam roti panjang, sering dilengkapi dengan saus mustard, saos tomat, dan bawang goreng.</p><h3><strong>68. Ayam Goreng Tepung</strong></h3><p>Ayam goreng dengan lapisan tepung renyah, sering dijual di restoran cepat saji dengan berbagai pilihan saus.</p><h3><strong>69. Mac and Cheese</strong></h3><p>Pasta makaroni yang dimasak dengan saus keju krim, menjadi hidangan yang lezat dan kaya rasa.</p><h3><strong>70. Pancake</strong></h3><p>Kue dadar yang disajikan dengan sirup maple, mentega, atau buah-buahan. Pancake sering menjadi menu sarapan favorit.</p><h3><strong>71. Corn Dog</strong></h3><p>Sosis yang dilapisi adonan tepung jagung dan digoreng hingga matang, disajikan dengan tusuk sate.</p><h3><strong>72. Sloppy Joe</strong></h3><p>Masakan Internasional ini terbuat dari Daging cincang yang dimasak dengan saus tomat manis dan disajikan di dalam roti burger, memberikan rasa yang khas.</p><h3><strong>73. Buffalo Wings</strong></h3><p>Sayap ayam yang digoreng dan dilapisi saus pedas khas Buffalo, biasanya disajikan dengan saus keju biru atau ranch.</p><h3><strong>74. Coleslaw</strong></h3><p>Ini adalah Salad khas Amerika Serikat&nbsp; yang terbuat dari kol dan wortel yang dicampur dengan saus mayonnaise, sering disajikan sebagai pendamping.</p><h2><strong>75. Apple Pie</strong></h2><p>Kue pie dengan isian apel yang dimasak dengan gula dan kayu manis, merupakan hidangan penutup klasik Amerika.</p><h3><strong>76. Chili Con Carne</strong></h3><p>Hidangan pedas yang terbuat dari daging sapi cincang, kacang merah, dan cabai, sering disajikan dengan nasi atau roti.</p><h3><strong>77. Grilled Cheese</strong></h3><p>Grilled Cheese adalah makanan internasional khas Amerika yang diisi dengan keju dan dipanggang hingga keju meleleh, menghasilkan rasa yang lezat dan renyah.</p><h3><strong>78. Cobb Salad</strong></h3><p>Salad ini yang terdiri dari selada, tomat, ayam, bacon, telur rebus, dan keju biru, disajikan dengan dressing khas.</p><h3><strong>79. Meatloaf</strong></h3><p>Daging cincang yang dibentuk seperti roti dan dipanggang, sering disajikan dengan saus tomat dan kentang tumbuk.</p><p></p><h2><strong>Makanan Malaysia dan Singapura di Indonesia</strong></h2><p>Malaysia dengan kuliner khas Melayunya sangat cocok dengan lidah orang Indonesia tanpa perlu dimodifikasi lagi sehingga makanan internasional dari malaysia yang berikut ini cepat menyebar di Indonesia:</p><h3><strong>80. Nasi Lemak</strong></h3><p>Nasi yang dimasak dengan santan kemudian disajikan dengan sambal, telur rebus, ikan bilis, kacang tanah, dan irisan mentimun.</p><h3><strong>81. Char Kway Teo</strong></h3><p>Mie pipih khas Malaysia yang digoreng dengan kecap manis, telur, udang, dan tauge. Hidangan ini memiliki cita rasa manis dan gurih.</p><h3><strong>82. Laksa Penang</strong></h3><p>Mie dengan kuah asam pedas berbahan dasar ikan, sering diberi topping seperti mentimun, bawang merah, dan daun mint.</p><h3><strong>83. Hainanese Chicken Rice</strong></h3><p>Nasi yang dimasak dengan kaldu ayam, disajikan dengan ayam rebus atau panggang dan saus jahe serta kecap asin.</p><h3><strong>84. Mee Goreng</strong></h3><p>Mie goreng dengan bumbu khas Malaysia, biasanya makanan internasional ini dilengkapi dengan telur, tahu, dan&nbsp;<em>seafood</em>. Rasanya cenderung manis dan pedas.</p><h3><strong>85. Satay Kajang</strong></h3><p>Sate khas Malaysia dengan potongan daging yang lebih besar, disajikan dengan saus kacang yang kaya rasa dan lontong.</p><h3><strong>86. Nasi Kandar</strong></h3><p>Nasi putih yang disajikan dengan berbagai jenis lauk seperti kari ayam, daging, telur, dan sayuran, sering diberi kuah kari.</p><h3><strong>87. Rojak</strong></h3><p>Salad buah dan sayuran yang dicampur dengan saus kacang manis, sering diberi tambahan seperti tahu dan telur rebus.</p><h3><strong>89.Kway Chap</strong></h3><p>Mie lebar yang disajikan dalam kuah kaldu dengan tambahan daging, tahu, dan jeroan, menjadi hidangan yang kaya rasa.</p><h3><strong>90. Asam Pedas</strong></h3><p>Hidangan ikan yang dimasak dalam kuah asam pedas, biasanya disajikan dengan nasi putih dan sayuran segar.</p><h3><strong>91. Popiah</strong></h3><p>Popiah alias Lumpia di Malaysia dan Singapura ini diisi dengan sayuran, tauge, dan daging cincang, biasanya disajikan dengan saus manis pedas.</p><h3><strong>92. Otak-Otak</strong></h3><p>Daging ikan yang dibumbui dan dibungkus dengan daun pisang, kemudian dibakar atau dikukus, memiliki rasa yang gurih.</p><h3><strong>93. Kuih Lapis</strong></h3><p>Kue tradisional berlapis-lapis dengan warna-warni. Makanan internasional ini terbuat dari tepung beras dan santan, rasanya manis dan kenyal.</p><h3><strong>94. Apam Balik</strong></h3><p>Pancake tebal yang diisi dengan kacang tanah, gula, dan jagung manis, sering dijual di pasar malam.</p><h3><strong>95. Keropok Lekor</strong></h3><p>Kerupuk ikan yang digoreng atau direbus, biasanya disajikan dengan saus cabai manis, teksturnya kenyal dan gurih.</p><h3><strong>96. Nasi Kerabu</strong></h3><p>Nasi biru yang diberi pewarna alami dari bunga telang, disajikan dengan lauk-pauk seperti ayam, ikan, dan sayuran.</p><h3><strong>97. Chilli Crab</strong></h3><p>Chilli crab mirip dengan hidangan Indonesia yang bernama Kepiting Saus Padang. Kepiting Saus Padang maupun Chili Crab, sama-sama mengandalkan rasa pedas dan gurih dari kombinasi jahe, bawang-bawang, dan berbagai saus. Namun, perbedaan utama terletak pada penggunaan telur kocok dan tingkat kekentalan sausnya</p><h3><strong>98. Roti Prata</strong></h3><p>Roti pipih yang lembut dan kenyal ini sering disajikan dengan kari atau kuah kental lainnya. Roti Prata juga bisa diisi dengan berbagai macam bahan, seperti telur, daging, atau keju.</p><h3><strong>99. Chwee Kueh</strong></h3><p>Chwee Kueh adalah kue beras kukus yang lembut, disajikan dengan lobak chye poh (acar lobak) dan sambal. Kue ini sering menjadi pilihan sarapan atau camilan ringan.</p><h3><strong>100. Hokkien Mee</strong></h3><p>Hokkien Mee adalah mie kuning yang digoreng dengan kuah kental yang terbuat dari kaldu udang.</p><p>Hidangan ini biasanya ditambahkan dengan potongan daging babi, udang, dan telur.</p>', '2025-01-15 23:38:39', '2025-01-15 23:38:41'),
(11, '6 Cara Mudah Menjaga Gaya Hidup Sehat', '6-cara-mudah-menjaga-gaya-hidup-sehat', 22, 1, 'https://res.cloudinary.com/robxxx/image/upload/v1737082564/blogizer/post-2025-01-17_11.jpg', '<p>Cara menjaga gaya hidup sehat sehari-hari yang baik dan benar adalah bagaimana cara kamu berusaha untuk meningkatkan kualitas hidup yang lebih baik terutama pada kesehatan. Banyak orang lupa menyisihkan waktu untuk makan, memilih menyelesaikan pekerjaan sampai larut malam, sehingga jam tidur tidak lagi 7-8 jam perhari.</p><p></p><p>Jika gaya hidup seperti itu terus dilakukan, maka akan berdampak negatif pada tubuh. Untuk memiliki tubuh yang sehat ada banyak cara yang bisa kamu terapkan, namun memang tidak mudah untuk mengubah gaya hidup yang tidak teratur menjadi gaya hidup sehat.</p><p></p><p>Memang benar ada banyak kendala yang akan kamu hadapi untuk mengubah dan menjaganya dengan gaya hidup sehat. Kendala terbesar adalah rasa malas yang timbul pada diri kamu dan menyepelekan pentingnya kesehatan. Oleh karena itu dibutuhkan niat yang cukup kuat dari dalam diri, jika sudah ada niat maka selanjutnya adalah memiliki kemauan, dengan begitu akan terwujudnya gaya hidup sehat yang kamu inginkan. </p><p></p><p><strong>6 Cara Menjaga Gaya Hidup Sehat</strong></p><p></p><p><strong>1.&nbsp;Istirahat yang Cukup</strong></p><p>Perlu kamu ketahui bahwa istirahat yang cukup sangat beperan penting untuk kesehatan tubuh. Karena jika tubuh disibukan dengan banyak aktivitas setiap harinya dan kurang beristirahat,&nbsp;maka tubuh akan rentan terkena penyakit. Dengan istirahat yang cukup setiap harinya maka kamu sudah melakukan cara menjaga gaya hidup sehat dengan baik.</p><p></p><p><strong>2.&nbsp;Memperhatikan Asupan Makanan</strong></p><p>Untuk cara menjaga gaya hidup sehat, kamu perlu mengatur makanan apa saja yang akan dikonsumsi setiap harinya. Contohnya berbagai macam zat gizi yang dibutuhkan oleh manusia adalah karbohidrat, protein, vitamin dan juga mineral. Selain itu kamu juga harus menghindari makanan berlemak tinggi. Makanan berlemak dapat menyebabkan penimbunan kolesterol dalam pembuluh darah. Hal ini bisa memicu berbagai macam penyakit kronis.</p><p></p><p><strong>3.&nbsp;Minum Air Putih</strong></p><p>Minum air putih merupakan salah satu cara hidup sehat yang mudah. Karena dengan meminum air putih, bisa mengeluarkan racun yang ada di dalam tubuh, yang dikeluarkan melalui air seni. Tubuh sangat membutuhkan unsur cairan karena banyaknya aktivitas setiap hari sehingga kamu sangat dianjurkan untuk minum minimal setidaknya 8 gelas per hari.</p><p></p><p><strong>4.&nbsp;Rajin Berolahraga</strong></p><p>Meluangkan waktu untuk berolahraga merupakan salah satu cara menjalani gaya hidup sehat. Karena olahraga membuat tubuh menjadi lebih fit dan bugar. Berolahraga dapat mengeluarkan racun dalam tubuh, yang dikeluarkan melalui keringat. Menjaga gaya hidup sehat tidak lengkap jika tidak berolahraga.</p><p></p><p><strong>5.&nbsp;Membiasakan Hidup Bersih</strong></p><p>Menjaga kebersihan termasuk cara hidup sehat. Selain untuk kenyamanan dan kesehatan, kebersihan juga membuat suasana hati yang baik saat untuk kamu memulai beraktivitas. Tidak lupa juga untuk memperhatikan kebersihan tangan dengan rajin mencuci tangan. Karena dalam beraktivitas sehari-hari pastinya kamu memegang banyak benda atau barang-barang yang tidak diketahui kebersihannya.</p><p></p><p><strong>6.&nbsp;Meninggalkan Kebiasaan Buruk</strong></p><p>Pada poin ini kamu harus benar-benar meninggalkan kebiasaan negatif, seperti merokok dan meminum-minuman berakohol. Karena merokok dan minum-minuman berakohol akan mengakibatkan organ-organ di dalam tubuh menjadi rusak.</p>', '2025-01-16 19:55:55', '2025-01-16 19:56:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(5, 6, 5),
(6, 6, 6),
(7, 5, 3),
(8, 5, 4),
(9, 7, 7),
(10, 7, 8),
(11, 8, 9),
(12, 9, 10),
(13, 9, 11),
(14, 10, 12),
(15, 11, 13),
(16, 3, 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `user_id`, `name`) VALUES
(1, 1, 'Admin'),
(3, 4, 'User'),
(4, 5, 'User'),
(8, 9, 'User'),
(9, 10, 'User'),
(10, 11, 'User'),
(11, 12, 'User'),
(12, 13, 'User'),
(13, 14, 'User'),
(14, 15, 'User'),
(15, 16, 'User'),
(16, 17, 'User'),
(17, 18, 'User'),
(18, 19, 'User'),
(19, 20, 'User'),
(20, 21, 'User'),
(21, 22, 'User'),
(22, 23, 'User'),
(23, 24, 'User'),
(24, 25, 'User'),
(25, 27, 'User'),
(26, 28, 'User'),
(27, 29, 'User'),
(28, 30, 'User'),
(29, 31, 'User'),
(30, 32, 'User'),
(31, 33, 'User'),
(32, 34, 'User'),
(33, 35, 'User'),
(34, 36, 'User'),
(35, 37, 'User'),
(36, 38, 'User'),
(37, 39, 'User'),
(38, 40, 'User'),
(39, 41, 'User'),
(40, 42, 'User'),
(41, 43, 'User'),
(42, 44, 'User'),
(43, 45, 'User'),
(44, 46, 'User'),
(45, 47, 'User'),
(46, 48, 'User'),
(47, 49, 'User'),
(48, 50, 'User'),
(49, 51, 'User'),
(50, 52, 'User'),
(51, 53, 'User'),
(52, 54, 'User'),
(53, 55, 'User'),
(54, 56, 'User'),
(55, 57, 'User'),
(56, 58, 'User'),
(57, 59, 'User'),
(58, 60, 'User'),
(59, 61, 'User'),
(60, 62, 'User'),
(61, 63, 'User'),
(62, 64, 'User'),
(63, 65, 'User'),
(64, 66, 'User'),
(65, 67, 'User'),
(66, 68, 'User'),
(67, 69, 'User'),
(68, 70, 'User'),
(69, 71, 'User'),
(70, 72, 'User'),
(71, 73, 'User'),
(72, 74, 'User'),
(73, 75, 'User'),
(74, 76, 'User'),
(75, 77, 'User'),
(76, 78, 'User'),
(77, 79, 'User'),
(78, 80, 'User'),
(79, 81, 'User'),
(80, 82, 'User'),
(81, 83, 'User'),
(82, 84, 'User'),
(83, 85, 'User'),
(84, 86, 'User'),
(85, 87, 'User'),
(86, 88, 'User'),
(87, 89, 'User'),
(88, 90, 'User'),
(89, 91, 'User'),
(90, 92, 'User'),
(91, 93, 'User'),
(92, 94, 'User'),
(93, 95, 'User'),
(94, 96, 'User'),
(95, 97, 'User'),
(96, 98, 'User'),
(97, 99, 'User'),
(98, 100, 'User');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `type`, `content`, `created_at`, `updated_at`) VALUES
(1, 'banner1', 'https://res.cloudinary.com/robxxx/image/upload/v1737083414/blogizer/banner-1_2024-12-30_1.jpg', '2024-12-30 05:00:54', '2025-01-16 20:10:12'),
(2, 'banner2', 'https://res.cloudinary.com/robxxx/image/upload/v1737083142/blogizer/banner-2_2024-12-30_2.jpg', '2024-12-30 05:00:54', '2025-01-16 20:05:40'),
(3, 'banner3', 'https://res.cloudinary.com/robxxx/image/upload/v1737083146/blogizer/banner-3_2024-12-30_3.jpg', '2024-12-30 05:00:54', '2025-01-16 20:05:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`) VALUES
(1, 'outfit', 'outfit'),
(2, 'kasual', 'kasual'),
(3, 'festival', 'festival'),
(4, 'konser', 'konser'),
(5, 'slow living', 'slow-living'),
(6, 'anak muda', 'anak-muda'),
(7, 'kecerdasan buatan', 'kecerdasan-buatan'),
(8, 'teknologi', 'teknologi'),
(9, 'pengertian', 'pengertian'),
(10, 'cryptocurrency', 'cryptocurrency'),
(11, 'mata uang', 'mata-uang'),
(12, 'internasional', 'internasional'),
(13, 'kesehatan', 'kesehatan'),
(14, 'alam', 'alam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` text DEFAULT NULL,
  `biodata` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `photo`, `biodata`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$cuqkufJgYVejB5Z08XFDBeoTJ/yPVPKV5g8v9EwX1DMnqx5pe8.G.', NULL, NULL, NULL, '2024-09-16 07:43:02', '2024-09-16 07:43:02'),
(4, 'User', 'user@gmail.com', NULL, '$2y$12$fppOActWYMHMk1bYMgXyEO0gyeBv48FExrTDNpmCn078e4K4SUrmW', NULL, NULL, NULL, '2025-01-12 08:23:28', '2025-01-12 08:23:28'),
(5, 'Doni', 'doni@gmail.com', NULL, '$2y$12$6CHBacT2n4iuEXfi7qwiA.CIHHdOsep1OQ7TufwGFmLMxXk7iDt8i', NULL, NULL, NULL, '2025-01-15 01:32:19', '2025-01-15 01:32:19'),
(9, 'Respati', 'respati@gmail.com', NULL, '$2y$12$bpXQQOzVY3d7xofim2zHdugz32HMXrTb6.i5TMFjNYt0ebjdTy/cu', NULL, NULL, NULL, '2025-01-15 02:02:21', '2025-01-15 02:02:21'),
(10, 'Uli', 'uli@gmail.com', NULL, '$2y$12$3fAq7D0h9UpS5Aex8dQ/e.0Z5Vw.4yPLic8C00XFYV3XMccJSioe2', NULL, NULL, NULL, '2025-01-15 02:02:22', '2025-01-15 02:02:22'),
(11, 'Edison', 'edison@gmail.com', NULL, '$2y$12$6Z.O2UzkXBfuQVOb7Jd5buIGQGE5fHUcaFKLt7eeKbBUBucLChbcO', NULL, NULL, NULL, '2025-01-15 02:02:22', '2025-01-15 02:02:22'),
(12, 'Opan', 'opan@gmail.com', NULL, '$2y$12$zERje2FAD73dHUK18Ve/OuoRrJwouEeQcY7Pa0BqsjS/HH8Ogdh82', NULL, NULL, NULL, '2025-01-15 02:03:01', '2025-01-15 02:03:01'),
(13, 'Chelsea', 'chelsea@gmail.com', NULL, '$2y$12$InqleT.HpEFV9mdyIHRxyOEggP7f/QvtY1WfUBvKnzMSusrhHqZqO', NULL, NULL, NULL, '2025-01-15 02:03:01', '2025-01-15 02:03:01'),
(14, 'Lintang', 'lintang@gmail.com', NULL, '$2y$12$0MAzdwoQgkq6IDJmUU3LC.yUPt1NI9sxd0nh1.5yMYLjr9QYfBIJa', NULL, NULL, NULL, '2025-01-15 02:03:01', '2025-01-15 02:03:01'),
(15, 'Banawa', 'banawa@gmail.com', NULL, '$2y$12$XH1Il7OdjqsJFL8AhzWT9.5ZdKpT5j/qhgUsnjuEMt/qVlzpC8aoW', NULL, NULL, NULL, '2025-01-15 02:03:02', '2025-01-15 02:03:02'),
(16, 'Raisa', 'raisa@gmail.com', NULL, '$2y$12$w3TeYGR9N5yNVZiDVigYEecreMcCkYW8wPPFIG7FZfll35FS/PBv.', NULL, NULL, NULL, '2025-01-15 02:03:02', '2025-01-15 02:03:02'),
(17, 'Yusuf', 'yusuf@gmail.com', NULL, '$2y$12$A5JScV8EYO5erXGvTUXZ/erPp3gft7JRgKzMgS2eIVeafPQVZR8sq', NULL, NULL, NULL, '2025-01-15 02:03:03', '2025-01-15 02:03:03'),
(18, 'Dalima', 'dalima@gmail.com', NULL, '$2y$12$/nzRzvq9T9eP0nDDCG4rK.m4LTwdPkpie0IE434g8u8AmTQ/EuOU6', NULL, NULL, NULL, '2025-01-15 02:03:03', '2025-01-15 02:03:03'),
(19, 'Yunita', 'yunita@gmail.com', NULL, '$2y$12$F6FiN7lIKYkQb.EPeSD3wer5DYRTIKT2n8Iv8Um4Prc76Cde7pEYa', NULL, NULL, NULL, '2025-01-15 02:03:03', '2025-01-15 02:03:03'),
(20, 'Diana', 'diana@gmail.com', NULL, '$2y$12$TQZn7caOlKlzIyvKJgowQObugRKCP0gbX8iw75tsWYId7U4P6TkGi', NULL, NULL, NULL, '2025-01-15 02:03:04', '2025-01-15 02:03:04'),
(21, 'Siska', 'siska@gmail.com', NULL, '$2y$12$hLcfAchkValzjgG9/toKNORAVdBzudEagWEcP8ByUtcaZTFbYJM9C', NULL, NULL, NULL, '2025-01-15 02:03:04', '2025-01-15 02:03:04'),
(22, 'Darsirah', 'darsirah@gmail.com', NULL, '$2y$12$I8A/oc.R/rhH3RSwk11UFOm8bpn4HsDzwgfLiPW1.WQ8DXLifsvvG', 'https://res.cloudinary.com/robxxx/image/upload/v1737096239/blogizer/2025-01-17_22.webp', 'null', NULL, '2025-01-15 02:03:26', '2025-01-16 23:43:56'),
(23, 'Lala', 'lala@gmail.com', NULL, '$2y$12$Rj2q4PxziJNyuTIqIYZZUOCjvArRbznWjTQVgYJKN3LbB1I1sanz6', NULL, NULL, NULL, '2025-01-15 02:03:27', '2025-01-15 02:03:27'),
(24, 'Rizki', 'rizki@gmail.com', NULL, '$2y$12$.ygYzy5u3ygPQweEgAV9HOlAniKnc4M8OeXv7.vmIGSB/JX8YmRw6', NULL, NULL, NULL, '2025-01-15 02:03:27', '2025-01-15 02:03:27'),
(25, 'Jessica', 'jessica@gmail.com', NULL, '$2y$12$N6xaG5hrwqXcSiwye6h3H.WU/txxPrL8PKcsE15PkHC8Vv7Z6ca1C', NULL, NULL, NULL, '2025-01-15 02:03:27', '2025-01-15 02:03:27'),
(27, 'Lucius', 'lucius@gmail.com', NULL, '$2y$12$qtspFgnfbwOlSxYotpD1hOdbhsyByhbhjGx8HF6XPmcU64kWTUs6S', NULL, NULL, NULL, '2025-01-15 02:04:42', '2025-01-15 02:04:42'),
(28, 'Mitchell', 'mitchell@gmail.com', NULL, '$2y$12$vYtPdq7vSCbHgRpO4s/UKuqcZvpx6A1aGROirhtLIWjlUNK05DKR6', NULL, NULL, NULL, '2025-01-15 02:04:43', '2025-01-15 02:04:43'),
(29, 'Edmund', 'edmund@gmail.com', NULL, '$2y$12$J1kw8FXorp3BxcoPRzAXIeujNzEVxXQmY/Gt8cJYlL.jl7Sp59Yz.', NULL, NULL, NULL, '2025-01-15 02:04:43', '2025-01-15 02:04:43'),
(30, 'Kareem', 'kareem@gmail.com', NULL, '$2y$12$d3aDe0JNGFbkTfPrjNH7keT4HJX0pbX.lBWAPPLJuPbTk3pwtkfmq', NULL, NULL, NULL, '2025-01-15 02:04:44', '2025-01-15 02:04:44'),
(31, 'Joanie', 'joanie@gmail.com', NULL, '$2y$12$Qy9a30bH5gvb2loTasFU2esAKcpJ6OQOKSfIzIaZYfG0Ls207UW6C', NULL, NULL, NULL, '2025-01-15 02:04:44', '2025-01-15 02:04:44'),
(32, 'Genesis', 'genesis@gmail.com', NULL, '$2y$12$pl8SuTEO8yIy2J3oQ73WMOZTocMhhnZWSS5aeCXB8JIZOdgDMXVjO', NULL, NULL, NULL, '2025-01-15 02:04:44', '2025-01-15 02:04:44'),
(33, 'Sunny', 'sunny@gmail.com', NULL, '$2y$12$6BgqRHpN5PxpRw4gLMfNz.to16bHe0yJhmM8qZww2fbFWTjXqogTi', NULL, NULL, NULL, '2025-01-15 02:04:45', '2025-01-15 02:04:45'),
(34, 'Vicente', 'vicente@gmail.com', NULL, '$2y$12$KBY88OqFLkQiC8MLeXuGW.ybILwh2dp2KkRyoerEGgOGgo93f9X5m', NULL, NULL, NULL, '2025-01-15 02:04:45', '2025-01-15 02:04:45'),
(35, 'Bradford', 'bradford@gmail.com', NULL, '$2y$12$b53QcsM0xEnJlNiJg89YUuOIPGDt4VnqEiEJXBtScc/UXawsqWkeG', NULL, NULL, NULL, '2025-01-15 02:04:45', '2025-01-15 02:04:45'),
(36, 'Don', 'don@gmail.com', NULL, '$2y$12$2Z8qrKn6OuwjK/MFGjqFguad/uBGrayW1fYRvJvdMh2j1McDO3W4W', NULL, NULL, NULL, '2025-01-15 02:05:12', '2025-01-15 02:05:12'),
(37, 'Laney', 'laney@gmail.com', NULL, '$2y$12$X5KrLlYPOeFs4QAKD0iKEOIM3ZmdsClYY3X07lHiGti.XKBEwehRW', NULL, NULL, NULL, '2025-01-15 02:05:12', '2025-01-15 02:05:12'),
(38, 'Fannie', 'fannie@gmail.com', NULL, '$2y$12$V1zVBPw82D5Pva3gj7Fw3eM2lwkA1GqzKpVb1niTJ2/ZFjd06lHl.', NULL, NULL, NULL, '2025-01-15 02:05:13', '2025-01-15 02:05:13'),
(39, 'Nova', 'nova@gmail.com', NULL, '$2y$12$wjL7jM/4GlmD6vqqQbanEuE3BkIQDzpbqfkqbwddQn3QvEu9HLvGS', NULL, NULL, NULL, '2025-01-15 02:05:13', '2025-01-15 02:05:13'),
(40, 'Zander', 'zander@gmail.com', NULL, '$2y$12$EtSJT2UOe3L4yO3qAItK8ucq5u7BHerCT93ynwBp3cgV8fQ12GrdG', NULL, NULL, NULL, '2025-01-15 02:05:14', '2025-01-15 02:05:14'),
(41, 'Alexanne', 'alexanne@gmail.com', NULL, '$2y$12$SvsP3ANVPFsRWddoj74mMe2Wywbt/AyIJTnKIvRdx.UAWLwryhPCS', NULL, NULL, NULL, '2025-01-15 02:05:33', '2025-01-15 02:05:33'),
(42, 'Aisha', 'aisha@gmail.com', NULL, '$2y$12$FCbVt2CN0WRU.cPKf25qTOleD9QYXAArSFNU/H6MHImJwiT44npNq', NULL, NULL, NULL, '2025-01-15 02:05:34', '2025-01-15 02:05:34'),
(43, 'Meghan', 'meghan@gmail.com', NULL, '$2y$12$i/LLH5cr7YSwzPSPp9VY/.ck3pYwiNDTQzPYyj51tAhluzlzH5LXO', NULL, NULL, NULL, '2025-01-15 02:05:34', '2025-01-15 02:05:34'),
(44, 'Earline', 'earline@gmail.com', NULL, '$2y$12$BCkybQ2ISFO1BB/tojmlJOOjZnr2ffm3T9rSEqEbuMW6Z3G184Dye', NULL, NULL, NULL, '2025-01-15 02:05:34', '2025-01-15 02:05:34'),
(45, 'Ismael', 'ismael@gmail.com', NULL, '$2y$12$5wmdCvfbVFoJwXvAuAI3.u7Y1D1trg3Lw/Z8D0f0cwmgMgGUNQcm.', NULL, NULL, NULL, '2025-01-15 02:05:34', '2025-01-15 02:05:34'),
(46, 'Malvina', 'malvina@gmail.com', NULL, '$2y$12$IBrGMBHEe9dVSwSNMZk7Y.Ng.M4ugAr5qVEawbfyf9Q3ZL9/q6vK2', NULL, NULL, NULL, '2025-01-15 02:05:35', '2025-01-15 02:05:35'),
(47, 'Arlene', 'arlene@gmail.com', NULL, '$2y$12$ktxArQglOKH9SyFlGSCaAety4kRYQ.Rbhl6QzyH.LXSGpM3H4iw3a', NULL, NULL, NULL, '2025-01-15 02:05:35', '2025-01-15 02:05:35'),
(48, 'Estel', 'estel@gmail.com', NULL, '$2y$12$N1ZT5QlGgVnAjefG3gLZM.FUKpNC8QlxYfBShTj7I4DzQJD6Xi25e', NULL, NULL, NULL, '2025-01-15 02:05:35', '2025-01-15 02:05:35'),
(49, 'Darwin', 'darwin@gmail.com', NULL, '$2y$12$TlIOl4RyzOY.VEMrNOVEDOrFmwL6aeo8dTEmk0XBacTs77AFclOe.', NULL, NULL, NULL, '2025-01-15 02:05:35', '2025-01-15 02:05:35'),
(50, 'Verner', 'verner@gmail.com', NULL, '$2y$12$7wRhRhDrHQLqy/vRs8f6iuvYMg1LQNjChECmYBnPqp6QnYJASwIgS', NULL, NULL, NULL, '2025-01-15 02:05:35', '2025-01-15 02:05:35'),
(51, 'Gisselle', 'gisselle@gmail.com', NULL, '$2y$12$Clmuogql9Kof/uT8s38WXubUV7Vlw8l/Z0z90Rp9o75LAEIGzQAci', NULL, NULL, NULL, '2025-01-15 02:05:48', '2025-01-15 02:05:48'),
(52, 'Johnnie', 'johnnie@gmail.com', NULL, '$2y$12$Ho4I6XhCjSLbYoZTNtBLD.PDeQwr3LeG5KtM2B0/jAewQQbMHq49m', NULL, NULL, NULL, '2025-01-15 02:05:48', '2025-01-15 02:05:48'),
(53, 'Sibyl', 'sibyl@gmail.com', NULL, '$2y$12$3J2UwDgMK9SUEC1GOZZ4GOrxDm/bYJ1FVu9J9RyRP4Xk8S/wH3wfa', NULL, NULL, NULL, '2025-01-15 02:05:48', '2025-01-15 02:05:48'),
(54, 'Esther', 'esther@gmail.com', NULL, '$2y$12$q3zZxkBHyQjyt1WqBe50lecHn0PU5RgG5NbIAN1Aq8.C4CJcJtT9e', NULL, NULL, NULL, '2025-01-15 02:05:49', '2025-01-15 02:05:49'),
(55, 'Rosemary', 'rosemary@gmail.com', NULL, '$2y$12$XpgOPB2a5XlxGHFTNHEtoend9SGcj.cT4SAaf/M49XtKDG3CwyLyO', NULL, NULL, NULL, '2025-01-15 02:05:49', '2025-01-15 02:05:49'),
(56, 'Jonatan', 'jonatan@gmail.com', NULL, '$2y$12$hsDjGsI4UUoZKqvipvxFdO289YhOYtGxVrdkZIIc/uLZ/BvjPZ1qG', NULL, NULL, NULL, '2025-01-15 02:05:50', '2025-01-15 02:05:50'),
(57, 'Emelia', 'emelia@gmail.com', NULL, '$2y$12$ohvMVM.hxwUk.JfVjnx3m.XBOfGMBi2f8bKwruC1IWB7aAciJjpWi', NULL, NULL, NULL, '2025-01-15 02:05:50', '2025-01-15 02:05:50'),
(58, 'Cleora', 'cleora@gmail.com', NULL, '$2y$12$RDhC4/Xjj3TPoNL8CpQgN.wjIZd5N/QkneRsNR7zblzSCWHcLkjTK', NULL, NULL, NULL, '2025-01-15 02:05:50', '2025-01-15 02:05:50'),
(59, 'Stanton', 'stanton@gmail.com', NULL, '$2y$12$C2Cfe0dArDeqtGNIyDhhDe7wnH3OtHakBDvGrRfeHJGsJTx/rWr.e', NULL, NULL, NULL, '2025-01-15 02:05:51', '2025-01-15 02:05:51'),
(60, 'Kavon', 'kavon@gmail.com', NULL, '$2y$12$Qvzgn94Y..MMS445YlF/QeUEcnnNvueIcNoh77gqMg3KlCDW8g.yS', NULL, NULL, NULL, '2025-01-15 02:05:51', '2025-01-15 02:05:51'),
(61, 'Quincy', 'quincy@gmail.com', NULL, '$2y$12$34weXPv7W9G7u.mx7z6zTuaGkGE3vYuzU0ypb3LEEKatc/ODXepoW', NULL, NULL, NULL, '2025-01-15 02:05:51', '2025-01-15 02:05:51'),
(62, 'Tate', 'tate@gmail.com', NULL, '$2y$12$AigZutOuuEhCUWcRj7xcAO/jTiVZrV414/SYCo2rdpN2jwuUIEMlC', NULL, NULL, NULL, '2025-01-15 02:05:52', '2025-01-15 02:05:52'),
(63, 'Geo', 'geo@gmail.com', NULL, '$2y$12$mzV3u1PH9NpnUPYWaLiereo65x4nPKwZTOyCdqIGi3nJM9gXFAZM.', NULL, NULL, NULL, '2025-01-15 02:05:52', '2025-01-15 02:05:52'),
(64, 'Daryl', 'daryl@gmail.com', NULL, '$2y$12$xuk1p0Y533.oYzME6h7gl.sChojVuy2nvXYtW8ivb/g1XzdQ7cnYW', NULL, NULL, NULL, '2025-01-15 02:05:52', '2025-01-15 02:05:52'),
(65, 'Elza', 'elza@gmail.com', NULL, '$2y$12$gS2JTBlSJwaooNR8vB.dKOq1TkLo.zwgBGoFcQm/VVZK5Jt8xQfaC', NULL, NULL, NULL, '2025-01-15 02:05:53', '2025-01-15 02:05:53'),
(66, 'Ethelyn', 'ethelyn@gmail.com', NULL, '$2y$12$WuiQgdX.5GcLYKasCnATnu8RD2u28RexXBcPw4DpXX1gr/75BcHn2', NULL, NULL, NULL, '2025-01-15 02:05:53', '2025-01-15 02:05:53'),
(67, 'Carroll', 'carroll@gmail.com', NULL, '$2y$12$0RjA4izDxd2PwAnvD0/IEONWTQPAH53YOkOFBc7QtYTJQtRTO3p9e', NULL, NULL, NULL, '2025-01-15 02:05:54', '2025-01-15 02:05:54'),
(68, 'Susana', 'susana@gmail.com', NULL, '$2y$12$AEjbxNxr9VVzGMp7bQ/LH.zXZwKnuUwmtMdgc5BN/aPQqUe.5h6O6', NULL, NULL, NULL, '2025-01-15 02:05:54', '2025-01-15 02:05:54'),
(69, 'Alex', 'alex@gmail.com', NULL, '$2y$12$quw3q0iLQg4j4mshiwZdWuAqy8.PfblN5CwrU2/ZKaHKqNS0VUUDq', NULL, NULL, NULL, '2025-01-15 02:05:54', '2025-01-15 02:05:54'),
(70, 'Izabella', 'izabella@gmail.com', NULL, '$2y$12$OswhzUHJoDmYypkV8eir3upBpJ6FAM6jH92dr4dlqzmM1g5NXs2S2', NULL, NULL, NULL, '2025-01-15 02:05:55', '2025-01-15 02:05:55'),
(71, 'Lorenza', 'lorenza@gmail.com', NULL, '$2y$12$Dogm3xFNEx.SZ.6G4Agbqu7Rs8ZtuxACm/4w4xDxmlhOb29dTIPPO', NULL, NULL, NULL, '2025-01-15 02:05:55', '2025-01-15 02:05:55'),
(72, 'Dayna', 'dayna@gmail.com', NULL, '$2y$12$kqvCkgpMMm0SGO0k/QH9L.sydV/O6jJMwXUE8wKrmdFZSZJZyEIEi', NULL, NULL, NULL, '2025-01-15 02:05:55', '2025-01-15 02:05:55'),
(73, 'Maddison', 'maddison@gmail.com', NULL, '$2y$12$j/fQ1f95NdGP1PMs/bYavO4K8SfJEfB0qAim.mprG5CE32ic8FONW', NULL, NULL, NULL, '2025-01-15 02:05:56', '2025-01-15 02:05:56'),
(74, 'Anahi', 'anahi@gmail.com', NULL, '$2y$12$bnlyIIoDHttC13SuST4S4.4rGhTM/KXIZgVJTRcWuOGgn9M8cMu4y', NULL, NULL, NULL, '2025-01-15 02:05:56', '2025-01-15 02:05:56'),
(75, 'Jessy', 'jessy@gmail.com', NULL, '$2y$12$CKUbse3jYn6vDLAu7pKWW.GbQzhfW8YkeAqXRYp91O77gBKs4Mo.O', NULL, NULL, NULL, '2025-01-15 02:05:56', '2025-01-15 02:05:56'),
(76, 'Ryley', 'ryley@gmail.com', NULL, '$2y$12$EYh/91zvwBgMz9iY4LZAc.jtern3uVNe0Fon4lFXf39ZuAI0lm.bW', NULL, NULL, NULL, '2025-01-15 02:05:57', '2025-01-15 02:05:57'),
(77, 'Percival', 'percival@gmail.com', NULL, '$2y$12$ROK5VvyZcRPGM0JL/pBw4e8Wz29zF0F10/lwHMNyiCiHBbHILxIYO', NULL, NULL, NULL, '2025-01-15 02:05:57', '2025-01-15 02:05:57'),
(78, 'Zelda', 'zelda@gmail.com', NULL, '$2y$12$HfXsf01fML6vOAPAbeh8VO1khX.7rvZnr.7JH89AKuuY8f64f2Za.', NULL, NULL, NULL, '2025-01-15 02:05:58', '2025-01-15 02:05:58'),
(79, 'Jaclyn', 'jaclyn@gmail.com', NULL, '$2y$12$PfDjmFFJQqkGIub5JoO0je53OhbWeKwL3roBdV5jcDJiYDL0VvIBe', NULL, NULL, NULL, '2025-01-15 02:05:58', '2025-01-15 02:05:58'),
(80, 'Sonia', 'sonia@gmail.com', NULL, '$2y$12$sVY/vFl6kGm0wY/TtyIka./OM3f0iB3DU3GH2WWOodoRQcPcWgI1a', NULL, NULL, NULL, '2025-01-15 02:05:58', '2025-01-15 02:05:58'),
(81, 'Charity', 'charity@gmail.com', NULL, '$2y$12$BPMwmKtrRAofgoMfF8QVcezPIpLhgyKBLhRz5ZNbf2uiDtRAVlE/W', NULL, NULL, NULL, '2025-01-15 02:05:59', '2025-01-15 02:05:59'),
(82, 'Reilly', 'reilly@gmail.com', NULL, '$2y$12$akqbIujwOcfnZmySH9UCLOhnIonYlkBREZuV0mbogMcI4H9qlwfC2', NULL, NULL, NULL, '2025-01-15 02:05:59', '2025-01-15 02:05:59'),
(83, 'Augustus', 'augustus@gmail.com', NULL, '$2y$12$jBCZJqvBASqc3Xj1R3teHOfQ0c53orYM3wK2kMxC1610cdUNQSpNe', NULL, NULL, NULL, '2025-01-15 02:05:59', '2025-01-15 02:05:59'),
(84, 'Nico', 'nico@gmail.com', NULL, '$2y$12$yNwYetXwKOQoBRumqc.sWe5k/UFUrTfzyFlrwKjQ..eWol8cdrJ1O', NULL, NULL, NULL, '2025-01-15 02:06:00', '2025-01-15 02:06:00'),
(85, 'Ubaldo', 'ubaldo@gmail.com', NULL, '$2y$12$7XoUYADFCPqs/2Opm2WH.uWnQvCsAgh6G7n7X4Cxlovo6XJMuDlOu', NULL, NULL, NULL, '2025-01-15 02:06:00', '2025-01-15 02:06:00'),
(86, 'Kaycee', 'kaycee@gmail.com', NULL, '$2y$12$li1Ae87A6FcAsAAgyp1CYO6I3j5Hy2odhINHqQWxO3her2SoezcMC', NULL, NULL, NULL, '2025-01-15 02:06:00', '2025-01-15 02:06:00'),
(87, 'Henderson', 'henderson@gmail.com', NULL, '$2y$12$83u811C5tdKh5agxelGKn.uHt0X5zKgCPnWFXRg4Ak.xZBWjOHYTS', NULL, NULL, NULL, '2025-01-15 02:06:01', '2025-01-15 02:06:01'),
(88, 'Samson', 'samson@gmail.com', NULL, '$2y$12$XZsQyTHhBjulIPwufKd.bOYfQUxDuyO0MTeEOHTQX6FluJF3a2kHW', NULL, NULL, NULL, '2025-01-15 02:06:01', '2025-01-15 02:06:01'),
(89, 'Fiona', 'fiona@gmail.com', NULL, '$2y$12$Qv5neHQKQXX5ISUgvRM0uO3P6lnUqyCsIJd2mp0Tz8uXzbWGJOCki', NULL, NULL, NULL, '2025-01-15 02:06:02', '2025-01-15 02:06:02'),
(90, 'Layne', 'layne@gmail.com', NULL, '$2y$12$MF0YCW/ENah72KZuRVo5B.16l8scYXygR68o0ZpB3pbYTjF98Ceue', NULL, NULL, NULL, '2025-01-15 02:06:02', '2025-01-15 02:06:02'),
(91, 'Odessa', 'odessa@gmail.com', NULL, '$2y$12$1gVQ0JUoE4OT9oxWSyYMUeTwTOlufcmrpYI7DbWXKuP240vfhjtPS', NULL, NULL, NULL, '2025-01-15 02:06:02', '2025-01-15 02:06:02'),
(92, 'Bethany', 'bethany@gmail.com', NULL, '$2y$12$Uyo0JtmhpKN1X02oWS7GrOVyItlohhevh5kaAuzsqIO..EZLDTSaG', NULL, NULL, NULL, '2025-01-15 02:06:02', '2025-01-15 02:06:02'),
(93, 'Shad', 'shad@gmail.com', NULL, '$2y$12$F5rBy4zRzj0lJlP5vYxh6.KI.11UqyWMb6z7XZ/YceBcfliIDgKxi', NULL, NULL, NULL, '2025-01-15 02:06:03', '2025-01-15 02:06:03'),
(94, 'Jovanny', 'jovanny@gmail.com', NULL, '$2y$12$T4CJAlVIVYhPxRJ.iQSlEefAaG902I.jJ2liOPu8Ts6I1XIFhcHpa', NULL, NULL, NULL, '2025-01-15 02:06:03', '2025-01-15 02:06:03'),
(95, 'Enid', 'enid@gmail.com', NULL, '$2y$12$yQjlMYv9XAcWSVu93ksbBOFuc.SgAwrI6qVbDGfE4W8pSJVJdF1i6', NULL, NULL, NULL, '2025-01-15 02:06:03', '2025-01-15 02:06:03'),
(96, 'Boris', 'boris@gmail.com', NULL, '$2y$12$8Y94yI1yrFphA2pxNhXv9.0wPTP50o2LAMSLioJFiH8hA0zyU2N6O', NULL, NULL, NULL, '2025-01-15 02:06:03', '2025-01-15 02:06:03'),
(97, 'Jazmin', 'jazmin@gmail.com', NULL, '$2y$12$jKhn5kkLqbfQqxsI9soT8uGsZeajeQtTEbYouRCbjaUEjyX0PsalS', NULL, NULL, NULL, '2025-01-15 02:06:04', '2025-01-15 02:06:04'),
(98, 'Jalon', 'jalon@gmail.com', NULL, '$2y$12$IDp7kVXHxwV.RBYTA5u9nO740H2shqB0QMFP/Ou3utFjGuJIYUx0W', NULL, NULL, NULL, '2025-01-15 02:06:04', '2025-01-15 02:06:04'),
(99, 'Myah', 'myah@gmail.com', NULL, '$2y$12$aUw8oxPBwNzXp3x9BR/B8.a4KRcqWX9EqrEh0wrlK0OuRIzYEaCV6', NULL, NULL, NULL, '2025-01-15 02:06:04', '2025-01-15 02:06:04'),
(100, 'Chad', 'chad@gmail.com', NULL, '$2y$12$eQO6iElBfj5q21c5jQkzpO70JFyrEiHULLqJfIdprUkLXuaoD9m4i', NULL, NULL, NULL, '2025-01-15 02:06:05', '2025-01-15 02:06:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_post_id_foreign` (`post_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT untuk tabel `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
