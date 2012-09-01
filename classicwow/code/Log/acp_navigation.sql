/*
MySQL Data Transfer
Source Host: 84.38.68.90
Source Database: frontend
Target Host: 84.38.68.90
Target Database: frontend
Date: 16.01.2010 19:01:58
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for acp_navigation
-- ----------------------------
CREATE TABLE `acp_navigation` (
  `id` int(16) NOT NULL auto_increment,
  `parent` int(16) NOT NULL,
  `navOrder` int(16) NOT NULL,
  `value` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `reqGroups` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `acp_navigation` VALUES ('1', '0', '0', 'Verwaltung', 'seite.aspx', 'Play.png', '');
INSERT INTO `acp_navigation` VALUES ('2', '1', '0', 'Systemlog', 'seite.aspx', 'http://www.iconfinder.net/data/icons/Futurosoft%20Icons%200.5.2/16x16/mimetypes/txt.png', '');
INSERT INTO `acp_navigation` VALUES ('4', '1', '0', 'Inhalt', 'acp.php?contentId=content_manager', '', '');
