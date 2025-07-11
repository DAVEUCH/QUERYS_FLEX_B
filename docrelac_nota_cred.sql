select * from Cp where NumCp='F09-0018592' and PKID=2981056
select * from Cp where NumCp='FNC9-0000634' and PKID=2987275

select *from Cp where NumCp='F06-0028045' and PKID=3016918--2DO
select *from Cp where NumCp='BND6-0000120' and PKID=3016919--1ro

select *from Cp where NumCp in ('BNC2-0001365','FCC1-0000123','FNC5-0000942','BND6-0000120')
SELECT top 10*FROM CpRelacionado_2 WHERE IDCp IN (3019381,3016919,3012606,3027903)

and PKID=3019381--1RO

select * from Cp where NumCp='F09-0018818' and PKID=3002948
select * from Cp where NumCp='FNC9-0000643' and PKID=3003014

SELECT top 10*FROM CpRelacionado_2 WHERE IDCp IN (3019381,3016919,3012606,3027903)

SELECT top 10*FROM CpRelacionado_2 WHERE IDCp IN (3016919)
SELECT top 10*FROM CpRelacionado WHERE IDCp=3019381

insert into CpRelacionado (IDCp,IDCpRelacionado,IDTipoCpRelacionado,IDTipoCpDestino)
values (3012606,2999299,'883','818'),
(3016919,3016918,'883','818')

select*from  CpRelacionado_2 WHERE IDCp=3003014

select*from Periodo 
update Periodo set Activo=1 where PKID=100000490

SELECT *
INTO CpRelacionado_2
FROM CpRelacionado
WHERE 1 = 0;


create TRIGGER trg_Replica_CpRelacionado
ON CpRelacionado
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO CpRelacionado_2 (IDCp, IDCpRelacionado, IDTipoCpRelacionado, IDTipoCpDestino)
    SELECT IDCp, IDCpRelacionado, IDTipoCpRelacionado, IDTipoCpDestino
    FROM inserted
    WHERE IDTipoCpRelacionado = '883'
      AND IDTipoCpDestino IN ('818', '868');
END;

FCC

INSERT INTO CpRelacionado (IDCp,IDCpRelacionado,IDTipoCpRelacionado,IDTipoCpDestino)
VALUES(2991145,2991138,883,818)
delete from CpRelacionado WHERE IDCp=2966365

select*from Cp where NumCp='614-0086170' and PKID=3003003
select*from Cp where NumCp='T006-00001532' AND PKID=3003004

--select*from VoucherContable where PKID=2908276

--update VoucherContable set Anulado=0 where PKID=2908276


--LEFT OUTER JOIN CpRelacionado ON CpRelacionado.IDCp=Cp.PKID      
--LEFT OUTER JOIN Cp Post ON Post.PKID=CpRelacionado.IDCpRelacionado


----------------VALIDADOR 

SELECT  top 1    
dbo.Cp.PKID, dbo.Cp.IDSucursal,     TipoCp.Codigo, 
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
Left(rtrim(ltrim(Direccion.descripcion)) + '-' + Departamento.descripcion + '-' + Provincia.descripcion + '-' + Distrito.descripcion ,100)
end 
AS Cliente_Direccion, 
Departamento.descripcion AS NomDepartamento, Provincia.descripcion AS NomProvincia,  Distrito.descripcion AS NomDistrito, 
CASE WHEN CpCobrarPagar.Credito = 0 THEN 'Contado' ELSE ModalidadCredito.Descripcion END AS FormaPago,     
CASE WHEN CpCobrarPagar.Credito = 0 THEN Null ELSE CpCobrarPagar.FechaVencimiento END AS FechaVence,      
Vendedor.Codigo AS VendedorCodigo, Vendedor.Nombre AS VendedorNombre,     
Cp.SubTotal, Cp.ValorAfecto, Cp.ValorInafecto, Cp.ValorVenta, dbo.Cp.ValorAfecto * 0.18 AS total_impuesto,  Cp.Total, Cp.MontoPercepcion,   dbo.Cp.Total AS NetoPagar,               
dbo.fun_MontoEnLetras(dbo.Cp.Total) + ' ' + upper(ltrim(rtrim(Moneda.descripcion)))    AS MontoEnLetras,    
--tipCPRela.descripcion as Descripcion_DocRela,     
tipCPRela.Codigo as CodTipoDoc_DocRela,     
convert(varchar(4), Year(Post.fechaEmision)) + '-' + right('00'+convert(varchar(2), Month(Post.fechaEmision)),2) + '-' + right('00'+convert(varchar(2), Day(Post.fechaEmision)),2)    
 as fecha_DocRela, Post.Numcp as Descripcion_DocRela,    
isnull(MotivoAnulacion.Codigo,'') as CodeMotivoAnulacion, isnull(MotivoAnulacion.Descripcion,'') as DescripMotivoAnulacion,    
tipoCompSunat=tipCpbte.Codigo, Cp.Observacion
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
LEFT OUTER JOIN dbo.MotivoAnulacion ON dbo.MotivoAnulacion.PKID = dbo.Cp.IDMotivoAnulacion    
--CP RELACIONADO    
LEFT OUTER JOIN CpRelacionado_2 ON CpRelacionado_2.IDCp=Cp.PKID      
LEFT OUTER JOIN Cp Post ON Post.PKID=CpRelacionado_2.IDCpRelacionado      
LEFT OUTER JOIN TipoCp tipCPRela ON Post.IDTipoCp=tipCPRela.PKID      
LEFT OUTER JOIN tipoComprobantepago tipCpbte ON tipCpbte.pkid=tipCPRela.IDtipoComprobantepago      
WHERE Cp.PKID in(3019381) 


select PKID ,Fecha,NumCp from Cp where NumCp='BNC2-0001365' and PKID=3019381