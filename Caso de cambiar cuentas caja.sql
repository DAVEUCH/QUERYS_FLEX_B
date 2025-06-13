select*from CptoOperacion where Codigo='CG022'--1960

select top 10*from Cp where IDCptoOperacion=1960 order by PKID desc 

SELECT TOP 5*FROM Cp where NumCp='PSB10-0002561'
SELECT TOP 5*FROM Cp where NumCp='PSB10-0002562'
select *from CpCaja where IDCp=2893031
select *from CpCaja where IDCp=2893042
select*from CpCajaSalida where PKID=2893031
select*from CpCajaSalida where PKID=2893031
select*from Caja where PKID=215
select top 12*from ItemCpCaja
select top 12*from eCpCajaSalida

update Caja set Codigo='1041101' where PKID=215

select*from CuentaContable where Cuenta='1041101' and IDPlanCuentas=3
select*from CuentaContable where Cuenta='1041107' and IDPlanCuentas=3


SELECT TOP 5*FROM Moneda

900017723