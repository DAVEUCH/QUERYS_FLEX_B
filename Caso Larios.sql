select*from Cp where NumeroVerificacion='5350F002-0001413'

select*from Cp where NumCp='F002-0001413'

SELECT top 200 *FROM Auditoria 
--order by PKID desc

WHERE Operacion='Eliminar' and Fecha='2025-05-22'

SELECT TOP 200 *
FROM Auditoria
WHERE Operacion = 'Eliminar'
  AND CONVERT(date, Fecha, 23) = '2025-05-22';

  select*from Usuario where PKID=600163


  SELECT *FROM Usuario where TipoUsuario='PERFIL' and IDUsuario like'VENDEDOR%'
    select *from ePerfilUsuario where 
  IDPerfilUsuario in (4123,400009,400063)
  and IDUsuario not like 'xx%'