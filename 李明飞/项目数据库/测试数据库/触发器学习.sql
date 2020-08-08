# Alt+回车  运行相关的代码
DROP DATABASE IF EXISTS MShi1;
CREATE DATABASE MShi1;
# MShi.score   MShi.

#  这个是进入某一个数据库
USE MShi1;
# 用户users表
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(250)) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1000001 DEFAULT CHARSET=latin1;

# 日志logs表：
CREATE TABLE `logs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL COMMENT '日志说明',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志表';
# 需求是：当在users中插入一条数据，就会在logs中生成一条日志信息。
# 创建触发器：  周伯通 is created
DELIMITER $
CREATE TRIGGER user_log AFTER INSERT ON users FOR EACH ROW
  BEGIN
    DECLARE s1 VARCHAR(40)character set utf8;
    DECLARE s2 VARCHAR(20) character set utf8;#后面发现中文字符编码出现乱码，这里设置字符集
    SET s2 = " is created";
    SET s1 = CONCAT(NEW.name,s2);     #函数CONCAT可以将字符串连接
    INSERT INTO logs(log) values(s1);
  END $
DELIMITER ;

SHOW TRIGGERS;#语句查看触发器信息
drop trigger  user_log;#删除触发器
# 在triggers表中查看触发器信息
SELECT * FROM information_schema.triggers;

# insert into users(id,name,add_time) values(NULL ,'周伯通',now());  启动触发器
insert into users(id,name,add_time) values(NULL ,'周伯通',52353453);