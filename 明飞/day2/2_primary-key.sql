
UPDATE db_day01.student
SET height = 1.80;-- 把这一列所有的值都改为1.8

SELECT *
FROM db_day01.student;
-- primary key PK 主键 主关键字 主码

CREATE DATABASE db_day02;

CREATE TABLE db_day02.student (
  id   INT AUTO_INCREMENT  PRIMARY KEY COMMENT 'id PK',-- 主键 自增长 不可以为空
  name VARCHAR(255) NOT NULL COMMENT 'name',-- 非空约束
  age  INT COMMENT 'age',
  gender char(1) DEFAULT 'M' COMMENT 'gender',  -- 默认值
  email VARCHAR(191) UNIQUE COMMENT 'email', -- 独特的\ [juː'niːk] 值唯一 可以为空
  dob DATETIME DEFAULT now() COMMENT 'date of birth',  -- 默认值
  departmentId INT COMMENT 'department id FK'
 -- CONSTRAINT FOREIGN KEY (departmentId) REFERENCES db_day02.department(id) -- 不推荐 引用只有从表存在的情况下才可以创建 绑定从表的主键
) COMMENT 'student table 学生信息表';

CREATE TABLE db_day02.department (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id PK',
  title VARCHAR(255) NOT NULL COMMENT 'title',
  tel VARCHAR(255) NOT NULL  COMMENT 'telephone'
) COMMENT 'department table 系别信息表';

ALTER TABLE db_day02.student -- 推荐用这种方法实现 主表的项绑定从表的主键
  ADD CONSTRAINT   -- 如果该元素的值在从表中不存在则无法插入数据
  student_fk_departmentId
FOREIGN KEY (departmentId)
REFERENCES db_day02.department(id);

INSERT INTO db_day02.student VALUE (NULL, 'Tom', 18, 'F', 'tom@gmail.com', NULL, 1);
INSERT INTO db_day02.student(name, age, email, gender, departmentId) VALUE ('Jerry', 17, 'jerry@gmail.com', 'F', 2);

INSERT INTO db_day02.student(name, age, email, departmentId) VALUE ('Scott', NULL, 'scott@gmail.com', NULL);
INSERT INTO db_day02.student(name, age, email) VALUE ('King' , NULL, NULL);
INSERT INTO db_day02.student(name) VALUE ('Kate'); -- default

INSERT INTO db_day02.department VALUE (NULL, 'CS', '010-12345678');
INSERT INTO db_day02.department VALUE (NULL, 'EE', '010-12345679');

SELECT *
FROM db_day02.student;

SELECT *
FROM db_day02.department;

DROP TABLE db_day02.student;
DROP TABLE db_day02.department;

UPDATE db_day02.student SET name = 'Jerry' WHERE id = 2;-- 引用主键的值进行修改

TRUNCATE db_day02.student;-- 彻底删除数据，id从1重新开始

DESC db_day02.student; -- DESC describe 描述\ [dɪ'skraɪb]显示每一个列的详细信息

show VARIABLES like 'char%';-- 显示编码字符集