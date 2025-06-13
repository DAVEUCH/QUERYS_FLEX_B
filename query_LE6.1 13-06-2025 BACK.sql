USE [FREDDY]
GO

/****** Object:  View [dbo].[vrpte_LE_LibroMayor2010_001]    Script Date: 13/06/2025 10:06:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vrpte_LE_LibroMayor2010_001]
AS
SELECT     dbo.fFB_LE_PeriodoDescripcion00(dbo.VoucherContable.IDPeriodo) AS Periodo, 
--dbo.VoucherContable.NumCp AS CodigoOperacion, 
--	CASE WHEN dbo.TipoCp.pkid in (5278,5310,5311,5312,5314,5321,5369,5611,5620,5209) then 
--	dbo.VoucherContable.NumCp else 
--	  CASE 
--   WHEN dbo.TipoCp.TipoCp IN ('Venta', 'Compra', 'NotaCredito', 'NotaDebito') THEN 
--      CONCAT(
--         CASE 
--            WHEN dbo.TipoCp.TipoCp = 'Compra' THEN dbo.Persona.DocIdentidad
--            ELSE '20100765790'
--         END,
--         COALESCE(dbo.TipoComprobantePago.Codigo, ''),
--         COALESCE(LibrosElectronicos.NumeroSerieDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), ''),
--         '000',
--         COALESCE(LibrosElectronicos.NumeroDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')
--      )
--   ELSE 
--      dbo.VoucherContable.NumCp
--END END AS NumeroCAR,
CASE 
   WHEN dbo.TipoCp.pkid IN (5278, 5310, 5311, 5312, 5314, 5321, 5369, 5611, 5620, 5209) THEN 
      dbo.VoucherContable.NumCp

   WHEN dbo.TipoCp.pkid IN (5006, 5285, 5010,5367,5397,5199,5220) THEN 
      CONCAT(
         RIGHT(CONCAT('00000000000', dbo.Persona.DocIdentidad), 11),
         RIGHT(CONCAT('00', COALESCE(dbo.TipoComprobantePago.Codigo, '')), 2),
         RIGHT(CONCAT('0000', COALESCE(LibrosElectronicos.NumeroSerieDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')), 4),
         '000',
         RIGHT(CONCAT('0000000', COALESCE(LibrosElectronicos.NumeroDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')), 7)
      )

   ELSE 
      CASE 
         WHEN dbo.TipoCp.TipoCp IN ('Venta', 'Compra', 'NotaCredito', 'NotaDebito') THEN 
            CASE 
               WHEN dbo.TipoCp.IDTipoComprobantePago IN (100000010, 27) THEN 
                  CONCAT(
                     RIGHT(CONCAT('00000000000', dbo.Persona.DocIdentidad), 11),
                     RIGHT(CONCAT('00', COALESCE(dbo.TipoComprobantePago.Codigo, '')), 2),
                     RIGHT(CONCAT('0000', COALESCE(LibrosElectronicos.NumeroSerieDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')), 4),
                     '000',
                     RIGHT(CONCAT('0000000', COALESCE(LibrosElectronicos.NumeroDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')), 7)
                  )

               ELSE 
                  CASE 
                     WHEN Cp.IDPersona = 11291 THEN 
                        LEFT(
                           CONCAT(
                              RIGHT(CONCAT('00000000000', dbo.Persona.DocIdentidad), 11),
                              RIGHT(CONCAT('00', COALESCE(dbo.TipoComprobantePago.Codigo, '')), 2),
                              RIGHT(CONCAT('0000', COALESCE(LibrosElectronicos.NumeroSerieDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')), 4),
                              '000',
                              RIGHT(CONCAT('0000000', COALESCE(LibrosElectronicos.NumeroDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')), 7)
                           ),
                           27
                        )

                     ELSE 
                        CONCAT(
                           CASE 
                              WHEN dbo.TipoCp.TipoCp = 'Compra' THEN dbo.Persona.DocIdentidad
                              ELSE '20100765790'
                           END,
                           COALESCE(dbo.TipoComprobantePago.Codigo, ''),
                           COALESCE(LibrosElectronicos.NumeroSerieDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), ''),
                           '000',
                           COALESCE(LibrosElectronicos.NumeroDocumento(Cp.NumCp, dbo.TipoComprobantePago.Codigo), '')
                        )
                  END
            END

         ELSE 
            dbo.VoucherContable.NumCp
      END
END AS NumeroCAR
,

CASE dbo.VoucherContable.TipoOperacion WHEN 'Apertura' THEN 'A' WHEN 'Operacion' THEN 'M' WHEN 'Cierre' THEN 'C' END + CAST(dbo.CargoAbono.PKID AS Varchar(10))
AS NumeroCorrelativo, '01' AS CodigoPlanCuentas, dbo.CuentaContable.Cuenta AS CodigoCuentaContable, CONVERT(char(10), dbo.VoucherContable.Fecha, 103) 
AS FechaOperacion, ISNULL(LTRIM(RTRIM(dbo.Asiento.Glosa)), '-') AS Glosa, CAST(CAST(dbo.CargoAbono.CargoMonedaBase AS decimal(14, 2)) AS varchar(15)) 
AS Debe, CAST(CAST(dbo.CargoAbono.AbonoMonedaBase AS decimal(14, 2)) AS varchar(15)) AS Haber, '' AS CorrelativoRegistroVentas, 
'' AS CorrelativoRegistroCompras, '' AS CorrelativoRegistroConsignaciones, dbo.fFB_LibrosElectronicos_Estado_FechaEmision(dbo.VoucherContable.Fecha, 
dbo.VoucherContable.IDPeriodo, dbo.VoucherContable.IDPeriodo) AS EstadoOperacion, '' AS CampoLibre, dbo.VoucherContable.IDPeriodo
FROM dbo.VoucherContable WITH (NOLOCK) INNER JOIN
dbo.Periodo WITH (NOLOCK) ON dbo.VoucherContable.IDPeriodo = dbo.Periodo.PKID INNER JOIN
dbo.Ejercicio WITH (NOLOCK) ON dbo.Periodo.IDEjercicio = dbo.Ejercicio.PKID INNER JOIN
dbo.Asiento WITH (NOLOCK) ON dbo.VoucherContable.PKID = dbo.Asiento.IDVoucher INNER JOIN
dbo.CargoAbono WITH (NOLOCK) ON dbo.Asiento.PKID = dbo.CargoAbono.IDAsiento INNER JOIN
dbo.CuentaContable WITH (NOLOCK) ON dbo.CargoAbono.IDCuentaContable = dbo.CuentaContable.PKID LEFT OUTER JOIN
dbo.Cp WITH (NOLOCK) ON dbo.VoucherContable.IDCp = dbo.Cp.PKID
LEFT JOIN dbo.TipoCp ON dbo.TipoCp.PKID=Cp.IDTipoCp
LEFT JOIN dbo.TipoComprobantePago on dbo.TipoComprobantePago.PKID=dbo.TipoCp.IDTipoComprobantePago
LEFT JOIN Persona ON Persona.pkid = Cp.IDPersona 
WHERE dbo.VoucherContable.Anulado=0
GO


