-- 视图的使用方法
-- 创建视图  视图中没有数据 创建或重新定义视图
CREATE OR REPLACE VIEW scott.v_emp AS-- 视图相当于一个框或窗口 虚表
  SELECT
    ENAME,
    JOB,
    HIREDATE
  FROM scott.emp
  WHERE DEPTNO = 20;

SELECT * FROM scott.v_emp;

DROP VIEW scott.v_emp;
-- 查询有多少个视图
SHOW FULL TABLES IN scott WHERE TABLE_TYPE = 'VIEW';
-- 视图存储的是联合查询后的语句
CREATE VIEW scott.v_ename_dname AS
SELECT e.ENAME,d.DNAME FROM scott.emp e INNER JOIN scott.dept d on e.DEPTNO = d.DEPTNO;

-- 运用视图进行查询
SELECT DNAME FROM scott.v_ename_dname WHERE ENAME='scott';

-- 通过视图对基表中数据进行修改
UPDATE scott.v_emp
SET JOB = 'MANAGER'
WHERE ENAME = 'scott';