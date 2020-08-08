# Alt+回车  运行相关的代码
DROP DATABASE IF EXISTS MShi;
CREATE DATABASE MShi;
# MShi.score
#    MShi.

use scott;
SELECT d.DNAME,d.DEPTNO FROM emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO;
SELECT * from emp WHERE SAL+ifnull(COMM,0)>(SELECT SAL+ifnull(COMM,0) FROM emp WHERE ENAME="scott");
SELECT e1.ENAME 员工,e2.ENAME 经理 from emp e1 INNER JOIN emp e2 ON e1.EMPNO=e2.MGR;
select e1.ENAME 员工,e2.ENAME 经理 from emp e1 INNER JOIN emp e2 on (e1.HIREDATE<e2.HIREDATE);
SELECT e.ENAME,d.DNAME from emp e INNER JOIN dept d ON e.DEPTNO=d.DEPTNO;
SELECT e.ENAME,d.DNAME from emp e INNER JOIN dept d on e.DEPTNO=d.DEPTNO WHERE e.JOB="clerk";
SELECT DEPTNO,min(SAL+ifnull(COMM,0)) FROM emp GROUP BY DEPTNO;
SELECT ename from emp INNER JOIN dept on emp.DEPTNO = dept.DEPTNO WHERE dept.DNAME="sales";
SELECT * FROM emp WHERE SAL+ifnull(COMM,0)>(SELECT avg(SAL+ifnull(COMM,0)) FROM emp);
SELECT * FROM emp WHERE JOB=(SELECT JOB FROM emp WHERE ENAME="scott");
SELECT * FROM emp WHERE (SAL+ifnull(COMM,0))>(SELECT avg(SAL+ifnull(COMM,0)) FROM emp WHERE DEPTNO=30);
SELECT d.DEPTNO ,d.DNAME,count(e.DEPTNO) FROM emp e RIGHT JOIN dept d ON e.DEPTNO = d.DEPTNO GROUP BY e.DEPTNO;