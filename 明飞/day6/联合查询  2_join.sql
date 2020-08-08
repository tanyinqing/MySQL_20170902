-- join 联合查询  不太懂
# MySQL联合查询语法内联、左联、右联、全联  http://www.jianshu.com/p/c4c43f32b66f
-- ename - emp 员工表
-- dname - dept 部门表
-- 连接查询
SELECT
  e.ename,
  d.dname
FROM scott.emp `e`
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO; -- 部门编号一样的 员工姓名和部门名称  内连接

SELECT
  e.ename,
  e.deptno,
  d.dname
FROM scott.emp e
  INNER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

-- N tables JOIN ON: N-1

SELECT
  e.ename,
  d.dname
FROM scott.emp e CROSS JOIN scott.dept d; -- CROSS JOIN 交叉查询 笛卡尔积 16*4=64  用的比较少

SELECT *
FROM scott.emp;

-- UNION运算符用于组合两个或更多SELECT语句的结果集
-- 联合查询则是纵向组合。

SELECT
  e.ename,
  d.dname
FROM scott.emp e LEFT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO
UNION -- 并集 会自动去除重复的列
SELECT
  e.ename,
  d.dname
FROM scott.emp e RIGHT OUTER JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;

SELECT
  ENAME,
  DEPTNO
FROM scott.emp
WHERE DEPTNO = 20 OR DEPTNO = 30
UNION ALL  -- 不去除重复的列
SELECT
  ENAME,
  DEPTNO
FROM scott.emp
WHERE DEPTNO = 20;