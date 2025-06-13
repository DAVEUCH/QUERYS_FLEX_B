select top 10 *from  vrpteCuentaCorrienteCajaDMA_freddy

select*from GrupoVentas
select*from FuerzaVentas
select*from Persona where PKID=2461--10173
select*from persona where Nombre like 'RICALDI%'

INSERT FuerzaVentas (PKID,IDDivision,Codigo,Nombre, Observacion) values
(16,0,'RH-1','RRHH','' )
INSERT GrupoVentas (PKID,IDFuerzaVentas,IDSupervisor,Codigo,Nombre,Observacion) values
(16,16,68277,'RH-1','RRHH','')