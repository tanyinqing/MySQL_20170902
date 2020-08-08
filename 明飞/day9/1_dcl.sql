-- mysql.user

SELECT * FROM mysql.user;-- 查看一共多少个用户

CREATE USER tom@'localhost' IDENTIFIED BY '123';

SHOW GRANTS FOR tom@'localhost';-- 查看用户的权限

GRANT ALL ON scott.* TO `tom@'localhost'`;-- 赋予所有权限
-- 赋予权限
GRANT SELECT ON scott.emp to tom@'localhost';

REVOKE SELECT ON scott.emp FROM tom@'localhost';-- 撤销权限

DROP USER tan@'localhost';-- 删除用户

 DELETE FROM mysql.user WHERE user LIKE 'tom%'; -- 删除一个不标准的数据库
 DELETE FROM mysql.user WHERE user= ''; -- 删除一个不标准的数据库

SHOW DATABASES ;-- 查看数据库

-- 系统数据表
# informaton_schema
# performance_schema
# mysql

