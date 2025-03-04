-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: m33133
-- Vytvořeno: Úte 04. bře 2025, 08:05
-- Verze serveru: 10.6.10-MariaDB
-- Verze PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `car_rental`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL DEFAULT '#000000',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `car_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `last_cost_addition` timestamp NULL DEFAULT NULL,
  `cost_description` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `ico` varchar(20) DEFAULT NULL,
  `dico` varchar(20) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `correspondence_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  `license_validity` date DEFAULT NULL,
  `id_card_number` varchar(50) DEFAULT NULL,
  `id_card_validity` date DEFAULT NULL,
  `id_card_photo` longblob DEFAULT NULL,
  `license_photo` longblob DEFAULT NULL,
  `contract` longblob DEFAULT NULL,
  `document` longblob DEFAULT NULL,
  `id_card_photo_front` longblob DEFAULT NULL,
  `id_card_photo_back` longblob DEFAULT NULL,
  `discount_percent` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `customer_documents`
--

CREATE TABLE `customer_documents` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `document` longblob DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `individual_price` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabulky `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `email` varchar(100) DEFAULT 'default@example.com',
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `customer_documents`
--
ALTER TABLE `customer_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexy pro tabulku `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `fk_customer` (`customer_id`);

--
-- Indexy pro tabulku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `customer_documents`
--
ALTER TABLE `customer_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
