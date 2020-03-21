/*
MySQL Data Transfer
Source Host: localhost
Source Database: mufan
Target Host: localhost
Target Database: mufan
Date: 2018/9/8 14:42:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for dev_campaign
-- ----------------------------
CREATE TABLE `dev_campaign` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学生编号',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '活动名称',
  `depart` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '负责部门',
  `campaign_date` date DEFAULT NULL COMMENT '活动时间',
  `amount_time` float DEFAULT NULL COMMENT '活动时长',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '活动照片',
  `understanding` mediumtext COLLATE utf8_bin COMMENT '活动感悟',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dev_work
-- ----------------------------
CREATE TABLE `dev_work` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学生编号',
  `depart` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '学生工作部门',
  `duty` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '学生工作职务',
  `start_date` date DEFAULT NULL COMMENT '工作起始日期',
  `end_date` date DEFAULT NULL COMMENT '工作结束日期',
  `result` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '工作考核结果',
  `certifier` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '证明人',
  `others` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '其他说明',
  `appendix` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '相关附件',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `dev_campaign` VALUES ('0000', '456', 'yiyi', '王仪涵大学', '2018-08-23', '1', '', '', '1', '', '2018-09-08 14:06:10', '1', null, null, '1');
INSERT INTO `dev_campaign` VALUES ('111', '123', '111', '111', '2018-08-23', '1', '', '', '1', '', '2018-09-08 14:06:08', '1', null, null, '1');
INSERT INTO `dev_campaign` VALUES ('2529c52f3242430f9360ae1af0763e6e', '1', 'xxx', '武汉大学', '2018-08-31', '1', '', '', '1', '', '2018-08-31 15:56:17', '1', '2018-08-31 15:36:40', '1', '1');
INSERT INTO `dev_campaign` VALUES ('3cd6c9e6307e4cc3a14e1f2e50f8a604', '1', '你好', '华中师范大学', '2018-08-31', '2', '', '', '1', '', '2018-08-31 15:56:31', '1', '2018-08-31 15:38:33', '1', '1');
INSERT INTO `dev_campaign` VALUES ('4395ea95e9704dfaadd00198ca977bad', '123', '谢谢谢谢谢谢', '武汉大学', '2018-09-08', '1', '', '', '1', '', '2018-09-08 14:05:59', '1', '2018-09-08 13:14:26', '1', '1');
INSERT INTO `dev_campaign` VALUES ('5c22314ddb62495b8f45705f336ed578', '123', '111', '武汉大学', '2018-08-23', '1', '', '', '1', '', '2018-09-08 14:06:04', '1', '2018-08-31 20:42:15', '1', '1');
INSERT INTO `dev_campaign` VALUES ('60040d33f6304e37aa71181e89c68dbf', '1', 'Jackson', '武汉大学', '2018-08-31', '1', '', '', '1', '', '2018-08-31 16:53:13', '1', '2018-08-31 15:46:05', '1', '1');
INSERT INTO `dev_campaign` VALUES ('8c6a8a9adf0442f998c61a5b9be11b93', '1', '鹿小葵', '华中师范大学', '2018-08-31', '1', '|/jeesite/userfiles/1/files/dev/devCampaign/2018/09/%E6%8D%95%E8%8E%B71.PNG', '', '1', '', '2018-09-08 14:06:02', '1', '2018-08-31 15:55:37', '1', '2');
INSERT INTO `dev_campaign` VALUES ('aa9d878049f748c88cc310ebf375ddbf', '', '张三', '武汉大学', '2018-08-31', '1', '', '', '1', '', '2018-08-31 15:55:47', '1', '2018-08-31 15:53:09', '1', '2');
INSERT INTO `dev_campaign` VALUES ('c27816b8947147ab8bc22a89ab38fc77', '1', '讲座', '教务处', '2018-09-05', '1', '', '', '0', '', '2018-09-08 14:16:09', '1', '2018-09-08 14:16:09', '1', '2');
INSERT INTO `dev_campaign` VALUES ('c5f337f75eec46b588108fb123deea17', '730779e10f61492ca1497e6e39ae0b65', '志愿服务', '志愿者协会', '2018-08-31', '2', '', '', '0', '', '2018-09-08 14:08:38', '1', '2018-09-08 14:08:38', '1', '1');
INSERT INTO `dev_campaign` VALUES ('f5d9a8fb33144ad299ca8403b266328c', '456', 'Jackson', '武汉大学', '2018-08-03', '1', '', '', '1', '', '2018-09-08 14:06:06', '1', '2018-08-31 17:40:38', '1', '1');
INSERT INTO `dev_work` VALUES ('0e169f7880f6435481336c69134fd442', '1', '学生事务大厅', '助理', '2018-08-08', '2018-09-08', '合格', '李四', '', '', '0', '', '2018-09-08 14:16:44', '1', '2018-09-08 14:16:44', '1', '2');
INSERT INTO `dev_work` VALUES ('64b1cccb5f804e88af7a905c780a7c77', '456', '武汉大学', '助理', '2018-08-01', '2018-08-31', '1', '1', '', '', '1', '', '2018-09-08 14:09:21', '1', '2018-08-31 21:08:26', '1', '1');
INSERT INTO `dev_work` VALUES ('abb448e4ed7342339ae870701475fb32', '1', '武汉大学', '助理', '2018-08-02', '2018-09-01', '2', '1', '', '', '1', '', '2018-08-31 21:09:19', '1', '2018-08-31 21:08:55', '1', '2');
INSERT INTO `dev_work` VALUES ('b4b4bd7599b749e98f70f84f7734f1b9', '1', '武汉大学', '助理', '2018-08-01', '2018-08-31', '1', '1', '无', '|/jeesite/userfiles/1/files/dev/devWork/2018/09/%E7%AC%AC%E4%BA%8C%E6%AC%A1%E4%BD%9C%E4%B8%9A_doc.pdf', '1', '', '2018-09-08 14:08:53', '1', '2018-08-31 21:09:51', '1', '2');
INSERT INTO `dev_work` VALUES ('bb6b2d135e6c4aeeb9609ba47066dbf6', '1', '华中师范大学', '助理', '2018-08-01', '2018-08-31', '1', '1', '', '', '1', '', '2018-09-08 14:08:55', '1', '2018-08-31 21:08:39', '1', '1');
INSERT INTO `dev_work` VALUES ('cf56fa550b614bb5ab0e48948706690e', '123', '武汉大学', '助理', '2018-08-01', '2018-08-31', '1', '1', '', '', '1', '', '2018-09-08 14:09:01', '1', '2018-08-31 21:08:13', '1', '1');
INSERT INTO `dev_work` VALUES ('d8db46c24f904189bff08f88afd5fdd3', '730779e10f61492ca1497e6e39ae0b65', '宣传部', '助理', '2017-09-08', '2018-09-08', '合格', '李四', '', '', '0', '', '2018-09-08 14:10:11', '1', '2018-09-08 14:10:11', '1', '1');
