/*
 Navicat Premium Data Transfer

 Source Server         : xamapp_Mysql
 Source Server Type    : MySQL
 Source Server Version : 50626
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 50626
 File Encoding         : 65001

 Date: 28/12/2018 21:50:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 3, 4);
INSERT INTO `cart` VALUES (1, 9, 1);
INSERT INTO `cart` VALUES (1, 19, 4);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(4) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `resnum` int(5) NOT NULL,
  `headerimg` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `imgs` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 3, '戴尔（DELL）XPS 15-9560', '13799', '戴尔（DELL）XPS 15-9560 系列15.6英寸笔记本电脑(XPS15-9560-R2845', '定制类产品 指纹识别 即刻唤醒 疾速传输', 5, 'img/product_imgs/img1_1.jpg', 'img/product_imgs/img1_1.jpg&img/product_imgs/img1_2.jpg&img/product_imgs/img1_3.jpg&img/product_imgs/img1_4.jpg');
INSERT INTO `product` VALUES (2, 3, '戴尔DELL 全新 XPS13.3英寸', '9999.0', '戴尔DELL全新XPS13.3英寸超轻薄窄边框笔记本电脑白色硅纤维(i5-8250U 8G 256G', '4mm微边框，薄至7.8mm，100% RGB色域，白色层叠硅纤维，NASA级戈尔隔热膜，19h续航', 10, 'img/product_imgs/img2_1.jpg', 'img/product_imgs/img2_1.jpg&img/product_imgs/img2_2.jpg&img/product_imgs/img2_3.jpg&img/product_imgs/img2_4.jpg');
INSERT INTO `product` VALUES (3, 3, '戴尔(DELL)XPS8930', '8299.0', '戴尔(DELL)XPS8930高性能游戏台式电脑主机(八代i7-8700 8G 1T+16G傲腾 G', '电竞装备!GTX10系独显流畅运行抢枪爆头,免工具开箱设计轻松升级,7X24小时专业游戏支持服务.', 4, 'img/product_imgs/img3_1.jpg', 'img/product_imgs/img3_1.jpg&img/product_imgs/img3_2.jpg&img/product_imgs/img3_3.jpg&img/product_imgs/img3_4.jpg');
INSERT INTO `product` VALUES (5, 3, '戴尔(DELL)XPS 电脑整机', '13999', '戴尔(DELL)XPS8930高性能游戏台式电脑整机(八代i7-8700 8G 1T+16G傲腾 G', '【34英寸IPS屏曲面窄边框影院级超宽WQHD高分辨率 】GTX10系电竞独显,7X24h专业游戏支', 14, 'img/product_imgs/img5_1.jpg', 'img/product_imgs/img5_1.jpg&img/product_imgs/img5_2.jpg&img/product_imgs/img5_3.jpg&img/product_imgs/img5_4.jpg');
INSERT INTO `product` VALUES (6, 1, '戴尔DELL游匣G3烈焰版', '7299.0', '戴尔DELL游匣G3烈焰版 15.6英寸游戏笔记本电脑(i7-8750H 8G 128GSSD 1T', '【圣诞狂欢季】戴尔圣诞疯狂价，年末超值大促！12月24日—25日疯抢两天！速速下手，给你爱的那个ta', 300, 'img/product_imgs/img6_1.jpg', 'img/product_imgs/img6_1.jpg&img/product_imgs/img6_2.jpg&img/product_imgs/img6_3.jpg&img/product_imgs/img6_4.jpg&img/product_imgs/img6_5.jpg');
INSERT INTO `product` VALUES (7, 1, '戴尔DELL G7 15.6英寸', '6399.00', '戴尔DELL G7 15.6英寸游戏设计师笔记本电脑(i5-8300H 8G 128G PCleSS', '【圣诞狂欢季】戴尔圣诞疯狂价，年末超值大促！12月24日—25日疯抢两天！速速下手，给你爱的那个ta', 1137, 'img/product_imgs/img7_1.jpg', 'img/product_imgs/img7_1.jpg&img/product_imgs/img7_2.jpg&img/product_imgs/img7_3.jpg&img/product_imgs/img7_4.jpg&img/product_imgs/img7_5.jpg');
INSERT INTO `product` VALUES (8, 2, '戴尔灵越14 燃 ', '4999.00', '戴尔灵越14 燃 14英寸轻薄窄边框笔记本电脑(i5-8265U 8G 256GSSD MX150 ', '【圣诞狂欢季】戴尔圣诞疯狂价，年末超值大促！12月24日—25日疯抢两天！速速下手，给你爱的那个ta', 35, 'img/product_imgs/img8_1.jpg', 'img/product_imgs/img8_1.jpg&img/product_imgs/img8_2.jpg&img/product_imgs/img8_3.jpg&img/product_imgs/img8_4.jpg&img/product_imgs/img8_5.jpg');
INSERT INTO `product` VALUES (9, 2, '戴尔DELL灵越7000 pro 15.6', '5699.00', '戴尔DELL灵越7000 pro 15.6英寸轻薄笔记本电脑(i5-8250U 8G 128GSSD', '【三面金属微边框,80% 屏占比】八代处理器,全高清IPS屏,双天线网卡,上网看电影玩游戏,更快一点', 112, 'img/product_imgs/img9_1.jpg', 'img/product_imgs/img9_1.jpg&img/product_imgs/img9_2.jpg&img/product_imgs/img9_3.jpg&img/product_imgs/img9_4.jpg&img/product_imgs/img9_5.jpg');
INSERT INTO `product` VALUES (10, 4, '全新Alienware15.6', '22999.00', '全新Alienware15.6英寸轻薄游戏设计师笔记本电脑(八代i7-8750H 32G 512GS', '【轻薄利刃出鞘】星云红耀世登场，144Hz电竞屏，大容量SSD，双Killer网卡', 50, 'img/product_imgs/img10_1.jpg', 'img/product_imgs/img10_1.jpg&img/product_imgs/img10_2.jpg&img/product_imgs/img10_3.jpg&img/product_imgs/img10_4.jpg&img/product_imgs/img10_5.jpg');
INSERT INTO `product` VALUES (11, 4, '外星人Alienware Aurora', '32999.00', '外星人Alienware Aurora水冷游戏台式电脑主机(九代i9-9900k 32G 512GS', '【新品震撼上市】精妙水冷，光追利器RTX2080Ti，旋转式电源布局，850W模块化电源低耗续航，激', 11, 'img/product_imgs/img11_1.jpg', 'img/product_imgs/img11_1.jpg&img/product_imgs/img11_2.jpg&img/product_imgs/img11_3.jpg&img/product_imgs/img11_4.jpg&img/product_imgs/img11_5.jpg');
INSERT INTO `product` VALUES (12, 5, '戴尔(DELL)灵越MAX·战5675', '5799.00', '戴尔(DELL)灵越MAX·战5675高性能游戏台式电脑主机(AMD R7 1700X 8G 128', '【限时送显示器】秉承职业竞技精神，下单限量赠送戴尔23.6英寸原装显示器，数量有限先到先得，让游戏体', 34, 'img/product_imgs/img12_1.jpg', 'img/product_imgs/img12_1.jpg&img/product_imgs/img12_2.jpg&img/product_imgs/img12_3.jpg&img/product_imgs/img12_4.jpg&img/product_imgs/img12_5.jpg');
INSERT INTO `product` VALUES (13, 5, '戴尔(DELL)成就3268', '2499.00', '戴尔(DELL)成就3268商用办公台式电脑主机(G4560 4G 1T 三年上门售后 键鼠 WIF', '【奔腾G4560、4G、1T、集显单主机】成就台式电脑，配备三年上门+三年硬盘保留服务，自带蓝牙及W', 59, 'img/product_imgs/img13_1.jpg', 'img/product_imgs/img13_1.jpg&img/product_imgs/img13_2.jpg&img/product_imgs/img13_3.jpg&img/product_imgs/img13_4.jpg&img/product_imgs/img13_5.jpg');
INSERT INTO `product` VALUES (14, 6, '戴尔(DELL)灵越AIO 3475', '3699.00', '戴尔(DELL)灵越AIO 3475 23.8英寸IPS窄边框一体机台式电脑(AMD A6 4G 1', '【A6,1T,隐藏式摄像头】黑科技,手机&PC双屏合一,全高清IPS大屏窄边框,80%屏占比,178', 3, 'img/product_imgs/img14_1.jpg', 'img/product_imgs/img14_1.jpg&img/product_imgs/img14_2.jpg&img/product_imgs/img14_3.jpg&img/product_imgs/img14_4.jpg&img/product_imgs/img14_5.jpg');
INSERT INTO `product` VALUES (15, 6, '戴尔(DELL)灵越AIO 3477', '5599.00', '戴尔(DELL)灵越AIO 3477 23.8英寸IPS窄边框一体机台式电脑(i5 8G 128GS', '【IPS窄边框,高速固态】178°广视角,全高清23.8英寸,屏占比高达80%体验更大可视范围,手机', 1, 'img/product_imgs/img15_1.jpg', 'img/product_imgs/img15_1.jpg&img/product_imgs/img15_2.jpg&img/product_imgs/img15_3.jpg&img/product_imgs/img15_4.jpg&img/product_imgs/img15_5.jpg');
INSERT INTO `product` VALUES (16, 7, '戴尔（DELL）SP2318H', '1099.00', '戴尔（DELL）SP2318H 23英寸微边框旋转升降广视角IPS屏护眼爱眼不闪滤蓝光电脑显示器（带', '【三年售后上门换机，无忧购】旋转升降屏幕，任意调节角度！侧边双USB接口！', 3, 'img/product_imgs/img16_1.jpg', 'img/product_imgs/img16_1.jpg&img/product_imgs/img16_2.jpg&img/product_imgs/img16_3.jpg&img/product_imgs/img16_4.jpg&img/product_imgs/img16_5.jpg');
INSERT INTO `product` VALUES (17, 7, '戴尔（DELL）S2419HM', '1499.00', '戴尔（DELL）S2419HM 23.8英寸四面微边框600尼特 HDR爱眼不闪滤蓝光电脑显示器', '【三年售后上门换机，无忧购】过目难忘的纤薄机身，600尼特屏幕亮度！HDR技术+出厂色彩校准99%s', 4, 'img/product_imgs/img17_1.jpg', 'img/product_imgs/img17_1.jpg&img/product_imgs/img17_2.jpg&img/product_imgs/img17_3.jpg&img/product_imgs/img17_4.jpg');
INSERT INTO `product` VALUES (18, 8, '戴尔（DELL）WM118', '49.00', '戴尔（DELL）WM118 无线办公鼠标 京东自营（黑色）', '戴尔无线办公鼠标 具有1000dpi激光跟踪功能，可以适合左右手操作，可操作距离达10米', 100, 'img/product_imgs/img18_1.jpg', 'img/product_imgs/img18_1.jpg&img/product_imgs/img18_2.jpg&img/product_imgs/img18_3.jpg');
INSERT INTO `product` VALUES (19, 8, '戴尔（DELL）WM615', '199.00', '戴尔（DELL）WM615 蓝牙无线鼠标 京东自营（黑色）', '戴尔无线鼠标 蓝牙鼠标 光电鼠标', 5, 'img/product_imgs/img19_1.jpg', 'img/product_imgs/img19_1.jpg&img/product_imgs/img19_2.jpg&img/product_imgs/img19_3.jpg&img/product_imgs/img19_4.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `other` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '11111', 'JasonWu', '358190915@qq.com', '1', '1');
INSERT INTO `user` VALUES (2, 'wujiancheng', 'JasonWu', '13330938667@qq.com', 'meiyou\r\nhahahha', '123');
INSERT INTO `user` VALUES (3, '22222', 'test2', 'test2@qq.com', '1', '2');
INSERT INTO `user` VALUES (4, '33333', 'test3', '358190915@qq.com', '1', '123');

SET FOREIGN_KEY_CHECKS = 1;
