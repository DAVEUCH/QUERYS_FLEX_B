create VIEW ness_cuentacorriente_proveedor_new
AS  
SELECT  dbo.Cp.PKID AS Identy,
dbo.TipoPersona.PKID AS DocumentoPagoPersonaTipoID,
dbo.TipoPersona.Nombre AS DocumentoPagoPersonaTipo,         
dbo.Cp.IDPersona AS DocumentoPagoPersonaID,
dbo.Persona.Codigo AS DocumentoPagoPersonaCodigo,
dbo.Persona.Nombre AS DocumentoPagoPersonaNombre,         
dbo.TipoDocIdentidad.Codigo AS DocumentoPagoPersonaTipoDocumentoIdentidadCodigo, 
dbo.Persona.DocIdentidad AS DocumentoPagoPersonaDocumentoIdentidad,        
dbo.DocCobrarPagar.IDCuentaContable AS DocumentoPagoCuentaID,
dbo.CuentaContable.Cuenta AS DocumentoPagoCuentaNumero,         
dbo.CuentaContable.Descripcion AS DocumentoPagoCuentaDescripcion,
dbo.DocCobrarPagar.PKID AS DocumentoPagoID ,
case when TipoCp.TipoCp='Letra' then dbo.hallar_fecha_letra(Cp.NumCp) else dbo.Cp.FechaEmision end AS DocumentoPagoFechaEmision, 
dbo.Cp.Fecha AS DocumentoPagoFecha,
dbo.Cp.IDTipoCp AS DocumentoPagoTipoID,         
dbo.TipoCp.Abreviacion AS DocumentoPagoTipoAbreviacion,
dbo.TipoCp.Descripcion AS DocumentoPagoTipoDescripcion,
dbo.Cp.NumCp AS DocumentoPagoNumero,         
dbo.Cp.NumCpContable AS DocumentoPagoNumeroContable, 
case dbo.Cp.IDMoneda when 2 then
(dbo.DocCobrarPagar.Total * dbo.CpCobrarPagar.MovSaldo) * dbo.Cp.TipoCambio
else
dbo.Cp.MonedaBase * dbo.DocCobrarPagar.Total * dbo.CpCobrarPagar.MovSaldo
end  AS DocumentoPagoMontoSoles,  
~ dbo.Cp.MonedaBase * dbo.DocCobrarPagar.Total * dbo.CpCobrarPagar.MovSaldo AS DocumentoPagoMontoDolares,  
dbo.Cp.TipoCambio AS DocumentoPagoTipoCambio, dbo.Cp.FechaTipoCambio AS DocumentoPagoFechaTipoCambio,         
case left(dbo.TipoCp.Abreviacion,2) when 'NC' then dbo.Cp.FechaEmision       
else dbo.CpCobrarPagar.FechaVencimiento end AS DocumentoPagoFechaVencimiento,       
      
dbo.CpCobrarPagar.FechaProgramacionPago AS DocumentoPagoFechaProgramcion,         
dbo.DocCobrarPagar.FechaUltimoPago AS DocumentoPagoFechaUltimoPago,       
--dbo.Cp.MonedaBase * dbo.DocCobrarPagar.Saldo AS DocumentoPagoSaldoSoles,         
case dbo.Cp.IDMoneda when 2 then
(dbo.DocCobrarPagar.Saldo ) * dbo.Cp.TipoCambio
else
dbo.Cp.MonedaBase * dbo.DocCobrarPagar.Saldo 
end
AS DocumentoPagoSaldoSoles, 
~ dbo.Cp.MonedaBase * dbo.DocCobrarPagar.Saldo AS DocumentoPagoSaldoDolares,
dbo.Cp.IDResponsable AS DocumentoPagoResponsableID, Responsable.Codigo AS DocumentoPagoResponsableCodigo,         
Responsable.Nombre AS DocumentoPagoResponsableNombre, dbo.DocCobrarPagar.Pagado AS DocumentoPagoPagado,         
dbo.CpCobrarPagar.TipoCpCobrarPagar AS DocumentoPagoPorCobrarOPagar, dbo.CpCobrarPagar.MovSaldo AS DocumentoPagoMovimiento,         
dbo.Cp.IDSucursal AS DocumentoPagoSucursalID, dbo.Sucursal.Nombre AS DocumentoPagoSucursalNombre, dbo.CpCobrarPagar.Credito,         
dbo.CpCobrarPagar.SujetoAPercepcion AS PercepcionValidar, dbo.CpCobrarPagar.PorcentajePercepcion AS PorcentajePercecion,        
Cp.MontoPercepcion,      
dbo.Cp.MonedaBase * dbo.CpCobrarPagar.MontoPercepcion AS DocumentoPercepcionMontoSoles,         
~ dbo.Cp.MonedaBase * dbo.CpCobrarPagar.MontoPercepcion AS DocumentoPercepcionMontoDolares,         
dbo.Cp.MonedaBase * dbo.CpCobrarPagar.SaldoPercepcion AS DocumentoPercepcionSaldoSoles,         
~ dbo.Cp.MonedaBase * dbo.CpCobrarPagar.SaldoPercepcion AS DocumentoPercepcionSaldoDolares,         
dbo.Direccion.Descripcion + ' - ' + dbo.Distrito.Descripcion + ' - ' + dbo.Provincia.Descripcion + ' - ' + dbo.Departamento.Descripcion AS DireccionProovedor,         
dbo.fun_ObtenerTelefono(dbo.Cp.IDPersona) AS TelefonoProveedor, dbo.Proveedor.BalanceSoles AS LineaUtilizadaSoles,         
dbo.Proveedor.BalanceDolares AS LineaUtilizadaDolares,
--esta condicional puede alterar muchas cosas
dbo.Proveedor.LineaCredito   AS LineaCredito,        
(      
SELECT     dbo.Letra.NumeroUnicoBanco        
FROM          dbo.Letra LEFT OUTER JOIN        
   dbo.Banco ON dbo.Letra.IDBanco = dbo.Banco.PKID LEFT OUTER JOIN        
   dbo.Estado ON dbo.Letra.IDEstado = dbo.Estado.PKID        
WHERE      (dbo.Letra.PKID = dbo.Cp.PKID)      
) AS NumeroUnico,        
(      
SELECT     Banco_2.Nombre        
FROM          dbo.Letra AS Letra_2 LEFT OUTER JOIN        
   dbo.Banco AS Banco_2 ON Letra_2.IDBanco = Banco_2.PKID LEFT OUTER JOIN        
   dbo.Estado AS Estado_2 ON Letra_2.IDEstado = Estado_2.PKID        
WHERE      (Letra_2.PKID = dbo.Cp.PKID)      
) AS BancoProveedor,        
(      
SELECT     Estado_1.Descripcion        
FROM          dbo.Letra AS Letra_1 LEFT OUTER JOIN        
dbo.Banco AS Banco_1 ON Letra_1.IDBanco = Banco_1.PKID LEFT OUTER JOIN        
dbo.Estado AS Estado_1 ON Letra_1.IDEstado = Estado_1.PKID        
WHERE      (Letra_1.PKID = dbo.Cp.PKID)      
) AS EstadoDocumento,       
      
