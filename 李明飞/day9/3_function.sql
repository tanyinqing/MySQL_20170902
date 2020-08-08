-- number
SELECT abs(-1);-- 绝对值
SELECT hex(97);-- 返回十六进制
SELECT ceil(9.0001);-- 返回大于 x 的最小整数值
SELECT floor(9.9999);-- 返回小于 x 的最大整数值
SELECT round(9.5);-- 返回参数 x 的四舍五入的有 y 位小数的值
SELECT truncate(1.235,2);-- 返回数字 x 截短为 y 位小数的结果
SELECT round(1.235,2);-- 返回参数 x 的四舍五入的有 y 位小数的值
SELECT pi(); -- 常量
SELECT MOD (100,101);-- 取余数
-- text
SELECT ascii('a');-- 返回字符的 ASCII 码值
SELECT ascii('[');-- 返回字符的 ASCII 码值
SELECT concat('h','llo');-- 连接字符串
SELECT concat_ws('-','h','llo');-- 将 s1,s2...,sn 连接成字符串，并用 sep 字符间隔
SELECT insert('hello',1,2,'a');-- 将字符串 str 从第 x 位置开始，y 个字符长的子串替换为字符串 instr
SELECT upper('hello');-- 变成大写字符
SELECT trim('  hello word  ');-- 去除两端的空格
SELECT length('hello');-- 字符串的长度
SELECT repeat('hi',2);
SELECT replace('hello','hel','abc');
SELECT reverse('hello');
-- data/time
SELECT current_date,curdate();
SELECT now(),current_time,curtime(),current_timestamp;
SELECT date_add(now(),INTERVAL 1 MONTH);-- 下一个月
SELECT date_sub(now(),INTERVAL 1 MONTH);-- 上一个月
SELECT dayofweek(now());-- 在西方 星期天是第一天
SELECT DAYOFMONTH(now());
SELECT dayofyear(now());
SELECT dayname(now());
SELECT hour(now());
SELECT quarter(now());-- 现在是第几个季节
SELECT week(now());-- 现在是第几周
SELECT year(now());-- 现在的年份


