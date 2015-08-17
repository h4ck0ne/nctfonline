/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : nctfonline

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-08-17 18:56:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for nctf_accounts
-- ----------------------------
DROP TABLE IF EXISTS `nctf_accounts`;
CREATE TABLE `nctf_accounts` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(17) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `tel` int(12) unsigned DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `avatar` varchar(200) DEFAULT '',
  `xuehao` varchar(10) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `locked` varchar(1) DEFAULT '0',
  `rightanswer` int(10) unsigned zerofill DEFAULT '0000000000',
  `lastlogin_ip` varchar(50) DEFAULT NULL,
  `register_ip` varchar(50) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_answer_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `lastlogin_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nctf_accounts
-- ----------------------------
INSERT INTO `nctf_accounts` VALUES ('1', 'ffffffffff', '85941da8d2bc954addc317a858fe851ae39959d072bd5bea8dc7f6a8a2606f56', null, 'ffffffffffffffffff@ff.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 16:33:50', null, null);
INSERT INTO `nctf_accounts` VALUES ('2', 'ctfadmin', '85941da8d2bc954addc317a858fe851ae39959d072bd5bea8dc7f6a8a2606f56', null, 'leo@leo.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 18:35:11', null, null);
INSERT INTO `nctf_accounts` VALUES ('3', 'xiao6', '970f1fb0fa9ee457f0182329419e8e7612582177fbf306bc70f0a13001cde988', null, 'oaao@xx.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 16:45:27', null, null);
INSERT INTO `nctf_accounts` VALUES ('4', 'assadfsa', '2f3d5b021e38f77abaae9de9bc486bd3d3e35c15a34dc2146096beaf96c1d373', null, 'asdfasdf@ss.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 16:55:41', null, null);
INSERT INTO `nctf_accounts` VALUES ('5', 'mememe', '85941da8d2bc954addc317a858fe851ae39959d072bd5bea8dc7f6a8a2606f56', null, 'me@me.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 17:29:48', null, null);
INSERT INTO `nctf_accounts` VALUES ('6', 'mememef', 'e5318a6a2265d62568fa7a46203674b1932e1ea1c29dea401c5547b3cf16a1f4', null, 'ff@f.xom', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 17:30:33', null, null);
INSERT INTO `nctf_accounts` VALUES ('7', 'ruirui12', '935c771a0e0c5db5dde90bdb37146a2fe905223e7ef0d47f281deb78f3b70a00', null, 'rui@f.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 17:32:09', null, null);
INSERT INTO `nctf_accounts` VALUES ('8', 'ctfadmin1', '85941da8d2bc954addc317a858fe851ae39959d072bd5bea8dc7f6a8a2606f56', null, 'rui@rui.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 18:34:59', null, null);
INSERT INTO `nctf_accounts` VALUES ('9', 'dadsaf', '85941da8d2bc954addc317a858fe851ae39959d072bd5bea8dc7f6a8a2606f56', null, 'f@f.com', '', null, null, '0', '0', '0000000000', null, '::1', '2015-08-17 18:07:22', null, null);

-- ----------------------------
-- Table structure for nctf_notice
-- ----------------------------
DROP TABLE IF EXISTS `nctf_notice`;
CREATE TABLE `nctf_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `times` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nctf_notice
-- ----------------------------
INSERT INTO `nctf_notice` VALUES ('1', 'ffffffffffff', '2015-08-17 18:44:56');

-- ----------------------------
-- Table structure for nctf_questions
-- ----------------------------
DROP TABLE IF EXISTS `nctf_questions`;
CREATE TABLE `nctf_questions` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned zerofill NOT NULL,
  `question_title` varchar(255) NOT NULL COMMENT '棰樼洰鏍囬?',
  `mark` int(10) unsigned zerofill NOT NULL,
  `answer` varchar(64) NOT NULL,
  `comment` varchar(255) DEFAULT NULL COMMENT '鏀鹃?鐩畊rl',
  `question_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nctf_questions
-- ----------------------------
INSERT INTO `nctf_questions` VALUES ('1', '0000000444', '', '0000000123', 'f', null, '2');

-- ----------------------------
-- Table structure for nctf_rank
-- ----------------------------
DROP TABLE IF EXISTS `nctf_rank`;
CREATE TABLE `nctf_rank` (
  `submit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `mark` int(10) DEFAULT NULL,
  PRIMARY KEY (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nctf_rank
-- ----------------------------

-- ----------------------------
-- Table structure for nctf_submitlog
-- ----------------------------
DROP TABLE IF EXISTS `nctf_submitlog`;
CREATE TABLE `nctf_submitlog` (
  `submit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`submit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nctf_submitlog
-- ----------------------------

-- ----------------------------
-- Table structure for nctf_talk
-- ----------------------------
DROP TABLE IF EXISTS `nctf_talk`;
CREATE TABLE `nctf_talk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nctf_talk
-- ----------------------------
