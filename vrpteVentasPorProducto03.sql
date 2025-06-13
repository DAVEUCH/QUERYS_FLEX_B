CREATE VIEW vrpteVentasPorProducto03
AS
SELECT 
case when dbo.TipoCp.Codigo in ('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07',
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 100000200 else dbo.Cp.IDSucursal end as SucursalID,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then '0008' else dbo.Sucursal.Codigo end as SucursalCodigo,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 
'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 'SUCURSAL - PDV 07' else dbo.Sucursal.Nombre end as SucursalNombre,
--dbo.Cp.IDSucursal AS SucursalID,
--dbo.Sucursal.Codigo AS SucursalCodigo,
--dbo.Sucursal.Nombre AS SucursalNombre,             
dbo.CategoriaCliente.PKID AS CategoriaID, '' AS CategoriaCodigo, dbo.CategoriaCliente.Descripcion AS CategoriaDescripcion,             
ISNULL(dbo.Zona.PKID, 0) AS ZonaID, ISNULL(dbo.Zona.Codigo, '') AS ZonaCodigo,                     
ISNULL(dbo.Zona.Descripcion, 'OTROS') AS ZonaDescripcion, ISNULL(dbo.FuerzaVentas.PKID, 0) AS FuerzaVentasID, ISNULL(dbo.FuerzaVentas.Codigo, '')                     
AS FuerzaVentasCodigo, ISNULL(dbo.FuerzaVentas.Nombre, 'OTROS') AS FuerzaVentasNombre, dbo.GrupoVentas.PKID AS GrupoVentasID,                     
dbo.GrupoVentas.Codigo AS GrupoVentasCodigo, dbo.GrupoVentas.Nombre AS GrupoVentasNombre, dbo.TipoCliente.PKID AS TipoClienteID,                     
dbo.TipoCliente.Codigo AS TipoClienteCodigo, dbo.TipoCliente.Descripcion AS TipoClienteDescripcion, dbo.Persona.PKID AS ClienteID,                     
dbo.Persona.Codigo AS ClienteCodigo, dbo.Persona.Nombre AS ClienteNombre, dbo.ProductoServicio.PKID AS ProductoID,                     
dbo.ProductoServicio.Codigo AS ProductoCodigo, dbo.ProductoServicio.Descripcion AS ProductoDescripcion, dbo.Marca.PKID AS MarcaID,                     
dbo.Marca.Codigo AS MarcaCodigo, dbo.Marca.Descripcion AS MarcaDescripcion, ISNULL(Proveedor.PKID, 0) AS ProveedorID, ISNULL(Proveedor.Codigo, '')                     
AS ProveedorCodigo, ISNULL(Proveedor.Nombre, 'OTROS') AS ProveedorNombre, dbo.ClaseProductoServicio.PKID AS ClaseProductoID,                     
dbo.ClaseProductoServicio.CodigoClase AS ClaseProductoCodigo, dbo.ClaseProductoServicio.Descripcion AS ClaseProductoDescripcion,                     
Responsable.PKID AS VendedorID, Responsable.Codigo AS VendedorCodigo, Responsable.Nombre AS VendedorNombre, Cp.TipoCambio, 
(CASE moneda.MonedaBase WHEN 1 THEN ItemCp.ValorVenta ELSE ItemCp.ValorVenta * Cp.TipoCambio END) AS ValorVenta2, --add noel                  
(CASE moneda.MonedaBase WHEN 1 THEN ItemCp.ValorVenta ELSE ItemCp.ValorVenta * Cp.TipoCambio END) * dbo.CpCobrarPagar.MovSaldo AS ValorVenta,                     
(CASE moneda.MonedaBase WHEN 1 THEN dbo.ItemCp.Total ELSE dbo.ItemCp.Total * Cp.TipoCambio END)  AS Total2,    --add noel                  
(CASE moneda.MonedaBase WHEN 1 THEN dbo.ItemCp.Total ELSE dbo.ItemCp.Total * Cp.TipoCambio END) * dbo.CpCobrarPagar.MovSaldo AS Total,                     
(CASE moneda.MonedaBase WHEN 1 THEN ItemCp.ValorVenta / Cp.TipoCambio ELSE ItemCp.ValorVenta END) * dbo.CpCobrarPagar.MovSaldo AS ValorVentaDolares, 
(CASE moneda.MonedaBase WHEN 1 THEN dbo.ItemCp.Total / Cp.TipoCambio ELSE dbo.ItemCp.Total END) * dbo.CpCobrarPagar.MovSaldo AS TotalDolares, 
case left(dbo.TipoCp.Descripcion,2) when 'NC' then (ItemCp.cantidad * -1) else ItemCp.cantidad end as cantidad,        
dbo.ItemProducto.CantidadBase * ISNULL(dbo.CpInventario.MovStockContable, 0) * - 1 AS CantidadUnidadBase,   
dbo.Unidad.Factor AS FactorUnidadReferencia,                     
dbo.Unidad.Abreviacion AS AbreviacionUnidadReferencia, dbo.Cp.Fecha, dbo.Cp.IDPeriodo,                                  
dbo.GrupoVentas.Codigo, dbo.Cp.NumCp, dbo.TipoCp.Descripcion AS TipoCp, dbo.TipoCp.Codigo AS CodigoTipoCp, 
dbo.TipoCp.Codigo as Codigo_serie,
case dbo.CpCobrarPagar.IDModalidadCredito when 0 then 'CONTADO' else ModalidadCredito.Descripcion end as descrip_ModalidadCredito,          
dbo.Cp.PKID,      
isnull(dbo.usf_VentaProducto_EsCompraPlaza(ItemProducto.IDProducto, Cp.IDSucursal, Cp.Fecha),0) as Es_Compra_CP      
FROM               
dbo.Cp with(nolock)           
INNER JOIN dbo.CptoOperacion with(nolock)  ON dbo.CptoOperacion.PKID = dbo.Cp.IDCptoOperacion               
INNER JOIN dbo.Persona AS Responsable  with(nolock) ON dbo.Cp.IDResponsable = Responsable.PKID               
INNER JOIN dbo.TipoCp with(nolock) ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp 
INNER JOIN dbo.Moneda with(nolock) ON dbo.Moneda.PKID = dbo.Cp.IDMoneda               
INNER JOIN dbo.CpCobrarPagar with(nolock) ON dbo.CpCobrarPagar.PKID = dbo.Cp.PKID           
INNER JOIN dbo.ModalidadCredito with(nolock) ON dbo.ModalidadCredito.PKID = dbo.CpCobrarPagar.IDModalidadCredito              
INNER JOIN dbo.Persona with(nolock) ON dbo.Cp.IDPersona = dbo.Persona.PKID               
INNER JOIN dbo.Sucursal with(nolock) ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID               
INNER JOIN dbo.Cliente with(nolock) ON dbo.Persona.PKID = dbo.Cliente.PKID               
INNER JOIN dbo.CategoriaCliente with(nolock) ON dbo.Cliente.IDCategoriaCliente = dbo.CategoriaCliente.PKID               
INNER JOIN dbo.TipoCliente with(nolock) ON dbo.Cliente.IDTipoCliente = dbo.TipoCliente.PKID               
LEFT OUTER JOIN dbo.ItemCp with(nolock) ON dbo.Cp.PKID = dbo.ItemCp.IDCp               
LEFT OUTER JOIN dbo.ItemProducto with(nolock) ON dbo.ItemCp.PKID = dbo.ItemProducto.PKID               
LEFT OUTER JOIN dbo.Producto with(nolock) ON dbo.ItemProducto.IDProducto = dbo.Producto.PKID               
LEFT OUTER JOIN dbo.ProductoServicio with(nolock) ON dbo.Producto.PKID = dbo.ProductoServicio.PKID               
LEFT OUTER JOIN dbo.Unidad with(nolock) ON dbo.ItemProducto.IDUnidad = dbo.Unidad.PKID                  
LEFT OUTER JOIN dbo.ClaseProductoServicio with(nolock) ON dbo.ProductoServicio.IDClaseProductoServicio = dbo.ClaseProductoServicio.PKID               
LEFT OUTER JOIN dbo.Marca with(nolock) ON dbo.Producto.IDMarca = dbo.Marca.PKID               
LEFT OUTER JOIN dbo.CpDistribucion with(nolock) ON dbo.Cp.PKID = dbo.CpDistribucion.PKID               
LEFT OUTER JOIN dbo.Zona with(nolock) ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaVenta               
LEFT OUTER JOIN dbo.Vendedor with(nolock) ON dbo.Cp.IDResponsable = dbo.Vendedor.PKID               
LEFT OUTER JOIN dbo.GrupoVentas with(nolock) ON dbo.GrupoVentas.PKID = dbo.Vendedor.IDGrupoVentas 
LEFT OUTER JOIN dbo.FuerzaVentas with(nolock) ON dbo.FuerzaVentas.PKID = dbo.GrupoVentas.IDFuerzaVentas                
LEFT OUTER JOIN dbo.Persona AS Proveedor with(nolock) ON dbo.Producto.IDProveedor = Proveedor.PKID               
LEFT OUTER JOIN dbo.CpInventario with(nolock) ON dbo.Cp.PKID = dbo.CpInventario.IDCp                
WHERE  (dbo.Cp.Anulado = 0) AND (dbo.Cp.Preliminar = 0)                 
AND    (dbo.Cp.IDTipoAsociado IN ('883', '818', '868'))             
AND    (dbo.Persona.PKID <> 3582)              
AND    (LEFT(dbo.TipoCp.Codigo,2)<>'ND') 
AND    (dbo.ItemCp.TipoitemCp <> '4')  
AND    (dbo.CptoOperacion.codigo not in ('VEOBST', 'VEOBSC', '2010VE010', '2010VE002', 'VE010', 'VE002'))

GO