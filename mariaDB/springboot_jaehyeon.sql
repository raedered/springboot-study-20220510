-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.7.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- springboot_jaehyeon 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `springboot_jaehyeon` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `springboot_jaehyeon`;

-- 테이블 springboot_jaehyeon.board_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_mst` (
  `board_code` int(11) NOT NULL AUTO_INCREMENT,
  `board_title` varchar(50) NOT NULL,
  `board_content` text NOT NULL,
  `board_writer` int(11) NOT NULL,
  `board_count` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`board_code`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springboot_jaehyeon.board_mst:~10 rows (대략적) 내보내기
DELETE FROM `board_mst`;
/*!40000 ALTER TABLE `board_mst` DISABLE KEYS */;
INSERT INTO `board_mst` (`board_code`, `board_title`, `board_content`, `board_writer`, `board_count`, `create_date`, `update_date`) VALUES
	(5, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:20', '2022-05-16 10:43:20'),
	(6, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:21', '2022-05-16 10:43:21'),
	(7, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:21', '2022-05-16 10:43:21'),
	(8, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:22', '2022-05-16 10:43:22'),
	(9, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:24', '2022-05-16 10:43:24'),
	(10, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:32', '2022-05-16 10:43:32'),
	(11, '첫 게시글', '안녕하세요.', 1, 0, '2022-05-16 10:43:32', '2022-05-16 10:43:32'),
	(12, 'aaaa', '1234', 1, 0, '2022-05-18 11:34:39', '2022-05-18 11:34:39'),
	(26, 'aaaa', 'aaaa', 1, 0, '2022-05-18 11:41:51', '2022-05-18 11:41:51'),
	(27, 'aaaa', 'aaaa', 1, 0, '2022-05-18 11:41:52', '2022-05-18 11:41:52');
/*!40000 ALTER TABLE `board_mst` ENABLE KEYS */;

-- 테이블 springboot_jaehyeon.user_dtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_dtl` (
  `user_code` int(11) NOT NULL AUTO_INCREMENT,
  `profile_img_url` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springboot_jaehyeon.user_dtl:~3 rows (대략적) 내보내기
DELETE FROM `user_dtl`;
/*!40000 ALTER TABLE `user_dtl` DISABLE KEYS */;
INSERT INTO `user_dtl` (`user_code`, `profile_img_url`, `create_date`, `update_date`) VALUES
	(1, NULL, '2022-05-24 12:58:59', '2022-05-24 12:58:59'),
	(2, NULL, '2022-05-24 12:59:27', '2022-05-24 12:59:27'),
	(3, 'ad3567af32e6448e8188b25f977b435b_img110.jpg', '2022-05-24 11:25:54', '2022-05-24 11:25:54'),
	(4, NULL, '2022-05-25 12:25:50', '2022-05-25 12:25:50');
/*!40000 ALTER TABLE `user_dtl` ENABLE KEYS */;

-- 테이블 springboot_jaehyeon.user_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_mst` (
  `user_code` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `oauth2_username` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `roles` varchar(50) NOT NULL,
  `provider` varchar(50) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`user_code`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springboot_jaehyeon.user_mst:~3 rows (대략적) 내보내기
DELETE FROM `user_mst`;
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
INSERT INTO `user_mst` (`user_code`, `email`, `name`, `username`, `oauth2_username`, `password`, `roles`, `provider`, `create_date`, `update_date`) VALUES
	(1, 'kjh991216@naver.com', '김재현', 'jaehyeon', NULL, '$2a$10$rXURJdGW7SntPW8wtP0o0uFsk2pUftXixwKipizSA.30ZUryOr0we', 'ROLE_USER,ROLE_MANAGER,ROLE_ADMIN', NULL, '2022-05-24 12:58:59', '2022-05-24 12:58:59'),
	(2, 'kjh991216@naver.com', '김재이', 'jaehyeon2', NULL, '$2a$10$qGWKSAtNlyE6pgOqB0OwheI2fZctFI.12ztAYWKgIyHYoNySPebvm', 'ROLE_USER', NULL, '2022-05-24 12:59:27', '2022-05-24 12:59:27'),
	(3, 'kjt250018@gmail.com', '김재현', 'aaa', 'google_100254730463524366238', '$2a$10$WmqyNx3UYCMspRPkx4FORu4lF3CCSy0fIdVbF39m6rp7VKcWHXOQq', 'ROLE_USER', 'google', '2022-05-24 11:25:54', '2022-05-24 11:25:54'),
	(4, 'kjh991216@naver.com', '김재현', 'naver_qKLuMw4UFUI0lHn5egwJwq9O1gmKHPNB0LBuasxmmto', 'naver_qKLuMw4UFUI0lHn5egwJwq9O1gmKHPNB0LBuasxmmto', '$2a$10$R3Udd0DUADLwEsGbqxuJtu2jAWE9JPjXmkFOvAL9ZIUujqdb2IJvu', 'ROLE_USER', 'naver', '2022-05-25 12:25:50', '2022-05-25 12:25:50');
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;

-- 트리거 springboot_jaehyeon.user_mst_after_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `user_mst_after_insert` AFTER INSERT ON `user_mst` FOR EACH ROW BEGIN
	INSERT into
		user_dtl
	VALUES(
		NEW.user_code,
		NULL,
		NOW(),
		NOW()
	);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
