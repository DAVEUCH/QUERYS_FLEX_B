--use freddy
Select 
Periodo,
CUO CodigoUnicoOperacion,
NumAsientoCorrelativo NumeroCorrelativoAsiento,
FechaEmision,
TipoComprobantePagoCodigo,
NumSerieDocumento NumeroSerie,
NumeroDocumento Numero,
ValorAdq ValorAdquisicion,
Otros OtrosAdicionales,
ImporteTotal ImporteTotalAdquisicion,
ReferenciaTipoComprobantePago TipoComprobantePagoDua,
ReferenciaNumeroSerie SerieComprobantePago,
AñoDua,
ReferenciaNumero NumeroComprobantePago,
ImpuestoBaseGravada18 MontoRetencionIGV,
CodigoMoneda MonedaCodigo,
TipoDeCambio TimpoCambio,
Pais PaisResidenciaCodigo,
RazonSocial PersonaNombre,
Domicilio DomicilioExtranjero,
NumeroDocIdentidad DocumentoIdentidad,
NumIdent_fiscal NumeroIDentificacionFiscal,
PersonaPaga ApellidosNombresBeneficiario,
paisResi_beni PaisBeneficiario,
Vehiculo VinculoConBeneficiario,
ImporteTotal2 RentaBruta,
Campo DeduccionCostoEnajenacion,
ImporteTotal3 RentaNeta,
Tasa TasaRetencion,
Impuesto ImpuestoRetenido,
Convenio ConveniosEvitarDobleImposicionTabla25,
Exonera ExoneracionAplicadaTabla33,
TipoRenta TipoRentaTabla31,
ModalServi ModalidadServicioPrestadoTabla32,
aplica AplicacionArt76,
'0' AS EstadoAnotacion,
'' AS Vacio
From usv_regCompras_LE_82
WHERE TipoComprobantePagoCodigo <> '21'
and CUO='6-12-2024-0000265'
--and NumSerieDocumento='A074749B' and NumeroDocumento='0007'

select top 10*from cp WHERE numcp='0000012'
select top 10*from cp WHERE numcp='A074749B-0007'
select top 10*from cp WHERE numcp='94556981'
select*from Periodo where PKID=100000491
select top 10*from Persona where Nombre='CAMACHO NAMUCHE, SUSANA MADELEINE' 
update Persona set Extranjero=0 where PKID=68867