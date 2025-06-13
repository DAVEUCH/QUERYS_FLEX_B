Select * from usv_ProductosenPedidos_Pendientes_Facturar
Where Fecha Between '20240901'  AND  '20240906'

Select 
Cp.IDSucursal,
Sucursal.Nombre As NombreSucursal, 
TipoCp.Descripcion as TipoDoc,
Cp.NumCp as NumeroPedido,
urpv2.guia as NumeroSalida,
--Pedido.PKID as pki_op,
Cp.Fecha,
cp.Hora,
--Cp.Total,
Pedido.EstadoFacturacion,
Pedido.EstadoEntrega,
CP.PersonaNombre As Cliente,
Responsable.Nombre as Responsable,  
ProductoServicio.Codigo as CodigoProd,
ProductoServicio.Descripcion as DescripProd, 
tab_VentasPorProducto_Sum.SEG_RFM as SEGMENTO,
ItemCp.Cantidad,
UND.Abreviacion as Unid_Medida,
sum(VSA.StockFisico) as StockFisico
--ItemCp.ValorUnitario
--ISNULL((
--        SELECT TOP 1 IDCp 
--        FROM CpRelacionado 
--        WHERE IDTipoCpDestino = '878' 
--        AND idCpRelacionado = CP.pkid
--    ), 0) AS GR_Relacion


From Cp 
Inner join Pedido On Pedido.PKID = Cp.PKID 
Inner join TipoCp On TipoCp.PKID = Cp.IDTipoCp
Inner join Sucursal On Sucursal.PKID = Cp.IDSucursal
Inner join ItemCp On ItemCp.IDCp = Cp.PKID
Inner join ItemProducto On ItemProducto.PKID = ItemCp.PKID 
Inner join ItemPedido On ItemPedido.PKID = ItemCp.PKID
Inner join Producto On Producto.PKID = ItemProducto.IDProducto
Inner join ProductoServicio On ProductoServicio.PKID = Producto.PKID 
inner join dbo.usv_RelacionPedido_Guia_v2 urpv2 on urpv2.pkid_op=Pedido.PKID
LEFT OUTER JOIN tab_VentasPorProducto_Sum ON tab_VentasPorProducto_Sum.IDProducto = dbo.Producto.pkid
LEFT OUTER JOIN Unidad UND ON UND.PKID=ProductoServicio.PKID
LEFT JOIN vrptStockAlmacen VSA on VSA.IDProducto=ProductoServicio.PKID and VSA.IDSucursal=Sucursal.PKID
Left outer join dbo.Persona Responsable ON dbo.Cp.IDResponsable = Responsable.PKID   
Where CP.Anulado=0  
And   ltrim(rtrim(Pedido.EstadoAprobacion))<>'DESAPROBADO'  
And   ltrim(rtrim(Pedido.EstadoFacturacion))<>'TOTAL'  
And   ItemPedido.BalanceFacturacion=0.00
--and Cp.Fecha Between '20240901'  AND  '20240906'
--and Cp.NumCp='614-0080659'

Group by 
    Cp.IDSucursal,
    Sucursal.Nombre, 
    TipoCp.Descripcion,
    Cp.NumCp,
    urpv2.guia,
    Cp.Fecha,
    cp.Hora,
    Pedido.EstadoFacturacion,
    Pedido.EstadoEntrega,
    CP.PersonaNombre,
    Responsable.Nombre,  
    ProductoServicio.Codigo,
    ProductoServicio.Descripcion, 
    tab_VentasPorProducto_Sum.SEG_RFM,
    ItemCp.Cantidad,
    UND.Abreviacion
GO


	select
	su.Nombre,IDAlmacen,StockFisico,StockContable,StockPorEntregar,StockPorEntregar
	from vrptStockAlmacen  alm
	left join Sucursal su on su.PKID=alm.IDSucursal
	where IDProducto=21098

	select*from ProductoServicio where Codigo='PX.20539'

select*from Unidad
select top 5*from usv_PedidoEstadosTotal_RelaGuiayFact order by pkid desc
select*from Cp where NumCp='614-0080659'   2831693
select*from Cp where PKID=2831755   GSI06-0021421
select top 1* from CpInventarioSalida
select top 1*from CpRelacionado where IDCpRelacionado=2831693
select top 1*from CpRelacionado where IDCpRelacionado=2831755

create view dbo.usv_RelacionPedido_Guia_v1
as
select
Pedido.PKID as pedido,
isnull((select top 1 IDCp from CpRelacionado where IDTipoCpDestino='878' and idCpRelacionado=CP.pkid),0) as GR_Relacion
From Cp 
Inner join Pedido On Pedido.PKID = Cp.PKID 
Inner join TipoCp On TipoCp.PKID = Cp.IDTipoCp
Inner join Sucursal On Sucursal.PKID = Cp.IDSucursal 
go 

alter view dbo.usv_RelacionPedido_Guia_v2
as
select
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
go
where cpl.NumCp='614-0080659'






