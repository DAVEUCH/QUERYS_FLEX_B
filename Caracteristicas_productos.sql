select
carac10.IDTipoCaracteristica as Tipo_Codigo_Marca_Auto,
carac10.Descripcion as Nombre_Lado
from ProductoServicio ps
left join Producto pro on pro.PKID= ps.PKID
left join Caracteristica carac10 on carac10.PKID=pro.IDCaracteristica10

select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=2----marca
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=5----motor
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=3----modelo
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=4----año
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=6----cilindro
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=7----Litros
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=8----medidas
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=10----voltios
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=11----Tipo_encendido
select  Codigo,Descripcion from Caracteristica where IDTipoCaracteristica=12----Lado
-------------------------------------------------------------------------
select
carac3.IDTipoCaracteristica as Tipo,
carac3.Descripcion as Año_Auto
from ProductoServicio ps
left join Producto pro on pro.PKID= ps.PKID
left join Caracteristica carac3 on carac3.PKID=pro.IDCaracteristica3

