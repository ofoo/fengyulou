# Host: localhost  (Version 5.7.3-m13)
# Date: 2020-05-27 23:29:47
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='云服务器表';

#
# Data for table "fengyulou_computer"
#

INSERT INTO `fengyulou_computer` VALUES (1,9,'139.159.239.236','22','root','Hy123456',0,1,NULL,NULL,NULL),(2,11,'39.105.146.131','22','root','VuoG0h3uSmkMOM1S',0,1,NULL,NULL,NULL),(3,5,'123.57.43.63','22','root','VuoG0h3uSmP#we0#',0,1,NULL,NULL,NULL),(4,8,'47.115.112.82','22','root','Root@qizh',0,1,NULL,NULL,NULL),(5,7,'39.104.79.242','22','root','RoShjCSyWrQ4YvSmkcJOAw=',0,1,NULL,NULL,NULL),(6,12,'120.25.240.10','22','root','ma-kTxwq904Z2e',0,1,NULL,NULL,NULL);

#
# Structure for table "fengyulou_instruct"
#

DROP TABLE IF EXISTS `fengyulou_instruct`;
CREATE TABLE `fengyulou_instruct` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `sketch` varchar(255) DEFAULT '' COMMENT '简述',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `knowledge_id` int(11) DEFAULT '0' COMMENT '知识点id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='指令表';

#
# Data for table "fengyulou_instruct"
#

INSERT INTO `fengyulou_instruct` VALUES (1,'asdfsa','一款电脑操作系统',0,1,'2020-05-27 18:57:56','2020-05-27 18:59:55',NULL,0);

#
# Structure for table "fengyulou_knowledge"
#

DROP TABLE IF EXISTS `fengyulou_knowledge`;
CREATE TABLE `fengyulou_knowledge` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `sketch` varchar(255) DEFAULT '' COMMENT '简述',
  `delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `insert_time` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='知识表';

#
# Data for table "fengyulou_knowledge"
#

INSERT INTO `fengyulou_knowledge` VALUES (1,'Linux','一款电脑操作系统',0,1,'2020-05-27 18:56:15',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='人员表';

#
# Data for table "fengyulou_member"
#

INSERT INTO `fengyulou_member` VALUES (1,'郭超',1,'',0,1,NULL,NULL,NULL),(2,'赵威',1,'',0,1,NULL,NULL,NULL),(3,'印明宇',3,'',0,1,NULL,NULL,NULL),(4,'里斯',4,'',0,3,NULL,NULL,NULL),(5,'张三',4,'',0,3,NULL,NULL,NULL),(6,'里斯1',5,'',0,4,NULL,NULL,NULL),(7,'里斯',5,'',0,4,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='人员标签表';

#
# Data for table "fengyulou_member_label"
#

INSERT INTO `fengyulou_member_label` VALUES (1,'java',0,1,NULL,NULL,NULL),(2,'ios',0,1,NULL,NULL,NULL),(3,'前端',0,1,NULL,NULL,NULL),(4,'Java',0,3,NULL,NULL,NULL),(5,'Java',0,4,NULL,NULL,NULL);

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
  `insert_time_copy` datetime DEFAULT NULL COMMENT '插入时间',
  `update_time_copy` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_time_copy` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员监听';

#
# Data for table "fengyulou_member_monitor"
#


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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='项目表';

#
# Data for table "fengyulou_project"
#

