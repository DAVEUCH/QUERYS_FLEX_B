SELECT     DocumentoPagoPersonaTipoID, DocumentoPagoPersonaTipo, DocumentoPagoPersonaID, DocumentoPagoPersonaCodigo,
DocumentoPagoPersonaNombre, 
                      DocumentoPagoPersonaTipoDocumentoIdentidadCodigo, DocumentoPagoPersonaDocumentoIdentidad,
					  DocumentoPagoCuentaID, DocumentoPagoCuentaNumero, 
                      DocumentoPagoCuentaDescripcion, DocumentoPagoID,
					  DocumentoPagoFechaEmision, DocumentoPagoFecha, DocumentoPagoTipoID,
                      DocumentoPagoTipoAbreviacion, DocumentoPagoTipoDescripcion, DocumentoPagoNumero,
					  DocumentoPagoNumeroContable, DocumentoPagoMontoSoles, 
                      DocumentoPagoMontoDolares, DocumentoPagoTipoCambio, DocumentoPagoFechaTipoCambio,
					  DocumentoPagoFechaVencimiento, 
                      DocumentoPagoFechaProgramacion, DocumentoPagoFechaUltimoPago, SUM(DocumentoPagoSaldoSoles) AS DocumentoPagoSaldoSoles, 
                      SUM(DocumentoPagoSaldoDolares) AS DocumentoPagoSaldoDolares, DocumentoPagoZonaID, DocumentoPagoZonaCodigo,
					  DocumentoPagoZonaDescripcion,
					  DocumentoPagoNumero,
                      DocumentoPagoResponsableID, DocumentoPagoResponsableCodigo, 
					  DocumentoPagoResponsableNombre, DocumentoPagoPagado, 
                      DocumentoPagoPorCobrarOPagar, DocumentoPagoMovimiento, 
					  DocumentoPagoSucursalID, DocumentoPagoSucursalNombre
FROM         dbo.vrpteDocumentoPago2
where DocumentoPagoPersonaTipo='Proveedor'
--and DocumentoPagoFechaEmision='31-10-2024'
and IDPlanCuentas=3
and DocumentoPagoCuentaNumero=4212102


GROUP BY DocumentoPagoPersonaTipoID, DocumentoPagoPersonaTipo, DocumentoPagoPersonaID, DocumentoPagoPersonaCodigo,
DocumentoPagoPersonaNombre, 
                      DocumentoPagoPersonaTipoDocumentoIdentidadCodigo, DocumentoPagoPersonaDocumentoIdentidad,
					  DocumentoPagoCuentaID, DocumentoPagoCuentaNumero, 
                      DocumentoPagoCuentaDescripcion, DocumentoPagoID, DocumentoPagoFechaEmision,
					  DocumentoPagoFecha, DocumentoPagoTipoID, 
                      DocumentoPagoTipoAbreviacion, DocumentoPagoTipoDescripcion, DocumentoPagoNumero,
					  DocumentoPagoNumeroContable, DocumentoPagoMontoSoles, 
                      DocumentoPagoMontoDolares, DocumentoPagoTipoCambio, DocumentoPagoFechaTipoCambio,
					  DocumentoPagoFechaVencimiento, 
                      DocumentoPagoFechaProgramacion, DocumentoPagoFechaUltimoPago, DocumentoPagoZonaID,
					  DocumentoPagoZonaCodigo, DocumentoPagoZonaDescripcion, 
                      DocumentoPagoResponsableID, DocumentoPagoResponsableCodigo, 
					  DocumentoPagoResponsableNombre, DocumentoPagoPagado,
					  DocumentoPagoNumero,
                      DocumentoPagoPorCobrarOPagar, DocumentoPagoMovimiento,
					  DocumentoPagoSucursalID, DocumentoPagoSucursalNombre
HAVING      (SUM(DocumentoPagoSaldoSoles) <> 0) OR
                      (SUM(DocumentoPagoSaldoDolares) <> 0)


select top 10*from dbo.vrpteDocumentoPago2

select*from cp where NumCp='88423'--299111  - 33234225
select*from cp where NumCp='1722'
select*from VoucherContable where PKID=801062
select*from VoucherContable where PKID=800989
select*from Asiento where IDVoucher=801062 --and PKID=2513355
select*from Asiento where IDVoucher=800989 --and PKID=2513264
select*from CargoAbono where IDAsiento=2513375
select*from CargoAbono where IDAsiento=2513263 ---54.45
select*from CpCobrarPagar where PKID=801059
select*from CpCobrarPagar where PKID=800989
select*from DocCobrarPagar where IDCp=801059
--select*from DocCobrarPagar where IDCp=800989

