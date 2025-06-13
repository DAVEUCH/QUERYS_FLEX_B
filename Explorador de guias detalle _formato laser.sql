--USE [GCI]
--GO

--/****** Object:  View [dbo].[usv_InfoCpInventarioSalidaGCI_desdePedido]    Script Date: 1/04/2025 10:38:54 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


--ALTER view [dbo].[usv_InfoCpInventarioSalidaGCI_desdePedido]
--AS 
--select top 2*from Unidad
SELECT dbo.Cp.PKID AS ComprobantePKID, dbo.Cp.NumCp AS ComprobanteNumCp, dbo.Cp.PersonaNombre AS ComprobanteClienteNombre,                 
Persona.DocIdentidad AS ComprobanteClienteDocIdentidad,              
dbo.Cp.FechaEmision AS ComprobanteFechaEmision,     
dbo.Sucursal.Direccion AS ComprobanteDireccionPartida,     
Direccion_1.Descripcion  + '- ' + Distrito_1.Descripcion + '- ' + Provincia_1.Descripcion + '- ' + Departamento_1.Descripcion         
AS ComprobanteDireccionEntrega, Persona_1.Nombre AS ComprobanteTransportistaNombre,                 
dbo.Vehiculo.Placa AS ComprobanteVehiculoPlaca, dbo.Vehiculo.Marca AS ComprobanteVehiculoMarca,                 
dbo.Vehiculo.Modelo AS ComprobanteVehiculoModelo, dbo.Vehiculo.CertificadoInscripcion AS ComprobanteVehiculoCertificadoInscripcion,                 
dbo.ItemCp.Cantidad AS ItemProductoCantidad, dbo.Unidad.Abreviacion AS ItemProductoUnidad, dbo.ItemCp.Cantidad *dbo.Unidad.Peso AS ItemProductoPeso,dbo.Unidad.Peso,
dbo.ProductoServicio.Codigo AS ItemProductoCodigo, 
Freddy.ProductoFreddy.CodigoInterno AS ItemProductoCodigoInterno,                 
CASE WHEN dbo.ItemCp.TipoItemCp = 4 AND dbo.ProductoServicio.DescripcionResumida IS NULL                 
THEN 'ANTICIPO' ELSE dbo.ProductoServicio.Descripcion END AS ItemProductoDescripcion, 
dbo.ItemCp.ValorUnitario AS ItemProductoValorUnitario, dbo.ItemCp.Total AS ItemProductoTotal, dbo.Cp.Total AS ComprobanteTotal, 
ProductoAlmacen.StockFisico as StockActual, 
/*'' AS ComprobantePosteriorNumCp,     
'' AS ComprobantePosteriorFechaEmision,     */
/************************ES DEL PEDIDO***********************    */
Cp_Fac.NumCp AS ComprobantePosteriorNumCp,     
Cp_Fac.FechaEmision AS ComprobantePosteriorFechaEmision,     
/****************************************************************/    
dbo.Cp.Observacion AS ComprobanteObservacion,                 
--Direccion_Clie.Descripcion AS ClienteDireccion,   
Pedido.Direccion AS ClienteDireccion,         
isnull(Distrito_Clie.Descripcion,'') AS Distrito, isnull(Provincia_Clie.Descripcion,'') AS Provincia, isnull(Departamento_Clie.Descripcion,'') AS Departamento, 
/*(      
SELECT TOP 1 DireccionRela.Descripcion + '- ' + DRELA.Descripcion + '- ' + PRELA.Descripcion + '- ' + DPRELA.Descripcion AS Expr1                 
FROM dbo.CpRelacionado AS Relacion INNER JOIN                
dbo.Pedido AS cpRelacion ON cprelacion.PKID = Relacion.IDCpRelacionado LEFT OUTER JOIN                
dbo.Direccion AS DireccionRela ON DireccionRela.Descripcion = cpRelacion.Direccion LEFT OUTER JOIN                
dbo.Distrito AS DRELA ON DRELA.PKID = DireccionRela.IDDistrito LEFT OUTER JOIN                
dbo.Provincia AS PRELA ON PRELA.PKID = DireccionRela.IDProvincia LEFT OUTER JOIN                
dbo.Departamento AS DPRELA ON DPRELA.PKID = DireccionRela.IDDepartamento              
WHERE (relacion.IDCp = dbo.Cp.PKID)      
)       */
'' AS DireccionClienteEnvio,         
itemCp.EsAgrupacion
FROM  dbo.Cp           
INNER JOIN dbo.Sucursal ON dbo.Sucursal.PKID = dbo.Cp.IDSucursal            
INNER JOIN dbo.ItemCp  ON dbo.ItemCp.IDCp = dbo.Cp.PKID              
INNER JOIN dbo.ItemProducto ON dbo.ItemProducto.PKID = dbo.ItemCp.PKID            
LEFT OUTER JOIN  (Select IDCp, IDCpRelacionado from CpRelacionado where IDTipoCpDestino = '883' ) AS CpRelac_Fac ON CpRelac_Fac.IDCpRelacionado = dbo.Cp.PKID      
LEFT OUTER JOIN  dbo.Cp AS Cp_Fac ON Cp_Fac.PKID = CpRelac_Fac.IDCp 
LEFT OUTER JOIN  dbo.CpRelacionado  AS CpRelacionado_1 ON dbo.Cp.PKID =  CpRelacionado_1.IDCp     
LEFT OUTER JOIN  dbo.Cp AS Cp_1 ON CpRelacionado_1.IDCpRelacionado = Cp_1.PKID               
LEFT OUTER JOIN  Pedido ON Pedido.PKID = CpRelacionado_1.IDCpRelacionado 
LEFT OUTER JOIN  Freddy.PedidoFreddy ON Freddy.PedidoFreddy.PKID = CpRelacionado_1.IDCpRelacionado 
LEFT OUTER JOIN  dbo.Persona AS Persona_1 ON Freddy.PedidoFreddy.IDEmpresaTransporte = Persona_1.PKID               
LEFT OUTER JOIN  dbo.Direccion AS Direccion_1 ON Persona_1.IDDireccionPrincipal = Direccion_1.PKID               
LEFT OUTER JOIN  dbo.Distrito  AS Distrito_1 ON Direccion_1.IDDistrito = Distrito_1.PKID               
LEFT OUTER JOIN  dbo.Provincia AS Provincia_1 ON Direccion_1.IDProvincia = Provincia_1.PKID               
LEFT OUTER JOIN  dbo.Departamento AS Departamento_1 ON Direccion_1.IDDepartamento = Departamento_1.PKID                       
LEFT OUTER JOIN  dbo.Persona ON Persona.PKID = dbo.cp.IDPersona        
--LEFT OUTER JOIN  dbo.Direccion AS Direccion_Clie ON Persona.IDDireccionPrincipal = Direccion_Clie.PKID 
LEFT OUTER JOIN  dbo.Direccion AS Direccion_Clie ON Pedido.IDDireccionCliente = Direccion_Clie.PKID
LEFT OUTER JOIN  dbo.Distrito  AS Distrito_Clie ON Direccion_Clie.IDDistrito = Distrito_Clie.PKID               
LEFT OUTER JOIN  dbo.Provincia AS Provincia_Clie ON Direccion_Clie.IDProvincia = Provincia_Clie.PKID               
LEFT OUTER JOIN  dbo.Departamento AS Departamento_Clie ON Direccion_Clie.IDDepartamento = Departamento_Clie.PKID            
LEFT OUTER JOIN  dbo.CpInventarioSalida ON dbo.Cp.PKID = dbo.CpInventarioSalida.PKID              
LEFT OUTER JOIN  dbo.Vehiculo ON dbo.CpInventarioSalida.IDVehiculo = dbo.Vehiculo.PKID               
LEFT OUTER JOIN  dbo.ProductoServicio ON dbo.ProductoServicio.PKID = dbo.ItemProducto.IDProducto 
LEFT OUTER JOIN  dbo.ProductoAlmacen ON dbo.ProductoAlmacen.IDProducto = dbo.ItemProducto.IDProducto And dbo.ProductoAlmacen.IDAlmacen = dbo.ItemProducto.IDAlmacen   
LEFT OUTER JOIN  Freddy.ProductoFreddy ON Freddy.ProductoFreddy.PKID = dbo.ProductoServicio.PKID          
LEFT OUTER JOIN  dbo.Unidad ON dbo.ItemProducto.IDUnidad = dbo.Unidad.PKID
Where itemCp.EsAgrupacion=0  and dbo.ItemCp.ValorUnitario>0 AND dbo.Cp.NumCp = 'T001-00007470'
Union all
SELECT dbo.Cp.PKID AS ComprobantePKID, dbo.Cp.NumCp AS ComprobanteNumCp, dbo.Cp.PersonaNombre AS ComprobanteClienteNombre,                 
Persona.DocIdentidad AS ComprobanteClienteDocIdentidad,              
dbo.Cp.FechaEmision AS ComprobanteFechaEmision,     
dbo.Sucursal.Direccion AS ComprobanteDireccionPartida,     
Direccion_1.Descripcion  + '- ' + Distrito_1.Descripcion + '- ' + Provincia_1.Descripcion + '- ' + Departamento_1.Descripcion         
AS ComprobanteDireccionEntrega, Persona_1.Nombre AS ComprobanteTransportistaNombre,                 
dbo.Vehiculo.Placa AS ComprobanteVehiculoPlaca, dbo.Vehiculo.Marca AS ComprobanteVehiculoMarca,                 
dbo.Vehiculo.Modelo AS ComprobanteVehiculoModelo, dbo.Vehiculo.CertificadoInscripcion AS ComprobanteVehiculoCertificadoInscripcion,                 
dbo.ItemCp.Cantidad AS ItemProductoCantidad, dbo.Unidad.Abreviacion AS ItemProductoUnidad, dbo.ItemCp.Cantidad*dbo.Unidad.Peso  AS ItemProductoPeso,dbo.Unidad.Peso,
dbo.ProductoServicio.Codigo AS ItemProductoCodigo, 
Freddy.ProductoFreddy.CodigoInterno AS ItemProductoCodigoInterno,                 
CASE WHEN dbo.ItemCp.TipoItemCp = 4 AND dbo.ProductoServicio.DescripcionResumida IS NULL                 
THEN 'ANTICIPO' ELSE dbo.ProductoServicio.Descripcion END AS ItemProductoDescripcion, 
dbo.ItemCp.ValorUnitario AS ItemProductoValorUnitario, dbo.ItemCp.Total AS ItemProductoTotal, dbo.Cp.Total AS ComprobanteTotal, 
ProductoAlmacen.StockFisico as StockActual, 
/*'' AS ComprobantePosteriorNumCp,     
'' AS ComprobantePosteriorFechaEmision,     */
/************************ES DEL PEDIDO***********************    */
Cp_Fac.NumCp AS ComprobantePosteriorNumCp,     
Cp_Fac.FechaEmision AS ComprobantePosteriorFechaEmision,     
/****************************************************************/    
dbo.Cp.Observacion AS ComprobanteObservacion,                 
--Direccion_Clie.Descripcion AS ClienteDireccion,   
Pedido.Direccion AS ClienteDireccion,         
isnull(Distrito_Clie.Descripcion,'') AS Distrito, isnull(Provincia_Clie.Descripcion,'') AS Provincia, isnull(Departamento_Clie.Descripcion,'') AS Departamento, 
/*(      
SELECT TOP 1 DireccionRela.Descripcion + '- ' + DRELA.Descripcion + '- ' + PRELA.Descripcion + '- ' + DPRELA.Descripcion AS Expr1                 
FROM dbo.CpRelacionado AS Relacion INNER JOIN                
dbo.Pedido AS cpRelacion ON cprelacion.PKID = Relacion.IDCpRelacionado LEFT OUTER JOIN                
dbo.Direccion AS DireccionRela ON DireccionRela.Descripcion = cpRelacion.Direccion LEFT OUTER JOIN                
dbo.Distrito AS DRELA ON DRELA.PKID = DireccionRela.IDDistrito LEFT OUTER JOIN                
dbo.Provincia AS PRELA ON PRELA.PKID = DireccionRela.IDProvincia LEFT OUTER JOIN                
dbo.Departamento AS DPRELA ON DPRELA.PKID = DireccionRela.IDDepartamento              
WHERE (relacion.IDCp = dbo.Cp.PKID)      
)       */
'' AS DireccionClienteEnvio,         
itemCp.EsAgrupacion
FROM  dbo.Cp           
INNER JOIN dbo.Sucursal ON dbo.Sucursal.PKID = dbo.Cp.IDSucursal            
INNER JOIN dbo.ItemCp  ON dbo.ItemCp.IDCp = dbo.Cp.PKID              
INNER JOIN dbo.ItemProducto ON dbo.ItemProducto.PKID = dbo.ItemCp.PKID            
LEFT OUTER JOIN  (Select IDCp, IDCpRelacionado from CpRelacionado where IDTipoCpDestino = '883'  ) AS CpRelac_Fac ON CpRelac_Fac.IDCpRelacionado = dbo.Cp.PKID      
LEFT OUTER JOIN  dbo.Cp AS Cp_Fac ON Cp_Fac.PKID = CpRelac_Fac.IDCp 
LEFT OUTER JOIN  dbo.CpRelacionado  AS CpRelacionado_1 ON dbo.Cp.PKID =  CpRelacionado_1.IDCp     
LEFT OUTER JOIN  dbo.Cp AS Cp_1 ON CpRelacionado_1.IDCpRelacionado = Cp_1.PKID               
LEFT OUTER JOIN  Pedido ON Pedido.PKID = CpRelacionado_1.IDCpRelacionado 
LEFT OUTER JOIN  Freddy.PedidoFreddy ON Freddy.PedidoFreddy.PKID = CpRelacionado_1.IDCpRelacionado 
LEFT OUTER JOIN  dbo.Persona AS Persona_1 ON Freddy.PedidoFreddy.IDEmpresaTransporte = Persona_1.PKID               
LEFT OUTER JOIN  dbo.Direccion AS Direccion_1 ON Persona_1.IDDireccionPrincipal = Direccion_1.PKID               
LEFT OUTER JOIN  dbo.Distrito  AS Distrito_1 ON Direccion_1.IDDistrito = Distrito_1.PKID               
LEFT OUTER JOIN  dbo.Provincia AS Provincia_1 ON Direccion_1.IDProvincia = Provincia_1.PKID               
LEFT OUTER JOIN  dbo.Departamento AS Departamento_1 ON Direccion_1.IDDepartamento = Departamento_1.PKID                       
LEFT OUTER JOIN  dbo.Persona ON Persona.PKID = dbo.cp.IDPersona        
--LEFT OUTER JOIN  dbo.Direccion AS Direccion_Clie ON Persona.IDDireccionPrincipal = Direccion_Clie.PKID 
LEFT OUTER JOIN  dbo.Direccion AS Direccion_Clie ON Pedido.IDDireccionCliente = Direccion_Clie.PKID
LEFT OUTER JOIN  dbo.Distrito  AS Distrito_Clie ON Direccion_Clie.IDDistrito = Distrito_Clie.PKID               
LEFT OUTER JOIN  dbo.Provincia AS Provincia_Clie ON Direccion_Clie.IDProvincia = Provincia_Clie.PKID               
LEFT OUTER JOIN  dbo.Departamento AS Departamento_Clie ON Direccion_Clie.IDDepartamento = Departamento_Clie.PKID            
LEFT OUTER JOIN  dbo.CpInventarioSalida ON dbo.Cp.PKID = dbo.CpInventarioSalida.PKID              
LEFT OUTER JOIN  dbo.Vehiculo ON dbo.CpInventarioSalida.IDVehiculo = dbo.Vehiculo.PKID               
LEFT OUTER JOIN  dbo.ProductoServicio ON dbo.ProductoServicio.PKID = dbo.ItemProducto.IDProducto  
LEFT OUTER JOIN  dbo.ProductoAlmacen ON dbo.ProductoAlmacen.IDProducto = dbo.ItemProducto.IDProducto And dbo.ProductoAlmacen.IDAlmacen = dbo.ItemProducto.IDAlmacen   
LEFT OUTER JOIN  Freddy.ProductoFreddy ON Freddy.ProductoFreddy.PKID = dbo.ProductoServicio.PKID          
LEFT OUTER JOIN  dbo.Unidad ON dbo.ItemProducto.IDUnidad = dbo.Unidad.PKID
Where itemCp.EsAgrupacion=1
AND dbo.Cp.NumCp = 'T001-00007470'
GO


