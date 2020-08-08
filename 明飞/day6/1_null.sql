SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE COMM IS null;-- 判断是否为空

UPDATE scott.emp SET COMM = NULL
WHERE empno = 7844;-- 设置奖金为空

SELECT *
FROM scott.emp
WHERE empno = 7844;

SELECT ENAME, ifnull(COMM, 0) + sal
FROM scott.emp;-- 如果奖金为空值，就设置为0