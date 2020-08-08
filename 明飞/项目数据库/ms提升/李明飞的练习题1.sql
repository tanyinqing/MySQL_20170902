# Alt+回车  运行相关的代码
DROP DATABASE IF EXISTS MShi;
CREATE DATABASE MShi;
# MShi.score
#    MShi.

use scott;
SELECT * from emp where (DEPTNO=10 and JOB="manager") or (DEPTNO=20 and JOB="clerk");
SELECT * from emp where (DEPTNO=10 and JOB="manager") or (DEPTNO=20 and JOB="clerk")
or (JOB <> "manager" and JOB <>"clerk" and (SAL+ifnull(COMM,0))>2000);
select * from emp WHERE COMM>SAL*0.3;
select * from emp WHERE COMM>SAL;
SELECT * from emp where job="clerk";
SELECT * from emp WHERE DEPTNO=30;
SELECT DISTINCT Job from emp where comm >0;
select * from emp where COMM<100 or comm is null;
select * from emp WHERE HIREDATE=last_day(HIREDATE);
SELECT * from emp WHERE date_add(HIREDATE,interval 35 YEAR) <current_date;
select * from emp WHERE ENAME REGEXP "^[abc]";
SELECT * from emp WHERE length(ENAME)=4;
SELECT * from emp where ENAME not like "%r%";
SELECT substr(ename,1,3) FROM emp ;
SELECT replace(ENAME,"A","a") FROM emp;
SELECT date_add(HIREDATE,INTERVAL 10 YEAR)FROM emp;
select * from emp order by ENAME;
SELECT * from emp ORDER BY HIREDATE DESC ;
SELECT * from emp ORDER BY JOB DESC,SAL+ifnull(COMM,0) ;
SELECT ENAME ,year(HIREDATE),month(HIREDATE),day(HIREDATE) from emp
ORDER BY 3,day(HIREDATE);
SELECT ENAME,round((SAL+ifnull(COMM,0))/30,2)FROM emp;
SELECT * from emp WHERE month(HIREDATE)=2;
SELECT HIREDATE,datediff(now(),HIREDATE)  FROM emp;
SELECT * FROM emp WHERE ENAME LIKE "%A%";
SELECT * FROM emp WHERE ENAME REGEXP "a";
UPDATE emp set HIREDATE="2016-10-24" WHERE ENAME="ALLEN";
SELECT
  ename,
  HIREDATE,
  TIMESTAMPDIFF(
      YEAR,
      hiredate,
      CURDATE()
  ) AS years,
  TIMESTAMPDIFF(
      MONTH,
      DATE_ADD(
          hiredate,
          INTERVAL TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) YEAR
      ),
      CURDATE()
  ) AS months,
  TIMESTAMPDIFF(
      DAY,
      DATE_ADD(
          DATE_ADD(
              hiredate,
              INTERVAL TIMESTAMPDIFF(YEAR, hiredate, CURDATE()
              ) YEAR),
          INTERVAL TIMESTAMPDIFF(
              MONTH,
              DATE_ADD(
                  hiredate,
                  INTERVAL TIMESTAMPDIFF(YEAR, hiredate, CURDATE()) YEAR
              ),
              CURDATE()
          ) MONTH
      ),
      CURDATE()
  ) AS days
FROM scott.emp;



