-- 数据定义语句
-- create  创建 drop 删除 alter 修改
SHOW DATABASES; -- 显示服务器中所有的库
SHOW TABLES; -- 显示库中所有的表
CREATE DATABASE db_day01;

CREATE TABLE db_day01.student (
  id     INT COMMENT '这个是id',
  name   VARCHAR(255) COMMENT '姓名',
  gender CHAR(1) COMMENT '性别',
  age    INT COMMENT '年龄',
  height DOUBLE(3, 2) COMMENT '身高', -- 小数部分2位 一共有3位
  fee    DECIMAL(6, 2) COMMENT '学费', -- 学费一共6位 小数有2位 涉及到钱 专用
  dob    DATE COMMENT '出生年月日' -- 生日 年月日

)
  COMMENT '学生表';
INSERT INTO db_day01.student VALUE (1, "Tom", "M", 18, 1.75, 1234.56, '1999-1_foreign-key.sql-2'); -- 插入一组数据

CREATE TABLE db_day01.Persons (
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255) DEFAULT 'Sandnes'
);

INSERT INTO db_day01.Persons VALUE (2, "Tom", "M","东辛店","北京"); -- 插入一组数据

SELECT *
FROM db_day01.Persons; -- 查询学生表

-- show colum comment 显示完整的字段信息
SHOW FULL COLUMNS FROM db_day01.student;

-- 显示表的注释
SHOW TABLE STATUS FROM db_day01;

DROP TABLE db_day01.student; -- 删除数据表
DROP DATABASE db_day01; -- 删除数据库