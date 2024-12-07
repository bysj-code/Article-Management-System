/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssmuou1v
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmuou1v` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmuou1v`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701563676 DEFAULT CHARSET=utf8 COMMENT='客服';

/*Data for the table `chat` */

insert  into `chat`(`id`,`addtime`,`userid`,`adminid`,`ask`,`reply`,`isreply`) values (51,'2021-04-06 17:29:18',1,1,'提问1','回复1',1),(52,'2021-04-06 17:29:18',2,2,'提问2','回复2',2),(53,'2021-04-06 17:29:18',3,3,'提问3','回复3',3),(54,'2021-04-06 17:29:18',4,4,'提问4','回复4',4),(55,'2021-04-06 17:29:18',5,5,'提问5','回复5',5),(56,'2021-04-06 17:29:18',6,6,'提问6','回复6',6),(1617701563675,'2021-04-06 17:32:42',1617701493559,NULL,'客服提问',NULL,1);

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssmuou1v/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssmuou1v/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssmuou1v/upload/picture3.jpg'),(6,'homepage',NULL);

/*Table structure for table `discusswenzhang` */

DROP TABLE IF EXISTS `discusswenzhang`;

CREATE TABLE `discusswenzhang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701715951 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

/*Data for the table `discusswenzhang` */

insert  into `discusswenzhang`(`id`,`addtime`,`refid`,`userid`,`nickname`,`content`,`reply`) values (81,'2021-04-06 17:29:18',1,1,'用户名1','评论内容1','回复内容1'),(82,'2021-04-06 17:29:18',2,2,'用户名2','评论内容2','回复内容2'),(83,'2021-04-06 17:29:18',3,3,'用户名3','评论内容3','回复内容3'),(84,'2021-04-06 17:29:18',4,4,'用户名4','评论内容4','回复内容4'),(85,'2021-04-06 17:29:18',5,5,'用户名5','评论内容5','回复内容5'),(86,'2021-04-06 17:29:18',6,6,'用户名6','评论内容6','回复内容6'),(1617701524612,'2021-04-06 17:32:03',31,1617701493559,'1','评论测试',''),(1617701715950,'2021-04-06 17:35:15',1617701661720,1617701493559,'1','12','');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701731199 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`addtime`,`title`,`content`,`parentid`,`userid`,`username`,`isdone`) values (61,'2021-04-06 17:29:18','帖子标题1','帖子内容1',1,1,'用户名1','开放'),(62,'2021-04-06 17:29:18','帖子标题2','帖子内容2',2,2,'用户名2','开放'),(63,'2021-04-06 17:29:18','帖子标题3','帖子内容3',3,3,'用户名3','开放'),(64,'2021-04-06 17:29:18','帖子标题4','帖子内容4',4,4,'用户名4','开放'),(65,'2021-04-06 17:29:18','帖子标题5','帖子内容5',5,5,'用户名5','开放'),(66,'2021-04-06 17:29:18','帖子标题6','帖子内容6',6,6,'用户名6','开放'),(1617701575259,'2021-04-06 17:32:55','论坛测试','XXXX',0,1617701493559,'1','开放'),(1617701687551,'2021-04-06 17:34:47',NULL,'评论测试',1617701575259,1617701620225,'12',NULL),(1617701731198,'2021-04-06 17:35:30',NULL,'回复测试',1617701687551,1617701493559,'1',NULL);

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701713696 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

insert  into `storeup`(`id`,`addtime`,`userid`,`refid`,`tablename`,`name`,`picture`) values (1617701713695,'2021-04-06 17:35:12',1617701493559,1617701661720,'wenzhang','文章发布测试','http://localhost:8080/ssmuou1v/upload/1617701654614.jpg');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1617701493559,'1','yonghu','用户','5tz79fclst7bra2sfvvntd25p784rolu','2021-04-06 17:31:38','2021-04-06 18:36:04'),(2,1617701620225,'12','zuozhe','作者','15h98zuf8o513mib306m8bao7knowpos','2021-04-06 17:33:46','2021-04-06 18:33:46');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-04-06 17:29:18');

/*Table structure for table `wenzhang` */

DROP TABLE IF EXISTS `wenzhang`;

CREATE TABLE `wenzhang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `wenzhangmingcheng` varchar(200) DEFAULT NULL COMMENT '文章名称',
  `leibie` varchar(200) DEFAULT NULL COMMENT '类别',
  `zuozhezhanghao` varchar(200) DEFAULT NULL COMMENT '作者账号',
  `zuozhexingming` varchar(200) DEFAULT NULL COMMENT '作者姓名',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `wenzhangneirong` longtext COMMENT '文章内容',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `userid` bigint(20) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701661721 DEFAULT CHARSET=utf8 COMMENT='文章';

