create FUNCTION [dbo].[usf_CuentaCorrienteProveedor_2]
(  
@personaID Int
--@fechaDesde dateTime, 
--@fechaHasta dateTime  
)    
RETURNS @CuentaCorrientePersona TABLE    
(    
DocumentoPagoFechaVencimiento DateTime,    
DocumentoPagoPersonaID Int,    
DocumentoPagoPersonaCodigo Varchar(50),    
DocumentoPagoPersonaNombre Varchar(200),    
DocumentoPagoCuentaNumero Varchar(20),    
DocumentoPagoFechaEmision DateTime,    
DocumentoPagoFecha DateTime,    
DocumentoPagoTipoAbreviacion Varchar(20),    
DocumentoPagoNumero Varchar(20),    
DocumentoPagoNumeroContable Varchar(40),    
DocumentoPagoSolesCargo Decimal(18,6),    
DocumentoPagoSolesAbono Decimal(18,6),    
DocumentoPagoDolaresCargo Decimal(18,6),    
DocumentoPagoDolaresAbono Decimal(18,6),    
AmortizacionFecha DateTime,    
AmortizacionTipoAbreviacion Varchar(20),    
AmortizacionNumero Varchar(20),    
AmortizacionNumeroContable Varchar(40),    
AmortizacionSolesCargo Decimal(18,6),    
AmortizacionSolesAbono Decimal(18,6),    
AmortizacionDolaresCargo Decimal(18,6),    
AmortizacionDolaresAbono Decimal(18, 6),    
Orden Int,    
AmortizacionNumeroDocumentoMedioPago varchar(20),    
AmortizacionTipoDocumentoMedioPagoCodigo varchar(20),    
AmortizacionTipoDocumentoMedioPagoDescripcion varchar(60))    
AS    
BEGIN    

if @personaID=0
Begin
INSERT INTO @CuentaCorrientePersona    
	  SELECT  dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
       0)) ELSE 0 END)) AS DocumentoPagoSolesCargo,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
       0)) ELSE 0 END)) AS DocumentoPagoSolesAbono,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
       0)) ELSE 0 END)) AS DocumentoPagoDolaresCargo,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
       0)) ELSE 0 END)) AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
      '' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
      0 AS AmortizacionDolaresAbono, 1 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
   '' as AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM         dbo.vrpteDocumentoPago LEFT OUTER JOIN    
      dbo.vrpteDocumentoPagoAmortizacion ON     
      (dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID) --AND     
      --(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha < @fechaDesde )     
GROUP BY dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable, dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
      ELSE 0 END,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
      ELSE 0 END,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
      ELSE 0 END,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
      ELSE 0 END    
--HAVING   (dbo.vrpteDocumentoPago.DocumentoPagoFecha < @fechaDesde)   
UNION ALL    
SELECT     dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,DocumentoPagoPersonaID, DocumentoPagoPersonaCodigo, DocumentoPagoPersonaNombre, DocumentoPagoCuentaNumero,     
     DocumentoPagoFechaEmision, DocumentoPagoFecha, DocumentoPagoTipoAbreviacion, DocumentoPagoNumero, DocumentoPagoNumeroContable,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END AS DocumentoPagoSolesCargo,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END AS DocumentoPagoSolesAbono,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END AS DocumentoPagoDolaresCargo,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
     '' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
     0 AS AmortizacionDolaresAbono, 2 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
                      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
                      '' as AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM         dbo.vrpteDocumentoPago    
--WHERE     (DocumentoPagoFecha BETWEEN @fechaDesde AND @fechaHasta)    
UNION ALL    
SELECT     TOP (100) PERCENT dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
          dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
          dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
          dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
          dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable, 0 AS DocumentoPagoSolesCargo, 0 AS DocumentoPagoSolesAbono, 0 AS DocumentoPagoDolaresCargo,     
          0 AS DocumentoPagoDolaresAbono, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoAbreviacion,     
          dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumero, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroContable,     
          CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles)     
          ELSE 0 END AS AmortizacionSolesCargo,     
          CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles)     
          ELSE 0 END AS AmortizacionSolesAbono,     
          CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares)     
          ELSE 0 END AS AmortizacionDolaresCargo,     
          CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares)     
          ELSE 0 END AS AmortizacionDolaresAbono, 3 AS Orden, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroDocumentoMedioPago,     
          dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoCodigo,     
          dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM         dbo.vrpteDocumentoPago INNER JOIN    
                      dbo.vrpteDocumentoPagoAmortizacion ON     
                      dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID    
