alter VIEW vrpteVentas_DetComprobantes01
AS                      
SELECT 
case when dbo.TipoCp.Codigo in ('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07','BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 100000200 else dbo.Cp.IDSucursal end as SucursalID,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then '0008' else dbo.Sucursal.Codigo end as SucursalCodigo,
case when dbo.TipoCp.Codigo in('FVC07', 'FV007', 'BV007', 'BVE07', 'FVE07', 'BVC07', 'NCC07', 'NCE07', 'NCEF7', 'NCEB7', 'NCCB7', 'NCCF7') then 'SUCURSAL - PDV 07' else dbo.Sucursal.Nombre end as SucursalNombre,
Cp.Fecha, CONVERT(nvarchar(5), Cp.Hora, 108) as Hora,      
--dbo.Sucursal.PKID AS SucursalID, dbo.Sucursal.Nombre AS SucursalNombre,         
dbo.TipoCp.Descripcion AS Tipo_Comprobante, dbo.Cp.NumCp AS Numero_Comprobante,    
case dbo.CpCobrarPagar.IDModalidadCredito when 0 then 'CONTADO' else ModalidadCredito.Descripcion end as [Modalidad_Credito],  
case dbo.CpCobrarPagar.IDModalidadCredito when 0 then 0 else 1 end as [Modalidad_Credito_cod],      
dbo.Persona.PKID AS ClienteID, dbo.Persona.Nombre AS ClienteNombre,   
Cp.IDResponsable AS VendedorID, Vendedor.Nombre AS VendedorNombre,   
case Cp.IDMoneda when 1 then Cp.Total else (Cp.Total *Cp.TipoCambio) end * 
case left(TipoCp.Descripcion,2) when 'NC' then -1 else 1 end AS Total_aSoles,
case Cp.IDMoneda when 1 then (Cp.Total /Cp.TipoCambio) else Cp.Total end * 
case left(TipoCp.Descripcion,2) when 'NC' then -1 else 1 end AS Total_aDolares,

case left(TipoCp.Descripcion,2) when 'NC' then 
	case Cp.IDMoneda when 1 then (Cp.Total * -1) else ((Cp.Total /Cp.TipoCambio)* -1) end
else 
	case Cp.IDMoneda when 1 then Cp.Total else (Cp.Total /Cp.TipoCambio) end
end as Total 
FROM                 
dbo.Cp            
INNER JOIN dbo.Persona AS Responsable ON dbo.Cp.IDResponsable = Responsable.PKID                 
INNER JOIN dbo.TipoCp ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp                 
INNER JOIN dbo.Moneda ON dbo.Moneda.PKID = dbo.Cp.IDMoneda                 
INNER JOIN dbo.CpCobrarPagar ON dbo.CpCobrarPagar.PKID = dbo.Cp.PKID                 
INNER JOIN dbo.ModalidadCredito ON dbo.ModalidadCredito.PKID = dbo.CpCobrarPagar.IDModalidadCredito            
INNER JOIN dbo.Persona ON dbo.Cp.IDPersona = dbo.Persona.PKID                 
INNER JOIN dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID                 
INNER JOIN dbo.Cliente ON dbo.Persona.PKID = dbo.Cliente.PKID  
INNER JOIN dbo.Persona Vendedor ON dbo.Cp.IDResponsable = Vendedor.PKID                           
WHERE  (dbo.Cp.Anulado = 0)   
AND    (dbo.Cp.Preliminar = 0)                   
AND    (dbo.Cp.IDTipoAsociado IN ('883', '818', '868'))  
GO