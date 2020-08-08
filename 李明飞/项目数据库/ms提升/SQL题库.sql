# Alt+回车  运行相关的代码
DROP DATABASE IF EXISTS MShi;
CREATE DATABASE MShi;
# MShi.score
#    MShi.

select version();#查询数据库的版本
SHOW STATUS ;#查询数据库的状态
show INDEX FROM MShi; #查看定义了哪些索引
SELECT now();#年月日时分秒
SELECT current_date();#  只有年月日


# 16.创建一张学生表，表结构及要求如下：
CREATE TABLE MShi.Student1(
  ID INT NOT NULL PRIMARY KEY,
  SNO CHAR(4) NOT NULL UNIQUE,
  SNAME VARCHAR(10),
  AGE INT CHECK(AGE>0),
  SEX CHAR(2) DEFAULT '男')





