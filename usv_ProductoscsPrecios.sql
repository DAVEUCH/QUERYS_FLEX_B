use FREDDY
alter VIEW [dbo].[usv_ProductosSinPrecios]
AS
SELECT dbo.Almacen.Nombre AS Almacen,
dbo.ProductoServicio.Codigo,
Freddy.ProductoFreddy.CodigoInterno,
dbo.ProductoServicio.Descripcion,
dbo.ProductoAlmacen.StockFisico,
dbo.ProductoAlmacen.StockContable, 
dbo.ClaseProductoServicio.Descripcion AS CLASE,
dbo.Marca.Descripcion AS MARCA,
tab_VentasPorProducto_Sum.SEG_RFM as SEGMENTO,
UND.Abreviacion AS ListaPrecioProductoUnidadAbreviacion,
ESC.Precio AS ListaPrecioProductoEscalaPrecioValorVenta,
ESC.PrecioIncImpto AS ListaPrecioProductoEscalaPrecioIncImpto,
ILP.IDListaPrecios,
--IIF(ISNULL(ESC.Precio, 0) = 0, 'NO TIENE PRECIO', 'SI TIENE PRECIO') AS Indicador_precio,
dbo.ProductoServicio.Activo
FROM dbo.Almacen
INNER JOIN dbo.ProductoAlmacen ON dbo.Almacen.PKID = dbo.ProductoAlmacen.IDAlmacen 
INNER JOIN dbo.ProductoServicio ON dbo.ProductoAlmacen.IDProducto = dbo.ProductoServicio.PKID 
INNER JOIN dbo.Producto ON dbo.Producto.PKID = dbo.ProductoServicio.PKID
INNER JOIN dbo.Marca ON dbo.Marca.PKID = dbo.Producto.IDMarca
LEFT OUTER JOIN tab_VentasPorProducto_Sum ON tab_VentasPorProducto_Sum.IDProducto = dbo.Producto.pkid
LEFT OUTER JOIN Freddy.ProductoFreddy ON Freddy.ProductoFreddy.PKID = dbo.Producto.PKID
LEFT OUTER JOIN dbo.ClaseProductoServicio ON dbo.ClaseProductoServicio.PKID = dbo.ProductoServicio.IDClaseProductoServicio
LEFT OUTER JOIN ItemListaPrecios ILP ON dbo.ProductoServicio.PKID =ILP.IDProducto
LEFT OUTER JOIN UnidadItemListaPrecios UILP ON UILP.IDItemListaPrecios=ILP.PKID
LEFT OUTER JOIN Escala ESC ON ESC.IDUnidadItemListaPrecios=UILP.PKID
LEFT OUTER JOIN Unidad UND ON UND.PKID=UILP.IDUnidad
WHERE 
    (ESC.Precio IS NULL OR ESC.Precio = 0)
    AND dbo.ProductoAlmacen.StockFisico = 0
    AND (ILP.IDListaPrecios IS NULL OR ILP.IDListaPrecios = 0);

GO

SELECT*FROM usv_ProductosSinPrecios where Almacen='Almac�n - PDV 02'