/*Data for the table `wenzhang` */

insert  into `wenzhang`(`id`,`addtime`,`wenzhangmingcheng`,`leibie`,`zuozhezhanghao`,`zuozhexingming`,`fabushijian`,`fengmian`,`wenzhangneirong`,`thumbsupnum`,`crazilynum`,`clicktime`,`userid`) values (31,'2021-04-06 17:29:18','文章名称1','类别1','作者账号1','作者姓名1','2021-04-06 17:29:18','http://localhost:8080/ssmuou1v/upload/wenzhang_fengmian1.jpg','文章内容1',2,2,'2021-04-06 17:32:25',1),(32,'2021-04-06 17:29:18','文章名称2','类别2','作者账号2','作者姓名2','2021-04-06 17:29:18','http://localhost:8080/ssmuou1v/upload/wenzhang_fengmian2.jpg','文章内容2',2,2,'2021-04-06 17:29:18',2),(33,'2021-04-06 17:29:18','文章名称3','类别3','作者账号3','作者姓名3','2021-04-06 17:29:18','http://localhost:8080/ssmuou1v/upload/wenzhang_fengmian3.jpg','文章内容3',3,3,'2021-04-06 17:29:18',3),(34,'2021-04-06 17:29:18','文章名称4','类别4','作者账号4','作者姓名4','2021-04-06 17:29:18','http://localhost:8080/ssmuou1v/upload/wenzhang_fengmian4.jpg','文章内容4',4,4,'2021-04-06 17:29:18',4),(35,'2021-04-06 17:29:18','文章名称5','类别5','作者账号5','作者姓名5','2021-04-06 17:29:18','http://localhost:8080/ssmuou1v/upload/wenzhang_fengmian5.jpg','文章内容5',5,5,'2021-04-06 17:29:18',5),(36,'2021-04-06 17:29:18','文章名称6','类别6','作者账号6','作者姓名6','2021-04-06 17:29:18','http://localhost:8080/ssmuou1v/upload/wenzhang_fengmian6.jpg','文章内容6',6,6,'2021-04-06 17:29:18',6),(1617701661720,'2021-04-06 17:34:21','文章发布测试','类别5','12','12','2021-04-06 17:33:50','http://localhost:8080/ssmuou1v/upload/1617701654614.jpg','文章内容测试',1,1,'2021-04-06 17:35:18',1617701620225);

/*Table structure for table `wenzhangfenlei` */

DROP TABLE IF EXISTS `wenzhangfenlei`;

CREATE TABLE `wenzhangfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leibie` varchar(200) DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='文章分类';

/*Data for the table `wenzhangfenlei` */

