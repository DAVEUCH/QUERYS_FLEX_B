create view dbo.usv_ReportePedidoDetalleconGuiasStock
as
Select 
Cp.IDSucursal,
Sucursal.Nombre As NombreSucursal, 
TipoCp.Descripcion as TipoDoc,
Cp.NumCp as NumeroPedido,
TipoCp.TipoCp,
urpv2.guia as NumeroSalida,
Cp.Fecha,
cp.Hora,
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
From Cp 
LEFT join Pedido On Pedido.PKID = Cp.PKID 
LEFT join TipoCp On TipoCp.PKID = Cp.IDTipoCp
LEFT join Sucursal On Sucursal.PKID = Cp.IDSucursal
LEFT join ItemCp On ItemCp.IDCp = Cp.PKID
LEFT join ItemProducto On ItemProducto.PKID = ItemCp.PKID 
LEFT join ItemPedido On ItemPedido.PKID = ItemCp.PKID
LEFT join Producto On Producto.PKID = ItemProducto.IDProducto
LEFT join ProductoServicio On ProductoServicio.PKID = Producto.PKID 
LEFT join dbo.usv_RelacionPedido_Guia_v2 urpv2 on urpv2.pkid_op=Pedido.PKID
LEFT JOIN tab_VentasPorProducto_Sum ON tab_VentasPorProducto_Sum.IDProducto = dbo.Producto.pkid
LEFT  JOIN Unidad UND ON UND.PKID=ProductoServicio.PKID
LEFT JOIN vrptStockAlmacen VSA on VSA.IDProducto=ProductoServicio.PKID and VSA.IDSucursal=Sucursal.PKID
Left outer join dbo.Persona Responsable ON dbo.Cp.IDResponsable = Responsable.PKID   
Where
CP.Anulado=0  
--And   ltrim(rtrim(Pedido.EstadoAprobacion))<>'DESAPROBADO'  
--And   ltrim(rtrim(Pedido.EstadoFacturacion))<>'TOTAL'  
And
TipoCp.TipoCp='Pedido'
--ItemPedido.BalanceFacturacion=0.00
and Cp.Fecha Between '20240901'  AND  '20240908'
--AND Cp.NumCp='214-0114130'
Group by 
    Cp.IDSucursal,
    Sucursal.Nombre, 
    TipoCp.Descripcion,
    Cp.NumCp,
	TipoCp.TipoCp,
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

SELECT TOP 3* FROM TipoCp

Select * from usv_ReportePedidoDetalleconGuiasStock
Where
--IDSucursal='100000197'
--and
Fecha Between '20240901'  AND  '20240909'