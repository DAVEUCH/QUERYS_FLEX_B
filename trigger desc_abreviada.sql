CREATE TRIGGER trg_ClaseProductoServicio_Abreviatura
ON ClaseProductoServicio
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @PKID INT, @Descripcion NVARCHAR(200), @Abreviatura NVARCHAR(200)
    DECLARE @Palabra NVARCHAR(100), @PosEspacio INT

    DECLARE cur CURSOR FOR
        SELECT PKID, Descripcion FROM inserted

    OPEN cur
    FETCH NEXT FROM cur INTO @PKID, @Descripcion

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Abreviatura = ''
        
        WHILE LEN(@Descripcion) > 0
        BEGIN
            SET @PosEspacio = CHARINDEX(' ', @Descripcion)

            IF @PosEspacio > 0
                SET @Palabra = LEFT(@Descripcion, @PosEspacio - 1)
            ELSE
                SET @Palabra = @Descripcion

            SET @Abreviatura = @Abreviatura + LEFT(@Palabra, 5) + ' '

            IF @PosEspacio > 0
                SET @Descripcion = LTRIM(RIGHT(@Descripcion, LEN(@Descripcion) - @PosEspacio))
            ELSE
                SET @Descripcion = ''
        END

        -- Quitar espacio final
        SET @Abreviatura = RTRIM(@Abreviatura)

        -- Actualizar el registro
        UPDATE ClaseProductoServicio
        SET Descripcion_Abrev = @Abreviatura
        WHERE PKID = @PKID

        FETCH NEXT FROM cur INTO @PKID, @Descripcion
    END

    CLOSE cur
    DEALLOCATE cur
END
