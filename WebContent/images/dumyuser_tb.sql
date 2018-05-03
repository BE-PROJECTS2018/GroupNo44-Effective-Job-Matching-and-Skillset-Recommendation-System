/*
MySQL Data Transfer
Source Host: localhost
Source Database: freelancerdb
Target Host: localhost
Target Database: freelancerdb
Date: 3/12/2016 3:18:39 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for dumyuser_tb
-- ----------------------------
DROP TABLE IF EXISTS `dumyuser_tb`;
CREATE TABLE `dumyuser_tb` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `dumyuser_tb` VALUES ('1', 'Hitesh Patil', 'Male', 'Airoli', '9236541236', 'hitesh@gmail.com', 'hitesh.jpg');
INSERT INTO `dumyuser_tb` VALUES ('2', ' Rohan Shinde', 'Male', 'Koparkhairane', '9632145876', 'rohan@gmail.com', 'rohan.jpg');
INSERT INTO `dumyuser_tb` VALUES ('3', ' Niranjan Andhale', 'Male', 'Kharghar', '9825362541', 'phitesh995@gmail.com', 'niranjan.jpg');
INSERT INTO `dumyuser_tb` VALUES ('4', 'Sanika Kadam', 'Female', 'Koparkhairane', '9635874215', 'kadamsanika0808@gmail.com', 'sanika.jpg');
INSERT INTO `dumyuser_tb` VALUES ('5', 'Sanjay Nikam', 'Male', 'Thane', '9685563225', 'psanjay@gmail.com', 'sanjay.jpg');
