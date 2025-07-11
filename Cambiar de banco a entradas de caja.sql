select*from Cp where NumCp='ICM06-0082997'
SELECT*FROM CpCajaEntrada where PKID=3036899
select top 1*from ItemCpCajaEntradaSalida where IDItemCp=3036899
select*from Persona where DocIdentidad='20102984669' 577
select*from Banco
select * from MedioDePago where IDPersona=577 and Total='450.00' --2

update MedioDePago set IDBanco=4 where IDPersona=577 and Total='450.00'
