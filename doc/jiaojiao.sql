8/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : mufan

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2018-08-19 12:18:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dev_scholarship`
-- ----------------------------
DROP TABLE IF EXISTS `dev_scholarship`;
CREATE TABLE `dev_scholarship` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `student_id` varchar(64) DEFAULT NULL COMMENT '学生编号',
  `sch_name` varchar(64) DEFAULT NULL COMMENT '奖金名称',
  `amount` float(64,0) DEFAULT NULL COMMENT '奖金金额',
  `year` varchar(20) DEFAULT NULL COMMENT '获奖年度',
  `status` tinyint(4) DEFAULT NULL COMMENT '审核状态',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `slfk_id` (`student_id`),
  CONSTRAINT `slfk_id` FOREIGN KEY (`student_id`) REFERENCES `system_student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dev_scholarship
-- ----------------------------

-- ----------------------------
-- Table structure for `graduate_paper`
-- ----------------------------
DROP TABLE IF EXISTS `graduate_paper`;
CREATE TABLE `graduate_paper` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `student_id` varchar(64) DEFAULT '' COMMENT '学生编号',
  `title` varchar(255) DEFAULT NULL COMMENT '论文名称',
  `pub_name` varchar(64) DEFAULT NULL COMMENT '刊物名称',
  `time` date DEFAULT NULL COMMENT '发表时间',
  `level` tinyint(4) DEFAULT NULL COMMENT '刊物级别',
  `teacher` varchar(50) DEFAULT NULL COMMENT '指导老师',
  `listorder` varchar(255) DEFAULT NULL COMMENT '作者顺序',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `path` varchar(250) DEFAULT NULL COMMENT '论文原文',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf32 DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `pfk_id` (`student_id`),
  CONSTRAINT `pfk_id` FOREIGN KEY (`student_id`) REFERENCES `system_student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of graduate_paper
-- ----------------------------
