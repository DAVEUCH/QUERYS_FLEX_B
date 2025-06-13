select	u.Nombre as Perfil
		,a.Nombre
		,a.Descripcion
		,*
from Usuario u
left	join UsuarioActividad ua on u.PKID = ua.IDUsuario
left	join Actividad a on ua.IDActividad = a.PKID
order by 1


select * from Usuario
where	TipoUsuario = 'PERFIL'

SELECT * FROM UsuarioActividad order by 2