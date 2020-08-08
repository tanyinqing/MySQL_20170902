-- ddl 数据定义语句
-- create
-- drop
-- altert 修改表的表名以及对列的增删改查

DROP TABLE IF EXISTS db_day03.student;
CREATE TABLE db_day03.student(
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT '主表主键',
  name VARCHAR(255) NOT NULL COMMENT '姓名',
  gender CHAR(1) not NULL COMMENT '性别'
)COMMENT '学生表';

ALTER TABLE db_day03.student RENAME db_day03.new_studengt;-- 改表名

INSERT INTO db_day03.student VALUE (NULL ,'Tom',"M");
-- 为表添加一列 指定列名
ALTER TABLE db_day03.student ADD COLUMN addr VARCHAR(255);
-- 为表添加一列  指定列的位置
ALTER TABLE db_day03.student ADD COLUMN marride INT(1) NOT NULL AFTER gender;
-- 删除一列
ALTER TABLE db_day03.student DROP COLUMN marride;
-- 修改某一列的数据类型 修改表中列的位置
ALTER TABLE db_day03.student MODIFY COLUMN gender VARCHAR(255) AFTER addr;
-- 改列名 以及数据类型
ALTER TABLE db_day03.student CHANGE addr address VARCHAR(255);
-- 删除外键约束
INSERT INTO db_day03.employee VALUE (NULL, 'satt','1990-1-1','999');
ALTER TABLE db_day03.employee DROP FOREIGN KEY employee_fk_departmentId;

-- 查询数据
SELECT * FROM db_day03.student;
-- 显示表的详情
SHOW TABLES FROM db_day03;