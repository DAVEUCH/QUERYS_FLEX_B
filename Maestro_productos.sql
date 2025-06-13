select
PS.PKID,
PS.Codigo as Codigo,
pro.CodigoFabrica as Codigo_Fabrica,
pro.Stock,
pro.StockContable,
pro.StockPorEntregar,
fpf.CodigoInterno as Codigo_Interno,
fpf.ProductoAlias as Alias,
ps.Descripcion as Nombre_Prod,
ps.DescripcionResumida as Nombre_Prod_Abre,
cps.Descripcion as Linea,
tps.Descripcion as Tipo_prod,
mar.Descripcion as Marca,
mon.Simbolo as Moneda,
IIF(ps.ArticuloVenta=1,'SI','NO') AS Articulo_de_venta,
IIF(ps.ArticuloCompra =1,'SI','NO') AS Articulo_de_Compra,
IIF(ps.ArticuloInventario=1,'SI','NO') AS Articulo_de_Inventario,
IIF(ps.Granel=1,'SI','NO') AS Articulo_de_Granel,
IIF(pro.Agrupacion=1,'SI','NO') AS Agrupacion,
IIF(pro.Consignacion=1,'SI','NO') AS Consignacion,
IIF(pro.GestionaLoteFabricacion=1,'SI','NO') AS Gestiona_Lote_Fabricacion,
IIF(pro.PrecioPorPeso=1,'SI','NO') AS Precio_Por_Peso,
IIF(ps.Activo=1,'SI','NO') AS Activo,
carac1.Descripcion as Marca_Auto,
carac2.Descripcion as Modelo_Auto,
carac3.Descripcion as Año_Auto,
carac4.Descripcion as Nombre_Motor,
carac5.Descripcion as Nombre_Cilindros,
carac6.Descripcion as Nombre_Litros,
carac7.Descripcion as Nombre_Medidas,
carac8.Descripcion as Nombre_Voltios,
carac9.Descripcion as Nombre_Tipo_Encendido,
carac10.Descripcion as Nombre_Lado,
pro.Observacion
from ProductoServicio ps
left join Producto pro on pro.PKID= ps.PKID
left join Freddy.ProductoFreddy fpf on fpf.PKID=ps.PKID
left join ClaseProductoServicio cps on  cps.PKID=ps.IDClaseProductoServicio
left join TipoProductoServicio tps on tps.PKID=ps.IDTipoProductoServicio
left join Marca mar on mar.PKID=pro.IDMarca
left join Moneda mon on mon.PKID=pro.IDMoneda
left join Caracteristica carac1 on carac1.PKID=pro.IDCaracteristica1
left join Caracteristica carac2 on carac2.PKID=pro.IDCaracteristica2
left join Caracteristica carac3 on carac3.PKID=pro.IDCaracteristica3
left join Caracteristica carac4 on carac4.PKID=pro.IDCaracteristica4
left join Caracteristica carac5 on carac5.PKID=pro.IDCaracteristica5
left join Caracteristica carac6 on carac6.PKID=pro.IDCaracteristica6
left join Caracteristica carac7 on carac7.PKID=pro.IDCaracteristica7
left join Caracteristica carac8 on carac8.PKID=pro.IDCaracteristica8
left join Caracteristica carac9 on carac9.PKID=pro.IDCaracteristica9
left join Caracteristica carac10 on carac10.PKID=pro.IDCaracteristica10
where ps.Codigo='HM.LAK1724'

select*from ProductoServicio where Codigo='AA.'
select TOP(10)*from Producto where CodigoFabrica='GWDW-47A.'
select TOP(10) *from Freddy.ProductoFreddy where CodigoInterno='96307717'
select*from ClaseProductoServicio where Descripcion='BOMBA AGUA' 
select*from Marca
select top(10)*from Unidad
select*from tClasesProductos WHERE ClaseProductoID=177
select top(10)*from usv_VentasPorProductoClase_select2
select top(10)*from TipoProductoServicio
select top(10)*from Marca
select *from Moneda
select top(10)*from Caracteristica


select*from Persona where Codigo='000003618175'
--select*from Persona where  pkid=36127 
select*from Persona where  pkid=68774 
--select*from Cliente where PKID=69779
select*from Cliente where PKID=69779
select*from Cliente where PKID=68774