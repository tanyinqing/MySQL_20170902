# Alt+回车  运行相关的代码
DROP DATABASE IF EXISTS MShi;
CREATE DATABASE MShi;
# MShi.score   MShi.

USE scott;
# 用两种方式根据部门号从高到低，工资从低到高列出每个员工的信息。
SELECT * from emp ORDER BY DEPTNO DESC ,SAL;
# 2、列出各个部门中工资高于本部门的平均工资的员工数和部门号，并按部门号排序
SELECT e1.ENAME,count(*) FROM emp e1 WHERE SAL>(SELECT avg(SAL) FROM emp e2 WHERE e1.DEPTNO=e2.DEPTNO);

USE MShi;
# 利用了反向的心里   用一条SQL语句查询出每门课都大于80分的学生姓名
SELECT DISTINCT name FROM score WHERE name NOT IN (SELECT DISTINCT name FROM score WHERE score<80);
# 11.统计每年每月的信息
select year ,
  (select t.amount from sales t where t.month='1' and t.year= sales.year) m1,
  (select t.amount from sales t where t.month='2' and t.year= sales.year) m2,
  (select t.amount from sales t where t.month='3' and t.year= sales.year) m3,
  (select t.amount from sales t where t.month='4' and t.year= sales.year) as m4
from sales group by year;
# 12.显示文章标题，发帖人、最后回复时间
select a.title,a.postuser,
  (select max(postdate) from articles where parentid=a.id) reply
from articles a where a.parentid is null;
# 13.删除除了id号不同,其他都相同的学生冗余信息
delete from student2 where id not in(select mid from (select min(id) mid
 from student2 group by name) as t);
# 14.航空网的几个航班查询题：
# 1、查询起飞城市是北京的所有航班，按到达城市的名字排序
# 参与运算的列是我起码能够显示出来的那些列，但最终我不一定把它们显示出来。
# 各个表组合出来的中间结果字段中必须包含所有运算的字段。

select * from flight f,city c
where f.`endCityID ` = c.cityid and f.startcityid =
(select c1.cityid from city c1 where c1.cityname = "北京" )
order by c.cityname asc ;


 select flight.flightid,'北京' startcity, e.cityname from flight,city e
 where flight.`endCityID `=e.cityid and flight.startcityid=(select cityid from city
 where cityname='北京');

 select flight.flightid,s.cityname,e.cityname from flight,city s,city e
 where flight.startcityid=s.cityid and s.cityname='北京' and flight.`endCityID `=e
 .cityID order by e.cityName desc;

# 2、查询北京到上海的所有航班纪录（起飞城市，到达城市，起飞时间，航班号）
select c1.CityName,c2.CityName,f.StartTime,f.flightID
from city c1,city c2,flight f
where f.StartCityID=c1.cityID
      and f.`endCityID `=c2.cityID
      and c1.cityName='北京'
      and c2.cityName='上海';
# 3、查询具体某一天（2005-5-8）的北京到上海的的航班次数
select count(*) from
  (select c1.cityName,c2.cityID,f.StartTime,f.flightID
   from city c1,city c2,flight f
   where f.StartCityID=c1.cityID
          and f.`endCityID `=c2.cityID
         and c1.cityName='北京'
         and c2.cityName='上海'
         and f.startTime like '2019-07-18%')as a;

#    mysql中提取日期部分进行比较的示例代码如下：
select * from flight where date_format(starttime,'%Y-%m-%d')='2019-07-18';
# 15.查出比经理薪水还高的员工信息：
# 解题思路：
# 根据sql语句的查询特点，是逐行进行运算，不可能两行同时参与运算。
# 涉及了员工薪水和经理薪水，所有，一行记录要同时包含两个薪水，所有想到要把这个表自关联组合一下。
# 首先要组合出一个包含有各个员工及该员工的经理信息的长记录，譬如，左半部分是员工，右半部分是经理。
# 而迪卡尔积会组合出很多垃圾信息，先去除这些垃圾信息。
select e.* from employees e,employees m where e.managerid=m.id and e.salary>m.salary;
# 16、求出小于45岁的各个老师所带的大于12岁的学生人数
# 结果：2à3,3à2,4à3
# 解题思路：（真实面试答题时，也要写出每个分析步骤，如果纸张不够，就找别人要）
# 1要会统计分组信息，统计信息放在中间表中：
select teaid,count(*) from tea_stu group by teaid;

