-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 mai 2024 à 02:42
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cnassdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateurs`
--

CREATE TABLE `administrateurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `administrateurs`
--

INSERT INTO `administrateurs` (`id`, `nom`, `prenom`, `email`, `password`, `telephone`, `adresse`, `sexe`, `code`, `role_id`, `created_at`, `updated_at`, `statut`) VALUES
(1, 'Doe', 'John', 'admin@example.com', '$2y$12$b6ZCMX8lLQDV74dmeCoCDOMGQCRh1sHcx5HQ4BMPdG4Lrq.ncxMQW', '1234567890', '123 Rue de la Paix', 'homme', 'PbqNfwGhWT', 1, '2024-05-01 17:32:24', '2024-05-01 17:32:24', '1');

-- --------------------------------------------------------

--
-- Structure de la table `fiche_medical`
--

CREATE TABLE `fiche_medical` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_patient` int(10) UNSIGNED NOT NULL,
  `Poids` varchar(255) NOT NULL,
  `Taille` varchar(255) NOT NULL,
  `Tension` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiche_medical`
--

INSERT INTO `fiche_medical` (`id`, `id_patient`, `Poids`, `Taille`, `Tension`, `Description`, `created_at`, `updated_at`) VALUES
(1, 1, '75', '180', '120/80', 'Patient in good health, gained 5kg', '2024-05-13 15:14:07', '2024-05-13 15:16:20');

-- --------------------------------------------------------

--
-- Structure de la table `medecins`
--

