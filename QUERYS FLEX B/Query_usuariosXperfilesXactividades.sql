select*from eUsuarioEmpresa

alter VIEW UsuariosXPerfilesXActividades
AS
select
usu.IDUsuario,
usu.Nombre as NombreUsu,
USU.TipoUsuario,
em.Nombre as NombreEmp,
em.RazonSocial,
epu.Nombre AS Perfil,
ac.Descripcion
--from UsuarioEmpresa uem
from Usuario usu
left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
left join eUsuarioEmpresa ue on ue.[Usuarios.IDUsuario]=usu.IDUsuario
left join UsuarioActividad uac on uac.IDUsuario=epu.ID
left join Actividad ac on ac.PKID =uac.IDActividad
WHERE 
usu.IDUsuario NOT LIKE 'XX%'
AND usu.TipoUsuario='USUARIO'
--and IDEmpresa not like 'A620E8E1-16EA-4647-95CE-CE0168542FD3%'
ORDER BY 2
----------------------------
select
usu.IDUsuario,
usu.Nombre as NombreUsu,
USU.TipoUsuario,
--em.Nombre as NombreEmp,
--em.RazonSocial,
epu.Nombre AS Perfil
--ac.Descripcion
--from UsuarioEmpresa uem
from Usuario usu
left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
--left join eUsuarioEmpresa ue on ue.[Usuarios.IDUsuario]=usu.IDUsuario
--left join UsuarioActividad uac on uac.IDUsuario=epu.ID
--left join Actividad ac on ac.PKID =uac.IDActividad
WHERE 
usu.IDUsuario NOT LIKE 'XX%'
AND usu.TipoUsuario='USUARIO'
--and IDEmpresa not like 'A620E8E1-16EA-4647-95CE-CE0168542FD3%'
ORDER BY 2

select *from Usuario
select top 10 *from UsuarioActividad
select top 10 *from Actividad

SELECT
usu.IDUsuario,
usu.Nombre as NombreUsu,
USU.TipoUsuario,
epu.Nombre AS Perfil
FROM eUsuarioEmpresa uem
left join Usuario usu on usu.IDUsuario=uem.IDUsuario
left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
where 
usu.IDUsuario NOT LIKE 'XX%'

select*from Empresa
SELECT*FROM Usuario WHERE IDUsuario='ARAMIREZB'
SELECT*FROM UsuarioEmpresa WHERE IDUsuario=600192
--usu.IDUsuario='SCONTRERASJ'
--usu.IDUsuario='KNORIEGAO'
and em.Nombre='Freddy'
  and usu.IDUsuario LIKE 'EMEDINAR'
  AND epu.Nombre IS NOT NULL
  AND epu.Nombre <> ''
  and em.Nombre NOT LIKE 'Freddy%'
  --and em.Nombre NOT LIKE 'GCI%'
  and em.Nombre NOT LIKE 'IMRECASA%'
  go
SELECT*FROM UsuariosXPerfilesXActividades

  ------VISTA USUARIOSUsuarios

  create VIEW UsuariosXPerfilesXActividades
AS
select
usu.PKID,
usu.IDUsuario,
usu.Nombre as NombreUsu,
em.Nombre as NombreEmp,
em.RazonSocial,
epu.Nombre AS Perfil,
usu.TipoUsuario,
ac.Descripcion
from UsuarioEmpresa uem
left join Usuario usu on usu.PKID= uem.IDUsuario
left join Empresa em on em.PKID=uem.IDEmpresa
left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
left join UsuarioActividad uac on uac.IDUsuario=epu.ID
left join Actividad ac on ac.PKID =uac.IDActividad
WHERE
em.Nombre not like 'GCI%'
--and em.Nombre not like 'IMRECASA%'
AND
usu.IDUsuario='SROSASL'
--AND usu.TipoUsuario='USUARIO'
order by 2
--usu.IDUsuario='RQUISPEF'
--usu.IDUsuario='APAYANOR'
select*from UsuarioEmpresa where IDUsuario=200020
select*from UsuarioEmpresa where IDUsuario=600213
delete from UsuarioEmpresa where IDUsuario=600213 and PKID='4CD5EDD4-68F6-480F-8E1B-A288F8360085    '

 and usu.IDUsuario NOT LIKE 'USERPRUEBA%'
AND usu.IDUsuario NOT LIKE 'TESTUSER%'
AND usu.IDUsuario NOT LIKE 'SEGURIDAD%'
AND usu.IDUsuario NOT LIKE 'WCARHUAMACAP%'
AND usu.IDUsuario NOT LIKE 'JSISTEMAS%'
AND usu.IDUsuario NOT LIKE 'DDDDDDDDDDDDDD%'
AND usu.IDUsuario NOT LIKE 'EARMAST%'
AND usu.IDUsuario NOT LIKE 'AMONTES%'
AND usu.IDUsuario NOT LIKE 'NRIVERAC%'
AND usu.IDUsuario NOT LIKE 'DCASAHUAMANJ%'
AND usu.IDUsuario NOT LIKE 'JCHIRINOSA%'
AND usu.IDUsuario NOT LIKE 'ICASTROS%'
AND em.Nombre NOT LIKE 'IMRECASA%'
AND usu.Nombre not like 'XX%'
AND epu.Nombre IS NOT NULL
AND epu.Nombre <> ''

----------------------------------------------

select*from eUsuarioEmpresa

  select*from UsuariosXPerfilesXActividades
--WHERE epu.Nombre='CONTADORA JUNIOR' AND em.RazonSocial='GCI'
--WHERE usu.IDUsuario='CCAMACHON' 

AND em.RazonSocial='Freddy'
ORDER BY AC.Descripcion

