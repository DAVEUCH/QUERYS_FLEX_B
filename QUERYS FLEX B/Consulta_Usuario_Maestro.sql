select*from Usuario
select*from UsuarioActividad
select*from UsuarioEmpresa
select*from ConfiguracionContenedores
select*from Contenedor2
select*from Contenedor3
select*from ContenedorConfiguracionVista
select*from ContenedorRaiz

select
usu.IDUsuario,
usu.Nombre as NombreUsu,
em.Nombre as NombreEmp,
em.RazonSocial,
epu.Nombre AS Perfil,
ac.Descripcion
from UsuarioEmpresa uem
left join Usuario usu on usu.PKID= uem.IDUsuario
left join Empresa em on em.PKID=uem.IDEmpresa
left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
left join UsuarioActividad uac on uac.IDUsuario=epu.ID
left join Actividad ac on ac.PKID =uac.IDActividad