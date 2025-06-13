--USE [FREDDY]
--GO

--/****** Object:  View [dbo].[vrpteVentas_DetComprobantesyProductos_Mercaderia]    Script Date: 11/12/2024 12:41:56 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO




create VIEW vrpteVentas_DetComprobantesyProductos_Mercaderia_Combo
AS                  
SELECT 
Cp.Fecha, CONVERT(nvarchar(5), Cp.Hora, 108) as Hora,  
dbo.Sucursal.PKID AS SucursalID,dbo.Sucursal.Nombre AS SucursalNombre,     
dbo.TipoCp.Descripcion AS Tipo_Comprobante, dbo.Cp.NumCp AS Numero_Comprobante,
dbo.Persona.Nombre AS ClienteNombre, 
dbo.ProductoServicio.Codigo AS ProductoCodigo_padre,
fpf.CodigoInterno as Codigo_Interno_padre,
dbo.itemcp.EsAgrupacion,
dbo.ProductoServicio.Descripcion AS ProductoDescripcion_padre,     
dbo.ProductoServicio.DescripcionResumida as ProductoDescripcionAbrev ,
ps1.Codigo as ProductoCodigo_hijo,
ps1.Descripcion as ProductoDescripcion_hijo,
dbo.Marca.Descripcion as ProductoMarca, 
case left(dbo.TipoCp.Descripcion,2) when 'NC' then (ItemCp.cantidad * -1) else ItemCp.cantidad end as Cantidad_Venta,      
case left(dbo.TipoCp.Descripcion,2) when 'NC' then (dbo.ItemCp.ValorUnitario / ((ItemCp.PorcentajeImpto /100)+1) ) *-1 else (dbo.ItemCp.ValorUnitario / ((ItemCp.PorcentajeImpto /100)+1) ) End AS PrecioUni_sinIGV,     
case left(dbo.TipoCp.Descripcion,2) when 'NC' then dbo.ItemCp.ValorUnitario * -1  else dbo.ItemCp.ValorUnitario end AS PrecioUni_conIGV,    
case Cp.IDMoneda when 1 then ItemCp.ValorAfecto else (ItemCp.ValorAfecto/Cp.tipoCambio) end * 
case left(dbo.TipoCp.Descripcion,2) when 'NC' then -1 else 1 end AS Total_sinIGV_aSoles, 
case Cp.IDMoneda when 1 then dbo.ItemCp.Total else (dbo.ItemCp.Total/Cp.tipoCambio) end * 
case left(dbo.TipoCp.Descripcion,2) when 'NC' then -1 else 1 end AS Total_conIGV_aSoles
FROM             
dbo.Cp        
INNER JOIN dbo.Persona AS Responsable ON dbo.Cp.IDResponsable = Responsable.PKID             
INNER JOIN dbo.TipoCp ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp             
INNER JOIN dbo.Moneda ON dbo.Moneda.PKID = dbo.Cp.IDMoneda                  
INNER JOIN dbo.Persona ON dbo.Cp.IDPersona = dbo.Persona.PKID             
INNER JOIN dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID             
INNER JOIN dbo.Cliente ON dbo.Persona.PKID = dbo.Cliente.PKID                        
LEFT OUTER JOIN dbo.Persona Vende ON CP.IDResponsable = Vende.PKID             
LEFT OUTER JOIN dbo.ItemCp ON dbo.Cp.PKID = dbo.ItemCp.IDCp      
LEFT OUTER JOIN dbo.ItemCpventa ON dbo.ItemCp.PKID = dbo.ItemCpventa.PKID             
LEFT OUTER JOIN dbo.ItemProducto ON dbo.ItemCp.PKID = dbo.ItemProducto.PKID             
LEFT OUTER JOIN dbo.Producto ON dbo.ItemProducto.IDProducto = dbo.Producto.PKID             
LEFT OUTER JOIN dbo.ProductoServicio ON dbo.Producto.PKID = dbo.ProductoServicio.PKID 
--se agrego la tabla Freddy.ProductoFreddy
left OUTER join Freddy.ProductoFreddy fpf on fpf.PKID= dbo.ProductoServicio.PKID
LEFT join ProductoAgrupacion pagru on pagru.IDProductoPadre= dbo.ProductoServicio.PKID 
left join ProductoServicio ps1 on pagru.IDProducto=ps1.PKID
LEFT OUTER JOIN dbo.Marca ON dbo.Producto.IDMarca = dbo.Marca.PKID         
LEFT OUTER JOIN dbo.Unidad ON dbo.ProductoServicio.IDUnidadReferencia = dbo.Unidad.PKID   
LEFT OUTER JOIN dbo.ClaseProductoServicio ON dbo.ProductoServicio.IDClaseProductoServicio = dbo.ClaseProductoServicio.PKID             
WHERE  (dbo.Cp.Anulado = 0) AND (dbo.Cp.Preliminar = 0)               
AND    (dbo.Cp.IDTipoAsociado IN ('883', '818', '868'))           
AND    (dbo.ProductoServicio.IDTipoProductoServicio=1)
AND    (LEFT(dbo.TipoCp.Codigo,2)<>'ND') 
AND    (dbo.Cp.IDCptoOperacion <> 1630)
AND    (dbo.Persona.PKID <> 3582)         --3582 en freddy  y 1739 en gc    
AND    (dbo.Producto.IDMarca not in (87, 135) ) -- OBSEQUIO
AND    (dbo.ClaseProductoServicio.Descripcion not in ('OBSEQUIO PORTAVASO', 'OBSEQUIOS', 'OBSEQUIO', 'SERVICIOS','Servicios de Ventas','Servicios de Alquiler','Otros Servicios'))
--and dbo.itemcp.EsAgrupacion=1
--and Cp.Fecha between '01-01-2024' and '16-12-2024'
--and dbo.Cp.NumCp='F09-0017337'
order by Cp.Fecha desc


select top 1*from ItemCp




