create PROCEDURE sp_ActualizarxActividadesxUsuario
    @IDUsuario INT,       
    @IDActividad NCHAR(40), 
    @Accion VARCHAR(10)    
AS
BEGIN
    DECLARE @NewPKID NCHAR(40); 

    -- Generar un nuevo GUID para el PKID
    SET @NewPKID = CONVERT(NCHAR(40), NEWID());

    -- Iniciar una transacción para asegurar la consistencia de los datos
    BEGIN TRY
        BEGIN TRANSACTION

        IF @Accion = 'AGREGAR'
        BEGIN
            -- Verificar si la actividad ya existe para el usuario
            IF NOT EXISTS (SELECT * FROM UsuarioActividad WHERE IDUsuario = @IDUsuario AND IDActividad = @IDActividad)
            BEGIN
                -- Insertar la actividad para el usuario
                INSERT INTO UsuarioActividad (PKID, IDUsuario, IDActividad)
                VALUES (@NewPKID, @IDUsuario, @IDActividad)
            END
            ELSE
            BEGIN
                PRINT 'La actividad ya está asignada a este usuario.'
            END
        END
        ELSE IF @Accion = 'ELIMINAR'
        BEGIN
            -- Verificar si la actividad existe para el usuario
            IF EXISTS (SELECT * FROM UsuarioActividad WHERE IDUsuario = @IDUsuario AND IDActividad = @IDActividad)
            BEGIN
                -- Eliminar la actividad para el usuario
                DELETE FROM UsuarioActividad WHERE IDUsuario = @IDUsuario AND IDActividad = @IDActividad
            END
            ELSE
            BEGIN
                PRINT 'La actividad no está asignada a este usuario.'
            END
        END
        ELSE
        BEGIN
            PRINT 'Acción no válida. Use AGREGAR o ELIMINAR.'
        END

        -- Confirmar la transacción
        COMMIT TRANSACTION
    END TRY

    -- Manejo de errores
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT 'Error al actualizar las actividades del usuario.'
    END CATCH
END


EXEC sp_ActualizarActividadesUsuario_DMO 
    @IDUsuario = 4208,       -- ID del usuario
    @IDActividad = 'CE0B99A9-2B40-46EC-AA50-A0157218FCDD',     -- ID de la actividad
    @Accion = 'ELIMINAR'

EXEC sp_ActualizarActividadesUsuario_DMO 
    @IDUsuario = 4208,       -- ID del usuario
    @IDActividad = 'CE0B99A9-2B40-46EC-AA50-A0157218FCDD',     -- ID de la actividad
    @Accion = 'AGREGAR'



select
usu.pkid as Id_usuario,
usu.IDPerfilUsuario as Id_Perfil_usu,
usu.IDUsuario,
usu.Nombre as NombreUsu,
em.Nombre as NombreEmp,
em.RazonSocial,
epu.Nombre AS Perfil,
ac.Descripcion,
AC.PKID as Id_Actividad
from UsuarioEmpresa uem
left join Usuario usu on usu.PKID= uem.IDUsuario
left join Empresa em on em.PKID=uem.IDEmpresa
left join ePerfilUsuario epu on epu.ID=usu.IDPerfilUsuario
left join UsuarioActividad uac on uac.IDUsuario=epu.ID
left join Actividad ac on ac.PKID =uac.IDActividad
 where usu.IDUsuario='YDIESTREM'

 and ac.Descripcion like 'EvaluarDescuento%'

 select*from usuario where
 IDPerfilUsuario=400031
 AND
 IDUsuario='YDIESTREM'
 AND
 pkid=600208

 select*from Usuario where IDUsuario='DMARIÑASO'

 select *from UsuarioActividad where idusuario=400031

 select top 5 *from UsuarioActividad order by PKID desc


