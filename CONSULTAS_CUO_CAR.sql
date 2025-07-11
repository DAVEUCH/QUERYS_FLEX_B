SELECT        Periodo, CAR,NumAsientoCorrelativo, FechaEmision, FechaVencimiento, TipoComprobantePagoCodigo, NumSerieDocumento, AñoDUA, 
   NumeroDocumento, ' ' AS NumeroFinal, TipoDocIdentidad, NumeroDocIdentidad, RazonSocial, BaseGravada14, ImpuestoBaseGravada14, BaseGravada16,
   ImpuestoBaseGravada16, BaseGravada18, ImpuestoBaseGravada18, ValorNoGravada, ValorISC, ValorICB, ValorOtrosCargos, ImporteTotal, 
                       CodigoMoneda,
    TipoDeCambio, ReferenciaFechaEmision, ReferenciaTipoComprobantePago, ReferenciaNumeroSerie, CodigoDUA, ReferenciaNumero,
                ComprobanteDetraccionFechaEmision, ComprobanteDetraccionNumero, MarcaDocumentoSujetoRetencion, 
                         ClasificacionBienesServicios,
                CampoLibre as IdentificacionContrato, '1' AS ErrorTC, '1' AS ErrorTP, '1' AS ErrorTP2, '1' AS ErrorDNI, '1' AS IndicadorTCP, 
                EstadoIdentificaAnotacion, CampoLibre
FROM         [LibrosElectronicos].[RegistroCompras](100000496)
SELECT*FROM Periodo WHERE PKID=100000496

SELECT*FROM Cp WHERE NumCp='FI01-14132755'
----------------------------------------------------------------------------------------------------------------------------------------

SELECT     Periodo, NumeroOperacion, CAR,NumeroCorrelativo, FechaEmision, FechaVencimiento, TipoComprobantePagoCodigo, NumeroSerie, Numero,
   Campo9, TipoDocumentoIdentidadCodigo, ClienteDocumentoIdentidad, ClienteNombre, ValorExportacion, BaseImponible, 
   DescBaseimponible,  ValorIGV, 0 DsctoIGV,
   ValorExonerado, ValorInafecto, ValorISC, 
         BaseImponibleArrozPilado, ValorIGVArrozPilado, ValorICB, ValorOtrosCargos, Total, 
CodigoMoneda,
  TipoDeCambio, ReferenciaFechaEmision, ReferenciaTipoComprobantePagoCodigo, 
                      ReferenciaNumeroSerie, ReferenciaNumero, 
       IdentificacionContratoJV,
       ErrorTC, IndicadorTCP,
        Estado, CampoLibre
FROM         LibrosElectronicos.RegistroVentas (100000494)

----------------------------------LE5.1 REGISTRO LIBRO DIARIO EXPORTABLE---------------------------------------------------------------------------------------------

SELECT     Periodo, 
CodigoOperacion,
NumeroCAR,
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
CASE WHEN 
SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Debe)) - SUM(CONVERT(decimal(16, 2), Haber))) 
ELSE '0.00' END AS Debe, 
CASE WHEN SUM(CONVERT(decimal(16, 2), Haber)) - SUM(CONVERT(decimal(16, 2), Debe)) > 0 THEN 
CONVERT(varchar(15), SUM(CONVERT(decimal(16, 2), Haber)) 
- SUM(CONVERT(decimal(16, 2), Debe))) ELSE '0.00' END AS Haber, 
CorrelativoRegistroVentas,CorrelativoRegistroCompras, 
CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001_v2
WHERE    
--(convert(date,FechaOperacion,103) BETWEEN '2025-03-01' AND '2025-03-31')
--and Glosa='Por los gastos de percepcion'
CodigoOperacion='4-03-2025-0001832'
GROUP BY Periodo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
,NumeroCAR
,CodigoOperacion
HAVING      (SUM(CONVERT(decimal(16, 4), Debe)) - SUM(CONVERT(decimal(16, 4), Haber)) <> 0)
ORDER BY CONVERT(date, FechaOperacion)

