/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : microerp

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 10/01/2022 10:28:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `Id` int NOT NULL,
  `ControllerId` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `ControllerId`(`ControllerId`) USING BTREE,
  CONSTRAINT `action_ibfk_1` FOREIGN KEY (`ControllerId`) REFERENCES `controller` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 1, 'Search', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `action` VALUES (2, 2, 'Update', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');

-- ----------------------------
-- Table structure for controller
-- ----------------------------
DROP TABLE IF EXISTS `controller`;
CREATE TABLE `controller`  (
  `Id` int NOT NULL,
  `FeatureId` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FeatureId`(`FeatureId`) USING BTREE,
  CONSTRAINT `controller_ibfk_1` FOREIGN KEY (`FeatureId`) REFERENCES `feature` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of controller
-- ----------------------------
INSERT INTO `controller` VALUES (1, 1, 'Invoice', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `controller` VALUES (2, 2, 'Sale Order', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `Id` int NOT NULL,
  `CustomerName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PrimaryCellNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SecondaryCellNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PrimaryEmail` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SecondaryEmail` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PaymentTermsId` int NOT NULL,
  `CityId` int NULL DEFAULT NULL,
  `CustomerSince` datetime NOT NULL,
  `Address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreditLimit` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CityId`(`CityId`) USING BTREE,
  INDEX `PaymentTermsId`(`PaymentTermsId`) USING BTREE,
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`PaymentTermsId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Ibrahim', '	 123455667', '	 123455667', 'Ibrahim@gmail.com', 'ibrahim@gmail.com', 1000002, 0, '2021-12-06 19:00:00', 'WXYZ', 3000, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `customer` VALUES (2, 'Farooq', '1237843', '123455667', 'farooq@gmail.com', 'Farooq@gmail.com', 1000003, 1010004, '2021-12-17 14:14:18', 'wxyz', 2000, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for day
-- ----------------------------
DROP TABLE IF EXISTS `day`;
CREATE TABLE `day`  (
  `Id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of day
-- ----------------------------

-- ----------------------------
-- Table structure for enumtype
-- ----------------------------
DROP TABLE IF EXISTS `enumtype`;
CREATE TABLE `enumtype`  (
  `Id` int NOT NULL,
  `Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enumtype
-- ----------------------------
INSERT INTO `enumtype` VALUES (1000, 'Payment Term');
INSERT INTO `enumtype` VALUES (1001, 'Payment Method');
INSERT INTO `enumtype` VALUES (1002, 'Status');
INSERT INTO `enumtype` VALUES (1003, 'TaxMethod');
INSERT INTO `enumtype` VALUES (1004, 'DiscountType');
INSERT INTO `enumtype` VALUES (1005, 'DiscountMethod');
INSERT INTO `enumtype` VALUES (1006, 'ShipTo');
INSERT INTO `enumtype` VALUES (1007, 'DeliveryMethod');
INSERT INTO `enumtype` VALUES (1008, 'UOM');
INSERT INTO `enumtype` VALUES (1009, 'AccessRights');
INSERT INTO `enumtype` VALUES (1010, 'CityId');
INSERT INTO `enumtype` VALUES (1011, 'Module');
INSERT INTO `enumtype` VALUES (1012, 'User');
INSERT INTO `enumtype` VALUES (1013, 'TaskStatus');

-- ----------------------------
-- Table structure for enumvalue
-- ----------------------------
DROP TABLE IF EXISTS `enumvalue`;
CREATE TABLE `enumvalue`  (
  `Id` int NOT NULL,
  `EnumTypeId` int NOT NULL,
  `Value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FK_enumtype`(`EnumTypeId`) USING BTREE,
  CONSTRAINT `FK_enumtype` FOREIGN KEY (`EnumTypeId`) REFERENCES `enumtype` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enumvalue
-- ----------------------------
INSERT INTO `enumvalue` VALUES (1000001, 1000, 'Net_7');
INSERT INTO `enumvalue` VALUES (1000002, 1000, 'Net_15');
INSERT INTO `enumvalue` VALUES (1000003, 1000, 'Net_20');
INSERT INTO `enumvalue` VALUES (1000004, 1000, 'Net_30');
INSERT INTO `enumvalue` VALUES (1001001, 1001, 'Cash');
INSERT INTO `enumvalue` VALUES (1001002, 1001, 'Personal Cheque');
INSERT INTO `enumvalue` VALUES (1001003, 1001, 'Credit Card');
INSERT INTO `enumvalue` VALUES (1002001, 1002, 'Open');
INSERT INTO `enumvalue` VALUES (1002002, 1002, 'Hold');
INSERT INTO `enumvalue` VALUES (1002003, 1002, 'Cancled');
INSERT INTO `enumvalue` VALUES (1002004, 1002, 'Closed');
INSERT INTO `enumvalue` VALUES (1003001, 1003, 'Progressive');
INSERT INTO `enumvalue` VALUES (1003002, 1003, 'Flat');
INSERT INTO `enumvalue` VALUES (1004001, 1004, 'a');
INSERT INTO `enumvalue` VALUES (1004002, 1004, 'b');
INSERT INTO `enumvalue` VALUES (1004003, 1004, 'c');
INSERT INTO `enumvalue` VALUES (1005001, 1005, 'Percentage');
INSERT INTO `enumvalue` VALUES (1005002, 1005, 'Value');
INSERT INTO `enumvalue` VALUES (1006001, 1006, '1');
INSERT INTO `enumvalue` VALUES (1006002, 1006, 'b');
INSERT INTO `enumvalue` VALUES (1006003, 1006, 'c');
INSERT INTO `enumvalue` VALUES (1007001, 1007, 'a');
INSERT INTO `enumvalue` VALUES (1007002, 1007, 'b');
INSERT INTO `enumvalue` VALUES (1007003, 1007, 'c');
INSERT INTO `enumvalue` VALUES (1008001, 1008, 'ltr');
INSERT INTO `enumvalue` VALUES (1008002, 1008, 'kg');
INSERT INTO `enumvalue` VALUES (1008003, 1008, 'g');
INSERT INTO `enumvalue` VALUES (1008004, 1008, 'pieces');
INSERT INTO `enumvalue` VALUES (1008005, 1008, 'ml');
INSERT INTO `enumvalue` VALUES (1009001, 1009, 'Read');
INSERT INTO `enumvalue` VALUES (1009002, 1009, 'Write');
INSERT INTO `enumvalue` VALUES (1010001, 1010, 'Lahore');
INSERT INTO `enumvalue` VALUES (1010002, 1010, 'Karachi');
INSERT INTO `enumvalue` VALUES (1010003, 1010, 'Islamabad');
INSERT INTO `enumvalue` VALUES (1010004, 1010, 'Faisalabad');
INSERT INTO `enumvalue` VALUES (1010005, 1010, 'Quetta');
INSERT INTO `enumvalue` VALUES (1011001, 1011, 'TMS');
INSERT INTO `enumvalue` VALUES (1011002, 1011, 'LMS');
INSERT INTO `enumvalue` VALUES (1011003, 1011, 'Pro');
INSERT INTO `enumvalue` VALUES (1011004, 1011, 'ATT');
INSERT INTO `enumvalue` VALUES (1012001, 1012, 'Usman');
INSERT INTO `enumvalue` VALUES (1012002, 1012, 'Badar');
INSERT INTO `enumvalue` VALUES (1012003, 1012, 'Sumaira');
INSERT INTO `enumvalue` VALUES (1012004, 1012, 'Arooj');
INSERT INTO `enumvalue` VALUES (1012005, 1012, 'Amaar');
INSERT INTO `enumvalue` VALUES (1013001, 1013, 'Open');
INSERT INTO `enumvalue` VALUES (1013002, 1013, 'In Progress');
INSERT INTO `enumvalue` VALUES (1013003, 1013, 'In Testing');
INSERT INTO `enumvalue` VALUES (1013004, 1013, 'Closed');
INSERT INTO `enumvalue` VALUES (1013005, 1013, 'Reopened');
INSERT INTO `enumvalue` VALUES (1013006, 1013, 'Dependent');
INSERT INTO `enumvalue` VALUES (1013007, 1013, 'RnD');

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature`  (
  `Id` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feature
-- ----------------------------
INSERT INTO `feature` VALUES (1, '1', '1', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, b'0');
INSERT INTO `feature` VALUES (2, 'Sale Order', '1', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`  (
  `Id` int NOT NULL,
  `ClientName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClientPoNo` int NOT NULL,
  `SaleOrder` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Reference` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Task` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Deliverables` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PaymentTerm` int NOT NULL,
  `PaymentMethod` int NOT NULL,
  `Status` int NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TaxMethod` int NOT NULL,
  `TaxPercent` int NOT NULL,
  `TaxValue` int NOT NULL,
  `ShipmentCharges` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES (1, 'a', 1, 's', 'd', 'g', 's', 1, 2, 1, 'h', 1, 4, 3, 900, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice` VALUES (2, 'b', 3, 's', 'd', 'g', 's', 1, 2, 2, 'h', 1, 4, 3, 200, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for invoice_line
-- ----------------------------
DROP TABLE IF EXISTS `invoice_line`;
CREATE TABLE `invoice_line`  (
  `Id` int NOT NULL,
  `InvoiceId` int NOT NULL,
  `InvoiceItemId` int NOT NULL,
  `InvoiceStagedId` int NOT NULL,
  `InvoiceGroupId` int NOT NULL,
  `ItemType` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ItemCategory` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ItemName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SKU` int NOT NULL,
  `QTY` int NOT NULL,
  `UOM` int NOT NULL,
  `Currency` int NOT NULL,
  `UnitPrice` int NOT NULL,
  `LineTotal` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `InvoiceId`(`InvoiceId`) USING BTREE,
  CONSTRAINT `invoice_line_ibfk_1` FOREIGN KEY (`InvoiceId`) REFERENCES `invoice` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoice_line
-- ----------------------------
INSERT INTO `invoice_line` VALUES (1, 1, 23, 31, 61, 'ah', 'yz', 'gh', 68, 89, 1, 78, 123, 500, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice_line` VALUES (2, 1, 18, 33, 62, 'ah', 'yz', 'ij', 68, 85, 2, 78, 678, 600, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice_line` VALUES (3, 1, 19, 34, 63, 'ah', 'yz', 'kl', 67, 84, 3, 78, 9876, 1000, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice_line` VALUES (4, 1, 41, 36, 64, 'ah', 'yz', 'lm', 68, 82, 4, 78, 2324, 800, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice_line` VALUES (6, 2, 11, 35, 63, 'ah', 'yz', 'jc', 68, 85, 2, 78, 1000, 7800, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice_line` VALUES (7, 2, 15, 12, 67, 'ah', 'yz', 'de', 67, 45, 3, 78, 2324, 190, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `invoice_line` VALUES (8, 2, 8, 54, 68, 'ah', 'yz', 'ef', 68, 23, 4, 78, 765, 450, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `invoice_line` VALUES (9, 2, 11, 35, 63, 'ah', 'yz', 'jc', 68, 85, 9, 78, 2324, 1000, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `Id` int NOT NULL,
  `ItemCode` int NOT NULL,
  `ItemName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SalePrice` int NOT NULL,
  `SystemRefNo` int NOT NULL,
  `HSCode` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ItemDescription` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SourceId` int NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `BrandId` int NOT NULL,
  `CategoryId` int NOT NULL,
  `SubCategoryId` int NOT NULL,
  `UoMId` int NOT NULL,
  `StandardWeightId` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UoMId`(`UoMId`) USING BTREE,
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`UoMId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 1001, 'Dettol Multi Surface Cleaner', 600, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008005, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (2, 1002, 'Dettol Antibacterial Spray', 750, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008005, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (3, 1003, 'Dettol Original Bar Soap', 250, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008004, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (4, 1004, 'Dettol All in One Disinfectant Spray', 750, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008005, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (5, 1005, 'Dettol Original Everyday Protection Liquid Hand Wash', 450, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008005, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (6, 1006, 'Colgate MaxFresh Toothpaste', 100, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008003, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (7, 1007, 'Colgate Sensitive Pro-Relief ER Toothpaste', 100, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008003, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (8, 1008, 'Colgate Sparkle Toothpaste', 100, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008003, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (9, 1009, 'Colgate Herbal Toothpaste', 100, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008003, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);
INSERT INTO `item` VALUES (10, 1010, 'Colgate Sensitive Sensifoam Toothpaste', 100, 0, NULL, 'XYZ', 0, b'0', 0, 0, 0, 1008003, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0);

-- ----------------------------
-- Table structure for lecture
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture`  (
  `Id` int NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `LectureURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lecture
-- ----------------------------
INSERT INTO `lecture` VALUES (1, 'Title ABC', 'Desc...', 'URL12345', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `lecture` VALUES (2, 'Title b', 'Desc...', 'URL5678', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation`  (
  `Id` int NOT NULL,
  `ClientName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ApplyDiscount` int NOT NULL,
  `QuoteValidity` datetime NOT NULL,
  `DiscountType` int NOT NULL,
  `DiscountMethod` int NOT NULL,
  `Discount` int NOT NULL,
  `ShipTo` int NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `DeliveryMethod` int NOT NULL,
  `StatusRequired` int NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quotation
-- ----------------------------

-- ----------------------------
-- Table structure for quotation_line
-- ----------------------------
DROP TABLE IF EXISTS `quotation_line`;
CREATE TABLE `quotation_line`  (
  `Id` int NOT NULL,
  `QuotationId` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `QTY` int NOT NULL,
  `UOM` int NOT NULL,
  `LineTotal` int NOT NULL,
  `DiscountMethod` int NOT NULL,
  `DiscountValue` int NOT NULL,
  `TotalDiscountPrice` int NOT NULL,
  `ShipmentCharges` int NOT NULL,
  `NetTotal` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `QuotationId`(`QuotationId`) USING BTREE,
  CONSTRAINT `quotation_line_ibfk_1` FOREIGN KEY (`QuotationId`) REFERENCES `quotation` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quotation_line
-- ----------------------------

-- ----------------------------
-- Table structure for request_note
-- ----------------------------
DROP TABLE IF EXISTS `request_note`;
CREATE TABLE `request_note`  (
  `Id` int NOT NULL,
  `TypeId` int NOT NULL,
  `CategoryId` int NOT NULL,
  `StatusId` int NOT NULL,
  `RequesterTypeId` int NOT NULL,
  `Title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RequiredBefore` datetime NOT NULL,
  `Reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_note
-- ----------------------------

-- ----------------------------
-- Table structure for request_note_line
-- ----------------------------
DROP TABLE IF EXISTS `request_note_line`;
CREATE TABLE `request_note_line`  (
  `Id` int NOT NULL,
  `RequestNoteId` int NOT NULL,
  `UOMId` int NOT NULL,
  `ItemName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RequestedQty` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `RequestNoteId`(`RequestNoteId`) USING BTREE,
  CONSTRAINT `request_note_line_ibfk_1` FOREIGN KEY (`RequestNoteId`) REFERENCES `request_note` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of request_note_line
-- ----------------------------

-- ----------------------------
-- Table structure for requestnote
-- ----------------------------
DROP TABLE IF EXISTS `requestnote`;
CREATE TABLE `requestnote`  (
  `Id` int NOT NULL,
  `Title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RequiredBefore` date NOT NULL,
  `TypeId` int NULL DEFAULT NULL,
  `CategoryId` int NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of requestnote
-- ----------------------------
INSERT INTO `requestnote` VALUES (1, 'RN-001', '2021-09-30', 2, 2);
INSERT INTO `requestnote` VALUES (2, 'RN-002', '2021-10-08', 1, 1);
INSERT INTO `requestnote` VALUES (3, 'RN-003', '2021-09-30', 2, 3);
INSERT INTO `requestnote` VALUES (4, 'RN-004', '2021-09-29', 4, NULL);

-- ----------------------------
-- Table structure for requestnotecategory
-- ----------------------------
DROP TABLE IF EXISTS `requestnotecategory`;
CREATE TABLE `requestnotecategory`  (
  `Id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of requestnotecategory
-- ----------------------------
INSERT INTO `requestnotecategory` VALUES (1, 'Item Request');
INSERT INTO `requestnotecategory` VALUES (2, 'BOM');
INSERT INTO `requestnotecategory` VALUES (3, 'Quotation');
INSERT INTO `requestnotecategory` VALUES (4, 'RFQ');
INSERT INTO `requestnotecategory` VALUES (5, 'IRL');

-- ----------------------------
-- Table structure for requestnotetype
-- ----------------------------
DROP TABLE IF EXISTS `requestnotetype`;
CREATE TABLE `requestnotetype`  (
  `Id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of requestnotetype
-- ----------------------------
INSERT INTO `requestnotetype` VALUES (1, 'Internal');
INSERT INTO `requestnotetype` VALUES (2, 'Sales');
INSERT INTO `requestnotetype` VALUES (3, 'Purchase');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `Id` int NOT NULL,
  `FeatureId` int NOT NULL,
  `ControllerId` int NOT NULL,
  `ActionId` int NOT NULL,
  `ResourceValue` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FeatureId`(`FeatureId`) USING BTREE,
  INDEX `ControllerId`(`ControllerId`) USING BTREE,
  INDEX `ActionId`(`ActionId`) USING BTREE,
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`FeatureId`) REFERENCES `feature` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`ControllerId`) REFERENCES `controller` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `resource_ibfk_3` FOREIGN KEY (`ActionId`) REFERENCES `action` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, 1, 1, 1, 'Resource/GetResourceById', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `resource` VALUES (2, 2, 2, 2, 'Resource/GetAllResources', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');

-- ----------------------------
-- Table structure for resourcepermission
-- ----------------------------
DROP TABLE IF EXISTS `resourcepermission`;
CREATE TABLE `resourcepermission`  (
  `Id` int NOT NULL,
  `FeatureId` int NOT NULL,
  `UserId` int NULL DEFAULT NULL,
  `RoleId` int NULL DEFAULT NULL,
  `ResourceId` int NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FeatureId`(`FeatureId`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  INDEX `RoleId`(`RoleId`) USING BTREE,
  INDEX `ResourceId`(`ResourceId`) USING BTREE,
  CONSTRAINT `resourcepermission_ibfk_1` FOREIGN KEY (`FeatureId`) REFERENCES `feature` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `resourcepermission_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `resourcepermission_ibfk_3` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resourcepermission
-- ----------------------------
INSERT INTO `resourcepermission` VALUES (1, 1, 1, 1, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'1');
INSERT INTO `resourcepermission` VALUES (2, 2, 2, 2, 2, '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `Id` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Responsibility` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'SE', 'ABC', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `role` VALUES (2, 'JSE', 'XYZ', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `role` VALUES (3, 'PSE', 'XYZ', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `role` VALUES (4, 'JSE', 'WXYZ', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `role` VALUES (5, 'SE', 'ABCSD', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `role` VALUES (6, 'JSE', 'ABC', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `Id` int NOT NULL,
  `CustomerId` int NOT NULL,
  `Balance` int NOT NULL,
  `Total` int NOT NULL,
  `Discount` int NOT NULL,
  `NetPayable` int NOT NULL,
  `StatusId` int NULL DEFAULT NULL,
  `ClientSoNo` int NULL DEFAULT NULL,
  `PaymentTerm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `PaymentMethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Reference` int NULL DEFAULT NULL,
  `Description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CustomerId`(`CustomerId`) USING BTREE,
  CONSTRAINT `sale_order_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES (1, 1, 5000, 700, 100, 600, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (2, 1, 1200, 3600, 100, 3500, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (3, 2, 12300, 1750, 1, 1749, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (4, 2, 80000, 500, 23, 477, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (5, 2, 1300, 800, 23, 777, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (6, 2, 1200, 6000, 120, 5880, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (7, 2, 130000, 500, 130, 370, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (8, 2, 13000, 4500, 100, 4400, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (9, 1, 120000, 10800, 100, 10700, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (10, 2, 140000, 5100, 100, 5000, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (11, 1, 12000, 8400, 100, 8300, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (12, 1, 120000, 9450, 0, 9450, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (13, 2, 12000, 800, 0, 800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (14, 2, 100000, 9600, 0, 9600, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (15, 1, 12000, 5900, 100, 5800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (16, 1, 10000, 800, 0, 800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (17, 1, 12000, 4200, 0, 4200, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (18, 2, 12000, 2400, 0, 2400, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (19, 2, 18000000, 2000, 0, 2000, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (20, 1, 100000, 2250, 0, 2250, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (21, 2, 10000000, 800, 0, 800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (22, 1, 190000, 800, 0, 800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (23, 2, 12344, 800, 0, 800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order` VALUES (24, 2, 187289, 800, 0, 800, 0, 0, NULL, NULL, 0, NULL, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for sale_order_line
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_line`;
CREATE TABLE `sale_order_line`  (
  `Id` int NOT NULL,
  `SaleOrderId` int NOT NULL,
  `ItemName` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ItemCode` int NOT NULL,
  `QTY` int NOT NULL,
  `UOMId` int NOT NULL,
  `Price` int NOT NULL,
  `LineTotal` int NOT NULL,
  `ItemType` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ItemCategory` int NULL DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `SaleOrderId`(`SaleOrderId`) USING BTREE,
  INDEX `UOMId`(`UOMId`) USING BTREE,
  CONSTRAINT `sale_order_line_ibfk_1` FOREIGN KEY (`SaleOrderId`) REFERENCES `sale_order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sale_order_line_ibfk_2` FOREIGN KEY (`UOMId`) REFERENCES `enumvalue` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order_line
-- ----------------------------
INSERT INTO `sale_order_line` VALUES (1, 1, 'Colgate MaxFresh Toothpaste', 1006, 7, 1008003, 100, 700, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (2, 2, 'Dettol Multi Surface Cleaner', 1001, 6, 1008005, 600, 3600, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (3, 3, 'Dettol Original Bar Soap', 1003, 7, 1008004, 250, 1750, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (4, 4, 'Colgate Herbal Toothpaste', 1009, 5, 1008003, 100, 500, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (5, 5, 'Colgate Sparkle Toothpaste', 1008, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (6, 6, 'Colgate Sparkle Toothpaste', 1008, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (7, 6, 'Colgate Sparkle Toothpaste', 1008, 7, 1008003, 100, 700, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (8, 6, 'Dettol All in One Disinfectant Spray', 1004, 6, 1008005, 750, 4500, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (9, 7, 'Colgate Herbal Toothpaste', 1009, 5, 1008003, 100, 500, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (10, 8, 'Dettol All in One Disinfectant Spray', 1004, 6, 1008005, 750, 4500, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (11, 9, 'Dettol Multi Surface Cleaner', 1001, 8, 1008005, 600, 4800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (12, 9, 'Dettol Antibacterial Spray', 1002, 8, 1008005, 750, 6000, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (13, 10, 'Dettol Multi Surface Cleaner', 1001, 7, 1008005, 600, 4200, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (14, 10, 'Colgate Herbal Toothpaste', 1009, 9, 1008003, 100, 900, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (15, 11, 'Dettol Multi Surface Cleaner', 1001, 8, 1008005, 600, 4800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (16, 11, 'Dettol Original Everyday Protection Liquid Hand Wash', 1005, 8, 1008005, 450, 3600, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (17, 12, 'Dettol Antibacterial Spray', 1002, 7, 1008005, 750, 5250, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (18, 12, 'Dettol Multi Surface Cleaner', 1001, 7, 1008005, 600, 4200, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (19, 13, 'Colgate Herbal Toothpaste', 1009, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (20, 14, 'Dettol Multi Surface Cleaner', 1001, 8, 1008005, 600, 4800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (21, 14, 'Dettol Multi Surface Cleaner', 1001, 8, 1008005, 600, 4800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (22, 15, 'Dettol Multi Surface Cleaner', 1001, 8, 1008005, 600, 4800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (23, 15, 'Colgate Sensitive Pro-Relief ER Toothpaste', 1007, 11, 1008005, 100, 1100, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (24, 16, 'Colgate Herbal Toothpaste', 1009, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (25, 17, 'Dettol Multi Surface Cleaner', 1001, 7, 1008005, 600, 4200, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (26, 18, 'Dettol Multi Surface Cleaner', 1001, 4, 1008005, 600, 2400, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (27, 19, 'Dettol Original Bar Soap', 1003, 8, 1008004, 250, 2000, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (28, 20, 'Dettol Original Everyday Protection Liquid Hand Wash', 1005, 5, 1008005, 450, 2250, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (29, 21, 'Colgate Herbal Toothpaste', 1009, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (30, 22, 'Colgate Herbal Toothpaste', 1009, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (31, 23, 'Colgate Herbal Toothpaste', 1009, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `sale_order_line` VALUES (32, 24, 'Colgate Sparkle Toothpaste', 1008, 8, 1008003, 100, 800, NULL, 0, '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `Id` int NOT NULL,
  `StudentName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CNIC` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DOB` datetime NULL DEFAULT NULL,
  `CellNo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `WhatsApp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianCell` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianRelation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianWhatsApp` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianEmail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `GuardianOccupation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Remarks` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'Arooj Fatimah', 'f', '3660366387328', '2021-12-23 00:00:00', '03001234567', 'arooj@gmail.com', '03001234567', 'ABC', '03001234567', 'Mother', '01234567891', 'abc@gamil.com', 'XYZ', 'Remarks...', 'Arooj', '12345', '2021-12-23 00:00:00', 1, '2021-12-23 00:00:00', 1, b'1');
INSERT INTO `student` VALUES (2, 'Sumaira Ameer', 'f', '3660366387328', '2021-12-23 00:00:00', '06876875453', 'sumaira@gmail.com', '03007899978', 'XYZ', '03001234567', 'Father', '01786567891', 'xyz@gamil.com', 'ABC', 'Remarks...', 'Sumaira', '6789', '2021-12-23 00:00:00', 1, '2021-12-23 00:00:00', 1, b'1');

-- ----------------------------
-- Table structure for studentlecture
-- ----------------------------
DROP TABLE IF EXISTS `studentlecture`;
CREATE TABLE `studentlecture`  (
  `Id` int NOT NULL,
  `StudentId` int NOT NULL,
  `LectureId` int NOT NULL,
  `AssignedOn` datetime NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`StudentId`, `LectureId`) USING BTREE,
  INDEX `LectureId`(`LectureId`) USING BTREE,
  CONSTRAINT `studentlecture_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `studentlecture_ibfk_2` FOREIGN KEY (`LectureId`) REFERENCES `lecture` (`Id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentlecture
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `Id` int NOT NULL,
  `UserId` int NULL DEFAULT NULL,
  `ModuleId` int NULL DEFAULT NULL,
  `StatusId` int NULL DEFAULT NULL,
  `Title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SP` int NULL DEFAULT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `CreatedOn` datetime NULL DEFAULT NULL,
  `CreatedById` int NULL DEFAULT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1001, 1012003, 1011003, 1013001, 'Title ABC', 1, 'Desc..', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, 1);
INSERT INTO `task` VALUES (1002, 1012003, 1011003, 1013001, 'Title B', 1, 'Desc..', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, 1);
INSERT INTO `task` VALUES (1003, 1012003, 1011002, 1013001, 'ABC', 2, 'DesABC', '2021-12-09 04:57:36', 0, '2021-12-09 04:57:36', 0, 1);
INSERT INTO `task` VALUES (1004, 1012004, 1011001, 1013002, 'AB', 3, 'XYZ', '2021-12-09 04:58:33', 0, '2021-12-09 04:58:33', 0, 1);
INSERT INTO `task` VALUES (1005, 1012004, 1011004, 1013004, 'A', 4, 'Des..XYZ', '2021-12-09 04:58:33', 0, '2021-12-09 04:58:33', 0, 1);
INSERT INTO `task` VALUES (1006, 1012003, 1011003, 1013001, 'Sale Order Input Row Design', 2, 'First Row would be used as an Input Row. Desing of First Row should be as followings\n  1.1 Design ItemCode as TextBox in the first column\n  1.2 Desing Item Name as DropDownList in the 2nd column\n  1.3 Design UOM (Unit of Measure) as the text box. This text box should be Disabled so that UOM from API should be displayed here in 3rd column \n  1.4 Design Rate as a text box which can take just an integer value which should contain Rate from API (after searching an Item). User can change value received from API as per requirement\n  1.5 Desing Qty (Quantity) as an Integer Input TextBox field. Default value should be 1. Negative or zero values should shouldn\'t be allowed\n  1.6 Design Total field as a an integer input textbox which should be having its values base upon Qty multiplied by Rate\n  1.7 Design a button having text as \"+\", which when pressed should take values of above mentioned control and should place these values in the grid as a new row. After adding values as a new row, all input controls mentioned above should be emptied so that user can input another item\n\n', '2021-12-20 07:02:35', 0, '2021-12-20 07:02:35', 0, 1);
INSERT INTO `task` VALUES (1007, 1012003, 1011003, 1013001, 'Sale Order : Add a New Row in the Grid', 3, '1. Type Item Code in \"Item Code\" text box and press Enter button. (e.g. 1101)\n1.1 When user presses enter button, a call to API with Item code should be sent to fetch item based upon this code \n1.2 Pre-Requisites:  Define an API (plus corresponding service method) to search item by code having the following Signatures  \n\nService Method Signatures:   \nItemVM GetItemByCode(string itemCode); // Define Service Method and against this method define the follwing API Action Method\n\nAPI Signarures\n[HttpGet]  \nActionResult GetItemByCode(string itemCode)\n\n1.3  Same class ItemVM should be defined in Angular Application to received data returned from API\n1.4 Data returend against searched Item should be filled in the following controls of Input Row\n 1.4.1 ItemName\n 1.4.2 UOM\n 1.4.3 Rate\n 1.4.4 Total (computed value)\n1.4 Cursor should be moved to Qty field so that user can change qty (Default is always 1) by Up/Down arrow keys\n1.5 Now pressing enter inside Qty field should move data of input row into the grid as a new row \n', '2021-12-20 07:13:02', 0, '2021-12-20 07:13:02', 0, 1);
INSERT INTO `task` VALUES (1008, 1012003, 1011003, 1013001, 'Sale Order - Edit & Delete Rows', 4, 'Delete Action/Mode:\n 1. Define an icon for delete in the Actions column of grid, which when pressed should prompt a message to user \"Are you sure you want to delete? Yes/No\" \n1.1 When user pressed Yes button, remove item from grid (by removing item from list)\n\nEdit Action/Mode:\n1. Define an icon for edit in the Actions column of grid, which when pressed should reflect grid row values in the Grid Input Line. \n1.2 Now Item Code and Item Name should be disabled (as moslty Qty and Price are modfied)\n1.3 Cursor should be moved to Qty field for its change (as mostly Qty chages)\n1.4 User can change Qty and price as well. Pressing enter on Price as well should add row in the gid. \n1.5. Pressing enter on Qty OR price in Edit mode should modify the same row which is currently in the edit mode.\n1.6. Now the input row should again be blank and cursor should move to ItemCode ', '2021-12-20 07:34:17', 0, '2021-12-20 07:34:17', 0, 1);
INSERT INTO `task` VALUES (1009, 1012003, 1011003, 1013001, 'Sale Order  - Item Searching by Item Name', 4, '1. When cursor moves to ItemName and user types some characters (2 characters minimum) then application should call an API method having the following signatures\n \nList<ItemVM> GetItemsByName(string itemName); \n NOTE: This method should use SearchItem method internally to search item by name. So this method is a wrapper method around Search Method\n\n2. Use Angular Material\'s Autocomplete control (https://material.angular.io/components/autocomplete/overvie) to implement this functionality\n2.1 User can erase his/her input search and can type some words again to search again\n3. Now pressing any item (by name) should select corresponding ItemCode to seach Item from API in the same way as metnioned in some previous task\nNOTE: Each Search should fill item names along with ItemCodes in the AutoCompleted text box. so pressing any item, can search its corresponding item code which can be used again to select one and only one item\n', '2021-12-20 07:49:26', 0, '2021-12-20 07:49:26', 0, 1);
INSERT INTO `task` VALUES (1010, 1012004, 0, 1013001, 'A new task should always has status \"Open\" so hide field \"Status\" while adding a new Task ', 1, '<p>A new task should always has status \"Open\" so hide field \"Status\" while adding a new Task&nbsp;</p><p>		Hint:</p><p>		*ngIf=\"condition\"</p><p>		Example:&nbsp;</p><p>		 &lt;div class=\"form-row\" *ngIf=\"shareSvc.Mode != \'Add\'\"&gt;</p><p>		&nbsp;....</p><ul><li>		 &lt;/div&gt;</li></ul>', '2022-01-10 04:42:09', 0, '2022-01-10 04:42:09', 0, 1);
INSERT INTO `task` VALUES (1011, 1012002, 0, 1013001, 'Task should be Edited as well ', 3, '<p>	- Task should be Edited as well (Badar)</p><p>	</p><p>	Hint: (Pseudocode)&nbsp;&nbsp;</p><p>	HTML:</p><p>	&lt;mat-cell *matCellDef=\"let task\" class=\"action-link\"&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;a (click)=\"EditRecord(task)\" data-toggle=\"Edit\" title=\"Edit\" style=\"cursor: pointer;\"</p><p>	</p><p>&nbsp;&nbsp;TypeScript:</p><p>	</p><p>	EditRecord(task: Task) {</p><p>&nbsp;&nbsp;let dialogRef = this.dialog.open(TaskComponent, {disableClose:true, width: \'900px\', height: \'700px\'&nbsp;</p><p>	 , data: { TaskId:task.Id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;//, TaskTitle: task.Title</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;}</p><p>	});</p><p>&nbsp;&nbsp;var mod=new TaskSearchCriteria();</p><p>&nbsp;&nbsp;mod.Id=task.Id;</p><p>&nbsp;&nbsp;this.taskSvc.SearchTask(mod)</p><p>&nbsp;&nbsp;&nbsp;.subscribe(mod =&gt; {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;// write code to use mod</p><p>		</p><p>&nbsp;&nbsp;&nbsp;})</p><p>&nbsp;&nbsp;dialogRef.afterClosed().subscribe(result =&gt; {</p><p>&nbsp;&nbsp;&nbsp;&nbsp;// write code to perform on Clos</p><p>&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;});</p><p>&nbsp;}</p><p>&nbsp;&nbsp;</p><p>&nbsp;// Dialogue Component Typescript&nbsp;</p><p>import { MatDialog } from \'@angular/material/dialog\';</p><p>&nbsp;&nbsp;</p><p>&nbsp;class XYZComponet implement OnInit {</p><p>&nbsp;&nbsp;</p><p>&nbsp;taskId:number;</p><p>&nbsp;constructor(</p><p>&nbsp;&nbsp;, @Inject(MAT_DIALOG_DATA) public data: any</p><p>	}</p><p>	</p><p>	 ngOnInit(): void {</p><p>&nbsp;&nbsp;debugger;</p><p>&nbsp;&nbsp;this.taskId = this.data.TaskId;</p><p>	if(this.taskId &gt; 0){</p><p>	// Edit Case</p><p>	 // write code to get data from BackEnd against this taskId</p><p>	}</p><p>	else {</p><p>	 // Add Case</p><p>	}</p><p>	</p><p>	}</p><p><br></p><p>}		</p>', '2022-01-10 05:24:44', 0, '2022-01-10 05:24:44', 0, 1);

-- ----------------------------
-- Table structure for taskcomment
-- ----------------------------
DROP TABLE IF EXISTS `taskcomment`;
CREATE TABLE `taskcomment`  (
  `Id` int NOT NULL,
  `TaskId` int NOT NULL,
  `UserId` int NOT NULL,
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Time` datetime NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` int NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `TaskId_idx`(`TaskId`) USING BTREE,
  CONSTRAINT `TaskId` FOREIGN KEY (`TaskId`) REFERENCES `task` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taskcomment
-- ----------------------------
INSERT INTO `taskcomment` VALUES (1, 1001, 1012004, 'Comment..', '2021-12-09 00:00:00', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, 1);
INSERT INTO `taskcomment` VALUES (2, 1002, 1012003, 'Com..', '2021-12-09 00:00:00', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Id` int NOT NULL,
  `UserName` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Ayesha', '12345', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `user` VALUES (2, 'Zunaira', '123456', '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `user` VALUES (3, 'Arooj', '12345', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');
INSERT INTO `user` VALUES (4, 'Sumaira', '6789', '0001-01-01 00:00:00', 0, '0001-01-01 00:00:00', 0, b'0');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole`  (
  `Id` int NOT NULL,
  `RoleId` int NOT NULL,
  `UserId` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedById` int NOT NULL,
  `ModifiedOn` datetime NULL DEFAULT NULL,
  `ModifiedById` int NULL DEFAULT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  INDEX `RoleId`(`RoleId`) USING BTREE,
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES (1, 2, 1, '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');
INSERT INTO `userrole` VALUES (2, 1, 2, '2021-12-09 00:00:00', 1, '2021-12-09 00:00:00', 1, b'1');

-- ----------------------------
-- View structure for vw_customers
-- ----------------------------
DROP VIEW IF EXISTS `vw_customers`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_customers` AS select `cus`.`Id` AS `Id`,`cus`.`CustomerName` AS `CustomerName`,`cus`.`PrimaryCellNo` AS `PrimaryCellNo`,`cus`.`SecondaryCellNo` AS `SecondaryCellNo`,`cus`.`PrimaryEmail` AS `PrimaryEmail`,`cus`.`SecondaryEmail` AS `SecondaryEmail`,`cus`.`PaymentTermsId` AS `PaymentTermsId`,`ev1`.`Value` AS `PaymentTerm`,`cus`.`CustomerSince` AS `CustomerSince`,`cus`.`CityId` AS `CityId`,`cus`.`Address` AS `Address`,`cus`.`CreditLimit` AS `CreditLimit`,`cus`.`CreatedOn` AS `CreatedOn`,`cus`.`CreatedById` AS `CreatedById`,`cus`.`ModifiedOn` AS `ModifiedOn`,`cus`.`ModifiedById` AS `ModifiedById`,`cus`.`IsActive` AS `IsActive` from (`customer` `cus` join `enumvalue` `ev1` on((`ev1`.`Id` = `cus`.`PaymentTermsId`)));

-- ----------------------------
-- View structure for vw_invoices
-- ----------------------------
DROP VIEW IF EXISTS `vw_invoices`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_invoices` AS select `inv`.`Id` AS `Id`,`inv`.`ClientName` AS `ClientName`,`inv`.`ClientPoNo` AS `ClientPoNo`,`inv`.`Status` AS `Status`,`invl`.`Id` AS `InvLId`,`invl`.`InvoiceItemId` AS `InvoiceItemId`,`invl`.`InvoiceStagedId` AS `InvoiceStagedId`,`invl`.`InvoiceGroupId` AS `InvoiceGroupId`,`invl`.`ItemName` AS `ItemName`,`invl`.`QTY` AS `QTY`,`invl`.`UnitPrice` AS `UnitPrice`,`inv`.`CreatedOn` AS `CreatedOn`,`inv`.`CreatedById` AS `CreatedById`,`inv`.`ModifiedOn` AS `ModifiedOn`,`inv`.`ModifiedById` AS `ModifiedById`,`inv`.`IsActive` AS `IsActive` from (`invoice` `inv` join `invoice_line` `invl` on((`inv`.`Id` = `invl`.`InvoiceId`)));

-- ----------------------------
-- View structure for vw_items
-- ----------------------------
DROP VIEW IF EXISTS `vw_items`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_items` AS select `item`.`Id` AS `Id`,`item`.`ItemName` AS `ItemName`,`item`.`ItemCode` AS `ItemCode`,`item`.`SalePrice` AS `SalePrice`,`item`.`ItemDescription` AS `ItemDescription`,`item`.`UoMId` AS `UoMId`,`item`.`SystemRefNo` AS `SystemRefNo`,`item`.`BrandId` AS `BrandId`,`item`.`SourceId` AS `SourceId`,`item`.`HSCode` AS `HSCode`,`item`.`CategoryId` AS `CategoryId`,`item`.`SubCategoryId` AS `SubCategoryId`,`ev`.`Value` AS `UOM`,`item`.`CreatedOn` AS `CreatedOn`,`item`.`CreatedById` AS `CreatedById`,`item`.`ModifiedOn` AS `ModifiedOn`,`item`.`ModifiedById` AS `ModifiedById`,`item`.`IsActive` AS `IsActive` from (`item` join `enumvalue` `ev` on((`ev`.`Id` = `item`.`UoMId`)));

-- ----------------------------
-- View structure for vw_quotations
-- ----------------------------
DROP VIEW IF EXISTS `vw_quotations`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_quotations` AS select `qn`.`Id` AS `Id`,`qn`.`ClientName` AS `ClientName`,`qn`.`Title` AS `Title`,`qn`.`QuoteValidity` AS `QuoteValidity`,`qn`.`ApplyDiscount` AS `ApplyDiscount`,`qn`.`ShipTo` AS `ShipTo`,`qn`.`DeliveryDate` AS `DeliveryDate`,`qnl`.`Id` AS `QTNLId`,`qnl`.`QTY` AS `QTY`,`qnl`.`ShipmentCharges` AS `ShipmentCharges`,`qnl`.`UOM` AS `UOM`,`qnl`.`LineTotal` AS `LineTotal`,`qnl`.`NetTotal` AS `NetTotal`,`qn`.`CreatedOn` AS `CreatedOn`,`qn`.`CreatedById` AS `CreatedById`,`qn`.`ModifiedOn` AS `ModifiedOn`,`qn`.`ModifiedById` AS `ModifiedById`,`qn`.`IsActive` AS `IsActive` from (`quotation` `qn` join `quotation_line` `qnl` on((`qn`.`Id` = `qnl`.`QuotationId`)));

-- ----------------------------
-- View structure for vw_request_notes
-- ----------------------------
DROP VIEW IF EXISTS `vw_request_notes`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_request_notes` AS select `rn`.`Id` AS `Id`,`rn`.`TypeId` AS `TypeId`,`rn`.`CategoryId` AS `CategoryId`,`rn`.`StatusId` AS `StatusId`,`rn`.`RequesterTypeId` AS `RequesterTypeId`,`rn`.`Title` AS `Title`,`rnl`.`Id` AS `RNLId`,`rnl`.`UOMId` AS `UOMId`,`rnl`.`RequestedQty` AS `RequestedQty`,`rnl`.`ItemName` AS `ItemName`,`rn`.`CreatedOn` AS `CreatedOn`,`rn`.`CreatedById` AS `CreatedById`,`rn`.`ModifiedOn` AS `ModifiedOn`,`rn`.`ModifiedById` AS `ModifiedById`,`rn`.`IsActive` AS `IsActive` from (`request_note` `rn` join `request_note_line` `rnl` on((`rn`.`Id` = `rnl`.`RequestNoteId`)));

-- ----------------------------
-- View structure for vw_resourcepermission
-- ----------------------------
DROP VIEW IF EXISTS `vw_resourcepermission`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_resourcepermission` AS select `rp`.`Id` AS `Id`,`rp`.`UserId` AS `UserId`,`us`.`UserName` AS `User`,`rp`.`RoleId` AS `RoleId`,`ro`.`Name` AS `Role`,`rp`.`FeatureId` AS `FeatureId`,`fea`.`Name` AS `Feature`,concat(`controller`.`Name`,'./',`action`.`Name`) AS `Resource`,`rp`.`IsActive` AS `IsActive` from ((((`controller` join `action`) join (`resourcepermission` `rp` join `user` `us` on((`rp`.`UserId` = `us`.`Id`)))) join `role` `ro` on((`rp`.`RoleId` = `ro`.`Id`))) join `feature` `fea` on((`rp`.`FeatureId` = `fea`.`Id`)));

-- ----------------------------
-- View structure for vw_saleorders
-- ----------------------------
DROP VIEW IF EXISTS `vw_saleorders`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_saleorders` AS select `so`.`Id` AS `Id`,`so`.`CustomerId` AS `CustomerId`,`cus`.`CustomerName` AS `CustomerName`,`so`.`Balance` AS `Balance`,`sol`.`Id` AS `SOLId`,`sol`.`ItemName` AS `ItemName`,`sol`.`ItemCode` AS `ItemCode`,`sol`.`UOMId` AS `UOMId`,`ev`.`Value` AS `UOM`,`sol`.`QTY` AS `QTY`,`sol`.`Price` AS `Price`,`sol`.`LineTotal` AS `LineTotal`,`so`.`Total` AS `Total`,`so`.`Discount` AS `Discount`,`so`.`NetPayable` AS `NetPayable`,`so`.`CreatedOn` AS `CreatedOn`,`so`.`CreatedById` AS `CreatedById`,`so`.`ModifiedOn` AS `ModifiedOn`,`so`.`ModifiedById` AS `ModifiedById`,`so`.`IsActive` AS `IsActive` from (((`sale_order` `so` join `customer` `cus` on((`cus`.`Id` = `so`.`CustomerId`))) join `sale_order_line` `sol` on((`so`.`Id` = `sol`.`SaleOrderId`))) join `enumvalue` `ev` on((`ev`.`Id` = `sol`.`UOMId`)));

-- ----------------------------
-- View structure for vw_studentlectures
-- ----------------------------
DROP VIEW IF EXISTS `vw_studentlectures`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_studentlectures` AS select `stl`.`Id` AS `Id`,`stl`.`StudentId` AS `StudentId`,`st`.`StudentName` AS `Student`,`st`.`UserName` AS `UserName`,`st`.`Password` AS `Password`,`stl`.`LectureId` AS `LectureId`,`le`.`Title` AS `Title`,`le`.`LectureURL` AS `Lecture`,`le`.`Description` AS `Description`,`stl`.`AssignedOn` AS `AssignedOn`,`stl`.`IsActive` AS `IsActive` from ((`studentlecture` `stl` join `student` `st` on((`stl`.`StudentId` = `st`.`Id`))) join `lecture` `le` on((`stl`.`LectureId` = `le`.`Id`)));

-- ----------------------------
-- View structure for vw_students
-- ----------------------------
DROP VIEW IF EXISTS `vw_students`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_students` AS select `st`.`Id` AS `Id`,`st`.`StudentName` AS `StudentName`,`st`.`Gender` AS `Gender`,`st`.`CNIC` AS `CNIC`,`st`.`Email` AS `Email`,`st`.`CellNo` AS `CellNo`,`st`.`WhatsApp` AS `WhatsApp`,`st`.`GuardianName` AS `GuardianName`,`st`.`GuardianCell` AS `GuardianCell`,`st`.`GuardianRelation` AS `GuardianRelation`,`st`.`GuardianWhatsApp` AS `GuardianWhatsApp`,`st`.`GuardianEmail` AS `GuardianEmail`,`st`.`Remarks` AS `Remarks`,`st`.`UserName` AS `UserName`,`st`.`Password` AS `Password`,`st`.`IsActive` AS `IsActive` from `student` `st`;

-- ----------------------------
-- View structure for vw_task
-- ----------------------------
DROP VIEW IF EXISTS `vw_task`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_task` AS select `tsk`.`Id` AS `Id`,`tsk`.`UserId` AS `UserId`,`env`.`Value` AS `User`,`tsk`.`StatusId` AS `StatusId`,`env2`.`Value` AS `TaskStatus`,`tsk`.`Title` AS `Title`,`tsk`.`SP` AS `SP`,`tsk`.`Description` AS `Description`,`tsk`.`IsActive` AS `IsActive` from ((`task` `tsk` join `enumvalue` `env` on((`tsk`.`UserId` = `env`.`Id`))) join `enumvalue` `env2` on((`tsk`.`StatusId` = `env2`.`Id`)));

-- ----------------------------
-- View structure for vw_taskcomment
-- ----------------------------
DROP VIEW IF EXISTS `vw_taskcomment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_taskcomment` AS select `tsk`.`Id` AS `Id`,`tsk`.`TaskId` AS `TaskId`,`tk`.`Title` AS `TaskTitle`,`tsk`.`Comment` AS `Comment`,`env`.`Value` AS `User`,`tsk`.`Time` AS `Datetime`,`tsk`.`IsActive` AS `IsActive` from ((`taskcomment` `tsk` join `enumvalue` `env` on((`tsk`.`UserId` = `env`.`Id`))) join `task` `tk` on((`tsk`.`TaskId` = `tk`.`Id`)));

-- ----------------------------
-- View structure for vw_userrole
-- ----------------------------
DROP VIEW IF EXISTS `vw_userrole`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_userrole` AS select `ur`.`Id` AS `Id`,`ur`.`UserId` AS `UserId`,`us`.`UserName` AS `User`,`ur`.`RoleId` AS `RoleId`,`ro`.`Name` AS `Role`,`ur`.`IsActive` AS `IsActive` from ((`userrole` `ur` join `user` `us` on((`ur`.`UserId` = `us`.`Id`))) join `role` `ro` on((`ur`.`RoleId` = `ro`.`Id`)));

-- ----------------------------
-- Procedure structure for AlterAction
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterAction`;
delimiter ;;
CREATE PROCEDURE `AlterAction`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from action
			where
			action.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update action set IsActive=1
			where 
			action.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update action set IsActive=0
			where
			action.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterController
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterController`;
delimiter ;;
CREATE PROCEDURE `AlterController`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from controller
			where
			controller.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update controller set IsActive=1
			where 
			controller.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update controller set IsActive=0
			where
			controller.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterCustomer
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterCustomer`;
delimiter ;;
CREATE PROCEDURE `AlterCustomer`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from customer
			where
			customer.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update customer set IsActive=1
			where 
			customer.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update customer set IsActive=0
			where
			customer.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterFeature
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterFeature`;
delimiter ;;
CREATE PROCEDURE `AlterFeature`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from feature
			where
			feature.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update feature set IsActive=1
			where 
			feature.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update feature set IsActive=0
			where
			feature.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterInvoice
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterInvoice`;
delimiter ;;
CREATE PROCEDURE `AlterInvoice`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from invoice
			where
			invoice.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update invoice set IsActive=1
			where 
			invoice.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update invoice set IsActive=0
			where
			invoice.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterInvoiceLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterInvoiceLine`;
delimiter ;;
CREATE PROCEDURE `AlterInvoiceLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from invoice_line
			where
			invoice_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update invoice_line set IsActive=1
			where 
			invoice_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update invoice_line set IsActive=0
			where
			invoice_line.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterItem
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterItem`;
delimiter ;;
CREATE PROCEDURE `AlterItem`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from item
			where
			item.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update item set IsActive=1
			where 
			item.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update item set IsActive=0
			where
			item.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterLecture`;
delimiter ;;
CREATE PROCEDURE `AlterLecture`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from lecture
			where
			lecture.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update lecture set IsActive=1
			where 
			lecture.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update lecture set IsActive=0
			where
			lecture.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterQuotation
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterQuotation`;
delimiter ;;
CREATE PROCEDURE `AlterQuotation`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from quotation
			where
			quotation.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update quotation set IsActive=1
			where 
			quotation.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update quotation set IsActive=0
			where
			quotation.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterQuotationLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterQuotationLine`;
delimiter ;;
CREATE PROCEDURE `AlterQuotationLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from quotation_line
			where
			quotation_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update quotation_line set IsActive=1
			where 
			quotation_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update quotation_line set IsActive=0
			where
			quotation_line.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterRequestNote
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterRequestNote`;
delimiter ;;
CREATE PROCEDURE `AlterRequestNote`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from request_note
			where
			request_note.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update request_note set IsActive=1
			where 
			request_note.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update request_note set IsActive=0
			where
			request_note.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterRequestNoteLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterRequestNoteLine`;
delimiter ;;
CREATE PROCEDURE `AlterRequestNoteLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from request_note_line
			where
			request_note_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update request_note_line set IsActive=1
			where 
			request_note_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update request_note_line set IsActive=0
			where
			request_note_line.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterResource
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterResource`;
delimiter ;;
CREATE PROCEDURE `AlterResource`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from resource
			where
			resource.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update resource set IsActive=1
			where 
			resource.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update resource set IsActive=0
			where
			resource.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterResourcePermission
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterResourcePermission`;
delimiter ;;
CREATE PROCEDURE `AlterResourcePermission`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from resourcepermission
			where
			resourcepermission.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update resourcepermission set IsActive=1
			where 
			resourcepermission.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update resourcepermission set IsActive=0
			where
			resourcepermission.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterRoles
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterRoles`;
delimiter ;;
CREATE PROCEDURE `AlterRoles`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from role
			where
			role.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update role set IsActive=1
			where 
			role.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update role set IsActive=0
			where
			role.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterSaleOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterSaleOrder`;
delimiter ;;
CREATE PROCEDURE `AlterSaleOrder`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from sale_order
			where
			sale_order.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update sale_order set IsActive=1
			where 
			sale_order.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update sale_order set IsActive=0
			where
			sale_order.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterSaleOrderLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterSaleOrderLine`;
delimiter ;;
CREATE PROCEDURE `AlterSaleOrderLine`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from sale_order_line
			where
			sale_order_line.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update sale_order_line set IsActive=1
			where 
			sale_order_line.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update sale_order_line set IsActive=0
			where
			sale_order_line.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterStudent
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterStudent`;
delimiter ;;
CREATE PROCEDURE `AlterStudent`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from student
			where
			student.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update student set IsActive=1
			where 
			student.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update student set IsActive=0
			where
			student.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterStudentLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterStudentLecture`;
delimiter ;;
CREATE PROCEDURE `AlterStudentLecture`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from studentlecture
			where
			studentlecture.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update studentlecture set IsActive=1
			where 
			studentlecture.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update studentlecture set IsActive=0
			where
			studentlecture.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterTaskComments
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterTaskComments`;
delimiter ;;
CREATE PROCEDURE `AlterTaskComments`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
            delete from taskComment
			where
			taskcomment.Id=id ; 
        END if;
IF filter = 'Activate'
        then
            update taskcomment set IsActive=1
			where 
			taskcomment.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update taskcomment set IsActive=0
			where
			taskcomment.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterTasks
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterTasks`;
delimiter ;;
CREATE PROCEDURE `AlterTasks`(in id int, in filter varchar(50))
BEGIN
IF filter = 'Delete'
    then
		delete from taskcomment
        where taskcomment.TaskId=id;
            delete from task 
			where
			task.Id=id; 
        END if;
IF filter = 'Activate'
        then
            update taskcomment set IsActive=1
			where 
			taskcomment.TaskId=id ;
            update task set IsActive=1
			where 
			task.Id=id ;
        END if;
IF filter = 'DeActivate'
        then
            update taskcomment set IsActive=0
			where 
			taskcomment.TaskId=id ;
            update task set IsActive=0
			where
			task.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterUserRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterUserRole`;
delimiter ;;
CREATE PROCEDURE `AlterUserRole`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from userrole
			where
			userrole.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update userrole set IsActive=1
			where 
			userrole.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update userrole set IsActive=0
			where
			userrole.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for AlterUsers
-- ----------------------------
DROP PROCEDURE IF EXISTS `AlterUsers`;
delimiter ;;
CREATE PROCEDURE `AlterUsers`(in id int, in DBoperation varchar(50))
BEGIN
IF DBoperation = 'Delete'
    then
            delete from user
			where
			user.Id=id ; 
        END if;
IF DBoperation = 'Activate'
        then
            update user set IsActive=1
			where 
			user.Id=id ;
        END if;
IF DBoperation = 'DeActivate'
        then
            update user set IsActive=0
			where
			user.Id=id; 
        END if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetEnumValues
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetEnumValues`;
delimiter ;;
CREATE PROCEDURE `GetEnumValues`(in enumTypeId int)
BEGIN
	select * from enumvalue where enumvalue.EnumTypeId=enumTypeId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetMaxId
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetMaxId`;
delimiter ;;
CREATE PROCEDURE `GetMaxId`(IN `prm_TableName` VARCHAR ( 200 ))
BEGIN
	
	SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` );
	PREPARE stmt1 
	FROM
		@QueryStr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for GetNextId
-- ----------------------------
DROP PROCEDURE IF EXISTS `GetNextId`;
delimiter ;;
CREATE PROCEDURE `GetNextId`(IN `prm_TableName` VARCHAR ( 200 ))
BEGIN
SET @QueryStr = 'SELECT COALESCE(MAX(Id), 0) FROM ';
	
	SET @QueryStr = CONCAT( @QueryStr, `prm_TableName` );
	PREPARE stmt1 
	FROM
		@QueryStr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageAction
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageAction`;
delimiter ;;
CREATE PROCEDURE `ManageAction`(in id int,
        in controllerId int,
        in name varchar(50),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into action (Id,ControllerId,Name, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,controllerId,name, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update action set 
                          ControllerId=controllerId,
                          Name=name,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where action.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageController
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageController`;
delimiter ;;
CREATE PROCEDURE `ManageController`(in id int,
        in featureId int,
        in name varchar(50),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into controller (Id,FeatureId,Name, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,name, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update controller set 
                          FeatureId=featureId,
                          Name=name,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where controller.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageCustomer
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageCustomer`;
delimiter ;;
CREATE PROCEDURE `ManageCustomer`(in id int ,
        in paymentTermsId int,
        in secondaryCellNo varchar(50) ,
        in secondaryEmail  varchar(150),
        in customerName varchar(150),
        in primaryCellNo varchar(50),
        in primaryEmail varchar(150),
        in customerSince datetime,
        in cityId int,
        in address varchar(500),
        in creditLimit int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into customer (Id,CustomerSince,CustomerName,PrimaryCellNo,SecondaryCellNo,PrimaryEmail,SecondaryEmail,PaymentTermsId,CityId,Address,CreditLimit, CreatedOn, 
           CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,customerSince,customerName,primaryCellNo,secondaryCellNo,primaryEmail,secondaryEmail,paymentTermsId,cityId,address,creditLimit, createdOn, createdById,
           modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update customer set 
						CustomerName=IFNULL(CustomerName, customerName ),
                          CustomerSince=IFNULL(CustomerSince, customerSince ),
                          PrimaryCellNo=IFNULL(PrimaryCellNo, primaryCellNo ),
                          SecondaryCellNo=IFNULL(SecondaryCellNo, secondaryCellNo ),
                          PrimaryEmail=IFNULL(PrimaryEmail, primaryEmail ),
                          SecondaryEmail=IFNULL(SecondaryEmail, secondaryEmail ),
                          PaymentTermsId=IFNULL(PaymentTermsId, paymentTermsId ),
                          CityId=IFNULL(CityId, cityId ),
                          Address=IFNULL(Address, address ),
                          CreditLimit=IFNULL(CreditLimit, creditLimit ),
                          CreatedOn=IFNULL(CreatedOn, createdOn ),
                          CreatedById=IFNULL(CreatedById, createdById ),
                          ModifiedOn=IFNULL(ModifiedOn, modifiedOn ),
                          ModifiedById=IFNULL(ModifiedById, modifiedById ),
						  IsActive=IFNULL(IsActive, isActive )						 
             where customer.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageFeature
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageFeature`;
delimiter ;;
CREATE PROCEDURE `ManageFeature`(in id int,
        in name varchar(50),
        in description varchar(8000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into feature (Id,Name,Description, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,name,description, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
     
          update feature set  
						  Name= name,
                          Description= description,
                          CreatedOn = createdOn,
                          CreatedById =createdById,
                          ModifiedOn = modifiedOn,
                          ModifiedById = modifiedById ,
						  IsActive = isActive 				 
             where feature.Id =id;
      end if;
      
  
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageInvoice
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageInvoice`;
delimiter ;;
CREATE PROCEDURE `ManageInvoice`(in   id int ,			
	         in  clientName varchar(100) ,
			 in   clientPoNo int,
			 in  saleOrder varchar(45),
			 in  reference varchar(45),
			 in  task varchar(45),
			 in  deliverables varchar(45),
			 in  paymentTerm int,
			 in  paymentMethod int,
			 in  status int ,
			 in description varchar(8000),
			 in   taxMethod  int,
			 in   taxPercent int,
			 in  taxValue int,
			 in  shipmentCharges int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into invoice   (Id, ClientName, ClientPoNo, SaleOrder, Reference, Task,
           Deliverables,PaymentTerm,PaymentMethod, Status , Description , TaxMethod , TaxPercent,
           TaxValue,ShipmentCharges,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )values (id, clientName, clientPoNo, saleOrder, reference, task,
           deliverables,paymentTerm,paymentMethod, status , description , taxMethod , taxpercent,
           taxvalue,shipmentCharges,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update invoice set 
						  ClientName =clientName,
	                      ClientPoNo = clientPoNo,
						  SaleOrder =saleOrder,
						  Reference = reference,
						  Task = task,
						  Deliverables = deliverables,
						  PaymentTerm = paymentTerm,
						  PaymentMethod = paymentMethod,
						  Status = status,
						  Description = description,
						  TaxMethod = taxMethod,
						  Taxpercent = taxPercent,
						  Taxvalue=taxValue,
						  ShipmentCharges=shipmentCharges,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where invoice.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageInvoiceLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageInvoiceLine`;
delimiter ;;
CREATE PROCEDURE `ManageInvoiceLine`(in id int,
			   in invoiceId int ,
               in invoiceItemId int,
			   in invoiceStagedId int,
			   in invoiceGroupId int,
			   in itemType varchar(45),
			   in itemCategory varchar(45),
			   in itemName varchar(500),
			   in sKU int,
			   in qTY int,
			   in uOM int,
			   in currency int,
			   in unitPrice int,
			   in lineTotal int,
               in createdOn datetime,
               in createdById int,
			   in modifiedOn datetime,
               in modifiedById int,
               in isActive bit,
               in DBoperation varchar(500))
BEGIN
/*insert*/
if DBoperation = 'Insert'
    then
           insert into invoice_line (Id, InvoiceId,InvoiceItemId, InvoiceStagedId, InvoiceGroupId, 
           ItemType,ItemCategory, ItemName,SKU,QTY, UOM , Currency , UnitPrice , LineTotal,
           CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive)
           values(id, invoiceId,invoiceItemId, invoiceStagedId, invoiceGroupId, 
           itemType,itemCategory, itemName,sKU,qTY, uOM , currency , unitPrice , lineTotal,
           createdOn, createdById, modifiedOn, modifiedById, isActive) ;
		   
   end if;
   /*update*/
 if DBoperation ='Update'
   then
            update invoice_line set  
                          InvoiceId= invoiceId,
                          InvoiceItemId=invoiceItemId,
	                      InvoiceStagedId = invoiceStagedId,
						  InvoiceGroupId =invoiceGroupId,
						  ItemType = itemType,
						  ItemCategory = itemCategory,
						  ItemName = itemName,
						  SKU = sKU,
						  QTY = qTY,
						  UOM = uOM,
						  Currency = currency,
						  UnitPrice = unitPrice,
						  LineTotal = lineTotal,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             WHERE   invoice_line.Id =id ;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageItem
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageItem`;
delimiter ;;
CREATE PROCEDURE `ManageItem`(in id int,
        in itemCode int,
        in systemRefNo int,
        in itemName varchar(200),
        in salePrice int,
        in hSCode varchar(45),
        in itemDescription varchar(8000),
        in sourceId int,
        in brandId int,
		in categoryId int,
        in subCategoryId int,
        in uoMId int,
        in standardWeightId int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
           insert into item (Id,ItemCode,ItemName,SalePrice,SystemRefNo,HSCode,ItemDescription,SourceId,BrandId,CategoryId, 
           SubCategoryId,UoMId,StandardWeightId,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  
           values (id,itemCode,itemName,salePrice,systemRefNo,hSCode,itemDescription,sourceId,brandId,categoryId,subCategoryId
           , uoMId,standardWeightId,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update item set 
                          ItemCode=itemCode,
                          ItemName=itemName,
                          SalePrice=salePrice,
                          SystemRefNo=systemRefNo,
                          HSCode=hSCode,
                          ItemDescription=itemDescription,
                          SourceId=sourceId,
                          BrandId=brandId,
                          CategoryId=categoryId,
                          SubCategoryId=subCategoryId,
                          UoMId=uoMId,
                          StandardWeightId=standardWeightId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where item.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageLecture`;
delimiter ;;
CREATE PROCEDURE `ManageLecture`(in id int,
        in title varchar(100),
        in description varchar(8000),
        in lectureURL varchar(500),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into lecture (Id,Title,Description,LectureURL, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,title,description,lectureURL, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update lecture set 
                          Title=title,
                          Description=description,
                          LectureURL=lectureURL,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where lecture.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageQuotation
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageQuotation`;
delimiter ;;
CREATE PROCEDURE `ManageQuotation`(in   id int ,			
	         in  applyDiscount int ,
			 in  title  varchar(100),
			 in  clientName varchar(100),
			 in  quoteValidity datetime,
			 in  discountType int,
			 in  discountMethod int,
			 in  discount int,
			 in  shipTo int,
			 in  deliveryDate datetime,
             in  deliveryMethod int,
             in statusRequired int,
             in description varchar(8000),
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into quotation   (Id, ApplyDiscount, Title, ClientName, QuoteValidity, DiscountType, DiscountMethod,Discount,
           ShipTo,DeliveryDate,DeliveryMethod,StatusRequired,Description,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, applyDiscount, title, clientName, quoteValidity, discountType,discountMethod,discount,
           shipTo,deliveryDate,deliveryMethod,statusRequired,description,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update quotation set 
						  ApplyDiscount =applyDiscount,
	                      Title = title,
						  ClientName =clientName,
						  QuoteValidity = quoteValidity,
						  DiscountType = discountType,
						  DiscountMethod = discountMethod,
						  Discount = discount,
						  ShipTo = shipTo,
						  DeliveryDate=deliveryDate,
                          DeliveryMethod=deliveryMethod,
                          StatusRequired=statusRequired,
                          DeliveryMethod=deliveryMethod,
                          Description=description,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where quotation.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageQuotationLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageQuotationLine`;
delimiter ;;
CREATE PROCEDURE `ManageQuotationLine`(in   id int ,			
	         in  quotationId int ,
			 in  name  varchar(100),
			 in  qTY int,
			 in  uOM int,
			 in  lineTotal int,
			 in  discountMethod int,
			 in  discountValue int,
			 in  totalDiscountPrice int,
			 in  shipmentCharges int,
             in  netTotal int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into quotation_line   (Id, QuotationId, Name, QTY, UOM, LineTotal, DiscountMethod,DiscountValue,
           TotalDiscountPrice,ShipmentCharges,NetTotal,CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, quotationId, name, qTY, uOM, lineTotal,discountMethod,discountValue,
           totalDiscountPrice,shipmentCharges,netTotal,createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update quotation_line set 
						  QuotationId =quotationId,
	                      Name = name,
						  QTY =qTY,
						  UOM = uOM,
						  LineTotal = lineTotal,
						  DiscountMethod = discountMethod,
						  DiscountValue = discountValue,
						  TotalDiscountPrice = totalDiscountPrice,
						  ShipmentCharges=shipmentCharges,
                          NetTotal=netTotal,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where quotation_line.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageRequestNote
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageRequestNote`;
delimiter ;;
CREATE PROCEDURE `ManageRequestNote`(in   id int ,			
	         in  TypeId int ,
			 in   CategoryId int,
			 in  StatusId int,
			 in  RequesterTypeId int,
			 in  Title varchar(100),
			 in  RequiredBefore datetime,
			 in  Reason varchar(100),
			 in description varchar(8000),
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into request_note   (Id, TypeId, CategoryId, StatusId, RequesterTypeId, Title,
           RequiredBefore,Reason, Description , CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, typeId, categoryId, statusId, requesterTypeId, title,
           requiredBefore,reason , description , createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update request_note set 
						  TypeId =typeId,
	                      CategoryId = categoryId,
						  StatusId =statusId,
						  RequesterTypeId = requesterTypeId,
						  Title = title,
						  RequiredBefore = requiredBefore,
						  Reason = reason,
						  Description = description,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where request_note.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageRequestNoteLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageRequestNoteLine`;
delimiter ;;
CREATE PROCEDURE `ManageRequestNoteLine`(in   id int ,			
	         in  requestNoteId int,
			 in   uOMId int,
			 in  itemName varchar(100),
			 in  requestedQty int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into request_note_line   (Id, RequestNoteId, UOMId, ItemName, RequestedQty, 
           CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, requestNoteId, uOMId, itemName, requestedQty,
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update request_note_line set 
						  RequestNoteId =requestNoteId,
	                      UOMId = uOMId,
						  ItemName =itemName,
						  RequestedQty = requestedQty,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where request_note_line.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageResource
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageResource`;
delimiter ;;
CREATE PROCEDURE `ManageResource`(in id int,
        in featureId int,
        in controllerId int,
        in actionId int,
        in resourceValue varchar(50),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into resource (Id,FeatureId,ControllerId,ActionId,ResourceValue, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,controllerId,actionId,resourceValue, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update resource set 
                          FeatureId=featureId,
                          ControllerId=controllerId,
                          ActionId=actionId,
                          ResourceValue=resourceValue,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where resource.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageResourcePermissions
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageResourcePermissions`;
delimiter ;;
CREATE PROCEDURE `ManageResourcePermissions`(in id int,
        in featureId int,
        in userId int,
        in roleId int,
        in resourceId int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into resourcepermission (Id,FeatureId,UserId,RoleId,ResourceId, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,featureId,userId,roleId,resourceId, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update resourcepermission set 
                          FeatureId=featureId,
                          UserId=userId,
                          RoleId=roleId,
                          ResourceId=resourceId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where resourcepermission.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageRole`;
delimiter ;;
CREATE PROCEDURE `ManageRole`(in id int,
        in name varchar(50),
        in responsibility varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into role (Id,Name,Responsibility, CreatedOn, CreatedById, ModifiedOn,
           ModifiedById, IsActive )  values (id,name,responsibility, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update role set 
                          Name=name,
                          Responsibility=responsibility,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where role.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageSaleOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageSaleOrder`;
delimiter ;;
CREATE PROCEDURE `ManageSaleOrder`(in   id int ,			
	         in  customerId  int ,
             in balance int,
             in total int,
             in discount int,
             in netPayable int,
			 in   statusId int,
			 in  clientSoNo int,
			 in  paymentTerm  varchar(100),
			 in  paymentMethod varchar(100),
			 in  reference int,
			 in description varchar(8000),
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into sale_order   (Id, CustomerId,Balance,Total,Discount,NetPayable, StatusId, ClientSoNo, PaymentTerm, PaymentMethod,
           Reference, Description , CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, customerId,balance,total,discount,netPayable, statusId, clientSoNo, paymentTerm, paymentMethod,
           reference , description , createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update sale_order set 
						  CustomerId =customerId,
                          Balance=balance,
                          Total=total,
                          Discount=discount,
	                      StatusId = statusId,
                          NetPayable=netPayable,
						  ClientSoNo =clientSoNo,
						  PaymentTerm = paymentTerm,
						  PaymentMethod = paymentMethod,
						  Reference = reference,
						  Description = description,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where sale_order.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageSaleOrderLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageSaleOrderLine`;
delimiter ;;
CREATE PROCEDURE `ManageSaleOrderLine`(in   id int ,			
	         in  saleOrderId int ,
			 in  itemName varchar(150),
             in itemCode int,
             in uOMId int,
			 in qTY int,
			 in price int,
			 in lineTotal int,
			 in  itemType varchar(100),
			 in  itemCategory int,
             in createdOn datetime,
			 in createdById int,
             in modifiedOn datetime,
             in modifiedById int,
             in isActive bit,
             in DBoperation varchar(50))
BEGIN


/*insert*/
if DBoperation = 'Insert'
then
    
           insert into sale_order_line   (Id, SaleOrderId, ItemName,ItemCode,UOMId,QTY,
           Price,lineTotal, ItemType, ItemCategory, 
           CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )
           values (id, saleOrderId, itemName,itemCode,uOMId,qTY,price,lineTotal, itemType, itemCategory, 
           createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then

               update sale_order_line set 
						  SaleOrderId =saleOrderId,
	                      ItemName = itemName,
                          ItemCode=itemCode,
                          UOMId=uOMId,
                          QTY=qTY,
                          Price=price,
                          LineTotal=lineTotal,
						  ItemType =itemType,
						  ItemCategory = itemCategory,
						  CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive		
             where sale_order_line.Id =id;
   end if;

end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageStudent
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageStudent`;
delimiter ;;
CREATE PROCEDURE `ManageStudent`(in id int,
        in studentName varchar(100),
        in gender char,
		in cNIC varchar(15),
        in dOB datetime,
		in cellNo varchar(45),
        in email varchar(45),
        in whatsApp varchar(45),
        in guardianName varchar(45),
		in guardianCell varchar(45),
        in guardianRelation varchar(45),
        in guardianWhatsApp varchar(45) ,
        in guardianEmail varchar(45),
        in guardianOccupation varchar(45),
        in remarks varchar(500),
        in userName varchar(100),
        in password varchar(45),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then    
           insert into student (Id,StudentName,Gender,CNIC,DOB,CellNo,Email,WhatsApp,GuardianName,
           GuardianCell,GuardianRelation,GuardianWhatsApp,GuardianEmail,GuardianOccupation,Remarks,UserName,Password, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive )  
           values 
           (id,studentName,gender,cNIC,dOB,cellNo,email,whatsApp,guardianName,guardianCell,
           guardianRelation,guardianWhatsApp,guardianEmail,guardianOccupation,remarks,userName,password,createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update student set 
                          StudentName=studentName,
                          Gender=gender,
                          CNIC=cNIC,
                          DOB=dOB,
                          CellNo=cellNo,
                          Email=email,
                          WhatsApp=whatsApp,
                          GuardianName=guardianName,
                          GuardianCell=guardianCell,
                          GuardianRelation=guardianRelation,
                          GuardianWhatsApp=guardianWhatsApp,
                          GuardianEmail=guardianEmail,
                          GuardianOccupation=guardianOccupation,
                          Remarks=remarks,
                          UserName=userName,
                          Password=password,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where student.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageStudentLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageStudentLecture`;
delimiter ;;
CREATE PROCEDURE `ManageStudentLecture`(in id int,
        in studentId int,
        in lectureId int,
        in assignedOn datetime,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into studentlecture (Id,StudentId,LectureId,AssignedOn, CreatedOn, CreatedById,
           ModifiedOn, ModifiedById, IsActive ) 
           values (id,studentId,lectureId,assignedOn, createdOn, createdById, modifiedOn,
           modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update studentlecture set 
                          StudentId=studentId,
                          LectureId=lectureId,
                          AssignedOn=assignedOn,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where studentlecture.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageTask
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageTask`;
delimiter ;;
CREATE PROCEDURE `ManageTask`(in id int,
        in userId int,
        in moduleId int,
        in statusId int,
        in title varchar(300),
        in sP int,
        in description varchar(5000),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50))
BEGIN
if filter = 'Insert'
then
    
           insert into task (Id,UserId,ModuleId,StatusId,Title,SP,Description, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,userId,moduleId,statusId,title,sP,description, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if filter ='Update'
 then
            update task set 
                          UserId=userId,
                          ModuleId=moduleId,
                          StatusId=statusId,
                          Title=title,
                          Description=description,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where task.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageTaskComment
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageTaskComment`;
delimiter ;;
CREATE PROCEDURE `ManageTaskComment`(in id int,
        in taskId int,
        in userId int,
        in comment varchar(500),
        in time datetime,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in filter varchar(50))
BEGIN
if filter = 'Insert'
then
    
           insert into taskcomment (Id,TaskId,UserId,Comment,Time, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive ) 
           values (id,taskId,userId,comment,time,  createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if filter ='Update'
 then
            update taskcomment set 
                          TaskId=taskId,
                          UserId=userId,
                          Comment=comment,
                          Time=time,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where taskcomment.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageUser`;
delimiter ;;
CREATE PROCEDURE `ManageUser`(in id int,
        in userName varchar(50),
        in password varchar(45),
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into user (Id,UserName,Password, CreatedOn, CreatedById, ModifiedOn,
           ModifiedById, IsActive ) 
           values (id,userName,password, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update user set 
                          UserName=userName,
                          password=Password,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where user.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ManageUserRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `ManageUserRole`;
delimiter ;;
CREATE PROCEDURE `ManageUserRole`(in id int,
        in roleId int,
        in userId int,
        in createdOn datetime,
        in createdById int,
        in modifiedOn datetime,
        in modifiedById int,
        in isActive bit,
        in DBoperation varchar(50))
BEGIN
if DBoperation = 'Insert'
then
    
           insert into userrole (Id,RoleId,UserId, CreatedOn, CreatedById, ModifiedOn, ModifiedById, IsActive )  values (id,roleId,userId, createdOn, createdById, modifiedOn, modifiedById, isActive );
 end if;   
/*update*/
 if DBoperation ='Update'
 then
            update userrole set 
                          RoleId=roleId,
                          UserId=userId,
                          CreatedOn=createdOn,
                          CreatedById=createdById,
                          ModifiedOn=modifiedOn,
                          ModifiedById=modifiedById,
						  IsActive=isActive						 
             where userrole.Id =id;
   end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchAction
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchAction`;
delimiter ;;
CREATE PROCEDURE `SearchAction`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			action  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchController
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchController`;
delimiter ;;
CREATE PROCEDURE `SearchController`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			controller  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchCustomer
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchCustomer`;
delimiter ;;
CREATE PROCEDURE `SearchCustomer`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_customers`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchFeature
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchFeature`;
delimiter ;;
CREATE PROCEDURE `SearchFeature`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			feature  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchInvoice
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchInvoice`;
delimiter ;;
CREATE PROCEDURE `SearchInvoice`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * FROM  `vw_invoices`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchItem
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchItem`;
delimiter ;;
CREATE PROCEDURE `SearchItem`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_items`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchLecture`;
delimiter ;;
CREATE PROCEDURE `SearchLecture`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			lecture  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchQuotation
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchQuotation`;
delimiter ;;
CREATE PROCEDURE `SearchQuotation`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_quotations`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchRequestNote
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchRequestNote`;
delimiter ;;
CREATE PROCEDURE `SearchRequestNote`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * FROM  `vw_request_notes`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchResource
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchResource`;
delimiter ;;
CREATE PROCEDURE `SearchResource`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			resource  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchResourcePermissions
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchResourcePermissions`;
delimiter ;;
CREATE PROCEDURE `SearchResourcePermissions`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_resourcepermission`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchRoles
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchRoles`;
delimiter ;;
CREATE PROCEDURE `SearchRoles`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			role  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchSaleOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchSaleOrder`;
delimiter ;;
CREATE PROCEDURE `SearchSaleOrder`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_saleorders`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchStudent
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchStudent`;
delimiter ;;
CREATE PROCEDURE `SearchStudent`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_students`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchStudentLecture
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchStudentLecture`;
delimiter ;;
CREATE PROCEDURE `SearchStudentLecture`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_studentlectures`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchTaskComments
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchTaskComments`;
delimiter ;;
CREATE PROCEDURE `SearchTaskComments`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			vw_taskcomment ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchTasks
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchTasks`;
delimiter ;;
CREATE PROCEDURE `SearchTasks`(in whereClause varchar(5000))
BEGIN

     set @querystr ='SELECT * 
			FROM
			vw_task ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchUserRole
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchUserRole`;
delimiter ;;
CREATE PROCEDURE `SearchUserRole`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			`vw_userrole`  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for SearchUsers
-- ----------------------------
DROP PROCEDURE IF EXISTS `SearchUsers`;
delimiter ;;
CREATE PROCEDURE `SearchUsers`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT * 
			FROM
			user  ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
