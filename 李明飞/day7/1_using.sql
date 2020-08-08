-- USING关键字的实现

SELECT e.ENAME,d.DEPTNO FROM scott.emp e INNER JOIN scott.dept d
ON e.DEPTNO=d.DEPTNO;
-- 上下的作用是一样的
SELECT e.ENAME,d.DEPTNO FROM scott.emp e INNER JOIN scott.dept d
USING (DEPTNO); -- 外键和主键名一样情况下使用


