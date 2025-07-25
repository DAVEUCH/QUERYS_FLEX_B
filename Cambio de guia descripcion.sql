--USE [FREDDY]
--GO
--/****** Object:  StoredProcedure [dbo].[usp_ComprobanteCP_Info_Cabecera_FACTUS]    Script Date: 6/06/2025 11:26:11 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER PROCEDURE [dbo].[usp_ComprobanteCP_Info_Cabecera_FACTUS]  
--(  
--@PKID int  
--)  
--AS        
--Set nocount on      
SELECT DISTINCT 
dbo.Cp.PKID, dbo.Cp.IDSucursal,   
Sucursal.Direccion as Emisor_SurcursalDireccion,   
Sucursal.CodigoEstable, TipoCp.Descripcion as TipoComprobante,   
case   
when left(rtrim(ltrim(TipoCp.Codigo)),2) = 'BV' then '03'  
when left(rtrim(ltrim(TipoCp.Codigo)),2) = 'FV' then '01'  
when left(rtrim(ltrim(TipoCp.Codigo)),2) = 'NC' then '07'  
when left(rtrim(ltrim(TipoCp.Codigo)),2) = 'ND' then '08'  
when left(rtrim(ltrim(TipoCp.Codigo)),2) = 'CP' then '40'  
end as tipoCompCode,   
dbo.Cp.NumCp AS NroSerieDoc, dbo.Cp.NumCp AS NroCorreDoc,   
case   
when Moneda.Codigo = 'SO' then 'PEN'  
when Moneda.Codigo = 'DO' then 'USD'  
end as tipoMonedaCode,   
dbo.Cp.Fecha AS Fecha,    
convert(varchar(4), Year(dbo.Cp.Fecha)) + '-' + right('00'+convert(varchar(2), Month(dbo.Cp.Fecha)),2) + '-' + right('00'+convert(varchar(2), Day(dbo.Cp.Fecha)),2) as FechaAñoMesDia,   
dbo.Persona.Nombre AS Cliente_Nombre, isnull(usv_Personas_Email.Email_Persona,'') as Email_Persona,  
dbo.Persona.DocIdentidad AS Cliente_NroDocumento,      
  
case   
when len(rtrim(ltrim(Direccion.descripcion))) > 70 then Left(rtrim(ltrim(Direccion.descripcion)),100)  
else  
Left(rtrim(ltrim(Direccion.descripcion)) + '-' + Departamento.descripcion + '-' + Provincia.descripcion + '-' + Distrito.descripcion,100)  
end   
AS Cliente_Direccion,   
  
Departamento.descripcion AS NomDepartamento, Provincia.descripcion AS NomProvincia,  Distrito.descripcion AS NomDistrito,   
CASE WHEN CpCobrarPagar.Credito = 0 THEN 'Contado' ELSE ModalidadCredito.Descripcion END AS FormaPago,   
CASE WHEN CpCobrarPagar.Credito = 0 THEN Null ELSE CpCobrarPagar.FechaVencimiento END AS FechaVence,    
Vendedor.Codigo AS VendedorCodigo, Vendedor.Nombre AS VendedorNombre,   
Cp.ValorAfecto, Cp.ValorInafecto, Cp.ValorVenta,   
dbo.Cp.ValorAfecto * 0.18 AS total_impuesto,   
Cp.Total, Cp.MontoPercepcion,   
dbo.Cp.Total AS NetoPagar,             
dbo.fun_MontoEnLetras(dbo.Cp.Total) + ' ' + upper(ltrim(rtrim(Moneda.descripcion))) AS MontoEnLetras  
FROM dbo.Cp            
INNER JOIN dbo.TipoCp ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp   
INNER JOIN dbo.Moneda ON dbo.Moneda.PKID = dbo.Cp.IDMoneda   
INNER JOIN dbo.GC_Sucursal_FE Sucursal ON Sucursal.PKID = dbo.Cp.IDSucursal   
LEFT OUTER JOIN dbo.CpCobrarPagar ON dbo.CpCobrarPagar.PKID = dbo.Cp.PKID   
LEFT OUTER JOIN dbo.ModalidadCredito ON dbo.ModalidadCredito.PKID = dbo.CpCobrarPagar.IDModalidadCredito   
LEFT OUTER JOIN dbo.Persona ON dbo.Persona.PKID = dbo.Cp.IDPersona   
LEFT OUTER JOIN (Select top 1 idPersona, Email_Persona From usv_Personas_Email) usv_Personas_Email  ON usv_Personas_Email.idPersona = dbo.Cp.IDPersona   
LEFT OUTER JOIN dbo.Direccion ON dbo.Direccion.PKID = dbo.Persona.IDDireccionPrincipal   
LEFT OUTER JOIN dbo.Departamento ON dbo.Direccion.IDDepartamento = Departamento.pkid   
LEFT OUTER JOIN dbo.Provincia ON dbo.Direccion.IDProvincia = Provincia.pkid  
LEFT OUTER JOIN dbo.Distrito ON dbo.Direccion.IDDistrito = Distrito.pkid  
LEFT OUTER JOIN dbo.Persona AS Vendedor ON Vendedor.PKID = dbo.Cp.IDResponsable
WHERE Cp.PKID = 2986217  

select*from Cp WHERE NumCp='TAM02-0098183'
SELECT*FROM CptoOperacion WHERE PKID=1757

SELECT*FROM TipoCp WHERE 
--Descripcion LIKE '%trans%'
--and 
PKID IN (5055,
5056,
5057,
5058,
5059,
5206,
5280,
5368,
5624,
5632,
5633,
5646,
5720,
5721,
5722,
5723,
5724
)