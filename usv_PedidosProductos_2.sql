USE [GCI]
GO

/****** Object:  View [dbo].[usv_PedidosProductos_2]    Script Date: 19/12/2024 17:35:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_PedidosProductos_2]
as
Select 
CP.pkid, CP.numcp, cp.fechaEmision, tipoCp.descripcion TipoCp ,CptoOperacion.descripcion CptoOperacion,
ProductoServicio.codigo as CodigoProducto, ProductoServicio.descripcion as NombreProducto, 
ItemProducto.Factor, ItemProducto.CantidadBase, 
ItemCp.Cantidad, ItemCp.ValorUnitario, ItemCp.Total, ma.Descripcion as Marca,-- Producto.Stock as Stock,
per.Nombre as Cliente, per_1.Nombre as Vendedor,SUM(PA.StockFisico) AS Stock,
dbo.[fn_Localidad](dbo.Cp.IDPersona)  AS ClienteLocalidad
FROM dbo.Cp 
inner join Pedido  On Pedido.pkid = Cp.PKID  
inner join CptoOperacion  On CptoOperacion.pkid = Cp.IDCptoOperacion 
inner join tipoCp  On tipoCp.pkid = Cp.IDTipocp 
inner join ItemCp  On ItemCp.IDCp = Cp.PKID  
inner join ItemProducto On ItemCp.PKID = ItemProducto.PKID 
inner join Producto On ItemProducto.IDProducto = Producto.PKID 
inner join ProductoServicio On ProductoServicio.PKID = Producto.PKID 
inner join Marca ma on ma.PKID=Producto.IDMarca
inner join Persona per on per.PKID=Cp.IDPersona
inner join Persona per_1 on per_1.PKID=Cp.IDResponsable
LEFT JOIN ProductoAlmacen PA ON PA.IDProducto = Producto.PKID
WHERE Cp.Anulado=0  
And   ProductoServicio.IDTipoProductoServicio=1
And	  Producto.IDMarca<>87
And   (dbo.CptoOperacion.codigo not in ('POBS'))
 --AND CP.FechaEmision between '01-12-2024' and '19-12-2024'
GROUP BY 
CP.pkid, CP.numcp, cp.fechaEmision, tipoCp.descripcion ,CptoOperacion.descripcion,
ProductoServicio.codigo, ProductoServicio.descripcion, 
ItemProducto.Factor, ItemProducto.CantidadBase, 
ItemCp.Cantidad, ItemCp.ValorUnitario, ItemCp.Total, ma.Descripcion,-- Producto.Stock as Stock,
per.Nombre , per_1.Nombre,
dbo.[fn_Localidad](dbo.Cp.IDPersona) 
--AND CP.FechaEmision='2024-04-11'
GO