--WHERE     (dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha BETWEEN @fechaDesde AND   @fechaHasta)   
    
UNION ALL    
    
SELECT     dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
                      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
                      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, 'P-'+dbo.vrpteDocumentoPago.DocumentoPagoNumero AS DocumentoPagoNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
                       0)) ELSE 0 END)) AS DocumentoPagoSolesCargo,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
                       0)) ELSE 0 END)) AS DocumentoPagoSolesAbono,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
                       0)) ELSE 0 END)) AS DocumentoPagoDolaresCargo,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
                       0)) ELSE 0 END)) AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
                      '' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
                      0 AS AmortizacionDolaresAbono, 1 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
                      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
                      '' as AmortizacionTipoDocumentoMedioPagoDescripcion                 
                         
FROM         dbo.vrpteDocumentoPago LEFT OUTER JOIN    
                      dbo.vrpteDocumentoPagoAmortizacion ON     
                      dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID 
					  --AND   dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha < @fechaDesde    
  
GROUP BY dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
                      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
                      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable, dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END,    
                      dbo.vrpteDocumentoPago.PercepcionValidar    
HAVING 
--(dbo.vrpteDocumentoPago.DocumentoPagoFecha < @fechaDesde)   
--AND
dbo.vrpteDocumentoPago.PercepcionValidar=1    
    
UNION ALL    
SELECT dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,DocumentoPagoPersonaID, DocumentoPagoPersonaCodigo, DocumentoPagoPersonaNombre, DocumentoPagoCuentaNumero,     
       DocumentoPagoFechaEmision, DocumentoPagoFecha, DocumentoPagoTipoAbreviacion, 'P-'+DocumentoPagoNumero AS DocumentoPagoNumero, DocumentoPagoNumeroContable,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionMontoSoles)     
      ELSE 0 END AS DocumentoPagoSolesCargo,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionSaldoSoles)     
      ELSE 0 END AS DocumentoPagoSolesAbono,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionMontoDolares)     
      ELSE 0 END AS DocumentoPagoDolaresCargo,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionSaldoDolares)     
      ELSE 0 END AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
'' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
0 AS AmortizacionDolaresAbono, 2 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
      '' as AmortizacionTipoDocumentoMedioPagoDescripcion                              
FROM         dbo.vrpteDocumentoPago    
WHERE 
--(DocumentoPagoFecha BETWEEN @fechaDesde AND @fechaHasta )   
--AND 
dbo.vrpteDocumentoPago.PercepcionValidar=1    
    
UNION ALL    
SELECT   TOP (100) PERCENT dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento, dbo.vrpteDocumentoPago.DocumentoPagoPersonaID,     
         dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo, dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre,     
         dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero, dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision,     
         dbo.vrpteDocumentoPago.DocumentoPagoFecha, dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion,     
         'P-' + dbo.vrpteDocumentoPago.DocumentoPagoNumero AS DocumentoPagoNumero, dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable,     
         0 AS DocumentoPagoSolesCargo, 0 AS DocumentoPagoSolesAbono, 0 AS DocumentoPagoDolaresCargo, 0 AS DocumentoPagoDolaresAbono,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoAbreviacion,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumero, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroContable,     
         CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(AmortizacionPercepcionSoles) ELSE 0 END AS AmortizacionSolesCargo,     
         CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(AmortizacionPercepcionSoles) ELSE 0 END AS AmortizacionSolesAbono,    
          CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(AmortizacionPercepcionDolares)     
         ELSE 0 END AS AmortizacionDolaresCargo,     
         CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(AmortizacionPercepcionDolares)     
         ELSE 0 END AS AmortizacionDolaresAbono, 3 AS Orden, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroDocumentoMedioPago,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoCodigo,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM     dbo.vrpteDocumentoPago INNER JOIN    
         dbo.vrpteDocumentoPagoAmortizacion ON     
         dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID    
WHERE  
--(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha BETWEEN @fechaDesde AND  @fechaHasta)  
--AND 
(dbo.vrpteDocumentoPago.PercepcionValidar = 1)    

End

Else --De un solo proveedor
--******************************************************************************
--******************************************************************************
--******************************************************************************
Begin

INSERT INTO @CuentaCorrientePersona    
	  SELECT  dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
       0)) ELSE 0 END)) AS DocumentoPagoSolesCargo,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
       0)) ELSE 0 END)) AS DocumentoPagoSolesAbono,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
       0)) ELSE 0 END)) AS DocumentoPagoDolaresCargo,     
      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
       0)) ELSE 0 END)) AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
      '' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
      0 AS AmortizacionDolaresAbono, 1 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
   '' as AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM         dbo.vrpteDocumentoPago LEFT OUTER JOIN    
      dbo.vrpteDocumentoPagoAmortizacion ON     
      (dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID) --AND     
      --(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha < @fechaDesde )     
