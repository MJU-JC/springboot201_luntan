/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - luentanxitong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`luentanxitong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `luentanxitong`;

/*Table structure for table `banzhu` */

DROP TABLE IF EXISTS `banzhu`;

CREATE TABLE `banzhu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `banzhu_name` varchar(200) DEFAULT NULL COMMENT '版主姓名 Search111 ',
  `banzhu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `banzhu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `banzhu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `banzhu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='版主';

/*Data for the table `banzhu` */

insert  into `banzhu`(`id`,`username`,`password`,`banzhu_name`,`banzhu_photo`,`sex_types`,`banzhu_phone`,`banzhu_email`,`banzhu_delete`,`create_time`) values (1,'a1','123456','版主姓名1','http://localhost:8080/luentanxitong/upload/1648201262532.jpg',2,'17703786901','1@qq.com',1,'2022-03-25 17:12:27'),(2,'a2','123456','版主姓名2','http://localhost:8080/luentanxitong/upload/1648201254580.jpg',1,'17703786902','2@qq.com',1,'2022-03-25 17:12:27'),(3,'a3','123456','版主姓名3','http://localhost:8080/luentanxitong/upload/1648201247162.jpg',2,'17703786903','3@qq.com',1,'2022-03-25 17:12:27'),(4,'a4','123456','版主姓名4','http://localhost:8080/luentanxitong/upload/banzhu4.jpg',1,'17703786904','4@qq.com',2,'2022-03-25 17:12:27'),(5,'a5','123456','版主姓名5','http://localhost:8080/luentanxitong/upload/banzhu5.jpg',1,'17703786905','5@qq.com',2,'2022-03-25 17:12:27');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/luentanxitong/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/luentanxitong/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/luentanxitong/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'forum_types','帖子类型',1,'帖子类型1',NULL,NULL,'2022-03-25 17:01:26'),(2,'forum_types','帖子类型',2,'帖子类型2',NULL,NULL,'2022-03-25 17:01:26'),(3,'forum_types','帖子类型',3,'帖子类型3',NULL,NULL,'2022-03-25 17:01:26'),(4,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-03-25 17:01:26'),(5,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-03-25 17:01:26'),(6,'news_types','新闻类型',1,'新闻类型1',NULL,NULL,'2022-03-25 17:01:26'),(7,'news_types','新闻类型',2,'新闻类型2',NULL,NULL,'2022-03-25 17:01:26'),(8,'sex_types','性别类型',1,'男',NULL,NULL,'2022-03-25 17:01:26'),(9,'sex_types','性别类型',2,'女',NULL,NULL,'2022-03-25 17:01:26');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `banzhu_id` int(11) DEFAULT NULL COMMENT '版主',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_types` int(11) DEFAULT NULL COMMENT '帖子类型',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`banzhu_id`,`users_id`,`forum_content`,`super_ids`,`forum_types`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',3,NULL,NULL,'发布内容1',NULL,3,1,'2022-03-25 17:12:27','2022-03-25 17:12:27','2022-03-25 17:12:27'),(2,'帖子标题2',2,NULL,NULL,'发布内容2',NULL,1,1,'2022-03-25 17:12:27','2022-03-25 17:12:27','2022-03-25 17:12:27'),(3,'帖子标题3',1,NULL,NULL,'发布内容3',NULL,1,1,'2022-03-25 17:12:27','2022-03-25 17:12:27','2022-03-25 17:12:27'),(4,'帖子标题4',1,NULL,NULL,'发布内容4',NULL,3,1,'2022-03-25 17:12:27','2022-03-25 17:12:27','2022-03-25 17:12:27'),(5,'帖子标题5',1,NULL,NULL,'发布内容5',NULL,1,1,'2022-03-25 17:12:27','2022-03-25 17:12:27','2022-03-25 17:12:27'),(6,NULL,1,NULL,NULL,'321',5,NULL,2,'2022-03-25 17:39:02',NULL,'2022-03-25 17:39:02'),(8,NULL,NULL,1,NULL,'123',5,NULL,2,'2022-03-25 17:47:43',NULL,'2022-03-25 17:47:43');

/*Table structure for table `liuyan` */

DROP TABLE IF EXISTS `liuyan`;

CREATE TABLE `liuyan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `liuyan_name` varchar(200) DEFAULT NULL COMMENT '留言标题  Search111 ',
  `liuyan_text` text COMMENT '留言内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '留言时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='留言版';