# 2接着其实应该是筛除掉小于12岁的学生，然后再进行统计，
# 中间表必须与student关联才能得到12岁以下学生和把该学生记录从中间表中剔除，代码是：
select tea_stu.teaid,count(*) total from student,tea_stu
where student.stuid=tea_stu.stuid and student.age>12 group by tea_stu.teaid;

# 3.接着把上面的结果做成虚表与teacher进行关联，并筛除大于45的老师
select teacher.teaid,teacher.name,total from teacher ,(select tea_stu.teaid,
  count(*) total from student,tea_stu where student.stuid=tea_stu.stuid and
  student.age>12 group by tea_stu.teaid) as tea_stu2 where teacher.teaid=tea_stu2.teaid
 and teacher.age<45;
# 17.求出发帖最多的人：
select parentid,count(*) total from articles
group by parentid
having total=(select max(total2) from
  (select count(*) total2 from articles group by parentid) as t);

select t.parentid,max(t.total) from (select parentid,count(*) total from articles )as t;
# 这条语句不行，因为max只有一列，不能与其他列混淆。
# 下面这条语句不行。查不到数据
select parentid,count(*) total from articles
group by parentid having total=max(total);
# 20. xxx公司的sql面试
# (2）基于上述EMPLOYEES表写出查询：写出雇用日期在今年的，或者工资在[1000,2000]之间的，
#  或者员工姓名（last_name）以’Obama’打头的所有员工，列出这些员工的全部个人信息。（4分）
# Year(HIREDATE) = Year(curdate()); 这个是去当年的年份
use scott;
select * from emp
where Year(HIREDATE) = 1981
 or (SAL between 1000 and 4000) or LEFT(ENAME,3)='SCO';

# (3) 基于上述EMPLOYEES表写出查询：查出部门平均工资大于1800元的部门的所有员工，
# 列出这些员工的全部个人信息。（4分）
# 这个没有实现
 select EMPNO,ENAME,SAL,DEPTNO did from emp where (select avg(SAL)
  from emp where DEPTNO = did) > 1800;

# (4) 基于上述EMPLOYEES表写出查询：查出个人工资高于其所在部门平均工资的员工，
# 列出这些员工的全部个人信息及该员工工资高出部门平均工资百分比。（5分）
select emp.*,(emp.SAL-t.avgSalary)*100/emp.SAL
from emp,
  (select DEPTNO,avg(SAL) avgSalary from emp group by DEPTNO) as t
where emp.DEPTNO = t.DEPTNO and emp.SAL>t.avgSalary;


# 一下是建表语句----------------------------------------------------------------------------------------
# 16、求出小于45岁的各个老师所带的大于12岁的学生人数
# 数据库中有3个表 teacher 表，student表，tea_stu关系表。
# teacher 表 teaID name age
# student 表 stuID name age
# teacher_student表 teaID stuID
# 要求用一条sql查询出这样的结果
# 1.显示的字段要有老师name, age 每个老师所带的学生人数
# 2 只列出老师age为40以下，学生age为12以上的记录
# 预备知识：
# 1.sql语句是对每一条记录依次处理，条件为真则执行动作（select,insert,delete,update）
# 2.只要是迪卡尔积，就会产生“垃圾”信息，所以，只要迪卡尔积了，我们首先就要想到清除“垃圾”信息
# 实验准备：
drop table if exists tea_stu;
drop table if exists teacher;
drop table if exists student;
create table teacher(teaID int primary key,name varchar(50),age int);
create table student(stuID int primary key,name varchar(50),age int);
create table tea_stu(teaID int references teacher(teaID),stuID int references student(stuID));
insert into teacher values(1,'zxx',45), (2,'lhm',25) , (3,'wzg',26) , (4,'tg',27);
insert into student values(1,'wy',11), (2,'dh',25) , (3,'ysq',26) , (4,'mxc',27);
insert into tea_stu values(1,1), (1,2), (1,3);
insert into tea_stu values(2,2), (2,3), (2,4);
insert into tea_stu values(3,3), (3,4), (3,1);
insert into tea_stu values(4,4), (4,1), (4,2) , (4,3);
# 15.查出比经理薪水还高的员工信息：
Drop table if EXISTS employees;
create table employees(id int primary key auto_increment,name varchar(50)
  ,salary int,managerid int references employees(id));
