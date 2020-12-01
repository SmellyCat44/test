/*
Navicat MySQL Data Transfer

Source Server         : SQW
Source Server Version : 50514
Source Host           : localhost:3306
Source Database       : ebtler1

Target Server Type    : MYSQL
Target Server Version : 50514
File Encoding         : 65001

Date: 2020-11-27 19:54:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addrinfo
-- ----------------------------
DROP TABLE IF EXISTS `addrinfo`;
CREATE TABLE `addrinfo` (
  `addr_id` int(11) NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `region` varchar(30) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `linkman` varchar(40) NOT NULL,
  `tel` varchar(40) NOT NULL,
  PRIMARY KEY (`addr_id`),
  KEY `FK_write` (`user_id`),
  CONSTRAINT `FK_write` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `p_id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `shop_id` varchar(20) NOT NULL,
  `o_id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `cmt_date` datetime DEFAULT NULL,
  `cmt_rank` varchar(10) DEFAULT NULL,
  `pic` longblob,
  `feedback` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_id`,`user_id`,`shop_id`,`o_id`),
  KEY `FK_comments2` (`user_id`),
  KEY `FK_comments3` (`shop_id`),
  KEY `FK_comments4` (`o_id`),
  CONSTRAINT `FK_comments4` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`),
  CONSTRAINT `FK_comments` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`),
  CONSTRAINT `FK_comments2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK_comments3` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `c_id` int(11) NOT NULL,
  `shop_id` varchar(20) DEFAULT NULL,
  `o_id` int(11) DEFAULT NULL,
  `c_mon` float NOT NULL,
  `c_start_date` datetime NOT NULL,
  `c_end_date` datetime NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_provide` (`shop_id`),
  KEY `FK_use` (`o_id`),
  CONSTRAINT `FK_use` FOREIGN KEY (`o_id`) REFERENCES `orders` (`o_id`),
  CONSTRAINT `FK_provide` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dscplan
-- ----------------------------
DROP TABLE IF EXISTS `dscplan`;
CREATE TABLE `dscplan` (
  `dsc_id` int(11) NOT NULL,
  `shop_id` varchar(20) DEFAULT NULL,
  `dsc_minus` float NOT NULL,
  `dsc_mon` float NOT NULL,
  `dsc_describe` varchar(100) NOT NULL,
  PRIMARY KEY (`dsc_id`),
  KEY `FK_grants` (`shop_id`),
  CONSTRAINT `FK_grants` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for have
-- ----------------------------
DROP TABLE IF EXISTS `have`;
CREATE TABLE `have` (
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mng_id` varchar(20) NOT NULL,
  `mng_name` varchar(20) NOT NULL,
  `mng_pwd` varchar(20) NOT NULL,
  PRIMARY KEY (`mng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `final_price` float NOT NULL,
  `dsc_sig` float NOT NULL,
  PRIMARY KEY (`o_id`,`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL,
  `dsc_id` int(11) DEFAULT NULL,
  `addr_id` int(11) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `row` float DEFAULT NULL,
  `mon` float DEFAULT NULL,
  `o_time` datetime DEFAULT NULL,
  `rq_time` datetime DEFAULT NULL,
  `o_status` varchar(20) DEFAULT NULL,
  `r_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for own
-- ----------------------------
DROP TABLE IF EXISTS `own`;
CREATE TABLE `own` (
  `user_id` varchar(20) NOT NULL,
  `c_id` int(11) NOT NULL,
  `shop_id` varchar(20) NOT NULL,
  `c_mon` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_due_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`c_id`,`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `p_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `p_name` varchar(20) NOT NULL,
  `p_price` float NOT NULL,
  `p_dsc_price` float NOT NULL,
  `p_image` longblob,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `type_id` int(11) NOT NULL,
  `shop_id` varchar(20) DEFAULT NULL,
  `type_name` varchar(40) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for riders
-- ----------------------------
DROP TABLE IF EXISTS `riders`;
CREATE TABLE `riders` (
  `r_id` varchar(20) NOT NULL,
  `r_name` varchar(40) NOT NULL,
  `r_date` date NOT NULL,
  `r_rank` varchar(30) NOT NULL,
  `r_pwd` varchar(20) NOT NULL,
  `r_balance` float NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rider_account
-- ----------------------------
DROP TABLE IF EXISTS `rider_account`;
CREATE TABLE `rider_account` (
  `r_id` varchar(20) NOT NULL,
  `o_id` int(11) NOT NULL,
  `r_acc_time` datetime NOT NULL,
  `r_cmmt` varchar(30) DEFAULT NULL,
  `r_income` float DEFAULT NULL,
  PRIMARY KEY (`r_id`,`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sell
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell` (
  `shop_id` varchar(20) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`shop_id`,`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` varchar(20) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `shop_briefintro` varchar(100) NOT NULL,
  `shop_addr` varchar(60) NOT NULL,
  `shkper_name` varchar(20) NOT NULL,
  `shop_pwd` varchar(20) NOT NULL,
  `shkper_tel` varchar(30) NOT NULL,
  `s_balance` float NOT NULL,
  `shop_portrait` longblob NOT NULL,
  `shop_image` longblob,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shop_account
-- ----------------------------
DROP TABLE IF EXISTS `shop_account`;
CREATE TABLE `shop_account` (
  `p_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `s_income` float DEFAULT NULL,
  `s_time` datetime NOT NULL,
  PRIMARY KEY (`p_id`,`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `user_pwd` varchar(16) NOT NULL,
  `user_name` varchar(40) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `user_tel` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `user_city` varchar(20) DEFAULT NULL,
  `reg_time` datetime NOT NULL,
  `is_vip` varchar(10) NOT NULL,
  `vip_due_date` datetime DEFAULT NULL,
  `u_balance` float NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vip_coupon
-- ----------------------------
DROP TABLE IF EXISTS `vip_coupon`;
CREATE TABLE `vip_coupon` (
  `mng_id` varchar(20) DEFAULT NULL,
  `vc_id` varchar(20) NOT NULL,
  `vc_start` datetime NOT NULL,
  `vc_due` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
