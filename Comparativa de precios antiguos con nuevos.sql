--[dbo].[usv_ItemListaPrecios_Productos]
--as
Select ItemListaPrecios.IDListaPrecios,
ItemListaPrecios.IDProducto, 
ProductoServicio.Codigo, 
ProductoServicio.Descripcion,
Unidad.Factor, 
Unidad.Abreviacion as UnidMed, Escala.pkid as EscalaID, 
convert(decimal(15,2),isnull(Escala.PrecioIncImpto,0)) as PrecioIncImpto, 
dbo.usf_obtenprecioproductolp_anterior(ItemListaPrecios.IDProducto, Escala.IDUnidadItemListaPrecios, Escala.pkid) as Pecio_ante,
Escala.MargenNegociacionPorcentualA,
Escala.MargenNegociacionPorcentualB
From ItemListaPrecios 
Inner join ProductoServicio On ItemListaPrecios.IDProducto = ProductoServicio.PKID
Inner join Producto On ProductoServicio.PKID = Producto.PKID
Inner join UnidadItemListaPrecios ON UnidadItemListaPrecios.IDItemListaPrecios=ItemListaPrecios.PKID
Inner join Unidad ON UnidadItemListaPrecios.IDUnidad=Unidad.PKID
Inner join Escala ON Escala.IDUnidadItemListaPrecios=UnidadItemListaPrecios.PKID
Where (ItemListaPrecios.IDListaPrecios=2)
And  (ProductoServicio.IDTipoProductoServicio = 1 )
And  (Escala.EsVigente=1)
And  (isnull(Escala.Desde,0) = 0)
and (ProductoServicio.Codigo='GB.GWDW-47A')



