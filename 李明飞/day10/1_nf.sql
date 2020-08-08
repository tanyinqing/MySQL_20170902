-- 1nf

DROP DATABASE IF EXISTS db_nf;
CREATE DATABASE db_nf;

-- 1 NF

DROP TABLE IF EXISTS db_nf.student;
CREATE TABLE db_nf.student (
  id             INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'id PK',
  gender         CHAR(20)     NOT NULL
  COMMENT 'gender',
  info           VARCHAR(255) NOT NULL -- 复义
  COMMENT '学生信息',
  departmentId INT COMMENT 'department id FK'
)
  COMMENT 'student table';

-- | 1 | Male | Tom's info... | 1 |
-- | 2 | Female | Jerry's info... | 1 |
-- ...

-- 2 NF: primary key

-- 3NF:

-- department table : id, title, tel

-- | 1 | CS | 123 |
-- | 2 | EE | 456 |