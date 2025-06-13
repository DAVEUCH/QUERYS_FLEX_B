USE [GCI]
GO

/****** Object:  View [dbo].[usv_CotizacionProductos_2]    Script Date: 19/12/2024 16:58:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[usv_CotizacionProductos_2]
as
SELECT 
    CP.pkid, 
    CP.numcp, 
    CP.fechaEmision, 
    tipoCp.descripcion AS TipoCp, 
    CptoOperacion.descripcion AS CptoOperacion,
    ProductoServicio.codigo AS CodigoProducto, 
    ProductoServicio.descripcion AS NombreProducto, 
    ItemProducto.Factor, 
    ItemProducto.CantidadBase, 
    ItemCp.Cantidad, 
    ItemCp.ValorUnitario, 
    ItemCp.Total, 
    ma.Descripcion AS Marca,
    --Producto.Stock AS Stock,
    per.Nombre AS Cliente,
    per_1.Nombre AS Vendedor,
    SUM(PA.StockFisico) AS Stock, -- Sumar el stock físico por producto
    dbo.[fn_Localidad](dbo.Cp.IDPersona) AS ClienteLocalidad
FROM dbo.Cp 
INNER JOIN cotizacion ON cotizacion.pkid = Cp.PKID  
INNER JOIN CptoOperacion ON CptoOperacion.pkid = Cp.IDCptoOperacion 
INNER JOIN tipoCp ON tipoCp.pkid = Cp.IDTipocp 
INNER JOIN ItemCp ON ItemCp.IDCp = Cp.PKID  
INNER JOIN ItemProducto ON ItemCp.PKID = ItemProducto.PKID 
INNER JOIN Producto ON ItemProducto.IDProducto = Producto.PKID 
INNER JOIN ProductoServicio ON ProductoServicio.PKID = Producto.PKID 
INNER JOIN Marca ma ON ma.PKID = Producto.IDMarca
INNER JOIN Persona per ON per.PKID = Cp.IDPersona
INNER JOIN Persona per_1 ON per_1.PKID = Cp.IDResponsable
LEFT JOIN ProductoAlmacen PA ON PA.IDProducto = Producto.PKID
WHERE Cp.Anulado = 0
 --AND CP.FechaEmision between '01-12-2024' and '19-12-2024'
GROUP BY 
    CP.pkid, 
    CP.numcp, 
    CP.fechaEmision, 
    tipoCp.descripcion, 
    CptoOperacion.descripcion,
    ProductoServicio.codigo, 
    ProductoServicio.descripcion, 
    ItemProducto.Factor, 
    ItemProducto.CantidadBase, 
    ItemCp.Cantidad, 
    ItemCp.ValorUnitario, 
    ItemCp.Total, 
    ma.Descripcion,
    --Producto.Stock,
    per.Nombre,
    per_1.Nombre,
    dbo.[fn_Localidad](dbo.Cp.IDPersona);
GO



--Select 
--CP.pkid, CP.numcp, cp.fechaEmision, tipoCp.descripcion TipoCp ,CptoOperacion.descripcion CptoOperacion,
--ProductoServicio.codigo as CodigoProducto, ProductoServicio.descripcion as NombreProducto, 
--ItemProducto.Factor, ItemProducto.CantidadBase, 
--ItemCp.Cantidad, ItemCp.ValorUnitario, ItemCp.Total, ma.Descripcion as Marca,Producto.Stock as Stock,
--per.Nombre as Cliente,per_1.Nombre as Vendedor, 
----PA.StockFisico,
--dbo.[fn_Localidad](dbo.Cp.IDPersona)  AS ClienteLocalidad
--FROM dbo.Cp 
--inner join cotizacion  On cotizacion.pkid = Cp.PKID  
--inner join CptoOperacion  On CptoOperacion.pkid = Cp.IDCptoOperacion 
--inner join tipoCp  On tipoCp.pkid = Cp.IDTipocp 
--inner join ItemCp  On ItemCp.IDCp = Cp.PKID  
--inner join ItemProducto On ItemCp.PKID = ItemProducto.PKID 
--inner join Producto On ItemProducto.IDProducto = Producto.PKID 
--inner join ProductoServicio On ProductoServicio.PKID = Producto.PKID 
--inner join Marca ma on ma.PKID=Producto.IDMarca
--inner join Persona per on per.PKID=Cp.IDPersona
--inner join Persona per_1 on per_1.PKID=Cp.IDResponsable
----left join ProductoAlmacen pa on pa.IDProducto=Producto.PKID
--WHERE Cp.Anulado=0
--AND CP.FechaEmision between '01-12-2024' and '19-12-2024'
--GO


