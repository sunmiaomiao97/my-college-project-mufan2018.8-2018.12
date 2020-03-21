/*
MySQL Data Transfer
Source Host: localhost
Source Database: mufan
Target Host: localhost
Target Database: mufan
Date: 2018/8/17 11:13:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for abroad_language
-- ----------------------------
CREATE TABLE `abroad_language` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '编号',
  `student_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '学生编号',
  `sort` tinyint(4) DEFAULT NULL COMMENT '语言类别',
  `grade` float(11,0) DEFAULT NULL COMMENT '语言分数',
  `ispass` tinyint(4) DEFAULT NULL COMMENT '是否通过',
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '上传路径',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for career_quali
-- ----------------------------
CREATE TABLE `career_quali` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '证书名称',
  `sort` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '证书类别',
  `level` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '级别层次',
  `path` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '上传路径',
  `pass_time` datetime DEFAULT NULL COMMENT '通过时间',
  `creat_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records 
-- ----------------------------
