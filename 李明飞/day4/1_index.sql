-- 创建索引
-- 数据量上百万 创建索引
-- 并不是所有的列都适合创建索引 取值范围要广
-- 索引会提高查询速度 但更新和删除速度变慢
-- 主键自动是索引
-- 唯一约束自动是索引
-- 仅仅mysql的这个引擎InnoDB情况下 外键变成索引

DROP DATABASE IF EXISTS db_day04;
CREATE DATABASE db_day04;

DROP TABLE IF EXISTS db_day04.employee;
CREATE TABLE db_day04.employee(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '',
  name VARCHAR(255)  COMMENT '',
  age INT  COMMENT '',
  hredate DATE  COMMENT '入职时间',
  gender CHAR(1)  COMMENT '',
  departmentid INT COMMENT '所在的部门'
) COMMENT '员工表';

DROP TABLE IF EXISTS db_day04.department;
CREATE TABLE db_day04.department(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '',
    name VARCHAR(255) NOT NULL COMMENT '部门名'
) COMMENT '';

-- 这个是加入外键约束
ALTER TABLE db_day04.employee
    ADD CONSTRAINT
employee_fk_departmentId
FOREIGN KEY(departmentid)REFERENCES db_day04.department(id);

SELECT * FROM db_day04.employee;
-- 创建索引
CREATE INDEX idx_name ON db_day04.employee(name);

SELECT * FROM db_day04.employee WHERE name='Tom';

SHOW INDEX FROM db_day04.employee;-- 这个是建立外键索引