insert into employees values (null,' lhm',10000,null), (null,' zxx',15000,1
),(null,'flx',9000,1),(null,'tg',10000,2),(null,'wzg',10000,3);

# 14.航空网的几个航班查询题：
# 表结构如下：
# flight{flightID,StartCityID ,endCityID,StartTime}
# city{cityID, CityName)
# 实验环境：
create table city(cityID int auto_increment primary key,cityName varchar(20));
create table flight (flightID int auto_increment primary key,
                     StartCityID int references city(cityID),
                     endCityID  int references city(cityID),
                     StartTime Timestamp );
# //航班本来应该没有日期部分才好，但是下面的题目当中涉及到了日期
insert into city values(null,'北京'),(null,'上海'),(null,'广州');
insert into flight values(null,1,2,'2019-07-18 9:37:23'),(null,1,3,'2019-07-18 9:37:23'),(null,1,2,'2019-07-18 10:37:23'),(null,2,3,'2019-07-18 10:37:23');

# 13.删除除了id号不同,其他都相同的学生冗余信息
# 2.学生表 如下:
# id号   学号   姓名 课程编号课程名称 分数
# 1        2005001  张三  0001      数学    69
# 2        2005002  李四  0001      数学    89
# 3        2005001  张三  0001      数学    69
# A: delete from tablename where id号 not in(select min(id号) from tablename group by 学号,姓名,课程编号,课程名称,分数)
# 实验：
create table student2(id int auto_increment primary key,code varchar(20),name varchar(20));
insert into student2 values(null,'2005001','张三'),(null,'2005002','李四'),(null,'2005001','张三');

# 12.显示文章标题，发帖人、最后回复时间
# 表：id,title,postuser,postdate,parentid
# 准备sql语句：
drop table if exists articles;
create table articles(id int auto_increment primary key,title varchar(50), postuser varchar(10), postdate datetime,parentid int references articles(id));
insert into articles values
  (null,'第一条','张三','1998-10-10 12:32:32',null),
  (null,'第二条','张三','1998-10-10 12:34:32',null),
  (null,'第一条回复1','李四','1998-10-10 12:35:32',1),
  (null,'第二条回复1','李四','1998-10-10 12:36:32',2),
  (null,'第一条回复2','王五','1998-10-10 12:37:32',1),
  (null,'第一条回复3','李四','1998-10-10 12:38:32',1),
  (null,'第二条回复2','李四','1998-10-10 12:39:32',2),

  (null,'第一条回复4','王五','1998-10-10 12:39:40',1);
# 11.统计每年每月的信息
drop table if exists sales;
create table sales(id int auto_increment primary key,year varchar(10), month varchar(10), amount float(2,1));
insert into sales values
  (null,'1991','1',1.1),
  (null,'1991','2',1.2),
  (null,'1991','3',1.3),
  (null,'1991','4',1.4),
  (null,'1992','1',2.1),
  (null,'1992','2',2.2),
  (null,'1992','3',2.3),
  (null,'1992','4',2.4);
# 10.每个月份的发生额都比101科目多的科目
drop table if exists TestDB;
create table TestDB(id int primary key auto_increment,AccID varchar(20), Occmonth date, DebitOccur bigint);
insert into TestDB values
  (null,'101','1988-1-1',100),
  (null,'101','1988-2-1',110),
  (null,'101','1988-3-1',120),
  (null,'101','1988-4-1',100),
  (null,'101','1988-5-1',100),
  (null,'101','1988-6-1',100),
  (null,'101','1988-7-1',100),
  (null,'101','1988-8-1',100);
