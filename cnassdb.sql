-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 02 mai 2024 à 22:23
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
  `Email` varchar(255) NOT NULL,
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

INSERT INTO `medecins` (`id`, `Nom`, `Prenom`, `role_id`, `id_specialite`, `HoraireConsultation`, `Tel`, `Email`, `AdresseCab`, `Motdepasse`, `Statut`, `created_at`, `updated_at`, `sexe`, `code`, `photo`) VALUES
(1, 'Doee', 'John', 3, 1, '9H-12H', '1234567890', 'medecin@example.com', 'dakar', '$2y$12$nNuCqE543q077lUxPYZZTuhe.1aQl3PgdViUUa5WbYHP7S32tgriu', '1', '2024-05-01 17:17:30', '2024-05-01 17:17:30', 'femme', 'tHs1WFdqiS', NULL),
(2, 'Doee', 'John', 3, 1, '9H-12H', '1234567890', 'johndoe@example.com', 'dakar', '$2y$12$8/YTw.eqLkOL41h9F7F58efAvY8PxmPfhhW/yK8b5FVDcgGKrngdS', '1', '2024-05-02 20:22:16', '2024-05-02 20:22:16', 'femme', '0KhE1zbnAe', NULL);

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
(18, '2024_05_02_194613_update_medecins_table', 13);

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
  `Email` varchar(255) NOT NULL,
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

INSERT INTO `patients` (`id`, `Nom`, `Prenom`, `role_id`, `DateNaissance`, `Tel`, `Email`, `Adresse`, `Motdepasse`, `Description`, `Antecedent`, `Statut`, `created_at`, `updated_at`, `sexe`, `code`, `photo`) VALUES
(1, 'Doe', 'John', 2, '1990-01-01', '1234567890', 'patient@example.com', 'dakar', '$2y$12$nNuCqE543q077lUxPYZZTuhe.1aQl3PgdViUUa5WbYHP7S32tgriu', 'Patient description', 'Patient antecedent', '1', '2024-05-01 17:16:38', '2024-05-01 17:16:38', 'femme', 'NfmHMJ3RpU', NULL);

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
(6, 'App\\Models\\Admin', 1, 'token', '6c3a80374cf972e5e86558d4893b7bc9b479fac91a661f52c94e980b0667d4d6', '[\"*\"]', '2024-05-01 19:18:48', NULL, '2024-05-01 19:12:54', '2024-05-01 19:18:48');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecins`
--
ALTER TABLE `medecins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
