
-- 事务
SELECT * FROM scott.emp;-- 查询和事务无关

START TRANSACTION;-- 开启事务

DELETE FROM scott.emp;-- dML 语句

ROLLBACK ;-- 回滚 会结束事务并恢复数据

START TRANSACTION ;

/*UPDATE user_table SET maney=maney-1000
WHERE name='jerry'*/

COMMIT ;-- 提交对数据的修改  需要判断

START TRANSACTION ;

SELECT * FROM scott.emp;

UPDATE scott.emp SET job='clerk' WHERE EMPNO=1111;

SAVEPOINT a;-- 设置保留点  a

DELETE FROM scott.emp WHERE EMPNO=2222;

SAVEPOINT b;

INSERT INTO scott.emp(EMPNO,ENAME)VALUE (9999,'TOM');

SAVEPOINT c;

DELETE FROM scott.emp;

ROLLBACK ;
COMMIT ;

ROLLBACK TO c;-- 回滚到某一个保留点 但不结束事务
ROLLBACK TO b;-- 回滚到某一个保留点

DROP VIEW scott.v_emp;-- DDL语句 执行会以commit的隐式方式结束事务

TRUNCATE scott.emp;-- DDL语句 执行会以commit的隐式方式结束事务

