--USE [FREDDY]
--GO
--/****** Object:  StoredProcedure [dbo].[usp_ComprobanteVentas_Info_Cabecera_FACTUS]    Script Date: 28/11/2024 11:21:54 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER PROCEDURE [dbo].[usp_ComprobanteVentas_Info_Cabecera_FACTUS]
--(          
--@PKID int          
--)          
--AS                
--Set nocount on
SELECT top 1         
dbo.Cp.PKID, dbo.Cp.IDSucursal,           
Sucursal.Direccion as Emisor_SurcursalDireccion,           
TipoCp.Descripcion as TipoComprobante,           
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
dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID) as MontoAnticipo,           
--dbo.Persona.Nombre AS Cliente_Nombre,     
Replace(Replace(Persona.Nombre,'"', ''''),'’', '')  AS Cliente_Nombre,       
--isnull(usv_Personas_Email.Email_Persona,'') as Email_Persona,          
(
Select top 1 Email_Persona From usv_Personas_Email where usv_Personas_Email.idPersona = Cp.IDPersona 
) as Email_Persona, 

dbo.Persona.DocIdentidad AS Cliente_NroDocumento,              
--CpVenta.Direccion AS Cliente_Direccion,           
/*case       
when len(rtrim(ltrim(Direccion.descripcion))) > 70 then Left(rtrim(ltrim(Direccion.descripcion)),100)      
else      
Left(rtrim(ltrim(Direccion.descripcion)) + '-' + Departamento.descripcion + '-' + Provincia.descripcion + '-' + Distrito.descripcion ,100)      
end  */
case isnull(dbo.CpVenta.IDDireccionEntrega,0) when 0 then dbo.CpVenta.DireccionEntrega else Left(rtrim(ltrim(Direccion.descripcion)) + '-' + Departamento.descripcion + '-' + Provincia.descripcion + '-' + Distrito.descripcion ,100)  end 
AS Cliente_Direccion,   
Departamento.descripcion AS NomDepartamento, Provincia.descripcion AS NomProvincia,  Distrito.descripcion AS NomDistrito,       
CASE WHEN CpCobrarPagar.Credito = 0 THEN 'Contado' ELSE ModalidadCredito.Descripcion END AS FormaPago,           
CASE WHEN CpCobrarPagar.Credito = 0 THEN Null ELSE CpCobrarPagar.FechaVencimiento END AS FechaVence,            
Vendedor.Codigo AS VendedorCodigo, Vendedor.Nombre AS VendedorNombre,           
CASE Cp.ValorAfecto WHEN 0 THEN 0 ELSE (dbo.Cp.Total -  dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) / 1.18  END as ValorAfecto,   
CASE Cp.ValorInafecto WHEN 0 THEN 0 ELSE (dbo.Cp.Total -  dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) / 1.18  END as ValorInafecto,   
CASE Cp.ValorVenta WHEN 0 THEN 0 ELSE (dbo.Cp.Total -  dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) / 1.18  END as ValorVenta,   
((dbo.Cp.Total -  dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) -  ((dbo.Cp.Total -  dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) / 1.18))  AS total_impuesto,           
(Cp.Total-dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) as Total, Cp.MontoPercepcion,           
dbo.Cp.Total - dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID) AS NetoPagar,                     
dbo.MontoEnLetras(dbo.Cp.Total -  dbo.usf_ObtenAnticipo_Cp_Monto(Cp.PKID)) + ' ' + upper(ltrim(rtrim(Moneda.descripcion)))          
AS MontoEnLetras,Sucursal.Codigo as SerieEmi,         
--tipCPRela.descripcion as Descripcion_DocRela,         
tipCPRela.Codigo as CodTipoDoc_DocRela, 

--case left(tipCPRela.Codigo,2)        
--when 'GR' then Post.Numcp         
--else ''         
----convert(varchar(4), Year(Post.fechaEmision)) + '-' + right('00'+convert(varchar(2), Month(Post.fechaEmision)),2) + '-' + right('00'+convert(varchar(2), Day(Post.fechaEmision)),2) as fecha_DocRela,         
--end  
vgf.GuiaNumCp
as NumeroGR_Rela,

CpVenta.NumeroOrdenCompra        
FROM dbo.Cp               
INNER JOIN dbo.CpVenta ON dbo.CpVenta.PKID = dbo.Cp.pkid                
INNER JOIN dbo.TipoCp ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp           
INNER JOIN dbo.Moneda ON dbo.Moneda.PKID = dbo.Cp.IDMoneda           
INNER JOIN dbo.GC_Sucursal_FE Sucursal ON Sucursal.PKID = dbo.Cp.IDSucursal           
LEFT OUTER JOIN dbo.CpCobrarPagar ON dbo.CpCobrarPagar.PKID = dbo.Cp.PKID           
LEFT OUTER JOIN dbo.ModalidadCredito ON dbo.ModalidadCredito.PKID = dbo.CpCobrarPagar.IDModalidadCredito           
LEFT OUTER JOIN dbo.Persona ON dbo.Persona.PKID = dbo.Cp.IDPersona           
--LEFT OUTER JOIN (Select top 1 idPersona, Email_Persona From usv_Personas_Email) usv_Personas_Email  ON usv_Personas_Email.idPersona = dbo.Cp.IDPersona           
--LEFT OUTER JOIN dbo.Direccion ON dbo.Direccion.PKID = dbo.Persona.IDDireccionPrincipal           
LEFT OUTER JOIN dbo.Direccion ON dbo.Direccion.PKID = dbo.CpVenta.IDDireccionEntrega          
LEFT OUTER JOIN dbo.Departamento ON dbo.Direccion.IDDepartamento = Departamento.pkid         
LEFT OUTER JOIN dbo.Provincia ON dbo.Direccion.IDProvincia = Provincia.pkid        
LEFT OUTER JOIN dbo.Distrito ON dbo.Direccion.IDDistrito = Distrito.pkid        
LEFT OUTER JOIN dbo.Persona AS Vendedor ON Vendedor.PKID = dbo.Cp.IDResponsable                       
--CP RELACIONADO(GR)        
LEFT OUTER JOIN CpRelacionado ON CpRelacionado.IDCp=Cp.PKID          
LEFT OUTER JOIN Cp Post ON Post.PKID=CpRelacionado.IDCpRelacionado          
LEFT OUTER JOIN TipoCp tipCPRela ON Post.IDTipoCp=tipCPRela.PKID   
LEFT JOIN vrpt_FacturaGuia vgf on vgf.CpVentaID=dbo.CpVenta.PKID
WHERE Cp.PKID = 2857481    

Select*from Cp where NumCp='FC01-0001752'
