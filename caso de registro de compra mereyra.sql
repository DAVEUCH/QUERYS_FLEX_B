--SELECT*FROM Cp WHERE NumCp='E001-0008037' AND PKID=2852297
--select*from cp where NumCp='F001-0025641'
SELECT *FROM Cp 
WHERE NumCp='F001-0026051' AND PKID=2914359
--update Cp set NumCp='F100-00045844' where PKID=2899156
--select*from Periodo where PKID in (100000490,100000491)
--update cp set IDPeriodo=100000490  where PKID=2889484
--SELECT *FROM Cp 
--WHERE NumCp='F001-0025203' AND PKID=2867235
--SELECT*FROM Cp WHERE NumCp='E001-0008059' AND PKID=2852720

--and  PKID=2854015
--SELECT*FROM Cp WHERE NumCp='F001-0024806'

--UPDATE Cp set NumCp='E001-0008015' where PKID=2847566

update Cp set
FechaEmision='2025-11-01',
Fecha='2025-11-01',
Hora='2025-11-01 13:40',
FechaTipoCambio='2025-11-01',
TipoCambio='3.7620'
where NumCp='F001-0026051' AND PKID=2914359

--SELECT TOP(100)*FROM Cp 
--3.722000

select top 10*from VoucherContable order by PKID desc

SELECT *FROM Cp 
WHERE  PKID=2903619
select*from VoucherContable
where 
--PKID=2889484 
--and
NumCp='1-01-2025-0000064'  

select*from VoucherContable where NumCp='1-12-2024-0000041'
select*from Asiento where IDVoucher=2903619
select*from CargoAbono where IDAsiento=6106714
UPDATE CargoAbono SET IDMoneda=1 WHERE IDAsiento=6106714
--select*from CargoAbono where IDAsiento=6083504
--select top 1*from CpCob
--update VoucherContable set NumCp='1-11-2024-0000226' where PKID=2889484
--update Cp set NumCpContable='1-11-2024-0000226' where PKID=2889484

update VoucherContable
set
Fecha='2025-11-01',
FechaTipoCambio='2025-11-01',
TipoCambioFecha='3.762' 
where PKID=2914359