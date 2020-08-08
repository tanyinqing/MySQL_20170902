
-- 查询工作是员工或管理者的数据
SELECT * FROM scott.emp WHERE JOB='salesman' OR JOB='manager';
-- 区间范围
SELECT * FROM scott.emp WHERE JOB in ('salesman','manager');
-- 闭区间
SELECT * FROM scott.emp WHERE SAL BETWEEN 1000 AND 3000;
-- 不包括两个端点
SELECT * FROM scott.emp WHERE SAL NOT BETWEEN 1000 AND 3000;
-- 列起别名
SELECT ENAME AS 姓名,SAL*12 AS 年工资 FROM scott.emp WHERE SAL NOT BETWEEN 1000 AND 3000;

-- 表起别名
SELECT
  e.ENAME,
  e.SAL
FROM scott.emp e;

-- 奖金是空值的数据
SELECT * FROM scott.emp WHERE COMM IS NOT NULL ;
-- 如果奖金的值为空取0 不为空则取实际的值
SELECT ENAME,SAL+ifnull(COMM,0) FROM scott.emp  ;

