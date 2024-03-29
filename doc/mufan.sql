/*
MySQL Data Transfer
Source Host: localhost
Source Database: mufan
Target Host: localhost
Target Database: mufan
Date: 2018-8-13 19:41:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
CREATE TABLE `cms_article` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
CREATE TABLE `cms_article_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `content` text COLLATE utf8_bin COMMENT '文章内容',
  `copyfrom` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章详表';

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
CREATE TABLE `cms_category` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) COLLATE utf8_bin DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
CREATE TABLE `cms_comment` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '留言分类',
  `content` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '留言内容',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '电话',
  `workunit` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '单位',
  `ip` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
CREATE TABLE `cms_link` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '链接名称',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='友情链接';

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
CREATE TABLE `cms_site` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点标题',
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) COLLATE utf8_bin DEFAULT 'default' COMMENT '主题',
  `copyright` text COLLATE utf8_bin COMMENT '版权信息',
  `custom_index_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点表';

-- ----------------------------
-- Table structure for dev_campaign
-- ----------------------------
CREATE TABLE `dev_campaign` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '活动名称',
  `depart` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '负责部门',
  `campaign_date` datetime DEFAULT NULL COMMENT '活动时间',
  `amount_time` float DEFAULT NULL COMMENT '活动时长',
  `understanding` mediumtext COLLATE utf8_bin COMMENT '活动感悟',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标记',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '注记',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建日期',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dev_game
-- ----------------------------
CREATE TABLE `dev_game` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `student_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '学号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '赛事名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '赛事等级',
  `game_time` datetime DEFAULT NULL COMMENT '比赛时间',
  `sponor` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '主办方',
  `sort` tinyint(4) DEFAULT NULL COMMENT '类别',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for dev_honor
-- ----------------------------
DROP TABLE IF EXISTS `dev_honor`;
CREATE TABLE `dev_honor` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `student_id` varchar(64) DEFAULT NULL COMMENT '学生编号',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `student_no` varchar(20) DEFAULT NULL COMMENT '学号',
  `honor_name` varchar(100) DEFAULT NULL COMMENT '荣誉名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '荣誉级别',
  `unit` varchar(150) DEFAULT NULL COMMENT '颁奖单位',
  `time` date DEFAULT NULL COMMENT '颁奖时间',
  `sort` tinyint(4) DEFAULT NULL COMMENT '荣誉所属类别',
  `status` tinyint(4) DEFAULT NULL COMMENT '审核状态',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` varchar(1) DEFAULT '' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `hfk_id` (`student_id`),
  CONSTRAINT `hfk_id` FOREIGN KEY (`student_id`) REFERENCES `system_student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
CREATE TABLE `gen_scheme` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
CREATE TABLE `gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
CREATE TABLE `gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
CREATE TABLE `gen_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
CREATE TABLE `oa_leave` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请假流程表';

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
CREATE TABLE `oa_notify` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
  `status` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

-- ----------------------------
-- Table structure for oa_test_audit
-- ----------------------------
CREATE TABLE `oa_test_audit` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
CREATE TABLE `sys_area` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
CREATE TABLE `sys_dict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `value` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
CREATE TABLE `sys_log` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
  `params` text COLLATE utf8_bin COMMENT '操作提交的数据',
  `exception` text COLLATE utf8_bin COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
CREATE TABLE `sys_mdict` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多级字典表';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
CREATE TABLE `sys_menu` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
  `is_show` char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
CREATE TABLE `sys_office` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
  `code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
  `grade` char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
CREATE TABLE `sys_role` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `enname` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
CREATE TABLE `sys_user` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `company_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `user_type` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
CREATE TABLE `test_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
CREATE TABLE `test_data_child` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
CREATE TABLE `test_data_main` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `sex` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
CREATE TABLE `test_tree` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('2087c06b93f14d8cae7048e1002139c1', '1', 'test_audit.png', '2e1e8bdb94ff4f4ca831b4fddae50882', 0x89504E470D0A1A0A0000000D49484452000003DC0000017C08060000003DD3B3DA000053E24944415478DAEDDD0B7C54F59DFFFF53A08AB7BF68A9CBB2FC6CEA6581D5AE5A31868B17349658A0E2AD4B5D8AAC525656A922D40B5A2FC0221A318518110C1711630AC4809186909A442E4908E112638C3166A5980245C4D218631CE3F77F3EDF39E730339949324998CC4C5ECFC7E3F3C85CCE5C32E7FB3E733E73CE9C310C000000000000000000000000000000000000000000000080EEA70F2F0100000000009D2BC12C65FD0500000000009D20DEAC2FCC4AB2FE8EE1250100000000A0739A6DBBC9962DDC9FD1740300000000D079CD766B970300000000805624B4D254DBD7F39D6E0000000000826CB65B6BA6D9D20D00000000401BC51BC16DB90E767A0000000000BA6DB33DA61DB7ABA3E90600000000A0F39AEDCEBA3D000000000051A7B503A485FA7E0000000000889A66BBB37607674B3700000000A0DBF33DE0D9F7CCBAD3FA1B0CDFDB7120350000000040B76FB6C77834CDCBCC52D6DFB636DD816E47D30D00000000E8F6CDB6B8D36A9A55104DB767B36DD7448FEBF94E3700000000A0DB08D404FB6B9E5B6ABAFD4D9FEA677ABED30D00000000E836CD7642104DB4BFA6BBADCDB66FD3CDEEE50000000080A8D3D6A6B7B5A63BD866DBF3F13F33D8D20D0000000088C266BBADCD6EA0A6BB473B9B6D1BDFE9060000000074DB66BBA5A6BBAA03CD76479F0F000000000061A3A35B94FD35DD1D69B67D9B6EBED30D000000005D2CCEACC7CDCA366BA7D5AC29AA4D95D4C1D75E7623F7DDB25D655DDE1149CC1B8AA2288AA2282ACAAACEAC6AB372CD7AC6706F68EA453B8770D4D71AA49F9A5564D61CB3C69975B1597D7879DAA4B5A392B7A6A52DDC6DF99DEE40D8C20D00008068247DCA20C3BD87A9F4325BCD3A68B83736F5E3E541B8986C35DA8BCDBA8097A343A4B9AD334ECC77B8DBD374F31D6E000000742703CC4AB6D68167F272A02BC9EE166F98956FB8B764A3F39AEE60B62807FAE92F7F47290FA6E9E628E5000000E8AE64CB77B9E1FE9AECE9BC1CE80AD26C67197CCFE14436DDAD35BBADFDCE766BBFD31DC81083DFE106000040F7D6C7EA77B2E979106AB21B793E03EF846A6D0B736BCDB6D1CEA6DBDEAD7D1CB30000000034DD7A4BF723BC14081539409A7C679BDDC84FBC405BBADBDA6C07DB74DB8F47B30D000000B8C9EEE5B2F72707524348C811FC9279194226C168BE7BF79D46F0BFB3EDAFE99EE8F3387C671B000000684EFA9F245E0684826CDDE668E4A16FBA3D0FA4E6D93CB7A5D9365AB91D3FFD050000000426472F979F0CE32BB538A1E20CF7EF6C23F47C772F976679A211FC4F7DF9DEAEA3BFFF0D00000074075B5967C689F69459737819C2A6E9EE287FBBAB03000000684EFAA06778197022C921F139A0567434DD9DDDBC03000000D14CD69B7379197022ED34383A7938E8E86EE0EC460E00000004478E565ECDCB8013499AB43EBC0C61D57407BB859A03A401000000C1933EA88E97012792E225082BC1EE16CE6EE400000000FD101860E8E4267A88E1FE448EEFE003000000F4436080A18D12AC663AA185EB3FA3D906000000E887C00043F0026DE9663772000000807E080C307472D34DB30D000000D00F8101864E6EBA9368B601000000FA2130C0D0B9A659F38A9FFE02000000E887C0004327CAB2E6552F5E0A000000807E080C30748E38B35C065BB801000000FA2130C0D0A932ADF924B5939703000000A01F02030C1D37C438BE75DB2E0E9A06000000D00F8101860ECAF269B6EDADDC7C971B000000A01F02030CEDE46FEBB65DE3787900000000FA2130C0D03ED9019A6DA9225E1E000000807E080C3004AFA5ADDB7C971B000000A01F02030CED94D54AB3CD11CB01000000FA2130C0C0BC0200000058C706030CCC2B00000080756C8001C6BC02000000C03A361860605E01000000AC63830106E615000000C03A36C000635E01000000601D1B0C3030AF00000000D6B1C10003F30A000000601D1B608031AF00000000B08E0D0618985700000000EBD86080817905000000B08E0D30C098570000000058C706030CCC2B00000080756C30C0C0BC0200000058C7061860CC2B00000000AC63830106E615000000C03A361860605E01000000AC63030C30E61500000000D6B1C10003F30A000000601D1B0C3030AF00000000D6B1010618F30A00000000EBD86080817905000000B08E0D0618985700000000EBD800038C7905000000B08E0D30C09857BC0400000000EBD86080817905000000B08E0D0618985700000000EBD800038C790500000080756C30C0C0BC0200000058C706030CCC2B00000080756C8001C6BC02000000C03A361860605E01000000AC63830106E615000000C03A36C000635E01000000601D1B0C3030AF00000000D6B1C10003F30A000000601D1B608031AF00000000B08E0D0618985700000000EBD86080817905000000B08E0D30C098570000000058C706032CA4FFB052BD535252664E9C38716F6C6C6C43EFDEBD95F53A509D503D7BF6FCEEFCF3CFFF6CF8F0E11BCDBF238918000000E887C000EB06962D5B76CFC89123EB636262D49C39B3557E7E9E6A68F8CAECC1BFA33AA9E4F52C2A2A548989CFA981030736F6EFDF7FAFF9D25F4CD4000000403F040658944A4D7D657DBF7EFD5452D20BCAE56A349BC3262A04959CBC48F5E9D3E7AB534F3DF526E206000000FA2130C0A2B0D9BEE0820B5451D176B309FC960A71959797A9BE7DFBFEC39C1563881C000000E887C0008B12CB962DBD47B66C17156D339B3F97572D5DFA921A3326418D1A75BDBAFEFA6BD40DF12355F2A2A466D3511DAFF2F2BDEA94534EF9C260F772000000D00F81011605FF9C52BD478EBCA63E29E979F3E4375EB562F95235FAE7A3D4ADB78CD53576CC8D2A3EFE5A3574E8156A916EBABFA13AB91213E77FDEAB57AF3C6207000000FA2130C0225C4ACAC29931313F522E57BDD9F0357A55C2A878DD68DF70C348A77EF6B3EBD4F061579A4D776CB3E9A9CEA9B3CF3EFB5373D6C4113D000000D00F810116C1264E9CB077CE9C27CD46EFEB663562789C7A61C17C95F556864A7931496FD9BE6AC4507DB99C76B9BEF47B3BAA63356DDABD3BCD599348F4000000403F040658048B8D1DD2909F9F63367A0DCDEAEEBB27AA837FFD546DDDF28ECAFED306B5EAD554B53E738DFAB8FA43F53F5327AB6FBFFDD2EFEDA88ED5BBEFE61E3067CD4EA207000000FA2130C02258EFDEBD5543C3E766A357DFAC1E9BF5902A2EDAA276146F55BB7795E892D33B766C578F3DF690DFDB501D2F991FE6AC71113D000000D00F810116E1FF9F525F362B97EBEF6AD6AC996ACA6F26A992924255FEDE1E5DBB76ED50D3EEFB6F35E3C1FBD4D75F7FEEF7B654C78B051B000000E887C0008B8A86BBCEAB1A1B3F57EBD6BDA662637FAAAA3FAA540F4EBFCFAB4A4B8BD590CB2F55AFAF4E550D0D9F35BB3DD5F162C106000000FA2130C0A2A2E1FE8753DF7D774CBDB5215D0D1B1AAB6AAAABD47B65BB55EEE68D2AF3CD3FAAB4D757AAD4575E329BF134BD7BF995575EAED2D357A86FBFFDC2EB3EA88E170B36000000D00F810116150DF731A7B66ED9A47F6B5B9AECBCBCCDEACD8C74DD68AF58BE44BDBC78914A7AE159F5CCBCA7F501D416BFB4505D7BCD08B5F1ED355EF74175BC58B0010000807E080CB0A868B8FFEED463B37EA78F442E8DF5B2D4C5BA96BC9CAC92172D50CF27CE53FF3BF749F5C4EF1F513367FC563DF9C4A366B39DA97E37F37EAFFBA03A5E2CD8000000403F0406585434DC5F38250DB7FC04D8EDB7DDACDE487B5537DAD27C3F3B7F8E9A3BE709F5DCB37375D32D4DF898D1096A73CEDB56C3FD05D589C5820D000000F44360804545C37DD4A9BD7BB7A9471F99A17E79FB38DD50CBAEE4FE2A2E6E88FAF584F17A6B7769E9BB5EF74175BC58B0010000807E080CB0A868B83FF72AD7377F535F7EF9A94A7CEE699530EA3A3562F8956AE8D02B54DC9543D450B3D1BEE6EAE1EA81FBEF51C78EFD454FEB7B7BAAE3C5820D000000F44360804545C37D840AB362C106000000FA2130C0A2A2E1FE8C0AB362C106000000FA2130C0A2A2E13E4C8559B16003000000FD10186051D170FF8D0AB362C106000000FA2130C0A2A2E13E448559B16003000000FD10186051D1701FA4C2AC58B0010000807E080CB0A868B80F5061566D18774F98D5403C010000403F0406585837DC7FA5C2AC5A1877D2687F6D5DCFC20F000000F44360808577C35DEBB7E4BA850B67ABC4C4C775EDDB57AC2F2B29D918F036C196DC5F6666AA733A27E7757DBABA7A5BC0DB9497BFA3F6ECC9F17A1EBECF4BCECF9A35ADD963CD9F3F4B9F3E74688FD77555555BF4F5478E94377BBCDADAD26697555616E8E96B6A0AF5F90D1B96AB33CE38BDDDFFBBBFEB5A69B469B8010000403F040658F837DC9FFAADE30DA1F76559592BBC2EBBF9E6043579F2AFCC86BC48979CBEF7DE3B9DF3729BB9731F72A6EFD9B3A74A4E9EE35CE76EE6DDA7CBCBFF6C36CE6FAB33CF3C434F5B5DBD553F9EDD606EDCF8AA1A3FFE176AC2845BF469B9ACB676A7FE2BD37A3ECF952B5F704EEFDFBF43FFADACCC5705056BF569794CCFE967CF9EA98E1E7D5FFFCF727ECA94FF741EC3BE2FCFE91F7FFCB75EE72FBFFC277AFAD1A3AFD7CFCFBEEEC61B47AAE9D37FA31FEFDC73FF45CD9831C56CF0DFD5B7A9A8C80BF8DA5BF3679EE1DE755C0528000000807E080CB0F06DB8F7FB2DBBA94C4C7C4C97DD146FD9B22EE06DA42EBCF0C72A36F6D216A7B1EF5F9ACFC387F7E8F3070E94EABF7979E9FABAFAFA2A7D5E1E5BCE9F724A6FDD7C8F1D1B6F36C37798CDED4A7DF9B1631F585BB8B3D4A143BB9DCB972C99AF9F4B46C612B560C1EFF565757595FA6F41C11AE77948132E973535EDD37FABAADC5BAFE5F9AC59B3586DD8B0CCEB79DBD36567AF52A5A51B556E6E9A7ECE725EFE17FBB1FDFDCFF23FC8EB77CE393F50C3865DAE9FABFD7CF7EF2FF67A6D0CFF5BB469B8010000403F040658E434DC7F695665659BD49E3DD9AAB1F163AFAAADDDA11B447FB7B1EB78C3EDFFFA82823FAA6BAF8D533939AFA9949439EAB4D34E359BE60A75F2C927A93BEEB8C96C62DF369BDA4F9CE9EDE652A6ADABFB40A5A7BFA8060E3C4F2D5CF894BE5CA67737D31F78DD46A697D32E578D2A2FDFAC2F4B4D7D4E3F5645C59FF575870EEDD297A7A52D5283075FA09B79FBF6F6FDCAEB20A7EDFB5EB52AC9DAFABF54DD7CF328E771ECE7939BFB7AC0FF5DB6DCCBF5329DBCC6F663C97D794ED786469BA2288AA22877D599B5C7AC6CB39E312BDEAC5EACC202F44360808549C3BDAF592D59324F5D74D1BFAA2D5BD6A8D5ABFFA0AEBB6E989A3DFB417D5E6E5358F8A6DFDB49B91BEE4B025E2F65E82DC9EE2DCBF3E63DA48E1CD963ED1E5EACAF97F39ED326253DA1060CF867B3A9AE50C9C94FEBCBA64E9D607D57FB5EBD9BBA3D7D6363B5F3265C5D5DA0B2B296A98D1B5778955CB76DDB3A3D7D76F6ABAAA6668BD7E31B7A2BF81FF56DFBF63D5B6F8D96CB8F1E2D536BD6A4E8867FFAF4BB557CFC087DD94F7E32488D1E7D9DBE6F792EF2E1815C6EDF974C27D7C5C40C50975C32D86CBA577B3D965CE7FBFA58F3E715B3BE35C2730B771FB3069935C6ACC7CDCA35EBA0594966F563D101049D236914B6922380F723807E080CB0A86AB83F695672F95D77FD529F4E4B5BA8B7427B5E9799B9C4EFEDA42EBC30C66AB89B5F575FFF81F55DE7E5FA7E648BB69C2E2BCB76EEF7ACB3CED4BB5CEFDF5FE83C9E34A90505E9BAD996A6559ADB55AB5EB0BE8BBDCDF92BD3A7A6CEB7B64C6FB41AEBB57EFF3FFB7F387A74AFF57DEACDFA7C6D6D91F3DCEC6957AF4ED2A70F1FDEE55C26CDF88D375EAB1F4F2E5BB8F049DD6837347CA8FF4FCFC7CAC858EC9C970F0D9A9A6A9C0F040CFDDDF59C66CFCF673EBD1AA0F10E3703ACA6415674EE61F101B43B47C9667D61D64C5E0E80F723807E080CB0886EB8FFAF59B91BEEDB9DD3D3A7DFE5755D66E6CB7E6F2775BCE1F67F7D71F19BFAF676232BBB725757BBB776BB5CD5CDEE5FCE2F5E2CBB93BFAF0E1C2856E9E98BCCA6FD625553E36E560F1D2AB1BEC3BDDE6C643F562929B3AD03A4E5EADB6FD8B05437F59326DDA6CB6EF6E5FA86864AA77995E90A0BD7A98B2EBA5037E9EE263CC76AE6B7367B7DC68EBD5EDD7A6B82D92C6FD2FFF39123BB5476F60AEB68EBAF7A4DEB6EB8BD5F87C4C447F5070B5959A97E5FFF00F3CB778B77B8922D0DB28561AD59A7B31801DA9DA372C3BD9B2C3902783F02E887C0008BCC86BBA65919FA27C19E50F5F5EF5B074A4B379BD03566435B6D36ACCBFCDEC6AEE30DB7FFEB6B6B0BD5F2E5CF5A3FD3F590D96CE7A9F3CEFB7F6AEEDC079DC77637DCC79F4B72F293BAA1DDB76F8B6EB8E5B2C6C60FADADC479D62EE0696613BDD96CDA3FB29AF917023E07CFC73876ACCC795E72FF863E605A91D948675BDF057FDAEFEDA5E1B6FF4F795CF97EF61D77FC42DF56AE5FB0609633AD5C7FF4E86E75D965FFA666CF9EAE2F97D7D4D0DFF95EE5F7FE5B996FF616EF7026DF9FCBB2567200B44F1F2B47D906DF4905783F02E887C0008BC486FB63BF75E448A9F5B35D8FE8F315159B9CADC10D0D15FAB2C3874BD44D37C5EB9A3265BCD93CBEAAB7DA9E7B6E7F7D5A2A2D2DC93A08D97A7D1B437F577ABBD52CBFA31B5A431F25FC23E7FACCCCC5CEF390F3C386FDD46CF4535546468A4A4D7D463F867D9DDC87A177F15EEA759BF2F23FA9C2C2B5BA09969A34E9565D723FEE2638C76C82DD074DEBD7EF87AAACCC7D90B4BCBCD5CEF35BBC78B6B5F57B89D76B63E803B03D6336FD95FAB9DD7BEF0475E850B19A376FA6FAFEF77BE9FBF29C566AD5AAE79DFF511E431E535E1FFB317DEF3F8A567264CB02BBF3011D6BBA654BF723BC1400EF4700FD10186011D770577B554ECE0ADDBCF6EF7F8ED974EF6C76BDDC66DAB489CEF98686F79B4D13A81A1B3FD0D3CBFDCBFD1C3EBCC36A385FF3BA7F77F37CFC7C4949863EED727D681DE13B4B9F6F6AAA72A6292878DDEB360B163CAAA7F7F73CE4FAE2E275FAF4BE7D05FAAF7C77BCA6264FDFCFE0C1E73BD3CA63B93F30C8F4BAFD810385FABA6DDBD2D5E8D1D7AA5B6F1DE5F7F1E4B9DB97575464ABABAFBE4237F2BEF7BF7AF502AFFB8FA23126BBF37D6A70E01AA0A339FA8C1C01BC1F01F4436080455CC3FD51445553D3879D324DA89E4B7BA68FC2712707AE496271027448323902783F02E887C0008BB886BB8A0AB38AC27127478B9523C5F21D54801C01E408A01F02BA53C3FD21156615A5E34EBE3B97C02205E890ADE408E0FD08A01F02032CA21AEE4A2ACC2A4AC7DDE3867B573E00ED37871C01BC1F01F44360804554C3FD01156615A5E36E8CE1FE6923001DCB512E2F03C0FB11403F040658C434DC15549855948E3B393AEC1E162940877354CDCB00F07E04D00F810116310DF7FB549855948E3BF92DE13A1629003902C811403F0474A386BB9C0AB38AE271C7021B2047003902C80BD09D1AEEF7A8302B1A6E00E4082047007901032C2A1AEE322ACC8A861B003902C811405EC0008B8A867B2F156645C30D801C01E408202F60804545C3BD870AB3A2E106408E007204901730C0A2A2E1DE4D8559D170032047003902C80B186011EEE4934FFAAEA1A1C86CF2765161525F7D55B8CF9C352EF204801C01E408202F608045B0C1837F7C283F7F89D9E895526152EBD73FFFB6396B76922700E4082047007901032C825D75D565EBE6CC994AA31B463576EC5569E6AC49244F00C811408E00F2020658041B30E007B103069CF38DCBB58366373CEA931E3D7A5498B3268E3C012047003902C80B186011AE7FFF1F9626253D48B31B063566CC554BCD59924B9E009023801C01E4050CB0E830E8CC334FAB2F2A5A41D3DB85959FBF74BD392F0E9A75317902408E007204901730C0A247FC39E79CFD779AEEAE6BB67BF4E85163CE8731E409003902C811405EC0008BC2A6FBA493BE7F6CDEBCFB3EE73BDDA1FBCEB6B51BF9C16ED06CB3C006C811408E00F20274EB0136A867CFEFE59C7EFAA987A74CB965F7A64D2F1E6C6828A431EEC4FAEAABEDFBE4A7BFE468E4D601D2E43BDB17932700E408204700790103AC7BB8D4AC39666D35ABC17A1DA8CE2997E1FE9D6DF9E9AF38F204801C01E408202F6080219C6559F3AA172F057902C811007204901730C0D039642BB1CB9A5709BC1CE409204700C811405EC00043E7C8348EEFAEBD9397833C01E408003902C80B1860E8B821C6F1ADDB768DE165214F003902408E00F20206183A26CB687E5032D9CACD77B9C913408E00902380BC80018676F2B775DBAE71BC3CE409204700C811405EC00043FB641B817F7AAB8897873C01E408003902C80B1860085E4B5BB7F92E377902C811007204901730C0D04E59AD34DB1CB19C3C01E408003902C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408003902C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408003902C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B1860605E318F007204801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B4E882C6B40B5543B799958188079049023801C01E40508CE10B35CAD34DC63789958188079049023801C01E405085E760BCD769159BD788958188079049023801C01E40508DE90161AEE71BC3C2C0CC03C02C811408E00F202B49FBFEF72CB77B7D9BACDC200CC23801C01E408202F4007F8FB2E37DFDD666100E611408E0072049017A013641A6CDD666100E611408E0072049017A0D3C57934DC09BC1C2C0CC03C02C811408E00F202741EFBBBDC6CDD666100E611408E0072049017A0130D6180B13000F3082047003902C80B22678E29D53B252565E6C48913F7C6C6C636F4EEDD3BD0CF70512D54CF9E3DBF3BFFFCF33F1B3E7CF846F3EF4846160B03E611408E00902380BC7463CB962DBB67E4C891F53131316ACE9CD92A3F3F4F35347C65F6E0DF514196BC6E4545852A31F1393570E0C0C6FEFDFBEF355FE28B5918807904902300E408202FDD4C6AEA2BEBFBF5EBA792925E502E57A3D93436519D58C9C98B549F3E7DBE3AF5D4536F626100E611408E00902380BC74A366FB820B2E504545DBCDE6F05BEA0455797999EADBB7EF3F8CEEF9BBE12C0C9847003902408E00F2D2BD2C5BB6F41ED9B25D54B4CD6C0A5D5EB574E94B6ACC9804356AD4F5EAFAEBAF5137C48F54C98B929A4D47B5BDCACBF7AA534E39E50BA3FBED5ECEC2807904902300E408202FDD68EE28D57BE4C86BEA93929E374F7EE3552B962F55A37F3E4ADD7ACB585D63C7DCA8E2E3AF5543875EA116E9A6FB1BAA9D959838FFF35EBD7AE5B13000F308204700C811405EA2544ACAC29931313F522E57BDD908367A55C2A878DD68DF70C348A77EF6B3EBD4F061579A4D776CB3E9A9E0EAECB3CFFED49C05712C0CC03C02C8110072049097283471E284BD73E63C6936805F37AB11C3E3D40B0BE6ABACB73254CA8B497ACBF6552386EACBE5B4CBF5A5DFDB516DAB69D3EEDD69CE82441606601E01E408003902C84B148A8D1DD2909F9F6336800DCDEAEEBB27AA837FFD546DDDF28ECAFED306B5EAD554B53E738DFAB8FA43F53F5327AB6FBFFDD2EFEDA8B6D5BBEFE61E3067C14E1606601E01E408003902C84B14EADDBBB76A68F8DC6C00EB9BD563B31E52C5455BD48EE2AD6AF7AE125D727AC78EEDEAB1C71EF27B1BAAED25AFBB390B5CDD64A825580B830452C7021B204700C811405EBACD0C52EACB66E572FD5DCD9A35534DF9CD24555252A8CADFDBA36BD7AE1D6ADA7DFFAD663C789FFAFAEBCFFDDE966A7B759380C49B2547654FB2FE8E21762CB0017204801C01E4A59B34DC755ED5D8F8B95AB7EE35151BFB5355FD51A57A70FA7D5E555A5AAC865C7EA97A7D75AA6A68F8ACD9EDA9B657370848BC4F932D5BB83FA3E966810D902300E408202FDDA4E1FE8753DF7D774CBDB5215D0D1B1AAB6AAAABD47B65BB55EEE68D2AF3CD3FAAB4D757AAD4575E329BF134BD7BF995575EAED2D357A86FBFFDC2EB3EA8B6579407C4B7D96EED72B0C006C8110072049097686BB88F39B575CB26FD5BDBD264E7E56D566F66A4EB467BC5F225EAE5C58B54D20BCFAA67E63DAD0FA0B6F8A585EADA6B46A88D6FAFF1BA0FAAED15C5014968A5A9B6AFE73BDD2CB0017204801C01519A970166DD67D65AB3AACDAAB39E7083599F989569D64C6BBA286EB8FFEED463B37EA78F442E8DF5B2D4C5BA96BC9CAC92172D50CF27CE53FF3BF749F5C4EF1F513367FC563DF9C4A366B39DA97E37F37EAFFBA0DA5E51FA86D2D6669A2DDD2CB0017204801C015198977166E55A4DF62B66DD66D620B34EB7AE97BF31562390644D976FD684E86CB8BF704A1A6EF909B0DB6FBB59BD91F6AA6EB4A5F97E76FE1C3577CE13EAB967E7EAA65B9AF031A313D4E69CB7AD86FB0BAA1D15856F28F146705BAE839D1EACE000E408204700C2342FD244679B556E35D3BD82B8AD3404F29BC95BCDBA20BA1AEEA34EEDDDBB4D3DFAC80CF5CBDBC7E9865A7625F757717143D4AF278CD75BBB4B4BDFF5BA0FAAED15656F28EDDD622DB7ABA3E966810D902300E40888DCBC8C37EBA0E1DE45BC5707EEE73EEB7EA2656BB7D9F87DEE55AE6FFEA6BEFCF25395F8DCD32A61D4756AC4F02BD5D0A157A8B82B87A8A166A37DCDD5C3D503F7DFA38E1DFB8B9ED6F7F654DB2B8ADE503ABA7B38BB97B3C006C81100720444685E64255EBE931DD749F777A9757F93A3A3E13E42755145C91B4A6B07480BF5FD80151C801C01E408202F2132DE6A8E633AF97E63ACFB8DF42DDD66E3F719D54515056F289D7DB471B674B38203902300E4088890BC48532CBB7FC79DA0FBBFD4BAFF4191DD701FA6BAA822FC0DC5F78067DF33EB4EEB6F307C6FC781D458C101C811408E0044405EE448E4334FF063C877BAB74676C3FD37AA8B2A82DF507CB7444BB3BCCCFA7F9605D17407BA1D4D372B38003902C8118030CE8BFCF4971C8DBC77081E6B8F11B9BB969B8DDF21AA8B2A42DF50FCEDF67DA7F5BFA8209A6ECF66DBAE891ED7F39D6E5670007204902300619A97DC10AEA84B0312A95BB9CDC6EF20D54515816F28819A607FCD734B4DB7BFE953FD4CCF77BA59C101C811408E0084595E0618EE039AF50AE163561B9D7F60B68E7EE030A26D0DF701AA8BAA8B02D2D6B111A8D94E08A289F6D774B7B5D9F66DBAD9BD9C151C801C01E4084018E445BE57BD38C48F99689CF8EF8B07FBC22BABB98A6BB9E1FE6B874AEE23337399733A27274D9FAEAEDE1EF036E5E5EFA83D7B36AB92928D5EF7E379DEAE7DFB76A8934F3EA94DCF63FCF89B9A5DB666CD12BFD36767AF56679E7946BBFFE79494799DF2DA85F1D8684FD3DB5AD31D6CB3EDF9F89F196CE96605072047003902D0E579596BD66D217E4C6904B2C2B0E1B62BDBF0BF55D36CFC6A83AE9E3D7BAAE4E43966335CACEF3F31F171E7B434D3D238BB9BD95AB3F1DEA6B2B2563ACF65E3C655BA319E30E1167D5A2EABAD2DD57F655A7F8F27D79D724AEF80CFE7D0A13D7A9A0103FE59DF67FFFEFFA4D2D25E349BE2FF55175DF4AFCEE31C3B56D9EC7E2B2AF2544D4DA19EE6D65B7FAE264FFE95337D7171969EAEB07083BE6CD2A45FEABFF23871713FD5A7A5366C58AECE3BEFDCA05FC72E6EB85B1B1BBECD765B9BDD404D778F7636DB36BED3CD0A0E408E007204200CF222BB775F10E2C78C31EBD3306EB83DB76A8EF06EB83F6D77C9ED67CC98A20E1FDEABCF1F38B04BFFCDCBFBA3BEAEBEFE237D5E1A72BB69CECA5AA1C68EBD414D99F29F66B3FAAAD3081B7A0BF7DB7AFAF2F23FEBE6574AA691E6B95FBF1FEAC7B26F3371E26D7A5A97EB13DDF0CA6969B40B0BD7AB6BAF1DAAE6CD7BD8798ED278DBCFF9C891F7D4B06143F4FDD8CFCB7EDE86DE5A9FEA9CCEC858EA9C5EB366B1731FB2C55D6E6B9FFFFEF77BA9C71FFF6DBB5EBF301E1BED69B65B6ABAAB3AD06C77F4F980151C801C01E408202F9DA4CEACD343FC98F2780D11D0707B6ED58C7337DCFB83AE828235BAA9CDC9596D36B373D569A79D6A36CD1FE846F48E3BC6A9D2D28DAAA9699F33BDFDB8326D5D5DA54A4F4F5103079EAF162E7C5A5F2ED3CB5FB9CEDFE35D78E18F556CECA5019F8F3CEEE8D1D7A949936E371BE9956AF1E2797A0BB434E8F66572FF6969C9CE6DE4F9C9659595F9AAAC2CC76CDCFF4F9FCFCE5EE53C67799E72BAA1A15A9597E79ACD7A992EB96EE5CA17F4E99A9A6DBAD16FCFEB18660DB7EFD8E8E816657F4D77479A6DDFA69BEF74B382039023801C01E4A51B8554456229F5977695DCB6AA2A5FFF9D37EF21B3F9DC6BED1EBE435F2FE73DA74D4A7A42EF8A5D57F7814A4E9EAD2F9B3AF5D7FAEFAC59F7E9DDD4033DD6F186BBF975F6E3EEDF5FA4FF8E1D1BEF34D95959CBF58701FBF615AA8A8A3F7BDDEE8927EED75BDC6FBF7DB4DAB265ADAAAE7E57DFFED0A15DCE73CEC858E2F53FA4A52D528D8D1F5B5BC297EAD3D9D9AFEAC768EF6B18E695D4C14CC86EE4BE5BB6ABACCB3B22C9BAAF3E2C6359C101C811408E00F2125A6CE10EDC40ED34DC5B2CED23B89B8DDFBEA0AABEBE525D7EF94FCC867685BECF3BEEB8499F2E2BDBE434A2679D75A63AE79C1FE826586E23975F72C9605550F047B3D97E5AC5C40CD05BA457AD7A415FB76FDF76E7AFFD38DBB6AD5393278F57B9B9ABF5EEE452F238CB9727EA695DAE8F9B3D37FBF1EDF38D8DD5FA32B90FDFE92A2A729DD7E5E8D132B3A1BF44C5C78FF09A2623E365AFF323465CE1FCDFF2DCE4B46CDDBEF9E65141BF8EF67D86F1D868EDA8E4AD69690B775B7EA73B10B670B382039023801C01E8C2BCF01DEED69B29E378C3FD49D0555C9C6936B64BF47DAF5E9DA4060FBE40555717388DB0BBF15DE24C2FE7172F96DDC92BD481033B547A7AB26EDA6B6AECADCA3BADEF706F706ED3D8F89173FAC20B637443DCDAF392FB90E9264DBACD6C8697ABACAC65EA8C334EF39A66DFBE6DFABEA50C7D54F5552A2F2FCD6AF8B7398F6DE8DDCB577ADDB7FD3F19FAE06FCBF56969E6DD07880BFE750C93863BD0D8B09BDB3AE3C47C87BB3D4D37DFE16605072047003902D0C579E128E5C79B9A22B3C619817F93DC6CFCFE2FE8AAAD2D54CB973FA71F63FEFC87CC663B5F1FA57BEEDC19FA7A7773FAB233BD9C4F4E7E4A1D39B2CB6C6AB79A0DF7227D59636395757472F7AEE905056FF87DBCE30D77CBCF4BEEE3E187EFD18F6197BB715ED16C5AFBB16B6A0AD4E1C3A5CEF390EBAAAADE71AEF3BCEFF8F8E1BAD136F416EEFFD0A7FBF63D4BCD9831B95DAF631737DCAD8D0DDF26B7AD5B9403FDF497BFA39407D37473947256700072049023006190177E87BBE5AD963E0D774DD065E8EF6A175A4D6A9E4A49711FFCACA9A9DAB9DEDD701F9F7ED830F919AD652A23E325959AFA8CDEE5DCBE4EEE43FE6665BDE2F7F18E37DCEEF32ED747D6AEE0BB9B3D2FCFC7B52FF377BFF5F5EF5B5BB5B758DF01DFA69F875C2EBBBCCBF36DE9FF97FFA53DAF9DEFFD84F1D8F0D774B7D6ECB6F63BDBADFD4E7720430C7E879B151C801C01E4084058E46580599F04D9507494ECC61E13893348A98F83AAC6C64AD5D0506136B14B75C374F87089FE9B97B7DA99C6DDE42EF53A5F52F2A63EED72B9B72C9795BDADCF37357DE44C5350906636BCE5EAE69B7FA6E6CE7D5025263E6236C4EFAAA953FF534D9B36519F962A2C5CAB4E3BED1475ECD85EAFE76638BB94DFAA6BE3C654ABA17FA7D9FF5157F79E75E0B6FFD4CFC97E2EF26180EFFFE35B86DE6ABE3CE8D7CEDFFD44D058696D0B736BCDB6D1CEA6DBDEAD7D1CCB535670007204902300E191975C23745BC3A421D81AA93348A9EA905753535544DDEF897A9C087C4309B4A5BBADCD76B04DB7FD7834DBACE000E408204700C2282FB2825E6E84662BB7ECA23B21721BEE8FA82EAA087D43912DDDBEBB77DF6904FF3BDBFE9AEE893E8FC377B659C101C811408E0084695EF28D13FFBD6AF9BEF85623B4BBAF7772C35D45755145F01B8AEF4F867936CF6D69B68D566EC74F7FB182039023801C0108F3BCC49875D0ACB81374FF975AF73F28926790521F525D5411FE86E2BB7BB934CB138DE07FEACBF7761DFDFD6FB082039023801C01E42544C61BEE03A8C59C80665EEE7742A4CF20A52AA92EAA287843E9ECDFC5F6B7BB3A58C101C811408E0084715E2659CD71676DE9BED4BABF47A2610629F501D54515256F289DD5747776F30E5670007204902380BC84886CE9962D67F29DEE8E7CDF5ABEB37DD06AE2A36206295541755145D11B4A47770367377216D8003902408E8008CF4B8CE1FEB9B0F276ACD8CBD6B722C37D80B441D13483947A9FEAA28AB23794F61E559C03A4B1C006C81100720444515E6EB31A6FD92D7CB1E1FE09B10BCC3ADDBAFE74AB39970620D1AC6AABD19E6444EED1C85B68B8CBA92EAA287C430976B770762367810D902300E40888D2BC0C30EB01B3D65ACD7783F584E5EFA7666519EE5DD063A2790629F51ED54515A56F286D6DA2879855677DE00516D8003902408E00F2128D0D7719D54515C50149B09AE98416AEFF8C669B0536408E00902380BC4479C3BD97EAA28AF28004DAD2CD6EE42CB0017204801C01E4A5BB34DC7BA82EAA6E1010DFE69A669B0536408E00902380BC740F279F7CD2770D0DC566F3B79B0A717DF555E13E7316B8BAC130B39BEC249A6D16D8003902408E00F2D26D0C1EFCE343F9F94BCD06701715E25ABFFE85B7CD59B0B39B0CB5046B61C04F7FB1C006C8110072049097EEE1AAAB2E5B3767CE54B3012CA5425C63C75E9566B87F768E85019847003902408E00F2126D060CF841EC8001E77CE372EDA0090E6D7DD2A3478F0A7316C4B13000F308204700C811405EA254FFFE3F2C4D4A7A902638843566CC554BCD973E9785019847003902408E00F212DD069D79E669F545452B68864350F9F94BD79BAFF941B32E666100E611408E00902380BC44BFF873CE39FBEF34DD27BED9EED1A3478DD13D8FD4CDC2807904902300E408202FDDB7E93EE9A4EF1F9B37EFBECFF94E77E77F67DBDA8DFCA0D17D7F168B8501F308204700C811405EBAB5413D7B7E2FE7F4D34F3D3C65CA2DBB376D7AF1604343210D733BEAABAFB6EF5BBFFEF9B7E568E4D601D2E43BDB17B33000F308204700C811405EBAB74BCD9A63D656B31AAC194905572EC3FD3BDBF2D35F710C291606CC23801C012047007901C0C2807904801C01E408202F0058188079049023801C01E405000B03308F007204801C01E405000B03E611007204902380BC00606100E611408E0072049017002C0CC03C02C8110072049017002C0C984700C811408E00F2028085019847003902C811405E00B03000F308204700C811405E00B030601E012047003902C80B001606601E01E4082047007901C0C200CC23801C012047007901C0C2807904801C01E408202F0058188079049023801C01E405000B03308F007204902300E405000B03E611007204902380BC00606100E611408E0072049017002C0CC03C02C811408E009017002C0C984700C811408E00F2028085019847003902C811405E00B03000F3082047003902405E00B030601E01E408003902C80B001606601E01E4082047007901C0C200CC23801C01E408007901C0C2807904902300E408202F005818308F7809007204902380BC00606100E611408E0072049017006061C03C02C8110072049017002C0C984700C811408E00F2028085019847003902C811405E00B03000F308204700C811405E00B45B9615FE966A272F130B6C801C012047007901109C2166B95A69B8C7F032B1C006C811007204901700C1CB6EA1D92E32AB172F110B6C801C01204700790110BC212D34DCE37879586003E408003902C80B80F6F3F75D6EF9EE365BB7596003E408003902C80B800EF0F75D6EBEBBCD021B204700C811405E0074824C83ADDB2CB0017204801C01E40540A78BF368B8137839586003E408003902C80B80CE637F979BADDB2CB0017204801C01E40540271AC2C2800536408E00902380BC00E19F2AA57AA7A4A4CC9C3871E2DED8D8D886DEBD7B07FAF92D2A88EAD9B3E777E79F7FFE67C3870FDF68FE1DC9029B1C51E4881C912372448EC81139222F4037B26CD9B27B468E1C591F1313A3E6CC99ADF2F3F35443C357E6B2FA3BAA8325AF635151A14A4C7C4E0D1C38B0B17FFFFE7BCD97FC625670C811458EC811392247E4881C9123F20244B9D4D457D6F7EBD74F2525BDA05CAE467361D2449DC04A4E5EA4FAF4E9F3D5A9A79E7A132B38E4882247E4881C912372448EC8117901A278A17CC10517A8A2A2EDE642E35B2A44555E5EA6FAF6EDFB0FA37BFC7EB8224714392247E4881C912372448EC80BD0AD2C5BB6F41EF904B4A8689BB9B07079D5D2A52FA9316312D4A851D7ABEBAFBF46DD103F52252F4A6A361DD5FE2A2FDFAB4E39E5942F8CE8DF9D4F912372448EC811392247E4881C9123F202741B72208D9123AFA94F4A7ADE3CF98D57AD58BE548DFEF92875EB2D63758D1D73A38A8FBF560D1D7A855AA417CEDF509D548989F33FEFD5AB571E2B38E4882247E4881C912372448EC8117901A2444ACAC29931313F522E57BDB98068F4AA8451F17A817CC30D239DFAD9CFAE53C3875D692E9C639B4D4F75ACCE3EFBEC4FCD5912C70A0E39A2C811392247E4881C912372445E80283071E284BD73E63C692E18BE6E562386C7A91716CC57596F65A8941793F427A0578D18AA2F97D32ED7977E6F47B5AFA64DBB77A7394B1259C1214714392247E4881C912372448EC80B100562638734E4E7E7980B86866675F7DD13D5C1BF7EAAB66E794765FF69835AF56AAA5A9FB9467D5CFDA1FA9FA993D5B7DF7EE9F77654FBEADD77730F98B364272B38E4882247E4881C912372448EC8117901A240EFDEBD5543C3E7E682A1BE593D36EB21555CB445ED28DEAA76EF2AD125A777ECD8AE1E7BEC21BFB7A1DA5F321FCC59E26205871C51E4881C912372448EC81139222F4094BCE928F565B372B9FEAE66CD9AA9A6FC66922A292954E5EFEDD1B56BD70E35EDBEFF56331EBC4F7DFDF5E77E6F4BB5BFA27CA1A6C811392247E4881C912372448EC8117901BA59C35DE7558D8D9FAB75EB5E53B1B13F55D51F55AA07A7DFE755A5A5C56AC8E597AAD757A7AA8686CF9ADD9E6A7FB182438E2872448EC811392247E4881C911720AA16CCFF70EABBEF8EA9B736A4AB614363554D75957AAF6CB7CADDBC5165BEF94795F6FA4A95FACA4BE6423B4DEF8674E59597ABF4F415EADB6FBFF0BA0FAAFDC50A0E39A2C811392247E4881C912372445E80A85A301F736AEB964DFA371965619C97B759BD9991AE17C82B962F512F2F5EA4925E78563D33EF697DA08DC52F2D54D75E33426D7C7B8DD77D50ED2F5670C811458EC811392247E4881C9123F20244D582F9EF4E3D36EB77FA8895B2005E96BA58D792979355F2A205EAF9C479EA7FE73EA99EF8FD236AE68CDFAA279F78D45C2867AADFCDBCDFEB3EA8F6172B38E4882247E4881C912372448EC8117901A26AC1FC8553B260969F8AB8FDB69BD51B69AFEA05B22CA49F9D3F47CD9DF3847AEED9B97AE12C0BEB31A313D4E69CB7AD05F3175427142B38E4882247E4881C912372448EC8117901A26AC17CD4A9BD7BB7A9471F99A17E79FB38BDE0955D8EFC555CDC10F5EB09E3F5A7A2A5A5EF7ADD07D5FE6205871C51E4881C912372448EC81139EA2259D6736EA9761A00825D307FEE55AE6FFEA6BEFCF25395F8DCD32A61D4756AC4F02BD5D0A157A8B82B87A8A1E602F99AAB87AB07EEBF471D3BF6173DADEFEDA9F6172B38E4882247E4881C912372448EC851171962B87F3BBCA5867B0CED1310F482F9081526C50A0E39A2C81139A2C811392247E4A80B65B7D06C1799D58BF609087AC1FC191526C50A0E39A2C81139A2C811392247E4A80B0D69A1E11E47EB04B46BC17C980A938AE2958004EB7F4B204714392247E4881C912372448EC29ABFEF72CB77B7D9BA0DB46FC1FC372A4C2A4A5770E2CDFAC2AC24EBEF187244912372448EC811392247E4286CF9FB2E37DFDD06DABF603E44854945E10A4EBCCF4A8D6C51F82C0A17DA8C5F72448EC811392247E4888AA61C651A6CDD063A6BC17C900A938AB2159CF8005B10E2A370CB02E3971C912372448EC81139A2A22947711E0D77B47E050308D582F900152615452B3809ADACC4D8D72790238A1C912372448EC81139224761C9FE2E375BB7818E2D98FF4A854945C90A4E5B575EA269CB02E3971C912372448EC81139A2223D4703CCBACFACB566559B556FFD0F0D667D62B877339F694D07A0ED0BE65A2A4C2A0A5670E283DC5210ECF4E4882247E4882247E4881C91A3CE253FF7956B35D6AA8D956FD6045A29A04D0BE64FA930A9085FC169EF1602B95D5D84AFE4307EC911392247E4881C91232AD27214635676104DB6BFDA6AD605B454408B0BE6FD54985404AFE0747477BC48DF9D8FF14B8EC811392247E4881C519194A3F186FB48FD9ECDB3CB6AC0279B75B1597DAD69FB9835C8BA8DEC6EEEBB255C3EA8626B371078C1FC172A4C2A4257705A3B204DA8EF871C912372448E2872448E287214D818C3FB77B6E574A2E1DEE2DD16FDACE97D7FAB7B32AD15E077C1BC8F0A938AC0159CCE3EBA6BA46E5960FC922372448EC8113922475424E468BC4FA35C69B8B766B787DCAEDCA7E9664B37D07CC1FC499B4BA6DFB66DADAAACFCB33E7DE0C00EBFD3E5E5A5A9112386A8C993FF434D9A749B576DDCB85C65652D532D3DB65C376DDA9D6D7E5EAB5727A9F3CE3B37E0F53535EFEAFBACAFFF40D7860DAFA88103CF73AEDFB76F9BD7F425251B545959B63E2D7F1B1B3F6A56727F0505E9CD9EF7F2E5CF39E7EBEA2A827E7D2368ECF81E60E67B66DD69FD0D86EFED22F1C035E4881C91A310E7883AB1458EC8111595398A31BC772397EF5FF7EDE07DCAEEE6B986F7EEE58368B100AF05F3FFB5A94A4BDFD241BAF9E6517A655F4EDF7BEFAFF5E933CF3C432D5CF88433AD9C97E93C6FDFBFFF3FA96BAF8DD3A71B1BAB544B8F2DD7DD74D30D6D7E6EFDFAFD505D7D756C8BD3486320D35457E7EBFB8F8F1F6E362CA9CEFFE25EC1F77E0E05056FE8BF1327DEA2B66CF9A39E46CE3FF5D4FDEA8E3B7EA172735FD3D39694ACD7D72F58F098BE5E2ECFC858AC2EBAE8427D9B7DFBB6EACB172F9ED3E2738CA0151CDF4FFE65E56499F5FC9705B19213E87691B692438EC811390A618EA8135FE4881C51519923CFC6B8B2139A6DCFA6BBDCA79107707CC15CD36A1D3B56A60374F9E5173B97C9F9CCCC97F5E93D7BB2BCA677370A3FF3BA2C3D7D91B952BECC5C69DE62360A1FAA961E5BAE93C622D0F54D4DD5FA3EEC3AE38CD3D4E8D1239DF3478FEE568585EB9CE94B4A327533515C9CA12EBBECDFF4ED7BF6ECA957E4E5F9D4D7BFEF4CEB727DA4FFCA6532BD3C97C38777AAD4D467D469A79DAAFF87356B92554CCC00E73672BDBC06F6E3CB6DF6EFDFA6FFCAF4F6EBE7FB3AF9FBBF2370E5C6B0B60878EE4ED496951CCF951BBB267A5C1F49DFA12347E4881C85284754688A1C91232AEA7234CEF0FECEF6C59D7CFF171BDEBBAAB36B39707CC1FC718B5557F79E1A30A09FCACA5AAA4E39A5B77AFCF17B556EEEAB3A4C9326DDAA4F9F7B6E7FAFDBF4ED7B96CACE5EAE468DBA4A4D9932DE5C594ED5D39F76DA2966C3B0505557BFA3023D7653937B375369365A7A4EB2ABEDD8B1D739CF65C2849BF469A979F3667ADD7F69E97A6BE57DAB3E9F93B3529FB71B8123474A9D692B2A36E9CB6A6BB7ABBCBCD5CEF5EEC668B19E461EC3F7F9C9F577DD75BBAAACCCD1A71B1B2BF5DF7DFBDCBBE1CA7368EDB58E80159C402B1DFE56565A5AC9F1377DAA9FE923E53B74E4881C91A310E4880A5D91237244455D8E3CB76E279EA0C778C6602B37E06FC15CDD62D5D595E9BF1B37BEA21B829C9C15E6CA6F810E5361E11A555EBE519D77DEFFF3BACDF12D73EEF37979AF59BBB7C6EBF38D8D1FA8408FBD67CF5BD696B973CCA6A1AAD5E72725D3A7A7FFC139BF61C3CB2A26E65F9CF31919296AE0C01FABAAAACDEA924B06A9D9B31F70AE2B2E5EA76F2F5BEC3CEFEF77BF9B6C36347FB69A06F756B659B3A6EAFF3D2D2DC9B97F797D6263FF5D4D9B36D16C0632F5E3C834A9A9F3D459679D6936193BF56DEDD7B1B5FF23440BDC111D58B9490862A5C5DF4A4E5B576E7C5772BA6277BEB6BE56E4881C91A310E4880A5D9123724445558E0618C7B73EBBACF327821CBDDCF327C36268B500BD60FEA84D9599F9923AF9E49374C3B06AD5737A57D2871F9EA2CF7FFFFBBDF45F7B5A77A370833EBD6F5FBED324D8D3343656A8408F2D978F1E7DADB902BF569F6E6AFAB0C5E765DF7F65E526E732D9923862C4E55ED365652DD1BBCC4E9FFE5F6AD2A45B74C9F391DB6664BCE8F7791C3A54E8DCB7FC9586406E234D8CFDFF49B95C95EAC081EDCEF9D2D237F5F3B6EFFBC89112EBE058DB5BFC5F42B460B61F4716D0716DBC4D5B57325A5BC90976E5C6F3F13FEB822D0B6D7DADC81139224721CC1175E28B1C91232AAA72749FC7745927F8F9ACF578AC99B45A805E3057B558070E6C53B9B92BD4B5D7C6AA1B6FBC5A9F9E3BF7011DA479F31E5453A6FC87BE4CCE9794ACD3B7B11B85CACA6C6B65BF526FC992FB90EB1B1BDF57FE1E5BA693CBD3D216E8F3727AC182475A7C7E32CDFCF9339B5D76FBED095E976DDCB8547FD7D4BEFEEAABAF704E6FD8B0D8996EFFFE023DAD5CDED0F09EFE5B5595A3F2F25639CF3B31F121B389D8EEDCA6BE7EAFBEDC7E7DECDBC8DFECEC54E7713233535AFD5F42B860B62BBB954F4683DD8D2ED04A4E8F76AEDCF86ED108E54A4E5B5F2B72448EC8510872E4398FB76D7BC3C986E4CBDF7432DEE443A3C9936F773E203AFE41D1529595F5B2DF0CD5D66ED1B7F57C3CC9A9BFC7282F7F5B5FEF727DA0EAEAF638555DBD597F68D4D2FF218FE3795E325053F3E716FFEF9494275B7D6D1E7EF837CE69CFECECD9B33EA8D7981C45778EDA3206ECE5AD9CCEC959A64FCBD80E741BC9838C33FB7DCCBEADEFF959B3EE09F81EE4F9BE2065BF0F1C39B2A3D50CD925CFD5F379CAEDE5EB53819EB7BC4F1D3DBA531516A6AB2D5B5E57D3A6FD5AFF953DCF5ACB7184E4C8B3099E74829FCFF81036F740A434DC1FB6584D4D1F982B1215CE7959E9902D7437DD74BDB5F06D7E1B690A2EBAE802BDB03B7AB4C45C60BF68ED5E7AB7BEBEB1B15CF97B6CB96CEAD45F39E7ABAA3679340ECD1F47763B95C7F1773FAB563DEB7599AC58FDE427FFDAEC7AF70AC92BCD6E3F6CD865E64236435FB77F7FBEB5F2EF7E3EFDFAF5D5D7D9D3DBFF4F6EEE72E7F695957FD27FB76C59AD2F97D37979AFB6F85A77D182D9F393D1111D5CB9696925A7AA032B371D7D3E27FAB52247E4881C8520475232660C7DA4FF1BCCA6798975A4FFFFD4A7DD47FA7FCC99F6F85E22C76F2F7B56B83FB40A9C217B1CC963D5D5EDB69AD5CC80D33DFEF8547DBAA464AD3A76ACD4B9CDF8F1A39DE98E1C2956E9E92FE84C4816972F9FA7A7B19BFE29537EE964DC5E56C8CABFFC5F9326DDACFFCA5E27717197E8D3521B36BC647D15C5FBF9AC5C39DF39BD66CD1F9A9D6E4B91A3E8CE51A092BDAE92937FAFF6EDCB733E18B54F979767E931EE3EF6C687FABDC91EBF863EB8E5123DE6274CF88593CDDA5AF7F137DCCDAFFF316ABF37C8F2BEA0E035EBB81D795ED3CF9EFD5BAFF741C98BFD18F67D05CAB0DCCEFD215D9AD7F592D3B2B20DFABA279EB857FF6F86FE9A57BA5E36D8CB07C96D7B5FCF30CA51B5C7E5179FE0E733C8E3B13EA5D502F482B9B24D555DEDFE84B1A2E26DBD9093DD42ED85A4AC0C34355538D3BA5772E29DF3870E6DB316D66FE9F38D8DEF29DFC736F4019B7ED1EC71376C48B18EEC7C91AAAFDFE35C2ECFE1ACB3FE3FE7FC912345E6827FB1B9B05E65AD94AFF4BA1F790E2ED7FBE60A47926E74CACAD6EBEFA18E1E7D8DAAA9D9DCECB9A4A53DAF0F5A75ECD84EEB08CBDBF5E3CB69995EFE26253DAAA76F68D86B6DED1BE2F1265360BD69BC63BE193C633655A9ADBEC65DBC60F6FC6434AE133EC1F7B792D391951BDF959C84307AADC81139224721C8913D8E641C7BCE6F590997D3EEA6B8326086A464E559C6978C297F199231BD7AF5737A5CCB74729042F97BEEB9FFACE6CD9BEE35AD64D1BEBDA1B73E3FA14F9F73CE0FACAF63F81F9F727FF6695916C85F79CC0307B6585BF28A9CEB256BF66D25738989BF73CECBD750DCCD7EA55E8ED8B9B9EEBA389591B1C86A74729CFBAAACDCA8FFBFB62CABC851F4BF1FB536FF67CCF82FBDCC96F33236E5AFBC27C875F6FB888C47392F070395F78EB163477A35C376664B4AD6E8F70FFBF2254B9E56175EF8233D4E172C78D83A46C72EEBA7245739CF43C6ACA1F7F0AAB03EB0B5F76AD9A2B321EF6DBECF5DDE5BE472B97FFB83DAECECA53ACB727B7FFFABBD0CB17362BFEFD8B7EDC8EB182663E32B8FF37D4FF0F3E9E3F1580DB45A805E307FD062D5D6E6EB1596A953C73B976DDCF8B2B93232D0392F2B0AF60A837D5E5688A64FBF5337119E25B7B557FE65DAC387B7E99586C2C2B480CF41AE73AF7CE79B0BF9DD7ACBDF534FDDDB6CBAD2D2B5CE279F9E9797976F50DBB6ADD65BE6162C78C8EBBA3D7BDE74DE583CA79715B5BABA5273656593BEECC08177ADEFD05EA7CFDB974B3534D80D448E3E9F9BBB4CFF35F4774F17B6FA1ADBD5868566A82BA983E3AB879F2D0955D6E51D91146EAF15392247E4E8C4E648C6D18001FF64AED4BF641DE9FF1E3D46EC0FABE4B434C59EB7711FE97FA91A356A84D504BCEC71A4FF057AFCF93EAEDC8F64C9F7F18F37EFEEF3FBF7E7390DB1EC21121F3F545F9E9696A84FCB5F799C4387B6361B9FF23C1A1BCBACAD670B3CB67027EB2DF09E99901C1D3952A8CBBD356F9E3E2D39F19CD6F3FE651AFBB47CA0662F2BECD7CBDDA490A3EEFA7ED4521514BCAAF700C9C97945A5A4FC5E8FE163C74AF4873D77DC3146BF3F3435BDDF6C9CC8B4925119CFB2D7D4C285B3AC2DCC6BAD66BAD4EB3632BD9C76B9CAF51897CB5253E7E8C7AAA8C8D2D74976DC1FDC26AAC183CFD3CDBC7D7BFB7EE5BD474E7BFE0FF27EE8DE529DD66C4CCBF3F337D6172F7ED2790FB2970BF23C827DFF89801C85EAA8E9A17E3C20DC1BEE8AA0ABA9A9BC5DB7A35AAE2EFE2474A7B5F5A097355D6B4781EDC81685B6FC2E6A386F51F07DADC81139224727384775753BF5DF8D1B17EBC65A1A827DFB72AD15EBD7CD95F6F5EABCF30678DDE67893EC3E9F97B7C2E3039F0AB3E9DDAB7C1F373737D56AB82B5ABCAF03070AF474F673D8BFFF1D6B97F6479D69CACA32AD2D762BF5636566BAB73A2F5F3ED76C381EB71A919D56E3FE82D9486FB70E34B8C56B3C4BC3613F57B90F399D9DEDDEFAEE6FFC4BC3633F7669E91AE7F2CB2E1B4C8E783F6AD3BCAFAADA681DBBE001675CD6D6E6E9EBE5BCE7B449490FEB0FC3642C27273F667DAD69BCF55DED297A37757B7A7B1CBB1BDB6CFD019A64DAB30CBDFBF76A3DBD8C73F970C9F3F1ED4CC96DE543B561C32EF57AFEF6F3B5EFC3F3B9BA9BE7E3CB94F4F4E7F5E5B7DE7A835E86B8B79EBBF7ACB233E4799B087E3FAA630B37D0A50DF7FB549854172D987DDFAC7D5726EA8C13F39DB9F6ACE474F577E602BD568C5F72448E4294A3CCCC85D691FE5F52AB563D63AECCF7500F3F7CB73EEF3ED2FF4BCEB4679E79BAD9245FAF4FEFDBB7D969B6ED691A1BF728DFC7CDCD7DC5DA0A9CACEEB863B4BAEBAE9BF5F4863E18D9DD5ED31E3D5A68ED365B6CAEE4CBD72DCAF47DDA9593B3D45C79CF6F363EEDC77737D00BADADF4E3F4E96DDB5E6B36FD88113F759EC3E4C9B7EAD3EEA3FC5FEF4C575C9CA6264C18E334239EF76F9FCEC8F80339224701ABBEBE545D7EF9BF39634DC6BF9C2E2B7BD3194BB2C7C439E79CADF6EFFFB3334E644F2D1973C9C9B3F49E53A3475FADB369E8DDB2373B7F65FAD4D4D9D696E9755653FC9ADFB1678F5B3B6315151BF47969BAEDE7664FBB7AF57CAFDBD7D4B8B750CB8700CB97CFD15F535AB2E449E7715B7A3C43EF529EE5DCAFA1BFC695190DEF477C871BE8DA86BB3CE4E5FE847F8E73BEAE6E47ABD3AF59B3C039DFD8B8DB3A90D2ABADDE2E25E5B156A791152ADFFBCEC959D225AF4B0817CC45668D0BB062D3914FF003FDD48ABFA3C206B392D39547856DEDB5EAD431909DBD5867424E1F3DBA3DE074E3C7DFD8624E3CEBC0813CE7FECACA32F44AD4860D8BF4A7FAF6CA5546469233FDB5D75EA16EBC7184B99294A3121367E892D3BED90DC7DC91A3E8CC918C616986EDB129A7E7CE9D666D85BB5F4D99729BD32C9794BCA16F6337DC95956F59DF032D331B82FEFA3E3CC79DE7E3D4D6BEA357B0F7EFCFD5CDBC9D33C9CEE1C35B9CE9E4BEE4B6D2FCA7A7279A2BF9D96AD6ACDF388F252BEB478E6C359B989DCDC6A7DCB7FC3F721F9ED93D76AC485FEE3BBDBB1928F768D6CBF5FF2AFF9F3D9DCBB5D7596ED8CB01DFDBCA73B31F931CF17EE4AF8A8B5F773E0492312CBB7257576FB40EE6B7D76B4CD9E364F1E2DFEBB1276357B2204DBBE4C1D07B6B14389994B127EF0DF65894DBCBFB908CE949936ED265BF1FC9F50D0DA5CEFC91E90A0B57EBAF6F6CDBB6CA6AC2D75BCD7C8ED7FF60E7CED05BD137EAEF72C7C7C739635FEED777ACCBE3C97396BD46E4B9CE9F3FDDDACDFDE968793FE228E540D736DCEF85AC4A4AD2CC2679A55AB060A6F57DB2A5E64AFE0BE602F47C73257EB6B9D0DC642DBC1FF7BA9D5C969CFCA83EED72B9B748C89B80EFFD1716BE662EAC53AC85768AFE74332EEEDFF569295960BB7739F4BE6F59F1AFAB2BD6CF4DCAD0BB43FDD2392DD785E2F509D182B9A52D081DFD24BFB5DF356DED775103196274CDEF9EB6F5B5EA94F95F559565359D2F3BE3A1B434BDD974870EE53B9FDECBB8EEDFFF872A2DED59BD22235992CBDC5BDD0A9DDB24263EA87F3FBBA6E64FCE65329D1C29DCDF73912D18B282E26F8CA6A73F17D6B92347D199A3A6A6BD7AF96F9F9F37EFB7D691FE473A99F12D69AE2513D5D56F9B0DF336B351F88375A4FF49FAFAC6C65DCAF371F7EC59A33FF0928641A691C774370DF96613FEA6B912FE807E4C7B7ACF8C555464EAE9ED3128EF6DBECF47F26CE8ADEC23F57392C7B2F32AF991AC48C3E33B9E258BF6749327DFA24FF7EDDB47CD9871A7DFF1BF72E55CE7B4FC4FF2DE6BE85D65DFB17617CE2247BC1FF9ADDADA3FEBF53143FF4CD7037A9CCAF25B3EDCB2C785E4C877FDECC8912D7A1D4EDE1FE4323B5B727B43EF75B1DC6C6A3738EB70AB573FD3E2D8B31FC3CE983C2F7B1D51C6B1E4F1F887BB81EF471EF3F8876CC7DFB3ECF549C9A0FB03EC04AFFCDA99B11F53FE46F8FB11BFC30D746DC35D16B23A7CB840BFF9373696EA727FD29F637D6AFFA25EB0DA2B089EB7B3177E478EBC6BFD4CC5837EEFDFFDC97EA273DE7D44D7E3D3BA8FE83A459F6E6828515959C9FA3673E7DE67ADE017990BF10CE7F1ECE7D9D4B42724AF8F11DE079768ED13FDD6566E8C76AEE4D8BB118E8BF61CB9B7D4FDD6392F5BAFA401F59CC6E5DA6DAE942FD4A7A5D12E2C5C65AE480C716EE75E0199E5759BFAFA1D5E2B0E999949FA3BB013278ED597D9974BC360DF46569A64D741693A8E6F7978D15A81CAB28E6C1E9EB92347D19D23197FF6789531191B7BB1F33E22E3D473DCB8B7705FE79C3F74C8FE79A30C7DDE7E1F92D3478F6E75DE7FE4C3A9DB6FFF59B371653FB69CAFAD757F775BB22479713706C7A77537DC65D6D1F90B9CC7DEB265458BEF5DF6F481C6B6FCCFFEAE93C7B71B6AC9B8BC0E867310AD32E7FF36F4AEF1779123DE8F02CE777B6CCB7897F71343EF1DB2C7B95EC697E7F4F21D6A199732E653539FD21FD8FA664696FB9EB791B128EF5F77DCF1735DBEEF339595EB9D4CCA07C365656BAD5FCE48759E9F6C9C31F4D6EF857EFF0F3BC30307C6A8CB2E1BE475DDFCF9F77BFD9F72B99D99BBEE1AE74C27CFC3D0BBBEBF1AE9EF4703CC7259CFC7659D3F11FA19EEEF6DDBFF7B0CAD16A017CC7B435AF6C2ACB232D3FA1474A7D50C645B5BF4D2FCDE66F5EA79D6016202DF7743C30E7321BE4E37E67673BE72E51C7DBAA6E66DDDA0F8BBEFB163AFF13A2FF7216F04EE159FFC90BE36613E5E026D5968EBCA4DB02B39F6E38D8BF61C19FA3B6937FABD7CC488CBBC2E938676F4E8ABCC95935FE89593C58B1FD35B9467CC98E85C66E8032D3DE3DC4759D91A7345E5157305668BD9FCFEC6FA5997623DCEED69B2B216398F215B347C1F57AAA969B7932DB9AF70CC1D398ACE1CD5D66ED6CDB3FB4328F76532D62FB9E45F9DF3F23E61BF5FD8E7656BF5F4E91374363C4B6EBB61C31F94BFC795F7A369D37EA51B072977037E83DFE7649F96C771EFD9E1BE5FF92B75F5D597377B5F93EC48032039966924FBF2BE28A7870DBB44E5E62E0938B6B3B35302BE46729DE7FBA8BB393F7EDDA851C3F463B6255FE4A8FBBD1FC9FA982CCFE5BDC05E0EBB9BDC57BCC685E77B85FB83D2D7F569976B97F37E63BF5FD8D314142CF3BACD820533F4F481C65E71F16B4E16E5AF7CC82BEF27723F8307FFD899561ECB1EF3727F921D69B03D7322FFC7C30FFF97DE2B44EAA9A7EE71DEBFECAAA878D3790CCFE7B170E143CEDF28783FCAF518E38927E8319EF1788CADB45980B360DE1392AAABDBAEB7444C9B365E2F186581B86FDF9F546AEA937A2177E44881B5B56BBB9E5ECEDF7AEBF57A1A43EF66FB925E495AB2E4719598385D5F9E97B7D45AF17FD7791CBBD1686C2CB13E897D419F9685AFBB613FFE9C5CAEE3DF0F92DBC88A956C2D2C2E5E65BDA92C0CD9EB633FF7081833B265C17777BA3B8DE07FD7D4DF4ACEC420B660444D8E72735F3657CA7FAAC7DBAA557375B33B63C6AFCD9565F796606916ECB16CE764FFFE6CA76975370FC9FAF632C6251B151519FABE65BA030772BDB2619FB63FF42A2F5FDB6CBC5755AD779A7D5949979CC6C5FD44FF9506DABD05604F58E68E1C759F1C3535ED0AE932BAAB2B94FF2F39EA9EEF47A118A3E198DB13F59CC22C47E33CC6B76CE5EEEC83A75D6C1CDF8A2E3581360B7016CCBB43562ED74E73E57FB373BEB4F4757321576AED7EF7BCD94CE45BDFCFD9EC753BF727A8AF998DC4466B57A5C08FE16E1264F7A645D6F7DD6ED6A7A549B8F9E6915ED3AE5E3DD7FAE4F515B3317851DFBF7D1F7BF6BCE1B1D53134AF8F1139BF57E8FB132D9E2B2B6D59B9315AB95D287F6AA54B735457B74D8F7BFBFC860D49CE18B7B35155956936AF3BFC8E97CCCC05CE7999C6D0C74658EC355D6DED26B3015FA7AAAB37E8FB96F1EEDE7AF18ED578BFE9D1E8B63C3EA74CB945DF6ECB9665619B3B72D4FD7244F17E448EC811396A937C8F86B8D2E8BC9F08939F022B37BCB76EF73200D80BE65D21ABFA7AF76F23DE78E370B32978C96A26DEB476934BD6D31C6F228EDFCED007E578C8393D75EA6D011FC3F3F686FEBEDB227D5A1ECF7D44D7E3D32E5FFEA4DE7D6FDEBCFBF4F9868622EBFB3CEBCDE6E30FD6C1727243F6FA44D00A8EE74AC8188F95958946F03FADE27BBB8EFEDE6A44E7C8D0DF6DFE1F7DBAAE6EABD540BF1470DAD8D88BD4A44963F53897317BC619A706BCEFA626FBEB1B6F5BDF815DEB8C77437F0F4EB64A17ABCB2F1FACEFAF5FBF1FA8FBEFFF9573FF32CDE8D12374BE7EF2930BC23677E4881C51BC1F91238A1CF91563B8F70AF16C8C3BDA744BB3EDB9BBBA1CE760102D16E0B5602E0D59353616793410A5D6D6B575D681645E719AF0BCBC97BD6E77BCE12E55478FBA0F3C73CA29279B0DC996668F61E823BAC69A2BFC0BAD2D6DE3F469F7115D2738D3D5D6FE49B95C3BF4CFBEC83435351BACA3CF96EAC6C3D0DF215A19D2D727C25670FCADE474C6968AAE38FA6B58E4E8C891779C2CC8F96DDB9659CDE7E680E3E5E187EF341BE82CA7DC1F5E2D6A76BFAB56CD562B573EA5EAEBB7E9CB0A0A969A0DF2F3BA41974C55576736BB7F791E9E8F6FE803B23D1CF0B9844BEEC851F7CE11C5FB113962FC92A316C9CF7679EEFA2D5BBADBBB7BB9DCCE73CB36BB92035DBD606E68701F855CBEAF6AAF98CB0AB87BAB5B966E0872725EF4BBC092EF81CAC171EC662423E33927DC070E6C0AB8A093C7696D613861C2CF9DE7274754BEFDF678E73AF7EEB0ACE0846025A7B35796222A477636D2D3E7A9A6A6127D991CDB60D8B07F6F71BC48D3EC7B59565652B3690F1FCEF5D87A5EAA9B683B3B923B43EFCE9DE6F731162C98AE1B7543FF26E9EFDB348EBB3277E4A8FBE688E2FD881C912372D426937C9A6E392D0752EBD7C6DBCB74CFF8DC87D423B456409834DCB2554BCE7B6EE99606DADF6DA4F990EBA74DFB0FBFD7FBDBCAEDB9A0F3DDDAE76F1A791EB2C5EFBCF3FE456F7DF3DD221FAA2DDD11BA82636F09E8C86E7791B8DB5EA7E5A8B4F435FDDD6A7BECC9DF59B3EE723E886A69BCD8BB94BB77FB5E68ED9A9DE9777AF9B04A1E4BFE0E1CF823AFEB240332FE03E53629E941EB006B7F6CD338EECADC91A3EE99238AF72372448EC85150C65B635DF934DE5956432E5BAFEDDDCD65B7F141D66DDE30DCBB8D7BDEAECEBA0D80EEB660B6B71476741A16CC41ADA404BB4520D20E481336390AA7B11B4EB92347E4882247E48822476D1263787FFFBA3DB5D5E03BDB000B6616CC2113EC6E7891BCDB1E392247E4881C912372448EA868C8D16D56E3ED0AB2D19E647034728005330BE6B05DC91962B877411A478E2872448EC811392247E4881C75B901663D60D65AB33E31ABC1FA1FE4EFA7867B77F399867BCB380016CC2C98BB5082B5F292D0C2F59F45C9CA0D392247E4881C912372448EA868CE110016CC2C982368CB42B4ECB6478EC811392247E4881C91238A861B000B6616CC61B392138D2B37E4881C912372448EC81139A268B801B06066C1DCA52B394951BA72438EC811392247E4881C91238A861B000B6616CC5D26C1FADF12C811458EC811392247E4881C91230034DC140BE6CED5871C51E4881C912372448EC811390240C34DB160063922472047E408E4882247005830B3600639A2C81139A2C811C8113902C0829962C14C8E28720472448E408EC8110016CC140B669023720472448E408E2872048005330B66902372448EC811458EC811458E00B060A6583093238A1C811C912390237204800533C58219E4881C811C912390238A1C0160C1CC8219E4881C811C51E4881C51E408000B668A053339A2C81118BFE408E4881C01882E279F7CD2770D0D852C14C3A0BEFA6AFB3E7396B81895E4882247E48822472047E4084014183CF8C787F2F397B0600C835ABFFEF9B7CD59B29351498E2872448E28720472448E004481ABAEBA6CDD9C3953593086418D1D7B559A394B121995E4882247E48822472047E40840141830E007B103069CF38DCBB5838563D7D6273D7AF4A83067491CA3921C51E4881C319EC911C81139021025FAF7FF616952D2832C1CBBB0C68CB96AA9392B72198DE4882247E4881C91239023720420BA0C3AF3CCD3EA8B8A56B090EC82CACF5FBADE9C0707CDBA98A1488E2872448EC811390239224700A24FFC39E79CFD7716CEA15F28F7E8D1A3C67CFDC73004C911458E408EC811C811390210C50BE7934EFAFEB179F3EEFB9CEFFE9CF8EFF658BB1B1D64A14C8E28720472448E408EC81180EE6150CF9EDFCB39FDF4530F4F9972CBEE4D9B5E3CC8EF3976DEEF31CA4F44C8512BAD0369C8777BD8DD881C51E408E4881C811C912300DDCCA566CD316BAB590D6629AAC3E532DCBFC7283F11C1512BC911458E408EC811C8113902000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A2DFFF0FF0398BADE63642580000000049454E44AE426082, '0');
INSERT INTO `act_ge_bytearray` VALUES ('81b93ce653e846d38cb38f493dba1156', '1', 'test_audit.bpmn20.xml', '2e1e8bdb94ff4f4ca831b4fddae50882', 0x3C3F786D6C2076657273696F6E3D27312E302720656E636F64696E673D275554462D38273F3E0D0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A61637469766974693D22687474703A2F2F61637469766974692E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E61637469766974692E6F72672F74657374223E0D0A20203C70726F636573732069643D22746573745F617564697422206E616D653D22E6B581E7A88BE5AEA1E689B9E6B58BE8AF95E6B581E7A88B2220697345786563757461626C653D2274727565223E0D0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E590AFE58AA8E5AEA1E689B9222061637469766974693A696E69746961746F723D226170706C79222061637469766974693A666F726D4B65793D222F6F612F7465737441756469742F666F726D222F3E0D0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9FE5AEA1E689B9222F3E0D0A202020203C757365725461736B2069643D226D6F6469667922206E616D653D22E59198E5B7A5E896AAE985ACE6A1A3E7BAA7E4BFAEE694B9222061637469766974693A61737369676E65653D22247B6170706C797D222F3E0D0A202020203C757365725461736B2069643D22617564697422206E616D653D22E896AAE985ACE4B8BBE7AEA1E5889DE5AEA1222061637469766974693A61737369676E65653D227468696E6B67656D222F3E0D0A202020203C6578636C7573697665476174657761792069643D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222F3E0D0A202020203C757365725461736B2069643D2261756469743222206E616D653D22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E983A8E995BFE5AEA1E6A0B8222061637469766974693A61737369676E65653D227468696E6B67656D222F3E0D0A202020203C6578636C7573697665476174657761792069643D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D45463246353142422D314439392D344630422D414346322D4236433133303041374432422220736F757263655265663D2261756469743222207461726765745265663D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222F3E0D0A202020203C757365725461736B2069643D2261756469743322206E616D653D22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E58886E7AEA1E9A286E5AFBCE5AEA1E6A0B8222061637469766974693A61737369676E65653D227468696E6B67656D222F3E0D0A202020203C6578636C7573697665476174657761792069643D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D33444243443636312D353732302D343438302D383135362D3734384245303237354645462220736F757263655265663D2261756469743322207461726765745265663D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222F3E0D0A202020203C757365725461736B2069643D2261756469743422206E616D653D22E99B86E59BA2E680BBE7BB8FE79086E5AEA1E689B9222061637469766974693A61737369676E65653D227468696E6B67656D222F3E0D0A202020203C6578636C7573697665476174657761792069643D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222F3E0D0A202020203C757365725461736B2069643D226170706C795F656E6422206E616D653D22E896AAE985ACE6A1A3E7BAA7E58591E78EB0222061637469766974693A61737369676E65653D227468696E6B67656D222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D30324442324144392D313333322D343139382D414338442D3232413335313639443135432220736F757263655265663D2261756469743422207461726765745265663D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D32414237433031412D353045452D344141432D384338462D4636453139333542334441372220736F757263655265663D22617564697422207461726765745265663D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D33364535304338422D364337432D343936382D423032442D4542414134323542463442452220736F757263655265663D22737461727422207461726765745265663D226175646974222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D37443732333139302D313433322D343131442D413441342D37373432323545353443443922206E616D653D22E698AF2220736F757263655265663D227369642D33463533423642442D463846332D343936422D414330382D35303633304244313134373722207461726765745265663D226170706C795F656E64223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D44343443414434332D303237312D343932302D413532342D39423835333345353235353022206E616D653D22E698AF2220736F757263655265663D227369642D46453438354232442D394132332D343233362D424430442D44373838434136453330453422207461726765745265663D22617564697434223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D35333235383530322D343345452D344445382D423141342D44424431313932324238414622206E616D653D22E590A62220736F757263655265663D227369642D43323842423546362D303133442D343537302D423433322D36314233383043314634364622207461726765745265663D226D6F64696679223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C6578636C7573697665476174657761792069643D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D31363344424336302D444243392D343338422D393731412D3637373338464237373135412220736F757263655265663D226D6F6469667922207461726765745265663D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D37323235384134312D323033452D343238432D423731442D43413335303632353244373322206E616D653D22E698AF2220736F757263655265663D227369642D43323842423546362D303133442D343537302D423433322D36314233383043314634364622207461726765745265663D22617564697432223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D38343438454634412D423632452D343839392D414243322D30453244423241453638333822206E616D653D22E9878DE696B0E794B3E8AFB72220736F757263655265663D227369642D35464544303244362D433338382D343843362D383730452D30393744423231333145413022207461726765745265663D226175646974223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D41373538393038342D343632332D344645412D413737342D30304137304444433144323022206E616D653D22E698AF2220736F757263655265663D227369642D45443436464534312D413046442D343936442D383644432D32433937414635373335463022207461726765745265663D22617564697433223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D46413631383633362D333730382D344430432D383531342D32394134424238424339323622206E616D653D22E590A62220736F757263655265663D227369642D45443436464534312D413046442D343936442D383644432D32433937414635373335463022207461726765745265663D226D6F64696679223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D31353235424646342D334539442D344438412D424638302D31463633414645313632383922206E616D653D22E590A62220736F757263655265663D227369642D46453438354232442D394132332D343233362D424430442D44373838434136453330453422207461726765745265663D226D6F64696679223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D33354343384336432D313036372D343339382D393931432D43434639353531313539363522206E616D653D22E590A62220736F757263655265663D227369642D33463533423642442D463846332D343936422D414330382D35303633304244313134373722207461726765745265663D226D6F64696679223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A202020203C73657175656E6365466C6F772069643D227369642D42444230414142322D374535302D344433352D383045452D4345304245434444394635372220736F757263655265663D226170706C795F656E6422207461726765745265663D22656E64222F3E0D0A202020203C73657175656E6365466C6F772069643D227369642D34344146423943312D343035372D344334382D423146322D31454338393741353243423722206E616D653D22E99480E6AF812220736F757263655265663D227369642D35464544303244362D433338382D343843362D383730452D30393744423231333145413022207461726765745265663D22656E64223E0D0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0D0A202020203C2F73657175656E6365466C6F773E0D0A20203C2F70726F636573733E0D0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F746573745F6175646974223E0D0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22746573745F6175646974222069643D2242504D4E506C616E655F746573745F6175646974223E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D2233302E302220793D223234352E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223937352E302220793D223335362E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D6F64696679222069643D2242504D4E53686170655F6D6F64696679223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235382E30222077696474683D223130322E302220783D223230392E302220793D223133352E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226175646974222069643D2242504D4E53686170655F6175646974223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235372E30222077696474683D2239362E302220783D223130352E302220793D223233312E35222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222069643D2242504D4E53686170655F7369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223234302E302220793D223234302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697432222069643D2242504D4E53686170655F617564697432223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223231302E302220793D223333302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222069643D2242504D4E53686170655F7369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223334352E302220793D223335302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697433222069643D2242504D4E53686170655F617564697433223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223432302E302220793D223333302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222069643D2242504D4E53686170655F7369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223535352E302220793D223335302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697434222069643D2242504D4E53686170655F617564697434223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223633302E302220793D223333302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222069643D2242504D4E53686170655F7369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223736352E302220793D223335302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226170706C795F656E64222069643D2242504D4E53686170655F6170706C795F656E64223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223834302E302220793D223333302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222069643D2242504D4E53686170655F7369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130223E0D0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223234302E302220793D2234352E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E53686170653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546222069643D2242504D4E456467655F7369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223532302E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237222069643D2242504D4E456467655F7369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223238302E302220793D2236352E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223938392E302220793D2236352E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223938392E302220793D223335362E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338222069643D2242504D4E456467655F7369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223234302E302220793D2236352E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223135332E302220793D2236352E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223135332E302220793D223233312E35222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230222069643D2242504D4E456467655F7369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223338352E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223432302E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635222069643D2242504D4E456467655F7369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223335302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223136342E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242222069643D2242504D4E456467655F7369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223331302E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223334352E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439222069643D2242504D4E456467655F7369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223830352E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223834302E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137222069643D2242504D4E456467655F7369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223230312E302220793D223236302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223234302E302220793D223236302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530222069643D2242504D4E456467655F7369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223539352E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223633302E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236222069643D2242504D4E456467655F7369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223336352E302220793D223335302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223336352E302220793D223136342E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543222069643D2242504D4E456467655F7369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223733302E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223736352E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245222069643D2242504D4E456467655F7369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D2236302E302220793D223236302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223130352E302220793D223236302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146222069643D2242504D4E456467655F7369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223234302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223139332E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541222069643D2242504D4E456467655F7369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223133352E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D2238352E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537222069643D2242504D4E456467655F7369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223934302E302220793D223337302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223937352E302220793D223337302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839222069643D2242504D4E456467655F7369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223537352E302220793D223335302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223537352E302220793D223136342E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733222069643D2242504D4E456467655F7369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733223E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223238302E30222F3E0D0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223333302E30222F3E0D0A2020202020203C2F62706D6E64693A42504D4E456467653E0D0A202020203C2F62706D6E64693A42504D4E506C616E653E0D0A20203C2F62706D6E64693A42504D4E4469616772616D3E0D0A3C2F646566696E6974696F6E733E, '0');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.15.1) upgrade(5.18.0.1->5.21.0.0)', '2');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.21.0.0', '2');
INSERT INTO `act_re_deployment` VALUES ('2e1e8bdb94ff4f4ca831b4fddae50882', 'SpringAutoDeployment', null, '', '2018-08-13 19:38:39');
INSERT INTO `act_re_procdef` VALUES ('test_audit:1:47dd1683d96046f98affc2fab65c615c', '1', 'http://www.activiti.org/test', '流程审批测试流程', 'test_audit', '1', '2e1e8bdb94ff4f4ca831b4fddae50882', 'test_audit.bpmn20.xml', 'test_audit.png', null, '1', '1', '', '1');
INSERT INTO `cms_article` VALUES ('1', '3', '文章标题标题标题标题', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('10', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('11', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('12', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('13', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('14', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('15', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('16', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('17', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('18', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('19', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('2', '3', '文章标题标题标题标题', null, 'red', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('20', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('21', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('22', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('23', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('24', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('25', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('26', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('27', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('28', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('29', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('3', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('30', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('31', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('32', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('33', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('34', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('35', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('36', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('37', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('38', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('39', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('4', '3', '文章标题标题标题标题', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('40', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('41', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('42', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('43', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('44', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('45', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('46', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('47', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('48', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('49', '16', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('5', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('50', '17', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('51', '17', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('52', '26', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('53', '26', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('6', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('7', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('8', '4', '文章标题标题标题标题', null, 'blue', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('9', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article_data` VALUES ('1', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('10', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('11', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('12', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('13', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('14', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('15', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('16', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('17', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('18', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('19', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('2', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('20', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('21', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('22', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('23', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('24', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('25', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('26', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('27', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('28', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('29', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('3', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('30', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('31', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('32', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('33', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('34', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('35', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('36', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('37', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('38', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('39', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('4', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('40', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('41', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('42', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('43', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('44', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('45', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('46', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('47', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('48', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('49', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('5', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('50', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('51', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('52', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('53', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('6', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('7', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('8', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('9', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_category` VALUES ('1', '0', '0,', '0', '1', null, '顶级栏目', null, null, null, null, null, '0', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('10', '1', '0,1,', '1', '4', 'article', '软件介绍', null, null, null, null, null, '20', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('11', '10', '0,1,10,', '1', '4', 'article', '网络工具', null, null, null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('12', '10', '0,1,10,', '1', '4', 'article', '浏览工具', null, null, null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('13', '10', '0,1,10,', '1', '4', 'article', '浏览辅助', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('14', '10', '0,1,10,', '1', '4', 'article', '网络优化', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('15', '10', '0,1,10,', '1', '4', 'article', '邮件处理', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('16', '10', '0,1,10,', '1', '4', 'article', '下载工具', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('17', '10', '0,1,10,', '1', '4', 'article', '搜索工具', null, null, null, null, null, '50', '1', '1', '2', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('18', '1', '0,1,', '1', '5', 'link', '友情链接', null, null, null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('19', '18', '0,1,18,', '1', '5', 'link', '常用网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('2', '1', '0,1,', '1', '3', 'article', '组织机构', null, null, null, null, null, '10', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('20', '18', '0,1,18,', '1', '5', 'link', '门户网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('21', '18', '0,1,18,', '1', '5', 'link', '购物网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('22', '18', '0,1,18,', '1', '5', 'link', '交友社区', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('23', '18', '0,1,18,', '1', '5', 'link', '音乐视频', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('24', '1', '0,1,', '1', '6', null, '百度一下', null, 'http://www.baidu.com', '_blank', null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('25', '1', '0,1,', '1', '6', null, '全文检索', null, '/search', null, null, null, '90', '0', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('26', '1', '0,1,', '2', '6', 'article', '测试栏目', null, null, null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('27', '1', '0,1,', '1', '6', null, '公共留言', null, '/guestbook', null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('3', '2', '0,1,2,', '1', '3', 'article', '网站简介', null, null, null, null, null, '30', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('4', '2', '0,1,2,', '1', '3', 'article', '内部机构', null, null, null, null, null, '40', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('5', '2', '0,1,2,', '1', '3', 'article', '地方机构', null, null, null, null, null, '50', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('6', '1', '0,1,', '1', '3', 'article', '质量检验', null, null, null, null, null, '20', '1', '1', '1', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('7', '6', '0,1,6,', '1', '3', 'article', '产品质量', null, null, null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('8', '6', '0,1,6,', '1', '3', 'article', '技术质量', null, null, null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('9', '6', '0,1,6,', '1', '3', 'article', '工程质量', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('1', '19', 'JeeSite', null, null, 'http://thinkgem.github.com/jeesite', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('10', '22', '58同城', null, null, 'http://www.58.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('11', '23', '视频大全', null, null, 'http://v.360.cn/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('12', '23', '凤凰网', null, null, 'http://www.ifeng.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('2', '19', 'ThinkGem', null, null, 'http://thinkgem.iteye.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('3', '19', '百度一下', null, null, 'http://www.baidu.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('4', '19', '谷歌搜索', null, null, 'http://www.google.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('5', '20', '新浪网', null, null, 'http://www.sina.com.cn', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('6', '20', '腾讯网', null, null, 'http://www.qq.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('7', '21', '淘宝网', null, null, 'http://www.taobao.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('8', '21', '新华网', null, null, 'http://www.xinhuanet.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('9', '22', '赶集网', null, null, 'http://www.ganji.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_site` VALUES ('1', '默认站点', 'JeeSite Web', null, null, 'JeeSite', 'JeeSite', 'basic', 0x436F707972696768742026636F70793B20323031322D32303133203C6120687265663D27687474703A2F2F7468696E6B67656D2E69746579652E636F6D27207461726765743D275F626C616E6B273E5468696E6B47656D3C2F613E202D20506F7765726564204279203C6120687265663D2768747470733A2F2F6769746875622E636F6D2F7468696E6B67656D2F6A65657369746527207461726765743D275F626C616E6B273E4A6565536974653C2F613E2056312E30, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_site` VALUES ('2', '子站点测试', 'JeeSite Subsite', null, null, 'JeeSite subsite', 'JeeSite subsite', 'basic', 0x436F707972696768742026636F70793B20323031322D32303133203C6120687265663D27687474703A2F2F7468696E6B67656D2E69746579652E636F6D27207461726765743D275F626C616E6B273E5468696E6B47656D3C2F613E202D20506F7765726564204279203C6120687265663D2768747470733A2F2F6769746875622E636F6D2F7468696E6B67656D2F6A65657369746527207461726765743D275F626C616E6B273E4A6565536974653C2F613E2056312E30, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('61a88144465e4fcf8d7ff2fb4843b636', '竞赛信息', 'curd', 'cn.edu.ccnu.imd.edusys', 'dev', '', '竞赛信息管理', '竞赛信息', '飞扬', '3c16d8e53aa54dfda2d9a46a5a3a5a69', '1', '2018-08-13 19:33:34', '1', '2018-08-13 19:33:34', '', '0');
INSERT INTO `gen_scheme` VALUES ('764e23e9301d4c4fb45da9711fd4828f', '荣誉信息', 'curd', 'cn.edu.ccnu.imd.edusys', 'dev', '', '荣誉信息管理', '荣誉信息', '姣姣', '32b7cc4344554f05bbc12a66a3c7ec29', '1', '2018-08-13 19:35:06', '1', '2018-08-13 19:35:06', '', '0');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('c3857c817d5945bfb3abe95dcf10eeb0', '语言信息', 'curd', 'cn.edu.ccnu.imd.edusys', 'abroad', '', '语言信息管理', '语言信息', '苗苗', '934123af7dd24c8cbd528980f78b84c2', '1', '2018-08-13 19:32:48', '1', '2018-08-13 19:32:48', '', '0');
INSERT INTO `gen_scheme` VALUES ('c931e6ed630c4839b876c633c9195119', '活动信息', 'curd', 'cn.edu.ccnu.imd.edusys', 'dev', '', '活动信息管理', '活动信息', '小鹿', 'bd3833e43fba4bb3832b4b1fdbf34e3a', '1', '2018-08-13 19:34:20', '1', '2018-08-13 19:34:20', '', '0');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('32b7cc4344554f05bbc12a66a3c7ec29', 'dev_honor', '荣誉信息', 'DevHonor', '', '', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', '', '0');
INSERT INTO `gen_table` VALUES ('3c16d8e53aa54dfda2d9a46a5a3a5a69', 'dev_game', '竞赛信息', 'DevGame', '', '', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', '', '0');
INSERT INTO `gen_table` VALUES ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('934123af7dd24c8cbd528980f78b84c2', 'abroad_language', '语言信息表', 'AbroadLanguage', '', '', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', '', '0');
INSERT INTO `gen_table` VALUES ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('bd3833e43fba4bb3832b4b1fdbf34e3a', 'dev_campaign', '活动信息', 'DevCampaign', '', '', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', '', '0');
INSERT INTO `gen_table` VALUES ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('00be9370b0c34372aca2e65cc46422ff', '934123af7dd24c8cbd528980f78b84c2', 'create_date', '创建时间', 'timestamp', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', '', null, '70', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('050b2e85e4c54a288a3d6628197ca4b7', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'create_date', '创建日期', 'timestamp', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', '', null, '120', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1442c8596f4b47bd80f956e4a74f8f2a', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'remarks', '备注', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '120', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('179d6053819c4c2f80e62b34f15b3dcc', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'create_date', 'create_date', 'timestamp', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1a165d4e21ec4e44a5abb7ecba7b794a', '934123af7dd24c8cbd528980f78b84c2', 'sort', '语言类别', 'tinyint(4)', 'String', 'sort', '0', '1', '1', '1', '1', '1', '=', 'select', 'x', null, '30', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('1a2fbaf3b7604617b32a515360a2343f', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'student_id', '学号', 'varchar(64)', 'String', 'studentId', '0', '1', '1', '1', '1', '1', '=', 'input', '', null, '20', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1d522a8cbaf245ae9c9a22c4c1cbbf34', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'status', '状态', 'tinyint(4)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '140', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('29f657faadba4d78907e4d0a70f351e6', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'campaign_date', '活动时间', 'datetime', 'java.util.Date', 'campaignDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '50', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('2dd90324c2e8472fad15c937b968f141', '934123af7dd24c8cbd528980f78b84c2', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('2f5422d135f24e4a9fe9f660cbf434ea', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', '', null, '130', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('32a858833e9d431e98923d9f8ac066a1', '32b7cc4344554f05bbc12a66a3c7ec29', 'create_by', '创建人', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('35982b85b353480c9b7b952ebddc083c', '934123af7dd24c8cbd528980f78b84c2', 'create_by', '创建者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', '', null, '60', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('361672e97bc84dedb3969759c21c6ad3', '934123af7dd24c8cbd528980f78b84c2', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '100', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('394c2f1823ef4542bb790e77e2233c6c', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'remarks', '注记', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '90', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('39f7a01713c44435a247aac61810ea28', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('446c596592994f2eb30b531b105765ea', '32b7cc4344554f05bbc12a66a3c7ec29', 'update_by', '更新人', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('492e9922efc5433cbd5cb9dfc814ce5c', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'depart', '负责部门', 'varchar(200)', 'String', 'depart', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '40', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4a0dd8b1644b4b0aa5abd3f09f1daf39', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '1', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '80', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4ee901b01e5a4faea43bcbb65354ebfb', '32b7cc4344554f05bbc12a66a3c7ec29', 'name', '荣誉名称', 'varchar(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '40', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('5140e234738140d2b32897ac66ac60d4', '32b7cc4344554f05bbc12a66a3c7ec29', 'id', '学生编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('56ac07848dcc4b888f2c427e31583c58', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'sponor', '主办方', 'varchar(150)', 'String', 'sponor', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '60', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5af44a63a73f4b97bce80395883cb0ad', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'update_date', '更新日期', 'timestamp', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '100', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5e6a3870e5544852b363561a2b61d609', '32b7cc4344554f05bbc12a66a3c7ec29', 'status', 'status', 'tinyint(4)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'input', 'check_status', null, '30', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('5faa81b3760c4550a27ff77c520c0a25', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'student_id', '学号', 'varchar(64)', 'String', 'studentId', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '20', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('641b52dd55244a3fbb478e26a91e281f', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'del_flag', 'del_flag', 'char(1)', 'String', 'delFlag', '0', '1', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '130', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('6df1f9947bd44424b7f1a7f6a691d056', '32b7cc4344554f05bbc12a66a3c7ec29', 'sort', '荣誉所属类别', 'tinyint(4)', 'String', 'sort', '0', '1', '1', '1', '1', '1', '=', 'select', 'sx', null, '70', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('71c96b33976343dbb192ecb3c2f6ba9d', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'understanding', '活动感悟', 'mediumtext', 'String', 'understanding', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '70', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('727d860da7764b02a012f95c09458e68', '32b7cc4344554f05bbc12a66a3c7ec29', 'student_id', '学号', 'varchar(64)', 'String', 'studentId', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '20', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('73704481b1f6412f9fbba9705de72dd2', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'game_time', '比赛时间', 'datetime', 'java.util.Date', 'gameTime', '0', '1', '1', '1', '1', '1', 'between', 'dateselect', '', null, '50', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('7de1ec825b3d4b68bf51d85aa0dcfe4a', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'status', '状态', 'tinyint(4)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'input', 'check_status', null, '140', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('838201b5a5b644acbf31abd444f8ac91', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'create_by', 'create_by', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'createBy.id', '0', '1', '1', '0', '0', '0', '=', 'input', '', null, '80', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8bee3b68fd924578bf88600baf025800', '934123af7dd24c8cbd528980f78b84c2', 'update_date', '更新时间', 'timestamp', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '90', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('9420d78b580d483dafc2789dc39501df', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'update_by', 'update_by', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '100', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('9b479af5fb524bb594d7dcdaec29dbe5', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'name', '活动名称', 'varchar(64)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '30', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('a54a2e7d5caa4c6e901b50d786379ca3', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'name', '赛事名称', 'varchar(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', '', null, '30', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('b393c56f116e4453a3ad10ea046b30c3', '934123af7dd24c8cbd528980f78b84c2', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '1', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '120', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('b858e01166394459968cd62a4617304d', '934123af7dd24c8cbd528980f78b84c2', 'grade', '语言分数', 'float(11,0)', 'String', 'grade', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '40', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('bba023fab9ae4489a42d71034d63a9b5', '934123af7dd24c8cbd528980f78b84c2', 'status', '状态', 'tinyint(4)', 'String', 'status', '0', '1', '1', '1', '0', '0', '=', 'radiobox', 'check_status', null, '110', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('c260b6da5f4149d897c0085109f944d1', '32b7cc4344554f05bbc12a66a3c7ec29', 'unit', '颁奖单位', 'varchar(150)', 'String', 'unit', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '60', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('ca29f6743e1f4e56a8406995b2742455', '32b7cc4344554f05bbc12a66a3c7ec29', 'create_date', '创建时间', 'timestamp', 'java.util.Date', 'createDate', '0', '1', '1', '0', '0', '0', '=', 'dateselect', '', null, '90', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cc3a8d57e6c64ddbb6eb27c66f85d115', '934123af7dd24c8cbd528980f78b84c2', 'student_id', '学号', 'varchar(64)', 'String', 'studentId', '0', '0', '1', '1', '1', '1', '=', 'input', '', null, '20', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('cc854dcaf7ea454f97c34e5c3ffdeaee', '32b7cc4344554f05bbc12a66a3c7ec29', 'level', '荣誉级别', 'tinyint(4)', 'String', 'level', '0', '1', '1', '1', '1', '1', '=', 'select', 's', null, '50', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('de91c3bae10647d0b774ea9fccc48d86', '934123af7dd24c8cbd528980f78b84c2', 'ispass', '是否通过', 'tinyint(4)', 'String', 'ispass', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'yes_no', null, '50', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('df3b3796d4424998b40ead6dd51f2437', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'sort', '类别', 'tinyint(4)', 'String', 'sort', '0', '1', '1', '1', '1', '1', '=', 'input', 's', null, '70', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('e04e633133864294b833615c0e7ad285', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'update_date', 'update_date', 'timestamp', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('e0f34f4a433643ae885f44f67c3c30d2', '32b7cc4344554f05bbc12a66a3c7ec29', 'update_date', '更新时间', 'timestamp', 'java.util.Date', 'updateDate', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '110', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('e59776a3b9dd487bbe8d7be44b62d7b8', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'id', 'id', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e7668079b5f849e6b755bb45c7562094', '32b7cc4344554f05bbc12a66a3c7ec29', 'del_flag', '删除标记', 'varchar(1)', 'String', 'delFlag', '0', '1', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '120', '1', '2018-08-13 19:31:32', '1', '2018-08-13 19:31:32', null, '0');
INSERT INTO `gen_table_column` VALUES ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ec03ea6868ce4ab999e50744a6a72224', '934123af7dd24c8cbd528980f78b84c2', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '80', '1', '2018-08-13 19:26:52', '1', '2018-08-13 19:26:52', null, '0');
INSERT INTO `gen_table_column` VALUES ('ec06d6747e10442fb0f9b7b7bbf3f123', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'amount_time', '活动时长', 'float', 'String', 'amountTime', '0', '1', '1', '1', '1', '0', '=', 'input', '', null, '60', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `gen_table_column` VALUES ('f2a9301f637a4b29b14d60923974178d', '3c16d8e53aa54dfda2d9a46a5a3a5a69', 'level', '赛事等级', 'tinyint(4)', 'String', 'level', '0', '1', '1', '1', '1', '1', '=', 'input', 'y', null, '40', '1', '2018-08-13 19:29:48', '1', '2018-08-13 19:29:48', null, '0');
INSERT INTO `gen_table_column` VALUES ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('faca481c41cc4c1ab02efda298786ca6', 'bd3833e43fba4bb3832b4b1fdbf34e3a', 'update_by', '更新者', 'varchar(64)', 'com.thinkgem.jeesite.modules.sys.entity.User', 'updateBy.id', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '110', '1', '2018-08-13 19:28:18', '1', '2018-08-13 19:28:18', null, '0');
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '济南市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', '50', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', '60', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_log` VALUES ('00b0161c9f2e4ea3a388e8317b408eaa', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 19:16:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396137376462636630386536346232363963653062306664366136346266633226706172656E742E6E616D653DE5ADA6E4B9A0E7BB8FE58E86266E616D653DE6B4BBE58AA8E4BFA1E681AF26687265663D2F646576267461726765743D2669636F6E3D26736F72743D333026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('0273e93da0cf4766830949e1a483ee9d', '1', '内容管理-内容管理-内容发布', '1', '2018-08-13 18:17:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('041c398bf0944afb9086719e159977ef', '1', '我的面板-个人信息-个人信息', '1', '2018-08-13 18:40:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0ae4923b979c414cb0ec6b733b900c87', '1', '内容管理-内容管理', '1', '2018-08-13 18:17:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('172a001f81a84335aada49da0b911e69', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 19:24:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3961373764626366303865363462323639636530623066643661363462666332, '');
INSERT INTO `sys_log` VALUES ('1ffc89688ab545afb6abade77a1a0b03', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:57:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2494806aeecc4b35b8318a6041eeb2a6', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:59:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x69643D3036653864313362643239383436396139373865393061623339313562333438, '');
INSERT INTO `sys_log` VALUES ('24a4c42171cf4e28a4b030af4a607c38', '1', '内容管理-内容管理', '1', '2018-08-13 18:17:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2d9d8b9422424d08a80c1d9f1cfca85c', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:59:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE5B0B1E4B89AE4BFA1E681AF26687265663D267461726765743D2669636F6E3D26736F72743D31353026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('32e34531a5ed4750826260b04e81de43', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:59:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3965363136303334373262633435323639386337643962383061316463363564, '');
INSERT INTO `sys_log` VALUES ('3a8a1eb3b27f4f22817338d743869b8f', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 19:00:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3964363532353432613231613463393062393463333362396635343230393865, '');
INSERT INTO `sys_log` VALUES ('3f6ba1fc487f4d80862b75df073b46a9', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 19:01:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D383161343230393564393162343233326234616562306434333639313366326626706172656E742E6E616D653DE587BAE59BBDE4BFA1E681AF266E616D653DE8AFADE8A880E4BFA1E681AF26687265663D2F6162726F61642F6C616E6775616765267461726765743D2669636F6E3D26736F72743D333026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('4440c978959747599712f000bae9bcb4', '1', '我的面板-个人信息-个人信息', '1', '2018-08-13 18:17:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('462db2a8c3164b688cf5ad9915d9275e', '1', '代码生成-代码生成-业务表配置', '1', '2018-08-13 19:24:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4b6a2c192eff480ebdbec6d02f29f5dd', '1', '在线办公-通知通告-我的通告', '1', '2018-08-13 18:17:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4c7fc3a85fd64ac49524d7277f85bae2', '1', '代码生成-代码生成-业务表配置', '1', '2018-08-13 18:17:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('58829fe79b754bb88fcbdae867268ddb', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:59:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5e5b6d7dfab941fa8452d7166bfa83e3', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:59:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5e5cc094950840049f6d41b10968e465', '1', '在线办公-通知通告-我的通告', '1', '2018-08-13 18:17:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5ee30a8f4a86471299faaeb31f7b1ac1', '1', '代码生成-代码生成-生成方案配置', '1', '2018-08-13 19:31:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5fa1905889c4483f87ee6db90b1ef067', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:58:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE5ADA6E7949FE7AEA1E7908626687265663D267461726765743D2669636F6E3D26736F72743D333026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('5ff8bd960346489a9a6991c1d844cd5b', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:57:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D3126706172656E742E6E616D653DE58A9FE883BDE88F9CE58D95266E616D653DE7949FE6B6AFE7AEA1E7908626687265663D267461726765743D2669636F6E3D26736F72743D3530333026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('61054d060bcd4285b67291f5a7e1b0d9', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:58:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x69643D3964363532353432613231613463393062393463333362396635343230393865, '');
INSERT INTO `sys_log` VALUES ('623d3ce5facd4723a423d11cdb3b0480', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:59:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6240086b68f544faacbb44b6e0092be1', '1', '内容管理-内容管理-内容发布', '1', '2018-08-13 18:17:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('63fc0d72fe864aa78471b0022a2d5872', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:58:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE59FBAE7A180E69599E882B226687265663D267461726765743D2669636F6E3D26736F72743D363026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('6429af4313744e2cbff3e94113cf6c3f', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 19:01:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('66731d1622a6486ba19d45f5d52a92cb', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 19:00:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3831613432303935643931623432333262346165623064343336393133663266, '');
INSERT INTO `sys_log` VALUES ('66edd276e9ec47799ff392172917653a', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:59:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6b19eba0ba494d61adb9e5582229b288', '1', '我的面板-个人信息-个人信息', '1', '2018-08-13 18:25:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6b1fbb3166ec466ab9f52870823f7858', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:58:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE88083E7A094E4BFA1E681AF26687265663D267461726765743D2669636F6E3D26736F72743D393026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('72b1be75e801443697f47d7c3b7737be', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:59:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3965363136303334373262633435323639386337643962383061316463363564, '');
INSERT INTO `sys_log` VALUES ('76303037f121479f9d96c586920db129', '1', '内容管理-内容管理', '1', '2018-08-13 18:17:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7e572d5d9c2a4934bc31d7f1502902f2', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 19:00:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('83de701a8b2d4960a15319a4c2b1186d', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 19:16:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x69643D3034623463346664666339613464633838633966636339363734346664313532, '');
INSERT INTO `sys_log` VALUES ('8af0c45ce555491c8e6707050e66db15', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:57:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8b373e183b744acf8787c3667723eae5', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:58:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8b868e6f2a07433692fe259119dbe382', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 19:24:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396137376462636630386536346232363963653062306664366136346266633226706172656E742E6E616D653DE5ADA6E4B9A0E7BB8FE58E86266E616D653DE88EB7E5A596E4BFA1E681AF26687265663D2F6465762F686F6E6F72267461726765743D2669636F6E3D26736F72743D393026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('8d6cdd9d7c5d41caaa997be35ca0ed20', '1', '系统登录', '1', '2018-08-13 18:17:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a', 'GET', 0x6C6F67696E3D, '');
INSERT INTO `sys_log` VALUES ('96596ca42780463dad5c69791d1f3b73', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 19:16:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3961373764626366303865363462323639636530623066643661363462666332, '');
INSERT INTO `sys_log` VALUES ('96a480e436b8408bafb60e3288b137d5', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 19:16:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D303462346334666466633961346463383863396663633936373434666431353226706172656E742E69643D396137376462636630386536346232363963653062306664366136346266633226706172656E742E6E616D653DE5ADA6E4B9A0E7BB8FE58E86266E616D653DE6B4BBE58AA8E4BFA1E681AF26687265663D2F6465762F63616D706169676E267461726765743D2669636F6E3D26736F72743D333026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('9c80ab8d0752400e922a426f06b594d8', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 19:17:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396137376462636630386536346232363963653062306664366136346266633226706172656E742E6E616D653DE5ADA6E4B9A0E7BB8FE58E86266E616D653DE7AB9EE8B59BE4BFA1E681AF26687265663D2F6465762F67616D65267461726765743D2669636F6E3D26736F72743D363026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('a176f829c39246c194ba713005e2ebe0', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:58:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3965363136303334373262633435323639386337643962383061316463363564, '');
INSERT INTO `sys_log` VALUES ('a3ce891054334a51ba0572575e5e83ac', '1', '内容管理-内容管理', '1', '2018-08-13 18:17:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a5b096c648a2430ab26559c0eb5a0dd2', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:58:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a88a737ff4464e8c9961e1a3184e6bbe', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 19:17:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ae0bc054e1554c38a1505f0ee2d8ccbf', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:58:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ae82ae3e6cb648bca95cd2801d316760', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-08-13 18:57:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ae9522c902de46bcb0f5e6d6cf44c715', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 19:24:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b1afd48ba5a84996baf15ee62571b6c9', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:59:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3965363136303334373262633435323639386337643962383061316463363564, '');
INSERT INTO `sys_log` VALUES ('b5a44fe1c56746fc84f638374e64fc1b', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:59:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D396436353235343261323161346339306239346333336239663534323039386526706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE59FBAE7A180E8AFBEE7A88B26687265663D267461726765743D2669636F6E3D26736F72743D363026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('b964babd051d4a39a245773bfe883ac3', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 19:00:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D396137376462636630386536346232363963653062306664366136346266633226706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE5ADA6E4B9A0E7BB8FE58E8626687265663D267461726765743D2669636F6E3D26736F72743D31383026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('bd27f83c79c441a6885209feb225176b', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:58:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3965363136303334373262633435323639386337643962383061316463363564, '');
INSERT INTO `sys_log` VALUES ('c0ee4864175445be82699b02c1ebb150', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:57:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c4304e71c7354c279c3b255cd673daf0', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-08-13 18:17:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c473adced7b94a4a852d0424c2604824', '1', '系统设置-机构用户-用户管理', '1', '2018-08-13 18:57:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c81e49c0ea4c436ca20a1bcdedff9869', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:59:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE88083E7A094E4BFA1E681AF26687265663D267461726765743D2669636F6E3D26736F72743D31383026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('c91b65dafac845c99d74475e696de555', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 19:16:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d7679676c87a42e49a2ead4ba42bf0f1', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:59:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D303665386431336264323938343639613937386539306162333931356233343826706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE5ADA6E7949FE4BFA1E681AF26687265663D267461726765743D2669636F6E3D26736F72743D333026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('df34f796feaf4686879d9aecb2435f04', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 19:16:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ebf229783b4741f4983fe8978bc20c01', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 19:16:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3961373764626366303865363462323639636530623066643661363462666332, '');
INSERT INTO `sys_log` VALUES ('ec0dc168962f4d57859dc5680372ef37', '1', '我的面板-个人信息-个人信息', '1', '2018-08-13 18:17:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ed81edfccfcd4019adb9a2ba33312f49', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:57:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x706172656E742E69643D3965363136303334373262633435323639386337643962383061316463363564, '');
INSERT INTO `sys_log` VALUES ('ee251317ceb444588e12d1107a2b70f2', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-08-13 18:59:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 0x69643D26706172656E742E69643D396536313630333437326263343532363938633764396238306131646336356426706172656E742E6E616D653DE7949FE6B6AFE7AEA1E79086266E616D653DE587BAE59BBDE4BFA1E681AF26687265663D267461726765743D2669636F6E3D26736F72743D31323026697353686F773D31267065726D697373696F6E3D2672656D61726B733D, '');
INSERT INTO `sys_log` VALUES ('f35c5321cdb546c781dc1627a3d00a40', '1', '系统设置-机构用户-用户管理', '1', '2018-08-13 18:17:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fd58fa65ea294ed6a53cdd4c0606f785', '1', '系统设置-系统设置-菜单管理', '1', '2018-08-13 18:59:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fdd1f71c1994427dab0034c4713f3d67', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-08-13 18:59:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.89 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 0x69643D3961373764626366303865363462323639636530623066643661363462666332, '');
INSERT INTO `sys_menu` VALUES ('04b4c4fdfc9a4dc88c9fcc96744fd152', '9a77dbcf08e64b269ce0b0fd6a64bfc2', '0,1,9e61603472bc452698c7d9b80a1dc65d,9a77dbcf08e64b269ce0b0fd6a64bfc2,', '活动信息', '30', '/dev/campaign', '', '', '1', '', '1', '2018-08-13 19:16:23', '1', '2018-08-13 19:16:41', '', '0');
INSERT INTO `sys_menu` VALUES ('06e8d13bd298469a978e90ab3915b348', '9e61603472bc452698c7d9b80a1dc65d', '0,1,9e61603472bc452698c7d9b80a1dc65d,', '学生信息', '30', '', '', '', '1', '', '1', '2018-08-13 18:58:02', '1', '2018-08-13 18:59:12', '', '0');
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('367c0b21a9c84e48a02ee004a5ce0530', '9a77dbcf08e64b269ce0b0fd6a64bfc2', '0,1,9e61603472bc452698c7d9b80a1dc65d,9a77dbcf08e64b269ce0b0fd6a64bfc2,', '竞赛信息', '60', '/dev/game', '', '', '1', '', '1', '2018-08-13 19:17:09', '1', '2018-08-13 19:17:09', '', '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', null, 'leaf', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81a42095d91b4232b4aeb0d436913f2f', '9e61603472bc452698c7d9b80a1dc65d', '0,1,9e61603472bc452698c7d9b80a1dc65d,', '出国信息', '120', '', '', '', '1', '', '1', '2018-08-13 18:59:22', '1', '2018-08-13 18:59:22', '', '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/form', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9a77dbcf08e64b269ce0b0fd6a64bfc2', '9e61603472bc452698c7d9b80a1dc65d', '0,1,9e61603472bc452698c7d9b80a1dc65d,', '学习经历', '180', '', '', '', '1', '', '1', '2018-08-13 18:59:36', '1', '2018-08-13 19:00:09', '', '0');
INSERT INTO `sys_menu` VALUES ('9c198be0244443448d76c6cfe295f81b', '9e61603472bc452698c7d9b80a1dc65d', '0,1,9e61603472bc452698c7d9b80a1dc65d,', '考研信息', '90', '', '', '', '1', '', '1', '2018-08-13 18:58:54', '1', '2018-08-13 18:58:54', '', '0');
INSERT INTO `sys_menu` VALUES ('9d652542a21a4c90b94c33b9f542098e', '9e61603472bc452698c7d9b80a1dc65d', '0,1,9e61603472bc452698c7d9b80a1dc65d,', '基础课程', '60', '', '', '', '1', '', '1', '2018-08-13 18:58:43', '1', '2018-08-13 18:59:03', '', '0');
INSERT INTO `sys_menu` VALUES ('9e61603472bc452698c7d9b80a1dc65d', '1', '0,1,', '生涯管理', '5030', '', '', '', '1', '', '1', '2018-08-13 18:57:33', '1', '2018-08-13 18:57:33', '', '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c406ce4e72594060a2aa14293b316ae0', '81a42095d91b4232b4aeb0d436913f2f', '0,1,9e61603472bc452698c7d9b80a1dc65d,81a42095d91b4232b4aeb0d436913f2f,', '语言信息', '30', '/abroad/language', '', '', '1', '', '1', '2018-08-13 19:01:35', '1', '2018-08-13 19:01:35', '', '0');
INSERT INTO `sys_menu` VALUES ('d0857d0de69342c9b4c20736899619d5', '9e61603472bc452698c7d9b80a1dc65d', '0,1,9e61603472bc452698c7d9b80a1dc65d,', '就业信息', '150', '', '', '', '1', '', '1', '2018-08-13 18:59:29', '1', '2018-08-13 18:59:29', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('dc66541436834b7fb36daa764697604c', '9a77dbcf08e64b269ce0b0fd6a64bfc2', '0,1,9e61603472bc452698c7d9b80a1dc65d,9a77dbcf08e64b269ce0b0fd6a64bfc2,', '获奖信息', '90', '/dev/honor', '', '', '1', '', '1', '2018-08-13 19:24:35', '1', '2018-08-13 19:24:35', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '山东省总公司', '10', '2', '100000', '1', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '历城区分公司', '0', '4', '201000', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '历下区分公司', '40', '5', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '高新区分公司', '50', '6', '201010', '1', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '济南市分公司', '20', '3', '200000', '1', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '73');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '76');
INSERT INTO `sys_role_menu` VALUES ('1', '77');
INSERT INTO `sys_role_menu` VALUES ('1', '78');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '80');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '83');
INSERT INTO `sys_role_menu` VALUES ('1', '84');
INSERT INTO `sys_role_menu` VALUES ('1', '85');
INSERT INTO `sys_role_menu` VALUES ('1', '86');
INSERT INTO `sys_role_menu` VALUES ('1', '87');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '72');
INSERT INTO `sys_role_menu` VALUES ('2', '73');
INSERT INTO `sys_role_menu` VALUES ('2', '74');
INSERT INTO `sys_role_menu` VALUES ('2', '75');
INSERT INTO `sys_role_menu` VALUES ('2', '76');
INSERT INTO `sys_role_menu` VALUES ('2', '77');
INSERT INTO `sys_role_menu` VALUES ('2', '78');
INSERT INTO `sys_role_menu` VALUES ('2', '79');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '80');
INSERT INTO `sys_role_menu` VALUES ('2', '81');
INSERT INTO `sys_role_menu` VALUES ('2', '82');
INSERT INTO `sys_role_menu` VALUES ('2', '83');
INSERT INTO `sys_role_menu` VALUES ('2', '84');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('2', '86');
INSERT INTO `sys_role_menu` VALUES ('2', '87');
INSERT INTO `sys_role_menu` VALUES ('2', '88');
INSERT INTO `sys_role_menu` VALUES ('2', '89');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '90');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '74');
INSERT INTO `sys_role_menu` VALUES ('3', '75');
INSERT INTO `sys_role_menu` VALUES ('3', '76');
INSERT INTO `sys_role_menu` VALUES ('3', '77');
INSERT INTO `sys_role_menu` VALUES ('3', '78');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '83');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '86');
INSERT INTO `sys_role_menu` VALUES ('3', '87');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'thinkgem@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', '2018-08-13 18:17:13', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1');