GROUP BY dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable, dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
      ELSE 0 END,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
      ELSE 0 END,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
      ELSE 0 END,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
      ELSE 0 END    
HAVING        
(dbo.vrpteDocumentoPago.DocumentoPagoPersonaID = @personaID)   
--AND (dbo.vrpteDocumentoPago.DocumentoPagoFecha < @fechaDesde)   
UNION ALL    
SELECT     dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,DocumentoPagoPersonaID, DocumentoPagoPersonaCodigo, DocumentoPagoPersonaNombre, DocumentoPagoCuentaNumero,     
     DocumentoPagoFechaEmision, DocumentoPagoFecha, DocumentoPagoTipoAbreviacion, DocumentoPagoNumero, DocumentoPagoNumeroContable,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END AS DocumentoPagoSolesCargo,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END AS DocumentoPagoSolesAbono,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END AS DocumentoPagoDolaresCargo,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
     '' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
     0 AS AmortizacionDolaresAbono, 2 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
                      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
                      '' as AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM         dbo.vrpteDocumentoPago    
WHERE     (DocumentoPagoPersonaID = @personaID)   
--AND (DocumentoPagoFecha BETWEEN @fechaDesde AND @fechaHasta)    
UNION ALL    
SELECT     TOP (100) PERCENT dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
                      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
                      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable, 0 AS DocumentoPagoSolesCargo, 0 AS DocumentoPagoSolesAbono, 0 AS DocumentoPagoDolaresCargo,     
                      0 AS DocumentoPagoDolaresAbono, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoAbreviacion,     
                      dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumero, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroContable,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles)     
                      ELSE 0 END AS AmortizacionSolesCargo,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles)     
                      ELSE 0 END AS AmortizacionSolesAbono,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares)     
                      ELSE 0 END AS AmortizacionDolaresCargo,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares)     
                      ELSE 0 END AS AmortizacionDolaresAbono, 3 AS Orden, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroDocumentoMedioPago,     
                      dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoCodigo,     
                      dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM         dbo.vrpteDocumentoPago INNER JOIN    
                      dbo.vrpteDocumentoPagoAmortizacion ON     
                      dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID    
WHERE     (dbo.vrpteDocumentoPago.DocumentoPagoPersonaID = @personaID)   
--AND (dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha BETWEEN @fechaDesde AND   @fechaHasta)   
    
UNION ALL    
    
SELECT     dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
                      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
                      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, 'P-'+dbo.vrpteDocumentoPago.DocumentoPagoNumero AS DocumentoPagoNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
                       0)) ELSE 0 END)) AS DocumentoPagoSolesCargo,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionSoles,    
                       0)) ELSE 0 END)) AS DocumentoPagoSolesAbono,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
                       0)) ELSE 0 END)) AS DocumentoPagoDolaresCargo,     
                      ABS(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)    
                       ELSE 0 END - SUM(CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(isnull(dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDolares,    
                       0)) ELSE 0 END)) AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
                      '' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
                      0 AS AmortizacionDolaresAbono, 1 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
                      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
                      '' as AmortizacionTipoDocumentoMedioPagoDescripcion                 
                         
FROM         dbo.vrpteDocumentoPago LEFT OUTER JOIN    
                      dbo.vrpteDocumentoPagoAmortizacion ON     
                      dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID --AND     
                      --dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha < @fechaDesde    
  
GROUP BY dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,dbo.vrpteDocumentoPago.DocumentoPagoPersonaID, dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo,     
                      dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre, dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision, dbo.vrpteDocumentoPago.DocumentoPagoFecha,     
                      dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion, dbo.vrpteDocumentoPago.DocumentoPagoNumero,     
                      dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable, dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoSoles)     
                      ELSE 0 END,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END,     
                      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPagoMontoDolares)     
                      ELSE 0 END,    
                      dbo.vrpteDocumentoPago.PercepcionValidar    
HAVING   
(dbo.vrpteDocumentoPago.DocumentoPagoPersonaID = @personaID)   
--AND (dbo.vrpteDocumentoPago.DocumentoPagoFecha < @fechaDesde)   
AND dbo.vrpteDocumentoPago.PercepcionValidar=1    
    
