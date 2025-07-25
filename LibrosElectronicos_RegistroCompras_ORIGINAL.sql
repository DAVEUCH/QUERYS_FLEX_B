USE [FREDDY]
GO
/****** Object:  UserDefinedFunction [LibrosElectronicos].[RegistroCompras]    Script Date: 8/04/2025 16:52:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [LibrosElectronicos].[RegistroCompras]
(
	@IDPeriodo int
)
RETURNS @RegistroCompras TABLE
	(	
	Periodo  varchar(8),
	CUO  varchar(40),
	NumAsientoCorrelativo  varchar(10),
	FechaEmision  varchar(10),
	FechaVencimiento  varchar(10),
	TipoComprobantePagoCodigo  varchar(2),
	NumSerieDocumento  varchar(9),
	AñoDUA  varchar(10),
	NumeroDocumento  varchar(20),
	NumeroFinal  varchar(1),
	TipoDocIdentidad  varchar(6),
	NumeroDocIdentidad  varchar(15),
	RazonSocial  varchar(300),
	BaseGravada14  varchar(22),
	ImpuestoBaseGravada14  varchar(22),
	BaseGravada16  varchar(22),
	ImpuestoBaseGravada16  varchar(22),
	BaseGravada18  varchar(22),
	ImpuestoBaseGravada18  varchar(22),
	ValorNoGravada  varchar(21),
	ValorISC  varchar(21),
	ValorICB  varchar(21),
	ValorOtrosCargos  varchar(21),
	ImporteTotal  varchar(21),
	IDMoneda  int,
	CodigoMoneda  varchar(3),
	MonedaBase  bit,
	TipoDeCambio  varchar(5),
	ReferenciaFechaEmision  varchar(10),
	ReferenciaTipoComprobantePago  varchar(2),
	ReferenciaNumeroSerie  varchar(20),
	CodigoDUA  varchar(60),
	ReferenciaNumero  varchar(20),
	NumDocPagoSujetoNoDomiciliado  varchar(1),
	ComprobanteDetraccionFechaEmision  varchar(10),
	ComprobanteDetraccionNumero  varchar(20),
	MarcaDocumentoSujetoRetencion  varchar(1),
	ClasificacionBienesServicios  int,
	EstadoIdentificaAnotacion  int,
	CampoLibre  varchar(1),
	IDPeriodo  int /*INDEX IX_IDPeriodo NONCLUSTERED*/,
	Extranjero  bit
	)

AS
/* [LibrosElectronicos].[RegistroCompras_v4] */
BEGIN
Declare @PeriodoID int=@IDPeriodo
Declare @DocsCompras table (IDDoc int)
Insert  @DocsCompras Select PKID From Cp WHERE  (Cp.IDPeriodo=@PeriodoID) AND (Cp.IDLibroAuxiliar = 3)

DECLARE @TipoMovimiento Table
(
	Codigo varchar(4), -- Codigo del tipo de comprobante de pago
	Movimiento int
)

INSERT INTO @TipoMovimiento VALUES('01', -1) 
INSERT INTO @TipoMovimiento VALUES('03', -1)
INSERT INTO @TipoMovimiento VALUES('05', -1)
INSERT INTO @TipoMovimiento VALUES('06', -1)
INSERT INTO @TipoMovimiento VALUES('07', 1)
INSERT INTO @TipoMovimiento VALUES('08', -1)
INSERT INTO @TipoMovimiento VALUES('12', -1)
INSERT INTO @TipoMovimiento VALUES('14', -1)
INSERT INTO @TipoMovimiento VALUES('15', -1)
INSERT INTO @TipoMovimiento VALUES('16', -1)
INSERT INTO @TipoMovimiento VALUES('17', -1)
INSERT INTO @TipoMovimiento VALUES('18', -1)
INSERT INTO @TipoMovimiento VALUES('19', -1)
INSERT INTO @TipoMovimiento VALUES('13', -1)
INSERT INTO @TipoMovimiento VALUES('39', -1)
INSERT INTO @TipoMovimiento VALUES('21', -1)
INSERT INTO @TipoMovimiento VALUES('37', -1)
INSERT INTO @TipoMovimiento VALUES('87', 1)
INSERT INTO @TipoMovimiento VALUES('88', -1)
INSERT INTO @TipoMovimiento VALUES('50', -1)
INSERT INTO @TipoMovimiento VALUES('91', -1)
INSERT INTO @TipoMovimiento VALUES('97', 1)
INSERT INTO @TipoMovimiento VALUES('98', -1)