/*Data for the table `liuyan` */

insert  into `liuyan`(`id`,`yonghu_id`,`liuyan_name`,`liuyan_text`,`insert_time`,`reply_text`,`update_time`,`create_time`) values (1,2,'留言标题1','留言内容1','2022-03-25 17:12:27','回复信息1','2022-03-25 17:12:27','2022-03-25 17:12:27'),(2,3,'留言标题2','留言内容2','2022-03-25 17:12:27','回复信息2','2022-03-25 17:12:27','2022-03-25 17:12:27'),(3,2,'留言标题3','留言内容3','2022-03-25 17:12:27','回复信息3','2022-03-25 17:12:27','2022-03-25 17:12:27'),(4,2,'留言标题4','留言内容4','2022-03-25 17:12:27','回复信息4','2022-03-25 17:12:27','2022-03-25 17:12:27'),(5,3,'留言标题5','留言内容5','2022-03-25 17:12:27','回复信息5','2022-03-25 17:12:27','2022-03-25 17:12:27');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `news_name` varchar(200) DEFAULT NULL COMMENT '新闻名称 Search111  ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '新闻图片 ',
  `news_types` int(11) NOT NULL COMMENT '新闻类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '新闻发布时间 ',
  `news_content` text COMMENT '新闻详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='新闻信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_photo`,`news_types`,`insert_time`,`news_content`,`create_time`) values (1,'新闻名称1','http://localhost:8080/luentanxitong/upload/news1.jpg',2,'2022-03-25 17:12:27','新闻详情1','2022-03-25 17:12:27'),(2,'新闻名称2','http://localhost:8080/luentanxitong/upload/news2.jpg',1,'2022-03-25 17:12:27','新闻详情2','2022-03-25 17:12:27'),(3,'新闻名称3','http://localhost:8080/luentanxitong/upload/news3.jpg',1,'2022-03-25 17:12:27','新闻详情3','2022-03-25 17:12:27'),(4,'新闻名称4','http://localhost:8080/luentanxitong/upload/news4.jpg',1,'2022-03-25 17:12:27','新闻详情4','2022-03-25 17:12:27'),(5,'新闻名称5','http://localhost:8080/luentanxitong/upload/news5.jpg',1,'2022-03-25 17:12:27','新闻详情5','2022-03-25 17:12:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'a1','yonghu','用户','bit6mgs3kmiyx4ytcmokbdobhgo74m3e','2022-03-25 17:38:08','2022-03-25 18:47:50'),(2,1,'admin','users','管理员','ene73gnexxbctomhl3gjewpjknk6pajv','2022-03-25 17:40:21','2022-03-25 18:40:21'),(3,1,'a1','banzhu','版主','kegt4bxyp0sutuhv9suxj4iaxy7dc29a','2022-03-25 17:47:09','2022-03-25 18:47:09');

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

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_email`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/luentanxitong/upload/yonghu1.jpg',2,'17703786901','1@qq.com',1,'2022-03-25 17:12:27'),(2,'a2','123456','用户姓名2','http://localhost:8080/luentanxitong/upload/yonghu2.jpg',1,'17703786902','2@qq.com',1,'2022-03-25 17:12:27'),(3,'a3','123456','用户姓名3','http://localhost:8080/luentanxitong/upload/yonghu3.jpg',1,'17703786903','3@qq.com',1,'2022-03-25 17:12:27');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