select*from Cp where NumCp='FN01-29019087'
FN01-00029019087
select*from VoucherContable where NumCp='01-2025-5059-TAM09-0053059'
select*from TipoCp where PKID in(5209,5199,5691,4867)
select *from Cp where NumCpContable='6-01-2025-0000232'
select*from cp where NumCpContable='1-01-2025-0000014'
select*from CptoOperacion where PKID=1869
select*from TipoCp where PKID in(5209,5199,5691,4867,5220,5199,5704,5003)
select*from cp where NumCpContable='1-01-2025-0000274'
select*from Persona where Nombre like 'PROVEEDORES%'
select*from Persona where Nombre like 'CAMACHO%' 11291
select *from Cp where NumCpContable='6-01-2025-0000232'
select*from Persona where PKID=11291
select*from TipoComprobantePago where PKID=100000010
select*from TipoCp where IDTipoComprobantePago=1
update Cp set NumCp='01470935' where PKID=2909497

update Cp set NumCp='0000000013' where PKID=2927518 --0000013

SELECT*FROM CP  where PKID=2927518

---gci
SELECT     Periodo, 
CodigoOperacion, 
NumeroCorrelativo, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, Glosa, 
                      CASE WHEN SUM(CONVERT(decimal(14, 2), Debe)) - SUM(CONVERT(decimal(14, 2), Haber)) > 0 THEN CONVERT(varchar(15), SUM(CONVERT(decimal(14, 2), Debe)) 
                      - SUM(CONVERT(decimal(14, 2), Haber))) ELSE '0.00' END AS Debe, CASE WHEN SUM(CONVERT(decimal(14, 2), Haber)) - SUM(CONVERT(decimal(14, 2), Debe)) 
                      > 0 THEN CONVERT(varchar(15), SUM(CONVERT(decimal(14, 2), Haber)) - SUM(CONVERT(decimal(14, 2), Debe))) ELSE '0.00' END AS Haber, CorrelativoRegistroVentas,
                       CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones, EstadoOperacion, CampoLibre
FROM         dbo.vrpte_LE_LibroDiario2010_001
WHERE    IDPeriodo  = @Periodo 
GROUP BY Periodo, CodigoOperacion, CodigoPlanCuentas, CodigoCuentaContable, FechaOperacion, EstadoOperacion, CampoLibre, NumeroCorrelativo, Glosa, 
                      CorrelativoRegistroVentas, CorrelativoRegistroCompras, CorrelativoRegistroConsignaciones
HAVING      (SUM(CONVERT(decimal(14, 2), Debe)) - SUM(CONVERT(decimal(14, 2), Haber)) <> 0)
ORDER BY CONVERT(date, FechaOperacion), CodigoOperacion




----------------------------------------------------------------------------

Select 
 Periodo,
 NumeroCAR,
 --Cod_tipcom,
 NumeroCorrelativo,
 CodigoPlanCuentas,
 CodigoCuentaContable,
 FechaOperacion,
 Glosa,
 Case When Sum(Convert(decimal(14,2),Debe)) - Sum(Convert(decimal(14,2),Haber)) > 0 Then Convert(varchar(15),Sum(Convert(decimal(14,2),Debe)) - Sum(Convert(decimal(14,2),Haber))) Else '0.00' End AS Debe,
 Case When Sum(Convert(decimal(14,2),Haber)) - Sum(Convert(decimal(14,2),Debe)) > 0 Then Convert(varchar(15),Sum(Convert(decimal(14,2),Haber)) - Sum(Convert(decimal(14,2),Debe))) Else '0.00' End AS Haber,
 CorrelativoRegistroVentas,
 CorrelativoRegistroCompras,
 CorrelativoRegistroConsignaciones,
 EstadoOperacion,
 CampoLibre
From
 vrpte_LE_LibroMayor2010_001
Where
 --IDPeriodo = 100000494
 NumeroCAR='4-03-2025-0001832'
Group by
 Periodo,
 --CodigoOperacion,
 NumeroCorrelativo,
 CodigoPlanCuentas,
 CodigoCuentaContable,
 FechaOperacion,
 Glosa,
 CorrelativoRegistroVentas,
 CorrelativoRegistroCompras,
 CorrelativoRegistroConsignaciones,
 EstadoOperacion,
 NumeroCAR,
 --Cod_tipcom,
 CampoLibre
Having
 Sum(Convert(decimal(14,2),Debe)) - Sum(Convert(decimal(14,2),Haber)) <> 0
Order By
 CodigoCuentaContable, 
 CONVERT(date,FechaOperacion)
 --,CodigoOperacion
 --)
select*from Periodo where PKID=100000494

select top 10*from Persona

DocIdentidad
00000000

---------------------REGISTRO DE COMPRAS------------------------------

