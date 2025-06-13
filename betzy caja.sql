select*from Cp where NumCp='ICM02-0104960'
select*from Cp where NumCp='TCB02-0026488'

SELECT*FROM VoucherContable WHERE NumCp='4-04-2025-0000804'
SELECT*FROM Asiento WHERE IDVoucher=2975892
SELECT*FROM CpCajaEntrada WHERE PKID=2975874
SELECT *FROM ItemCpCajaEntradaSalida  WHERE IDCpCajaEntrada=2975874
SELECT TOP 10*FROM eItemCpCajaEntrada
SELECT*FROM Caja WHERE PKID=48
SELECT *FROM MedioDePago WHERE IDCajaUbicacion=48 and IDPersona=22170

SELECT *FROm CajaTipoMedioDePago where IDCaja=48

SELECT top 10*FROm CpCajaPago2

SELECT top 10*FROm ItemCpCaja where IDPersona=
22170

SELECT top 10*FROm Itemca where IDPersona=
22170
SELECT*FROM TipoCp WHERE PKID=5121

select*from Persona where Nombre like 'R & R%'