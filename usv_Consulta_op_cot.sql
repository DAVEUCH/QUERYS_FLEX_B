SELECT DISTINCT ISNULL(dbo.Cp.Revisado, 0) AS Expr1, dbo.Cp.PKID AS ID, dbo.TipoCp.Abreviacion AS Doc, dbo.Cp.NumCp, dbo.Cp.Hora, dbo.Cp.Fecha, 
dbo.Cp.FechaEmision,dbo.Cp.Total, CASE WHEN dbo.Cp.Anulado = 1 THEN '**ANULADO**' ELSE ' ' END AS Anulado, dbo.Moneda.Simbolo AS Moneda, 
dbo.Cp.PersonaNombre,
LEN(dbo.Persona.DocIdentidad) AS PersonaTipoDocumentoLongitud, dbo.TipoDocIdentidad.Abreviacion AS PersonaTipoDocumento,
dbo.Persona.DocIdentidad AS PersonaDocIdentidad, dbo.Pedido.EstadoFacturacion, dbo.Pedido.EstadoEntrega, dbo.Pedido.EstadoAprobacion, 
dbo.Pedido.NumeroOrdenCompra,
dbo.Pedido.Cancelado, dbo.Sucursal.Nombre AS SucursalNombre, dbo.ModalidadCredito.Descripcion AS ModalidadCredito,dbo.Zona.Codigo AS ZonaRepartoCodigo, 
dbo.Zona.Descripcion AS ZonaRepartoDescripcion, 
CASE WHEN DATENAME(dw, dbo.Cp.Fecha + 1) = 'Domingo' THEN 'Lunes' ELSE DATENAME(dw, dbo.Cp.Fecha + 1) END AS DiaPedido, 
dbo.fun_ObtenerCodigoVehiculoReparto(dbo.CpDistribucion.IDZonaReparto,CASE WHEN DATENAME(dw, dbo.Cp.Fecha + 1) = 'Domingo' THEN 'Lunes' ELSE DATENAME(dw, dbo.Cp.Fecha + 1) END) AS CodigoVehiculo, 
dbo.fun_ObtenerNombreVehiculoReparto(dbo.CpDistribucion.IDZonaReparto, CASE WHEN DATENAME(dw, dbo.Cp.Fecha + 1) = 'Domingo' THEN 'Lunes' ELSE DATENAME(dw, dbo.Cp.Fecha + 1) END) AS NombreVehiculo, 
dbo.Cp.PKID AS Expr4, dbo.Pedido.Ajustado, 
dbo.Persona.Nombre AS Expr2, Persona_1.Codigo AS VendedorCodigo, Persona_1.Nombre AS VendedorNombre, 
dbo.Pedido.FechaAprobacion, dbo.FuerzaVentas.Nombre AS FuerzaVentas, dbo.LineaCreditoPorFuerzaVentas.Monto AS TotalLinea, 
dbo.LineaCreditoPorFuerzaVentas.Monto - dbo.LineaCreditoPorFuerzaVentas.BalanceSoles AS TotalSaldo, 
REPLICATE('0', 4 - LEN(CAST(DZ.OrdenVisita AS varchar))) + CAST(DZ.OrdenVisita AS varchar) AS OrdenVisita, dbo.FEstado.Descripcion, 
usv_direccion_Zonareparto.CodigoZonaREPA As ZonaREP, 
case isnull(GC_PedidosCliente.IDPedido,0) when 0 then '' else 'SI' end AS REGISTRAPLAZOS

