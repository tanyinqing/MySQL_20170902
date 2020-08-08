

# 大于或等于80表示优秀，大于或等于60表示及格，小于60分表示不及格  没有实现
select
  (case when 语文>=80 then '优秀'
   when 语文>=60 then '及格'
   else '不及格') as 语文,
   (case when 数学>=80 then '优秀'
    when 数学>=60 then '及格'
    else '不及格') as 数学,
    (case when 英语>=80 then '优秀'
     when 英语>=60 then '及格'
     else '不及格') as 英语
     from MShi.score;


#   删除除了自动编号不同, 其他都相同的学生冗余信息  这个执行错误
delete FROM MShi.score WHERE id not in (select min(id) from MShi.score GROUP BY name,subject,score );

select * from MShi.score WHERE name REGEXP "^五";#这个是正则表达式如何实现
