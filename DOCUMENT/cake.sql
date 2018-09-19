/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : cake

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 19/09/2018 20:03:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` int(100) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `defaultaddress` bit(1) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `fk_address_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_address_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `apwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `ctime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `cpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cnote` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cstate` bit(1) NOT NULL DEFAULT b'0',
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_card_theme1_idx`(`tid`) USING BTREE,
  INDEX `fk_card_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_card_theme1` FOREIGN KEY (`tid`) REFERENCES `theme` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_card_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `etimestart` datetime(0) NOT NULL,
  `rule` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `etimeend` datetime(0) NOT NULL,
  PRIMARY KEY (`eid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for eventdetails
-- ----------------------------
DROP TABLE IF EXISTS `eventdetails`;
CREATE TABLE `eventdetails`  (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `qpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `discount` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`qid`) USING BTREE,
  INDEX `fk_eventdetails_event1_idx`(`eid`) USING BTREE,
  INDEX `fk_eventdetails_products1_idx`(`pid`) USING BTREE,
  CONSTRAINT `fk_eventdetails_event1` FOREIGN KEY (`eid`) REFERENCES `event` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_eventdetails_products1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) NULL DEFAULT NULL,
  `laddress` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `details` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_location_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_location_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `oid` int(11) NOT NULL,
  `method` bit(1) NOT NULL DEFAULT b'0',
  `state` int(11) NOT NULL,
  `note` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `fk_order_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_order_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `rid` int(11) NOT NULL,
  `rnum` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `fk_orderdetails_order1_idx`(`oid`) USING BTREE,
  INDEX `fk_orderdetails_products1_idx`(`pid`) USING BTREE,
  CONSTRAINT `fk_orderdetails_order1` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetails_products1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ppic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pprice` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pnum` int(11) NOT NULL,
  `occasion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taste` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `theme` bit(1) NOT NULL DEFAULT b'0',
  `dpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `xxpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vcontent` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vtime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `vstate` bit(1) NOT NULL DEFAULT b'0',
  `reply` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`vid`) USING BTREE,
  INDEX `fk_review_products1_idx`(`pid`) USING BTREE,
  INDEX `fk_review_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_review_products1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `ttime` datetime(0) NOT NULL,
  `tname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `text2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `text3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `headpic` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` int(11) NULL DEFAULT 0,
  `level` int(11) NULL DEFAULT 1,
  `sex` bit(1) NULL DEFAULT NULL,
  `birth` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Procedure structure for deleteproduct
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteproduct`;
delimiter ;;
CREATE PROCEDURE `deleteproduct`(id int)
begin
declare t_error int;
declare  continue handler for sqlexception set t_error = 1;
start transaction;

delete from review where pid = id;
delete from orderdetails where pid =id;
delete from eventdetails where pid = id;

if t_error = 1  then
		select concat('ok!' ,t_error);
       rollback;
ELSE
select t_error;
        commit;
END  IF;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
