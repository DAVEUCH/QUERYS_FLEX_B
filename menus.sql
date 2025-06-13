select *from ConfiguracionContenedores where IDUsuario=4146
--select*from ConfiguracionVista 
select  top 1*from eContenedor1 where Nivel=1
select  top 1*from Contenedor2
select  top 1*from Contenedor3 where Nivel=1
select  top 1*from eContenedor3 where Nivel=1

select top 1*from usv_eContenedor3_Niv1

select top 1 *from usv_eContenedor3_Niv2

select top 1 *from usv_eContenedor3_Niv3

select top 1*from usv_eContenedor3_Niv4
select top 1*from vista_Contenedor2


select 
cc.Descripcion as perfil,
un1.Descripcion as menu_prin,
un2.Descripcion as menu_sec,
un3.Descripcion as menu_terc
from ConfiguracionContenedores cc
left join usv_eContenedor3_Niv1 un1 on un1.IDConfiguracionContenedor=cc.PKID
left join usv_eContenedor3_Niv2 un2 on un1.IDContenedorPadre=un2.IDContenedorPadre and un2.IDConfiguracionContenedor=cc.PKID
left join usv_eContenedor3_Niv3 un3 on un3.IDContenedorPadre=un2.IDContenedorPadre
where cc.PKID=58

select top 10 *
from usv_eContenedor3_Niv2 un2
where un2.IDContenedorPadre in (
  select un1.IDContenedorPadre from usv_eContenedor3_Niv1 un1
)

select top 10 *
from usv_eContenedor3_Niv3 un3
where un3.IDContenedorPadre in (
  select un2.IDContenedorPadre from usv_eContenedor3_Niv2 un2
)







select*from Usuario where Nombre='JEFE DE CRECO'

PKID=4208

select*from ePerfilUsuario where IDUsuario='DMARIÑASO'

select*from Usuario where IDUsuario='DMARIÑASO'

select*from 

SELECT*FROM Persona WHERE CODIGO='A70882417'

SELECT*FROM Marca WHERE Descripcion='CRICRI'