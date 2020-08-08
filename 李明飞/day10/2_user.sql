-- 设计一个能够简单实现用户注册、登录、注销的数据库表结构

DROP DATABASE IF EXISTS db;
CREATE DATABASE db;

DROP TABLE IF EXISTS db.user;
CREATE TABLE db.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  email    VARCHAR(191) NOT NULL UNIQUE
  COMMENT 'email',
  username VARCHAR(255) NOT NULL
  COMMENT 'username',
  password VARCHAR(255) NOT NULL
  COMMENT 'password',
  role VARCHAR(255) NOT NULL DEFAULT 'user'
  COMMENT ''-- 标志管理员
)
  COMMENT 'user table';


DROP TABLE IF EXISTS db.message;
CREATE TABLE db.message (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  cotent  TEXT   COMMENT '留言',
  time DATETIME NOT NULL DEFAULT now(),
  userId INT COMMENT '用户的id'
)
  COMMENT '留言';

ALTER TABLE db.message
    ADD CONSTRAINT
message_fk_userId FOREIGN KEY (userId)
  REFERENCES db.user(id);

INSERT INTO db.user VALUE (NULL, 'tom@qq.com', 'Tom', '123',"user");
INSERT INTO db.user VALUE (NULL, 'jerry@qq.com', 'Jerry', '456',"user");

SELECT *
FROM db.user;

-- sign up 注册
INSERT INTO db.user VALUE (NULL, 'tester@test.com', 'tester', 'abc',"user");

-- sign in 登录
SELECT *
FROM db.user
WHERE email = 'tester@test.com' AND password = 'abc';

-- sign out 注销

-- 1, 2, 3, 4
-- 3. 在题 2 的基础上，实现用户留言功能

INSERT INTO db.message(cotent, userId) VALUE ('留言1',1);
INSERT INTO db.message(cotent, userId) VALUE ('留言2',2);
INSERT INTO db.message(cotent, userId) VALUE ('留言3',2);

SELECT * FROM db.message;

-- 4. 在题 3 的基础上，添加管理员管理留言功能，管理员无须注册，使用 SQL 初始化
-- 添加管理员账号
INSERT INTO db.user VALUE (NULL ,'ddf','soctt','789','admin');
-- 登录
SELECT * FROM db.user WHERE email='ddf' AND password='789';
-- 查询信息
SELECT * FROM db.user u INNER JOIN db.message m ON u.id=m.userId;
-- 删除
DELETE FROM db.message WHERE id=9;

