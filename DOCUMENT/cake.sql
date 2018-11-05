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

 Date: 05/11/2018 18:54:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `defaultaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `fk_address_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_address_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '1', '555', 'sssw', '1', 1);
INSERT INTO `address` VALUES (2, '222', '22', '22', '0', 1);
INSERT INTO `address` VALUES (7, '1', '1', 'kkk', '0', 1);
INSERT INTO `address` VALUES (8, '1', '1', 'kkk', '0', 1);
INSERT INTO `address` VALUES (9, 'uuu', '7777', '嘎嘎嘎嘎', '1', 3);
INSERT INTO `address` VALUES (10, '9999', '7777', '应用于', '0', 3);
INSERT INTO `address` VALUES (11, '1', '1', 'kkk', 'lll', 1);
INSERT INTO `address` VALUES (12, '1', '18252588759', '苏州工业园区', '1', 12);
INSERT INTO `address` VALUES (13, '11', '11', '11', '0', 1);
INSERT INTO `address` VALUES (14, '黄明华', '15505179378', '苏州市工业园区松涛街', '0', 18);
INSERT INTO `address` VALUES (15, '11', '请求 1111', '1111', '0', 12);
INSERT INTO `address` VALUES (16, 'z\'z\'z', 'z\'z\'z', 'z\'z\'z', '0', 12);

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
  `cstate` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\0',
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_card_theme1_idx`(`tid`) USING BTREE,
  INDEX `fk_card_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_card_theme1` FOREIGN KEY (`tid`) REFERENCES `theme` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_card_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (1, '2018-09-11 15:50:15', '111', '好吃的', '0', 1, 1);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `size` int(11) NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `pno` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `cart1`(`pid`) USING BTREE,
  INDEX `cart2`(`uid`) USING BTREE,
  CONSTRAINT `cart1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 1, 1, 2);
INSERT INTO `cart` VALUES (2, 2, 2, 2, 2);
INSERT INTO `cart` VALUES (5, 2, 2, 2, 3);
INSERT INTO `cart` VALUES (18, 2, 1, 3, 5);
INSERT INTO `cart` VALUES (21, 2, 12, 3, 8);
INSERT INTO `cart` VALUES (22, 3, 12, 3, 1);
INSERT INTO `cart` VALUES (31, 2, 9, 1, 3);
INSERT INTO `cart` VALUES (36, 2, 7, 16, 3);
INSERT INTO `cart` VALUES (37, 2, 12, 16, 5);
INSERT INTO `cart` VALUES (38, 2, 12, 16, 2);
INSERT INTO `cart` VALUES (45, 3, 3, NULL, 1);
INSERT INTO `cart` VALUES (46, 2, 7, NULL, 1);
INSERT INTO `cart` VALUES (47, 2, 11, NULL, 1);
INSERT INTO `cart` VALUES (49, 2, 6, 18, 1);
INSERT INTO `cart` VALUES (62, 3, 12, NULL, 1);
INSERT INTO `cart` VALUES (70, 2, 2, NULL, 1);
INSERT INTO `cart` VALUES (71, 2, 12, 12, 2);
INSERT INTO `cart` VALUES (72, 2, 2, 12, 2);
INSERT INTO `cart` VALUES (73, 2, 23, 12, 1);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `collect1`(`pid`) USING BTREE,
  INDEX `collect2`(`uid`) USING BTREE,
  CONSTRAINT `collect1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `collect2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (166, 2, 12);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `fk_order_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_order_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '已完成', 12, '100', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (2, '待收货', 2, '200', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (3, '待评价', 1, 'jjj', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (4, '已完成', 12, 'jjj', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (5, '待评价', 1, 'jjj', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (8, '已完成', 12, 'jjj', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (9, '待评价', 12, '11', '苏州工业园区', '施宇', '18252588759');
INSERT INTO `order` VALUES (21, '待评价', 12, '3160', '33333', '11', '13433333333');
INSERT INTO `order` VALUES (22, '待收货', 12, '2925', '2222', '11', '18252588759');
INSERT INTO `order` VALUES (23, '已完成', 12, '2925', '333333', '111', '18252528875');
INSERT INTO `order` VALUES (24, '待收货', 12, '792', '水水水水水水', '始于', '18252588759');
INSERT INTO `order` VALUES (25, '待收货', 12, '2080', '及科技', '酷酷酷', '13256481546');
INSERT INTO `order` VALUES (26, '待收货', 12, '236', '22222222', '我的测试', '18252588759');

-- ----------------------------
-- Table structure for orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rnum` int(11) NULL DEFAULT NULL,
  `oid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`rid`) USING BTREE,
  INDEX `fk_orderdetails_order1_idx`(`oid`) USING BTREE,
  INDEX `fk_orderdetails_products1_idx`(`pid`) USING BTREE,
  CONSTRAINT `fk_orderdetails_order1` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderdetails_products1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 10, 1, 6);
INSERT INTO `orderdetails` VALUES (2, 1, 2, 2);
INSERT INTO `orderdetails` VALUES (3, 1, 3, 4);
INSERT INTO `orderdetails` VALUES (4, 1, 4, 1);
INSERT INTO `orderdetails` VALUES (5, 5, 7, 3);
INSERT INTO `orderdetails` VALUES (6, 2, 8, 9);
INSERT INTO `orderdetails` VALUES (7, 1, 2, 11);
INSERT INTO `orderdetails` VALUES (8, 1, 5, 11);
INSERT INTO `orderdetails` VALUES (10, 1, 9, 8);
INSERT INTO `orderdetails` VALUES (19, 8, 9, 4);
INSERT INTO `orderdetails` VALUES (20, 3, 21, 9);
INSERT INTO `orderdetails` VALUES (21, 3, 23, 9);
INSERT INTO `orderdetails` VALUES (22, 1, 23, 2);
INSERT INTO `orderdetails` VALUES (23, 2, 24, 12);
INSERT INTO `orderdetails` VALUES (24, 2, 24, 2);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ppic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pprice` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pnum` int(11) NOT NULL,
  `occasion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `taste` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\0',
  `dpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `xxpic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '尼诺熊', 'http://static.mcake.com/goods/ninuo/T0502/list/1.jpg', '298', 1, '2', '芝士', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-1.png', 'http://static.mcake.com/desc/Nino/pc.jpg', 'http://static.mcake.com/goods/ninuo/T0502/middle/1.jpg', 'A ce moment,laissez votre langue dominent votre joie.un parfum délicat de la crème .这一刻，让舌尖主宰你的私享。蓬松夹着鲜香淡雅，只融在口的浓浓芝香，填满心的另一半。', 'Quelle est l\'expression du visage de votre humeur? Doux Nino vous accompagner, une innocence enfantine. \r\n什么表情对你此刻心情？爱笑爱闹，暖心尼诺陪伴你，童心依旧。', 'http://static.mcake.com/goods/ninuo/T0502/middle/3.jpg');
