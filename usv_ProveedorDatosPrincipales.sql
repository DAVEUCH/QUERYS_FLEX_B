create view usv_ProveedorDatosPrincipales
as
SELECT  dbo.Persona.pkid as IDersona, dbo.Persona.DocIdentidad, dbo.Persona.Nombre as NombreCliente, 
dbo.Direccion.Descripcion + ' - ' + dbo.Distrito.Descripcion + ' - ' + dbo.Provincia.Descripcion + ' - ' + dbo.Departamento.Descripcion AS Direccion_Cliente,               
CASE WHEN Provincia.Descripcion = 'LIMA' THEN Distrito.Descripcion ELSE Provincia.Descripcion END AS Localidad_Cliente,     
dbo.fun_ObtenerTelefono(dbo.Persona.PKID) AS Telefono, 
dbo.Proveedor.LineaCredito as Linea_Credito,                
dbo.Proveedor.BalanceSoles as Linea_Utilizada,     
dbo.fn_Linea_Disponible(dbo.Proveedor.PKID) as Linea_Disponible  
FROM dbo.Persona 
LEFT OUTER JOIN dbo.Proveedor ON dbo.Persona.PKID = dbo.Proveedor.PKID 
LEFT OUTER JOIN dbo.ModalidadCredito ON dbo.Proveedor.IDModalidadCredito = dbo.ModalidadCredito.PKID 
LEFT OUTER JOIN dbo.TipoMedioDePago ON dbo.Proveedor.IDTipoMedioDePago = dbo.TipoMedioDePago.PKID 
LEFT OUTER JOIN dbo.Direccion ON dbo.Persona.PKID = dbo.Direccion.IDPersona AND dbo.Direccion.DireccionPrincipal = 1 
LEFT OUTER JOIN dbo.Departamento ON dbo.Direccion.IDDepartamento = dbo.Departamento.PKID 
LEFT OUTER JOIN dbo.Provincia ON dbo.Direccion.IDProvincia = dbo.Provincia.PKID 
LEFT OUTER JOIN dbo.Distrito ON dbo.Direccion.IDDistrito = dbo.Distrito.PKID    
GO