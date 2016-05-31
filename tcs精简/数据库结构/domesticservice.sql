/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50548
Source Host           : 127.0.0.1:3306
Source Database       : domesticservice

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-05-22 17:59:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminAccount` varchar(15) NOT NULL,
  `adminName` varchar(20) NOT NULL,
  `adminPwd` varchar(15) NOT NULL,
  `adminImg` varchar(255) DEFAULT NULL,
  `adminPhone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `commentCont` varchar(200) DEFAULT NULL,
  `commentTime` varchar(255) NOT NULL,
  `commentGrade` int(11) NOT NULL,
  `comment_userId` int(11) DEFAULT NULL,
  `comment_companyId` int(11) DEFAULT NULL,
  `comment_serviceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_k0acrqoeesk5vxrvy00fjpk3s` (`comment_userId`),
  KEY `FK_r9a3rq4uvm2vd5dw3qlgu6tso` (`comment_companyId`),
  KEY `FK_frhpifle3qnfindh1ci1bgxko` (`comment_serviceId`),
  CONSTRAINT `FK_frhpifle3qnfindh1ci1bgxko` FOREIGN KEY (`comment_serviceId`) REFERENCES `service` (`serviceId`),
  CONSTRAINT `FK_k0acrqoeesk5vxrvy00fjpk3s` FOREIGN KEY (`comment_userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_r9a3rq4uvm2vd5dw3qlgu6tso` FOREIGN KEY (`comment_companyId`) REFERENCES `company` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `companyAccount` varchar(15) NOT NULL,
  `companyPwd` varchar(15) NOT NULL,
  `companyAddress` varchar(255) NOT NULL,
  `companyAddress2` varchar(255) NOT NULL,
  `companyServiceScope` varchar(255) NOT NULL,
  `companyPhone` varchar(11) NOT NULL,
  `companyEmail` varchar(255) DEFAULT NULL,
  `companyLicenseImg` varchar(255) DEFAULT NULL,
  `companyImg` varchar(255) DEFAULT NULL,
  `companySummary` varchar(255) DEFAULT NULL,
  `companyStage` int(11) NOT NULL,
  `companyGrade` float DEFAULT NULL,
  `company_facilitatorTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`companyId`),
  KEY `FK_4c0gayvnaxotmp7ls7fftxyaq` (`company_facilitatorTypeId`),
  CONSTRAINT `FK_4c0gayvnaxotmp7ls7fftxyaq` FOREIGN KEY (`company_facilitatorTypeId`) REFERENCES `facilitatortype` (`facilitatorTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for facilitatortype
-- ----------------------------
DROP TABLE IF EXISTS `facilitatortype`;
CREATE TABLE `facilitatortype` (
  `facilitatorTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `facilitatorTypeName` varchar(255) NOT NULL,
  `facilitatorTypeExplain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`facilitatorTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `messageTime` varchar(255) NOT NULL,
  `messageTitle` varchar(255) NOT NULL,
  `messageBody` varchar(255) NOT NULL,
  `messageStage` int(11) NOT NULL,
  `messagetocompanyId` int(11) DEFAULT NULL,
  `messagetouserId` int(11) DEFAULT NULL,
  `messagetoadminId` int(11) DEFAULT NULL,
  `messagefromcompanyId` int(11) DEFAULT NULL,
  `messagefromuserId` int(11) DEFAULT NULL,
  `messagefromadminId` int(11) DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  KEY `FK_j6ty2lh3c6bklx8jv310u92cl` (`messagetocompanyId`),
  KEY `FK_6mh25l1mqd9x8tjvllj6548wt` (`messagetouserId`),
  KEY `FK_pd9tgro1wh7qb94cokmxqgi92` (`messagetoadminId`),
  KEY `FK_85myk5puvghv8jg8c5ldxrcf9` (`messagefromcompanyId`),
  KEY `FK_dty2e8ioh2jeh51ge2v7w87hn` (`messagefromuserId`),
  KEY `FK_7dnf41v650mvmokc4i2mrs45n` (`messagefromadminId`),
  CONSTRAINT `FK_6mh25l1mqd9x8tjvllj6548wt` FOREIGN KEY (`messagetouserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_7dnf41v650mvmokc4i2mrs45n` FOREIGN KEY (`messagefromadminId`) REFERENCES `admin` (`adminId`),
  CONSTRAINT `FK_85myk5puvghv8jg8c5ldxrcf9` FOREIGN KEY (`messagefromcompanyId`) REFERENCES `company` (`companyId`),
  CONSTRAINT `FK_dty2e8ioh2jeh51ge2v7w87hn` FOREIGN KEY (`messagefromuserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_j6ty2lh3c6bklx8jv310u92cl` FOREIGN KEY (`messagetocompanyId`) REFERENCES `company` (`companyId`),
  CONSTRAINT `FK_pd9tgro1wh7qb94cokmxqgi92` FOREIGN KEY (`messagetoadminId`) REFERENCES `admin` (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for priveunit
-- ----------------------------
DROP TABLE IF EXISTS `priveunit`;
CREATE TABLE `priveunit` (
  `priveunitId` int(11) NOT NULL AUTO_INCREMENT,
  `priveunitName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`priveunitId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `serviceId` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(255) NOT NULL,
  `serviceExplain` varchar(255) DEFAULT NULL,
  `serviceImg` varchar(255) DEFAULT NULL,
  `serviceStage` int(11) NOT NULL,
  `serviceprice` float NOT NULL,
  `service_companyId` int(11) DEFAULT NULL,
  `service_priveunit` int(11) DEFAULT NULL,
  `service_serviceTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`serviceId`),
  KEY `FK_ni84emudh66lxa2mms0aw3v7s` (`service_companyId`),
  KEY `FK_n2iceowbk09eo6fhuql4gly6f` (`service_priveunit`),
  KEY `FK_trevcgq42dxuo3x5rcm0gf4m7` (`service_serviceTypeId`),
  CONSTRAINT `FK_n2iceowbk09eo6fhuql4gly6f` FOREIGN KEY (`service_priveunit`) REFERENCES `priveunit` (`priveunitId`),
  CONSTRAINT `FK_ni84emudh66lxa2mms0aw3v7s` FOREIGN KEY (`service_companyId`) REFERENCES `company` (`companyId`),
  CONSTRAINT `FK_trevcgq42dxuo3x5rcm0gf4m7` FOREIGN KEY (`service_serviceTypeId`) REFERENCES `servicetype` (`serviceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for servicetype
-- ----------------------------
DROP TABLE IF EXISTS `servicetype`;
CREATE TABLE `servicetype` (
  `serviceTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `serviceTypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serviceTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(16) NOT NULL,
  `orderTime` varchar(255) NOT NULL,
  `orderStartTime` varchar(255) NOT NULL,
  `orderServiceAmount` int(11) NOT NULL,
  `orderStage` int(11) NOT NULL,
  `orderCost` float NOT NULL,
  `orderComEndTime` varchar(255) DEFAULT NULL,
  `orderEndTime` varchar(255) DEFAULT NULL,
  `order_userId` int(11) DEFAULT NULL,
  `order_serviceId` int(11) DEFAULT NULL,
  `order_companyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_ri0pd0jyr7lrj2cnla167jqgf` (`order_userId`),
  KEY `FK_c9hwlte7l7cfq5bugiqeqdndy` (`order_serviceId`),
  KEY `FK_bbpc6iwe2gj2axs7992mhgkbj` (`order_companyId`),
  CONSTRAINT `FK_bbpc6iwe2gj2axs7992mhgkbj` FOREIGN KEY (`order_companyId`) REFERENCES `company` (`companyId`),
  CONSTRAINT `FK_c9hwlte7l7cfq5bugiqeqdndy` FOREIGN KEY (`order_serviceId`) REFERENCES `service` (`serviceId`),
  CONSTRAINT `FK_ri0pd0jyr7lrj2cnla167jqgf` FOREIGN KEY (`order_userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(15) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userPwd` varchar(15) NOT NULL,
  `userRealName` varchar(255) DEFAULT NULL,
  `userIDCardNum` varchar(18) DEFAULT NULL,
  `userSex` varchar(255) NOT NULL,
  `userBirthday` varchar(255) DEFAULT NULL,
  `userPhone` varchar(11) NOT NULL,
  `userImg` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) NOT NULL,
  `userAddress2` varchar(255) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userLike` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for validation
-- ----------------------------
DROP TABLE IF EXISTS `validation`;
CREATE TABLE `validation` (
  `validationId` int(11) NOT NULL AUTO_INCREMENT,
  `validationNum` varchar(10) NOT NULL,
  `validationAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`validationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