INSERT INTO `fengyulou_project` VALUES (1,'中交二航院',0,1,NULL,NULL,NULL),(2,'新奥大学',0,1,NULL,NULL,NULL),(3,'纳爱斯',0,1,NULL,NULL,NULL),(4,'中油瑞飞',0,1,NULL,NULL,NULL),(5,'内训宝CRM',0,1,NULL,NULL,NULL),(6,'内训宝SAAS产品',0,1,NULL,NULL,NULL),(7,'诚和敬',0,1,NULL,NULL,NULL),(8,'奇正软件',0,1,NULL,NULL,NULL),(9,'和英',0,1,NULL,NULL,NULL),(10,'dddaaa',1,1,NULL,NULL,NULL),(11,'内训宝官网',0,1,NULL,NULL,NULL),(12,'玄武',0,1,NULL,NULL,NULL),(13,'123',0,1,'2020-05-27 12:46:12',NULL,NULL),(14,'1111',0,1,'2020-05-27 12:56:18',NULL,NULL),(15,'2222',0,1,'2020-05-27 12:56:26',NULL,NULL),(16,'12322222',0,1,'2020-05-27 12:57:21',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='任务表';

#
# Data for table "fengyulou_task"
#

INSERT INTO `fengyulou_task` VALUES (1,2,'培训基地-标签管理-增加Excel批量导入',2,1,'2020-04-29',2,0,1,NULL,NULL,NULL),(2,3,'后台保存、修改，操作成功后，返回原页面',4,1,'2020-04-30',1,0,1,NULL,NULL,NULL),(3,1,'修改苏秦发的bug文档',1,1,'2020-04-22',1,0,1,NULL,NULL,NULL),(4,1,'视频播放可以快进，需要定义为不能快进',1,1,'2020-04-22',1,0,1,NULL,NULL,NULL),(5,1,'帮助中心功能开发',2,1,'2020-04-22',2,0,1,NULL,NULL,NULL),(6,4,'使用新版系统替换线上旧版系统',5,1,'2020-04-28',2,0,1,NULL,NULL,NULL),(7,3,'后台-课程列表-部门课程分配-岗位分配-查询问题修改',1,1,'2020-04-24',1,0,1,NULL,NULL,NULL),(8,3,'问题文档修改',1,1,'2020-04-24',1,0,1,NULL,NULL,NULL),(9,2,'清除线上培训基地数据',6,1,'2020-04-24',1,0,1,NULL,NULL,NULL),(10,3,'玄武用户未同步到培训问题【姓名：彭娟】【账号：S001702】【手机号：15982655067】\r\n问题原因：导购系统没有返回用户的账号【jobnumber】数据为空',1,1,'2020-04-24',1,0,1,NULL,NULL,NULL),(11,3,'手机号登录提示error【原因：按手机号和邮箱查询没有添加正常状态条件，导致查询出两条数据】',1,1,'2020-04-26',1,0,1,NULL,NULL,NULL),(12,4,'线上更新项目【更新时，项目改为上传到本地方式】',6,1,'2020-04-27',1,0,1,NULL,NULL,NULL),(13,1,'帮助中心页面样式调整',7,1,'2020-05-07',3,0,1,NULL,NULL,NULL),(14,3,'人员无法登录问题【高静13831198692】【安桂琴13933509956】查找日志查看未同步成功的原因【2020年4月21日导入的】\r\n2020-04-21 10:30:33  安桂琴\r\n2020-04-21 10:45:00  高静',1,0,NULL,1,1,1,NULL,NULL,NULL),(15,3,'跟导购系统进行全员同步，解决之前用户没有同步成功问题',1,1,'2020-04-27',1,0,1,NULL,NULL,NULL),(16,3,'PC、H5登录增加查询导购系统用户功能，防止同步失败用户无法登录问题',1,1,'2020-04-28',1,0,1,NULL,NULL,NULL),(17,3,'完成试卷，得分为总分60%以下赠送0积分，总分数的60-80%赠送1积分，总分数的80-100%赠送2积分',1,1,'2020-04-28',1,0,1,NULL,NULL,NULL),(18,4,'IOSAPP嵌套H5页面，课程列表页面点击课程没有反应问题修改    原因：IOS端APP <web-view>有target点击无法跳转',1,1,'2020-04-30',1,0,1,NULL,NULL,NULL),(19,3,'【卢慧生】纳爱斯录播课程列表分配课程问题修改',1,1,'2020-05-07',1,0,1,NULL,NULL,NULL),(20,1,'【苏勤】中交而航院只要是视频就不可以进行进度条拖动',7,0,NULL,1,1,1,NULL,NULL,NULL),(21,5,'【苏勤】CRM相同机会可以重复添加问题修改',1,1,'2020-05-11',1,0,1,NULL,NULL,NULL),(22,6,'公司管理的想法\r\n1.添加公司有点费事，需要创建角色，创建管理员      增加公司角色默认模板  ，默认创建管理员     创建多个公司时费劲 ，增加Excel批量导入功能  同事使用默认模板和创建管理员',8,1,'2020-05-07',1,0,1,NULL,NULL,NULL),(23,6,'【卢慧生】试题列表、试卷组题添加选择试题列表，增加按岗位分类查询功能',8,0,NULL,3,1,1,NULL,NULL,NULL),(24,6,'【卢慧生】试题列表、试卷组题添加选择试题列表，增加按岗位分类查询功能',1,0,NULL,3,1,1,NULL,NULL,NULL),(25,6,'【卢慧生】试题列表、试卷组题添加选择试题列表，增加按岗位分类查询功能',4,0,NULL,3,1,1,NULL,NULL,NULL),(26,3,'【卢慧生】试题列表、试卷组题添加选择试题列表，增加按岗位分类查询功能',4,1,'2020-05-08',2,0,1,NULL,NULL,NULL),(27,7,'检查赵威写的功能',9,1,'2020-05-09',1,0,1,NULL,NULL,NULL),(28,4,'增加密码复杂度功能',4,1,'2020-05-09',2,0,1,NULL,NULL,NULL),(29,4,'增加公司默认角色功能',2,1,'2020-05-07',1,0,1,NULL,NULL,NULL),(30,4,'通过Excel导入的用户无法登录',1,1,'2020-05-12',1,0,1,NULL,NULL,NULL),(31,1,'更新帮助中心功能和修改的问题',10,1,'2020-05-08',1,0,1,NULL,NULL,NULL),(32,8,'部署3.2项目',11,1,'2020-05-08',1,0,1,NULL,NULL,NULL),(33,7,'更新项目',10,0,NULL,1,1,1,NULL,NULL,NULL),(34,3,'【卢慧生】试题列表、试卷组题添加选择试题列表，增加按岗位分类查询功能',10,1,'2020-05-09',1,0,1,NULL,NULL,NULL),(35,9,'微信群客户问题解答',12,1,'2020-05-09',1,0,1,NULL,NULL,NULL),(36,9,'增加密码复杂度功能【2020-5-11】更新',10,1,'2020-05-09',1,0,1,NULL,NULL,NULL),(37,3,'纳爱斯问题修改，看卢慧生微信聊天记录',1,1,'2020-05-11',1,0,1,NULL,NULL,NULL),(38,4,'更新中油瑞飞项目',10,1,'2020-05-12',1,0,1,NULL,NULL,NULL),(39,1,'中交问题修改，看苏勤微信聊天记录',1,1,'2020-05-12',1,0,1,NULL,NULL,NULL),(40,9,'1231231',11,0,NULL,3,1,1,NULL,NULL,NULL),(41,9,'1231231',12,0,NULL,3,1,1,NULL,NULL,NULL),(42,9,'123123',12,0,NULL,3,1,1,NULL,NULL,NULL),(43,9,'aaaaa',12,0,NULL,3,1,1,NULL,NULL,NULL),(44,9,'aaaaadddd',12,0,NULL,3,1,1,NULL,NULL,NULL),(45,9,'bbbbb',12,0,NULL,3,1,1,NULL,NULL,NULL),(46,9,'cccccccaaaa',12,0,NULL,3,1,1,NULL,NULL,NULL),(47,5,'CRM添加机会问题',1,1,'2020-05-13',1,0,1,NULL,NULL,NULL),(48,3,'测试站测试纳爱斯做完试卷获得积分',13,1,'2020-05-12',1,0,1,NULL,NULL,NULL),(49,1,'中交百度编辑器上传图片问题',1,1,'2020-05-12',1,0,1,NULL,NULL,NULL),(50,4,'清除数据',6,1,'2020-05-12',1,0,1,NULL,NULL,NULL),(51,4,'增加密码强度验证',2,1,'2020-05-13',1,0,1,NULL,NULL,NULL),(52,4,'H5页面样式调整',4,1,'2020-05-14',1,0,1,NULL,NULL,NULL),(53,5,'机会列表意见反馈浏览体验优化',14,1,'2020-05-13',1,0,1,NULL,NULL,NULL),(54,4,'课程列表增加下拉翻页功能',2,1,'2020-05-14',1,0,1,NULL,NULL,NULL),(55,4,'增加登录强制修改密码功能',2,1,'2020-05-18',1,0,1,NULL,NULL,NULL),(56,4,'我的任务列表增加下拉翻页功能',2,0,NULL,1,0,1,NULL,'2020-05-27 15:06:36',NULL),(57,4,'对接OA用户、部门数据',15,1,'2020-05-25',1,0,1,NULL,NULL,NULL),(58,3,'优化岗位课程分配功能→批量分配→勾选父级同时勾选子级',4,0,NULL,1,1,1,NULL,NULL,NULL),(59,4,'Excel批量导入用户问题（用户积分表未添加数据）',1,1,'2020-05-18',1,0,1,NULL,NULL,NULL),(60,4,'首页广告图片不显示',1,1,'2020-05-19',1,0,1,NULL,NULL,NULL),(61,4,'批量导入用户页面，修改默认密码',4,1,'2020-05-18',1,0,1,NULL,NULL,NULL),(62,9,'1.你好，请问这个【已完成的任务】，能否把显示的排序改为，最新的在最上边。\r\n2.最新的在最下面，同学想翻最近的任务来重看很不方便。\r\n3.以及有个关于美观的建议，这个【截止时间】的显示，能不能完整地断句：2019-12-28（不要把12月截开，看起来以为是2月28）',15,1,'2020-05-27',2,0,1,NULL,'2020-05-25 17:09:28',NULL),(63,12,'部署玄武项目',11,1,'2020-05-19',1,0,1,NULL,NULL,NULL),(64,3,'更新纳爱斯项目',10,1,'2020-05-27',1,0,1,'2020-05-25 17:07:48',NULL,NULL),(65,9,'2020-5-27更新和英项目',10,0,NULL,1,0,1,'2020-05-25 17:08:04','2020-05-27 18:52:02',NULL),(66,9,'1.你好，请问这个【已完成的任务】，能否把显示的排序改为，最新的在最上边。\r\n2.最新的在最下面，同学想翻最近的任务来重看很不方便。\r\n3.以及有个关于美观的建议，这个【截止时间】的显示，能不能完整地断句：2019-12-28（不要把12月截开，看起来以为是2月28）',4,0,NULL,2,1,1,'2020-05-25 17:09:34',NULL,'2020-05-27 15:06:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='任务标签表';

#
# Data for table "fengyulou_task_label"
#

INSERT INTO `fengyulou_task_label` VALUES (1,'问题',0,1,NULL,NULL,NULL),(2,'新功能',0,1,NULL,NULL,NULL),(3,'java',0,1,NULL,NULL,NULL),(4,'优化',0,1,NULL,NULL,NULL),(5,'系统升级',0,1,NULL,NULL,NULL),(6,'清空数据',0,1,NULL,NULL,NULL),(7,'调整',0,1,NULL,NULL,NULL),(8,'想法',0,1,NULL,NULL,NULL),(9,'代码检查',0,1,NULL,NULL,NULL),(10,'项目更新',0,1,NULL,NULL,NULL),(11,'部署项目',0,1,NULL,NULL,NULL),(12,'问题解答',0,1,NULL,NULL,NULL),(13,'功能测试',0,1,NULL,NULL,NULL),(14,'体验优化',0,1,NULL,NULL,NULL),(15,'接口对接',0,1,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "fengyulou_user"
#

INSERT INTO `fengyulou_user` VALUES (1,'郭超','D19BE809FA02E18DB9A34E905F08AB84','郭超',0,1,NULL,NULL,NULL),(3,'练练','D19BE809FA02E18DB9A34E905F08AB84','练练',0,0,NULL,NULL,NULL),(4,'红红','D19BE809FA02E18DB9A34E905F08AB84','红红',0,0,NULL,NULL,NULL);
