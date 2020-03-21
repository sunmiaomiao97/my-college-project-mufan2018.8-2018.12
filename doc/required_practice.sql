/*
MySQL Data Transfer
Source Host: localhost
Source Database: mufan
Target Host: localhost
Target Database: mufan
Date: 2018/8/31 17:26:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for required_practice
-- ----------------------------
CREATE TABLE `required_practice` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `student_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '学生编号',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '团队名字',
  `prac_time` datetime DEFAULT NULL COMMENT '时间',
  `teacher` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '带队老师',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `del_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `studenid` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `required_practice` VALUES ('0bb6e54f3447437a821b849de94c342e', '123', '王远哈', '2018-08-06 00:00:00', 'sss', '1', '2018-08-30 20:46:59', '1', '2018-08-30 20:46:59', '', '0', '1');
INSERT INTO `required_practice` VALUES ('21dc78e1fb164e399ba26291eb3e25d9', '123', '1111', '2018-08-07 00:00:00', '3', '1', '2018-08-29 14:11:10', '1', '2018-08-29 17:05:56', '', '1', '1');
INSERT INTO `required_practice` VALUES ('64c9a8831fb741b382c30a41b1391c62', '123', '1111', '2018-08-17 00:00:00', '3', '1', '2018-08-31 17:24:28', '1', '2018-08-31 17:24:28', '', '0', '1');
INSERT INTO `required_practice` VALUES ('7b447f76ecd144c5bd14a16e46a223b6', '123', '王远哈', '2018-08-10 00:00:00', 'sss', '1', '2018-08-29 14:09:14', '1', '2018-08-29 17:05:58', '', '1', '1');
INSERT INTO `required_practice` VALUES ('89efcfad1a9b42d6980c158dc6e0db44', '123', '11111', '2018-08-07 00:00:00', 'sss', '1', '2018-08-29 17:05:49', '1', '2018-08-29 17:06:02', '', '1', '1');
INSERT INTO `required_practice` VALUES ('9bcc44ffdfdf4ef9962de58bb29e626d', '123', '王远哈', '2018-07-31 00:00:00', '3', '1', '2018-08-30 20:49:19', '1', '2018-08-30 20:49:19', '', '0', '1');
INSERT INTO `required_practice` VALUES ('9da575bb172c493a950d3f8426885a34', '123', '社会实践', '2018-08-06 00:00:00', 'sss', '1', '2018-08-29 17:06:09', '1', '2018-08-29 17:06:09', '', '0', '1');
INSERT INTO `required_practice` VALUES ('bfbc8ff4c80047e4bebbe53e74cb9f2a', '123', '1111', '2018-08-15 00:00:00', 'sss', '1', '2018-08-29 14:40:02', '1', '2018-08-29 17:06:00', '', '1', '1');
INSERT INTO `required_practice` VALUES ('ef8b02959b074c7a8f40a0068bdf0965', '123', '王远哈', '2018-08-07 00:00:00', 'sss', '1', '2018-08-29 14:37:45', '1', '2018-08-29 17:05:54', '', '1', '1');
