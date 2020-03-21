/*
 Navicat Premium Data Transfer

 Source Server         : localhost3306
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : mufan

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 18/08/2018 19:28:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_academy
-- ----------------------------
DROP TABLE IF EXISTS `system_academy`;
CREATE TABLE `system_academy`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院名称',
  `memo` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '说明',
  `create_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '删除标记',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_academy
-- ----------------------------
INSERT INTO `system_academy` VALUES ('72dd74f19bcd45aebd9e54bf8e2025a3', '1', '华师大最好学院', '1', '2018-08-16 21:07:26', '1', '2018-08-16 21:07:26', '', '0', 1);
INSERT INTO `system_academy` VALUES ('89dc7f58bbd2453e94c60e64fd351784', '3', '不知道在哪', '1', '2018-08-17 13:46:15', '1', '2018-08-17 13:46:15', '还是不知道在哪', '0', 1);

-- ----------------------------
-- Table structure for system_major
-- ----------------------------
DROP TABLE IF EXISTS `system_major`;
CREATE TABLE `system_major`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '专业编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业名称',
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业代码',
  `academy` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属学院',
  `nature` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业性质',
  `normal` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否师范专业',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_major
-- ----------------------------
INSERT INTO `system_major` VALUES ('f9fb16af3c4a49ce822de2c864c8e9c4', '电子商务', '450', '1', '7', '0', '', '1', '2018-08-16 19:56:58', '1', '2018-08-16 19:56:58', '', '0');
INSERT INTO `system_major` VALUES ('76903307c1ae40b0b5a38aabc2fe4255', '信息资源管理', '462', '1', '7', '0', '', '1', '2018-08-16 20:12:35', '1', '2018-08-16 19:57:28', '', '1');

-- ----------------------------
-- Table structure for system_student
-- ----------------------------
DROP TABLE IF EXISTS `system_student`;
CREATE TABLE `system_student`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `student_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '学号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `birthday` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `school_length` int(2) NULL DEFAULT NULL COMMENT '学制',
  `academy` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学院编号',
  `politics` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '政治面貌',
  `major` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专业编号',
  `nation` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '民族',
  `clbum` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '班级',
  `school_roll` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学籍',
  `intime` datetime NULL DEFAULT NULL COMMENT '入学时间',
  `id_no` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '身份证号',
  `culture` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '原文化程度',
  `background` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '家庭出身',
  `identity` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '本人成份',
  `stunative` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '籍贯',
  `registered` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '户口所在地',
  `registered_pro` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '户口所在省份',
  `origin` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生源地',
  `origin_pro` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生源地省份',
  `tell` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电子邮箱',
  `qq` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'QQ号码',
  `h_tell` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '家庭电话',
  `h_postcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '家庭邮编',
  `h_address` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '家庭地址',
  `h_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '家庭邮箱',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_student
-- ----------------------------
INSERT INTO `system_student` VALUES ('123', '123', '123', '2', '2018-08-16 20:08:05', 4, '1', '3', '1', '1', '1601', '123', '2018-08-16 20:08:26', '123', '123', '2', '2', '123', '123', '4', '123', '4', '123', '123', '123', '123', '123', '123', '123', '1', '2018-08-16 20:09:22', '1', '2018-08-16 20:09:22', '', 1, '0');
INSERT INTO `system_student` VALUES ('456', '456', '编辑', '2', '2018-08-17 14:49:37', 4, '2', '3', '2', '2', '1601', '123', '2018-08-17 14:50:03', '123', '123', '6', '2', '123', '123', '7', '123', '4', '123', '123', '123', '123', '123', '123', '123', '1', '2018-08-17 14:51:43', '1', '2018-08-17 14:51:43', '', 1, '0');

SET FOREIGN_KEY_CHECKS = 1;
