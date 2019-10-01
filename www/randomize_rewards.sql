/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : randomize_rewards

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 01/10/2019 20:18:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for daily_rewards
-- ----------------------------
DROP TABLE IF EXISTS `daily_rewards`;
CREATE TABLE `daily_rewards`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NULL DEFAULT NULL,
  `rewards` int(8) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of daily_rewards
-- ----------------------------
INSERT INTO `daily_rewards` VALUES (1, 1, 20000, '2019-10-01');
INSERT INTO `daily_rewards` VALUES (2, 2, 74000, '2019-10-01');
INSERT INTO `daily_rewards` VALUES (3, 3, 66000, '2019-10-01');
INSERT INTO `daily_rewards` VALUES (4, 4, 33000, '2019-10-01');
INSERT INTO `daily_rewards` VALUES (5, 5, 7000, '2019-10-01');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'daily_limit', '200000');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `low` int(8) NULL DEFAULT NULL,
  `high` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Deni', 10000, 20000);
INSERT INTO `user` VALUES (2, 'Gilbert', 45000, 75000);
INSERT INTO `user` VALUES (3, 'Brandon', 60000, 80000);
INSERT INTO `user` VALUES (4, 'There', 30000, 50000);
INSERT INTO `user` VALUES (5, 'Jill', 25000, 35000);

SET FOREIGN_KEY_CHECKS = 1;
