SELECT CASE when usv_vrpteDocumentoPago3_ness.TipoCpNess='Letra' THEN usv_vrpteDocumentoPago3_ness.FechaNess ELSE usv_vrpteDocumentoPago3_ness.DocumentoPagoFechaEmision END AS FECHAEMISION,
DocumentoPagoTipoAbreviacion AS TIPODOCUMENTO,  
DocumentoPagoNumero AS NUMERODOCUMENTO, 
DocumentoPagoFechaVencimiento  AS FECHAVENCIMIENTO,
DocumentoPagoPersonaCodigo AS RUC, 
DocumentoPagoPersonaNombre AS NOMBRECLIENTE,
DocumentoPagoMontoDolares AS IMPORTE_Dolares,
DocumentoPagoMontoSoles AS IMPORTE_Soles,
CASE WHEN usv_vrpteDocumentoPago3_ness.DocumentoPagoCuentaDescripcion='LETRAS PROTESTADAS ME' THEN 'PROTESTADA' ELSE ISNULL(Estado.Descripcion,'') END AS ESTADO,
(Sum(DocumentoCargoDolares) - Sum(DocumentoAbonoDolares)) AS SALDO_DOLARES,
(Sum(DocumentoCargoSoles) - Sum(DocumentoAbonoSoles)) AS SALDO_SOLES,
Distrito.descripcion AS DISTRITO,
Provincia.descripcion AS PROVINCIA,
Departamento.descripcion AS DEPARTAMENTO,
DATEDIFF(DAY, GETDATE(), DocumentoPagoFechaVencimiento) AS DIASxVENCER, 
Vende.Nombre AS Vendedor,
Vende1.Nombre AS Vendedor1
FROM  usv_vrpteDocumentoPago3_ness 
LEFT OUTER JOIN dbo.Letra ON dbo.Letra.PKID = usv_vrpteDocumentoPago3_ness.PKID 
LEFT OUTER JOIN dbo.Estado ON dbo.Letra.IDEstado = dbo.Estado.PKID
INNER JOIN dbo.Persona on dbo.Persona.PKID=DocumentoPagoPersonaID  
INNER JOIN dbo.Direccion ON dbo.Persona.IDDireccionPrincipal = dbo.Direccion.PKID 
INNER JOIN dbo.Distrito ON dbo.Direccion.IDDistrito = dbo.Distrito.PKID 
INNER JOIN dbo.Provincia ON Provincia.pkid=Distrito.IdProvincia
INNER JOIN dbo.Departamento ON Departamento.pkid=Provincia.IdDepartamento
LEFT JOIN dbo.GC_Cliente ON dbo.Persona.PKID = dbo.GC_Cliente.IDPersona 
LEFT JOIN dbo.Persona as Vende ON Vende.PKID = dbo.GC_Cliente.idVendedor 
LEFT JOIN dbo.Persona as Vende1 ON Vende1.PKID = usv_vrpteDocumentoPago3_ness.DocumentoPagoResponsableID
where DocumentoPagoNumero='FNC2-0001090'
GROUP BY DocumentoPagoFechaEmision,DocumentoPagoTipoAbreviacion,DocumentoPagoNumero,TipoCpNess,FechaNess,
DocumentoPagoFechaVencimiento,DocumentoPagoPersonaCodigo,DocumentoPagoPersonaNombre,Distrito.descripcion,
Provincia.descripcion,Departamento.descripcion, DocumentoPagoPersonaTipoID,DocumentoPagoTipoID, ESTADO.Descripcion,
DocumentoPagoCuentaDescripcion,DocumentoPagoMontoDolares, DocumentoPagoMontoSoles, Vende.Nombre , Vende1.Nombre
HAVING (DocumentoPagoPersonaTipoID = 3) 
AND 
(
(Sum(usv_vrpteDocumentoPago3_ness.DocumentoCargoDolares) - Sum(usv_vrpteDocumentoPago3_ness.DocumentoAbonoDolares)) <> 0
OR 
(Sum(usv_vrpteDocumentoPago3_ness.DocumentoCargoSoles) - Sum(usv_vrpteDocumentoPago3_ness.DocumentoAbonoSoles)) <> 0
)

select*from usv_vrpteDocumentoPago3_ness where DocumentoPagoNumero='FNC2-0001090'