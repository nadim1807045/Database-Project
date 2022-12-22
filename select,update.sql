select * from USER;
select * from GLOCUSE;
select * from VITAMIN;
select * from PROTEIN;
select * from WATER;
select * from NEED;
select * from DIETITIAN;

alter table DIETITIAN add date number(4,2);
alter table DIETITIAN modify date varchar(10);
alter table DIETITIAN rename column date TO meeting;
alter table DIETITIAN drop column meeting;

select height,weight from USER where age IN ( select age from NEED where age  BETWEEN 18 AND 22 ) ;

select AVG(NVL(G_need,0)) FROM NEED;
select count * from USER;


select G_need,P_need,W_need from NEED where age in ( select MAX(age) from NEED);

select g.G_take,g.G_upper,p.P_take,p.P_upper from GLUCOSE g JOIN PROTEIN p USING (id);

select id,g.G_take,g.G_upper,p.P_take,p.P_upper from GLUCOSE g NATURAL JOIN PROTEIN p;

select v.vit_A,v.vit_B,v.vit_C,w.W_take,w.W_upper from VITAMIN v LEFT OUTER JOIN WATER w;

select v.vit_A,v.vit_B,v.vit_C,w.W_take,w.W_upper from VITAMIN v RIGHT OUTER JOIN WATER w;

select v.vit_A,v.vit_B,v.vit_C,w.W_take,w.W_upper from VITAMIN v FULL OUTER JOIN WATER w;

update WATER set W_upper = 2.6 where id = 201;
select * from WATER;

delete from WATER where id = 204;
select * from WATER;