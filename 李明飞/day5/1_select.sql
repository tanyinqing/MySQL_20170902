SHOW TABLES FROM scott;

SHOW VARIABLES LIKE 'char%';
SHOW VARIABLES LIKE 'coll%';

SHOW VARIABLES ;-- 显示变量
SHOW CREATE TABLE scott.emp;-- 显示建表语句

SELECT * FROM scott.emp;-- 查询表数据

SELECT ename,sal FROM scott.emp;-- 查询表的两列

SELECT DISTINCT JOB FROM scott.emp;-- 去掉重复的值

SELECT * FROM scott.emp WHERE DEPTNO=30;-- 查询部门编号是30的数据

SELECT * FROM scott.emp WHERE DEPTNO <> 30;-- 查询部门编号不等于30的数据

SELECT *
FROM scott.emp
WHERE ENAME = BINARY 'SCOTT'; -- 区分大小写 名字检索

SELECT *
FROM scott.emp
WHERE JOB = 'analyst' AND DEPTNO = 20;-- 不区分大小写  取并集

SELECT *
FROM scott.emp
WHERE JOB = 'analyst' OR DEPTNO = 20;-- 只要满足其中一个条件

SELECT * FROM scott.emp ORDER BY SAL ASC ;-- 升序排列 默认null是最小
SELECT * FROM scott.emp ORDER BY HIREDATE DESC ;-- 降序排列 入职时间降序排列 顺序是从现在到过去

-- 先降序排列 在按工资升序排列 不指定默认升序
SELECT * FROM scott.emp ORDER BY HIREDATE DESC ,SAL ASC ;

SELECT ENAME FROM scott.emp ORDER BY SAL DESC ;

-- 按查询语句第2列的升序排列  默认是升序
SELECT ename,sal FROM scott.emp ORDER BY 2;

SELECT * FROM scott.emp ORDER BY comm;-- null默认最小 奖金

-- 从第一行  一共查3条 0是第一行
SELECT * FROM scott.emp ORDER BY EMPNO LIMIT 0,3;

-- oracle id 实现分页
-- sql server top 实现

-- 推荐 比较容易读  EMPNO 员工编号
SELECT * FROM scott.emp ORDER BY EMPNO LIMIT 3 OFFSET 0;-- 从0开始 偏移量是3

SELECT * FROM scott.emp ORDER BY EMPNO  LIMIT 0,3;

