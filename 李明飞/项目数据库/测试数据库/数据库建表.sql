
# Alt+回车  运行相关的代码
DROP DATABASE IF EXISTS db_TanTest;
CREATE DATABASE db_TanTest;


DROP TABLE IF EXISTS db_TanTest.One;
CREATE TABLE db_TanTest.One(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
  name VARCHAR(255)  COMMENT '姓名',
  age INT  COMMENT '年龄',
  hredate DATE  COMMENT '入职时间',
  gender CHAR(1)  COMMENT '性别',
  departmentid INT COMMENT '所在部门的id'
) COMMENT '员工表';

DROP TABLE IF EXISTS db_TanTest.Two;
CREATE TABLE db_TanTest.Two(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    name VARCHAR(255) NOT NULL COMMENT '部门名'
) COMMENT '';

-- 这个是加入外键约束 员工的departmentid绑定部门id
ALTER TABLE db_TanTest.One
    ADD CONSTRAINT
employee_fk_departmentId
FOREIGN KEY(departmentid)REFERENCES db_TanTest.Two(id);









