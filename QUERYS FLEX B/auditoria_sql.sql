select*from Auditoria where Operacion='Eliminar' 
--and NombreTipo like '%moneda%'
select
USU.IDUsuario,
USU.Nombre,
au.NombreTipo,
au.Operacion,
au.IDEntidad,
au.PC,
au.Fecha,
au.ContenidoXML
from Auditoria au
left join Usuario USU on usu.PKID= au.IDUsuario
where  
NombreTipo='TipoCambioFecha'
--and Operacion='Eliminar' 
order by  au.Fecha desc

select*from 

select*from usv_NotaCreditoVenta_auditoria

select * from Auditoria

select*from vFB_RegistroAuditoria

