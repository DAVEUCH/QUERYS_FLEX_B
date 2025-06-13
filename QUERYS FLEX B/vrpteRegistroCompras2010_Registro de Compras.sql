--USE [FREDDY]
--GO

--/****** Object:  View [dbo].[vrpteRegistroCompras2010]    Script Date: 13/12/2024 11:23:24 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

ALTER view [dbo].[vrpteRegistroCompras2010]  
AS    
SELECT 
CASE WHEN ProveedorGiro = 0 THEN 'Gastos' WHEN ProveedorGiro = 1 THEN 'Mercaderias' END AS TipoProveedor, Cp_1.NumCpContable AS NumeroContable,     
      Cp_1.FechaEmision, Cp_1.Fecha AS FechaIngreso, dbo.fun_FechaPagoReciboSevicioPublico(ISNULL(dbo.TipoComprobantePago.Codigo, ''), Cp_1.PKID,     
      dbo.CpCobrarPagar.FechaVencimiento) AS FechaVencimiento, TipoCp_1.Abreviacion + TipoCp_1.Serie AS TipoComprobanteAbreviacion,     
      TipoCp_1.Descripcion AS TipoComprobanteDescripcion, dbo.TipoComprobantePago.Codigo AS TipoComprobantePagoCodigo,     
      dbo.TipoComprobantePago.Descripcion AS TipoComprobantePagoDescripcion, CASE WHEN CHARINDEX('-', Cp_1.NumCp) > 0 THEN substring(Cp_1.NumCp, 1,     
      charindex('-', Cp_1.NumCp) - 1) ELSE '' END AS NumeroSerie, CASE WHEN CHARINDEX('-', Cp_1.NumCp) > 0 THEN substring(Cp_1.numcp, charindex('-', Cp_1.NumCp)     
      + 1, 20) ELSE Cp_1.NumCp END AS Numero, dbo.TipoDocIdentidad.Codigo AS TipoDocumentoIdentidadCodigo, Persona_1.Codigo AS ClienteCodigo,     
      Persona_1.DocIdentidad AS ClienteDocumentoIdentidad, Persona_1.Nombre AS ClienteNombre, 0 - ~ Cp_1.Anulado as STSSS ,  Cp_1.MonedaBase as mbase, Cp_1.TipoCambio as ctcm, 
	  0 - ~ Cp_1.Anulado * Cp_1.SubTotal * case when Cp_1.idCptoOperacion in (1957,1958) then -1 else dbo.CpCobrarPagar.MovSaldo End * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END AS SubTotal,     
	  0 - ~ Cp_1.Anulado * Cp_1.ValorDescuento * case when Cp_1.idCptoOperacion in (1957,1958) then -1 else dbo.CpCobrarPagar.MovSaldo End * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END AS ValorDescuento,    
      0 AS ValorExportacion,     
	  0 - ~ Cp_1.Anulado * Cp_1.ValorAfecto * case when Cp_1.idCptoOperacion in (1957,1958) then -1 else dbo.CpCobrarPagar.MovSaldo End * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END AS ValorAfecto,     
      0 AS ValorExonerado,    
	  0 - ~ Cp_1.Anulado * Cp_1.ValorInafecto * case when Cp_1.idCptoOperacion in (1957,1958) then -1 else dbo.CpCobrarPagar.MovSaldo end * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END AS ValorInafecto,   Cp_1.ValorInafecto as VIII,   
      0 AS ValorISC, 
	  0 - CASE 
	WHEN dbo.Impuesto.PKID IN(1, 100000018 ) THEN ~ Cp_1.Anulado * 
	(Cp_1.Total - ISNULL((dbo.DUA.TotalArancel + TotalServicioDespacho + dbo.DUA.TotalPercepcion), Cp_1.ValorVenta))     
	* case when Cp_1.idCptoOperacion in (1957,1958) then -1 else dbo.CpCobrarPagar.MovSaldo End * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END ELSE 0 END AS ValorIGV,    
      			
--LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase((Cp_1.Total - ISNULL((dbo.DUA.TotalArancel+ dbo.DUA.TotalServicioDespacho+ dbo.DUA.TotalPercepcion), Cp_1.ValorVenta)), 
--Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio), 0, 14) AS ImpuestoBaseGravada14, 
       
0 - CASE 
	WHEN dbo.Impuesto.PKID IN(1, 100000018 ) THEN ~ Cp_1.Anulado * ISNULL(dbo.DUA.TotalArancel, 0)     
	* CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END ELSE ~ Cp_1.Anulado * (Cp_1.Total - Cp_1.ValorVenta)     
	* dbo.CpCobrarPagar.MovSaldo * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END END AS ValorOtrosCargos,  
	   
0 - ~ Cp_1.Anulado * (Cp_1.Total + ISNULL(dbo.DUA.TotalAduana, 0) -ISNULL(dbo.DUA.TotalPercepcion,0))     
* case when Cp_1.idCptoOperacion in (1957,1958) then -1 else dbo.CpCobrarPagar.MovSaldo end * CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END AS Total,     

      CASE Cp_1.MonedaBase WHEN 1 THEN 0 ELSE Cp_1.TipoCambio END AS TipoDeCambio, ISNULL(dbo.Cp.FechaEmision, 0) AS ReferenciaFechaEmision,     
      ISNULL(TipoComprobantePago_1.Codigo, '') AS ReferenciaTipoComprobantePagoCodigo, ISNULL(CASE WHEN CHARINDEX('-', dbo.Cp.NumCp)     
      > 0 THEN substring(dbo.Cp.NumCp, 1, charindex('-', dbo.Cp.NumCp) - 1) ELSE '' END, '') AS ReferenciaNumeroSerie, ISNULL(CASE WHEN CHARINDEX('-',     
      dbo.Cp.NumCp) > 0 THEN substring(dbo.Cp.NumCp, charindex('-', dbo.Cp.NumCp) + 1, 20) ELSE dbo.Cp.NumCp END, '') AS ReferenciaNumero,     
      ISNULL(dbo.ModalidadCredito.Codigo, '') AS ModalidadCreditoCodigo, ISNULL(dbo.ModalidadCredito.Descripcion, '') AS ModalidadCreditoDescripcion,   
convert(datetime, dbo.CpCobrarPagar.FechaDetraccion,103) AS ComprobanteDetraccionFechaEmision,     
ISNULL(dbo.CpCobrarPagar.NumeroDetraccion, '') AS ComprobanteDetraccionNumero, 
      --ISNULL(dbo.vrpteRegistroComprasComprobanteDetraccion.FechaEmision, 0) AS ComprobanteDetraccionFechaEmision,     
      --ISNULL(dbo.vrpteRegistroComprasComprobanteDetraccion.NumCp, '') AS ComprobanteDetraccionNumero, 
	  dbo.Persona.Codigo AS VendedorCodigo, '' AS ZonaCodigo,     
      ISNULL(dbo.Almacen.Codigo, '') AS AlmacenCodigo, Cp_1.IDSucursal AS SucursalID, TipoCp_1.TipoCp,     
      dbo.fun_FechaPagoFechaVencimiento(ISNULL(dbo.TipoComprobantePago.PKID, 0), Cp_1.PKID, dbo.CpCobrarPagar.FechaVencimiento) AS FechaPagoVencimiento,     
      Cp_1.IDPeriodo, ISNULL(dbo.DUA.TotalServicioDespacho, 0) * (CASE cp_1.MonedaBase WHEN 1 THEN 1 ELSE cp_1.TipoCambio END)     
      AS TotalServicioDespacho    ,  right(Periodo.descripcion,4)+left(Periodo.descripcion,2) as Periodocod
FROM         dbo.CpInventario INNER JOIN    
      dbo.Almacen ON dbo.CpInventario.IDAlmacen = dbo.Almacen.PKID RIGHT OUTER JOIN    
      dbo.Persona INNER JOIN    
      dbo.Proveedor INNER JOIN    
      dbo.TipoDocIdentidad INNER JOIN    
      dbo.Persona AS Persona_1 ON dbo.TipoDocIdentidad.PKID = Persona_1.IDTipoDocIdentidad ON dbo.Proveedor.PKID = Persona_1.PKID INNER JOIN    
      dbo.Cp AS Cp_1 INNER JOIN    
      dbo.TipoCp AS TipoCp_1 ON Cp_1.IDTipoCp = TipoCp_1.PKID INNER JOIN    
      dbo.CpCobrarPagar ON Cp_1.PKID = dbo.CpCobrarPagar.PKID INNER JOIN    
      dbo.Periodo ON Cp_1.IDPeriodo = dbo.Periodo.PKID INNER JOIN    
      dbo.Impuesto ON Cp_1.IDImpuesto = dbo.Impuesto.PKID ON Persona_1.PKID = Cp_1.IDPersona ON dbo.Persona.PKID = Cp_1.IDResponsable LEFT OUTER JOIN    
      dbo.Cp INNER JOIN    
      dbo.TipoCp ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID INNER JOIN    
      dbo.TipoComprobantePago AS TipoComprobantePago_1 ON dbo.TipoCp.IDTipoComprobantePago = TipoComprobantePago_1.PKID INNER JOIN    
      dbo.vrpteRegistroComprasComprobanteReferencia ON dbo.Cp.PKID = dbo.vrpteRegistroComprasComprobanteReferencia.IDCpRelacionado ON     
      Cp_1.PKID = dbo.vrpteRegistroComprasComprobanteReferencia.IDCp LEFT OUTER JOIN    
      --dbo.vrpteRegistroComprasComprobanteDetraccion ON Cp_1.PKID = dbo.vrpteRegistroComprasComprobanteDetraccion.IDCp LEFT OUTER JOIN    
      dbo.TipoCambioFecha ON Cp_1.FechaEmision = dbo.TipoCambioFecha.Fecha LEFT OUTER JOIN    
      dbo.TipoComprobantePago ON TipoCp_1.IDTipoComprobantePago = dbo.TipoComprobantePago.PKID LEFT OUTER JOIN    
      dbo.ModalidadCredito ON dbo.CpCobrarPagar.IDModalidadCredito = dbo.ModalidadCredito.PKID ON dbo.CpInventario.IDCp = Cp_1.PKID LEFT OUTER JOIN    
      dbo.DUA ON Cp_1.PKID = dbo.DUA.PKID    
WHERE     (Cp_1.IDLibroAuxiliar = 3 OR Cp_1.IDLibroAuxiliar = 8 OR Cp_1.IDLibroAuxiliar = 0 ) AND (Cp_1.Anulado = 0)   
--AND (TipoCp_1.PKID NOT IN ('139', '140'))    
AND (TipoCp_1.Abreviacion<>'LP')    
AND (TipoComprobantePago.PKID NOT IN (100000013, 3, 4, 9, 13, 14))    


GO
SELECT IDLibroAuxiliar FROM CP WHERE NumCp='FFG9-789'

SELECT*FROM TipoComprobantePago WHERE PKID IN(100000013, 3, 4, 9, 13, 14)

SELECT*FROM TipoCp WHERE PKID=5199


