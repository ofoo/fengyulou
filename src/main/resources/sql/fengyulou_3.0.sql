# Host: localhost  (Version 5.7.3-m13)
# Date: 2020-05-27 10:05:19
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "fengyulou_computer"
#

DROP TABLE IF EXISTS `fengyulou_computer`;
CREATE TABLE `fengyulou_computer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `host` varchar(255) NOT NULL DEFAULT '' COMMENT '主机',
  `port` varchar(255) NOT NULL DEFAULT '' COMMENT '端口',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='云服务器表';

#
# Data for table "fengyulou_computer"
#

INSERT INTO `fengyulou_computer` VALUES (1,1,'123','22','root','12333',1,1,'2020-05-25 12:49:28','2020-05-25 12:49:38','2020-05-25 12:49:42');

#
# Structure for table "fengyulou_member"
#

DROP TABLE IF EXISTS `fengyulou_member`;
CREATE TABLE `fengyulou_member` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '人员名称',
  `member_label_id` int(11) NOT NULL DEFAULT '0' COMMENT '人员标签id',
  `mobile` varchar(255) DEFAULT '' COMMENT '人员手机',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='人员表';

#
# Data for table "fengyulou_member"
#

INSERT INTO `fengyulou_member` VALUES (1,'1234333',1,'',1,1,'2020-05-25 12:46:46','2020-05-25 12:49:47','2020-05-25 12:49:54'),(2,'123',2,'',0,1,'2020-05-25 13:38:59',NULL,NULL);

#
# Structure for table "fengyulou_member_label"
#

DROP TABLE IF EXISTS `fengyulou_member_label`;
CREATE TABLE `fengyulou_member_label` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='人员标签表';

#
# Data for table "fengyulou_member_label"
#

INSERT INTO `fengyulou_member_label` VALUES (1,'1234333',1,1,'2020-05-25 12:46:42','2020-05-25 12:49:59','2020-05-25 12:50:04'),(2,'123',0,1,'2020-05-25 13:38:58',NULL,NULL);

#
# Structure for table "fengyulou_project"
#

DROP TABLE IF EXISTS `fengyulou_project`;
CREATE TABLE `fengyulou_project` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='项目表';

#
# Data for table "fengyulou_project"
#

INSERT INTO `fengyulou_project` VALUES (1,'111333',1,1,'2020-05-25 12:46:32','2020-05-25 12:50:10','2020-05-25 12:50:14'),(2,'123',0,1,'2020-05-25 13:38:52',NULL,NULL),(3,'123123',0,1,'2020-05-25 16:11:29','2020-05-25 16:11:31',NULL),(4,'333',0,1,'2020-05-25 16:11:47',NULL,NULL),(5,'111',0,1,'2020-05-25 16:11:51',NULL,NULL),(6,'222',0,1,'2020-05-25 16:11:54',NULL,NULL),(7,'444',0,1,'2020-05-25 16:11:58',NULL,NULL),(8,'555',0,1,'2020-05-25 16:12:01',NULL,NULL),(9,'666',0,1,'2020-05-25 16:12:04',NULL,NULL),(10,'777',0,1,'2020-05-25 16:12:08',NULL,NULL),(11,'888',0,1,'2020-05-25 16:12:11',NULL,NULL),(12,'999',0,1,'2020-05-25 16:12:15',NULL,NULL);

#
# Structure for table "fengyulou_task"
#

DROP TABLE IF EXISTS `fengyulou_task`;
CREATE TABLE `fengyulou_task` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `sketch` varchar(255) NOT NULL DEFAULT '' COMMENT '任务简述',
  `task_label_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务标签id',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '任务状态 0未完成 1已完成',
  `finish_time` date DEFAULT NULL COMMENT '任务完成时间',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '人员id',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='任务表';

#
# Data for table "fengyulou_task"
#

