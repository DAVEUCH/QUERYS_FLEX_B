USE [FREDDY_prueba]
GO
/****** Object:  UserDefinedFunction [LibrosElectronicos].[RegistroVentas]    Script Date: 26/03/2025 12:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [LibrosElectronicos].[RegistroVentas]
(
	@IDPeriodo int
)
RETURNS @RegistroVentas TABLE
	(	Periodo	varchar	(8),
		NumeroOperacion	varchar	(40),
		CAR  varchar(50),
		NumeroCorrelativo	varchar	(10) /*INDEX IX_NumeroCorrelativo NONCLUSTERED*/,
		FechaEmision	varchar	(10) /*INDEX IX_FechaEmision NONCLUSTERED*/,
		FechaVencimiento	varchar	(10),
		TipoComprobantePagoCodigo	varchar	(3),
		NumeroSerie	varchar	(20),
		Numero	varchar	(20),
		Campo9	varchar	(20),
		TipoDocumentoIdentidadCodigo	varchar	(1),
		ClienteDocumentoIdentidad	varchar	(15),
		ClienteNombre	varchar	(100),
		ValorExportacion	varchar	(15),
		BaseImponible	varchar	(15),
		DescBaseimponible	varchar	(5),
		ValorIGV	varchar	(15),
		DsctoIGV	varchar	(5),
		ValorExonerado	varchar	(15),
		ValorInafecto	varchar	(15),
		ValorISC	varchar	(15),
		BaseImponibleArrozPilado	varchar	(5),
		ValorIGVArrozPilado	varchar	(5),
		ValorICB	varchar	(15),
		ValorOtrosCargos	varchar	(15),
		Total	varchar	(15),
		CodigoMoneda	varchar	(3),
		TipoDeCambio	varchar	(5),
		ReferenciaFechaEmision	varchar	(10),
		ReferenciaTipoComprobantePagoCodigo	varchar	(3),
		ReferenciaNumeroSerie	varchar	(20),
		ReferenciaNumero	varchar	(20),
		--ValorFOB	varchar	(23),
		IdentificacionContratoJV	varchar	(1),
		ErrorTC	varchar	(1),
		IndicadorTCP	varchar	(1),
		Estado	varchar	(1),
		CampoLibre	varchar	(1),
		FechaIngreso	varchar	(10),
		IDPeriodo	int	
)
AS	
BEGIN

