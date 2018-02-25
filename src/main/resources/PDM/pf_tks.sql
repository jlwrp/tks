/*
Navicat MySQL Data Transfer

Source Server         : MySql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : pf_tks

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-02-25 22:14:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pf_menu`
-- ----------------------------
DROP TABLE IF EXISTS `pf_menu`;
CREATE TABLE `pf_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL COMMENT '父菜单ID',
  `menuname` varchar(100) NOT NULL COMMENT '菜单名称',
  `menuicon` varchar(30) NOT NULL COMMENT '菜单图标',
  `menuurl` varchar(100) NOT NULL COMMENT '菜单的URL',
  `menuorder` int(11) NOT NULL COMMENT '菜单的显示顺序',
  `menustatus` char(1) NOT NULL COMMENT '菜单状态0-正常1-不可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单信息表';

-- ----------------------------
-- Records of pf_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `pf_operation`
-- ----------------------------
DROP TABLE IF EXISTS `pf_operation`;
CREATE TABLE `pf_operation` (
  `id` int(11) NOT NULL,
  `operation` varchar(255) NOT NULL COMMENT '操作标识',
  `odesc` varchar(255) NOT NULL COMMENT '操作描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作信息表';

-- ----------------------------
-- Records of pf_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `pf_permission`
-- ----------------------------
DROP TABLE IF EXISTS `pf_permission`;
CREATE TABLE `pf_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdesc` varchar(255) NOT NULL COMMENT '权限描述',
  `name` varchar(255) NOT NULL COMMENT '权限名称',
  `menuid` int(11) NOT NULL COMMENT 'pf_menu的主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限信息表（权限菜单关联）';

-- ----------------------------
-- Records of pf_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `pf_permission_operation`
-- ----------------------------
DROP TABLE IF EXISTS `pf_permission_operation`;
CREATE TABLE `pf_permission_operation` (
  `permissionid` int(11) NOT NULL COMMENT 'pf_permission的主键',
  `operationid` int(11) NOT NULL COMMENT 'pf_operation的主键',
  PRIMARY KEY (`permissionid`,`operationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限操作关联表';

-- ----------------------------
-- Records of pf_permission_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `pf_request_log_infos`
-- ----------------------------
DROP TABLE IF EXISTS `pf_request_log_infos`;
CREATE TABLE `pf_request_log_infos` (
  `pfid` int(11) NOT NULL AUTO_INCREMENT,
  `pfclientip` varchar(30) DEFAULT NULL COMMENT '客户端请求IP地址',
  `pfuri` varchar(100) DEFAULT NULL COMMENT '日志请求地址',
  `pftype` varchar(50) DEFAULT NULL COMMENT '终端请求方式,普通请求,ajax请求',
  `pfmethod` varchar(10) DEFAULT NULL COMMENT '请求方式method,post,get等',
  `pfparamdata` longtext COMMENT '请求参数内容,json',
  `pfsessionid` varchar(100) DEFAULT NULL COMMENT '请求接口唯一session标识',
  `pftime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '请求时间',
  `pfreturmtime` varchar(50) DEFAULT NULL COMMENT '接口返回时间',
  `pfreturndata` longtext COMMENT '接口返回数据json',
  `pfhttpstatuscode` varchar(10) DEFAULT NULL COMMENT '请求时httpStatusCode代码，如：200,400,404等',
  `pftimeconsuming` int(8) DEFAULT '0' COMMENT '请求耗时（毫秒单位）',
  PRIMARY KEY (`pfid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请求日志信息表';

-- ----------------------------
-- Records of pf_request_log_infos
-- ----------------------------

-- ----------------------------
-- Table structure for `pf_role`
-- ----------------------------
DROP TABLE IF EXISTS `pf_role`;
CREATE TABLE `pf_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) NOT NULL COMMENT '角色标识使用字母标',
  `roledescript` varchar(255) NOT NULL COMMENT '角色的描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of pf_role
-- ----------------------------
INSERT INTO `pf_role` VALUES ('1', 'ROLE_ADMIN', '超级管理员');
INSERT INTO `pf_role` VALUES ('2', 'ROLE_USER', '普通用户');
INSERT INTO `pf_role` VALUES ('3', '', '');

-- ----------------------------
-- Table structure for `pf_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `pf_role_permission`;
CREATE TABLE `pf_role_permission` (
  `id` int(11) NOT NULL,
  `roleid` int(11) NOT NULL COMMENT 'pf_role表的主键',
  `permissionid` int(11) NOT NULL COMMENT 'pf_permission表的主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

-- ----------------------------
-- Records of pf_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `pf_user`
-- ----------------------------
DROP TABLE IF EXISTS `pf_user`;
CREATE TABLE `pf_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '登录用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `state` char(1) NOT NULL COMMENT '锁定状态0-正常1-锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of pf_user
-- ----------------------------
INSERT INTO `pf_user` VALUES ('1', 'admin', '8864be9e63b31252ed8fa45b00aac894', '1');

-- ----------------------------
-- Table structure for `pf_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `pf_user_role`;
CREATE TABLE `pf_user_role` (
  `userid` int(11) NOT NULL COMMENT 'pf_user表的主键',
  `roleid` int(11) NOT NULL COMMENT 'pf_role的主键',
  PRIMARY KEY (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of pf_user_role
-- ----------------------------
INSERT INTO `pf_user_role` VALUES ('0', '0');
INSERT INTO `pf_user_role` VALUES ('1', '1');
INSERT INTO `pf_user_role` VALUES ('1', '2');
