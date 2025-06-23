select*from Cp where IDCptoOperacion=1966
----freddy
select*from CptoOperacion where Codigo='C010_PER' AND PKID=1966
----GCI
select*from CptoOperacion where Codigo='C010_PER' AND PKID=1983

------FREDDY
select*from TipoCp where PKID=5777 AND Codigo='PER001'

--GCI 
select*from TipoCp where Codigo='PER001' AND PKID=5371

--update Cp set Anulado=0 where NumCp='FNC5-0000941' and PKID=3024894