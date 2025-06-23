select 
tc.PKID,
TipoCp,
suc.Nombre as Sucursal,
tc.Codigo,
Serie,
Numero as Ultimo_Correlativo,
Descripcion as Nom_Documento,
Abreviacion,
--MaximoNumeroItems,
PeriodoAnulacion as Dias_Anulacion,
--RequiereMotivoAnulacion,
PermitirFechasFuturas,
PermitirFechasDiferidas,
tc.Activo
from TipoCp tc
left join Sucursal suc on suc.PKID=tc.IDSucursal
where tc.Activo=1
order by TipoCp asc

select*from Sucursal 
select top 1*from TipoCp
select top 1*from Contenedor2