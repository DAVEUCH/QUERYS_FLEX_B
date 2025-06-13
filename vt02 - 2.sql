USE [GCI]
GO

/****** Object:  View [dbo].[vrptInformacionListaPrecio2]    Script Date: 2/10/2024 15:34:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[vrptInformacionListaPrecio2]
AS
SELECT     TOP (100) PERCENT dbo.ListaPrecios.Descripcion AS ListaPrecioDescripcion,
                      dbo.Moneda.Simbolo AS ListaPrecioMonedaSimbolo, 
                      dbo.ProductoServicio.Codigo AS ListaPrecioProductoCodigo,
					  dbo.ProductoServicio.Descripcion AS ListaPrecioProductoDescripcion, 
                      dbo.fun_ObtenerEscalaPrecios(dbo.ListaPrecios.PKID, dbo.ItemListaPrecios.IDProducto) AS ListaPrecioProductoEscalaPrecios, 
                      dbo.ItemListaPrecios.IDProducto AS ListaPrecioProductoID,
					  dbo.ListaPrecios.PKID AS ListaPrecioID, 
                      dbo.ClaseProductoServicio.CodigoClase AS ListaPrecioProductoClaseProductoCodigo, 
                      dbo.ClaseProductoServicio.Descripcion AS ListaPrecioProductoClaseProductoDescripcion,
					  OrigenDestino.Codigo AS ProveedorCodigo, 
                      OrigenDestino.Nombre AS ProveedorNombre,
					  dbo.Marca.Descripcion AS Marca,
					  dbo.Producto.IDMarca AS ListaPrecioProductoMarcaID, 
                      dbo.Producto.IDProveedor AS ListaPrecioProductoProveedorID, 
                      dbo.ProductoServicio.IDClaseProductoServicio AS ListaPrecioProductoClaseProdServID
FROM                  dbo.ListaPrecios 
INNER JOIN dbo.ItemListaPrecios ON dbo.ListaPrecios.PKID = dbo.ItemListaPrecios.IDListaPrecios 
INNER JOIN dbo.ProductoServicio ON dbo.ItemListaPrecios.IDProducto = dbo.ProductoServicio.PKID 
INNER JOIN dbo.ClaseProductoServicio ON dbo.ProductoServicio.IDClaseProductoServicio = dbo.ClaseProductoServicio.PKID
INNER JOIN dbo.Moneda ON dbo.ListaPrecios.IDMoneda = dbo.Moneda.PKID
INNER JOIN dbo.Producto ON dbo.ProductoServicio.PKID = dbo.Producto.PKID
INNER JOIN dbo.Marca ON dbo.Producto.IDMarca = dbo.Marca.PKID
LEFT OUTER JOIN dbo.Persona AS OrigenDestino ON dbo.Producto.IDProveedor = OrigenDestino.PKID
WHERE     (dbo.ProductoServicio.Activo = 1) 
ORDER BY ListaPrecioProductoCodigo


GO


