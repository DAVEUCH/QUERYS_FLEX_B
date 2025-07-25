USE [FREDDY]
GO
/****** Object:  StoredProcedure [dbo].[usp_regCompras_LE_82]    Script Date: 9/06/2025 16:11:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[usp_regCompras_LE_82]
(
@Periodo	varchar(10)
)
as 
set nocount on
Select
Left(Periodo,6) as Periodo, '' as Car, FechaEmision,
TipoComprobantePagoCodigo, NumSerieDocumento as NumeroSerie,
NumeroDocumento as Numero, --ValorAdq 
ImporteTotal as ValorAdquisicion,
Otros OtrosAdicionales, ImporteTotal as ImporteTotalAdquisicion,
ReferenciaTipoComprobantePago TipoComprobantePagoDua,
ReferenciaNumeroSerie SerieComprobantePago, AñoDua,
ReferenciaNumero NumeroComprobantePago,
ImpuestoBaseGravada18 MontoRetencionIGV,
CodigoMoneda MonedaCodigo, TipoDeCambio TimpoCambio,
isnull(Pais,'') PaisResidenciaCodigo, RazonSocial,
Domicilio, NumeroDocIdentidad, NumIdent_fiscal,
PersonaPaga ApellidosNombresBeneficiario, paisResi_beni PaisBeneficiario,
Vehiculo VinculoConBeneficiario,
--ImporteTotal2 
0 as RentaBruta, Campo DeduccionCostoEnajenacion, 
--ImporteTotal3 
0 as RentaNeta,
Tasa, Impuesto, Convenio, Exonera, TipoRenta,
ModalServi as Servi, '' as Art76,'' as CarOrig, 
'' as c1,'' as c2,'' as c3,'' as c4,'' as c5,'' as c6,'' as c7, '' as c8, '' as c9,'' as c10 
From  usv_regCompras_LE_822
Where Left(Periodo,6) = @Periodo 

select top 10*from usv_regCompras_LE_822 where FechaEmision in('20/03/2025','01/03/2025','31/03/2025')
