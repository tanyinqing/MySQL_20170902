-- 1. 仿 [http://dict.cn/](http://dict.cn/)
# 设计一个简单的在线电子词典数据库表结构，实现从英文查中文，从中文查英文功能
DROP DATABASE IF EXISTS db;
CREATE DATABASE db;

DROP TABLE IF EXISTS db.english;
CREATE TABLE db.english (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  english    VARCHAR(255) NOT NULL
  COMMENT '英文'
)
  COMMENT '英文表';

DROP TABLE IF EXISTS db.part_of_speech;
CREATE TABLE db.part_of_speech (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  partOfSpeech    VARCHAR(255) NOT NULL
  COMMENT '词性',
  chinese VARCHAR(255) NOT NULL COMMENT '中文',
  englishId INT COMMENT ''
)
  COMMENT '词性表';


# 这个是建立外键约束
ALTER TABLE db.part_of_speech
    ADD CONSTRAINT
part_of_speech_fk_engliishId FOREIGN KEY (englishId)
REFERENCES db.english(id);


INSERT INTO db.english VALUE (NULL, 'apple');
INSERT INTO db.english VALUE (NULL, 'spring');
INSERT INTO db.english VALUE (NULL, 'test');

INSERT INTO db.part_of_speech VALUE (NULL, 'n.', '苹果；珍宝；家伙', 1);
INSERT INTO db.part_of_speech VALUE (NULL, 'n.', '春天；春季；弹簧；弹力；跳；泉水；源头', 2);
INSERT INTO db.part_of_speech VALUE (NULL, 'v.', '跳；弹；快速站起；突然提出；触发捕捉器；(使)裂开；爆炸；释放；涌出；生长；出现；耸立；(风)开始吹', 2);
INSERT INTO db.part_of_speech VALUE (NULL, 'n.', '考验；试验；测试', 3);
INSERT INTO db.part_of_speech VALUE (NULL, 'vt.', '试验；测试；接受测验', 3);

SELECT * FROM db.english;
SELECT * FROM db.part_of_speech;

SELECT * FROM db.english WHERE english LIKE '%apple%';


-- 要显示词性  这个是有条件的联合查询
SELECT  p.partOfSpeech,
  p.chinese FROM db.english e INNER JOIN db.part_of_speech p
ON e.id=p.englishId WHERE e.english='spring';


