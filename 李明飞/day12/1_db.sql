-- 实现一个工作日志系统的数据库表设计
DROP DATABASE IF EXISTS db;
CREATE DATABASE db;

DROP TABLE IF EXISTS db.user;
CREATE TABLE db.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  username    VARCHAR(255) NOT NULL
  COMMENT '用户名',
  password    VARCHAR(255) NOT NULL
  COMMENT 'password' ,
  team    VARCHAR(255) NOT NULL
  COMMENT 'team' ,
  role    VARCHAR(255) NOT NULL
  COMMENT '组员'
)
  COMMENT '用户';


DROP TABLE IF EXISTS db.log;
CREATE TABLE db.log (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  content   TEXT NOT NULL
  COMMENT 'content',
  time    DATE NOT NULL
  COMMENT 'time' ,
  userId   INT
  COMMENT 'userId'
)
  COMMENT '日志表';

ALTER TABLE db.log
  ADD CONSTRAINT
  log_fk_userId FOREIGN KEY (userId)
REFERENCES db.user(id);

-- 用户注册

INSERT INTO db.user VALUE (NULL ,'Tom','123','第一组','组员');
INSERT INTO db.user VALUE (NULL ,'Jerry','123','第二组','组长');
INSERT INTO db.user VALUE (NULL ,'Scott','123','第一组','组长');
INSERT INTO db.user VALUE (NULL ,'zhangsan','123','第一组','组员');

SELECT * FROM db.user;


-- 登录
SELECT * FROM db.user WHERE username='tom' AND password='123';

-- 发布日志
INSERT INTO db.log VALUE (NULL ,'tom\'s,log...','2017-12-20',1);
INSERT INTO db.log VALUE (NULL ,'tom\'s,log...','2017-12-21',1);
INSERT INTO db.log VALUE (NULL ,'jerry\'s,log...','2017-12-20',2);
INSERT INTO db.log VALUE (NULL ,'scott\'s,log...','2017-12-20',3);
INSERT INTO db.log VALUE (NULL ,'scott\'s,log...','2017-12-22',3);
-- 查询日志
SELECT * FROM db.log WHERE userId=1;
-- 组长  外连接 查询
SELECT u.username,l.content,l.time FROM db.user u LEFT OUTER  JOIN db.log l ON u.id=l.userId
WHERE u.team='第一组';
-- 搜索查询日志  组长
SELECT u.username,l.content,l.time FROM db.user u LEFT OUTER  JOIN db.log l ON u.id=l.userId
WHERE u.team='第一组' AND u.username='tom';

SELECT u.username,l.content,l.time FROM db.user u LEFT OUTER  JOIN db.log l ON u.id=l.userId
WHERE u.team='第一组' AND l.time='2017-12-20';