INSERT INTO `fengyulou_task` VALUES (1,1,'123111',1,1,'2020-05-25',1,1,1,'2020-05-25 12:46:57','2020-05-25 12:47:10','2020-05-25 12:48:31'),(2,2,'12123',2,0,NULL,2,0,1,'2020-05-25 13:39:04',NULL,NULL),(3,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:47','2020-05-25 14:55:49',NULL),(4,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:48','2020-05-25 14:55:49',NULL),(5,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:49','2020-05-25 14:55:49',NULL),(6,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:49','2020-05-25 14:55:50',NULL),(7,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:49','2020-05-25 14:55:50',NULL),(8,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:50','2020-05-25 14:55:50',NULL),(9,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:50','2020-05-25 14:55:51',NULL),(10,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:50','2020-05-25 14:55:51',NULL),(11,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:51','2020-05-25 14:55:52',NULL),(12,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:51',NULL,NULL),(13,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:51','2020-05-25 14:55:52',NULL),(14,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:52',NULL,NULL),(15,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:52',NULL,NULL),(16,2,'123',2,0,NULL,2,0,1,'2020-05-25 14:55:52',NULL,NULL),(17,12,'2222222',2,0,NULL,2,0,1,'2020-05-25 18:47:19',NULL,NULL),(18,12,'3333333333',2,0,NULL,2,0,1,'2020-05-25 18:58:12',NULL,NULL),(19,12,'44444444',2,0,NULL,2,0,1,'2020-05-25 18:58:20',NULL,NULL),(20,12,'55555555555',2,0,NULL,2,0,1,'2020-05-25 19:01:02',NULL,NULL);

#
# Structure for table "fengyulou_task_label"
#

DROP TABLE IF EXISTS `fengyulou_task_label`;
CREATE TABLE `fengyulou_task_label` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='任务标签表';

#
# Data for table "fengyulou_task_label"
#

INSERT INTO `fengyulou_task_label` VALUES (1,'222111',1,1,'2020-05-25 12:46:34','2020-05-25 12:48:39','2020-05-25 12:48:43'),(2,'123',0,1,'2020-05-25 13:38:54',NULL,NULL);

#
# Structure for table "fengyulou_user"
#

DROP TABLE IF EXISTS `fengyulou_user`;
CREATE TABLE `fengyulou_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型 0普通用户 1管理员 2销售',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户表';

#
# Data for table "fengyulou_user"
#

INSERT INTO `fengyulou_user` VALUES (1,'郭超','D19BE809FA02E18DB9A34E905F08AB84','郭超',0,1,NULL,NULL,NULL),(3,'练练','D19BE809FA02E18DB9A34E905F08AB84','练练',0,0,NULL,NULL,NULL),(4,'红红','D19BE809FA02E18DB9A34E905F08AB84','红红',0,0,NULL,NULL,NULL),(5,'1234222','791C4A538D3C7992187D1AD81FE14B06','1234',1,0,'2020-05-25 12:50:23','2020-05-25 12:50:28','2020-05-25 12:50:32'),(6,'111','791C4A538D3C7992187D1AD81FE14B06','111',0,0,'2020-05-25 16:12:24',NULL,NULL),(7,'222','791C4A538D3C7992187D1AD81FE14B06','222',0,0,'2020-05-25 16:12:28',NULL,NULL),(8,'333','791C4A538D3C7992187D1AD81FE14B06','333',0,0,'2020-05-25 16:12:35',NULL,NULL),(9,'444','791C4A538D3C7992187D1AD81FE14B06','444',0,0,'2020-05-25 16:12:40',NULL,NULL),(10,'555','791C4A538D3C7992187D1AD81FE14B06','555',0,0,'2020-05-25 16:12:45',NULL,NULL),(11,'666','791C4A538D3C7992187D1AD81FE14B06','666',0,0,'2020-05-25 16:12:50',NULL,NULL),(12,'777','791C4A538D3C7992187D1AD81FE14B06','777',0,0,'2020-05-25 16:12:55',NULL,NULL),(13,'888','791C4A538D3C7992187D1AD81FE14B06','888',0,0,'2020-05-25 16:13:01',NULL,NULL);