INSERT INTO `products` VALUES (2, '君度可可', 'http://static.mcake.com/goods/jundukeke/M0601/list/1.jpg', '198', 1, '4', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-1.png', 'https://static.mcake.com/desc/jundukeke/pc.jpg', 'http://static.mcake.com/goods/jundukeke/M0601/middle/1.jpg', 'Une mousse au chocolat noir, un goût sucré et amer du 100% chocolat, avec un parfum de Cointreau.\r\n\r\n甜与苦从来不是永恒的对立，因为巧克力，更因为君度力娇 浓烈而温和，清凉却温暖', 'avons ajusté pour qu’il adapte au goût des asiatiques moins sucré.\r\n这是一款专为喜爱白巧克力人群创作，我们重新调配了白巧克力偏甜口感，使之更适合亚洲人口味的产品。', 'http://static.mcake.com/goods/jundukeke/M0601/middle/3.jpg');
INSERT INTO `products` VALUES (3, '柠•漾', 'http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/list_2024_1.jpg', '198', 1, '1', '水果', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-1.png', 'https://static.mcake.com/desc/ningyang/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/middle_2024_1.jpg', 'une gélée verte de menthe, le Mojito vous présente une harmonie entre l柠•漾，柔滑慕斯内蕴Q弹酒冻，绝妙配比带来口感的平衡，不太浓烈也不过于寡淡，青柠独特的酸甜带出白朗姆酒的微醺之意。', 'Les menthes fraîches, les citrons verts et le rhum blanc, tous les ingrédients du cocktail Mojito sont dans炎炎夏日，你是否渴望在沙滩的躺椅上享受一杯清凉的Mojito鸡尾酒呢？清凉的薄荷搭配酸爽的青柠，佐以纯正的白朗姆酒，为夏日带来无限清爽；“Mojito 柠•漾”不仅仅是一款蛋糕，更是一“杯”可以吃的Mojito鸡尾酒。', 'http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/middle_2024_3.jpg');
INSERT INTO `products` VALUES (4, '约瑟芬玫瑰', 'http://static.mcake.com/goods/yuesefenmeigui/T0399/list/1.jpg', '395', 1, '1', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-2.png', 'http://static.mcake.com/desc/yuesefenmeigui/pc.jpg', 'http://static.mcake.com/goods/yuesefenmeigui/T0399/middle/1.jpg', 'Des rosettes pour les amoureux, une histoire d’amour, une romance unique de toute la vie.见证无数情侣最甜蜜的一刻，从舌尖蔓延到心间的感动，今生今世唯一爱恋', 'Des rosettes pour les amoureux, une histoire d’amour, une romance unique de toute la vie. 巧克力&玫瑰花，见证无数情侣最甜蜜的一刻，从舌尖蔓延到心间的感动，今生今世唯一爱恋 。', 'http://static.mcake.com/goods/yuesefenmeigui/T0399/middle/3.jpg');
INSERT INTO `products` VALUES (5, ' Pink•罗赛特', 'http://static.mcake.com/goods/pinkluosaite/M0401/list/1.jpg', '318', 1, '1', '巧克力', '1', 'https://static.mcake.com/desc/pinkluosaite/pc.jpg', 'http://static.mcake.com/goods/pinkluosaite/M0401/middle/1.jpg', 'une fine gelée de framboise. Le Pink Rosette vous offrirait une expérience细腻软甜的玫瑰白巧克力慕斯邂逅酸爽的树莓啫喱于珍馐荔枝 色与味的双重盛宴', 'Un bouquet de roses et une branche de litchis au début de l’été, c’est le romantisme de Paris初夏的巴黎，一束玫瑰和一串新鲜饱满的荔枝，这就是法国特有的浪漫气息，粉色的巧克力将二者完美地聚合。', 'http://static.mcake.com/goods/pinkluosaite/M0401/middle/3.jpg');
INSERT INTO `products` VALUES (6, '蔓越莓红丝绒', 'http://static.mcake.com/goods/manyuemeihongsirong/C0301/list/1.jpg', '298', 1, '3', '芝士', '0', 'http://static.mcake.com/desc/manyuemeihongsirong/pc.jpg', 'http://static.mcake.com/goods/manyuemeihongsirong/C0301/middle/1.jpg', 'Dans la couleur de la paix et la confusion, la canneberge de haute qualité honore le parfum aristrocratique de l\'histoire. MCAKE/\r\n\r\n完美地复苏红丝绒蛋糕的传统和历史/ 并选用新鲜蔓越莓点缀其上/ 让贵族般的色香/再度氤氲美妙的午后', 'Gâteau célèbre créé chez Waldolf de New York,jamais absent aux tapis rouges des grands événements.\r\n原产自纽约华尔道夫的名品，每逢明星走红毯必会出现的角色。', 'http://static.mcake.com/goods/manyuemeihongsirong/C0301/middle/3.jpg');
INSERT INTO `products` VALUES (7, '百利派对', 'http://static.mcake.com/goods/bailipaidui/J0401/list/1.jpg', '233', 1, '4', '巧克力', '0', ' http://static.mcake.com/goods/bailipaidui/J0401/middle/1.jpg', ' http://static.mcake.com/goods/bailipaidui/J0401/middle/1.jpg', 'Mélange la crème et Bailay’s, rajouté un cout fine du chocolat blanc du Bruxelle Partagé来一场百利私享派对 奶油和威士忌的美妙融合，再加一点比利时白巧克力 感受着丝般顺滑的口感，分享与闺蜜专属的时间', 'Avec l’apparence de la plus grande simplicité,le dessert Baileys est la meilleure interprétationde l外型极致简约，少女对于恋爱憧憬，百利甜是完美的诠释。', 'http://static.mcake.com/goods/bailipaidui/J0401/middle/3.jpg');
INSERT INTO `products` VALUES (8, '蒸青抹茶', 'http://static.mcake.com/goods/zhenqingmocha/J0201/list/1.jpg', '244', 1, '4', '芝士', '1', 'http://static.mcake.com/desc/zhengqingmocha/pc.jpg', 'http://static.mcake.com/goods/zhenqingmocha/J0201/middle/1.jpg', 'du Japon, ce gâteau au thé vous donne un saveur extraodinaire qui représente la philosophie orientale\r\n\r\n在巴黎的街头回到自然的茶意翠语， 时尚与原生态微妙平衡，正如比利时白巧克力与顶级抹茶间的味觉语言 冲突，彼此的分明；融合，彼此的丰满。停下，聆听。', ' Inspirée de la France, la création esthétique de ce gâteau est fraîche et hors du commun.\r\n这是一款绿茶口味蛋糕，采用纯正手工研磨的绿茶粉制作，造型从时尚法国找到灵感，清新脱俗', 'http://static.mcake.com/goods/zhenqingmocha/J0201/middle/3.jpg');
INSERT INTO `products` VALUES (9, '百香果慕斯', 'http://static.mcake.com/goods/baixiangguomusi/R1602/list/1.jpg', '325', 1, '3', '慕斯', '1', 'https://static.mcake.com/desc/baixiangguomusi/pc.jpg', 'http://static.mcake.com/goods/baixiangguomusi/R1602/middle/1.jpg', ' l\'industrie alimentaire, elle combine deux saveurs et sent les dons naturels à travers la langue.\r\n\r\n165种果味，165个独白，1个表现形式，这便是百香果。与椰子慕斯的组合，是食物界的撞色，撮合两种味道，通过舌尖感知自然的馈赠。', 'Comme marcher dans le 7ème arrondissement de France, chaleureux et simple.\r\n甜是陷阱，酸是解药，两者中和后，是你与自己达成和解的致幻剂。如同漫步在法国第七街区，热烈又简约。', 'http://static.mcake.com/goods/baixiangguomusi/R1602/middle/3.jpg');
INSERT INTO `products` VALUES (10, '魔鬼中的天使', 'http://static.mcake.com/goods/moguizhongdetianshi/R1330/list/1.jpg', '189', 1, '1', '巧克力', '\0', 'http://static.mcake.com/desc/moguizhongdetianshi/pc.jpg', 'http://static.mcake.com/goods/moguizhongdetianshi/R1330/middle/1.jpg', 'Crème soyeuse au chocolat,faufiler dans le gâteau.Chocolat noir importé, est un piège du diable幼滑的巧克力奶油夹心，悄悄地潜入松软的蛋糕里。进口黑巧克力，埋下魔鬼陷阱；细腻微苦的口感，让味蕾步步沦陷。', 'Quand le soleil se couche, les petits fantômes sortent.Un festin d\'amertume et de douceur, le noir et blanc a commencé.Diable et Ange deux camps, de quel côté vous choisissez? \r\n太阳下班，萌鬼囧神出没。一场苦与甜、黑与白的饕餮之宴降临，魔鬼与天使两个阵营，吃货该站哪边？', 'http://static.mcake.com/goods/moguizhongdetianshi/R1330/middle/3.jpg');
INSERT INTO `products` VALUES (11, '白色恋人', 'http://www.mcake.com/postsystem/docroot/images/goods/20151207/2174/list_2174_1.jpg', '211', 1, '3', '水果', '\0', 'https://static.mcake.com/desc/baiselianren/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20151207/2174/middle_2174_1.jpg', 'général, debout dans la neige,le goût sucré, laissez vous vous sentez le bonheur.\r\n一庭纷白，羞涩甜美的少女，于雪中静静绽放，柔软酸甜，不经意间点亮心灯。', 'fraises. Il y a beaucoup de pulpe de fraise dans yogourt fromage, approprié pour les femmes enceintes et les enfants.\r\n如雪的奶油清香细腻，醍醐甜的纯粹之味，唯有鲜红明艳、甜带微酸的初冬草莓才能为之增色。', 'http://www.mcake.com/postsystem/docroot/images/goods/20151207/2174/middle_2174_3.jpg');
INSERT INTO `products` VALUES (12, ' coco芭娜娜', 'http://static.mcake.com/goods/cocobanana/R1502/list/1.jpg', '322', 1, '4', '慕斯', '\0', 'https://static.mcake.com/desc/cocobanana/pc.jpg', 'http://static.mcake.com/goods/cocobanana/R1502/middle/1.jpg', 'faut envelopper avec mousse dans un temps limité. Laissez la douceur des bananes et de la mousse fondre dans la bouche.\r\n\r\n将极易氧化的香蕉作为主食材，限定时间内包裹慕斯，锁住香蕉最佳赏味时刻。一匙之间，让香蕉的甜糯与慕斯的轻盈在口中融化。', 'coût et l’apparence. La triple combinaison de banane, mousse et blanc intelligent est agrémentée de sirop doré, qui fait la saveur et la beauté atteindre le sommet. \r\n食，味蕾的感官体验，藉由外观与口味的双重认证，才得以成功。香蕉、慕斯、白巧的三重组合加以鎏金糖浆的点缀，让味与美到达峰值。', 'http://static.mcake.com/goods/cocobanana/R1502/middle/3.jpg');
INSERT INTO `products` VALUES (13, ' 黑森林拿破仑', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/list/1.jpg', '223', 1, '2', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-4.png', 'https://static.mcake.com/desc/heisenlinnapolun/pc.jpg', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/middle/1.jpg', 'et fruité, parfumé au kirsch, une pure sensation de voyage à l\'esprit au de là du pays du nord.\r\n\r\n久负盛名的黑森林蛋糕遇上绝对经典的拿破仑酥皮，微苦与松脆，浓香丰满。融合樱桃的清爽、奶油的甜，带思绪飘往北地黑森林。', 'La forêt noir, originaire allemand. Nous gardons toujours sa combinaison de recette, décorée en pièce chocolat, a justement donné en forme rectangle.\r\n起源于德国的黑森林蛋糕，不改变它的经典樱桃可可搭配，只在形状上调整为硬朗的长方形，并延续了传统的纯黑巧克力装饰.', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/middle/3.jpg');
INSERT INTO `products` VALUES (14, '爱丽丝花境', 'http://static.mcake.com/goods/ailisimengjing/R0102/list/1.jpg', '255', 1, '2', '芝士', '\0', 'https://static.mcake.com/desc/ailisihuajing/pc.jpg', 'http://static.mcake.com/goods/ailisimengjing/R0102/middle/1.jpg', 'J’aimerais t’offrir un rêve d’amour, une jeune fille marche dans un cheminée , traverse un village fleurissant, tu me regardes avec tes yeux souriants, s’ennuie jamais .\r\n我想送给你们一个关于爱情的梦境，梦境里是少女行走在小镇花径的身影，回眸笑眼弯弯，一生不厌。', 'Un festin d\'amertume et de douceur, le noir et blanc a commencé.Diable et Ange deux camps, de quel côté vous choisissez树莓的酸，荔枝的甜，在舌尖上碰撞出恋爱的火花，犹如少女心境的千回百转，沁人心脾。', 'http://static.mcake.com/goods/ailisimengjing/R0102/middle/3.jpg');
INSERT INTO `products` VALUES (15, '黛西的旅行', 'http://static.mcake.com/goods/daixidelvxing/R1802/list/1.jpg', '199', 1, '3', '水果', '', 'http://static.mcake.com/desc/daixidelvxing/pc.jpg', 'http://static.mcake.com/goods/daixidelvxing/R1802/middle/1.jpg', 'profondeurs de la souche, De légères saveurs de mer salée se dégagent, les fleurs s’épanouie un par un.\r\n\r\n乳脂含量高于35%的淡奶油， 是落在森林里的一场香浓的雪， 细致均匀地铺满7层蛋糕内胚， 模仿时光在老树桩的年轮上誊写。\r\n', 'Y a-t-il une petite fille qui vit dans ton coeur? Qu’elle est courageuse et innocente, gardant l\'amour et les rêves. \r\n时光似镜，倒映着每个人最初的模样。', 'http://static.mcake.com/goods/daixidelvxing/R1802/middle/2.jpg');
INSERT INTO `products` VALUES (16, '棒棒糖', 'http://static.mcake.com/goods/bangbangtang/M0501/list/1.jpg', '125', 1, '1', '水果', '\0', 'https://static.mcake.com/desc/bangbangtang/pc.jpg', 'http://static.mcake.com/goods/bangbangtang/M0501/middle/1.jpg', 'meilleurs câdeaux pour les enfants, une mousse légère rosée, une couche de gelée à la fraise.\r\n\r\n童话中的糖果仙境在现实中上演，随着白巧克力在口中的融化渐渐清晰；当舌尖品尝到脱水冻干草莓，童真年代悄然回归', 'perdus, bonbon à la fraise, sentez-vous cette magie ?\r\n现在这灯红酒绿的生活中，我们早已远离了小时候用零钱买棒棒糖那种单纯的满足感。Now，我用新的蛋糕来重温那小小的幸福，你感觉到了嚒', 'http://static.mcake.com/goods/bangbangtang/M0501/middle/3.jpg');
INSERT INTO `products` VALUES (17, '阳光心芒', 'http://www.mcake.com/postsystem/docroot/images/goods/20170615/1148/list_1148_1.jpg', '118', 1, '3', '慕斯', '\0', 'https://static.mcake.com/desc/yangguangxinmang/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20170615/1148/middle_1148_1.jpg', 'Un après-midi sous le soleil, une tasse de thé, un gâteau de mousse à la mangue. Deux couches de biscuits génoise nature, deux couches de mousse à la mangue阳光下的心情，世界会很美 呼吸着芒果清香醉人的果芳 入口清甜的法国荔枝酒会让天际也染上了色彩 只一口，阳光早已开启心情空间', 'La gelée est une image classique dans notre mémoire de l’enfance.On la rappelle avec le goût frais de la mangueet une couche de gâteau très souple.\r\n果冻是我们儿时的记忆，用清爽的芒果味将它重现，配以松软的白胚', 'http://www.mcake.com/postsystem/docroot/images/goods/20170615/1148/middle_1148_3.jpg');
INSERT INTO `products` VALUES (18, '提拉米苏', 'http://static.mcake.com/goods/tilamisu/J0801/list/1.jpg', '108', 1, '4', '芝士', '\0', 'https://static.mcake.com/desc/tilamisu/pc.jpg', 'http://static.mcake.com/goods/tilamisu/J0801/middle/1.jpg', 'Une révolution de café Le croissment de café italien et du liqueur de café mexican Un saveur séduisant et hors-fontière一切因咖啡而变得不同 当意式咖啡的香醇，遇见墨西哥咖啡酒的浓烈 诱惑在入口，鸣响在心律 升华沉醉的不单单是味蕾', 'Ce gâteau au goût du café est innové du tiramisu, il est soyeux et fin avec un arôme pénétrant du café. \r\n这款咖啡味的蛋糕，创作来自“提拉米苏”蛋糕，口感软绵细滑，伴有浓郁咖啡香味。', 'http://static.mcake.com/goods/tilamisu/J0801/middle/3.jpg');
INSERT INTO `products` VALUES (19, ' 香溢新芝', 'http://www.mcake.com/postsystem/docroot/images/goods/20141209/1151/list_1151_1.jpg', '168', 1, '2', '芝士', '\0', 'https://static.mcake.com/desc/xiangyixinzhi/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20141209/1151/middle_1151_1.jpg', 'La décoration n’est plus indispensable. Une émulsion de la crème cheese, mixé d’une couche de la crème fouettée. 传承享受纯粹，修饰不再重要 只融在口的芝香，让舌尖主宰你的私享 蓬松夹着鲜香淡雅，因齿间的温度而融化肆溢 奶香轻盈', 'C’est un gâteau de fromage innovant. Nous créons la rencontre du gâteau de fromage et de la mousse de fromage. 这是一款创新的芝士蛋糕，把芝士蛋糕和芝士慕斯组合于一体，能带给喜爱芝士类甜品的朋友焕然一新的口感。', 'http://www.mcake.com/postsystem/docroot/images/goods/20141209/1151/middle_1151_3.jpg');
INSERT INTO `products` VALUES (20, '沙布蕾芭菲', ' http://www.mcake.com/postsystem/docroot/images/goods/20150713/1103/list_1103_1.jpg', '128', 1, '3', '巧克力', '\0', 'https://static.mcake.com/desc/shabuleibafei/pc.jpg', ' http://www.mcake.com/postsystem/docroot/images/goods/20150713/1103/middle_1103_1.jpg', 'Madagascar et un coulis au chocolat qui fond directement dans la bouche, le Parfait à la vanille vous donnerait le fraicheur en plein été.\r\n\r\n法式传统沙布蕾饼，搭配马达加斯加香草芭菲和熔岩巧克力，入口即化，尽享夏季沁脾清凉。', 'Le Parfait est sans aucun doute le meilleur choix pour l’été. Il chasse la chaleur avec la finesse et la fraîcheur de la mousse.\r\n于夏季而言，芭菲无疑是一款最好的选择，清凉，祛暑而有慕斯的细腻和爽滑。', 'http://www.mcake.com/postsystem/docroot/images/goods/20150713/1103/middle_1103_3.jpg');
INSERT INTO `products` VALUES (21, '天使巧克力', 'http://www.mcake.com/postsystem/docroot/images/goods/20140828/1073/list_1073_1.jpg', '168', 1, '4', '巧克力', '\0', 'http://static.mcake.com/desc/tianshiqiaokeli/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20140828/1073/middle_1073_1.jpg', 'D\'un goût de plus de 100 ans, un gâteau frabriqué d\'une façon minutieusevous rappelle l\'inoccupation et le romantisme parisiens. 用巴黎的慵懒与浪漫/与马克西姆传承的百年味道/ 精心制作出让天使都会爱上的美丽', 'Le mariage parfait du chocolat et de la crème.Avec un goût qui plaît au tout le monde, il a une élégance de la douceur des nuages. \r\n巧克力与奶油口味的完美融合，针对大众口味调配，体现柔美的云朵样感觉。', 'http://www.mcake.com/postsystem/docroot/images/goods/20140828/1073/middle_1073_3.jpg');
INSERT INTO `products` VALUES (22, '鲜莓印雪', 'http://www.mcake.com/postsystem/docroot/images/goods/20170615/1471/list_1471_1.jpg', '128', 1, '2', '水果', '\0', 'https://static.mcake.com/desc/xianmeiyinxue/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20170615/1471/middle_1471_1.jpg', 'oleil après les chutes de neige, prenant une profonde inspiration, se sentir la douceur de la crème. Les rouges雪过天晴后的第一口呼吸，甜蜜清新得不落俗套，鲜红的草莓，如俏皮的精灵降落凡间。', 'Faire une promenade dans le jardin après la première neige, prendre une bouchée de fraises fraîches, moelleuse crème Cointreau, c\'est le goût de Paris en hiver.初雪过后漫步在杜乐丽花园的小道上，刚刚摘下的新鲜草莓在口中化开，轻呡回味，却是君度奶油的丰盈，就是冬天巴黎的味道。', 'http://www.mcake.com/postsystem/docroot/images/goods/20170615/1471/middle_1471_3.jpg');
INSERT INTO `products` VALUES (23, '卢克和咚咚蛋糕', 'http://static.mcake.com/goods/lukeyudongdong/T0102/list/1.jpg', '118', 1, '4', '芝士', '\0', 'https://static.mcake.com/desc/lukehedongdong/pc.jpg', 'http://static.mcake.com/goods/lukeyudongdong/T0102/middle/1.jpg', 'Dans une cuillère, s’épanouit une saveur à la crème glace vanille et une saveur de glace au fromage. De glace délicate, lisse impétueux. 绽放芝士冰淇淋与香草冰淇淋的双重美味，冰爽细腻，抚平浮躁。宛若南极遇见北极，置身冰雪童话。', 'Quel aventure qu’on aura au bout du monde? Luke, un ours polaire et dondon, un pingouin, vont vous acompagner, passaient un été adorable. 世界尽头，会有怎样的奇遇？让北极熊卢克和小企鹅大咚小咚陪伴你，冰凉沁爽，爱上夏天。', 'http://static.mcake.com/goods/lukeyudongdong/T0102/middle/3.jpg');
INSERT INTO `products` VALUES (24, '法香奶油可丽', 'http://static.mcake.com/goods/faxiangnaiyoukeli/C0201/list/1.jpg', '98', 1, '2', '芝士', '\0', 'https://static.mcake.com/desc/faxiangnaiyoukeli/pc.jpg', 'http://static.mcake.com/goods/faxiangnaiyoukeli/C0201/middle/1.jpg', 'Une genoise légère, des crêpes fondantes, un goût subtile de crème de fromage, et une domination d’amandes torrifiées.奶油绵甜柔软、香郁醇滑/轻乳芝士蛋糕松软可口/ 弹性十足的可丽饼/细腻浓郁的芝士酱/以及松脆的巴旦木仁片/ 口感层次极为丰富', 'Gâteau de crêpes à la crème La crêpe est un dessert français traditionnel très populaire. Nous faisons ici un gâteau innové de la crêpe pour vous montrer un délice du bonheur.可丽饼是款传统的法式甜品，倍受欢迎，我们把它进化在蛋糕中，给你一种幸福的美味。', 'http://static.mcake.com/goods/faxiangnaiyoukeli/C0201/middle/3.jpg');
INSERT INTO `products` VALUES (25, '摩登茶道', 'http://static.mcake.com/goods/modengchadao/Z0401/list/1.jpg', '128', 1, '3', '慕斯', '\0', 'https://static.mcake.com/desc/modengchadao/pc.jpg', 'http://static.mcake.com/goods/modengchadao/Z0401/middle/1.jpg', 'Une promenade à la campagne dans les bambous. Doux couches de biscuits moelleux au chocolat, deux couches de mousse au matcha du Japon在巴黎的街头回到自然的茶意翠语， 时尚与原生态微妙平衡，正如比利时白巧克力与顶级抹茶间的味觉语言', 'Nous utilisons les poudres du thé vert font à la main pour ce gâteau. Inspirée de la France, la création esthétique de ce gâteau est fraîche et hors du commun.这是一款绿茶口味蛋糕，采用纯正手工研磨的绿茶粉制作，造型从时尚法国找到灵感，清新脱俗。', 'http://static.mcake.com/goods/modengchadao/Z0401/middle/3.jpg');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vcontent` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vstate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reply` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`vid`) USING BTREE,
  INDEX `fk_review_products1_idx`(`pid`) USING BTREE,
  INDEX `fk_review_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_review_products1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_review_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (1, '好的1', '2018-09-03T03:11:29.475Z', '1', '', 1, 2);
INSERT INTO `review` VALUES (4, '好的', '2018-10-22 T03:11:29.475Z', '1', '嗯嗯', 2, 2);
INSERT INTO `review` VALUES (5, '好的', '2018-09-18 T03:11:29.475Z', '1', '嗯嗯', 5, 2);
INSERT INTO `review` VALUES (6, '好的', '2018-10-22 T03:11:29.475Z', '1', '嗯嗯', 3, 2);
INSERT INTO `review` VALUES (7, '好的', '2018-10-22 T03:11:29.475Z', '1', '嗯嗯', 4, 2);
INSERT INTO `review` VALUES (8, 'ee', '2018-10-17T03:11:29.475Z', NULL, NULL, 6, 1);
INSERT INTO `review` VALUES (9, 'hh', '2018-10-02 T03:11:29.475Z', NULL, NULL, 7, 2);
INSERT INTO `review` VALUES (13, 'kk', '2018-10-02 T03:11:29.475Z', NULL, NULL, 8, 3);
INSERT INTO `review` VALUES (14, '55', '2018-10-16 T03:11:29.475Z', NULL, NULL, 9, 3);
INSERT INTO `review` VALUES (15, '444', '2018-10-24 T03:11:29.475Z', NULL, NULL, 10, 2);
INSERT INTO `review` VALUES (16, '不错吧不错2', '2018-10-12 T03:11:29.475Z', NULL, NULL, 1, 1);
INSERT INTO `review` VALUES (17, '还不错3', '2018-10-15 T03:11:29.475Z', NULL, NULL, 1, 3);
INSERT INTO `review` VALUES (18, '好吃4', '2018-09-26 T03:11:29.475Z', NULL, NULL, 1, 4);
INSERT INTO `review` VALUES (19, '好吃5', '2018-09-26 T03:11:29.475Z', NULL, NULL, 1, 5);
INSERT INTO `review` VALUES (20, '好吃6', '2018-09-26 T03:11:29.475Z', NULL, NULL, 1, 5);
INSERT INTO `review` VALUES (21, '好吃6', '2018-09-26 T03:11:29.475Z', NULL, NULL, 1, 5);
INSERT INTO `review` VALUES (22, '好吃6', '2018-09-26 T03:11:29.475Z', NULL, NULL, 1, 5);
INSERT INTO `review` VALUES (23, 'hao ', '2018-02-25T03:11:29.475Z', NULL, NULL, 1, 1);
INSERT INTO `review` VALUES (24, ' 去去去去', '2018-10-25T03:11:29.475Z', NULL, NULL, 1, 1);
INSERT INTO `review` VALUES (25, '1111', '2018-10-25T03:11:29.475Z', NULL, NULL, 1, 1);
INSERT INTO `review` VALUES (26, '1111', '2018-10-25T03:11:29.475Z', NULL, NULL, 1, 1);
INSERT INTO `review` VALUES (27, '11', '2018-10-25T03:11:29.475Z', NULL, NULL, 1, 1);
INSERT INTO `review` VALUES (28, '11', '2018-10-25T03:11:29.475Z', NULL, NULL, 1, 5);
INSERT INTO `review` VALUES (29, '好的1', '2018-10-25T03:11:29.475Z', '1', '', 2, 2);
INSERT INTO `review` VALUES (30, '255', '2018-10-28T07:19:41.509Z', NULL, NULL, 5, 12);
INSERT INTO `review` VALUES (31, 'whaodew', '2018-10-28T07:25:15.085Z', NULL, NULL, 5, 12);
INSERT INTO `review` VALUES (32, 'haode', '2018-10-28T07:25:29.064Z', NULL, NULL, 8, 12);
INSERT INTO `review` VALUES (33, '好吃的', '2018-10-28T11:55:31.112Z', NULL, NULL, 9, 12);
INSERT INTO `review` VALUES (34, '回去哦吃到的', '2018-10-29T01:52:09.265Z', NULL, NULL, 1, 12);
INSERT INTO `review` VALUES (35, '222 ', '2018-11-01T13:04:50.040Z', NULL, NULL, 1, 12);
INSERT INTO `review` VALUES (36, '好的', '2018-11-02T07:26:29.995Z', NULL, NULL, 2, 12);
INSERT INTO `review` VALUES (37, '好的', '2018-11-02T07:26:29.995Z', NULL, NULL, 2, 12);

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
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '2018-09-04 15:50:35', '送你玫瑰', '111', '一朵玫瑰花代表我心里只有你一人。九千九百九十九朵玫瑰代表我永远爱你。', '长久以来就象征着美丽和爱情的是欧洲古老蔷薇红蔷薇Rosa gallica和白蔷薇Rosa ×alba等。古希腊和古罗马民族用玫瑰象征他们的爱神阿芙罗狄蒂(en:Aphrodite Aphrodite)、维纳斯(en:Venus Venus)。 玫瑰在希腊神话中是宙斯所创造的杰作，用来向诸神夸耀自己的能力。', '在希腊神话中，玫瑰既是美神的化身，又溶进了爱神的鲜血，它集爱与美于一身，这在花的国度里，可是相当幸运的了。可以说，在世界范围内，玫瑰是用来表达爱情的通用语言（这里的玫瑰指欧洲红蔷薇Rosa gallica或白蔷薇Rosa ×alba）。');

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
  `sex` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` datetime(0) NULL DEFAULT NULL,
  `uphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '张三', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '0', '2018-09-11 00:00:00', '12525288575', NULL);
INSERT INTO `users` VALUES (2, '李斯', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '1', '2018-05-15 13:50:04', '152525288562', NULL);
INSERT INTO `users` VALUES (3, '思思', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '1', '2018-08-28 13:50:25', '15869585236', NULL);
INSERT INTO `users` VALUES (4, '李是', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '1', '2016-06-30 18:19:51', '2222222222222222222', NULL);
INSERT INTO `users` VALUES (5, '李得', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '1', '2016-06-30 18:19:51', '2222222222222222222', NULL);
INSERT INTO `users` VALUES (6, '李订', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '1', '2016-06-30 18:19:51', '2222222222222222222', NULL);
INSERT INTO `users` VALUES (7, '小明天', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, NULL, NULL, '13076278167', NULL);
INSERT INTO `users` VALUES (9, '黄明华', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, NULL, NULL, '18252588777', NULL);
INSERT INTO `users` VALUES (10, '谭钦允', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, NULL, NULL, '18252588747', NULL);
INSERT INTO `users` VALUES (12, '施宇啊', '21218cca77804d2ba1922c33e0151105', NULL, 0, 1, '男', '2018-09-07 00:00:00', '18252588759', '182525885@qq.com');
INSERT INTO `users` VALUES (13, '谭钦允', '15de21c670ae7c3f6f3f1f37029303c9', NULL, 0, 1, NULL, NULL, '13037620167', NULL);
INSERT INTO `users` VALUES (16, '谭钦允', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, NULL, NULL, '18252588717', NULL);
INSERT INTO `users` VALUES (17, '哈利哈利', '25d55ad283aa400af464c76d713c07ad', NULL, 0, 1, NULL, NULL, '17607095261', NULL);
INSERT INTO `users` VALUES (18, '黄明华', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, 1, NULL, NULL, '15505179378', NULL);

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
delete from products where pid = id;

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
