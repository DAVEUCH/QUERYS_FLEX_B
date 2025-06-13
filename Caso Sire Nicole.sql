select*from Cp where NumCpContable in ('6-02-2025-0000202',
'6-02-2025-0000243')
select*from Persona where PKID in(11291,68867)

select*from Cp where NumCp='919-0000368' and PKID=2949733 --1-02-2025-0000063
--USA - MBL MYAUSMIA01625 - 441.76 KG / 3.91 CBM / 16 BULTOS  DUA: 118-2025-10-080012 -01-5-00   PERCEP --------------- S/. 4662.00
-----------------------------------
select*from Cp where NumCp='21196349'
--USA - MBL MYAUSMIA01625 - 441.76 KG / 3.91 CBM / 16 BULTOS  DUA: 118-2025-10-080012 -01-5-00   PERCEP --------------- S/. 4662.00
--USA - MBL MYAUSMIA01625 - 441.76 KG / 3.91 CBM / 16 BULTOS
update Cp set Observacion='3ER INTERES GENERADO POR CONTRATO MUTUO  4TO INTERES GENERADO POR CONTRATO MUTUO' where PKID=2948857

select*from CpImportacion2 where PKID in(2935707,
2935713,
2935745)

select top 10*from ItemCpImportacion2
select*from Persona where PKID=8297

select*from TipoCp where PKID=5704

SELECT  Cp_1.PKID, dbo.fFB_LE_ObtenNroDUA(Cp_1.PKID)
FROM Cp Cp_1
WHERE EXISTS (
  SELECT 1 FROM TipoComprobantePago WHERE Codigo = '91'
)
and PKID in(2935707,
2935713,
2935745)

sp_helptext 'dbo.fFB_LE_ObtenNroDUA'

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.fFB_LE_NumeroDocumento'))


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
and Periodo=20250200

SerieComprobantePago
118

TipoComprobantePagoDua
50


SELECT 
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
  CASE 
    WHEN RazonSocial IN ('WHATICKET LLC', 'CAMACHO NAMUCHE SUSANA MADELEINE') 
    THEN '' 
    ELSE ReferenciaTipoComprobantePago 
  END AS TipoComprobantePagoDua,

  CASE 
    WHEN RazonSocial IN ('WHATICKET LLC', 'CAMACHO NAMUCHE SUSANA MADELEINE') 
    THEN '' 
    ELSE ReferenciaNumeroSerie 
  END AS SerieComprobantePago,
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
FROM usv_regCompras_LE_82
WHERE TipoComprobantePagoCodigo <> '21'
and Periodo=20250200