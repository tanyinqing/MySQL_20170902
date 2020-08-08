
-- 按照id排序  从第0个开始 偏移量是2 也就是选两个数据
SELECT * FROM  worktracking.work ORDER BY id ASC LIMIT 2 OFFSET 1;
SELECT * FROM  worktracking.work ORDER BY DATE DESC,id DESC LIMIT 4 OFFSET 0;

-- 查询语句
SELECT * FROM WorkTracking.work;
SELECT * FROM WorkTracking.image;
-- 插入语句
-- 一天
INSERT WorkTracking.work VALUE (NULL ,'2017-12-01','上班');
INSERT WorkTracking.work VALUE (NULL ,'2017-12-01','下班');
-- 一天
INSERT WorkTracking.work VALUE (NULL ,'2017-12-02','上班');
INSERT WorkTracking.work VALUE (NULL ,'2017-12-02','下班');
-- 一天
INSERT WorkTracking.work VALUE (NULL ,'2017-12-03','上班');
INSERT WorkTracking.work VALUE (NULL ,'2017-12-03','下班');
-- 一天
INSERT WorkTracking.work VALUE (NULL ,'2017-12-04','上班');
INSERT WorkTracking.work VALUE (NULL ,'2017-12-04','下班');
-- 一天
INSERT WorkTracking.work VALUE (NULL ,'2017-12-05','上班');
INSERT WorkTracking.work VALUE (NULL ,'2017-12-05','下班');


INSERT WorkTracking.image VALUE (NULL ,'地址',6 ); -- 外键值可以是空，但如果在主表中不存在就无法出入该行

