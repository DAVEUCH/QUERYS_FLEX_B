SELECT * FROM dbo.fFB_LibroMayor2010_2_SolyDolares(@idPlanCuentas,
@idEjercicio, @idPeriodoInicial, @idPeriodoFinal, @cuentaInicial, @cuentaFinal, @Nivel)

SELECT * FROM dbo.fFB_LibroMayorResumido2010_2(100000035,
@idPeriodoInicial, @idPeriodoFinal, @cuentaInicial, @cuentaFinal, @Nivel)

SELECT * FROM dbo.fFB_LibroMayor2010_2_SolyDolares(3,
100000035,     100000475,       100000475,         '1041202',       '1041202',        6)

select*from PlanCuentas
select*from Ejercicio
select*from Periodo
select top 10 *from CuentaContable where Cuenta=1041202



SELECT  left(CuentaContable.Cuenta,2) as  CCN2Numero,  '' as  CCN2Descripcion,   left(CuentaContable.Cuenta,3) as  CCN3Numero,  '' as  CCN3Descripcion,   
left(CuentaContable.Cuenta,4) as  CCN4Numero, '' as  CCN4Descripcion, 
left(CuentaContable.Cuenta,5) as  CCN5Numero, '' as  CCN5Descripcion, 
CuentaContable.Cuenta as  CCN6Numero, CuentaContable.Descripcion as  CCN6Descripcion,
 dbo.usf_cuentacontable_SaldoIninical(3,1041202,100000035,100000470 ) as CCUNSaldoInicial, 0 as CCUNSaldoInicial_Dolar,
    dbo.VoucherContable.NumCp AS VoucherContableNumero,   
    dbo.VoucherContable.Fecha AS VoucherContableFecha,   
    ISNULL(TipoCp_1.Abreviacion, '') AS VoucherContableComprobanteOrigenTipo,   
    ISNULL(dbo.Cp.NumCp, '') AS VoucherContableComprobanteOrigenNumero,   
    ISNULL(dbo.Cp.Fecha, dbo.VoucherContable.Fecha) AS VoucherContableComprobanteOrigenFecha,   
    dbo.Asiento.Glosa AS AsientoGlosa,   
    dbo.CuentaContable.Cuenta AS CargoAbonoCuentaNumero,   
    dbo.CuentaContable.Descripcion AS CargoAbonoCuentaDescripcion,   
    dbo.CargoAbono.Glosa AS CargoAbonoGlosa,   
    dbo.CargoAbono.Cargo AS CargoAbonoCargo,   
    dbo.CargoAbono.Abono AS CargoAbonoAbono,   
 case CargoAbono.IDMoneda when 2 then dbo.CargoAbono.Cargo - dbo.CargoAbono.Abono 
 else CargoAbono.CargoMonedaDocumento - CargoAbono.AbonoMonedaDocumento end  AS CargoAbonoSaldo, 
    dbo.CargoAbono.CargoMonedaBase AS CargoAbonoCargoMonedaBase,   
    dbo.CargoAbono.AbonoMonedaBase AS CargoAbonoAbonoMonedaBase,   
    dbo.CargoAbono.CargoMonedaBase - dbo.CargoAbono.AbonoMonedaBase AS CargoAbonoSaldoMonedaBase,   dbo.CargoAbono.IDMoneda AS CargoAbonoMonedaID,   
    dbo.Sucursal.Codigo AS CargoAbonoAuxiliarCodigo,   
    dbo.Sucursal.Nombre AS CargoAbonoAuxiliarNombre  
 FROM dbo.VoucherContable INNER JOIN  
    dbo.Asiento ON dbo.VoucherContable.PKID = dbo.Asiento.IDVoucher INNER JOIN  
    dbo.CargoAbono ON dbo.Asiento.PKID = dbo.CargoAbono.IDAsiento INNER JOIN  
    dbo.CuentaContable ON dbo.CargoAbono.IDCuentaContable = dbo.CuentaContable.PKID INNER JOIN  
    dbo.Periodo ON dbo.VoucherContable.IDPeriodo = dbo.Periodo.PKID INNER JOIN  
    dbo.TipoCp ON dbo.VoucherContable.IDTipoCp = dbo.TipoCp.PKID LEFT OUTER JOIN  
    dbo.Cp ON dbo.VoucherContable.IDCp = dbo.Cp.PKID LEFT OUTER JOIN  
    dbo.TipoCp AS TipoCp_1 ON dbo.Cp.IDTipoCp = TipoCp_1.PKID  LEFT OUTER JOIN  
    dbo.Sucursal ON dbo.CargoAbono.IDAuxiliar = dbo.Sucursal.PKID   
 WHERE dbo.VoucherContable.Anulado = 0  
 AND (dbo.Periodo.IDEjercicio = 100000035) 
 AND (dbo.VoucherContable.IDPeriodo BETWEEN 100000470 AND 100000475)    
 AND (CuentaContable.IDPlanCuentas =  3)
 AND (dbo.CuentaContable.Cuenta = 1041202)   