ALTER PROCEDURE InsertPersona_CLIENTE_PERSONA
    @IDTipoTercero INT,
    @IDTipoDocIdentidad INT,
    @Email NVARCHAR(50),
    @Web NVARCHAR(50),
    @Observacion NVARCHAR(200),
    @DocIdentidad NVARCHAR(50),
    @Codigo NVARCHAR(20),
    @Nombre NVARCHAR(100),
    @ApellidoPaterno NVARCHAR(50),
    @ApellidoMaterno NVARCHAR(50),
    @PrimerNombre NVARCHAR(50),
    @SegundoNombre NVARCHAR(50),
    @Descriptivo BIT,
    @Activo BIT,
    @AgenteRetencion BIT,
    @AgentePercepcion BIT,
    @Extranjero BIT,
    @CuentaBancaria NVARCHAR(40),
    @FechaAniversario DATE,
    @FechaCumpleaños DATE,
    @IDDireccionPrincipal INT,
    @ExceptuadoDePercepcion BIT,
    @FechaCrea DATE,
	--campos de cliente
	@IDCategoriaCliente INT,
    @IDMoneda INT,
    @LineaCredito NVARCHAR(50),
    @BalanceSoles DECIMAL(18,4),
    @BalanceDolares DECIMAL(18,4),
    @MejorPrecio BIT,
    @IDModalidadCredito INT,
    @DiasCredito INT,
    @IDTipoMedioDePago INT,
    @CreditoContado BIT,
    @InhabilitadoBonificacion BIT,
    @InhabilitadoDescuento BIT,
    @IDTipoCliente INT,
    @LineaCreditoPorFuerzaVentas INT,
    @MaximoCuentasPorCobrarVencidas INT,
    @Campo1 NVARCHAR(50),
    @Campo2 NVARCHAR(50),
    @Campo3 NVARCHAR(50),
    @Campo4 NVARCHAR(50),
    @IDCaracteristica1 INT,
    @IDCaracteristica2 INT,
    @IDCaracteristica3 INT,
    @IDCaracteristica4 INT,
    @Corporativo BIT,
    @IDClienteCorporativo INT,
    @LineaCreditoCorporativa BIT,
    @LineaCreditoActiva BIT,
	--Campos direccion
	@IDDistrito INT,
    @IDProvincia INT,
    @IDDepartamento INT,
    @Descripcion NVARCHAR(255),
    @DireccionPrincipal BIT,
    @Sucursal NVARCHAR(255),
	--Campos de direccion cliente
	@IDZonaReparto INT,
	@Longitud DECIMAL(18,10),
	@Latitud DECIMAL (18,10),
	--Campos Usuario
	@IDUsuario INT,
	@NombreTipo VARCHAR(100),
	@Operacion VARCHAR(100),

	@PC VARCHAR(50),
	@Fecha DATE,
	@ContenidoXML NVARCHAR(MAX)
AS
BEGIN
    DECLARE @NewPKID INT;
	DECLARE @NewPKIDDIREC INT;
	--DECLARE @NewPKIDAUDI INT;
    -- Obtener el PKID máximo actual y sumarle 1 para el nuevo registro
    SELECT @NewPKID = ISNULL(MAX(PKID), 0) + 1 FROM Persona;
	
	

	-- Insertar en la tabla Persona
    INSERT INTO Persona (
        PKID, IDTipoTercero, IDTipoDocIdentidad, Email, Web, Observacion, DocIdentidad, Codigo, Nombre, ApellidoPaterno, 
        ApellidoMaterno, PrimerNombre, SegundoNombre, Descriptivo, Activo, AgenteRetencion, AgentePercepcion, Extranjero, 
        CuentaBancaria, FechaAniversario, FechaCumpleaños, IDDireccionPrincipal, ExceptuadoDePercepcion, FechaCrea
    )
    VALUES (
        @NewPKID, @IDTipoTercero, @IDTipoDocIdentidad, @Email, @Web, @Observacion, @DocIdentidad, @Codigo, @Nombre, @ApellidoPaterno, 
        @ApellidoMaterno, @PrimerNombre, @SegundoNombre, @Descriptivo, @Activo, @AgenteRetencion, @AgentePercepcion, @Extranjero, 
        @CuentaBancaria, @FechaAniversario, @FechaCumpleaños, @IDDireccionPrincipal, @ExceptuadoDePercepcion, @FechaCrea
    );
	    -- Insertar en la tabla Cliente usando el PKID generado
    INSERT INTO Cliente (
        PKID, IDCategoriaCliente, IDMoneda, LineaCredito, BalanceSoles, BalanceDolares, MejorPrecio, IDModalidadCredito, 
        DiasCredito, IDTipoMedioDePago, CreditoContado, InhabilitadoBonificacion, InhabilitadoDescuento, IDTipoCliente, 
        LineaCreditoPorFuerzaVentas, MaximoCuentasPorCobrarVencidas, Campo1, Campo2, Campo3, Campo4, IDCaracteristica1, 
        IDCaracteristica2, IDCaracteristica3, IDCaracteristica4, Corporativo, IDClienteCorporativo, LineaCreditoCorporativa, 
        LineaCreditoActiva
    )
    VALUES (
        @NewPKID, @IDCategoriaCliente, @IDMoneda, @LineaCredito, @BalanceSoles, @BalanceDolares, @MejorPrecio, @IDModalidadCredito, 
        @DiasCredito, @IDTipoMedioDePago, @CreditoContado, @InhabilitadoBonificacion, @InhabilitadoDescuento, @IDTipoCliente, 
        @LineaCreditoPorFuerzaVentas, @MaximoCuentasPorCobrarVencidas, @Campo1, @Campo2, @Campo3, @Campo4, @IDCaracteristica1, 
        @IDCaracteristica2, @IDCaracteristica3, @IDCaracteristica4, @Corporativo, @IDClienteCorporativo, @LineaCreditoCorporativa, 
        @LineaCreditoActiva
    );

	SELECT @NewPKIDDIREC = ISNULL(MAX(PKID), 0) + 1 FROM Direccion;

	-- Insertar en la Tabla Direccion usando el PKID generado
	INSERT INTO Direccion(PKID,IDDistrito,IDProvincia,IDDepartamento,IDPersona,Descripcion,DireccionPrincipal,Sucursal)
	    VALUES (
        @NewPKIDDIREC, @IDDistrito, @IDProvincia, @IDDepartamento, @NewPKID, @Descripcion, @DireccionPrincipal, @Sucursal
    );
	-- Insertar en la Tabla Direccion_cliente usando el PKID generado
	INSERT INTO DIRECCIONCLIENTE (PKID,IDZonaReparto,Longitud,Latitud)
	VALUES(
	@NewPKIDDIREC,@IDZonaReparto,@Longitud,@Latitud);

	--SELECT @NewPKIDAUDI = ISNULL(MAX(PKID), 0) + 1 FROM Auditoria;
	--Insertar auditoria
	INSERT Auditoria(IDUsuario,NombreTipo,Operacion,IDEntidad,PC,Fecha,ContenidoXML)
    VALUES(
    @IDUsuario ,@NombreTipo,@Operacion,@NewPKID,@PC,@Fecha,@ContenidoXML)