UNION ALL    
SELECT dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento,DocumentoPagoPersonaID, DocumentoPagoPersonaCodigo, DocumentoPagoPersonaNombre, DocumentoPagoCuentaNumero,     
       DocumentoPagoFechaEmision, DocumentoPagoFecha, DocumentoPagoTipoAbreviacion, 'P-'+DocumentoPagoNumero AS DocumentoPagoNumero, DocumentoPagoNumeroContable,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionMontoSoles)     
      ELSE 0 END AS DocumentoPagoSolesCargo,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionSaldoSoles)     
      ELSE 0 END AS DocumentoPagoSolesAbono,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionMontoDolares)     
      ELSE 0 END AS DocumentoPagoDolaresCargo,     
      CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN ABS(dbo.vrpteDocumentoPago.DocumentoPercepcionSaldoDolares)     
      ELSE 0 END AS DocumentoPagoDolaresAbono, 0 AS AmortizacionFecha, '' AS AmortizacionTipoAbreviacion, '' AS AmortizacionNumero,     
'' AS AmortizacionNumeroContable, 0 AS AmortizacionSolesCargo, 0 AS AmortizacionSolesAbono, 0 AS AmortizacionDolaresCargo,     
0 AS AmortizacionDolaresAbono, 2 AS Orden, '' as AmortizacionNumeroDocumentoMedioPago,     
      '' as AmortizacionTipoDocumentoMedioPagoCodigo,     
      '' as AmortizacionTipoDocumentoMedioPagoDescripcion                              
FROM         dbo.vrpteDocumentoPago    
WHERE       
(DocumentoPagoPersonaID = @personaID)   
--AND (DocumentoPagoFecha BETWEEN @fechaDesde AND @fechaHasta )   
AND dbo.vrpteDocumentoPago.PercepcionValidar=1    
    
UNION ALL    
SELECT   TOP (100) PERCENT dbo.vrpteDocumentoPago.DocumentoPagoFechaVencimiento, dbo.vrpteDocumentoPago.DocumentoPagoPersonaID,     
         dbo.vrpteDocumentoPago.DocumentoPagoPersonaCodigo, dbo.vrpteDocumentoPago.DocumentoPagoPersonaNombre,     
         dbo.vrpteDocumentoPago.DocumentoPagoCuentaNumero, dbo.vrpteDocumentoPago.DocumentoPagoFechaEmision,     
         dbo.vrpteDocumentoPago.DocumentoPagoFecha, dbo.vrpteDocumentoPago.DocumentoPagoTipoAbreviacion,     
         'P-' + dbo.vrpteDocumentoPago.DocumentoPagoNumero AS DocumentoPagoNumero, dbo.vrpteDocumentoPago.DocumentoPagoNumeroContable,     
         0 AS DocumentoPagoSolesCargo, 0 AS DocumentoPagoSolesAbono, 0 AS DocumentoPagoDolaresCargo, 0 AS DocumentoPagoDolaresAbono,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoAbreviacion,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumero, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroContable,     
         CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(AmortizacionPercepcionSoles) ELSE 0 END AS AmortizacionSolesCargo,     
         CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(AmortizacionPercepcionSoles) ELSE 0 END AS AmortizacionSolesAbono,    
          CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Pagar' THEN abs(AmortizacionPercepcionDolares)     
         ELSE 0 END AS AmortizacionDolaresCargo,     
         CASE dbo.vrpteDocumentoPago.DocumentoPagoPorCobrarOPagar WHEN 'Cobrar' THEN abs(AmortizacionPercepcionDolares)     
         ELSE 0 END AS AmortizacionDolaresAbono, 3 AS Orden, dbo.vrpteDocumentoPagoAmortizacion.AmortizacionNumeroDocumentoMedioPago,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoCodigo,     
         dbo.vrpteDocumentoPagoAmortizacion.AmortizacionTipoDocumentoMedioPagoDescripcion    
FROM     dbo.vrpteDocumentoPago INNER JOIN    
         dbo.vrpteDocumentoPagoAmortizacion ON     
         dbo.vrpteDocumentoPago.DocumentoPagoID = dbo.vrpteDocumentoPagoAmortizacion.AmortizacionDocumentoPagoID    
WHERE  (dbo.vrpteDocumentoPago.DocumentoPagoPersonaID = @personaID)   
--AND (dbo.vrpteDocumentoPagoAmortizacion.AmortizacionFecha BETWEEN @fechaDesde AND  @fechaHasta)  
AND (dbo.vrpteDocumentoPago.PercepcionValidar = 1)    
END
RETURN    
END    

