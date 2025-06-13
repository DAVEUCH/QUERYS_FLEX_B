select pers.DocIdentidad, pers.NombreCliente, pers.Direccion_Cliente, pers.Localidad_Cliente, pers.Telefono, 
Linea_Credito, Linea_Utilizada, Linea_Disponible, ctacte.* 
from usv_ClientesDatosPrincipales pers 
left outer join ness_cuentacorriente_cliente_new ctacte On pers.IDersona = ctacte.DocumentoPagoPersonaID
where pers.DocIdentidad='20550016002'
20550016002

select*from Usuario where Nombre like '%inga%'

select*from Reporte where Nombre='RFO001'

select*from ReporteValorPorDefecto WHERE IDUsuario='600206'

select*from ConfiguracionReporte WHERE IDUsuario='600206'

select*from ItemConfiguracionReporte

select*from TipoReporte

select*from eVistaReporte WHERE IDReporte='7D2C054B-123B-47D3-88A4-E060BEEAD6DC'

select*from VistaReporte WHERE IDReporte='7D2C054B-123B-47D3-88A4-E060BEEAD6DC'

SELECT*FROM eReporte where Nombre='RFO001'

SELECT*FROM VistaReporte where Nombre LIKE '%CUENTA%'

select*from Filtro WHERE IDUsuario='600206'

select*from ItemConfiguracionVistaFiltro WHERE IDUsuario='600206'

------ 5.	Indicar el procedimiento de cómo se soluciona el error de la ejecución del reporte de CUENTA CORRIENTE CAJERA.

select*from Filtro WHERE IDVista='7D2C054B-123B-47D3-88A4-E060BEEAD6DC'

SELECT*FROM FiltroCondicion

------------------------------------

select*from ItemConfiguracionVistaFiltro WHERE IDUsuario='600206'

select*from ItemConfiguracionVistaFiltro where IDUsuario='600206'







988D3449-6C7F-41A1-8754-C6AED146D236