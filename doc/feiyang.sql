/*
MySQL Data Transfer
Source Host: localhost
Source Database: betterfanskuangjia
Target Host: localhost
Target Database: betterfanskuangjia
Date: 2018/8/14 10:39:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for test_practice
-- ----------------------------
CREATE TABLE `required_practice` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '团队名字',
  `prac_time` datetime DEFAULT NULL COMMENT '时间',
  `teacher` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '带队老师',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

 
CREATE TABLE `graduate_project` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `sort` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '类别',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `num` int(50) DEFAULT NULL COMMENT '参与人数',
  `listorder` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '顺序',
  `teacher` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '带队老师',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` char(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records 
-- ----------------------------
 