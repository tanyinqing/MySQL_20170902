CREATE TABLE scott.new_emp -- DDL 数据查询语句
    SELECT -- DQL 数据操作语句
      ename,
      hiredate
    FROM scott.emp; -- 将查询的语句建立一个新表

SELECT *
FROM scott.new_emp;

CREATE TABLE scott.test_emp (
  empno INT(4) PRIMARY KEY
);

DESC scott.emp;

SELECT *
FROM scott.test_emp;

INSERT INTO scott.test_emp VALUE (1111);

-- 把查询出来的语句插入到新表中
INSERT INTO scott.test_emp -- DML
  SELECT EMPNO -- DQL
  FROM scott.emp
  WHERE EMPNO <> 1111;