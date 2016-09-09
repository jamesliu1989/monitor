CREATE DATABASE monitor DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

USE monitor;

#用户信息表user
 CREATE TABLE user (
id int NOT NULL AUTO_INCREMENT,
userName varchar(32) NOT NULL,
passWord varchar(32) NOT NULL,
email varchar(30),
phone varchar(11),
active int NOT NULL DEFAULT 0,
flag int NOT NULL DEFAULT 0,
regDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#控制器信息表
 CREATE TABLE CTRLER_INFO (
ID int NOT NULL AUTO_INCREMENT,
CTRLER_NO INT NOT NULL,
NODE_NUM INT NOT NULL DEFAULT 0,
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#节点信息表
 CREATE TABLE NODE_INFO (
ID int NOT NULL AUTO_INCREMENT,
NODE_NO VARCHAR(20) NOT NULL,
NODE_NAME VARCHAR(32) NOT NULL,
AREA_NAME varchar(32) NOT NULL,
CTRLER_NO INT NOT NULL,
NODE_DESC VARCHAR(100),
STATUS TINYINT(1) DEFAULT 0,
ALERT int DEFAULT 0,
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#区域信息表
 CREATE TABLE AREA_INFO (
ID int NOT NULL AUTO_INCREMENT,
AREA_NAME varchar(32) NOT NULL,
NODE_NUM int NOT NULL,
MAX_TEMP_MED DOUBLE,
MIN_TEMP_MED DOUBLE,
AVG_TEMP_MED DOUBLE,
MAX_TEMP_ENV DOUBLE,
MIN_TEMP_ENV DOUBLE,
AVG_TEMP_ENV DOUBLE,
ALERT int,
NODES VARCHAR(500),
PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#常规数据表
CREATE TABLE `regular_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CTRLER_NO` int(11) NOT NULL COMMENT '控制器号',
  `NODE_NO` int(11) NOT NULL COMMENT '节点编号',
  `TEMP_MED` double DEFAULT NULL COMMENT '介质温度',
  `TEMP_ENV` double DEFAULT NULL COMMENT '环境温度',
  `SMOG_ALERT` int(11) DEFAULT NULL COMMENT '烟雾报警：{烟雾报警：{1：无，0：有}',
  `BATTERY_VOL` double DEFAULT NULL COMMENT '电池电压',
  `WIRELESS_SIG` int(11) DEFAULT NULL COMMENT '无线信号',
  `COLLECT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '采集时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#节点日报表
CREATE TABLE `monitor`.`report_daily_node` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NODE_NO` VARCHAR(20) NOT NULL COMMENT '节点编号',
  `TEMP_MED_MAX` DOUBLE NULL COMMENT '介质最高温度',
  `TEMP_MED_MIN` DOUBLE NULL COMMENT '介质最低温度',
  `TEMP_MED_AVG` DOUBLE NULL COMMENT '介质平均温度',
  `TEMP_ENV_MAX` DOUBLE NULL COMMENT '环境最高温度',
  `TEMP_ENV_MIN` DOUBLE NULL COMMENT '环境最低温度',
  `TEMP_ENV_AVG` DOUBLE NULL COMMENT '环境平均温度',
  `TEMP_DEV_ABS` DOUBLE NULL COMMENT '温差绝对值',
  `SMOG_ALERT` INT NULL COMMENT '烟雾报警',
  `BATTERY_VOL` DOUBLE NULL COMMENT '电池电压',
  `WIRELESS_SIG` INT NULL COMMENT '无线信号',
  `STATUS` INT NULL DEFAULT 0 COMMENT '工作状态',
  `ALERT` INT NULL DEFAULT 0 COMMENT '有无报警。0：无报警，1：温度报警，2：温差报警，3：烟雾报警',
  `day_of_year` VARCHAR(15) NOT NULL COMMENT '日',
  `month_of_year` VARCHAR(10) NOT NULL COMMENT '月',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

#区域日报表
CREATE TABLE `monitor`.`report_daily_area` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `AREA_NAME` VARCHAR(20) NOT NULL COMMENT '区域名称',
  `TEMP_MED_MAX` DOUBLE NULL COMMENT '介质最高温度',
  `TEMP_MED_MIN` DOUBLE NULL COMMENT '介质最低温度',
  `TEMP_MED_AVG` DOUBLE NULL COMMENT '介质平均温度',
  `TEMP_ENV_MAX` DOUBLE NULL COMMENT '环境最高温度',
  `TEMP_ENV_MIN` DOUBLE NULL COMMENT '环境最低温度',
  `TEMP_ENV_AVG` DOUBLE NULL COMMENT '环境平均温度',
  `TEMP_DEV_ABS` DOUBLE NULL COMMENT '温差绝对值',
  `SMOG_ALERT` INT NULL COMMENT '烟雾报警',
  `BATTERY_VOL` DOUBLE NULL COMMENT '电池电压',
  `WIRELESS_SIG` INT NULL COMMENT '无线信号',
  `STATUS` INT NULL DEFAULT 0 COMMENT '工作状态',
  `ALERT` INT NULL DEFAULT 0 COMMENT '有无报警。0：无报警，1：温度报警，2：温差报警，3：烟雾报警',
  `day_of_year` VARCHAR(15) NOT NULL COMMENT '日',
  `month_of_year` VARCHAR(10) NOT NULL COMMENT '月',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

#区域报警参数表
CREATE TABLE `monitor`.`area_alert_parameter` (
  `AREA_NAME` VARCHAR(20) NOT NULL COMMENT '区域名称',
  `TEMP_MED_MAX` DOUBLE NULL COMMENT '介质温度上限',
  `TEMP_MED_MIN` DOUBLE NULL COMMENT '介质温度下限',
  `TEMP_MED_DEV_ABS` DOUBLE NULL COMMENT '介质温差绝对值',
  `TEMP_MED_RATE` DOUBLE NULL COMMENT '介质温升速率',
  `MED_DEV` DOUBLE NULL COMMENT '介质极均差',
  `TEMP_ENV_MAX` DOUBLE NULL COMMENT '环境温度上限',
  `TEMP_ENV_MIN` DOUBLE NULL COMMENT '环境温度下限',
  `TEMP_ENV_DEV_ABS` DOUBLE NULL COMMENT '环境温差绝对值',
  `TEMP_ENV_RATE` DOUBLE NULL COMMENT '环境温升速率',
  `ENV_DEV` DOUBLE NULL COMMENT '环境极均差',
  `MIN_BATTERY_VOL` DOUBLE NULL COMMENT '电压下限',
  PRIMARY KEY (`AREA_NAME`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

#报警信息表
CREATE TABLE `monitor`.`area_alert_info` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `AREA_NAME` VARCHAR(20) NOT NULL COMMENT '区域名称',
  `NODE_NO` VARCHAR(20) NOT NULL COMMENT '节点编号',
  `ALERT_PROPERTY` INT(1) NOT NULL COMMENT '报警属性：1:预报警，2：报警',
  `ALERT_TYPE` VARCHAR(20) NOT NULL COMMENT '报警类型',
  `ALERT_VALUE` DOUBLE NOT NULL COMMENT '报警数值',
  `ALERT_MEASUREMENT` VARCHAR(20) NULL COMMENT '报警单位',
  `ALERT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报警时间',
  `ALERT_REMARKS` VARCHAR(20) NULL COMMENT '备注',
  `IS_READ` INT(1) NOT NULL COMMENT '是否已读：0:未读，1：已读',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

#报警信息表
CREATE TABLE `monitor`.`system` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `COM_PORT` VARCHAR(20) NOT NULL COMMENT 'COM号',
  `BAUD_RATE` VARCHAR(20) NOT NULL COMMENT '波特率',
  `COLLECT_CYCLE` DOUBLE NOT NULL COMMENT '采集周期(分钟)',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

#控制器删除触发器
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `ctrler_delete` AFTER DELETE ON `ctrler_info` FOR EACH ROW 
 BEGIN
     DELETE FROM `area_info` WHERE `CTRLER_NO` = old.CTRLER_NO;
     DELETE  FROM `node_info` WHERE `CTRLER_NO` = old.CTRLER_NO;
END$$
DELIMITER ;
 
 #删除区域触发器
USE `monitor`;

DELIMITER $$

DROP TRIGGER IF EXISTS monitor.area_info_AFTER_DELETE$$
USE `monitor`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `monitor`.`area_info_AFTER_DELETE` AFTER DELETE ON `area_info` FOR EACH ROW
BEGIN
   DELETE FROM `area_alert_info` WHERE `AREA_NO` = old.AREA_NO;
   DELETE FROM `area_alert_parameter` WHERE `AREA_NO` = old.AREA_NO;
   DELETE FROM `report_daily_area` WHERE `AREA_NO` = old.AREA_NO;
   UPDATE `node_info` SET AREA_NO = concat('C', old.CTRLER_NO, '-未分区域'), STATUS = 0 WHERE AREA_NO = old.AREA_NO;
END$$
DELIMITER ;


#删除节点触发器
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `monitor`.`node_info_AFTER_DELETE` AFTER DELETE ON `node_info` FOR EACH ROW
BEGIN
   DELETE FROM `regular_data` WHERE `NODE_NO` = old.NODE_NO;
   DELETE FROM `report_daily_node` WHERE `NODE_NO` = old.NODE_NO;
END$$
DELIMITER ;

#0809增加湿度后的数据库变化
ALTER TABLE `monitor`.`regular_data` 
ADD COLUMN `HUMIDITY` DOUBLE NULL COMMENT '湿度' AFTER `TEMP_ENV`;

ALTER TABLE `monitor`.`system` 
ADD COLUMN `SHOW_HUMIDITY` TINYINT(1) NULL DEFAULT '0' COMMENT '湿度显示 0:不显示，1：显示' ;

ALTER TABLE `monitor`.`area_alert_parameter` 
ADD COLUMN `HUMIDITY_MAX` DOUBLE NULL DEFAULT 0 COMMENT '湿度最大值' AFTER `TEMP_ENV_DEV_ABS`;

#短信猫数据库修改10-25
ALTER TABLE `monitor`.`system` 
ADD COLUMN `SMS_COM_PORT` VARCHAR(20) NULL COMMENT 'SMS_COM端口号' AFTER `COLLECT_CYCLE`,
ADD COLUMN `SMS_BAUD_RATE` VARCHAR(20) NULL COMMENT 'SMS波特率' AFTER `SMS_COM_PORT`;

ALTER TABLE `monitor`.`user` 
ADD COLUMN `name` VARCHAR(20) NOT NULL COMMENT '姓名' AFTER `passWord`;


ALTER TABLE `monitor`.`user` 
ADD COLUMN `smsReceive` INT NULL DEFAULT 0 COMMENT '报警警短信接受' AFTER `regDate`;

#短信信息表
CREATE TABLE `monitor`.`sms_info` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `SMS_TEMPLATE` VARCHAR(300)  COMMENT '模板内容',
  `TYPE1` VARCHAR(50)  COMMENT '通讯异常',
  `TYPE2` VARCHAR(50)  COMMENT '介质温度报警上限',
  `TYPE3` VARCHAR(50)  COMMENT '介质温升速率',
  `TYPE4` VARCHAR(50)  COMMENT '介温极均差值',
  `TYPE5` VARCHAR(50)  COMMENT '环境温度报警上限',
  `TYPE6` VARCHAR(50)  COMMENT '环境温升速率',
  `TYPE7` VARCHAR(50)  COMMENT '环温极均差值',
  `TYPE8` VARCHAR(50)  COMMENT '单支温度',
  `TYPE9` VARCHAR(50)  COMMENT '温度均差',
  `TYPE10` VARCHAR(50)  COMMENT '湿度上限',
  `TYPE11` VARCHAR(50)  COMMENT '电压下限',
  `TYPE12` VARCHAR(50)  COMMENT '无线信号',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

INSERT INTO `sms_info` VALUES (1,'【系统报警】#区域名称#-#区域描述#，#节点名称#-#节点描述#于#时间#发生#报警级别#：当前值为#当前值#，#报警类别#(#设定值#)','温度采集异常','介质温度超上限','介质温升速率超上限','介质温度极均差值超上限','环境温度超上限','环境温升速率超上限','环境温度极均差值超上限','单支温度差超上限','温度均差超上限','湿度最大值','电压低于下限','无线信号低于下限'),(2,NULL,'1','1','1','1','1','1','1','1','1','1','1','1');


#10-30

#短信记录表
CREATE TABLE `monitor`.`sms_history` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `SMS_RECEIVER` VARCHAR(20)  NOT NULL COMMENT '收件人',
  `SMS_RECV_PHONE` VARCHAR(20) NOT NULL COMMENT '收件号码',
  `SMS_CONTENT` VARCHAR(150)  COMMENT '短信内容',
  `SMS_SEND_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


#2015-11-04 新增报警类型，用于解决连续报警问题
ALTER TABLE `monitor`.`area_alert_info` 
ADD COLUMN `TYPE` VARCHAR(10) NOT NULL COMMENT '报警类型：TYPE1，TYPE2...TYPE12' AFTER `IS_READ`;

#2016-07-31 新增湿度字段
ALTER TABLE `monitor`.`report_daily_area` 
ADD COLUMN `HUMIDITY_MAX` DOUBLE NULL DEFAULT NULL COMMENT '湿度最大值' AFTER `TEMP_DEV_ABS`,
ADD COLUMN `HUMIDITY_MIN` DOUBLE NULL DEFAULT NULL COMMENT '湿度最大值' AFTER `TEMP_DEV_ABS`,
ADD COLUMN `HUMIDITY_AVG` DOUBLE NULL DEFAULT NULL COMMENT '湿度最大值' AFTER `TEMP_DEV_ABS`;

ALTER TABLE `monitor`.`report_daily_node` 
ADD COLUMN `HUMIDITY_MAX` DOUBLE NULL DEFAULT NULL COMMENT '湿度最大值' AFTER `TEMP_DEV_ABS`,
ADD COLUMN `HUMIDITY_MIN` DOUBLE NULL DEFAULT NULL COMMENT '湿度最大值' AFTER `TEMP_DEV_ABS`,
ADD COLUMN `HUMIDITY_AVG` DOUBLE NULL DEFAULT NULL COMMENT '湿度最大值' AFTER `TEMP_DEV_ABS`;

#2016-08-06
ALTER TABLE `monitor`.`ctrler_info`
  ADD COLUMN `STATUS` INT(11) NULL DEFAULT AFTER `CTRLER_DESC`;

ALTER TABLE `monitor`.`system`
  CHANGE COLUMN `SHOW_HUMIDITY` `SHOW_HUMIDITY` TINYINT(1) NULL DEFAULT 1 COMMENT '湿度显示 0:不显示，1：显示' ,
  ADD COLUMN `SHOW_TEMP_MED` TINYINT(1) NULL DEFAULT 1 AFTER `SMS_BAUD_RATE`,
  ADD COLUMN `SHOW_TEMP_ENV` TINYINT(1) NULL DEFAULT 1 AFTER `SHOW_TEMP_MED`,
  ADD COLUMN `SHOW_SMOG_ALERT` TINYINT(1) NULL DEFAULT 1 AFTER `SHOW_HUMIDITY`;

ALTER TABLE `monitor`.`sms_info`
  ADD COLUMN `TYPE13` VARCHAR(50) NULL COMMENT '湿度采集异常' AFTER `TYPE12`;

ALTER TABLE `monitor`.`system`
  ADD COLUMN `SMS_ALERT` TINYINT(1) NULL DEFAULT 0 AFTER `SHOW_SMOG_ALERT`;

ALTER TABLE `monitor`.`sms_info`
  ADD COLUMN `TYPE14` VARCHAR(50) NULL AFTER `TYPE13`;

UPDATE `monitor`.`sms_info` SET `TYPE14`='烟雾报警' WHERE `ID`='1';


 