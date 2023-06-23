-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 05:24 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crmdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add credentials', 6, 'add_credentials'),
(22, 'Can change credentials', 6, 'change_credentials'),
(23, 'Can delete credentials', 6, 'delete_credentials'),
(24, 'Can view credentials', 6, 'view_credentials'),
(25, 'Can add customer', 7, 'add_customer'),
(26, 'Can change customer', 7, 'change_customer'),
(27, 'Can delete customer', 7, 'delete_customer'),
(28, 'Can view customer', 7, 'view_customer'),
(29, 'Can add renewal', 8, 'add_renewal'),
(30, 'Can change renewal', 8, 'change_renewal'),
(31, 'Can delete renewal', 8, 'delete_renewal'),
(32, 'Can view renewal', 8, 'view_renewal'),
(33, 'Can add worksheet', 9, 'add_worksheet'),
(34, 'Can change worksheet', 9, 'change_worksheet'),
(35, 'Can delete worksheet', 9, 'delete_worksheet'),
(36, 'Can view worksheet', 9, 'view_worksheet'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user');

-- --------------------------------------------------------

--
-- Table structure for table `crm_credentials`
--

CREATE TABLE `crm_credentials` (
  `id` bigint(20) NOT NULL,
  `cust_id` varchar(254) NOT NULL,
  `cust_name` varchar(254) NOT NULL,
  `item` varchar(254) NOT NULL,
  `type` varchar(254) NOT NULL,
  `plateform` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `remark` varchar(254) NOT NULL,
  `status` varchar(254) NOT NULL,
  `cust_org` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crm_credentials`
--

INSERT INTO `crm_credentials` (`id`, `cust_id`, `cust_name`, `item`, `type`, `plateform`, `username`, `password`, `remark`, `status`, `cust_org`) VALUES
(1, 'EGDG002', 'Arnav', 'qwerty', 'Part', 'Google', 'arnavphukan', 'qwerty', 'Done', 'Okay', 'ABC');

-- --------------------------------------------------------

--
-- Table structure for table `crm_customer`
--

CREATE TABLE `crm_customer` (
  `id` bigint(20) NOT NULL,
  `cust_id` varchar(254) NOT NULL,
  `cust_name` varchar(254) NOT NULL,
  `cust_address` varchar(254) NOT NULL,
  `cust_con_per` varchar(254) NOT NULL,
  `cust_mobile` varchar(128) NOT NULL,
  `cust_tele` varchar(128) NOT NULL,
  `cust_whatsapp` varchar(128) NOT NULL,
  `cust_email` varchar(254) NOT NULL,
  `cust_website` varchar(254) NOT NULL,
  `cust_gst` varchar(254) NOT NULL,
  `cust_city` varchar(254) NOT NULL,
  `cust_state` varchar(254) NOT NULL,
  `cust_country` varchar(254) NOT NULL,
  `cust_pin` int(11) NOT NULL,
  `cust_org` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crm_customer`
--

INSERT INTO `crm_customer` (`id`, `cust_id`, `cust_name`, `cust_address`, `cust_con_per`, `cust_mobile`, `cust_tele`, `cust_whatsapp`, `cust_email`, `cust_website`, `cust_gst`, `cust_city`, `cust_state`, `cust_country`, `cust_pin`, `cust_org`) VALUES
(1, 'EGDG001', 'Arnav ', 'Hatigaon', 'Anshuman', '7002533234', '7002533234', '7002533234', 'arnavphukan@gmail.com', 'www.easydigify.com', 'QWERTYUIOP12345', 'Ghy', 'Assam', 'India', 781038, 'Easy Digify'),
(2, 'EGDG002', 'Arnav', 'Hatigaon', 'Abc', '7002533234', '7002533234', '7002533234', 'ar@gmail.com', 'www.google.com', 'WAESEDFG1234', 'drgsac', 'xsatc', 'sva', 781024, 'ABC');

-- --------------------------------------------------------

--
-- Table structure for table `crm_renewal`
--

CREATE TABLE `crm_renewal` (
  `id` bigint(20) NOT NULL,
  `cust_id` varchar(254) NOT NULL,
  `cust_name` varchar(254) NOT NULL,
  `cust_org` varchar(254) NOT NULL,
  `product` varchar(254) NOT NULL,
  `rdc` date NOT NULL,
  `rde` date NOT NULL,
  `remark` varchar(254) NOT NULL,
  `status` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crm_renewal`
--

INSERT INTO `crm_renewal` (`id`, `cust_id`, `cust_name`, `cust_org`, `product`, `rdc`, `rde`, `remark`, `status`) VALUES
(1, 'EGDG002', 'Arnav', 'ABC', 'Abc', '2023-06-06', '2023-06-08', 'Done', 'Done'),
(2, 'EGDG001', 'Arnav Phukan', 'Easy Digify', 'Abc', '2023-06-06', '2023-06-08', 'Okay', 'Okay'),
(3, 'EGDG002', 'Arnav', 'ABC', 'Abc', '2023-06-05', '2023-06-11', 'Done', 'Okay');

-- --------------------------------------------------------

--
-- Table structure for table `crm_user`
--

CREATE TABLE `crm_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `is_create` tinyint(1) NOT NULL,
  `is_report` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_customer` tinyint(1) NOT NULL,
  `is_worksheet` tinyint(1) NOT NULL,
  `is_renewal` tinyint(1) NOT NULL,
  `is_credential` tinyint(1) NOT NULL,
  `is_cf` tinyint(1) NOT NULL,
  `is_wf` tinyint(1) NOT NULL,
  `is_rf` tinyint(1) NOT NULL,
  `is_crf` tinyint(1) NOT NULL,
  `is_cr` tinyint(1) NOT NULL,
  `is_wr` tinyint(1) NOT NULL,
  `is_crr` tinyint(1) NOT NULL,
  `is_rr` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crm_user`
--

INSERT INTO `crm_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `is_main`, `is_create`, `is_report`, `is_edit`, `is_customer`, `is_worksheet`, `is_renewal`, `is_credential`, `is_cf`, `is_wf`, `is_rf`, `is_crf`, `is_cr`, `is_wr`, `is_crr`, `is_rr`) VALUES
(1, 'pbkdf2_sha256$390000$egQkETWTPzZjwglXqsVeQw$9dB0GwEdoWY/YW23jSI/s8UxUNRBYmgumXAN8XFGM3E=', '2023-06-11 02:55:21.113099', 0, 'arnavphukan', '', '', 'arnavphukan2@gmail.com', 0, 1, '2023-06-08 14:24:54.000000', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'pbkdf2_sha256$390000$9U2mc3ymxndeZWx9Fmm978$abs3JHiOdCTITVQIAlbNXKoMt4FwmWERzxIcIQRqDcU=', '2023-06-08 14:43:51.301525', 1, 'admin', '', '', '', 1, 1, '2023-06-08 14:43:35.620409', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'pbkdf2_sha256$390000$eHeCz4bbxdbYP3Ah3YNeLs$HxqCkqHHtEqQ8Dyt+jNvHLj+IZodYXtjSTZe6mKrXec=', '2023-06-11 02:55:58.073841', 0, 'ashish', '', '', 'ashish@gmail.com', 0, 1, '2023-06-11 02:55:45.769309', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `crm_user_groups`
--

CREATE TABLE `crm_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_user_user_permissions`
--

CREATE TABLE `crm_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_worksheet`
--

CREATE TABLE `crm_worksheet` (
  `id` bigint(20) NOT NULL,
  `cust_id` varchar(254) NOT NULL,
  `work_id` varchar(254) NOT NULL,
  `cust_name` varchar(254) NOT NULL,
  `worktype` varchar(254) NOT NULL,
  `workprogress` varchar(254) NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `cust_org` varchar(254) NOT NULL,
  `current_date` date NOT NULL,
  `project_id` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crm_worksheet`
--

INSERT INTO `crm_worksheet` (`id`, `cust_id`, `work_id`, `cust_name`, `worktype`, `workprogress`, `remarks`, `cust_org`, `current_date`, `project_id`) VALUES
(1, 'EGDG001', 'W001', 'Arnav ', 'YES', 'YES', 'Done', 'Easy Digify', '2023-06-08', 'P001'),
(2, 'EGDG002', 'W002', 'Arnav', 'Done', 'Done', 'Done', 'ABC', '2023-06-08', 'P002');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-08 14:44:09.514246', '1', 'arnavphukan', 2, '[{\"changed\": {\"fields\": [\"Is customer\"]}}]', 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'crm', 'credentials'),
(7, 'crm', 'customer'),
(8, 'crm', 'renewal'),
(10, 'crm', 'user'),
(9, 'crm', 'worksheet'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-08 14:23:46.407543'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-06-08 14:23:47.241325'),
(3, 'auth', '0001_initial', '2023-06-08 14:23:50.444848'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-06-08 14:23:51.728099'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-06-08 14:23:51.759612'),
(6, 'auth', '0004_alter_user_username_opts', '2023-06-08 14:23:51.790854'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-06-08 14:23:51.853033'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-06-08 14:23:51.931263'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-06-08 14:23:52.009251'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-06-08 14:23:52.056111'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-06-08 14:23:52.102974'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-06-08 14:23:52.196703'),
(13, 'auth', '0011_update_proxy_permissions', '2023-06-08 14:23:52.243604'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-06-08 14:23:52.274947'),
(15, 'crm', '0001_initial', '2023-06-08 14:23:56.937111'),
(16, 'admin', '0001_initial', '2023-06-08 14:23:59.008435'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-06-08 14:23:59.133372'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-08 14:23:59.180516'),
(19, 'sessions', '0001_initial', '2023-06-08 14:23:59.617630');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9e58o8tt703gmd391u71rvkdabacprx2', '.eJxVjEsOwjAMBe-SNYocJ_2EJfueobIdhxZQKvWzQtydVuoCtm9m3tv0tK1Dvy0692MyV-PN5XdjkqeWA6QHlftkZSrrPLI9FHvSxXZT0tftdP8OBlqGvc7qvDiBnF0NoQUI2DbJBUZBAPaVakMSEYUqrgMhhpo5x5jB896YzxfXvDev:1q8BFG:TwNWclva1cUf0nYpnLG5Ntj22nwzOmpn3edfioLYH0U', '2023-06-25 02:55:58.173752'),
('rleeryxp9am007y6fs6zr9cijoqe6043', '.eJxVjEEOwiAQRe_C2pCBAgWX7j0DGWYGWzVtUtqV8e7apAvd_vfef6mM2zrkrcmSR1ZnZdTpdytID5l2wHecbrOmeVqXsehd0Qdt-jqzPC-H-3cwYBu-te-rp1g8ChoXLHSmQmct9BiJnA9RPDiuaDEl4OANCTAUJzWxScTq_QHVJTfx:1q7GZQ:wu3jydr5xly_LlXm8BdhfzwBcGBasOyeDVO77WMU_XI', '2023-06-22 14:25:00.745019');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `crm_credentials`
--
ALTER TABLE `crm_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_customer`
--
ALTER TABLE `crm_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_renewal`
--
ALTER TABLE `crm_renewal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_user`
--
ALTER TABLE `crm_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `crm_user_groups`
--
ALTER TABLE `crm_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_user_groups_user_id_group_id_56d4cc88_uniq` (`user_id`,`group_id`),
  ADD KEY `crm_user_groups_group_id_93d3047c_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `crm_user_user_permissions`
--
ALTER TABLE `crm_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm_user_user_permissions_user_id_permission_id_72b1e4e1_uniq` (`user_id`,`permission_id`),
  ADD KEY `crm_user_user_permis_permission_id_0f701f96_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `crm_worksheet`
--
ALTER TABLE `crm_worksheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_crm_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `crm_credentials`
--
ALTER TABLE `crm_credentials`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crm_customer`
--
ALTER TABLE `crm_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crm_renewal`
--
ALTER TABLE `crm_renewal`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crm_user`
--
ALTER TABLE `crm_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crm_user_groups`
--
ALTER TABLE `crm_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_user_user_permissions`
--
ALTER TABLE `crm_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_worksheet`
--
ALTER TABLE `crm_worksheet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `crm_user_groups`
--
ALTER TABLE `crm_user_groups`
  ADD CONSTRAINT `crm_user_groups_group_id_93d3047c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `crm_user_groups_user_id_5847c7a0_fk_crm_user_id` FOREIGN KEY (`user_id`) REFERENCES `crm_user` (`id`);

--
-- Constraints for table `crm_user_user_permissions`
--
ALTER TABLE `crm_user_user_permissions`
  ADD CONSTRAINT `crm_user_user_permis_permission_id_0f701f96_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `crm_user_user_permissions_user_id_047208b5_fk_crm_user_id` FOREIGN KEY (`user_id`) REFERENCES `crm_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_crm_user_id` FOREIGN KEY (`user_id`) REFERENCES `crm_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
