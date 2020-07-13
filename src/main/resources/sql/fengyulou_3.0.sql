# Host: localhost  (Version 5.7.27-log)
# Date: 2020-07-14 01:34:39
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
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='云服务器表';

#
# Data for table "fengyulou_computer"
#

INSERT INTO `fengyulou_computer` VALUES (1,22,'123','22','root','123',0,1,'2020-07-14 01:18:06',NULL,NULL,''),(2,19,'123','22','root','123',0,1,'2020-07-14 01:20:17',NULL,NULL,''),(3,19,'123','22','root','123',0,1,'2020-07-14 01:21:14','2020-07-14 01:33:14',NULL,'123123123');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='指令表';

#
# Data for table "fengyulou_instruct"
#

INSERT INTO `fengyulou_instruct` VALUES (1,'android:background','通过设置布局管理器地android:background属性，可以为窗体设置背景图片',0,1,'2020-05-27 23:38:44',NULL,NULL,1),(2,'android:loyout_gravity=\"center\"','使用 android:loyout_gravity=\"center\" 可以让该组件在帧布局中居中显示',0,1,'2020-05-27 23:41:52',NULL,NULL,1),(3,'android:textSize','属性用于设置字体大小',0,1,'2020-05-27 23:42:34',NULL,NULL,1),(4,'android:textColor','android:textColor 属性用于设置文字地颜色',0,1,'2020-05-27 23:43:02',NULL,NULL,1),(5,'XML属性：android:background    方法：setBackgroundResource(int)','设置背景，其属性值为 Drawable 资源或者颜色值',0,1,'2020-05-28 00:14:22',NULL,NULL,1),(6,'RelativeLayout','相对布局管理器：通过相对定位的方式来控制组件的摆放位置',0,1,'2020-05-28 00:44:20',NULL,NULL,1),(7,'LinearLayout','线性布局管理器：是指在垂直或水平方向上依次摆放组件',0,1,'2020-05-28 00:45:07',NULL,NULL,1),(8,'FrameLayout','帧布局管理器：没有任何定位方式，默认情况下，所有的组件都会摆放在容器的左上角，逐个覆盖',0,1,'2020-05-28 00:46:01',NULL,NULL,1),(9,'TableLayout','表格布局管理器：使用表格的方式按行、列来摆放组件',0,1,'2020-05-28 00:46:32',NULL,NULL,1),(10,'AbsoluteLayout','绝对布局管理器：通过绝对定位（x、y坐标）的方式来控制组件的摆放位置',0,1,'2020-05-28 00:47:19',NULL,NULL,1),(11,'GridLayout','网格布局管理器：通过它可以实现跨行或列摆放组件',0,1,'2020-05-28 00:47:57',NULL,NULL,1),(12,'android:gravity','用于设置布局管理器中各子组件的对齐方式',0,1,'2020-05-28 00:49:45',NULL,NULL,1),(13,'android:ignoreGravity','用于指定哪个组件不受gravity属性的影响',0,1,'2020-05-28 00:50:47',NULL,NULL,1),(14,'ViewGroup.LayoutParams','ViewGroup.LayoutParams类封装了布局的位置、高和宽等信息',0,1,'2020-05-28 00:53:29',NULL,NULL,1),(15,'android:layout_above','其属性值为其他UI组件的ID属性，用于指定该组件位于哪个组件的上方',0,1,'2020-05-28 00:54:31',NULL,NULL,1),(16,'android:layout_alignBottom','其属性值为其他UI组件的ID属性，用于指定该组件与哪个组件的下边界对齐',0,1,'2020-05-28 00:55:44',NULL,NULL,1),(17,'android:layout_alignLeft','其属性值为其他UI组件的ID属性，用于指定该组件与哪个组件的左边界对齐',0,1,'2020-05-28 00:56:39',NULL,NULL,1),(18,'android:layout_alignParentBottom','其属性值为boolean值，用于指定该组件是否与布局管理器底端对齐',0,1,'2020-05-28 00:57:57',NULL,NULL,1),(19,'android:layout_alignParentLeft','其属性值为boolean值，用于指定该组件是否与布局管理器左边对齐',0,1,'2020-05-28 00:59:40',NULL,NULL,1),(20,'android:layout_alignParentRight','其属性职位boolean值，用于指定该组件是否与布局管理器右边对齐',0,1,'2020-05-28 01:01:03',NULL,NULL,1),(21,'android:layout_alignParentTop','其属性职位boolean值，用于指定该组件是否与布局管理器顶端对齐',0,1,'2020-05-28 01:01:26',NULL,NULL,1),(22,'android:layout_alignRight','其属性值为其他UI组件的ID属性，用于指定该组件与哪个组件的右边界对齐',0,1,'2020-05-28 01:02:30','2020-05-28 01:03:24',NULL,1),(23,'android:layout_alignTop','其属性值为其他UI组件的ID属性，用于指定该组件与哪个组件的上边界对齐',0,1,'2020-05-28 01:03:14',NULL,NULL,1),(24,'android:layout_below','其属性值为其他UI组件的ID属性，用于指定该组件与哪个组件的下方',0,1,'2020-05-28 01:03:56',NULL,NULL,1),(25,'android:layout_centerHorizontal','其属性值为boolean值，用于指定该组件是否位于布局管理器水平居中的位置',0,1,'2020-05-28 01:04:50',NULL,NULL,1),(26,'android:layout_centerInParent','其属性值为boolean值，用于指定该组件是否位于布局管理器的中央位置',0,1,'2020-05-28 01:05:29',NULL,NULL,1),(27,'android:layout_centerVertical','其属性值为boolean值，用于指定该组件是否位于布局管理器垂直居中的位置',0,1,'2020-05-28 01:06:08',NULL,NULL,1),(28,'android:layout_toLeftOf','其属性值为其他UI组件的ID属性，用于指定该组件位于哪个组件的左侧',0,1,'2020-05-28 01:06:59',NULL,NULL,1),(29,'android:layout_toRightOf','其属性值为其他UI组件的ID属性，用于指定该组件位于哪个组件的右侧',0,1,'2020-05-28 01:07:48',NULL,NULL,1),(30,'线性布局管理器','在线性布局管理器中，排列方式由 android:orientation 属性来控制，对齐方式由 android:gravity 属性来控制。',0,1,'2020-05-28 23:24:26','2020-05-28 23:26:05',NULL,1),(31,'android:orientation','用于设布局管理器内组件的排列方式。horizontal 表示水平排列，bertical 表示垂直排列。默认值：vertical',0,1,'2020-05-28 23:34:19','2020-05-28 23:53:51',NULL,1),(32,'android:layout_width','用于设置该组件的基本宽度',0,1,'2020-05-28 23:40:26','2020-05-28 23:52:21',NULL,1),(33,'android:layout_height','用于设置该组件的基本高度',0,1,'2020-05-28 23:43:01','2020-05-28 23:52:14',NULL,1),(34,'android:id','用于为当前布局管理器指定一个 ID 属性，在 Java 代码中可以应用该属性单独引用这个布局管理器。',0,1,'2020-05-28 23:45:21','2020-05-28 23:51:47',NULL,1),(35,'android:layout_gravity','用于设置组件在其父容器中的位置',0,1,'2020-05-28 23:50:29',NULL,NULL,1),(36,'android:layout_weight','用于设置组件所占的权重，即用于设置组件占父容器剩余空间的比例。',0,1,'2020-05-28 23:51:30',NULL,NULL,1),(37,'android:foreground','设置该该帧布局管理器的前景图像',0,1,'2020-05-29 00:12:19',NULL,NULL,1),(38,'android:foregroundGravity','定义绘制前景图像的 gravity 属性，即前景图像显示的位置',0,1,'2020-05-29 00:12:56',NULL,NULL,1),(39,'android:collapseColumns','设置需要被隐藏列的列序号（序号从0开始），多个列序号之间用逗号 “,” 分隔',0,1,'2020-05-29 00:28:45',NULL,NULL,1),(40,'android:shrinkColumns','设置允许被收缩的列序号（序号从0开始），多个列序号之间用逗号 “,” 分隔',0,1,'2020-05-29 00:29:42',NULL,NULL,1),(41,'android:stretchColumns','设置允许被拉伸的列序号（序号从0开始），多个列序号之间用逗号 “,” 分隔',0,1,'2020-05-29 00:30:15',NULL,NULL,1),(42,'android:columnCount','用于指定网格的最大列数',0,1,'2020-05-29 00:58:50',NULL,NULL,1),(43,'android:rowCount','用于指定网格的最大行数',0,1,'2020-05-29 01:01:13',NULL,NULL,1),(44,'android:usrDefaultMargins','用于指定是否使用默认间距，true 表示使用，false 表示不使用',0,1,'2020-05-29 01:02:07',NULL,NULL,1),(45,'android:alignmentMode','用于指定该布局管理器采用的对齐方式，alignBounds 表示对齐边界；alignMargins 表示对齐边距，默认值为alignMargins',0,1,'2020-05-29 01:04:47',NULL,NULL,1),(46,'android:rowOrderPreserved','用于设置行边距显示的顺序和索引的顺序是否相同，true 表示相同，false 表示不相同',0,1,'2020-05-29 01:06:11','2020-05-29 01:07:31',NULL,1),(47,'android:columnOrderPreserved','用于设置列边界显示的顺序和索引的顺序是否相同，true 表示相同，false 表示不相同',0,1,'2020-05-29 01:07:14','2020-05-29 01:08:00',NULL,1),(48,'android:layout_column','用于指定该子组件位于网格的第几列',0,1,'2020-05-29 01:08:44','2020-05-29 01:10:41',NULL,1),(49,'android:layout_columnSpan','用于指定该子组件横向跨几列（索引从0开始）',0,1,'2020-05-29 01:08:57','2020-05-29 01:11:16',NULL,1),(50,'android:layout_columnWeight','用于指定该子组件在水平方向上的权重。',0,1,'2020-05-29 01:09:10','2020-05-29 01:11:51',NULL,1),(51,'android:layout_row','用于指定该子组件位于网格的第几行（索引从0开始）',0,1,'2020-05-29 01:09:53','2020-05-29 01:12:17',NULL,1),(52,'android:layout_rowSpan','用于指定该子组件纵向跨几行',0,1,'2020-05-29 01:10:06','2020-05-29 01:12:46',NULL,1),(53,'android:layout_rowWeight','用于指定该子组件在垂直方向上的权重',0,1,'2020-05-29 01:10:17','2020-05-29 01:13:21',NULL,1),(54,'android:autoLink','用于指定是否将指定格式的文本转换为可单击的超链接形式',0,1,'2020-05-30 00:23:13',NULL,NULL,1),(55,'android:drawableBotton','用于在文本框内文本的底部绘制指定图像',0,1,'2020-05-30 00:24:05',NULL,NULL,1),(56,'android:drawableLeft','用于在文本框文本的左侧绘制指定图像',0,1,'2020-05-30 00:24:45','2020-05-30 00:26:50',NULL,1),(57,'android:drawableStart','在 Android 4.2 中新增的属性，用于在文本框内文本的左侧绘制指定图像',0,1,'2020-05-30 00:25:43','2020-05-30 00:26:45',NULL,1),(58,'android:drawableRight','用于在文本框内文本的右侧绘制指定图像',0,1,'2020-05-30 00:26:34','2020-05-30 00:26:41',NULL,1),(59,'android:drawableEnd','在 Android 4.2 中新增的属性，用于在文本框内文本的右侧绘制指定图像',0,1,'2020-05-30 00:27:36','2020-05-30 00:29:29',NULL,1),(60,'android:drawableTop','用于在文本框内文本的顶部绘制指定图像',0,1,'2020-05-30 00:28:08','2020-05-30 00:29:24',NULL,1),(61,'android:hint','用于设置当文本框中文本内容为空时，默认显示的提示文本',0,1,'2020-05-30 00:29:20',NULL,NULL,1),(62,'android:inputType','用于指定当前文本框显示内容的文本类型',0,1,'2020-05-30 00:30:25',NULL,NULL,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='知识表';

#
# Data for table "fengyulou_knowledge"
#

INSERT INTO `fengyulou_knowledge` VALUES (1,'Android','安卓开发',0,1,'2020-05-27 23:38:41',NULL,NULL),(2,'Linux','一款操作系统',0,1,'2020-05-29 22:15:46',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='人员表';

#
# Data for table "fengyulou_member"
#

INSERT INTO `fengyulou_member` VALUES (1,'123',1,'123',0,1,'2020-07-09 22:36:27',NULL,NULL),(2,'1',1,'',0,1,'2020-07-10 00:37:27',NULL,NULL),(3,'2',1,'',0,1,'2020-07-10 00:37:32',NULL,NULL),(4,'3',1,'',0,1,'2020-07-10 00:37:34',NULL,NULL),(5,'4',1,'',0,1,'2020-07-10 00:37:35',NULL,NULL),(6,'5',1,'',0,1,'2020-07-10 00:37:37',NULL,NULL),(7,'6',1,'',0,1,'2020-07-10 00:37:38',NULL,NULL),(8,'7',1,'',0,1,'2020-07-10 00:37:40',NULL,NULL),(9,'8',1,'',0,1,'2020-07-10 00:37:43',NULL,NULL),(10,'9',1,'',0,1,'2020-07-10 00:37:45',NULL,NULL),(11,'0',1,'',0,1,'2020-07-10 00:37:47',NULL,NULL),(12,'1234',1,'1234',0,1,'2020-07-14 00:10:45',NULL,NULL),(13,'34234444111',1,'123423',0,1,'2020-07-14 00:12:34',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='人员标签表';

#
# Data for table "fengyulou_member_label"
#

INSERT INTO `fengyulou_member_label` VALUES (1,'123',0,1,'2020-07-09 22:36:26',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='项目表';

#
# Data for table "fengyulou_project"
#

INSERT INTO `fengyulou_project` VALUES (1,'123',0,1,'2020-07-09 22:36:17',NULL,NULL),(2,'1234',0,1,'2020-07-09 23:27:27',NULL,NULL),(3,'12341234',0,1,'2020-07-09 23:27:37',NULL,NULL),(4,'qqwre',0,1,'2020-07-09 23:27:40',NULL,NULL),(5,'asdfa',0,1,'2020-07-09 23:27:43',NULL,NULL),(6,'xzccxz',0,1,'2020-07-09 23:27:46',NULL,NULL),(7,'42342',0,1,'2020-07-09 23:27:49',NULL,NULL),(8,'345345',0,1,'2020-07-09 23:27:54',NULL,NULL),(9,'66',0,1,'2020-07-09 23:28:00',NULL,NULL),(10,'77',0,1,'2020-07-09 23:28:02',NULL,NULL),(11,'88',0,1,'2020-07-09 23:28:06',NULL,NULL),(12,'99',0,1,'2020-07-09 23:28:08',NULL,NULL),(13,'00',0,1,'2020-07-09 23:28:11',NULL,NULL),(14,'1',0,1,'2020-07-09 23:28:13',NULL,NULL),(15,'2',0,1,'2020-07-09 23:28:15',NULL,NULL),(16,'3',0,1,'2020-07-09 23:28:18',NULL,NULL),(17,'4',0,1,'2020-07-09 23:28:21',NULL,NULL),(18,'5',0,1,'2020-07-09 23:28:24',NULL,NULL),(19,'6',0,1,'2020-07-09 23:28:26',NULL,NULL),(20,'7',0,1,'2020-07-09 23:28:29',NULL,NULL),(21,'8',0,1,'2020-07-09 23:28:32',NULL,NULL),(22,'9',0,1,'2020-07-09 23:28:34',NULL,NULL);

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
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='任务表';

#
# Data for table "fengyulou_task"
#

INSERT INTO `fengyulou_task` VALUES (1,1,'123',1,1,'2020-07-09',1,0,1,'2020-07-09 22:36:37',NULL,NULL,NULL,NULL),(2,1,'123',1,0,NULL,1,0,1,'2020-07-09 22:37:40',NULL,NULL,NULL,NULL),(3,1,'2134123123123123123123435345234523453245324534532453245324532421341',1,0,NULL,1,0,1,'2020-07-09 22:37:47','2020-07-09 23:32:10',NULL,'2020-07-09 03:00:00',NULL),(4,1,'123123',1,0,NULL,1,0,1,'2020-07-09 23:10:10',NULL,NULL,NULL,NULL),(5,1,'1234234',1,0,NULL,1,0,1,'2020-07-09 23:10:32',NULL,NULL,NULL,NULL),(6,1,'12312312',1,0,NULL,1,0,1,'2020-07-09 23:11:14',NULL,NULL,NULL,NULL),(7,1,'12312312',1,0,NULL,1,0,1,'2020-07-09 23:11:19',NULL,NULL,NULL,NULL),(8,1,'1231',1,0,NULL,1,0,1,'2020-07-09 23:11:29',NULL,NULL,NULL,NULL),(9,1,'123123',1,0,NULL,1,0,1,'2020-07-09 23:16:40',NULL,NULL,NULL,NULL),(10,1,'123123',1,0,NULL,1,0,1,'2020-07-09 23:16:45',NULL,NULL,NULL,NULL),(11,1,'123123',1,0,NULL,1,0,1,'2020-07-09 23:16:50',NULL,NULL,NULL,NULL),(12,1,'123123',1,0,NULL,1,0,1,'2020-07-09 23:22:01',NULL,NULL,NULL,NULL),(13,22,'啊啊啊啊啊',18,1,'2020-07-13',7,0,1,'2020-07-13 22:04:11','2020-07-13 22:55:13',NULL,'2020-07-13 22:04:06','2020-07-31 00:00:00'),(14,22,'111111111111111',20,0,NULL,9,0,1,'2020-07-14 00:11:44',NULL,NULL,'2020-07-14 00:11:38','2020-07-14 00:11:40'),(15,22,'1231',20,0,NULL,9,0,1,'2020-07-14 01:18:49',NULL,NULL,'2020-07-14 01:18:44','2020-07-31 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='任务标签表';

#
# Data for table "fengyulou_task_label"
#

INSERT INTO `fengyulou_task_label` VALUES (1,'123',0,1,'2020-07-09 22:36:19',NULL,NULL),(2,'1',0,1,'2020-07-09 23:28:54',NULL,NULL),(3,'2',0,1,'2020-07-09 23:28:55',NULL,NULL),(4,'3',0,1,'2020-07-09 23:28:57',NULL,NULL),(5,'4',0,1,'2020-07-09 23:29:00',NULL,NULL),(6,'5',0,1,'2020-07-09 23:29:03',NULL,NULL),(7,'6',0,1,'2020-07-09 23:29:05',NULL,NULL),(8,'7',0,1,'2020-07-09 23:29:07',NULL,NULL),(9,'8',0,1,'2020-07-09 23:29:08',NULL,NULL),(10,'9',0,1,'2020-07-09 23:29:12',NULL,NULL),(11,'0',0,1,'2020-07-09 23:29:15',NULL,NULL),(12,'11',0,1,'2020-07-09 23:29:17',NULL,NULL),(13,'12',0,1,'2020-07-09 23:29:19',NULL,NULL),(14,'13',0,1,'2020-07-09 23:29:21',NULL,NULL),(15,'14',0,1,'2020-07-09 23:29:24',NULL,NULL),(16,'15',0,1,'2020-07-09 23:29:25',NULL,NULL),(17,'16',0,1,'2020-07-09 23:29:31',NULL,NULL),(18,'17',0,1,'2020-07-09 23:29:33',NULL,NULL),(19,'18',0,1,'2020-07-09 23:29:35',NULL,NULL),(20,'19',0,1,'2020-07-09 23:29:38',NULL,NULL),(21,'20',0,1,'2020-07-09 23:29:43',NULL,NULL),(22,'21',0,1,'2020-07-09 23:29:45',NULL,NULL),(23,'22',0,1,'2020-07-09 23:29:47',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Data for table "fengyulou_user"
#

INSERT INTO `fengyulou_user` VALUES (1,'郭超','D19BE809FA02E18DB9A34E905F08AB84','郭超',0,1,NULL,NULL,NULL);