# --复制上面的数据，故意把第一个月份的发生额数字改小一点
insert into TestDB values
(null,'102','1988-1-1',90),
(null,'102','1988-2-1',110),
(null,'102','1988-3-1',120),
(null,'102','1988-4-1',100),
(null,'102','1988-5-1',100),
(null,'102','1988-6-1',100),
(null,'102','1988-7-1',100),
(null,'102','1988-8-1',100);
# --复制最上面的数据，故意把所有发生额数字改大一点
insert into TestDB values
(null,'103','1988-1-1',150),
(null,'103','1988-2-1',160),
(null,'103','1988-3-1',180),
(null,'103','1988-4-1',120),
(null,'103','1988-5-1',120),
(null,'103','1988-6-1',120),
(null,'103','1988-7-1',120),
(null,'103','1988-8-1',120);
# --复制最上面的数据，故意把所有发生额数字改大一点
insert into TestDB values
(null,'104','1988-1-1',130),
(null,'104','1988-2-1',130),
(null,'104','1988-3-1',140),
(null,'104','1988-4-1',150),
(null,'104','1988-5-1',160),
(null,'104','1988-6-1',170),
(null,'104','1988-7-1',180),
(null,'104','1988-8-1',140);
# --复制最上面的数据，故意把第二个月份的发生额数字改小一点
insert into TestDB values
(null,'105','1988-1-1',100),
(null,'105','1988-2-1',80),
(null,'105','1988-3-1',120),
(null,'105','1988-4-1',100),
(null,'105','1988-5-1',100),
(null,'105','1988-6-1',100),
(null,'105','1988-7-1',100),
(null,'105','1988-8-1',100);

# 用一条SQL语句查询出每门课都大于80分的学生姓名
create table MShi.score(id int primary key auto_increment,name varchar(20),subject varchar(20),score int,time TIMESTAMP);
insert into MShi.score values
  (null,'张三','语文',81,null),
  (null,'张三','数学',75,null),
  (null,'李四','语文',76,null),
  (null,'李四','数学',90,null),
  (null,'王五','语文',81,null),
  (null,'王五','数学',100,null),
  (null,'王五 ','英语',90,null);

# 模糊查询
select * from MShi.score WHERE name LIKE "%五";

#计算个数  这个是聚合函数
select count(*) FROM MShi.score WHERE name="王五";
# 按照多个字段进行分类筛选
select min(id) from MShi.score GROUP BY name,subject,score;
#找出所有成绩都大于80分的学生
select distinct name from MShi.score  where name NOT IN (select distinct name from MShi.score where score<=80);
# 找出前三条数据
select * from MShi.score LIMIT 0,3;

select name from MShi.score group by name having min(score)>80;
#  select distince name t1 from MShi.score where 80< all (select score from score where name=t1);


# 这是测试一个数据库表的信息
drop table if exists MShi.tea_stu;
drop table if exists MShi.teacher;
drop table if exists MShi.student;
create table MShi.teacher(teaID int primary key,name varchar(50),age int);
create table MShi.student(stuID int primary key,name varchar(50),age int);
create table MShi.tea_stu(teaID int references teacher(teaID),stuID int references student(stuID));
insert into MShi.teacher values(1,'zxx',45), (2,'lhm',25) , (3,'wzg',26) , (4,'tg',27);
insert into MShi.student values(1,'wy',11), (2,'dh',25) , (3,'ysq',26) , (4,'mxc',27);
insert into MShi.tea_stu values(1,1), (1,2), (1,3);
insert into MShi.tea_stu values(2,2), (2,3), (2,4);
insert into MShi.tea_stu values(3,3), (3,4), (3,1);
insert into MShi.tea_stu values(4,4), (4,1), (4,2) , (4,3);

select teaid,count(*) from MShi.tea_stu group by teaid;



