-- DML也就是增加修改删除数据的语句
-- insert
-- update
-- delete ctrl+p

INSERT INTO db_day04.employee VALUE (NULL, 'Tom', 18, '2016-1-1', 'M', NULL);

INSERT INTO db_day04.employee (name, hredate) VALUE ('jerry', '2017-1-1');
-- 插入多个语句
INSERT INTO db_day04.employee (name, hredate) VALUE ('name1', '2017-1-1'), ('name2', '2018-1-1'), ('name3', '2018-1-1');

UPDATE db_day04.employee
SET age = 19, gender = 'F'
WHERE id = 4;

-- 空值设置为男
UPDATE db_day04.employee SET gender='M' WHERE gender IS NULL ;

-- 模糊查询
DELETE FROM db_day04.employee WHERE name LIKE '%name%';

SELECT *
FROM db_day04.employee;

