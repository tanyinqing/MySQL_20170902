/*
  这一节主讲 建立主表从表以及外键约束
  主表是主键所在的表  例如 部门表
  从表是外键所在的表  例如 员工表
  从表必须包括主表的主键
 */
-- 建立数据库
DROP DATABASE IF EXISTS db_day03; -- 如果存在就先删除
CREATE DATABASE db_day03;
-- 建立数据表  ctrl+alt+u  查看表结构
DROP TABLE IF EXISTS db_day03.department;
CREATE TABLE db_day03.department (-- 主表
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT '从表的主键',
  title    VARCHAR(255) NOT NULL
  COMMENT '标题',
  location VARCHAR(255) NOT NULL
  COMMENT '籍贯'
)COMMENT '员工所在的部门 从表';


DROP TABLE IF EXISTS db_day03.employee; -- 员工表
CREATE TABLE db_day03.employee (-- 子表
  id           INT AUTO_INCREMENT PRIMARY KEY
  COMMENT '主表主键',
  name         VARCHAR(255) NOT NULL
  COMMENT '姓名',
  hiredate     DATE         NOT NULL
  COMMENT '入职时间',
  departmentId INT COMMENT '所在部门的id  主表引用从表的主键'
  -- 表约束 这种方式不推荐
  -- CONSTRAINT employee_fk_departmentId FOREIGN KEY (departmentId) REFERENCES db_day03.department(id)
)
  COMMENT '员工表 主表';
-- employee_fk_departmentId 起的一个别名
-- 先建立表 在建立外键约束
-- 外键引用了主表中的主键

-- 建立外键约束 必须对应主键才可以 推荐使用
ALTER TABLE db_day03.employee
  ADD CONSTRAINT
  employee_fk_departmentId  -- 外键约束的别名
FOREIGN KEY (departmentId) REFERENCES db_day03.department(id) -- 对应主表的外键
-- ON DELETE CASCADE ;-- 这条选项表明 主表删除 从表引用记录连带删除
-- ON DELETE SET NULL ;-- 这条选项表明 主表删除 从表引用记录连带变成空
-- ON UPDATE SET NULL ;-- 这条选项表明 主表主键修改 从表引用记录连带变成空
ON UPDATE CASCADE ;-- 这条选项表明 主表主键修改 从表引用记录连带改变
-- 如果没有前4相 不允许删除

-- 主键从指定的值开始
-- ALTER TABLE db_day03.department AUTO_INCREMENT=100;
ALTER TABLE db_day03.employee AUTO_INCREMENT=1000;
-- 插入数据
INSERT INTO  db_day03.department VALUE (NULL ,'rd','beijing');
INSERT INTO db_day03.employee VALUE (NULL ,'Tom','2016-1-1',1);
INSERT INTO db_day03.employee VALUE (NULL ,'Jerry','2017-1-1',NULL );-- 外键可以为空
-- 查询数据
SELECT * FROM db_day03.department;
SELECT * FROM db_day03.employee;

-- 修改语句
UPDATE  db_day03.department SET location='shanghai' WHERE id=1;
UPDATE db_day03.department SET id='2' WHERE id='1';
DELETE FROM db_day03.department;-- 主键正在被别人使用，不能删除
DROP TABLE db_day03.department;
-- 外键的值可以为空  可以理解为暂时不知道部门

SET FOREIGN_KEY_CHECKS =0;-- 使外键失效
SET FOREIGN_KEY_CHECKS =1;-- 使外键生效

-- 查询语句 联合查询
SELECT e.NAME,d.title,d.location FROM db_day03.employee e
INNER JOIN db_day03.department d ON e.departmentId=d.id;

-- 查询数据库下表的注释
SHOW TABLE STATUS FROM db_day03;