case left(dbo.TipoCp.Abreviacion,2) when 'NC' then DATEDIFF(DAY, GETDATE(), dbo.Cp.FechaEmision)       
else DATEDIFF(DAY, GETDATE(), dbo.CpCobrarPagar.FechaVencimiento)  end       
AS DiasXVencer,         
dbo.FN_DocxLetra(dbo.Cp.PKID) AS NumCpAntecesor, dbo.Direccion.DireccionPrincipal, dbo.Distrito.PKID AS Distrito,       
dbo.Provincia.PKID AS Provincia, dbo.Departamento.PKID AS Departamento        
FROM               
dbo.Cp LEFT OUTER JOIN        
dbo.CpCobrarPagar ON dbo.Cp.PKID = dbo.CpCobrarPagar.PKID LEFT OUTER JOIN        
dbo.DocCobrarPagar ON dbo.Cp.PKID = dbo.DocCobrarPagar.IDCp LEFT OUTER JOIN        
dbo.CuentaContable ON dbo.DocCobrarPagar.IDCuentaContable = dbo.CuentaContable.PKID LEFT OUTER JOIN        
dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID LEFT OUTER JOIN        
dbo.Persona ON dbo.Cp.IDPersona = dbo.Persona.PKID LEFT OUTER JOIN        
dbo.Persona AS Responsable ON dbo.Cp.IDResponsable = Responsable.PKID LEFT OUTER JOIN        
dbo.Direccion ON dbo.Direccion.IDPersona = dbo.Persona.PKID and Direccion.DireccionPrincipal=1 LEFT OUTER JOIN        
dbo.Departamento ON dbo.Direccion.IDDepartamento = dbo.Departamento.PKID LEFT OUTER JOIN        
dbo.Provincia ON dbo.Direccion.IDProvincia = dbo.Provincia.PKID LEFT OUTER JOIN        
dbo.Distrito ON dbo.Direccion.IDDistrito = dbo.Distrito.PKID LEFT OUTER JOIN        
dbo.Proveedor ON dbo.Persona.PKID = dbo.Proveedor.PKID LEFT OUTER JOIN        
dbo.TipoDocIdentidad ON dbo.Persona.IDTipoDocIdentidad = dbo.TipoDocIdentidad.PKID LEFT OUTER JOIN        
dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID LEFT OUTER JOIN        
dbo.TipoPersona ON dbo.Cp.IDTipoPersona = dbo.TipoPersona.IDTipoAsociado 
WHERE  (dbo.Cp.Anulado = 0) AND (dbo.Cp.Tercero = 0) AND (dbo.Cp.Preliminar = 0) AND (dbo.DocCobrarPagar.Pagado <> 1)     
AND (dbo.Cp.IDTipoCp <> 4151)          
AND (dbo.CpCobrarPagar.TipoCpCobrarPagar = 'cobrar')        
OR        
(dbo.Cp.Anulado = 0) AND (dbo.Cp.Tercero = 0) AND (dbo.Cp.Preliminar = 0) AND (dbo.DocCobrarPagar.Pagado <> 1)     
AND (dbo.Cp.IDTipoCp <> 4151)        
AND (dbo.TipoCp.Abreviacion LIKE 'NC%')    
GO