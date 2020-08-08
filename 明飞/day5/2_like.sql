-- 模糊查询 两边是字符串 中间有a就行
SELECT * FROM scott.emp WHERE ENAME LIKE '%a%';
-- a开头的
SELECT * FROM scott.emp WHERE ENAME LIKE 'a%';
-- 下划线代表只有一个字符
SELECT * FROM scott.emp WHERE ENAME LIKE '张_';
-- 转意字符  \_ 代表的就是自己本身
SELECT * FROM scott.emp WHERE ENAME LIKE '%\_%';

-- 正则表达式 非英文开头 字符串结尾
SELECT *
FROM scott.emp
WHERE ENAME NOT RLIKE '^[a-zA-Z]+$';

-- 插入一些数据
INSERT INTO scott.emp(EMPNO, ENAME) VALUE (1111, '张三');
INSERT INTO scott.emp(EMPNO, ENAME) VALUE (2222, '张三三');
INSERT INTO scott.emp(EMPNO, ENAME) VALUE (3333, '张_三');




