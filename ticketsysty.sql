create table archivo (
id int primary key identity(1,1),
name varchar(100),
type varchar(40),
size varchar,
id_ticket int references ticket(id_ticket))


create table ticket (
id int primary key identity(1,1),
title varchar(8000),
descriptione varchar(8000),
updated_at datetime,
created_at datetime ,
user_idd int references userr(user_idd),
asigned_id int references asignado (asigned_id),
project_id int references project (asigned_id),
id_subcategoria int references subcategoria (id_subcategoria),
priority_id int references priorityy (priority_id),
status_id int references statusy (status_id),
area_id int references area (area_id),
id_empresa int references empresa (id_empresa)
--id_empresa int
)
--------
drop table area (
id int primary key identity(1,1),
name varchar(8000))

-------------------------------------------
drop table category (
id int primary key identity(1,1),
namen varchar(8000),
--id_usuario_asignado_principal int references asignado (asigned_id)
id_subcategory int references subcategory (id)
)

--------------------------
drop table empresa (
id int primary key identity(1,1),
namen varchar(8000))

----------
drop table priorityy (
id int primary key identity(1,1),
namen varchar(8000))

----
drop table project (
id int primary key identity(1,1),
namen varchar(8000),
descriptione varchar(8000))
------
drop table statusy (
id int primary key identity(1,1),
namen varchar(8000))

drop table subcategory (
id int primary key identity(1,1),
namen varchar(8000))


--create table subcategory (
--id int primary key identity(1,1),
--namen varchar(8000),
--id_category int references category (id_category))

create table ticket_aud (
id int primary key identity(1,1),
title varchar(8000),
asigned_id int references asignado (asigned_id),
descriptione varchar(8000),
status_id int references statusy (status_id),
updated_at datetime,
user_idd int references userr(user_idd)
)

create table userr (
id int primary key identity(1,1),
title varchar(8000),
asigned_id int references asignado (asigned_id),
descriptione varchar(8000),
status_id int references statusy (status_id),
updated_at datetime,
user_idd int references userr(user_idd))create table asignado (
id int primary key identity(1,1),
title varchar(8000),
descriptione varchar(8000),
updated_at datetime)