FROM dbo.TipoDocIdentidad 
INNER JOIN dbo.Cp WITH (NOLOCK) 
INNER JOIN dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID 
INNER JOIN dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID 
INNER JOIN dbo.Pedido WITH (NOLOCK) ON dbo.Cp.PKID = dbo.Pedido.PKID 
INNER JOIN dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID 
INNER JOIN dbo.Persona WITH (NOLOCK) ON dbo.Cp.IDPersona = dbo.Persona.PKID 
ON dbo.TipoDocIdentidad.PKID = dbo.Persona.IDTipoDocIdentidad 
INNER JOIN dbo.Persona AS Persona_1 ON dbo.Cp.IDResponsable = Persona_1.PKID 
INNER JOIN dbo.Vendedor ON Persona_1.PKID = dbo.Vendedor.PKID 
LEFT OUTER JOIN dbo.FEstado ON dbo.Pedido.PKID = dbo.FEstado.IDEntidad 
LEFT OUTER JOIN Freddy.PedidoFreddy ON dbo.Pedido.PKID = Freddy.PedidoFreddy.PKID 
LEFT OUTER JOIN dbo.FuerzaVentas 
INNER JOIN dbo.Zona 
INNER JOIN dbo.CpDistribucion WITH (NOLOCK) ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaReparto 
ON dbo.FuerzaVentas.PKID = dbo.CpDistribucion.IDFuerzaVentas ON 
dbo.Cp.PKID = dbo.CpDistribucion.PKID 
LEFT OUTER JOIN dbo.ModalidadCredito ON dbo.Pedido.IDModalidadCredito = dbo.ModalidadCredito.PKID 
LEFT OUTER JOIN dbo.LineaCreditoPorFuerzaVentas ON dbo.LineaCreditoPorFuerzaVentas.IDFuerzaVentas = dbo.CpDistribucion.IDFuerzaVentas AND 
dbo.LineaCreditoPorFuerzaVentas.IDCliente = dbo.Cp.IDPersona 
LEFT OUTER JOIN dbo.DireccionZona AS DZ ON DZ.IDCliente = dbo.LineaCreditoPorFuerzaVentas.IDCliente AND 
DZ.IDZona = dbo.CpDistribucion.IDZonaVenta
LEFT OUTER JOIN GC_PedidosCliente ON GC_PedidosCliente.IDPedido = dbo.Cp.PKID
LEFT OUTER JOIN usv_direccion_Zonareparto ON usv_direccion_Zonareparto.IDPedido = dbo.Cp.PKID
where dbo.Cp.FechaEmision='2024-10-07'


select top 10
cpl.PKID as pkid_op,
cpl.FechaEmision as Fecha_op,
cpl.Hora as Hora_op,
cpl.NumCp as op,
cpa.PKID as pkid_guia,
cpa.FechaEmision as Fecha_guia,
cpa.Hora as Hora_guia,
cpa.NumCp as guia
from usv_RelacionPedido_Guia urg
inner join Cp cpa on cpa.PKID=urg.GR_Relacion
inner join Cp cpl on cpl.PKID= urg.pedido


------------------------

ALTER view [dbo].[usv_RelacionPedido_Guia]
as
select
Pedido.PKID as pedido,
isnull((select top 1 IDCp from CpRelacionado where IDTipoCpDestino='878' and idCpRelacionado=CP.pkid),0) as GR_Relacion
From Cp 
Inner join Pedido On Pedido.PKID = Cp.PKID 
Inner join TipoCp On TipoCp.PKID = Cp.IDTipoCp
Inner join Sucursal On Sucursal.PKID = Cp.IDSucursal 
GO
------------------------------------
select*from Cp where NumCp='814-0048054'--- 785231--op785358
select*from Cp where NumCp='814-0006351'----785221 -- cot
select*from Cp where NumCp='814-0048033'
select top 10*from CpRelacionado where IDCp=785221

create view usv_RelacionCotizacion_op
as
select
Cotizacion.PKID as cotizacion,
isnull((select top 1 IDCp from CpRelacionado where IDTipoCpDestino='0D2C3641-09EB-474D-9ADD-4B3651817973' and idCpRelacionado=CP.pkid),0) as op_Relacion
From Cp 
Inner join Cotizacion On cotizacion.PKID = Cp.PKID 
Inner join TipoCp On TipoCp.PKID = Cp.IDTipoCp
Inner join Sucursal On Sucursal.PKID = Cp.IDSucursal 
go

create view usv_Consulta_op_cot
as
select 
cpl.PKID as pkid_cot,
cpl.FechaEmision as Fecha_cot,
cpl.NumCp as cot_o,
cpa.PKID as pkid_op,
cpa.FechaEmision as Fecha_op,
cpa.NumCp as op
from usv_RelacionCotizacion_op cotop
inner join Cp cpa on cpa.PKID=cotop.op_Relacion
inner join Cp cpl on cpl.PKID= cotop.cotizacion
--where cpl.NumCp='814-0006351'
go


