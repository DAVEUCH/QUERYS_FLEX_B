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
Where Left(Periodo,6) = '20250300' 

select top 10*from usv_regCompras_LE_822 where FechaEmision in('20/03/2025','01/03/2025','31/03/2025')
select*from Persona where Nombre like 'COOLING%'
select top 10*from usv_regCompras_LE_822 where FechaEmision in('20/03/2025','01/03/2025','31/03/2025')
select top 10*from usv_regCompras_LE_822 where FechaEmision in('22/04/2025')
select *from usv_regCompras_LE_822 where Periodo=20250500
select top 10*from  proveedorext_codpais where idProveedor=61409
insert into proveedorext_codpais (idProveedor,codPais)values
(69628,'9249')

select*from Cp where NumCp='919-0000377' and PKID=3007568
update Cp set Observacion='PEDIDO TAKANA / BO OCI25-0000006  / OCI25-0000018- USA
DUA: 118-2025-10-206141-01-6-00' where NumCp='919-0000377' and PKID=3007568
select *from Cp where NumCpContable='1-05-2025-0000012'
update Cp set Observacion='PEDIDO TAKANA / BO OCI25-0000006  / OCI25-0000018- USA
DUA: 118-2025-10-206141-01-6-00' where NumCpContable='1-05-2025-0000012' --USA
select*from TipoCp where PKID=4867
select *from Cp where NumCpContable='1-05-2025-0000012'
