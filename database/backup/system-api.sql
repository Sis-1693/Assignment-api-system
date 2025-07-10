-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2025 at 05:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(8, 'Admin User', 'salman@gmail.com', '$2y$12$ScFDdggryPdskHzIawGnFOSpzZSwEHFzi57iN3uVHWpHFOjNmPnOK', '2025-03-27 13:11:02', '2025-03-27 13:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 18, 1, '2025-03-26 09:41:08', '2025-03-28 12:26:12'),
(2, 1, 17, 7, '2025-03-26 09:41:35', '2025-03-26 09:41:35'),
(3, 1, 61, 2, '2025-03-26 09:45:40', '2025-03-28 12:24:45'),
(4, 1, 61, 7, '2025-03-26 09:45:53', '2025-03-26 09:45:53'),
(5, 1, 59, 3, '2025-03-26 09:47:20', '2025-03-26 09:47:20'),
(6, 1, 59, 3, '2025-03-26 09:47:55', '2025-03-26 09:47:55'),
(7, 1, 59, 3, '2025-03-26 10:01:50', '2025-03-26 10:01:50'),
(8, 1, 59, 3, '2025-03-26 10:01:52', '2025-03-26 10:01:52'),
(9, 1, 59, 3, '2025-03-26 10:01:55', '2025-03-26 10:01:55'),
(10, 1, 59, 3, '2025-03-27 07:44:06', '2025-03-27 07:44:06'),
(11, 1, 59, 3, '2025-03-27 07:45:49', '2025-03-27 07:45:49'),
(12, 1, 59, 7, '2025-03-27 07:45:56', '2025-03-27 07:45:56'),
(13, 1, 59, 7, '2025-03-27 07:46:45', '2025-03-27 07:46:45'),
(14, 1, 59, 33, '2025-03-27 08:13:20', '2025-03-27 08:13:20'),
(15, 1, 65, 3, '2025-03-27 08:13:46', '2025-03-27 08:13:46'),
(16, 1, 64, 1, '2025-03-28 12:18:17', '2025-03-28 12:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2025_03_26_121805_create_products_table', 1),
(18, '2014_10_12_000000_create_users_table', 2),
(19, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(20, '2019_08_19_000000_create_failed_jobs_table', 2),
(21, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(22, '2025_03_26_121805_create_product_images_table', 2),
(23, '2025_03_26_143738_create_cart_table', 3),
(24, '2025_03_26_143835_create_carts_table', 3),
(25, '2025_03_27_152915_create_orders_table', 4),
(26, '2025_03_27_153401_create_admins_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 100.00, 'completed', '2025-03-27 12:53:46', '2025-03-27 12:53:46'),
(2, 1, 100000.00, 'completed', '2025-03-27 12:54:45', '2025-03-27 12:54:45'),
(3, 1, 100000.00, 'completed', '2025-03-27 12:54:52', '2025-03-27 12:54:52'),
(4, 1, 100000.00, 'completed', '2025-03-27 22:55:05', '2025-03-27 22:55:05'),
(5, 1, 1000.00, 'completed', '2025-03-27 22:55:18', '2025-03-27 22:55:18'),
(6, 1, 1000.00, 'completed', '2025-03-28 12:02:11', '2025-03-28 12:02:11'),
(7, 1, 1000.00, 'completed', '2025-03-28 12:03:47', '2025-03-28 12:03:47'),
(8, 1, 1000.00, 'completed', '2025-03-28 12:04:04', '2025-03-28 12:04:04'),
(9, 1, 1000.00, 'completed', '2025-03-28 12:04:55', '2025-03-28 12:04:55'),
(10, 1, 1000.00, 'completed', '2025-03-28 12:05:44', '2025-03-28 12:05:44'),
(11, 1, 1000.00, 'completed', '2025-03-28 12:06:36', '2025-03-28 12:06:36'),
(12, 1, 1000.00, 'completed', '2025-03-28 12:17:51', '2025-03-28 12:17:51'),
(13, 1, 1000.00, 'completed', '2025-03-28 12:50:14', '2025-03-28 12:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(17, 'mobile form', 500000.00, '2025-03-26 07:38:27', '2025-03-26 07:38:27'),
(18, 'mobile form', 500000.00, '2025-03-26 07:42:20', '2025-03-26 07:42:20'),
(19, 'mobile form', 500000.00, '2025-03-26 07:42:28', '2025-03-26 07:42:28'),
(20, 'mobile form', 500000.00, '2025-03-26 07:42:52', '2025-03-26 07:42:52'),
(21, 'mobile form', 500000.00, '2025-03-26 07:49:31', '2025-03-26 07:49:31'),
(22, 'mobile form', 500000.00, '2025-03-26 07:50:35', '2025-03-26 07:50:35'),
(23, 'mobile form', 500000.00, '2025-03-26 07:50:45', '2025-03-26 07:50:45'),
(24, 'mobile form', 500000.00, '2025-03-26 07:55:59', '2025-03-26 07:55:59'),
(25, 'mobile form', 500000.00, '2025-03-26 07:56:23', '2025-03-26 07:56:23'),
(26, 'mobile form', 500000.00, '2025-03-26 07:56:41', '2025-03-26 07:56:41'),
(27, 'mobile form', 500000.00, '2025-03-26 07:58:19', '2025-03-26 07:58:19'),
(28, 'mobile form', 500000.00, '2025-03-26 08:02:58', '2025-03-26 08:02:58'),
(29, 'mobile form', 500000.00, '2025-03-26 08:03:20', '2025-03-26 08:03:20'),
(30, 'mobile form', 500000.00, '2025-03-26 08:07:28', '2025-03-26 08:07:28'),
(31, 'mobile form', 500000.00, '2025-03-26 08:07:43', '2025-03-26 08:07:43'),
(32, 'mobile form', 500000.00, '2025-03-26 08:08:28', '2025-03-26 08:08:28'),
(33, 'mobile form', 500000.00, '2025-03-26 08:09:59', '2025-03-26 08:09:59'),
(34, 'mobile form', 500000.00, '2025-03-26 08:11:33', '2025-03-26 08:11:33'),
(35, 'mobile form', 500000.00, '2025-03-26 08:13:09', '2025-03-26 08:13:09'),
(36, 'mobile form', 500000.00, '2025-03-26 08:14:32', '2025-03-26 08:14:32'),
(37, 'mobile form', 500000.00, '2025-03-26 08:15:51', '2025-03-26 08:15:51'),
(38, 'mobile form', 500000.00, '2025-03-26 08:17:19', '2025-03-26 08:17:19'),
(39, 'mobile form', 500000.00, '2025-03-26 08:21:39', '2025-03-26 08:21:39'),
(40, 'mobile form', 500000.00, '2025-03-26 08:21:53', '2025-03-26 08:21:53'),
(41, 'mobile form', 500000.00, '2025-03-26 08:25:07', '2025-03-26 08:25:07'),
(42, 'mobile form', 500000.00, '2025-03-26 08:26:18', '2025-03-26 08:26:18'),
(43, 'mobile form', 500000.00, '2025-03-26 08:26:42', '2025-03-26 08:26:42'),
(44, 'mobile form', 500000.00, '2025-03-26 08:27:06', '2025-03-26 08:27:06'),
(45, 'mobile form', 500000.00, '2025-03-26 08:28:59', '2025-03-26 08:28:59'),
(46, 'mobile form', 500000.00, '2025-03-26 08:30:50', '2025-03-26 08:30:50'),
(47, 'mobile form', 500000.00, '2025-03-26 08:31:23', '2025-03-26 08:31:23'),
(48, 'mobile form', 500000.00, '2025-03-26 08:32:45', '2025-03-26 08:32:45'),
(49, 'mobile form', 500000.00, '2025-03-26 08:33:32', '2025-03-26 08:33:32'),
(50, 'mobile form', 500000.00, '2025-03-26 08:36:24', '2025-03-26 08:36:24'),
(51, 'mobile form', 500000.00, '2025-03-26 08:36:41', '2025-03-26 08:36:41'),
(52, 'mobile form', 500000.00, '2025-03-26 08:40:32', '2025-03-26 08:40:32'),
(53, 'mobile form', 500000.00, '2025-03-26 08:41:35', '2025-03-26 08:41:35'),
(54, 'mobile form', 500000.00, '2025-03-26 08:42:01', '2025-03-26 08:42:01'),
(55, 'mobile form', 500000.00, '2025-03-26 08:44:31', '2025-03-26 08:44:31'),
(56, 'mobile form', 500000.00, '2025-03-26 08:48:44', '2025-03-26 08:48:44'),
(57, 'mobile form', 500000.00, '2025-03-26 08:50:02', '2025-03-26 08:50:02'),
(58, 'mobile form', 500000.00, '2025-03-26 08:50:29', '2025-03-26 08:50:29'),
(59, 'mobile form', 500000.00, '2025-03-26 08:59:00', '2025-03-26 08:59:00'),
(61, 'mobile form', 500000.00, '2025-03-26 09:05:19', '2025-03-26 09:05:19'),
(62, 'mobile form', 500000.00, '2025-03-26 09:18:13', '2025-03-26 09:18:13'),
(63, 'mobile form', 8888888.00, '2025-03-26 09:18:23', '2025-03-26 09:18:23'),
(64, 'TvLED', 30000.00, '2025-03-26 10:18:31', '2025-03-26 10:18:31'),
(65, 'TvLED', 30000.00, '2025-03-26 10:19:19', '2025-03-26 10:19:19'),
(66, 'TvLED', 30000.00, '2025-03-26 10:22:44', '2025-03-26 10:22:44'),
(67, 'TvLED', 30000.00, '2025-03-26 10:23:49', '2025-03-26 10:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`) VALUES
(1, 58, 'product_images/1742998829_salman.jpeg.jpeg'),
(2, 59, 'product_images/yTRI8wioz3vHDEHprGI8wu00Fbzbdy5OdCE1VZ2i.jpg'),
(3, 61, 'product_images/RLHqow3qENucaYJ4CJWl8yPQb3JcclhpJtu89nSw.jpg'),
(4, 61, 'product_images/OhDrgmKjtS6BwoWptUNArdMjCXwiWiTVRJwilisN.jpg'),
(5, 62, 'product_images/5r1DADqGE4sTduaOktF1Kw3sFBojGJlm6ce1Zf0T.jpg'),
(6, 62, 'product_images/OlSdC9s91TigpxQMwJkjb889gpVGmslqi2RettSH.jpg'),
(7, 63, 'product_images/sK8bDU0ibh6bE29leb4KUTF73wTXryreyTVNT2UD.jpg'),
(8, 63, 'product_images/gY5Wml1VOk0Y2p9FxWAJ95rsXg8mIUB2INEMdNi1.jpg'),
(9, 64, 'product_images/Ldp3iN9Zn1CSCtZ9wXDNFRDSoE7YEpbQsJhtrh5X.jpg'),
(10, 65, 'product_images/F7yfpM18Yn5Qbzov3eoqJrGvVCmUOkJVdDEnrPiG.jpg'),
(11, 65, 'product_images/2OMkSKhPOPV3Adn43eunxJmtAfQFqrcKIcgHpkNJ.jpg'),
(12, 66, 'product_images/L9148dzOjPpUbg6BE4vyWrt2EncL19qutPI7nd9e.jpg'),
(13, 67, 'product_images/yohQZbfmHo6k55ZT9cCb9SXXr3ZyeBK8AFl1PzmW.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', NULL, '$2y$12$ibUHNLhAbMoJfZVzR58iceDcUPDmHsQuUP2HrnniKPTvm6xdeGEEq', NULL, '2025-03-27 12:53:25', '2025-03-27 12:53:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
