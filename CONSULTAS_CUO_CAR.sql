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
(convert(date,FechaOperacion,103) BETWEEN '2025-02-01' AND '2025-02-28')
--and Glosa='Por los gastos de percepcion'
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
 IDPeriodo = 100000494
Group by
 Periodo,
 CodigoOperacion,
 NumeroCorrelativo,
 CodigoPlanCuentas,
 CodigoCuentaContable,
 FechaOperacion,
 Glosa,
 CorrelativoRegistroVentas,
 CorrelativoRegistroCompras,
 CorrelativoRegistroConsignaciones,
 EstadoOperacion,
 --NumeroCAR,
 --Cod_tipcom,
 CampoLibre
Having
 Sum(Convert(decimal(14,2),Debe)) - Sum(Convert(decimal(14,2),Haber)) <> 0
Order By
 CodigoCuentaContable, 
 CONVERT(date,FechaOperacion), 
 CodigoOperacion
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