Declare @RegistroComprasPrevio table
	(NumeroContable  varchar(40),
	NumeroCorrelativoAsiento  varchar(10) /*INDEX IX_NumeroCorrelativaAsiento NONCLUSTERED*/,
	FechaEmision  datetime /*INDEX IX_FechaEmision NONCLUSTERED*/,
	FechaIngreso  datetime,
	FechaVencimiento  datetime,
	TipoComprobanteAbreviacion  varchar(70),
	TipoComprobanteDescripcion  varchar(50),
	TipoComprobantePagoCodigo  varchar(4),
	TipoComprobantePagoDescripcion  varchar(350),
	NumeroSerie  varchar(20),
	Numero  varchar(20),
	TipoDocumentoIdentidadCodigo  varchar(20),
	ClienteCodigo  nchar(20),
	ClienteTipoDocumentoIdentidadAbreviacion  varchar(50),
	ClienteDocumentoIdentidad  varchar(300),
	ClienteNombre  nchar(100),
	SubTotal  decimal(14,3),
	ValorDescuento  decimal(14,3),
	ValorExportacion  int,
	ValorAfecto  decimal(14,3),
	ValorExonerado  decimal(14,3),
	ValorInafecto  decimal(14,3),
	ValorISC  int,
	ValorIGV  decimal(14,3),
	ValorICB  decimal(14,3),
	ValorOtrosCargos  decimal(14,3),
	Total  decimal(14,3),
	IDMoneda  int,
	CodigoMoneda  varchar(3),
	MonedaBase  bit,
	TipoDeCambio  decimal(14,3),
	ReferenciaFechaEmision  datetime,
	ReferenciaTipoComprobantePagoCodigo  varchar(4),
	ReferenciaNumeroSerie  varchar(10),
	ReferenciaNumero  varchar(20),
	ModalidadCreditoCodigo  varchar(20),
	ModalidadCreditoDescripcion  varchar(50),
	ComprobanteDetraccionFechaEmision  datetime,
	ComprobanteDetraccionNumero  varchar(50),
	AlmacenCodigo  nchar(20),
	SucursalID  int,
	TipoCp  varchar(50),
	FechaPagoVencimiento  datetime,
	IDPeriodo  int /*INDEX IX_IDPeriodo NONCLUSTERED*/,
	TotalServicioDespacho  decimal(14,3),
	IDCpDoc  int,
	IDCptoOperacion  int,
	CptoOperacionCodigo  varchar(20),
	BaseGravada14  varchar(23),
	ImpuestoBaseGravada14  varchar(23),
	BaseGravada16  varchar(23),
	ImpuestoBaseGravada16  varchar(23),
	BaseGravada18  varchar(23),
	ImpuestoBaseGravada18  varchar(23),
	IDDUA  int,
	SerieDependenciaAduanera  varchar(60),
	ProveedorAgenteRetencion  bit,
	Extranjero  bit,
	TipoItemCp  int
	)

	INSERT INTO @RegistroComprasPrevio
	SELECT	--ISNULL(LibrosElectronicos.CUOIDAsiento.CUOIDAsiento, 
			--ISNULL(LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar.CUOIDAsientoSinDocCobrarPagar, Cp_1.PKID)) AS NumeroContable, 
			--SE CAMBIADO LAS LINEAS 161- 162
			--ISNULL(LibrosElectronicos.CUOIDAsiento.CUOIDAsiento, 
			--ISNULL(LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar.CUOIDAsientoSinDocCobrarPagar, Cp_1.PKID)) AS NumeroContable,
						--ESTO ES EL CASE IMPLEMENTADO 13-01-2024
    ISNULL(
        CASE 
            WHEN cptoOperacion.PKID=1960 THEN Cp_1.NumCpContable
            ELSE NULL
        END,
        ISNULL(LibrosElectronicos.CUOIDAsiento.CUOIDAsiento,  
               ISNULL(LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar.CUOIDAsientoSinDocCobrarPagar, Cp_1.PKID))
    ) AS NumeroContable,
			ISNULL(LibrosElectronicos.NumeroCorrelativoAsiento.NumeroCorrelativoAsiento, 
			--ISNULL(LibrosElectronicos.NumeroAsientoSinDocCobrarPagar.NumeroCorrelativoAsientoSinDocCobrarPagar, 
			--'M' + RIGHT(CAST(Cp_1.PKID AS varchar(20)), 9))) AS NumeroCorrelativoAsiento, 
			ISNULL(LibrosElectronicos.NumeroCorrelativoAsiento.NumeroCorrelativoAsiento, 'M' + RIGHT(CAST(Cp_1.PKID AS varchar(20)), 9))) AS NumeroCorrelativoAsiento,
			Cp_1.FechaEmision, Cp_1.Fecha AS FechaIngreso, 
			--dbo.fun_FechaPagoReciboSevicioPublico(ISNULL(dbo.TipoComprobantePago.Codigo, ''), Cp_1.PKID, dbo.CpCobrarPagar.FechaVencimiento) AS FechaVencimiento, 
			[Reportes].[Aux_FechaPagoReciboSevicioPublico](ISNULL(dbo.TipoComprobantePago.Codigo, ''), Cp_1.PKID, dbo.CpCobrarPagar.FechaVencimiento) AS FechaVencimiento, 
			TipoCp_1.Abreviacion + TipoCp_1.Serie AS TipoComprobanteAbreviacion, 
			TipoCp_1.Descripcion AS TipoComprobanteDescripcion, 
			dbo.TipoComprobantePago.Codigo AS TipoComprobantePagoCodigo, 
			dbo.TipoComprobantePago.Descripcion AS TipoComprobantePagoDescripcion, 
			LibrosElectronicos.NumeroSerieDocumento(Cp_1.NumCp, dbo.TipoComprobantePago.Codigo) AS NumeroSerie, 
			LibrosElectronicos.NumeroDocumento(Cp_1.NumCp, dbo.TipoComprobantePago.Codigo) AS Numero, 
			dbo.TipoDocIdentidad.Codigo AS TipoDocumentoIdentidadCodigo, Persona_1.Codigo AS ClienteCodigo, 
			dbo.TipoDocIdentidad.Abreviacion AS ClienteTipoDocumentoIdentidadAbreviacion, 
			CASE WHEN dbo.TipoDocIdentidad.Codigo IN ('1', '6') 
				THEN [LibrosElectronicos].[QuitarSimbolos](Persona_1.DocIdentidad) 
				ELSE Persona_1.DocIdentidad 
				END AS ClienteDocumentoIdentidad, 
			Persona_1.Nombre AS ClienteNombre, 
			LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.SubTotal, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS SubTotal, 
			LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.ValorDescuento, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS ValorDescuento, 
			0 AS ValorExportacion, 
			LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.ValorAfecto, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS ValorAfecto, 
			LibrosElectronicos.RegistroCompras_MontoMonedaBase(0, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS ValorExonerado, 
			LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.ValorInafecto, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS ValorInafecto, 
			0 AS ValorISC, 
			LibrosElectronicos.RegistroCompras_MontoMonedaBase((Cp_1.Total - ISNULL((dbo.DUA.TotalArancel+dbo.DUA.TotalServicioDespacho+dbo.DUA.TotalPercepcion), Cp_1.ValorVenta)),
				Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS ValorIGV,
			LibrosElectronicos.RegistroCompras_MontoMonedaBase(0, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS ValorICB,
			
			CASE WHEN Cp_1.IDTipoAsociado = 'AD774BAE-3357-4061-97FB-57F8B75BCE63' THEN
			0
			ELSE
			CASE WHEN dbo.Impuesto.PKID IN (1, 100000014, 100000018)
					THEN LibrosElectronicos.RegistroCompras_MontoMonedaBase((ISNULL(dbo.DUA.TotalArancel,0) + ISNULL(dbo.DUA.TotalServicioDespacho, 0)), Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio)
					ELSE LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.Total - Cp_1.ValorVenta, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio)	
					END 
			END AS ValorOtrosCargos,
					
			--LibrosElectronicos.RegistroCompras_MontoMonedaBase((ISNULL(dbo.DUA.TotalAduana, 0) + Cp_1.Total + ISNULL(dbo.DUA.TotalArancel,0) +ISNULL(dbo.DUA.TotalServicioDespacho,0) -ISNULL(dbo.DUA.TotalPercepcion,0)), 
			--		Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS Total,
				
						LibrosElectronicos.RegistroCompras_MontoMonedaBase((ISNULL(dbo.DUA.TotalAduana, 0) + Cp_1.Total -ISNULL(dbo.DUA.TotalPercepcion,0)), 
					Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio) AS Total,
					
			Cp_1.IDMoneda, 
			CASE Cp_1.IDMoneda WHEN 1 THEN 'PEN' WHEN 2 THEN 'USD' ELSE '000' END AS CodigoMoneda, 
			Cp_1.MonedaBase, 
			CASE Cp_1.MonedaBase WHEN 1 THEN 1 ELSE Cp_1.TipoCambio END AS TipoDeCambio,
			ISNULL(DR.Fecha,ISNULL(Cp.FechaEmision, '')) AS ReferenciaFechaEmision,
			ISNULL(TipoComprobantePago_1.Codigo, isnull(TCPago.Codigo,'')) AS ReferenciaTipoComprobantePagoCodigo,
			ISNULL(DR.Serie, ISNULL(LibrosElectronicos.NumeroSerieDocumento(dbo.Cp.NumCp, TipoComprobantePago_1.Codigo), '')) AS ReferenciaNumeroSerie,
			ISNULL(DR.Numero,ISNULL(LibrosElectronicos.NumeroDocumento(dbo.Cp.NumCp, TipoComprobantePago_1.Codigo),'')) AS ReferenciaNumero,  
			ISNULL(dbo.ModalidadCredito.Codigo, '') AS ModalidadCreditoCodigo, 
			ISNULL(dbo.ModalidadCredito.Descripcion, '') AS ModalidadCreditoDescripcion, 
			CASE WHEN LEN(RTRIM(dbo.CpCobrarPagar.NumeroDetraccion))>=2 
					THEN dbo.CpCobrarPagar.FechaDetraccion
					ELSE ISNULL(LibrosElectronicos.RegistroComprasComprobanteDetraccion.FechaEmision, '') 
					END AS ComprobanteDetraccionFechaEmision,
			CASE WHEN LEN(RTRIM(dbo.CpCobrarPagar.NumeroDetraccion))>=2 
					THEN dbo.CpCobrarPagar.NumeroDetraccion
					ELSE ISNULL(LibrosElectronicos.RegistroComprasComprobanteDetraccion.NumCp, '') 
					END AS ComprobanteDetraccionNumero,
			ISNULL(dbo.Almacen.Codigo, '') AS AlmacenCodigo, 
			Cp_1.IDSucursal AS SucursalID, TipoCp_1.TipoCp, 
			dbo.fun_FechaPagoFechaVencimiento(ISNULL(dbo.TipoComprobantePago.PKID, 0), Cp_1.PKID, dbo.CpCobrarPagar.FechaVencimiento) AS FechaPagoVencimiento, 
			Cp_1.IDPeriodo, 
			ISNULL(dbo.DUA.TotalServicioDespacho, 0) * (CASE cp_1.MonedaBase WHEN 1 THEN 1 ELSE cp_1.TipoCambio END) AS TotalServicioDespacho, 
			Cp_1.PKID AS IDCpDoc, dbo.CptoOperacion.PKID AS IDCptoOperacion, 
			dbo.CptoOperacion.Codigo AS CptoOperacionCodigo, 
			CASE dbo.CptoOperacion.Codigo WHEN 'ANTPRO1' THEN '0.00' ELSE 
			LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.ValorAfecto, Cp_1.Anulado, 
				TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio), 0, 14) 
			END AS BaseGravada14, 
			CASE dbo.CptoOperacion.Codigo WHEN 'ANTPRO1' THEN '0.00' ELSE 
			LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase((Cp_1.Total - ISNULL((dbo.DUA.TotalArancel+ dbo.DUA.TotalServicioDespacho+ dbo.DUA.TotalPercepcion), Cp_1.ValorVenta)), 
				Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio), 0, 14) 
			END AS ImpuestoBaseGravada14, 
			LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.ValorAfecto, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio), 
				0, 16) AS BaseGravada16, 
			LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase((Cp_1.Total - ISNULL((dbo.DUA.TotalArancel+ dbo.DUA.TotalServicioDespacho+ dbo.DUA.TotalPercepcion), Cp_1.ValorVenta)), 
				Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio), 0, 16) AS ImpuestoBaseGravada16, 
			LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase(Cp_1.ValorAfecto, Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, 
				Cp_1.TipoCambio), 0, 18) AS BaseGravada18, 
			LibrosElectronicos.RegistroCompras_BaseImponible_Impuesto(LibrosElectronicos.RegistroCompras_MontoMonedaBase((Cp_1.Total - ISNULL((dbo.DUA.TotalArancel+ dbo.DUA.TotalServicioDespacho+ dbo.DUA.TotalPercepcion), Cp_1.ValorVenta)), 
				Cp_1.Anulado, TipoMovimiento.Movimiento, Cp_1.MonedaBase, Cp_1.TipoCambio), 0, 18) AS ImpuestoBaseGravada18, 
			ISNULL(dbo.DUA.PKID, '') AS IDDUA, 
			ISNULL(dbo.DUA.SerieDependenciaAduanera, '') AS SerieDependenciaAduanera, 
			Persona_1.AgenteRetencion AS ProveedorAgenteRetencion, 
			Persona_1.Extranjero, 
			dbo.CptoOperacion.TipoItemCp
	FROM	dbo.DUA WITH (NOLOCK) RIGHT OUTER JOIN
            dbo.ModalidadCredito WITH (NOLOCK) LEFT OUTER JOIN
			dbo.TipoCambioFecha WITH (NOLOCK) RIGHT OUTER JOIN
			dbo.Impuesto WITH (NOLOCK) RIGHT OUTER JOIN
			LibrosElectronicos.NumeroCorrelativoAsiento RIGHT OUTER JOIN
            LibrosElectronicos.NumeroAsientoSinDocCobrarPagar RIGHT OUTER JOIN
            dbo.Cp AS Cp_1 WITH (NOLOCK) INNER JOIN
            dbo.TipoCp AS TipoCp_1 WITH (NOLOCK) ON Cp_1.IDTipoCp = TipoCp_1.PKID INNER JOIN
            dbo.CptoOperacion WITH (NOLOCK) ON Cp_1.IDCptoOperacion = dbo.CptoOperacion.PKID INNER JOIN
            dbo.CpCobrarPagar WITH (NOLOCK) ON Cp_1.PKID = dbo.CpCobrarPagar.PKID INNER JOIN
                  dbo.Periodo WITH (NOLOCK) ON Cp_1.IDPeriodo = dbo.Periodo.PKID INNER JOIN
                  dbo.Proveedor WITH (NOLOCK) INNER JOIN
                  dbo.TipoDocIdentidad WITH (NOLOCK) INNER JOIN
                  dbo.Persona AS Persona_1 WITH (NOLOCK) ON dbo.TipoDocIdentidad.PKID = Persona_1.IDTipoDocIdentidad ON dbo.Proveedor.PKID = Persona_1.PKID ON Cp_1.IDPersona = Persona_1.PKID INNER JOIN
                  dbo.Persona ON Cp_1.IDResponsable = dbo.Persona.PKID ON LibrosElectronicos.NumeroAsientoSinDocCobrarPagar.PKID = Cp_1.PKID ON 
                  LibrosElectronicos.NumeroCorrelativoAsiento.PKID = Cp_1.PKID LEFT OUTER JOIN
                  dbo.CpInventario WITH (NOLOCK) INNER JOIN
                  dbo.Almacen WITH (NOLOCK) ON dbo.CpInventario.IDAlmacen = dbo.Almacen.PKID ON Cp_1.PKID = dbo.CpInventario.IDCp LEFT OUTER JOIN
                  dbo.TipoComprobantePago WITH (NOLOCK) ON TipoCp_1.IDTipoComprobantePago = dbo.TipoComprobantePago.PKID LEFT OUTER JOIN
                  dbo.Cp WITH (NOLOCK) INNER JOIN
				  -- INNER JOIN @DocsCompras as DocCompra ON Cp_1.PKID=DocCompra.IDDoc 
                  dbo.TipoCp WITH (NOLOCK) ON dbo.Cp.IDTipoCp = dbo.TipoCp.PKID INNER JOIN
                  dbo.TipoComprobantePago AS TipoComprobantePago_1 WITH (NOLOCK) ON dbo.TipoCp.IDTipoComprobantePago = TipoComprobantePago_1.PKID INNER JOIN
                  LibrosElectronicos.RegistroComprasComprobanteReferencia WITH (NOLOCK) ON dbo.Cp.PKID = LibrosElectronicos.RegistroComprasComprobanteReferencia.IDCpRelacionado ON 
                  Cp_1.PKID = [LibrosElectronicos].[RegistroComprasComprobanteReferencia].IDCp LEFT OUTER JOIN
                  LibrosElectronicos.CUOIDAsiento WITH (NOLOCK) ON Cp_1.PKID = LibrosElectronicos.CUOIDAsiento.PKID LEFT OUTER JOIN
                  LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar WITH (NOLOCK) ON Cp_1.PKID = LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar.PKID ON dbo.Impuesto.PKID = Cp_1.IDImpuesto LEFT OUTER JOIN
                  [LibrosElectronicos].[RegistroComprasComprobanteDetraccion] WITH (NOLOCK) ON Cp_1.PKID = [LibrosElectronicos].[RegistroComprasComprobanteDetraccion].IDCp ON dbo.TipoCambioFecha.Fecha = Cp_1.FechaEmision ON 
                  dbo.ModalidadCredito.PKID = dbo.CpCobrarPagar.IDModalidadCredito ON dbo.DUA.PKID = Cp_1.PKID LEFT OUTER JOIN
                  dbo.DocReferencia AS DR WITH (NOLOCK) ON Cp_1.PKID = DR.IDDocumento LEFT OUTER JOIN
				  dbo.TipoComprobantePago AS TCPago WITH (NOLOCK) ON DR.IDTipoComprobantePago = TCPago.PKID
				  INNER JOIN @TipoMovimiento AS TipoMovimiento ON dbo.TipoComprobantePago.Codigo = TipoMovimiento.Codigo
	WHERE  (Cp_1.IDPeriodo=@PeriodoID) AND (Cp_1.IDLibroAuxiliar = 3 OR Cp_1.IDLibroAuxiliar = 8 or Cp_1.IDLibroAuxiliar = 0) AND
	------se ha modificado TipoCp_1.PKID NOT IN (54, '139', '140',5756,5704  poniendole 5704
	------ se ha regresado como antes 10-01-2025 se le quito 5704
		   (TipoCp_1.PKID NOT IN (54, '139', '140',5756)) AND dbo.TipoComprobantePago.Codigo NOT IN ('03', '16') AND (Cp_1.Anulado = 0) 
				
-- LE Registro Compras			
	INSERT INTO @RegistroCompras
	SELECT		LibrosElectronicos.PeriodoDescripcion00(IDPeriodo) AS Periodo, 
			CAST(NumeroContable AS Varchar(40)) AS CUO, 
			CAST(NumeroCorrelativoAsiento AS varchar(10)) AS NumAsientoCorrelativo, 
			LibrosElectronicos.FechaFormato(FechaEmision) AS FechaEmision, 
			LibrosElectronicos.FechaVencimiento(FechaVencimiento, TipoComprobantePagoCodigo) AS FechaVencimiento, 
			CAST(TipoComprobantePagoCodigo AS Varchar(2)) AS TipoComprobantePagoCodigo, 
			CAST(NumeroSerie AS Varchar(9)) AS NumSerieDocumento, 
			LibrosElectronicos.DuaAnio(FechaEmision, TipoComprobantePagoCodigo) AS AñoDUA, 
			CAST(Numero AS Varchar(20)) AS NumeroDocumento, 
			'0' AS NumeroFinal, 
			CAST(TipoDocumentoIdentidadCodigo AS Varchar(6)) AS TipoDocIdentidad, 
			CAST(ClienteDocumentoIdentidad AS Varchar(15)) AS NumeroDocIdentidad, 
			LibrosElectronicos.QuitarSimbolosNombre(ClienteNombre) AS RazonSocial,
			CONVERT(varchar(22), CONVERT(decimal(20, 2), BaseGravada14)) AS BaseGravada14,
			CONVERT(varchar(22), CONVERT(decimal(20, 2), ImpuestoBaseGravada14)) AS ImpuestoBaseGravada14,
			CONVERT(varchar(22), CONVERT(decimal(20, 2), BaseGravada16)) AS BaseGravada16, 
			CONVERT(varchar(22), CONVERT(decimal(20, 2), ImpuestoBaseGravada16)) AS ImpuestoBaseGravada16, 
			CONVERT(varchar(22), CONVERT(decimal(20, 2), BaseGravada18)) AS BaseGravada18, 
			CONVERT(varchar(22), CONVERT(decimal(20, 2), ImpuestoBaseGravada18)) AS ImpuestoBaseGravada18, 
			CONVERT(varchar(21), CONVERT(decimal(20, 2), ValorExonerado + ValorInafecto)) AS ValorNoGravada, 
			CONVERT(varchar(21), CONVERT(decimal(20, 2), ValorISC)) AS ValorISC,
			CONVERT(varchar(21), CONVERT(decimal(20, 2), ValorICB)) AS ValorICB, 
			CONVERT(varchar(21), CONVERT(decimal(20, 2), ValorOtrosCargos)) AS ValorOtrosCargos, 
			CASE CptoOperacionCodigo WHEN 'ANTPRO1' THEN '0.00' ELSE 
			CONVERT(varchar(21), CONVERT(decimal(20, 2), Total)) END AS ImporteTotal, 
			IDMoneda, CodigoMoneda, MonedaBase, 
			CONVERT(varchar(5), CONVERT(decimal(4, 3), CASE WHEN TipoDeCambio = 1 THEN 1 ELSE TipoDeCambio END)) AS TipoDeCambio, 
			LibrosElectronicos.FechaFormato(ReferenciaFechaEmision) AS ReferenciaFechaEmision, 
			CONVERT(varchar(2), CASE WHEN len(ReferenciaTipoComprobantePagoCodigo) > 0 THEN ReferenciaTipoComprobantePagoCodigo 
							ELSE '00' END) AS ReferenciaTipoComprobantePago, 
			CAST(ReferenciaNumeroSerie AS varchar(20)) AS ReferenciaNumeroSerie, 
			SerieDependenciaAduanera AS CodigoDUA, 
			CAST(ReferenciaNumero AS varchar(20)) AS ReferenciaNumero, 
			'0' AS NumDocPagoSujetoNoDomiciliado, 
			LibrosElectronicos.FechaFormato(ComprobanteDetraccionFechaEmision) AS ComprobanteDetraccionFechaEmision, 
			CONVERT(varchar(20), CASE WHEN len(ComprobanteDetraccionNumero) > 0 THEN ComprobanteDetraccionNumero 
									ELSE '0' END) AS ComprobanteDetraccionNumero, 
			CASE WHEN ProveedorAgenteRetencion = 1 THEN '' ELSE '1' END AS MarcaDocumentoSujetoRetencion, 
			CASE TipoItemCp WHEN 1 THEN 1 WHEN 2 THEN 5 ELSE 4 END AS ClasificacionBienesServicios, 
			--LibrosElectronicos.Estado_IdentificaAnotacion(FechaEmision, IDPeriodo, IDPeriodo, TipoComprobantePagoCodigo) AS EstadoIdentificaAnotacion, 
			CASE WHEN TipoComprobantePagoCodigo IN('02','03','09','10','13','15','16','17','18','19','23','31','36','50') THEN '0'
					WHEN DATEDIFF(month, FechaEmision, FechaIngreso) BETWEEN 1 AND 11 THEN '6'
					WHEN DATEDIFF(month, FechaEmision, FechaIngreso) >11 THEN '7'
				ELSE '1' END AS EstadoIdentificaAnotacion,
			' ' AS CampoLibre, IDPeriodo, Extranjero
	FROM   @RegistroComprasPrevio
	WHERE (Extranjero=0)
			 
RETURN
	
END