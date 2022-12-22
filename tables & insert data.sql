create user nadim identified by 45;
grant all privileges to nadim;
connect nadim
45

drop table DIETITIAN;
drop table NEED;
drop table WATER;
drop table PROTEIN;
drop table VITAMIN;
drop table GLOCUSE;
drop table USER;

create table USER(
	name varchar(10),
	id integer NOT NULL,
	age integer,
	height integer,
	weight integer,
	PRIMARY KEY(id)
	);

create table GLOCUSE(
	id integer,
	G_take number(4,1),
	G_upper number(4,1),
	FOREIGN KEY (id) REFERENCES USER(id) ON DELETE CASCADE
	);

create table VITAMIN(
	id integer,
	vit_A number(4,1),
	vit_C number(4,1),
	vit_B number(4,1),
	FOREIGN KEY (id) REFERENCES USER(id) ON DELETE CASCADE
	);

create table PROTEIN(
	id integer,
	P_take number(4,1),
	P_upper number(4,1),
	FOREIGN KEY (id) REFERENCES USER(id) ON DELETE CASCADE
	);

create table WATER(
	id integer NOT NULL,
	W_take number(2,1),
	W_upper number(2,1),
	FOREIGN KEY (id) REFERENCES USER(id) ON DELETE CASCADE
	);

create table NEED(
	age integer NOT NULL,
	G_need number(4,1),
	P_need number(4,1),
	W_need number(2,1)
	);

create table DIETITIAN(
	d_id integer NOT NULL ,
	id integer ,
	suggestion varchar(20),
	PRIMARY KEY(d_id),
	FOREIGN KEY (id) REFERENCES USER(id) ON DELETE CASCADE
	);

describe USER;
describe GLOCUSE;
describe VITAMIN;
describe PROTEIN;
describe WATER;
describe NEED;
describe DIETITIAN;

insert into USER values ('Alif',201,22,5.10,80);
insert into USER values ('Rana',202,21,5.07,75);
insert into USER values ('Mahi',204,18,5.05,62);

insert into GLOCUSE values (201,223.6,250.0);
insert into GLOCUSE values (202,237.3,267.2);

insert into VITAMIN values (201,220,110,550.7);
insert into VITAMIN values (202,221,101,550.7);

insert into PROTEIN values (201,110.9,150.0);
insert into PROTEIN values (204,220.9,250.1);
insert into PROTEIN values (205,210.8,270);

insert into WATER values (204,1.9,2.7);
insert into WATER values (205,2.0,2.5);
insert into WATER values (201,1.8,2.7);

insert into NEED values (18,300.5,270.4,2.6);
insert into NEED values (21,311.5,250.7,2.0);
insert into NEED values (22,280.9,285.4,2.1);
insert into NEED values (23,307.5,279.5,2.4);
insert into NEED values (19,308.3,270.4,2.3);

insert into DIETITIAN values (101,201,'Enough intake of Nutrition');
insert into DIETITIAN values (101,204,'Less intake of Nutrition');
insert into DIETITIAN values (102,205,'Excess intake of Nutrition');

commit;