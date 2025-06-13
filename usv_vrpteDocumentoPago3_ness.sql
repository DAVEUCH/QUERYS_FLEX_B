USE [GCI_prueba]
GO

/****** Object:  View [dbo].[usv_vrpteDocumentoPago3_ness]    Script Date: 16/09/2024 16:48:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[usv_vrpteDocumentoPago3_ness]
AS        
SELECT dbo.Cp.PKID, dbo.TipoPersona.PKID AS DocumentoPagoPersonaTipoID, dbo.TipoPersona.Nombre AS DocumentoPagoPersonaTipo,           
dbo.Cp.IDPersona AS DocumentoPagoPersonaID, dbo.Persona.Codigo AS DocumentoPagoPersonaCodigo,         
dbo.Persona.Nombre AS DocumentoPagoPersonaNombre,           
dbo.TipoDocIdentidad.Codigo AS DocumentoPagoPersonaTipoDocumentoIdentidadCodigo,         
dbo.Persona.DocIdentidad AS DocumentoPagoPersonaDocumentoIdentidad,          
dbo.CuentaContable.PKID AS DocumentoPagoCuentaID, dbo.CuentaContable.Cuenta AS DocumentoPagoCuentaNumero,           
dbo.CuentaContable.Descripcion AS DocumentoPagoCuentaDescripcion, dbo.DocCobrarPagar.PKID AS DocumentoPagoID,           
dbo.Cp.FechaEmision AS DocumentoPagoFechaEmision,           
dbo.Cp.Fecha AS DocumentoPagoFecha,          
dbo.TipoCp.TipoCp AS 'TipoCpNess',          
dbo.hallar_fecha_letra(Cp.NumCp) as FechaNess,          
dbo.TipoCp.PKID AS DocumentoPagoTipoID,           
dbo.TipoCp.Abreviacion AS DocumentoPagoTipoAbreviacion, dbo.TipoCp.Descripcion AS DocumentoPagoTipoDescripcion,         
dbo.Cp.NumCp AS DocumentoPagoNumero,           
dbo.Cp.NumCpContable AS DocumentoPagoNumeroContable,           
        
CASE dbo.Cp.MonedaBase WHEN 1 THEN         
dbo.DocCobrarPagar.Total ELSE 0 END * CASE dbo.CpCobrarPagar.TipoCpCobrarPagar WHEN 'Cobrar' THEN 1 ELSE - 1 END          
AS DocumentoPagoMontoSoles,           
        
CASE dbo.Cp.MonedaBase WHEN 1 THEN 0 ELSE dbo.DocCobrarPagar.Total END *         
CASE dbo.CpCobrarPagar.TipoCpCobrarPagar WHEN 'Cobrar'         
THEN 1 ELSE - 1 END          
AS DocumentoPagoMontoDolares,      
        
dbo.Cp.TipoCambio AS DocumentoPagoTipoCambio, dbo.Cp.FechaTipoCambio AS DocumentoPagoFechaTipoCambio,           
dbo.CpCobrarPagar.FechaVencimiento AS DocumentoPagoFechaVencimiento,         
dbo.CpCobrarPagar.FechaProgramacionPago AS DocumentoPagoFechaProgramacion,           
dbo.DocCobrarPagar.FechaUltimoPago AS DocumentoPagoFechaUltimoPago,           
        
/*dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento) AS DocumentoPagoSaldoSoles,           
~ dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento) AS DocumentoPagoSaldoDolares,  */      
dbo.Cp.MonedaBase * dbo.CargoAbono.CargoMonedaDocumento AS DocumentoCargoSoles,       
dbo.Cp.MonedaBase * dbo.CargoAbono.AbonoMonedaDocumento AS DocumentoAbonoSoles,       
~ dbo.Cp.MonedaBase * dbo.CargoAbono.CargoMonedaDocumento AS DocumentoCargoDolares,        
~ dbo.Cp.MonedaBase * dbo.CargoAbono.AbonoMonedaDocumento AS DocumentoAbonoDolares,        
      
