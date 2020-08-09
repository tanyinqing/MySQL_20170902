# 流程控制

```
#案例：批量插入，根据次数插入到admin表中多条记录，如果次数>20则停止
TRUNCATE TABLE admin$
DROP PROCEDURE test_while1$
CREATE PROCEDURE test_while1(IN insertCount INT)
BEGIN
 DECLARE i INT DEFAULT 1;
 a:WHILE i<=insertCount DO
  INSERT INTO admin(username,`password`) VALUES(CONCAT('xiaohua',i),'0000');
  IF i>=20 THEN LEAVE a;
  END IF;
  SET i=i+1;
 END WHILE a;
END $
```

## 插入过程

```
SELECT * FROM admin;

DELIMITER $
CREATE PROCEDURE myp1()
BEGIN
 INSERT INTO admin(username,`password`) 
 VALUES('john1','0000'),('lily','0000'),('rose','0000'),('jack','0000'),('tom','0000');
END $
```

搜索