CREATE TABLE `medecins` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `id_specialite` int(10) UNSIGNED NOT NULL,
  `HoraireConsultation` varchar(255) NOT NULL,
  `Tel` varchar(255) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `AdresseCab` varchar(255) NOT NULL,
  `Motdepasse` varchar(255) NOT NULL,
  `Statut` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sexe` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `medecins`
--

INSERT INTO `medecins` (`id`, `Nom`, `Prenom`, `role_id`, `id_specialite`, `HoraireConsultation`, `Tel`, `email`, `AdresseCab`, `Motdepasse`, `Statut`, `created_at`, `updated_at`, `sexe`, `code`, `photo`) VALUES
(5, 'diouf', 'babacar', 3, 8, '15H-18H', '774327640', 'mapaye999@gmail.com', 'fass mbao', '$2y$12$nNuCqE543q077lUxPYZZTuhe.1aQl3PgdViUUa5WbYHP7S32tgriu', '1', '2024-05-06 14:19:15', '2024-05-13 11:21:49', 'Homme', '6Prep4CKj7', '1715005154.png'),
(6, 'didier', 'raoult', 3, 1, '12H-18H', '123456788', 'medecin@etopys.com', 'paris', '$2y$12$nNuCqE543q077lUxPYZZTuhe.1aQl3PgdViUUa5WbYHP7S32tgriu', '1', '2024-05-13 12:02:08', '2024-05-13 12:02:08', 'Homme', 'NxJafdvESm', '1715601727.png'),
(7, 'diouf', 'maty', 3, 7, '15H-18H', '123456788', 'naxoven709@ahieh.com', 'paris', '$2y$12$dk/B7VvQ6JBCt/t.M7478eTTsvIE11PBt/cQmIm4ENQOomQ9aBwP.', '1', '2024-05-13 12:04:16', '2024-05-13 12:04:16', 'Homme', 'WDcqK4kXPl', '1715601856.png'),
(9, 'ndiaye', 'papa', 3, 9, '9H-18H', '3333333333333333333', 'karega6390@hisotyr.com', 'DAKAR', '$2y$12$4gon8O06oDZsHb6g9xKZTOq0ibDTBxv4Qslk9oPFxaU/SML3I4Sqm', '1', '2024-05-14 23:08:57', '2024-05-14 23:08:57', 'Homme', '9NHnKDxEGR', '1715728137.png'),
(11, 'ndiaye', 'papa', 3, 8, '9H-18H', '3333333333333333333', 'tesy@example.com', 'DAKAR', '$2y$12$C2LNzs63Eh.G5o2FRXGyuOzeZxzX0MU5bLmE4duinA1ZCq05sRJNS', '1', '2024-05-14 23:21:40', '2024-05-14 23:21:40', 'Homme', 'aQ4ZO9EDhj', '1715728900.png'),
(13, 'EMAIL', 'TEST', 3, 6, '12H-15H', '3333333333', 'vadin25582@godsigma.com', 'DAKAR', '$2y$12$.lk7oWzm8VoPPJ.YhcBzOemPyagfipCKWeXSp.AqLGSANGocyDbOm', '1', '2024-05-14 23:55:06', '2024-05-14 23:55:06', 'Homme', 'hQrwptzEoI', '1715730906.png');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_04_30_115751_add_specialites_table', 1),
(3, '2024_04_30_115935_add_patients_table', 1),
(4, '2024_04_30_120016_add_roles_table', 1),
(5, '2024_04_30_121111_add_medecins_table', 2),
(6, '2024_04_30_124320_add_fiche_medical_table', 3),
(7, '2024_04_30_164832_update_medecin_table', 4),
(8, '2024_04_30_164854_update_patients_table', 5),
(9, '2024_04_30_165539_update_roles_table', 5),
(10, '2024_05_01_163409_create-medecins_tables', 6),
(11, '2024_05_01_164315_delete_patients_and_fiche-medical_tables', 7),
(12, '2024_05_01_164612_create_patients_tables', 8),
(13, '2024_05_01_164555_create_fiche_medical_tables', 9),
(14, '2024_05_01_165730_update_patients_tables', 10),
(15, '2024_05_01_165827_update_medecins_tables', 10),
(16, '2024_05_01_170100_create_administrateurs_tables', 11),
(17, '2024_05_01_172304_update_administrateurs_tables', 12),
(18, '2024_05_02_194613_update_medecins_table', 13),
(19, '2024_05_14_221718_rename__email_in_patients', 14),
(20, '2024_05_14_230355_rename__email_in_medecins', 15),
(21, '2024_05_14_231851_rename__email_in_medecins', 16);

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `DateNaissance` date NOT NULL,
  `Tel` varchar(255) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Motdepasse` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Antecedent` varchar(255) NOT NULL,
  `Statut` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sexe` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id`, `Nom`, `Prenom`, `role_id`, `DateNaissance`, `Tel`, `email`, `Adresse`, `Motdepasse`, `Description`, `Antecedent`, `Statut`, `created_at`, `updated_at`, `sexe`, `code`, `photo`) VALUES
(1, 'faye', 'moussa', 2, '1990-01-01', '1234567890', 'patient@example.com', 'derkledd', '$2y$12$nNuCqE543q077lUxPYZZTuhe.1aQl3PgdViUUa5WbYHP7S32tgriu', 'test updatesssssss', 'non updatesss', '1', '2024-05-01 17:16:38', '2024-05-14 23:24:48', 'femme', 'NfmHMJ3RpU', '1714732435.jpg'),
(2, 'ndiaye', 'papa', 2, '2024-01-07', '776543020', 'pocifob335@ekposta.com', 'DAKAR', '$2y$12$QPJ71iOT.7yX0abXcU.7NODNjeu2XNJ0LrnVDK37IgM3LqRu2DVTC', 'malade', 'ALLERGIIIIESS3/05/2024 a ABASS NDAO en faace cto', '1', '2024-05-03 10:37:34', '2024-05-14 23:25:06', 'Femme', 'euBQ1z3Dm2', '1714732654.jpg'),
(3, 'faye', 'badza', 2, '2024-02-12', '776545410', 'vopoyef950@godsigma.com', 'DAKAR', '$2y$12$nNuCqE543q077lUxPYZZTuhe.1aQl3PgdViUUa5WbYHP7S32tgriu', 'MALAAAAAAADE tresssssssssssssssssssss', 'ALLERGIIIIESSALLERGIIIIESSALLERGIIIIESSALLERGIIIIESSv 3/05/2024 a dantek', '1', '2024-05-03 11:24:48', '2024-05-13 15:37:09', 'Homme', 'mT1fHCR0Ay', '1714735488.jpg'),
(7, 'GOJO', 'SATORU', 2, '2005-06-16', '890543321', 'gojo@gmail.com', 'SHIBUYA', '$2y$12$E4yA7FxrBSvcF8ru.ujSQeo5LNUdJowiD4dqZWp5nD7KDVMRH9QcW', 'JE SUIS LE SATORU', 'YEUX DE L\'INFINI 3/05/2024 a TOKYO', '1', '2024-05-08 00:31:37', '2024-05-08 00:31:37', 'Homme', '0DQK1UHL4Z', '1715128297.png'),
(12, 'ND', 'PAPA', 2, '1990-01-01', '1234567890', 'doe@example.com', 'dakar', '$2y$12$QGhMG9Yr/c4RWJx06vpPb.qxtqigpegGowgcrUGGZ5PUP6ePLvGJ2', 'Patient description', 'Patient antecedent', '1', '2024-05-14 23:01:39', '2024-05-14 23:01:39', 'HOMME', '5vmZhcygur', NULL),
(14, 'test', 'test', 2, '2018-03-14', '3333333333', 'fohog99414@ahieh.com', 'DAKAR', '$2y$12$o.bDqDG3ok5QAzZyRN3On.b/hqc9zCMgvFd0UHop60v4Q0m8xsHCK', 'the description', 'faiiible 3/05/2024 a TOKYO', '1', '2024-05-14 23:03:09', '2024-05-14 23:03:09', 'Homme', '57ciJvSQ9h', '1715727789.png'),
(18, 'email', 'test', 2, '2018-02-12', '3333333333333333333', 'mejape3068@facais.com', 'DAKAR', '$2y$12$m8SKgMBWF6JG7UvDHUyaeeoqgIsws56RMBmCnI3hu2ALmEkYuDShm', 'teste', 'teste 3/05/2024 a ABASS NDAO', '1', '2024-05-14 23:48:03', '2024-05-14 23:48:03', 'Homme', 'CSsJukGd7m', '1715730483.png');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
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
-- Déchargement des données de la table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Patient', 1, 'token', '8461ed3d2a2d27c34080f4f23fe880c3fb5574906f6474ecd13840abb86caa8f', '[\"*\"]', '2024-05-01 18:21:04', NULL, '2024-05-01 18:17:09', '2024-05-01 18:21:04'),
(2, 'App\\Models\\Patient', 1, 'token', '680b9e19e930df6dba47c3c9ba4863a3be7dce7d648d8825ce55684f68b96435', '[\"*\"]', '2024-05-01 18:23:01', NULL, '2024-05-01 18:21:40', '2024-05-01 18:23:01'),
(3, 'App\\Models\\Admin', 1, 'token', 'b1933c48f24f6c2f1272d06a73754cbb131d4fa3e584163b5defc4d67464174d', '[\"*\"]', '2024-05-01 18:24:47', NULL, '2024-05-01 18:24:38', '2024-05-01 18:24:47'),
(4, 'App\\Models\\Patient', 1, 'token', 'ae9ca85d1609c73fbc7bab071c6130d4f5730159ecd1acfa8a9e0957d3b8a2fb', '[\"*\"]', '2024-05-01 18:27:59', NULL, '2024-05-01 18:27:55', '2024-05-01 18:27:59'),
(5, 'App\\Models\\Medecin', 1, 'token', 'b319b99cb1c7298e3d87ccc75f78b7ae921034f65daed590178d4e57e9dd6f6e', '[\"*\"]', '2024-05-01 19:11:44', NULL, '2024-05-01 19:09:50', '2024-05-01 19:11:44'),
(6, 'App\\Models\\Admin', 1, 'token', '6c3a80374cf972e5e86558d4893b7bc9b479fac91a661f52c94e980b0667d4d6', '[\"*\"]', '2024-05-01 19:18:48', NULL, '2024-05-01 19:12:54', '2024-05-01 19:18:48'),
(7, 'App\\Models\\Patient', 1, 'token', '04de711bc06af84f8a60ebc00081dc95b0fb8a11e01dfcc0aa4f88228c51e9fd', '[\"*\"]', '2024-05-05 01:19:09', NULL, '2024-05-05 00:48:28', '2024-05-05 01:19:09'),
(8, 'App\\Models\\Patient', 1, 'token', '9a37522ec417c67f18fcbe8e85345576013d97491f96f29bc00f8eeb44b3d7ed', '[\"*\"]', '2024-05-05 03:15:18', NULL, '2024-05-05 00:52:59', '2024-05-05 03:15:18'),
(9, 'App\\Models\\Patient', 2, 'token', '4028525166e343329a9267e510cde2daa3ff273fa18a9ada4e79ea19d7c4553d', '[\"*\"]', NULL, NULL, '2024-05-05 02:56:02', '2024-05-05 02:56:02'),
(10, 'App\\Models\\Patient', 2, 'token', 'dfa6fdd5380c6e9430de56ffef765f23554daa09cbe7eb74571c789c5390d6ff', '[\"*\"]', '2024-05-05 03:15:17', NULL, '2024-05-05 02:56:14', '2024-05-05 03:15:17'),
(11, 'App\\Models\\Patient', 1, 'token', '07e8e02b4686da4c1fb47e9a48a7ab600b96aded1f12fa2e3ae12a7e130d2af7', '[\"*\"]', '2024-05-06 09:29:41', NULL, '2024-05-06 09:19:47', '2024-05-06 09:29:41'),
(12, 'App\\Models\\Patient', 1, 'token', 'c9b3700d87b95dd9616db61cf3aa97419f6e4a0aef806c3bcad69edffc397215', '[\"*\"]', '2024-05-06 10:46:19', NULL, '2024-05-06 09:29:45', '2024-05-06 10:46:19'),
(13, 'App\\Models\\Patient', 2, 'token', '3a7936f4009994bc32b52a7540364073342e1ff150c4c2d1848da5fe8296a06b', '[\"*\"]', '2024-05-06 10:41:59', NULL, '2024-05-06 10:41:17', '2024-05-06 10:41:59'),
(14, 'App\\Models\\Patient', 2, 'token', '79ec0e762671b5f8bd14012e76133639a3f71f9191dded754a8af4143abe65f1', '[\"*\"]', '2024-05-06 10:42:58', NULL, '2024-05-06 10:42:52', '2024-05-06 10:42:58'),
(15, 'App\\Models\\Patient', 1, 'token', '440fa82e072758a0bec302b49bf8549f2d5fd7ed6f572929ae5ffd176a5e9aac', '[\"*\"]', '2024-05-06 10:51:50', NULL, '2024-05-06 10:50:16', '2024-05-06 10:51:50'),
(16, 'App\\Models\\Patient', 1, 'token', 'a432cd98db9357c0c06a10c657e73ba1f0e860de7f2a49d9bd22d35ff7929991', '[\"*\"]', '2024-05-06 10:57:17', NULL, '2024-05-06 10:54:47', '2024-05-06 10:57:17'),
(17, 'App\\Models\\Patient', 1, 'token', '52a939037da9e71d8ab64e0c62903a9a446710b7da6dbd43c2b6f91e15cfce4e', '[\"*\"]', '2024-05-06 10:58:59', NULL, '2024-05-06 10:57:26', '2024-05-06 10:58:59'),
(18, 'App\\Models\\Patient', 3, 'token', '733827e5e8d5837b5d5a51709e5f542c56d3bf19795acd261a561184db9ed369', '[\"*\"]', '2024-05-06 11:08:16', NULL, '2024-05-06 11:01:28', '2024-05-06 11:08:16'),
(19, 'App\\Models\\Medecin', 4, 'token', 'eedddac8f2d0a266618d5c79f215c524e0f36adcb1fb59baaf68c91857574421', '[\"*\"]', NULL, NULL, '2024-05-06 11:22:13', '2024-05-06 11:22:13'),
(20, 'App\\Models\\Medecin', 4, 'token', '557342f0bc3863f2ccc98c1bc0d639a4be1d312c359b947299c0ccb91508457c', '[\"*\"]', NULL, NULL, '2024-05-06 11:22:27', '2024-05-06 11:22:27'),
(21, 'App\\Models\\Medecin', 4, 'token', '1312d7899219b0326d543f024b46e9a1db71e102e8a96b8d489bd79f7ec3af38', '[\"*\"]', '2024-05-06 11:23:54', NULL, '2024-05-06 11:23:17', '2024-05-06 11:23:54'),
(22, 'App\\Models\\Patient', 3, 'token', '4bfdbf5726ee1ee427cd7d442131ca52c13874e8494cfd62bf045a8c63b887c1', '[\"*\"]', '2024-05-06 11:24:08', NULL, '2024-05-06 11:23:56', '2024-05-06 11:24:08'),
(23, 'App\\Models\\Medecin', 4, 'token', 'c31b0f5d5d2f49dcca336d7bc2d25c680ac87fb12e783c6f127abab97d52e249', '[\"*\"]', '2024-05-06 11:28:10', NULL, '2024-05-06 11:24:31', '2024-05-06 11:28:10'),
(24, 'App\\Models\\Admin', 1, 'token', 'bb553c117be7217a07f9d9d23331c3de3d03c6fbb1ea3785afe7bedd6e405014', '[\"*\"]', '2024-05-06 11:30:29', NULL, '2024-05-06 11:29:05', '2024-05-06 11:30:29'),
(25, 'App\\Models\\Patient', 1, 'token', '5495caecbe1a6271d721e318a7d42f60384330d0746544bfe588fe5190667863', '[\"*\"]', '2024-05-06 11:36:42', NULL, '2024-05-06 11:36:28', '2024-05-06 11:36:42'),
(26, 'App\\Models\\Admin', 1, 'token', '6a6f18756492ef3c359c219fc9ec518c2ac888667a798dae3d9c3add49989fd9', '[\"*\"]', '2024-05-06 11:37:08', NULL, '2024-05-06 11:36:58', '2024-05-06 11:37:08'),
(27, 'App\\Models\\Medecin', 4, 'token', '610cd9b67765427f5772406c52238d3657873cc05246fde64f54b49b539eb833', '[\"*\"]', '2024-05-06 11:37:33', NULL, '2024-05-06 11:37:25', '2024-05-06 11:37:33'),
(28, 'App\\Models\\Medecin', 4, 'token', '4aacbf5cc3ae02a66794fd48a3eb311d65a20837248e81506a208e4bf5b634eb', '[\"*\"]', '2024-05-06 14:13:41', NULL, '2024-05-06 14:04:25', '2024-05-06 14:13:41'),
(29, 'App\\Models\\Medecin', 4, 'token', '98e0d581f91e698e2c8dcaf35e712f5a440589d3c42e547c8197a0a1edb77ca2', '[\"*\"]', '2024-05-06 14:37:56', NULL, '2024-05-06 14:37:45', '2024-05-06 14:37:56'),
(30, 'App\\Models\\Medecin', 5, 'token', '20deb32de691a8350c69a6ee7bed195b377b9c2208d1858aeba381bb4f32436d', '[\"*\"]', '2024-05-06 14:42:48', NULL, '2024-05-06 14:39:16', '2024-05-06 14:42:48'),
(31, 'App\\Models\\Medecin', 4, 'token', '9bfd27dc0785535b5ef20b9ed6c692ecac4de70230713d299269532444119bd3', '[\"*\"]', '2024-05-06 14:44:52', NULL, '2024-05-06 14:44:43', '2024-05-06 14:44:52'),
(32, 'App\\Models\\Medecin', 4, 'token', 'd7e8d5c372d6912d6cf46df99572f9d3b450b00cf4344b556073317e13c02371', '[\"*\"]', '2024-05-07 22:21:24', NULL, '2024-05-07 22:18:18', '2024-05-07 22:21:24'),
(33, 'App\\Models\\Admin', 1, 'token', 'c8806d4aacc911abcd3cc1d0677d7df74af42345a58b4434b1801f30c1b8194a', '[\"*\"]', '2024-05-07 22:43:49', NULL, '2024-05-07 22:41:46', '2024-05-07 22:43:49'),
(34, 'App\\Models\\Medecin', 4, 'token', '4ebd3ac7cc7be9ff6894b0e73467d89091686dfe5c88bc6f43dcabe8a408831d', '[\"*\"]', '2024-05-07 22:44:03', NULL, '2024-05-07 22:44:00', '2024-05-07 22:44:03'),
(35, 'App\\Models\\Admin', 1, 'token', 'f64f3772f0c7dd506782910406dc3dee81fd4ea88b87bce228cd35e33f2459cf', '[\"*\"]', '2024-05-08 00:13:29', NULL, '2024-05-07 23:02:01', '2024-05-08 00:13:29'),
(36, 'App\\Models\\Patient', 1, 'token', '6709973619b0eacb4ea088bb703e52f4537e7ab6e4d84cfe23799b9191ce0a32', '[\"*\"]', '2024-05-08 00:14:22', NULL, '2024-05-08 00:13:47', '2024-05-08 00:14:22'),
(37, 'App\\Models\\Admin', 1, 'token', '6f94d4d301c51d0619d304830cf00c75d6712cc2db160446934bd8506944ba20', '[\"*\"]', '2024-05-08 00:20:41', NULL, '2024-05-08 00:14:34', '2024-05-08 00:20:41'),
(38, 'App\\Models\\Patient', 1, 'token', '7e9e3775c006eadfb060dc68b05e3398e6a987c4f5cd1d2196179d29fdadfcb3', '[\"*\"]', '2024-05-08 00:22:00', NULL, '2024-05-08 00:20:55', '2024-05-08 00:22:00'),
(39, 'App\\Models\\Medecin', 4, 'token', '196788522974e6c286b2a179d19d3ad491d711f5bac86655ee56dbcbc05d47b3', '[\"*\"]', '2024-05-08 00:22:44', NULL, '2024-05-08 00:22:18', '2024-05-08 00:22:44'),
(40, 'App\\Models\\Patient', 7, 'token', '12e6523b63a56bdf3fa98e16be391e1b324bd89dd3d9cd350b19e07564735db3', '[\"*\"]', '2024-05-08 00:33:10', NULL, '2024-05-08 00:32:48', '2024-05-08 00:33:10'),
(41, 'App\\Models\\Admin', 1, 'token', '90ffb9052807130d6109f681e861542968d9bfaad54d44e2bd39c9b774646087', '[\"*\"]', '2024-05-08 11:21:18', NULL, '2024-05-08 00:33:24', '2024-05-08 11:21:18'),
(42, 'App\\Models\\Patient', 1, 'token', 'd21323e6e2e2aa187fd524b830333da7075bef7e8be6e19fef6e20386bb05b7d', '[\"*\"]', '2024-05-08 11:22:13', NULL, '2024-05-08 11:21:58', '2024-05-08 11:22:13'),
(43, 'App\\Models\\Medecin', 4, 'token', 'd0661638d042174781399f275eefdb2965507fd83f074f3c10600f9deefe3e63', '[\"*\"]', '2024-05-08 11:22:32', NULL, '2024-05-08 11:22:23', '2024-05-08 11:22:32'),
(44, 'App\\Models\\Admin', 1, 'token', '656d069957c55dbbfe02ee6c41cb888a7621efc533105b63a25bec322cdc640c', '[\"*\"]', '2024-05-08 11:30:12', NULL, '2024-05-08 11:22:41', '2024-05-08 11:30:12'),
(45, 'App\\Models\\Medecin', 4, 'token', 'f34aad89d2b8fc0204bd7e212bf0405ffb40cb33a074b11eb93c36ae979a1cfa', '[\"*\"]', '2024-05-08 12:56:39', NULL, '2024-05-08 11:31:11', '2024-05-08 12:56:39'),
(46, 'App\\Models\\Medecin', 4, 'token', '4ed01d192f824b4f412de40ed2af155e1ff08e073607833d93fd8ef4c11fc8c8', '[\"*\"]', '2024-05-08 16:16:56', NULL, '2024-05-08 13:02:37', '2024-05-08 16:16:56'),
(47, 'App\\Models\\Admin', 1, 'token', '13d9fa116dff0ee596428b29cd924b3742c63ad42953d59f6530374f9eb3134b', '[\"*\"]', '2024-05-08 16:33:39', NULL, '2024-05-08 16:17:10', '2024-05-08 16:33:39'),
(48, 'App\\Models\\Admin', 1, 'token', '6ba377e1df63325ba2deb54a56566ffd32611240fba3aa316f2de99fca6ea323', '[\"*\"]', '2024-05-08 16:46:44', NULL, '2024-05-08 16:33:46', '2024-05-08 16:46:44'),
(49, 'App\\Models\\Admin', 1, 'token', '44e7320f8f9622b7347602a4b28eb268edd218b0647818b765b7cbe2890fb9e6', '[\"*\"]', '2024-05-13 09:34:02', NULL, '2024-05-13 09:33:45', '2024-05-13 09:34:02'),
(50, 'App\\Models\\Medecin', 4, 'token', '29d8b065c03f856f4c0fa0c9e167698a7ea1f1f9df0eecbe27dbbb07985fb2a7', '[\"*\"]', '2024-05-13 09:37:21', NULL, '2024-05-13 09:34:22', '2024-05-13 09:37:21'),
(51, 'App\\Models\\Patient', 1, 'token', 'dae0e89af281e5b73a9347b71894fca80805c50471f98ea37d726cc42bd77eba', '[\"*\"]', '2024-05-13 09:42:12', NULL, '2024-05-13 09:37:35', '2024-05-13 09:42:12'),
(52, 'App\\Models\\Admin', 1, 'token', '28db83c726abae4d3730ba045c1a849b78e8d15837b09fad4dedab7fb0f3c428', '[\"*\"]', '2024-05-13 11:59:00', NULL, '2024-05-13 09:52:37', '2024-05-13 11:59:00'),
(53, 'App\\Models\\Admin', 1, 'token', 'a779d0a4e384bbeb86cb1a81fad10204e10ed27d76a23ab3ff760051bc931c83', '[\"*\"]', '2024-05-13 17:15:18', NULL, '2024-05-13 15:21:43', '2024-05-13 17:15:18'),
(54, 'App\\Models\\Admin', 1, 'token', '09e327762c8a258347cfee7b1679e731729b4cf42fa0910e183e400b854d5aeb', '[\"*\"]', '2024-05-14 21:41:09', NULL, '2024-05-14 21:40:32', '2024-05-14 21:41:09'),
(55, 'App\\Models\\Patient', 1, 'token', 'c263c40b895aaf366e4f73ff9cfff49b46a72edc38ecfc69bf4dd6089aada84f', '[\"*\"]', '2024-05-14 22:40:38', NULL, '2024-05-14 22:34:19', '2024-05-14 22:40:38'),
(56, 'App\\Models\\Patient', 1, 'token', '542a5111de21cb8c61e10d127bf8dc5d87d06c171b5b167381058cd9e83f00e1', '[\"*\"]', '2024-05-14 22:51:26', NULL, '2024-05-14 22:49:29', '2024-05-14 22:51:26'),
(57, 'App\\Models\\Patient', 1, 'token', '53dcd78d88e1a9cd1b7d1a6bb525647bf3d11696506d4e0b2ae95edc702070b8', '[\"*\"]', '2024-05-14 23:10:59', NULL, '2024-05-14 23:10:52', '2024-05-14 23:10:59'),
(58, 'App\\Models\\Admin', 1, 'token', 'e3eeda3db506f34c54d618130da4b71ba5e17601531ee7805db062704324b3b8', '[\"*\"]', '2024-05-14 23:20:30', NULL, '2024-05-14 23:11:08', '2024-05-14 23:20:30'),
(59, 'App\\Models\\Admin', 1, 'token', '6319e8ba704bbe19b9783d715d77014949edf51642f6f57581069bf253dce77f', '[\"*\"]', '2024-05-14 23:22:13', NULL, '2024-05-14 23:21:58', '2024-05-14 23:22:13'),
(60, 'App\\Models\\Patient', 1, 'token', '0c3f4c26965082f7dc331cba3d121d2e0479c26fd93cf2f81752d0153718446f', '[\"*\"]', '2024-05-14 23:22:30', NULL, '2024-05-14 23:22:24', '2024-05-14 23:22:30'),
(61, 'App\\Models\\Medecin', 6, 'token', 'cc227e240c66643445753251710e1abe576b58e672775c5d1d7fee226fc400ce', '[\"*\"]', '2024-05-14 23:25:20', NULL, '2024-05-14 23:23:43', '2024-05-14 23:25:20');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `Libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `Libelle`) VALUES
(1, 'Administrateur'),
(2, 'Patient'),
(3, 'Médecin');

