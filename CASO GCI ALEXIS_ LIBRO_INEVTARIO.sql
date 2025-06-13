SELECT * FROM dbo.fFB_BalanceComprobacion2010_2(3,100000036, left(100000484,2), 7, 6)
WHERE SaldoInicialCargo + SaldoInicialAbono + MovimientosCargo + MovimientosAbono > 0
and CuentaNumero='4011101'

SELECT * FROM dbo.fFB_BalanceComprobacion2010_2(@PlanC3uenta, @idEjercicio, left(@PeriodoMes,2), @CuentaNumeroDigitos, @CuentaNivel)
WHERE SaldoInicialCargo + SaldoInicialAbono + MovimientosCargo + MovimientosAbono > 0

select  IDCuentaContable, SaldoAbono,SaldoCargo  from SaldoPeriodoCuentaContable where IDCuentaContable=900015741 and IDPeriodo=100000484

select  IDCuentaContable, SaldoAbono,SaldoCargo from v_SaldoPeriodoCuentaContable where IDCuentaContable=900015741 and IDPeriodo=100000484

create view usp_SaldoPeriodoCuentaContable
as 
SELECT 
    spcc.IDCuentaContable,
    spcc.IDPeriodo,
    spcc.SaldoAbono,
    spcc.SaldoCargo,
    spcc.SaldoAcumuladoAbono,
    spcc.SaldoAcumuladoCargo,
    spcc.SaldoAbono2,
    spcc.SaldoCargo2,
    (v.usp_Sumatoria_IGV - spcc.SaldoCargo) AS Resultado
FROM SaldoPeriodoCuentaContable spcc
CROSS JOIN usp_Sumatoria_IGV v;
end

select*from Periodo 

select top 10*from CuentaContable where Cuenta='4011101'

SELECT * FROM dbo.fFB_LibroMayor2010_2_SolyDolares(3, 100000036, 100000484, 100000484, 4011101, 4011101, 6)
 
select NumCp,ValorAfecto,ValorInafecto, ValorVenta,Total-ValorAfecto as IGV,Total from cp where IDTipoCp=5363

--NumCp='COM-0000001'


select
Fecha,
NumCp, 
ValorAfecto,
IIF(ValorAfecto=0,0,total-ValorAfecto ) as IGV,
Total
from Cp where IDTipoCp=5363


create view usp_Sumatoria_IGV
AS
SELECT SUM(IIF(ValorAfecto = 0, 0, Total - ValorAfecto)) AS Sumatoria_IGV
FROM Cp 
WHERE IDTipoCp = 5363;

------esta es la vista que corresponde que se creo correctamente 
CREATE VIEW v_SaldoPeriodoCuentaContable
AS 
SELECT 
    spcc.IDCuentaContable,
    spcc.IDPeriodo,
    spcc.SaldoAbono,
    spcc.SaldoCargo,
    spcc.SaldoAcumuladoAbono,
    spcc.SaldoAcumuladoCargo,
    spcc.SaldoAbono2,
    spcc.SaldoCargo2,
    (usp.Sumatoria_IGV - spcc.SaldoCargo) AS Resultado
FROM SaldoPeriodoCuentaContable spcc
CROSS JOIN usp_Sumatoria_IGV usp;