INSERT INTO @RegistroVentas 
SELECT  LibrosElectronicos.PeriodoDescripcion00(LibrosElectronicos.RegistroVentasPrevio.IDPeriodo) AS Periodo, 
		--ISNULL(LibrosElectronicos.CUOIDAsiento.CUOIDAsiento, 
		--	ISNULL(LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar.CUOIDAsientoSinDocCobrarPagar, LibrosElectronicos.RegistroVentasPrevio.IDCp)) AS NumeroOperacion,
		ISNULL(LibrosElectronicos.CUOIDAsiento.CUOIDAsiento, 
			ISNULL(NumCpContable, LibrosElectronicos.RegistroVentasPrevio.IDCp)) AS NumeroOperacion,
			
	CONCAT('20100765790',
	COALESCE(LibrosElectronicos.RegistroVentasPrevio.TipoComprobantePagoCodigo, ''),
	COALESCE(LibrosElectronicos.RegistroVentasPrevio.NumeroSerie, ''),
	'000',  -- Se agregan los tres ceros adicionales
	COALESCE(LibrosElectronicos.RegistroVentasPrevio.Numero, '')
	) AS CAR,


		--ISNULL(LibrosElectronicos.NumeroCorrelativoAsiento.NumeroCorrelativoAsiento, ISNULL(LibrosElectronicos.NumeroAsientoSinDocCobrarPagar.NumeroCorrelativoAsientoSinDocCobrarPagar, 'M' + RIGHT(CAST(LibrosElectronicos.RegistroVentasPrevio.IDCp AS varchar(20)), 9))) AS NumeroCorrelativo,
		ISNULL(LibrosElectronicos.NumeroCorrelativoAsiento.NumeroCorrelativoAsiento, 'M' + RIGHT(CAST(LibrosElectronicos.RegistroVentasPrevio.IDCp AS varchar(20)), 9)) AS NumeroCorrelativo,
		LibrosElectronicos.FechaFormato	(LibrosElectronicos.RegistroVentasPrevio.FechaEmision) AS FechaEmision, 
		'01/01/0001' AS FechaVencimiento, 
		LibrosElectronicos.RegistroVentasPrevio.TipoComprobantePagoCodigo, 
		LibrosElectronicos.RegistroVentasPrevio.NumeroSerie, 
		LibrosElectronicos.RegistroVentasPrevio.Numero, 
		CASE WHEN TipoComprobantePagoCodigo IN ('00', '03', '12', '13', '87') THEN Numero ELSE '' END AS Campo9, 
		LibrosElectronicos.RegistroVentasPrevio.TipoDocumentoIdentidadCodigo, 
		RTRIM(LibrosElectronicos.RegistroVentasPrevio.ClienteDocumentoIdentidad) AS ClienteDocumentoIdentidad, 
		LibrosElectronicos.QuitarSimbolosNombre(LibrosElectronicos.RegistroVentasPrevio.PersonaNombre) AS ClienteNombre, 
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorExportacion) AS ValorExportacion, 
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorAfecto) AS BaseImponible,
		'0.00' AS DescBaseimponible,
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorIGV) AS ValorIGV,
		'0.00' AS DsctoIGV,
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorExonerado) AS ValorExonerado,
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorInafecto) AS ValorInafecto,
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorISC) AS ValorISC,
		'' AS BaseImponibleArrozPilado,
		'' AS ValorIGVArrozPilado,
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorICB) AS ValorICB,
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.ValorOtrosCargos) AS ValorOtrosCargos, 
		LibrosElectronicos.MontoFormato(LibrosElectronicos.RegistroVentasPrevio.Total) AS Total, 
		CASE LibrosElectronicos.RegistroVentasPrevio.IDMoneda WHEN 1 THEN 'PEN' WHEN 2 THEN 'USD' ELSE '000' END AS CodigoMoneda,
		CONVERT(varchar(5), CONVERT(decimal(4, 3), LibrosElectronicos.RegistroVentasPrevio.TipoDeCambio)) AS TipoDeCambio, 
		LibrosElectronicos.FechaFormato(LibrosElectronicos.RegistroVentasPrevio.ReferenciaFechaEmision) AS ReferenciaFechaEmision, 
		LibrosElectronicos.RegistroVentasPrevio.ReferenciaTipoComprobantePagoCodigo, 
		LibrosElectronicos.RegistroVentasPrevio.ReferenciaNumeroSerie, 
		ISNULL(LibrosElectronicos.RegistroVentasPrevio.ReferenciaNumero, '') AS ReferenciaNumero, 
		--'0.00' AS ValorFOB,
		' ' AS IdentificacionContratoJV,
		'1' AS ErrorTC,
		'1' AS IndicadorTCP,
		CASE CpAnulado WHEN 1 THEN '2' ELSE '1' END AS Estado, 
		' ' AS CampoLibre, 
		LibrosElectronicos.FechaFormato(LibrosElectronicos.RegistroVentasPrevio.FechaIngreso) AS FechaIngreso, 
		LibrosElectronicos.RegistroVentasPrevio.IDPeriodo
FROM	LibrosElectronicos.RegistroVentasPrevio WITH (nolock) LEFT OUTER JOIN
		LibrosElectronicos.NumeroAsientoSinDocCobrarPagar WITH (nolock) ON 
		LibrosElectronicos.RegistroVentasPrevio.IDCp = LibrosElectronicos.NumeroAsientoSinDocCobrarPagar.PKID LEFT OUTER JOIN
		LibrosElectronicos.NumeroCorrelativoAsiento WITH (nolock) ON LibrosElectronicos.RegistroVentasPrevio.IDCp = LibrosElectronicos.NumeroCorrelativoAsiento.PKID LEFT OUTER JOIN
                  LibrosElectronicos.CUOIDAsiento ON LibrosElectronicos.RegistroVentasPrevio.IDCp= LibrosElectronicos.CUOIDAsiento.PKID LEFT OUTER JOIN
                  LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar ON LibrosElectronicos.RegistroVentasPrevio.IDCp = LibrosElectronicos.CUOIDAsientoSinDocCobrarPagar.PKID
WHERE LibrosElectronicos.RegistroVentasPrevio.IDPeriodo = @IDPeriodo

			-- Create by MarcoD / FNP
			--SELECT * FROM @RegistroVentas

RETURN
	
END