-- --------------------------------------------------------

--
-- Structure de la table `specialites`
--

CREATE TABLE `specialites` (
  `id` int(10) UNSIGNED NOT NULL,
  `Libelle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specialites`
--

INSERT INTO `specialites` (`id`, `Libelle`) VALUES
(1, 'Généraliste'),
(2, 'Cardiologie'),
(3, 'Pédiatrie'),
(4, 'Gynécologie'),
(5, 'Chirurgie'),
(6, 'Ophtalmologie'),
(7, 'Dermatologie'),
(8, 'Neurologie'),
(9, 'Oncologie'),
(10, 'Orthopédie'),
(11, 'Psychiatrie');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateurs`
--
ALTER TABLE `administrateurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrateurs_role_id_foreign` (`role_id`);

--
-- Index pour la table `fiche_medical`
--
ALTER TABLE `fiche_medical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fiche_medical_id_patient_foreign` (`id_patient`);

--
-- Index pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medecins_role_id_foreign` (`role_id`),
  ADD KEY `medecins_id_specialite_foreign` (`id_specialite`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_role_id_foreign` (`role_id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `specialites`
--
ALTER TABLE `specialites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateurs`
--
ALTER TABLE `administrateurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fiche_medical`
--
ALTER TABLE `fiche_medical`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `medecins`
--
ALTER TABLE `medecins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `specialites`
--
ALTER TABLE `specialites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateurs`
--
ALTER TABLE `administrateurs`
  ADD CONSTRAINT `administrateurs_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `fiche_medical`
--
ALTER TABLE `fiche_medical`
  ADD CONSTRAINT `fiche_medical_id_patient_foreign` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`);

--
-- Contraintes pour la table `medecins`
--
ALTER TABLE `medecins`
  ADD CONSTRAINT `medecins_id_specialite_foreign` FOREIGN KEY (`id_specialite`) REFERENCES `specialites` (`id`),
  ADD CONSTRAINT `medecins_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