END;



EXEC InsertPersona_CLIENTE_PERSONA 
    --@PKID = 68353, 
    @IDTipoTercero = 2, 
    @IDTipoDocIdentidad = 5, 
    @Email = '', 
    @Web = '', 
    @Observacion = '', 
    @DocIdentidad = '20510870099', 
    @Codigo = '20599970088', 
    @Nombre = 'REPUESTOS DAGE WEW', 
    @ApellidoPaterno = '', 
    @ApellidoMaterno = '', 
    @PrimerNombre = '', 
    @SegundoNombre = '', 
    @Descriptivo = '', 
    @Activo = 0, 
    @AgenteRetencion = 1, 
    @AgentePercepcion = 0, 
    @Extranjero = 0, 
    @CuentaBancaria = '', 
    @FechaAniversario = '2024-07-08', 
    @FechaCumpleaños = '2024-07-07', 
    @IDDireccionPrincipal = 69744, 
    @ExceptuadoDePercepcion = 0, 
    @FechaCrea = '2024-08-23',
	@IDCategoriaCliente = 11,
    @IDMoneda = 1,
    @LineaCredito = '3000.00',
    @BalanceSoles = 0.00,
    @BalanceDolares = 0.00,
    @MejorPrecio = 1,
    @IDModalidadCredito = 100000014,
    @DiasCredito = 0,
    @IDTipoMedioDePago = 0,
    @CreditoContado = 0,
    @InhabilitadoBonificacion = 1,
    @InhabilitadoDescuento = 0,
    @IDTipoCliente = 16,
    @LineaCreditoPorFuerzaVentas = 0,
    @MaximoCuentasPorCobrarVencidas = 0,
    @Campo1 = '',
    @Campo2 = '',
    @Campo3 = '',
    @Campo4 = '',
    @IDCaracteristica1 = 0,
    @IDCaracteristica2 = 0,
    @IDCaracteristica3 = 0,
    @IDCaracteristica4 = 0,
    @Corporativo = 0,
    @IDClienteCorporativo = 0,
    @LineaCreditoCorporativa = 0,
    @LineaCreditoActiva = 1,
	@IDDistrito = 1249,
    @IDProvincia = 128,
    @IDDepartamento = 15,
    @Descripcion = 'sjl',
    @DireccionPrincipal = 1,
    @Sucursal = '000',
	@IDZonaReparto=0,
	@Longitud='0.0000000000',
	@Latitud='0.0000000000',
	@IDUsuario='600208' ,
	@NombreTipo ='Cliente' ,
	@Operacion='Crear',
	@PC='GCICPUOFADM004',
	@Fecha ='2024-08-23',
	@ContenidoXML=''



DELETE from Persona where PKID=68354
DELETE FROM CLIENTE WHERE PKID=68354
DELETE FROM Direccion WHERE PKID=69504
delete from DireccionCliente where PKID=69504
SELECT TOP 10*FROM Auditoria ORDER BY PKID DESC
SELECT TOP 10*FROM DIRECCION ORDER BY PKID DESC
select top 10*from direccioncliente  order by pkid desc
SELECT TOP 10 * 
FROM persona 
ORDER BY PKID DESC;

--SELECT TOP 10 * 
--FROM Cliente 
--ORDER BY PKID DESC;

INSERT Auditoria(IDUsuario,NombreTipo,Operacion,IDEntidad,PC,Fecha,ContenidoXML)
values (600208,'Cliente','Crear',68353,'GCICPUOFADM004','2024-07-08','')

