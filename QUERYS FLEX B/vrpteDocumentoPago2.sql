--USE [FREDDY_prueba]
--GO

--/****** Object:  View [dbo].[vrpteDocumentoPago2]    Script Date: 26/11/2024 10:31:21 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--ALTER view [dbo].[vrpteDocumentoPago2]
--AS  
SELECT dbo.Cp.PKID, dbo.TipoPersona.PKID AS DocumentoPagoPersonaTipoID, dbo.TipoPersona.Nombre AS DocumentoPagoPersonaTipo,   
dbo.Cp.IDPersona AS DocumentoPagoPersonaID, dbo.Persona.Codigo AS DocumentoPagoPersonaCodigo, dbo.Persona.Nombre AS DocumentoPagoPersonaNombre,   
dbo.TipoDocIdentidad.Codigo AS DocumentoPagoPersonaTipoDocumentoIdentidadCodigo, dbo.Persona.DocIdentidad AS DocumentoPagoPersonaDocumentoIdentidad,  
dbo.CuentaContable.PKID AS DocumentoPagoCuentaID, dbo.CuentaContable.IDPlanCuentas, dbo.CuentaContable.Cuenta AS DocumentoPagoCuentaNumero,   
dbo.CuentaContable.Descripcion AS DocumentoPagoCuentaDescripcion, dbo.DocCobrarPagar.PKID AS DocumentoPagoID,   
dbo.Cp.FechaEmision AS DocumentoPagoFechaEmision, dbo.Cp.Fecha AS DocumentoPagoFecha, dbo.TipoCp.PKID AS DocumentoPagoTipoID,   
dbo.TipoCp.Abreviacion AS DocumentoPagoTipoAbreviacion, dbo.TipoCp.Descripcion AS DocumentoPagoTipoDescripcion, dbo.Cp.NumCp AS DocumentoPagoNumero,   
dbo.Cp.NumCpContable AS DocumentoPagoNumeroContable,   
CASE dbo.Cp.MonedaBase WHEN 1 THEN dbo.DocCobrarPagar.Total ELSE 0 END * CASE dbo.CpCobrarPagar.TipoCpCobrarPagar WHEN 'Cobrar' THEN 1 ELSE - 1 END  
AS DocumentoPagoMontoSoles,   
CASE dbo.Cp.MonedaBase WHEN 1 THEN 0 ELSE dbo.DocCobrarPagar.Total END * CASE dbo.CpCobrarPagar.TipoCpCobrarPagar WHEN 'Cobrar' THEN 1 ELSE - 1 END  
AS DocumentoPagoMontoDolares, dbo.Cp.TipoCambio AS DocumentoPagoTipoCambio, dbo.Cp.FechaTipoCambio AS DocumentoPagoFechaTipoCambio,   
dbo.CpCobrarPagar.FechaVencimiento AS DocumentoPagoFechaVencimiento, dbo.CpCobrarPagar.FechaProgramacionPago AS DocumentoPagoFechaProgramacion,   
dbo.DocCobrarPagar.FechaUltimoPago AS DocumentoPagoFechaUltimoPago,   
dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento) AS DocumentoPagoSaldoSoles,   
~ dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento) AS DocumentoPagoSaldoDolares,
CASE WHEN (~ dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento))   
<> 0 THEN (~ dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento))   
* Cp.TipoCambio ELSE (dbo.Cp.MonedaBase * (dbo.CargoAbono.CargoMonedaDocumento - dbo.CargoAbono.AbonoMonedaDocumento))   
END AS DocumentoPagoSaldoTotalSoles ,
ISNULL(dbo.CpDistribucion.IDZonaVenta, 0) AS DocumentoPagoZonaID, ISNULL(dbo.Zona.Codigo, '') AS DocumentoPagoZonaCodigo, 
ISNULL(dbo.Zona.Descripcion, '') AS DocumentoPagoZonaDescripcion, Responsable.PKID AS DocumentoPagoResponsableID, 
Responsable.Codigo AS DocumentoPagoResponsableCodigo, Responsable.Nombre AS DocumentoPagoResponsableNombre, 0 AS DocumentoPagoPagado,   
dbo.CpCobrarPagar.TipoCpCobrarPagar AS DocumentoPagoPorCobrarOPagar, dbo.CpCobrarPagar.MovSaldo AS DocumentoPagoMovimiento,   
dbo.Sucursal.PKID AS DocumentoPagoSucursalID, dbo.Sucursal.Nombre AS DocumentoPagoSucursalNombre, dbo.VoucherContable.Fecha AS VoucherContableFecha   

FROM 
dbo.Cp INNER JOIN  
dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID  INNER JOIN 
dbo.CpCobrarPagar ON dbo.Cp.PKID = dbo.CpCobrarPagar.PKID INNER JOIN  
dbo.DocCobrarPagar ON dbo.Cp.PKID = dbo.DocCobrarPagar.IDCp INNER JOIN  
dbo.Persona ON dbo.Cp.IDPersona = dbo.Persona.PKID INNER JOIN  
dbo.Persona AS Responsable ON dbo.Cp.IDResponsable = Responsable.PKID INNER JOIN  
dbo.CargoAbono ON dbo.DocCobrarPagar.PKID = dbo.CargoAbono.IDDocCobrarPagar INNER JOIN  
dbo.TipoDocIdentidad ON dbo.Persona.IDTipoDocIdentidad = dbo.TipoDocIdentidad.PKID INNER JOIN  
dbo.CuentaContable ON dbo.DocCobrarPagar.IDCuentaContable = dbo.CuentaContable.PKID INNER JOIN  
dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID INNER JOIN  
dbo.TipoPersona ON dbo.Cp.IDTipoPersona = dbo.TipoPersona.IDTipoAsociado INNER JOIN  
dbo.Asiento ON dbo.CargoAbono.IDAsiento = dbo.Asiento.PKID INNER JOIN  
dbo.VoucherContable ON dbo.Asiento.IDVoucher = dbo.VoucherContable.PKID LEFT OUTER JOIN  
dbo.CpDistribucion ON dbo.CpDistribucion.PKID = dbo.Cp.PKID LEFT OUTER JOIN 
dbo.Zona ON dbo.Zona.PKID = dbo.CpDistribucion.IDZonaVenta
WHERE (dbo.Cp.Anulado = 0) AND (VoucherContable.Anulado=0)  
And CuentaContable.CuentaCorriente=1

--and dbo.TipoPersona.PKID=3
--and dbo.CuentaContable.IDPlanCuentas=3
----and Cp.FechaEmision='20243111'
----and dbo.Persona.Nombre='BAYER 89'
--and dbo.CuentaContable.Cuenta='4212102'
and dbo.Cp.NumCp in ('88423','1722')
GO

select*from DocCobrarPagar where IDCp=801059
select*from DocCobrarPagar where IDCp=800989

--lo que actualice total--364.6500

update DocCobrarPagar set Total='404.030000' where IDCp=801059 and PKID=1649375

update CargoAbono set AbonoMonedaDocumento='364.6500' where PKID=8175759

--lo que actualice AbonoMonedaDocumento--6.43
update CargoAbono set AbonoMonedaDocumento='5.8000' where PKID=8175938

--lo que actualice AbonoMonedaDocumento--12.85
update CargoAbono set AbonoMonedaDocumento='11.6000' where PKID=8175988

--lo que actualice AbonoMonedaDocumento--5.8000
update CargoAbono set AbonoMonedaDocumento='5.8000' where PKID=8176232

--lo que actualice AbonoMonedaDocumento--5.8000
update CargoAbono set AbonoMonedaDocumento='5.8000' where PKID=8176232

--lo que actualice AbonoMonedaDocumento--5.8000
update CargoAbono set AbonoMonedaDocumento='5.8000' where PKID=8176152

--lo que actualice AbonoMonedaDocumento--25.43
update CargoAbono set AbonoMonedaDocumento='22.9500' where PKID=8175301

--lo que actualice AbonoMonedaDocumento--37.12
update CargoAbono set AbonoMonedaDocumento='33.5000' where PKID=8174801

--lo que actualice AbonoMonedaDocumento--566.41
update CargoAbono set AbonoMonedaDocumento='511.2000' where PKID=8175811
