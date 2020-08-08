

# 彻底清除数据
TRUNCATE db_TanTest.two;-- 截断  数据彻底清除 无法找回
TRUNCATE db_TanTest.One;-- 截断  数据彻底清除 无法找回

INSERT INTO db_TanTest.Two VALUE (NULL ,"财务部"); -- 插入一组数据
INSERT INTO db_TanTest.One VALUE (NULL , "Tom", 18, '1999-01-02',"M",1); -- 插入一组数据

insert into db_TanTest.ceshi values(null,'2005001','张三'),(null,'2005002','李四'),
  (null,'2005001','张三');