--ISNULL(dbo.CpDistribucion.IDZonaVenta, 0) AS DocumentoPagoZonaID, ISNULL(dbo.Zona.Codigo, '') AS DocumentoPagoZonaCodigo, 
--ISNULL(dbo.Zona.Descripcion,'') AS DocumentoPagoZonaDescripcion, 
Responsable.PKID AS DocumentoPagoResponsableID, Responsable.Codigo AS DocumentoPagoResponsableCodigo,           
Responsable.Nombre AS DocumentoPagoResponsableNombre, 0 AS DocumentoPagoPagado,           
dbo.CpCobrarPagar.TipoCpCobrarPagar AS DocumentoPagoPorCobrarOPagar, dbo.CpCobrarPagar.MovSaldo AS DocumentoPagoMovimiento,           
dbo.Sucursal.PKID AS DocumentoPagoSucursalID, dbo.Sucursal.Nombre AS DocumentoPagoSucursalNombre, dbo.VoucherContable.Fecha AS VoucherContableFecha,           
CASE WHEN (~ dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento))           
<> 0 THEN (~ dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento))           
* Cp.TipoCambio ELSE (dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento))           
END AS DocumentoPagoSaldoTotalSoles          
FROM                 
--dbo.Zona         
--INNER JOIN  dbo.CpDistribucion ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaVenta         
--RIGHT OUTER JOIN  
dbo.Cp         
INNER JOIN  dbo.CptoOperacion ON dbo.Cp.IDCptoOperacion = dbo.CptoOperacion.PKID 
INNER JOIN  dbo.CpCobrarPagar ON dbo.CpCobrarPagar.PKID = dbo.Cp.PKID  
INNER JOIN  dbo.DocCobrarPagar ON dbo.DocCobrarPagar.IDCp = dbo.Cp.PKID 
INNER JOIN  dbo.Persona ON dbo.Persona.PKID = dbo.Cp.IDPersona         
INNER JOIN  dbo.Persona AS Responsable ON Responsable.PKID = dbo.Cp.IDResponsable 
INNER JOIN  dbo.CargoAbono ON dbo.CargoAbono.IDDocCobrarPagar = dbo.DocCobrarPagar.PKID 
INNER JOIN  dbo.Asiento ON dbo.Asiento.PKID  = dbo.CargoAbono.IDAsiento
INNER JOIN  dbo.VoucherContable ON dbo.VoucherContable.PKID  = dbo.Asiento.IDVoucher 
INNER JOIN  dbo.CuentaContable ON dbo.CuentaContable.PKID = dbo.DocCobrarPagar.IDCuentaContable 
INNER JOIN  dbo.TipoDocIdentidad ON dbo.Persona.IDTipoDocIdentidad = dbo.TipoDocIdentidad.PKID         
INNER JOIN  dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID         
INNER JOIN  dbo.TipoPersona ON dbo.TipoPersona.IDTipoAsociado = dbo.Cp.IDTipoPersona         
INNER JOIN  dbo.TipoCp ON dbo.TipoCp.PKID = dbo.Cp.IDTipoCp  --ON dbo.CpDistribucion.PKID = dbo.Cp.PKID           
WHERE (dbo.Cp.Anulado = 0)   
AND   (dbo.VoucherContable.Anulado=0)   
AND   (dbo.CargoAbono.EsRedondeo=0)   
AND   (Left(dbo.CuentaContable.cuenta,2) = '12' or Left(dbo.CuentaContable.cuenta,2)  = '13')
--AND   (dbo.DocCobrarPagar.IDCuentaContable<>400008683) --'1911101'  
AND    (dbo.CptoOperacion.codigo not in ('VEOBST', 'VEOBSC', '2010VE010', 'VE010'))
GO


