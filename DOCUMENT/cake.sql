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

 Date: 28/10/2018 20:32:38
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
  `defaultaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `fk_address_users1_idx`(`uid`) USING BTREE,
  CONSTRAINT `fk_address_users1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '1', 555, 'sssw', '1', 1);
INSERT INTO `address` VALUES (2, '222', 22, '22', '0', 1);
INSERT INTO `address` VALUES (7, '1', 1, 'kkk', '0', 1);
INSERT INTO `address` VALUES (8, '1', 1, 'kkk', '0', 1);
INSERT INTO `address` VALUES (9, 'uuu', 7777, '嘎嘎嘎嘎', '1', 3);
INSERT INTO `address` VALUES (10, '9999', 7777, '应用于', '0', 3);
INSERT INTO `address` VALUES (11, '1', 1, 'kkk', 'lll', 1);
INSERT INTO `address` VALUES (12, '1', 222, '2222', '1', 12);
INSERT INTO `address` VALUES (13, '11', 11, '11', '0', 12);

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
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `cart1`(`pid`) USING BTREE,
  INDEX `cart2`(`uid`) USING BTREE,
  CONSTRAINT `cart1` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 1, 1);
INSERT INTO `cart` VALUES (2, 2, 2, 2);
INSERT INTO `cart` VALUES (5, 2, 2, 2);
INSERT INTO `cart` VALUES (18, 2, 1, 3);
INSERT INTO `cart` VALUES (21, 2, 12, 3);
INSERT INTO `cart` VALUES (22, 3, 12, 3);
INSERT INTO `cart` VALUES (31, 2, 9, 1);
INSERT INTO `cart` VALUES (35, 3, 17, 12);
INSERT INTO `cart` VALUES (36, 2, 14, 16);
INSERT INTO `cart` VALUES (37, 2, 12, 16);
INSERT INTO `cart` VALUES (38, 2, 17, 16);
INSERT INTO `cart` VALUES (39, 1, 4, 12);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, '已完成', 12, '100', NULL, NULL, NULL);
INSERT INTO `order` VALUES (2, '待收货', 2, '200', NULL, NULL, NULL);
INSERT INTO `order` VALUES (3, '待评价', 1, 'jjj', NULL, NULL, NULL);
INSERT INTO `order` VALUES (4, '待收货', 12, 'jjj', NULL, NULL, NULL);
INSERT INTO `order` VALUES (5, '待评价', 1, 'jjj', NULL, NULL, NULL);
INSERT INTO `order` VALUES (8, '已完成', 12, 'jjj', NULL, NULL, NULL);
INSERT INTO `order` VALUES (9, '待评价', 12, '11', NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetails
-- ----------------------------
INSERT INTO `orderdetails` VALUES (1, 10, 1, 6);
INSERT INTO `orderdetails` VALUES (2, 1, 2, 2);
INSERT INTO `orderdetails` VALUES (3, 1, 3, 4);
INSERT INTO `orderdetails` VALUES (4, 1, 4, 5);
INSERT INTO `orderdetails` VALUES (5, 5, 7, 3);
INSERT INTO `orderdetails` VALUES (6, 2, 8, 9);
INSERT INTO `orderdetails` VALUES (7, 1, 2, 11);
INSERT INTO `orderdetails` VALUES (8, 1, 5, 11);
INSERT INTO `orderdetails` VALUES (10, 1, 9, 12);
INSERT INTO `orderdetails` VALUES (11, 1, 3, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, '尼诺熊', 'http://static.mcake.com/goods/ninuo/T0502/list/1.jpg', '298', 1, '2', '芝士', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-1.png', 'http://static.mcake.com/desc/Nino/pc.jpg', 'http://static.mcake.com/goods/ninuo/T0502/middle/1.jpg', 'A ce moment,laissez votre langue dominent votre joie.un parfum délicat de la crème .这一刻，让舌尖主宰你的私享。蓬松夹着鲜香淡雅，只融在口的浓浓芝香，填满心的另一半。', 'Quelle est l\'expression du visage de votre humeur? Doux Nino vous accompagner, une innocence enfantine. \r\n什么表情对你此刻心情？爱笑爱闹，暖心尼诺陪伴你，童心依旧。', 'http://static.mcake.com/goods/ninuo/T0502/big/1.jpg');
INSERT INTO `products` VALUES (2, '君度可可', 'http://static.mcake.com/goods/jundukeke/M0601/list/1.jpg', '198', 1, '4', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-1.png', 'https://static.mcake.com/desc/jundukeke/pc.jpg', 'http://static.mcake.com/goods/jundukeke/M0601/middle/1.jpg', 'Une mousse au chocolat noir, un goût sucré et amer du 100% chocolat, avec un parfum de Cointreau.\r\n\r\n甜与苦从来不是永恒的对立，因为巧克力，更因为君度力娇 浓烈而温和，清凉却温暖', 'avons ajusté pour qu’il adapte au goût des asiatiques moins sucré.\r\n这是一款专为喜爱白巧克力人群创作，我们重新调配了白巧克力偏甜口感，使之更适合亚洲人口味的产品。', 'http://static.mcake.com/goods/jundukeke/M0601/big/1.jpg');
INSERT INTO `products` VALUES (3, '柠•漾', 'http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/list_2024_1.jpg', '198', 1, '1', '水果', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-1.png', 'https://static.mcake.com/desc/ningyang/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/middle_2024_1.jpg', 'une gélée verte de menthe, le Mojito vous présente une harmonie entre l柠•漾，柔滑慕斯内蕴Q弹酒冻，绝妙配比带来口感的平衡，不太浓烈也不过于寡淡，青柠独特的酸甜带出白朗姆酒的微醺之意。', 'Les menthes fraîches, les citrons verts et le rhum blanc, tous les ingrédients du cocktail Mojito sont dans炎炎夏日，你是否渴望在沙滩的躺椅上享受一杯清凉的Mojito鸡尾酒呢？清凉的薄荷搭配酸爽的青柠，佐以纯正的白朗姆酒，为夏日带来无限清爽；“Mojito 柠•漾”不仅仅是一款蛋糕，更是一“杯”可以吃的Mojito鸡尾酒。', 'http://www.mcake.com/postsystem/docroot/images/goods/20150818/2024/big_2024_1.jpg');
INSERT INTO `products` VALUES (4, '约瑟芬玫瑰', 'http://static.mcake.com/goods/yuesefenmeigui/T0399/list/1.jpg', '395', 1, '1', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-2.png', 'http://static.mcake.com/desc/yuesefenmeigui/pc.jpg', 'http://static.mcake.com/goods/yuesefenmeigui/T0399/middle/1.jpg', 'Des rosettes pour les amoureux, une histoire d’amour, une romance unique de toute la vie.见证无数情侣最甜蜜的一刻，从舌尖蔓延到心间的感动，今生今世唯一爱恋', 'Des rosettes pour les amoureux, une histoire d’amour, une romance unique de toute la vie. 巧克力&玫瑰花，见证无数情侣最甜蜜的一刻，从舌尖蔓延到心间的感动，今生今世唯一爱恋 。', 'http://static.mcake.com/goods/yuesefenmeigui/T0399/big/1.jpg');
INSERT INTO `products` VALUES (5, ' Pink•罗赛特', 'http://static.mcake.com/goods/pinkluosaite/M0401/list/1.jpg', '318', 1, '1', '巧克力', '1', 'https://static.mcake.com/desc/pinkluosaite/pc.jpg', 'http://static.mcake.com/goods/pinkluosaite/M0401/middle/1.jpg', 'une fine gelée de framboise. Le Pink Rosette vous offrirait une expérience细腻软甜的玫瑰白巧克力慕斯邂逅酸爽的树莓啫喱于珍馐荔枝 色与味的双重盛宴', 'Un bouquet de roses et une branche de litchis au début de l’été, c’est le romantisme de Paris初夏的巴黎，一束玫瑰和一串新鲜饱满的荔枝，这就是法国特有的浪漫气息，粉色的巧克力将二者完美地聚合。', 'http://static.mcake.com/goods/pinkluosaite/M0401/big/1.jpg');
INSERT INTO `products` VALUES (6, '蔓越莓红丝绒', 'http://static.mcake.com/goods/manyuemeihongsirong/C0301/list/1.jpg', '298', 1, '3', '芝士', '0', 'http://static.mcake.com/desc/manyuemeihongsirong/pc.jpg', 'http://static.mcake.com/goods/manyuemeihongsirong/C0301/middle/1.jpg', 'Dans la couleur de la paix et la confusion, la canneberge de haute qualité honore le parfum aristrocratique de l\'histoire. MCAKE/\r\n\r\n完美地复苏红丝绒蛋糕的传统和历史/ 并选用新鲜蔓越莓点缀其上/ 让贵族般的色香/再度氤氲美妙的午后', 'Gâteau célèbre créé chez Waldolf de New York,jamais absent aux tapis rouges des grands événements.\r\n原产自纽约华尔道夫的名品，每逢明星走红毯必会出现的角色。', 'http://static.mcake.com/goods/manyuemeihongsirong/C0301/big/1.jpg');
INSERT INTO `products` VALUES (7, '百利派对', 'http://static.mcake.com/goods/baixiangguomusi/R1602/list/1.jpg', '233', 1, '4', '巧克力', '0', ' http://static.mcake.com/goods/bailipaidui/J0401/middle/1.jpg', ' http://static.mcake.com/goods/bailipaidui/J0401/middle/1.jpg', 'Mélange la crème et Bailay’s, rajouté un cout fine du chocolat blanc du Bruxelle Partagé来一场百利私享派对 奶油和威士忌的美妙融合，再加一点比利时白巧克力 感受着丝般顺滑的口感，分享与闺蜜专属的时间', 'Avec l’apparence de la plus grande simplicité,le dessert Baileys est la meilleure interprétationde l外型极致简约，少女对于恋爱憧憬，百利甜是完美的诠释。', 'http://static.mcake.com/goods/bailipaidui/J0401/big/1.jpg');
INSERT INTO `products` VALUES (8, '蒸青抹茶', 'http://static.mcake.com/goods/zhenqingmocha/J0201/list/1.jpg', '244', 1, '4', '芝士', '1', 'http://static.mcake.com/desc/zhengqingmocha/pc.jpg', 'http://static.mcake.com/goods/zhenqingmocha/J0201/middle/1.jpg', 'du Japon, ce gâteau au thé vous donne un saveur extraodinaire qui représente la philosophie orientale\r\n\r\n在巴黎的街头回到自然的茶意翠语， 时尚与原生态微妙平衡，正如比利时白巧克力与顶级抹茶间的味觉语言 冲突，彼此的分明；融合，彼此的丰满。停下，聆听。', ' Inspirée de la France, la création esthétique de ce gâteau est fraîche et hors du commun.\r\n这是一款绿茶口味蛋糕，采用纯正手工研磨的绿茶粉制作，造型从时尚法国找到灵感，清新脱俗', 'http://static.mcake.com/goods/zhenqingmocha/J0201/big/1.jpg');
INSERT INTO `products` VALUES (9, '百香果慕斯', 'http://static.mcake.com/goods/baixiangguomusi/R1602/list/1.jpg', '555', 1, '3', '慕斯', '1', 'https://static.mcake.com/desc/baixiangguomusi/pc.jpg', 'http://static.mcake.com/goods/baixiangguomusi/R1602/middle/1.jpg', ' l\'industrie alimentaire, elle combine deux saveurs et sent les dons naturels à travers la langue.\r\n\r\n165种果味，165个独白，1个表现形式，这便是百香果。与椰子慕斯的组合，是食物界的撞色，撮合两种味道，通过舌尖感知自然的馈赠。', 'Comme marcher dans le 7ème arrondissement de France, chaleureux et simple.\r\n甜是陷阱，酸是解药，两者中和后，是你与自己达成和解的致幻剂。如同漫步在法国第七街区，热烈又简约。', 'http://static.mcake.com/goods/baixiangguomusi/R1602/big/1.jpg');
INSERT INTO `products` VALUES (10, '魔鬼中的天使', 'http://static.mcake.com/goods/moguizhongdetianshi/R1330/list/1.jpg', '422', 1, '1', '巧克力', '\0', 'http://static.mcake.com/desc/moguizhongdetianshi/pc.jpg', 'http://static.mcake.com/goods/moguizhongdetianshi/R1330/middle/1.jpg', 'Crème soyeuse au chocolat,faufiler dans le gâteau.Chocolat noir importé, est un piège du diable幼滑的巧克力奶油夹心，悄悄地潜入松软的蛋糕里。进口黑巧克力，埋下魔鬼陷阱；细腻微苦的口感，让味蕾步步沦陷。', 'Quand le soleil se couche, les petits fantômes sortent.Un festin d\'amertume et de douceur, le noir et blanc a commencé.Diable et Ange deux camps, de quel côté vous choisissez? \r\n太阳下班，萌鬼囧神出没。一场苦与甜、黑与白的饕餮之宴降临，魔鬼与天使两个阵营，吃货该站哪边？', 'http://static.mcake.com/goods/moguizhongdetianshi/R1330/big/1.jpg');
INSERT INTO `products` VALUES (11, '白色恋人', 'http://www.mcake.com/postsystem/docroot/images/goods/20151207/2174/list_2174_1.jpg', '211', 1, '3', '水果', '\0', 'https://static.mcake.com/desc/baiselianren/pc.jpg', 'http://www.mcake.com/postsystem/docroot/images/goods/20151207/2174/middle_2174_1.jpg', 'général, debout dans la neige,le goût sucré, laissez vous vous sentez le bonheur.\r\n一庭纷白，羞涩甜美的少女，于雪中静静绽放，柔软酸甜，不经意间点亮心灯。', 'fraises. Il y a beaucoup de pulpe de fraise dans yogourt fromage, approprié pour les femmes enceintes et les enfants.\r\n如雪的奶油清香细腻，醍醐甜的纯粹之味，唯有鲜红明艳、甜带微酸的初冬草莓才能为之增色。', 'http://www.mcake.com/postsystem/docroot/images/goods/20151207/2174/big_2174_1.jpg');
INSERT INTO `products` VALUES (12, ' coco芭娜娜', 'http://static.mcake.com/goods/cocobanana/R1502/list/1.jpg', '522', 1, '4', '慕斯', '\0', 'https://static.mcake.com/desc/cocobanana/pc.jpg', 'http://static.mcake.com/goods/cocobanana/R1502/middle/1.jpg', 'faut envelopper avec mousse dans un temps limité. Laissez la douceur des bananes et de la mousse fondre dans la bouche.\r\n\r\n将极易氧化的香蕉作为主食材，限定时间内包裹慕斯，锁住香蕉最佳赏味时刻。一匙之间，让香蕉的甜糯与慕斯的轻盈在口中融化。', 'coût et l’apparence. La triple combinaison de banane, mousse et blanc intelligent est agrémentée de sirop doré, qui fait la saveur et la beauté atteindre le sommet. \r\n食，味蕾的感官体验，藉由外观与口味的双重认证，才得以成功。香蕉、慕斯、白巧的三重组合加以鎏金糖浆的点缀，让味与美到达峰值。', 'http://static.mcake.com/goods/cocobanana/R1502/big/1.jpg');
INSERT INTO `products` VALUES (13, ' 黑森林拿破仑', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/list/1.jpg', '22', 1, '2', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-4.png', 'https://static.mcake.com/desc/heisenlinnapolun/pc.jpg', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/middle/1.jpg', 'et fruité, parfumé au kirsch, une pure sensation de voyage à l\'esprit au de là du pays du nord.\r\n\r\n久负盛名的黑森林蛋糕遇上绝对经典的拿破仑酥皮，微苦与松脆，浓香丰满。融合樱桃的清爽、奶油的甜，带思绪飘往北地黑森林。', 'La forêt noir, originaire allemand. Nous gardons toujours sa combinaison de recette, décorée en pièce chocolat, a justement donné en forme rectangle.\r\n起源于德国的黑森林蛋糕，不改变它的经典樱桃可可搭配，只在形状上调整为硬朗的长方形，并延续了传统的纯黑巧克力装饰.', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/big/1.jpg');
INSERT INTO `products` VALUES (14, '爱丽丝花境', 'http://static.mcake.com/goods/ailisimengjing/R0102/list/1.jpg', '555', 1, '2', '芝士', '\0', 'https://static.mcake.com/desc/ailisihuajing/pc.jpg', 'http://static.mcake.com/goods/ailisimengjing/R0102/middle/1.jpg', '设计师 bear J’aimerais t’offrir un rêve d’amour, une jeune fille marche dans un cheminée , traverse un village fleurissant, tu me regardes avec tes yeux souriants, s’ennuie jamais .\r\n我想送给你们一个关于爱情的梦境，梦境里是少女行走在小镇花径的身影，回眸笑眼弯弯，一生不厌。', '树莓的酸，荔枝的甜，在舌尖上碰撞出恋爱的火花，犹如少女心境的千回百转，沁人心脾。', 'http://static.mcake.com/goods/ailisimengjing/R0102/big/1.jpg');
INSERT INTO `products` VALUES (15, '黛西的旅行', 'http://static.mcake.com/goods/daixidelvxing/R1802/list/1.jpg', '555', 1, '2', '水果', '', 'http://static.mcake.com/desc/daixidelvxing/pc.jpg', 'http://static.mcake.com/goods/daixidelvxing/R1802/middle/1.jpg', 'profondeurs de la souche, De légères saveurs de mer salée se dégagent, les fleurs s’épanouie un par un.\r\n\r\n乳脂含量高于35%的淡奶油， 是落在森林里的一场香浓的雪， 细致均匀地铺满7层蛋糕内胚， 模仿时光在老树桩的年轮上誊写。\r\n', 'Y a-t-il une petite fille qui vit dans ton coeur? Qu’elle est courageuse et innocente, gardant l\'amour et les rêves. \r\n时光似镜，倒映着每个人最初的模样。', 'http://static.mcake.com/goods/daixidelvxing/R1802/big/1.jpg');
INSERT INTO `products` VALUES (16, '黛西的旅行2', 'http://static.mcake.com/goods/daixidelvxing/R1802/list/1.jpg', '555', 1, '3', '水果', '', 'http://static.mcake.com/desc/daixidelvxing/pc.jpg', 'http://static.mcake.com/goods/daixidelvxing/R1802/middle/1.jpg', 'profondeurs de la souche, De légères saveurs de mer salée se dégagent, les fleurs s’épanouie un par un.\r\n\r\n乳脂含量高于35%的淡奶油， 是落在森林里的一场香浓的雪， 细致均匀地铺满7层蛋糕内胚， 模仿时光在老树桩的年轮上誊写。\r\n', 'Y a-t-il une petite fille qui vit dans ton coeur? Qu’elle est courageuse et innocente, gardant l\'amour et les rêves. \r\n时光似镜，倒映着每个人最初的模样。', 'http://static.mcake.com/goods/daixidelvxing/R1802/big/1.jpg');
INSERT INTO `products` VALUES (17, '黛西的旅行3', 'http://static.mcake.com/goods/daixidelvxing/R1802/list/1.jpg', '555', 1, '2', '慕斯', '', 'http://static.mcake.com/desc/daixidelvxing/pc.jpg', 'http://static.mcake.com/goods/daixidelvxing/R1802/middle/1.jpg', 'profondeurs de la souche, De légères saveurs de mer salée se dégagent, les fleurs s’épanouie un par un.\r\n\r\n乳脂含量高于35%的淡奶油， 是落在森林里的一场香浓的雪， 细致均匀地铺满7层蛋糕内胚， 模仿时光在老树桩的年轮上誊写。\r\n', 'Y a-t-il une petite fille qui vit dans ton coeur? Qu’elle est courageuse et innocente, gardant l\'amour et les rêves. \r\n时光似镜，倒映着每个人最初的模样。', 'http://static.mcake.com/goods/daixidelvxing/R1802/big/1.jpg');
INSERT INTO `products` VALUES (18, '黛西的旅行4', 'http://static.mcake.com/goods/daixidelvxing/R1802/list/1.jpg', '555', 1, '2', '慕斯', '', 'http://static.mcake.com/desc/daixidelvxing/pc.jpg', 'http://static.mcake.com/goods/daixidelvxing/R1802/middle/1.jpg', 'profondeurs de la souche, De légères saveurs de mer salée se dégagent, les fleurs s’épanouie un par un.\r\n\r\n乳脂含量高于35%的淡奶油， 是落在森林里的一场香浓的雪， 细致均匀地铺满7层蛋糕内胚， 模仿时光在老树桩的年轮上誊写。\r\n', 'Y a-t-il une petite fille qui vit dans ton coeur? Qu’elle est courageuse et innocente, gardant l\'amour et les rêves. \r\n时光似镜，倒映着每个人最初的模样。', 'http://static.mcake.com/goods/daixidelvxing/R1802/big/1.jpg');
INSERT INTO `products` VALUES (20, ' 黑森林拿破仑2', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/list/1.jpg', '22', 1, '2', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-4.png', 'https://static.mcake.com/desc/heisenlinnapolun/pc.jpg', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/middle/1.jpg', 'et fruité, parfumé au kirsch, une pure sensation de voyage à l\'esprit au de là du pays du nord.\r\n\r\n久负盛名的黑森林蛋糕遇上绝对经典的拿破仑酥皮，微苦与松脆，浓香丰满。融合樱桃的清爽、奶油的甜，带思绪飘往北地黑森林。', 'La forêt noir, originaire allemand. Nous gardons toujours sa combinaison de recette, décorée en pièce chocolat, a justement donné en forme rectangle.\r\n起源于德国的黑森林蛋糕，不改变它的经典樱桃可可搭配，只在形状上调整为硬朗的长方形，并延续了传统的纯黑巧克力装饰.', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/big/1.jpg');
INSERT INTO `products` VALUES (21, ' 黑森林拿破仑3', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/list/1.jpg', '22', 1, '2', '巧克力', 'https://act.mcake.com/fangli/2018/pc/memberDay-10yue/images/cake-4.png', 'https://static.mcake.com/desc/heisenlinnapolun/pc.jpg', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/middle/1.jpg', 'et fruité, parfumé au kirsch, une pure sensation de voyage à l\'esprit au de là du pays du nord.\r\n\r\n久负盛名的黑森林蛋糕遇上绝对经典的拿破仑酥皮，微苦与松脆，浓香丰满。融合樱桃的清爽、奶油的甜，带思绪飘往北地黑森林。', 'La forêt noir, originaire allemand. Nous gardons toujours sa combinaison de recette, décorée en pièce chocolat, a justement donné en forme rectangle.\r\n起源于德国的黑森林蛋糕，不改变它的经典樱桃可可搭配，只在形状上调整为硬朗的长方形，并延续了传统的纯黑巧克力装饰.', 'http://static.mcake.com/goods/heisenlinnapolun/N0605/big/1.jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `review` VALUES (32, 'haode', '2018-10-28T07:25:29.064Z', NULL, NULL, 12, 12);
INSERT INTO `review` VALUES (33, '好吃的', '2018-10-28T11:55:31.112Z', NULL, NULL, 9, 12);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `users` VALUES (12, '施宇啊', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, '女', '2018-09-10 00:00:00', '18252588759', '182525885@qq.com');
INSERT INTO `users` VALUES (13, '谭钦允', '15de21c670ae7c3f6f3f1f37029303c9', NULL, 0, 1, NULL, NULL, '13037620167', NULL);
INSERT INTO `users` VALUES (16, '谭钦允', '0a113ef6b61820daa5611c870ed8d5ee', NULL, 0, 1, NULL, NULL, '18252588717', NULL);

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
