
delete from db_TanTest.ceshi where id not in(select min(id) from (select * from
                                                                  db_TanTest.ceshi) as t group by t.name);



# 下面是练习题的第一部分
SELECT * from scott.emp e  WHERE e.DEPTNO=30;
select * from scott.emp e WHERE e.JOB='clerk';
SELECT * FROM scott.emp e WHERE e.COMM>e.SAL;
SELECT * FROM scott.emp e WHERE e.COMM>e.SAL*0.3;
SELECT * FROM scott.emp d WHERE (d.DEPTNO=10 AND d.JOB="manager") OR (d.DEPTNO=20 AND d.JOB="clerk");

# 以下是联合查询
SELECT e.ENAME,d.DNAME
  FROM scott.emp e LEFT OUTER JOIN scott.dept d
    on e.DEPTNO=d.DEPTNO
UNION
SELECT e.ENAME,d.DNAME
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
    on e.DEPTNO=d.DEPTNO
# 笛卡尔积
SELECT e.ENAME,d.DNAME
  FROM scott.emp e cross join scott.dept d;

# 内连接
SELECT e.ENAME,d.`DNAME`
  FROM scott.emp e
    inner join scott.dept d
    ON e.DEPTNO=d.DEPTNO




