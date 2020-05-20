# Host: localhost  (Version 5.7.27-log)
# Date: 2020-05-21 00:40:14
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
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务表';

#
# Data for table "fengyulou_computer"
#

INSERT INTO `fengyulou_computer` VALUES (1,1,'123','22','123','123',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,'123.56.102.170','22','3453','345',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,3,'123111','22','12311','1111',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');

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
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='人员表';

#
# Data for table "fengyulou_member"
#

INSERT INTO `fengyulou_member` VALUES (1,'高圆圆',1,'',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'唐嫣',2,'',0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'张天爱',2,'',0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'人员1',3,'',0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'人员2',3,'',0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'郭超',5,'',0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'人员2',4,'',0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');

#
# Structure for table "fengyulou_member_label"
#

DROP TABLE IF EXISTS `fengyulou_member_label`;
CREATE TABLE `fengyulou_member_label` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='人员标签表';

#
# Data for table "fengyulou_member_label"
#

INSERT INTO `fengyulou_member_label` VALUES (1,'美女',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'美女',0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'aa',0,7,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'aa',0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Java',0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');

#
# Structure for table "fengyulou_member_monitor"
#

DROP TABLE IF EXISTS `fengyulou_member_monitor`;
CREATE TABLE `fengyulou_member_monitor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_one` int(11) DEFAULT NULL COMMENT '被监听人id',
  `member_id` int(11) DEFAULT NULL COMMENT '人员id',
  `user_id_two` int(11) DEFAULT NULL COMMENT '监听人id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `member_id` (`member_id`,`user_id_one`,`user_id_two`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员监听';

#
# Data for table "fengyulou_member_monitor"
#

INSERT INTO `fengyulou_member_monitor` VALUES (1,7,4,1,'2020-05-20 22:53:33',NULL,1,'2020-05-20 23:41:29'),(2,7,5,1,'2020-05-20 22:53:34',NULL,1,'2020-05-20 23:41:30'),(3,8,6,1,'2020-05-20 22:58:49',NULL,0,NULL),(4,8,7,1,'2020-05-20 22:59:01',NULL,1,'2020-05-20 23:41:31'),(7,8,7,8,'2020-05-21 00:39:16',NULL,1,'2020-05-21 00:39:17'),(8,8,6,8,'2020-05-21 00:39:16',NULL,1,'2020-05-21 00:39:17');

#
# Structure for table "fengyulou_project"
#

DROP TABLE IF EXISTS `fengyulou_project`;
CREATE TABLE `fengyulou_project` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='项目表';

#
# Data for table "fengyulou_project"
#

INSERT INTO `fengyulou_project` VALUES (1,'刷锅女皇',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'遛狗女王',0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'逛公园',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'111',0,8,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');

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
  `finish_time` date DEFAULT NULL COMMENT '完成时间',
  `member_id` int(11) DEFAULT '0' COMMENT '人员id',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='任务表';

#
# Data for table "fengyulou_task"
#

INSERT INTO `fengyulou_task` VALUES (1,1,'饭后刷锅',1,1,'2020-05-19',1,0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,'遛狗',2,1,'2020-04-27',3,0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,'123',1,0,NULL,1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2020-05-19 21:56:24'),(4,3,'123',1,0,NULL,1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2020-05-19 21:56:17'),(5,3,'asdfasdfsa111',1,1,'2020-05-19',1,0,1,'2020-05-19 21:28:56','2020-05-19 21:56:49','0000-00-00 00:00:00'),(6,3,'123123123',1,0,NULL,1,0,1,'2020-05-20 23:40:18','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,4,'123123123',3,1,'2020-05-21',6,0,8,'2020-05-20 23:47:26','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,4,'123123123',3,0,NULL,7,0,8,'2020-05-20 23:58:50','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,3,'aaaaa',1,0,NULL,1,0,1,'2020-05-21 00:15:51','0000-00-00 00:00:00','0000-00-00 00:00:00');

#
# Structure for table "fengyulou_task_label"
#

DROP TABLE IF EXISTS `fengyulou_task_label`;
CREATE TABLE `fengyulou_task_label` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='任务标签表';

#
# Data for table "fengyulou_task_label"
#

INSERT INTO `fengyulou_task_label` VALUES (1,'厨房',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'运动',0,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'222',0,8,'2020-05-20 23:42:28','0000-00-00 00:00:00','0000-00-00 00:00:00');

#
# Structure for table "fengyulou_task_user"
#

DROP TABLE IF EXISTS `fengyulou_task_user`;
CREATE TABLE `fengyulou_task_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `disabled` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1禁用（其他用户创建的任务，不可以修改，只可以修改任务状态）',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务用户表';

#
# Data for table "fengyulou_task_user"
#

INSERT INTO `fengyulou_task_user` VALUES (1,9,8,0),(2,9,1,1),(3,10,8,0),(4,11,1,0);

#
# Structure for table "fengyulou_user"
#

DROP TABLE IF EXISTS `fengyulou_user`;
CREATE TABLE `fengyulou_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型 0普通用户 1管理员',
  `insert_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "fengyulou_user"
#

INSERT INTO `fengyulou_user` VALUES (1,'郭超','D19BE809FA02E18DB9A34E905F08AB84','郭超',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'yangwenli','D19BE809FA02E18DB9A34E905F08AB84','杨文黎',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'qinliwei','D19BE809FA02E18DB9A34E905F08AB84','秦莉薇',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'123','D19BE809FA02E18DB9A34E905F08AB84','123',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'daqeq','D19BE809FA02E18DB9A34E905F08AB84','qwer',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'asdf','D19BE809FA02E18DB9A34E905F08AB84','asdf',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'用户1','791C4A538D3C7992187D1AD81FE14B06','用户1',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'用户2','791C4A538D3C7992187D1AD81FE14B06','用户2',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');
