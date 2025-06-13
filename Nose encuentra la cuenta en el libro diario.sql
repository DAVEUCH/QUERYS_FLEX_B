USE [FREDDY]
SELECT * FROM dbo.fFB_LibroMayor2010_2(3, 100000035, 100000480, 100000491, 6799110 , 6799110 , 6)
SELECT * FROM dbo.fFB_LibroMayor2010_2(@idPlanCuentas, @idEjercicio, @idPeriodoInicial, @idPeriodoFinal, @cuentaInicial, @cuentaFinal, @Nivel)

select*from CuentaContable where Cuenta=6799110 and IDPlanCuentas=3

select*from CuentaContable where Cuenta=6799102 and IDPlanCuentas=3

select*from CuentaContable where Cuenta like '67%'
--SELECT * FROM dbo.CargoAbono AC
--WHERE IDCuentaContable = (SELECT PKID FROM dbo.CuentaContable WHERE Cuenta = '6799110')
--  AND ID BETWEEN @idPeriodoInicial AND @idPeriodoFinal

--------------------------------------------------------------------------------------------
SELECT vc.PKID,vc.NumCp, vc.IDPeriodo,pe.Descripcion, ca.IDCuentaContable,cc.Cuenta,IDPlanCuentas,cc.Descripcion,vc.Anulado
FROM VoucherContable vc  
LEFT JOIN Asiento asi ON asi.IDVoucher = vc.PKID  
LEFT JOIN CargoAbono ca ON ca.IDAsiento = asi.PKID  
LEFT JOIN CuentaContable cc on cc.PKID=ca.IDCuentaContable
left join Periodo pe on pe.PKID=vc.IDPeriodo
WHERE ca.IDCuentaContable IN (SELECT PKID FROM CuentaContable WHERE Cuenta = '6799110')  
AND vc.IDPeriodo BETWEEN 100000480 AND 100000491
order by pe.Descripcion asc

select*from Periodo
select*from dbo.SaldoPeriodoCuentaContable where IDCuentaContable=900018992 and IDPeriodo BETWEEN 100000480 AND 100000491
select*from dbo.SaldoPeriodoCuentaContable where IDCuentaContable=900017692 and IDPeriodo BETWEEN 100000480 AND 100000491


select top 10 *from CargoAbono
select *from LibroAuxiliar
select top 1 *from dbo.Asiento
select top 1 *from dbo.VoucherContable
select*from Periodo