SELECT * FROM vrpteRegistroCompras2010 where ZonaCodigo='1-03-2025-0000260'
SELECT*FROM Cp where NumCpContable='1-03-2025-0000260'
select*from CpCobrarPagar where PKID=2970382
select*from VoucherContable where NumCp='1-03-2025-0000260'
select*from Asiento where IDVoucher=2970382
select 
CA.PKID,
IDAsiento,
IDCuentaContable,
CC.Descripcion,
CC.Cuenta,
CC.PKID AS ID_CUENTA,
IDAuxiliar,
Cargo,
Abono,
CargoMonedaBase,
AbonoMonedaBase,
Glosa,
CargoMonedaDocumento,
AbonoMonedaDocumento
from CargoAbono CA
LEFT JOIN CuentaContable CC ON CC.PKID=CA.IDCuentaContable
where IDAsiento=6254987
-----------------LIBRO DIARIO

SELECT * FROM vrpteLibroDiario2010 where VoucherContablePeriodoID=100000494


--------LIBRO MAYOR ------

SELECT * FROM dbo.fFB_LibroMayor2010_2(@idPlanCuentas, @idEjercicio, @idPeriodoInicial, @idPeriodoFinal, @cuentaInicial, @cuentaFinal, @Nivel)
SELECT * FROM dbo.fFB_LibroMayor2010_2(3, 100000035, 100000494, 100000494, '4212101', '4212101', 6) --673

select*from Periodo where PKID=100000497
select*from PlanCuentas where PKID=3
select*from Ejercicio where PKID=100000035

--------------------------------------------LE 8.2 [CR.v1] LE8.2 REGISTRO DE COMPRAS - SUJETOS NO DOMICILIADOS

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
    WHEN RazonSocial IN ('WHATICKET LLC', 'CAMACHO NAMUCHE SUSANA MADELEINE','FEDERAL MOGUL CORP.','BANA HOSTING') 
    THEN '' 
    ELSE ReferenciaTipoComprobantePago 
  END AS TipoComprobantePagoDua,

  CASE 
    WHEN RazonSocial IN ('WHATICKET LLC', 'CAMACHO NAMUCHE SUSANA MADELEINE','FEDERAL MOGUL CORP.','BANA HOSTING') 
    THEN '' 
    ELSE ReferenciaNumeroSerie 
  END AS SerieComprobantePago,
    CASE 
    WHEN RazonSocial IN ('WHATICKET LLC', 'CAMACHO NAMUCHE SUSANA MADELEINE','FEDERAL MOGUL CORP.','BANA HOSTING') 
    THEN '' 
    ELSE AñoDua 
  END AS AñoDua,
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
AND Periodo='20250600'
and RazonSocial='FABRICA COLOMBIANA DE REP. AUTOMOT. S.A.'


----PROVEEDOR NO TIENE PAIS

select TOP 10*from Persona where Nombre LIKE 'ZF SERVICES%'

insert proveedorext_codpais (idProveedor,codPais) values
(65731,'9169')

select top 10*from proveedorext_codpais where idProveedor=65731

---------- no sale NumeroComprobantePago en el 8.2 ----
---DUA
select*from Cp where NumCp='235-2025-10-097429' --'COLOMBIA  DUA: 235-2025-10-097429-01-8-00'
update Cp set Observacion='COLOMBIA  DUA: 235-2025-10-097429-01-8-00' where PKID=3025064
--GUIA
select*from Cp where NumCp='TAD09-0000606' 
update Cp set Observacion='COLOMBIA  DUA: 235-2025-10-097429-01-8-00' where PKID=3025026
---FACTURA
select*from Cp where NumCp='097429' --COLOMBIA - 457 KG / 14 BULTOS  DUA: 235-2025-10-097429-01-8-00
update Cp set Observacion='COLOMBIA - 457 KG / 14 BULTOS  DUA: 235-2025-10-097429-01-8-00' where PKID=3028789

------abres la factura, lo de arriba solo utliza el query
select*from Cp where NumCp='097429'    -----COLOMBIA  DUA: 235-2025-10-097429-01-8-00
update Cp set Observacion='COLOMBIA DUA: 235-2025-10-097429-01-8-00' where PKID=3025533
select*from Cp where NumCp='NCF13001' 
select*from Cp where NumCp='EXA00721' 
select*from Cp where NumCp='OCI25-0000015' 
update Cp set Observacion='COLOMBIA DUA: 235-2025-10-097429-01-8-00' where PKID=2964177