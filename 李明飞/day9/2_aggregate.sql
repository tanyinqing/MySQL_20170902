

-- 聚合函数 最小 最大 平均值 总和  总的个数
SELECT min(sal),max(sal),avg(SAL),sum(SAL),count(SAL) FROM scott.emp;

-- 先分组 在统计最小值
SELECT DEPTNO,min(sal) FROM scott.emp GROUP BY DEPTNO;

-- 工作值相同的分为一组  先分组 在查询  where 行检索 havng 组检索
SELECT count(*),JOB FROM  scott.emp GROUP BY JOB HAVING JOB='clerk';
-- 组中再进行分组
SELECT DEPTNO,JOB,count(*) FROM scott.emp GROUP BY DEPTNO,JOB;

SELECT count(*) FROM scott.emp;-- 工种不为空的