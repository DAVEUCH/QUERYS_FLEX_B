SELECT 
CASE when usv_vrpteDocumentoPago3_ness.TipoCpNess='Letra'
THEN usv_vrpteDocumentoPago3_ness.FechaNess 
ELSE usv_vrpteDocumentoPago3_ness.DocumentoPagoFechaEmision END AS FECHAEMISION,
DocumentoPagoTipoAbreviacion AS TIPODOCUMENTO,  
DocumentoPagoNumero AS NUMERODOCUMENTO, 
DocumentoPagoFechaVencimiento  AS FECHAVENCIMIENTO,
DocumentoPagoPersonaCodigo AS RUC, 
DocumentoPagoPersonaNombre AS NOMBRECLIENTE,
DocumentoPagoMontoDolares AS IMPORTE_Dolares,
DocumentoPagoMontoSoles AS IMPORTE_Soles,
CASE WHEN usv_vrpteDocumentoPago3_ness.DocumentoPagoCuentaDescripcion='LETRAS PROTESTADAS ME'
THEN 'PROTESTADA'
ELSE ISNULL(Estado.Descripcion,'') END AS ESTADO,
(Sum(DocumentoCargoDolares) - Sum(DocumentoAbonoDolares)) AS SALDO_DOLARES,
(Sum(DocumentoCargoSoles) - Sum(DocumentoAbonoSoles)) AS SALDO_SOLES,
Distrito.descripcion AS DISTRITO,
Provincia.descripcion AS PROVINCIA,
Departamento.descripcion AS DEPARTAMENTO,
DATEDIFF(DAY, GETDATE(), DocumentoPagoFechaVencimiento) AS DIASxVENCER, 
Vende.Nombre AS Vendedor,
DocumentoPagoResponsableNombre as Vendedoralter
FROM  usv_vrpteDocumentoPago3_ness 
LEFT OUTER JOIN dbo.Letra ON dbo.Letra.PKID = usv_vrpteDocumentoPago3_ness.PKID 
LEFT OUTER JOIN dbo.Estado ON dbo.Letra.IDEstado = dbo.Estado.PKID
INNER JOIN dbo.Persona on dbo.Persona.PKID=DocumentoPagoPersonaID  
INNER JOIN dbo.Direccion ON dbo.Persona.IDDireccionPrincipal = dbo.Direccion.PKID 
INNER JOIN dbo.Distrito ON dbo.Direccion.IDDistrito = dbo.Distrito.PKID 
INNER JOIN dbo.Provincia ON Provincia.pkid=Distrito.IdProvincia
INNER JOIN dbo.Departamento ON Departamento.pkid=Provincia.IdDepartamento
LEFT JOIN dbo.GC_Cliente ON dbo.Persona.PKID = dbo.GC_Cliente.IDPersona 
--LEFT JOIN Cp CPV  on CPV.NumCp=DocumentoPagoNumero
LEFT JOIN dbo.Persona as Vende ON Vende.PKID = dbo.GC_Cliente.idVendedor
where DocumentoPagoFechaEmision BETWEEN '20140225' AND '20241231' 
GROUP BY DocumentoPagoFechaEmision,DocumentoPagoTipoAbreviacion,DocumentoPagoNumero,TipoCpNess,FechaNess,
DocumentoPagoFechaVencimiento,DocumentoPagoPersonaCodigo,DocumentoPagoPersonaNombre,Distrito.descripcion,
Provincia.descripcion,Departamento.descripcion, DocumentoPagoPersonaTipoID,DocumentoPagoTipoID, ESTADO.Descripcion,
DocumentoPagoCuentaDescripcion,DocumentoPagoMontoDolares, DocumentoPagoMontoSoles, Vende.Nombre,DocumentoPagoResponsableNombre 
HAVING (DocumentoPagoPersonaTipoID = 3) 
AND 
(
(Sum(usv_vrpteDocumentoPago3_ness.DocumentoCargoDolares) - Sum(usv_vrpteDocumentoPago3_ness.DocumentoAbonoDolares)) <> 0
OR 
(Sum(usv_vrpteDocumentoPago3_ness.DocumentoCargoSoles) - Sum(usv_vrpteDocumentoPago3_ness.DocumentoAbonoSoles)) <> 0
)


select top 10 *from usv_vrpteDocumentoPago3_ness where DocumentoPagoPersonaNombre is null

select top 10  *from dbo.GC_Cliente  2467
select top 10 *from usv_CpRelacionado_fac
select top 5*from usv_vrpteDocumentoPago3_ness
select top 10 *from usv_ProductosenPedidos_Pendientes_Facturar
select top 10 *from usv_ProductosenPedidosConGuia_Pendientes_Facturar
select top 10 *from vrpt_FacturaLetra---
select top 10 *from Cp where NumCp='F001-0023635'  
select top 10 *from Cp where NumCp='814-0047560'2467
select top 10 *from Cp where PKID=876
select top 10 *from CpRelacionado where IDCp=775932 -- pedido
select top 10 *from Cp where NumCp='814-0047560'
select top 10 *from Cp where NumCp='T001-00004032'
select top 10 *from Cp where NumCp='F001-0023635' 
select top 10 *from Cp where PKID=780298
--select top 10 *from cp where NumCp='001-0131433'
select top 10 *from CpRelacionado where IDCpRelacionado=775932 -- 878 OP--> GUIA 
select top 10 *from CpRelacionado where IDCpRelacionado=780298--883 GUIA--> FAC
select top 10 * from CpRelacionado where IDCpRelacionado=45
select top 10 *from dbo.CGI_ConsultaComisionesDocumento2('20240801', '20240831')
---Pedido y factura 
alter view Pedido_factura
as
select
cpv.PKID as factura,
cpop.PKID as pedido

from CpRelacionado cpr
inner join Cp cpop on cpr.IDCpRelacionado= cpop.PKID
inner join Cp cpv on cpr.IDCpRelacionado = cpv.PKID
--inner join Cp cpv on cpr.IDCp=cpv.PKID
--inner join Cp cpop on cpr.IDCpRelacionado=cpop.PKID
go
 select*from Pedido_factura  where Pedido =793452

select top 10 *from Cp where NumCp='POBS-0001208' --793452
select top 10 *from Cp where NumCp='T002-0000887' --793454
select top 10 *from Cp where NumCp='F002-0000896' --793457

select top 10 *from CpRelacionado where IDCpRelacionado=793452
select top 10 *from CpRelacionado where IDCpRelacionado=780298
