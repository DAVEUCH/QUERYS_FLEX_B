select*from cp where NumCp like '%605' order by Fecha desc
select*from cp where Fecha='2025-04-01' and NumCp like '%605'

SELECT *FROM Filtro WHERE IDUsuario=600239
DELETE FROM Filtro WHERE PKID=600110471
SELECT*FROM Usuario WHERE IDUsuario='LTORRESO'
select top 10*from Filtro
select *from FiltroCondicion where IDFiltro  in (
600110466,
600110467,
600110468,
600110469,
600110470,
600110471)
SELECT *FROM Filtro WHERE IDUsuario=600127
SELECT top 10 *FROM ItemConfiguracionVistaFiltro where IDUsuario=600127
select top 10*from ConfiguracionVista where PKID='107'
select *from FiltroCondicion where IDFiltro  in (600106833)
DELETE FROM FiltroCondicion WHERE PKID=700511843
DELETE FROM FiltroCondicion WHERE PKID=700511846
DELETE FROM FiltroCondicion WHERE PKID=700511930

--UPDATE FiltroCondicion SET OperadorLogico='Y' WHERE PKID=700511843

SELECT*FROM Persona WHERE PKID=2028

--INSERT INTO FiltroCondicion (PKID	,IDFiltro	,RutaCaracteristicaEstructural,	Condicion	,ValorSQL	,Valor,	OperadorLogico,	RutaAtributoBusqueda) VALUES
--(700511843,	600110468,	'Persona',	'=',	2028	,'OF & A SAC','',		'Nombre')

--INSERT INTO FiltroCondicion (PKID	,IDFiltro	,RutaCaracteristicaEstructural,	Condicion	,ValorSQL	,Valor,	OperadorLogico,	RutaAtributoBusqueda) VALUES
--(700511846,	600110471	,'Fecha',	'=',	'2/06/2025',	'2/06/2025','',''		)
