alter view usv_Control_Comprobantes_GC_Guiasftop
as
Select  distinct
ucc.PedidoNro,
ucc.Fecha,
ucc.PedidoFechaEmision,
ucc.PedidoHoraEmision,
ucc.PedidoEstadoAprobacion,
ucc.PedidoFechaAprobacion,
ucc.PedidoHoraAprobacion,
ucc.ClienteNombre,
udu.Direccion as Direccion_cliente,
udu.Provincia as Provi_cliente,
udu.Distrito as Dist_cliente,
ucc.VendedorNombre,
ucc.ZonaReparto,
ucc.FacturaNro,
ucc.FacturaFechaEmision,
ucc.FacturaHoraEmision,
ucc.FacturaTotal,
ucc.GuiaNro,
ucc.GuiaFechaEmision,
ucc.GuiaHoraEmision,
ucc.ConsolidadoNro,
ucc.ConsolidadoFechaEmision,
ucc.ConsolidadoHoraEmision,
upct.NombreAgenTransp as Transportista,
udutrans.Direccion as Direccion_Transportista,
udutrans.Provincia as Provi_Transportista,
udutrans.Distrito as Dist_Transportista,
ucc.Bultos,
SUM( icp.Cantidad*und.Peso) as Peso_Total_GR
from usv_Control_Comprobantes_VPM_vr2 ucc
left join usv_DireccionyUbigeo udu on ucc.Id_Cliente=udu.IDCliente
left join usv_Pedido_ClienteyTransporte upct on ucc.PedidoID=upct.PKIDPedido
left join usv_DireccionyUbigeo_Trans udutrans on upct.IDCliente_Entrega=udutrans.IDTransportista
inner join ItemCp icp on icp.IDCp=upct.PKIDPedido
inner join ItemProducto iprod on iprod.PKID=icp.PKID
INNER JOIN Unidad und on und.PKID= iprod.IDUnidad
--Where ucc.Fecha Between '16-06-2025' and '18-06-2025' 
--and ucc.PedidoNro='814-0052655'
GROUP BY
    ucc.PedidoNro,
    ucc.Fecha,
    ucc.PedidoFechaEmision,
    ucc.PedidoHoraEmision,
    ucc.PedidoEstadoAprobacion,
    ucc.PedidoFechaAprobacion,
    ucc.PedidoHoraAprobacion,
    ucc.ClienteNombre,
    udu.Direccion,
    udu.Provincia,
    udu.Distrito,
    ucc.VendedorNombre,
    ucc.ZonaReparto,
    ucc.FacturaNro,
    ucc.FacturaFechaEmision,
    ucc.FacturaHoraEmision,
    ucc.FacturaTotal,
    ucc.GuiaNro,
    ucc.GuiaFechaEmision,
    ucc.GuiaHoraEmision,
    ucc.ConsolidadoNro,
    ucc.ConsolidadoFechaEmision,
    ucc.ConsolidadoHoraEmision,
    upct.NombreAgenTransp,
    udutrans.Direccion,
    udutrans.Provincia,
    udutrans.Distrito,
    ucc.Bultos;


select *from usv_Control_Comprobantes_VPM_vr2 where PedidoNro='814-0052651'
--select *from usv_Control_Comprobantes_GC_Guiasftop where PedidoNro='814-0052652'
select*from Persona where PKID=1739
select*from Persona where PKID=1739
select *from usv_DireccionyUbigeo where IDCliente=1739
select *from usv_Pedido_ClienteyTransporte where NumeroPedido='814-0052651'
select top 10*from usv_DireccionyUbigeo_Trans where IDTransportista=5975
select top 2*from ItemCp
select top 2*from ItemProducto
select top 2*from Unidad

IDUnidad
121
---freddy
select top 1*from usv_Control_Comprobantes_VPM_2 
select top 1*from vInfoCpInventarioDireccionTransporte

select*from usv_Control_Comprobantes_GC_Guiasftop where PedidoNro='814-0051213'

Select distinct * from usv_Control_Comprobantes_VPM Where Fecha Between @fecIni and @fecFin order by PedidoNro

--idcliente
PedidoNro
814-0051213
--id pedido


alter  view [dbo].[usv_DireccionyUbigeo_Trans]
as
Select Direccion.pkid as ID_Direccion, Direccion.descripcion as Direccion, Departamento.descripcion as Departamento, 
Provincia.descripcion as Provincia, Distrito.descripcion as Distrito, Persona.pkid as IDTransportista, Persona.nombre as NombreTransportista
From dbo.Direccion 
LEFT OUTER JOIN dbo.Departamento ON dbo.Direccion.IDDepartamento = Departamento.pkid         
LEFT OUTER JOIN dbo.Provincia ON dbo.Direccion.IDProvincia = Provincia.pkid        
LEFT OUTER JOIN dbo.Distrito ON dbo.Direccion.IDDistrito = Distrito.pkid        
LEFT OUTER JOIN dbo.Persona ON dbo.Persona.pkid = Direccion.idPersona 
inner JOIN Freddy.EmpresaTransporte FET ON dbo.Persona.pkid= FET.PKID
GO

select top 10*from usv_DireccionyUbigeo_Trans where IDTransportista=56

select*from Persona where DocIdentidad='10157596883'

select top 10*from CpInventarioSalida

select top 1*from ItemCp
select top 1*from Unidad
