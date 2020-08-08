-- 子查询
-- 和这个人部门编号一致的员工信息

--  子查询实现  非相关子查询（子查询可以独立存在）
-- 相关子查询（子查询不能独立存在）
SELECT * -- 主查询
FROM scott.emp
WHERE DEPTNO = (
  SELECT DEPTNO-- 子查询
  FROM scott.emp
  WHERE ENAME = 'scott');

-- 同一个表起两个别名 联合查询
SELECT * FROM scott.emp e1 INNER JOIN scott.emp e2
ON e1.DEPTNO=e2.DEPTNO WHERE e2.ENAME='scott';

-- 同一个需求 不同的SQL的实现 存在一个选择的问题
-- 选择的标准是：效率