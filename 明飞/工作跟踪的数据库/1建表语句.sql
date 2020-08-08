

-- 查询数据库下表的注释
-- SHOW TABLE STATUS FROM WorkTracking;
-- show colum comment 显示完整的字段信息
-- SHOW FULL COLUMNS FROM WorkTracking.image;

-- 删除数据库
DROP DATABASE  IF EXISTS WorkTracking;
-- 建立数据库和表  work这个是主表  image 这个是从表，必须包含主表的主键
CREATE DATABASE WorkTracking;
CREATE TABLE WorkTracking.work ( -- 这个是主表
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT '表的主键',
  DATE VARCHAR(255) NOT NULL  COMMENT '日期',
  function VARCHAR(255) NOT NULL COMMENT '上班 下班 加班'
) COMMENT '工作跟踪';

CREATE TABLE WorkTracking.image( -- 这个是从表
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT '表的主键id',
  address TEXT NOT NULL COMMENT '截图的地址',
  workId INT  UNIQUE COMMENT '主表的主键' -- 改主键值必须唯一 也就是一个截图对应一个主键
)COMMENT '存储截图';

-- 建立外键约束 必须对应主键才可以 推荐使用
ALTER TABLE WorkTracking.image
  ADD CONSTRAINT
  image_fk_workId  -- 外键约束的别名
FOREIGN KEY (workId) REFERENCES WorkTracking.work(id) -- 对应主表的外键
  ON DELETE CASCADE ;-- 这条选项表明 主表删除 从表引用记录连带删除

