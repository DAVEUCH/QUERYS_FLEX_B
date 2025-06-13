Select CodigoProducto, 
Marca,Stock,Cliente,
Sum(CantUnid_Cotizacion) as CantUnid_Cotizacion, 
Sum(CantUnid_Pedido) as CantUnid_Pedido,
Vendedor,
ClienteLocalidad,
fechaEmision
From usv_CotizacionVsPedidosProductos_2
Where fechaEmision>='2024-01-11' and fechaEmision<='2024-04-11'
Group by CodigoProducto,fechaEmision, Marca,Stock,Cliente,Vendedor,ClienteLocalidad
-----------------------------------------------------------------------
Select CodigoProducto, 
Sum(CantUnid_Cotizacion) as CantUnid_Cotizacion, 
Sum(CantUnid_Pedido) as CantUnid_Pedido
From usv_CotizacionVsPedidosProductos
Where fechaEmision>='2024-01-11' and fechaEmision<='2024-04-11'
Group by CodigoProducto


select top 10*from usv_CotizacionVsPedidosProductos

-----------------------[usv_CotizacionVsPedidosProductos]
alter view usv_CotizacionVsPedidosProductos_2
as
Select fechaEmision, CodigoProducto, CantidadBase as CantUnid_Cotizacion, 0 as CantUnid_Pedido, Marca,Stock,Cliente,Vendedor,ClienteLocalidad
From usv_CotizacionProductos_2
Union all
Select fechaEmision, CodigoProducto, 0 as CantUnid_Cotizacion, CantidadBase as CantUnid_Pedido,Marca,Stock,Cliente,Vendedor,ClienteLocalidad
From usv_PedidosProductos_2
GO

----crear procedure [usv_PedidosProductos]
alter view usv_PedidosProductos_2
as
Select 
CP.pkid, CP.numcp, cp.fechaEmision, tipoCp.descripcion TipoCp ,CptoOperacion.descripcion CptoOperacion,
ProductoServicio.codigo as CodigoProducto, ProductoServicio.descripcion as NombreProducto, 
ItemProducto.Factor, ItemProducto.CantidadBase, 
ItemCp.Cantidad, ItemCp.ValorUnitario, ItemCp.Total, ma.Descripcion as Marca, Producto.Stock as Stock,
per.Nombre as Cliente, per_1.Nombre as Vendedor,
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
WHERE Cp.Anulado=0  
And   ProductoServicio.IDTipoProductoServicio=1
And	  Producto.IDMarca<>87
And   (dbo.CptoOperacion.codigo not in ('POBS'))
--AND CP.FechaEmision='2024-04-11'
GO
select top 10*from Cp
-------------------[usv_CotizacionProductos]----------
alter view usv_CotizacionProductos_2
as
Select 
CP.pkid, CP.numcp, cp.fechaEmision, tipoCp.descripcion TipoCp ,CptoOperacion.descripcion CptoOperacion,
ProductoServicio.codigo as CodigoProducto, ProductoServicio.descripcion as NombreProducto, 
ItemProducto.Factor, ItemProducto.CantidadBase, 
ItemCp.Cantidad, ItemCp.ValorUnitario, ItemCp.Total, ma.Descripcion as Marca,Producto.Stock as Stock,
per.Nombre as Cliente,per_1.Nombre as Vendedor,
dbo.[fn_Localidad](dbo.Cp.IDPersona)  AS ClienteLocalidad
FROM dbo.Cp 
inner join cotizacion  On cotizacion.pkid = Cp.PKID  
inner join CptoOperacion  On CptoOperacion.pkid = Cp.IDCptoOperacion 
inner join tipoCp  On tipoCp.pkid = Cp.IDTipocp 
inner join ItemCp  On ItemCp.IDCp = Cp.PKID  
inner join ItemProducto On ItemCp.PKID = ItemProducto.PKID 
inner join Producto On ItemProducto.IDProducto = Producto.PKID 
inner join ProductoServicio On ProductoServicio.PKID = Producto.PKID 
inner join Marca ma on ma.PKID=Producto.IDMarca
inner join Persona per on per.PKID=Cp.IDPersona
inner join Persona per_1 on per_1.PKID=Cp.IDResponsable
WHERE Cp.Anulado=0
--AND CP.FechaEmision='2024-04-11'
GO 

select top 10*from Producto


