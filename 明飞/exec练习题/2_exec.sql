SELECT * FROM scott.emp;
SELECT * FROM scott.dept;
# 1. 返回拥有员工的部门名、部门号
SELECT d.DEPTNO,d.DNAME FROM scott.emp e INNER JOIN scott.dept d ON e.DEPTNO = d.DEPTNO;
# 2. 工资多于 scott 的员工信息
SELECT * FROM scott.emp WHERE sal+ifnull(COMM,0)>(
SELECT sal+ifnull(COMM,0) FROM scott.emp WHERE ENAME='scott');
# 3. 返回员工和所属经理的姓名  一个表 2个别名  EMPNO 员工编号 MGR 经理编号
SELECT e1.ENAME 员工,e2.ENAME 经理 FROM scott.emp e1 INNER JOIN scott.emp e2 ON e1.MGR=e2.EMPNO;
# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名   join on 这个是联合查询
SELECT e1.ENAME 员工,e2.ENAME 经理 FROM scott.emp e1
  INNER JOIN scott.emp e2 ON e1.MGR=e2.EMPNO
WHERE e1.HIREDATE<e2.HIREDATE;
# 5. 返回员工姓名及其所在的部门名称  DEPTNO 部门编号
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称  先联合数据表 在进行查询
SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
WHERE e.JOB = 'clerk';
# 7. 返回部门号及其本部门的最低工资
SELECT
  DEPTNO,
  min(sal + ifnull(COMM, 0))
FROM scott.emp
GROUP BY DEPTNO;
# 8. 返回销售部 sales 所有员工的姓名
SELECT e.ENAME FROM scott.emp e INNER JOIN scott.dept d ON e.DEPTNO=d.DEPTNO WHERE d.DNAME='sales';
# 9. 返回工资多于平均工资的员工
SELECT *
FROM scott.emp
WHERE (SAL + ifnull(COMM, 0)) > (
  SELECT avg(sal + ifnull(COMM, 0))
  FROM scott.emp
);
# 10. 返回与 scott 从事相同工作的员工
SELECT *
FROM scott.emp
WHERE job = (
  SELECT job
  FROM scott.emp
  WHERE ENAME = 'scott'
);
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
SELECT
  ENAME,
  (SAL + ifnull(COMM, 0))
FROM scott.emp
WHERE (SAL + ifnull(COMM, 0)) > (
  SELECT avg(sal + ifnull(COMM, 0))
  FROM scott.emp
  WHERE DEPTNO = 30
);
# 12. 返回工资高于30部门所有员工工资水平的员工信息
SELECT *
FROM scott.emp
WHERE (SAL + ifnull(COMM, 0)) > (
  SELECT avg(sal + ifnull(COMM, 0))
  FROM scott.emp
  WHERE DEPTNO = 30
);
# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
SELECT
  d.DEPTNO,
  d.DNAME,
  d.LOC,
  count(e.EMPNO)
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
GROUP BY e.DEPTNO;


# 14. 返回员工的姓名、所在部门名及其工资
# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
# 16. 返回员工的详细信息，包括部门名
# 17. 返回员工工作及其从事此工作的最低工资
# 18. 返回不同部门经理的最低工资
# 19. 计算出员工的年薪，并且以年薪排序
# 20. 返回工资处于第 4 级别的员工的姓名