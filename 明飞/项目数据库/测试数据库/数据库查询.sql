


SELECT * FROM db_TanTest.One;
SELECT * FROM db_TanTest.two;

SELECT * FROM db_TanTest.One WHERE name='Tom';

show VARIABLES like 'char%';-- 显示编码字符集


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