insert  into `wenzhangfenlei`(`id`,`addtime`,`leibie`) values (41,'2021-04-06 17:29:18','类别1'),(42,'2021-04-06 17:29:18','类别2'),(43,'2021-04-06 17:29:18','类别3'),(44,'2021-04-06 17:29:18','类别4'),(45,'2021-04-06 17:29:18','类别5'),(46,'2021-04-06 17:29:18','类别6');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) NOT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) NOT NULL COMMENT '身份证',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701493560 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`yonghuzhanghao`,`mima`,`yonghuxingming`,`xingbie`,`shouji`,`youxiang`,`shenfenzheng`,`zhaopian`) values (11,'2021-04-06 17:29:18','用户1','123456','用户姓名1','男','13823888881','773890001@qq.com','440300199101010001','http://localhost:8080/ssmuou1v/upload/yonghu_zhaopian1.jpg'),(12,'2021-04-06 17:29:18','用户2','123456','用户姓名2','男','13823888882','773890002@qq.com','440300199202020002','http://localhost:8080/ssmuou1v/upload/yonghu_zhaopian2.jpg'),(13,'2021-04-06 17:29:18','用户3','123456','用户姓名3','男','13823888883','773890003@qq.com','440300199303030003','http://localhost:8080/ssmuou1v/upload/yonghu_zhaopian3.jpg'),(14,'2021-04-06 17:29:18','用户4','123456','用户姓名4','男','13823888884','773890004@qq.com','440300199404040004','http://localhost:8080/ssmuou1v/upload/yonghu_zhaopian4.jpg'),(15,'2021-04-06 17:29:18','用户5','123456','用户姓名5','男','13823888885','773890005@qq.com','440300199505050005','http://localhost:8080/ssmuou1v/upload/yonghu_zhaopian5.jpg'),(16,'2021-04-06 17:29:18','用户6','123456','用户姓名6','男','13823888886','773890006@qq.com','440300199606060006','http://localhost:8080/ssmuou1v/upload/yonghu_zhaopian6.jpg'),(1617701493559,'2021-04-06 17:31:33','1','1','1','女','12345678900',NULL,'440582199905125833',NULL);

/*Table structure for table `zuozhe` */

DROP TABLE IF EXISTS `zuozhe`;

CREATE TABLE `zuozhe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zuozhezhanghao` varchar(200) NOT NULL COMMENT '作者账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `zuozhexingming` varchar(200) DEFAULT NULL COMMENT '作者姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) NOT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shenfenzheng` varchar(200) NOT NULL COMMENT '身份证',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zuozhezhanghao` (`zuozhezhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1617701620226 DEFAULT CHARSET=utf8 COMMENT='作者';

/*Data for the table `zuozhe` */

insert  into `zuozhe`(`id`,`addtime`,`zuozhezhanghao`,`mima`,`zuozhexingming`,`xingbie`,`shouji`,`youxiang`,`shenfenzheng`,`zhaopian`) values (21,'2021-04-06 17:29:18','作者1','123456','作者姓名1','男','13823888881','773890001@qq.com','440300199101010001','http://localhost:8080/ssmuou1v/upload/zuozhe_zhaopian1.jpg'),(22,'2021-04-06 17:29:18','作者2','123456','作者姓名2','男','13823888882','773890002@qq.com','440300199202020002','http://localhost:8080/ssmuou1v/upload/zuozhe_zhaopian2.jpg'),(23,'2021-04-06 17:29:18','作者3','123456','作者姓名3','男','13823888883','773890003@qq.com','440300199303030003','http://localhost:8080/ssmuou1v/upload/zuozhe_zhaopian3.jpg'),(24,'2021-04-06 17:29:18','作者4','123456','作者姓名4','男','13823888884','773890004@qq.com','440300199404040004','http://localhost:8080/ssmuou1v/upload/zuozhe_zhaopian4.jpg'),(25,'2021-04-06 17:29:18','作者5','123456','作者姓名5','男','13823888885','773890005@qq.com','440300199505050005','http://localhost:8080/ssmuou1v/upload/zuozhe_zhaopian5.jpg'),(26,'2021-04-06 17:29:18','作者6','123456','作者姓名6','男','13823888886','773890006@qq.com','440300199606060006','http://localhost:8080/ssmuou1v/upload/zuozhe_zhaopian6.jpg'),(1617701620225,'2021-04-06 17:33:40','12','12','12','男','12345678900',NULL,'440582199905125833',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