select*from Usuario

SELECT*FROM ePerfilUsuario WHERE Nombre='CONTADORA JUNIOR'

and ac.Descripcion like '%Eliminar%' and uac.IDActividad='CFC6D45A-DEBF-49D0-B54F-715241FF71A9    '


AND usu.IDUsuario NOT LIKE 'X%' and usu.Nombre not like 'UNIFLEX%' and ac.Descripcion like '%Eliminar Cp Caja Entrada%'




select*from UsuarioEmpresa
select*from Usuario where IDUsuario='JGUZMANC'
--select*from Empresa
select*from ePerfilUsuario WHERE ID=4117
------------------------------
SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA
left join Actividad ac on ac.PKID =UA.IDActividad
where IDUsuario=4117 and  ac.Descripcion= ''
----------------------------
select*from Actividad
select*from usuario

--SELECT*FROM UsuarioActividad where IDActividad in (
--select uac.IDActividad
--from UsuarioEmpresa uem
--left join Usuario usu on usu.PKID= uem.IDUsuario
--left join Empresa em on em.PKID=uem.IDEmpresa
--left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
--left join UsuarioActividad uac on uac.IDUsuario=epu.ID
--left join Actividad ac on ac.PKID =uac.IDActividad
--WHERE usu.IDUsuario='PGONZALEZN' and ac.Descripcion like '%Eliminar%'
--)

--delete from UsuarioActividad where PKID=   '55BCC0A0-1B0C-4A02-A9E5-14738B657F50      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '2E55A505-2818-4967-96E7-51ED5FC00414      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '7F1D3237-70C3-4B4A-BD8E-3C9DD7E04DB8      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '58B7BE01-DBD4-4E70-BAF4-1375C1AE56CB      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '06E30384-80C6-4652-9B7D-81DD3F950371      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '3A175722-6DEF-4B08-9E74-2EE01886AAD1      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'D68E6E7D-1F01-4A11-8CCC-F9BADA672887      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '1C430343-8976-402C-AE0B-7345BB501F2F      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '3A51071C-AA0C-4D2D-9A33-7E424E9F6C8A      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '0FEE1D05-8929-4A87-AFCD-12B97E186680      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'E4441E4F-3A6C-4FB0-9EDD-63CD16B88B0B      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '83A0A802-FFF9-49A5-970E-9DE125695F8F      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '48B7F832-75DB-4722-A556-E76B9280C530      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '0983EF67-3219-4DAD-935E-10F231BDA2D9      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'CB8BB524-4917-410F-8A66-50409356FEBD      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '3E1EDE42-7714-4E58-8980-75B9FC6EE093      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '6D57B295-289C-4877-A246-6573DA664CDF      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'F78CDDF5-DB6E-4B22-82D3-A2B048F6AC45      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'F4AB04B1-A054-43F6-87DC-4EFC81F395F6      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '081909D3-C324-450E-A877-6C9DCDA39B17      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'D6482F7D-17BE-477E-B334-E8942ADE0DCE      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'E5CB8932-48EA-4A6C-90B0-49E7866D11A1      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '3F1F031C-DFB4-4E76-8246-C3A543E5F8F0      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '8B4639BF-2BEC-44D0-84DD-5519B339679E      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'C9E4319B-49A5-4497-AC62-1D6F5D3F0925      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'F9FBAACA-C6DD-4BDB-B0E8-A5C7095BE323      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'F3980F2E-6687-4AB3-B1A9-CCCD5108D748      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '62DC6368-B5F7-4E36-ABE2-22160D6C8DEE      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '2BE74429-A5FF-4960-B950-FD3C53D86287      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'E37F2C88-B2BA-4214-9D59-3AD1DB793C34      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'BE869F31-D677-4EA4-8E64-3B0BFE292A1D      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'C201CBC4-57AD-4156-B793-8890835AB8F0      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '00BF40A3-54B1-4DCB-85E2-8246E01C149D      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   'E776015F-A862-4D96-AC5D-D32E7E42A2ED      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '150A466E-09C9-44AD-BBA3-59C28590ABEA      '  and IDUsuario='4117'
--delete from UsuarioActividad where PKID=   '789B270D-88DD-475E-A423-74EC1E2D5B2A      '  and IDUsuario='4117'

--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear cp inventario de transferencia                                                                 '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear cp inventario de entrada                                                                       '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Desaprobar Orden Compra                                                                              '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar Tipo Nota Debito                                                                           '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Copiar Tipo de nota de débito                                                                        '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar tipo de cambio por fecha                                                                   '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear rango aprobacion orden compra                                                                  '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar Cp Inventario Transferencia                                                                '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear cp inventario de salida                                                                        '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar canje letras3                                                                              '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar canje letras                                                                               '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Generacion Cp Inventario Entrada Desde Nota Credito                                                  '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Cancelar Orden Compra                                                                                '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar orden de compra                                                                            '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear PedidoOmitirPoliticaCredito                                                                    '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear tipo de cambio fecha                                                                           '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear Canje Letras3                                                                                  '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar Nota Debito                                                                                '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'ConvertirClienteAEmpleado                                                                            '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear Cp Caja Entrada                                                                                '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear Canje Letras                                                                                   '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Modificar Cp Inventario Entrada                                                                      '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear Tipo de nota de débito                                                                         '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Aprobar Orden Compra                                                                                 '
--SELECT UA.PKID,UA.IDUsuario,IDActividad,ac.Descripcion FROM UsuarioActividad UA left join Actividad ac on ac.PKID =UA.IDActividad where IDUsuario=4117 and  ac.Descripcion= 'Crear Tipo de nota de crédito                                                                        '



