CREATE PROCEDURE InsertarCpPedido_Ecommerce
    @IDTipoCp INT,
    @IDPersona INT,
    @IDMoneda INT,
    @IDCptoOperacion INT,
    @IDPeriodo INT,
    @IDSucursal INT,
    @IDTipoPersona INT,
    @Fecha DATE,
    @FechaEmision DATE,
    @Hora TIME,
    @NumCp NVARCHAR(50),
    @NumCpContable NVARCHAR(50),
    @Observacion NVARCHAR(255),
    @PersonaNombre NVARCHAR(255),
    @Total DECIMAL(18, 6),
    -- Parámetros para Pedido
    @IDCpInventario INT,
    @IDTipoMedioDePago INT,
    @IDModalidadCredito INT,
    @DocIdentidad NVARCHAR(20),
    @EstadoEntrega INT,
    @EstadoFacturacion INT,
    @EstadoAprobacion INT,
    @SaldoCancelado DECIMAL(18, 6),
    @Credito DECIMAL(18, 6),
    @FechaPago DATE,
    @ClienteDescriptivo NVARCHAR(255),
    @Direccion NVARCHAR(255),
    @MontoDctoPromocional DECIMAL(18, 6),
    @DireccionEntrega NVARCHAR(255),
    @Cancelado BIT,
    @VentaEspecial BIT,
    @EscalaPreferencial BIT,
    @NumeroOrdenCompra NVARCHAR(50),
    @PagoEfectivo DECIMAL(18, 6),
    @RequiereAprobacion BIT,
    @EfectivoRestringido BIT,
    @AplicaDistribucion BIT,
    @OmitirPoliticasCredito BIT,
    @FechaEntrega DATE,
    @Ajustado BIT,
    @IDCliente2 INT,
    @FechaAprobacion DATE,
    @IDGrupoVentas INT,
    @IDDireccionEntrega INT,
    @IDDireccionCliente INT,
    -- Parámetros para el nuevo Item
    @Cantidad DECIMAL(18, 6),
    @Descripcion NVARCHAR(255),
    @TipoItemCp INT,
    @TotalItem DECIMAL(18, 6),
    @ValorUnitario DECIMAL(18, 6),
    @PorcentajeImpto DECIMAL(18, 6),
    @Inafecto BIT,
    @Bonificacion BIT,
    @ValorAfecto DECIMAL(18, 6),
    @ValorVenta DECIMAL(18, 6),
    @SubTotal DECIMAL(18, 6),
    @ValorDescuento DECIMAL(18, 6),
    @ValorInafecto DECIMAL(18, 6),
    @BonificacionManual BIT,
    @DescuentoPieCp DECIMAL(18, 6),
    @RecargoPieCp DECIMAL(18, 6),
    @PorcentajePercepcion DECIMAL(18, 6),
    @MontoPercepcion DECIMAL(18, 6),
    @PorcentajeDetraccion DECIMAL(18, 6),
    @MontoDetraccion DECIMAL(18, 6),
    @ValorReferencialDetraccion DECIMAL(18, 6),
    @EsAgrupacion BIT,
    @EsItemAgrupacion BIT,
    @IDAgrupacion INT,
    @PorcentajeAgrupacion DECIMAL(18, 6),
    @Anulado BIT,
    -- Parámetros para ItemPedido
    @BalanceEntrega DECIMAL(18, 6),
    @BalanceFacturacion DECIMAL(18, 6),
    @PrecioLista DECIMAL(18, 6),
    @AplicaDescuentoConVale BIT,
    @EscalaPreferencial1 BIT,
    @DescuentoAplicado DECIMAL(18, 6),
    @DescuentoFijo DECIMAL(18, 6),
    @CantidadPedida DECIMAL(18, 6),
    @CantidadAEntregar DECIMAL(18, 6),
    @IDDefinicionBonificacion INT,
    @IDDefinicionDescuento INT,
    @VentaEspecial1 BIT,
    @IDProducto INT,
    @IDUnidad INT,
    @Factor DECIMAL(18, 6),
    @CantidadBase DECIMAL(18, 6),
    @IDAlmacen INT,
    @Agrupacion BIT,
    @IDLoteFabricacion INT,
    @NumeroLote NVARCHAR(50),
    @Observacion1 NVARCHAR(255),
    @IDCentroDeCosto INT,
    @Peso DECIMAL(18, 6),
    @Largo DECIMAL(18, 6),
    @Ancho DECIMAL(18, 6),
    @LargoB DECIMAL(18, 6),
    @AnchoB DECIMAL(18, 6),
    @IDUnidadMedidaOrigen INT,
    @IDUnidadMedidaDestino INT,
    @IDConversionUnidad INT,
    @CantidadB DECIMAL(18, 6),
    @PrecioB DECIMAL(18, 6),
    @FactorConversion DECIMAL(18, 6),
    @UsarUnidadMedida BIT,
    @FactorUnidadMedida DECIMAL(18, 6),
    @IDCpInventario1 INT
AS
BEGIN
    -- Declarar variables para PKID
    DECLARE @NuevoPKID INT;
    DECLARE @NuevoPKID_Item INT;

    -- Obtener el valor máximo actual de PKID y sumar 1 para Cp
    SELECT @NuevoPKID = ISNULL(MAX(PKID), 0) + 1 FROM Cp;

    -- Realizar el insert en Cp
    INSERT INTO Cp (PKID, IDTipoCp, IDPersona, IDMoneda, IDCptoOperacion, IDPeriodo, IDSucursal, IDTipoPersona, Fecha, FechaEmision, Hora, NumCp, NumCpContable, Observacion, PersonaNombre, Total)
    VALUES (@NuevoPKID, @IDTipoCp, @IDPersona, @IDMoneda, @IDCptoOperacion, @IDPeriodo, @IDSucursal, @IDTipoPersona, @Fecha, @FechaEmision, @Hora, @NumCp, @NumCpContable, @Observacion, @PersonaNombre, @Total);

    -- Realizar el insert en Pedido usando el mismo PKID de Cp
    INSERT INTO Pedido (PKID, IDCpInventario, IDTipoMedioDePago, IDModalidadCredito, DocIdentidad, EstadoEntrega, EstadoFacturacion, EstadoAprobacion, SaldoCancelado, Credito, FechaPago, ClienteDescriptivo, Direccion, MontoDctoPromocional, DireccionEntrega)
    VALUES (@NuevoPKID, @IDCpInventario, @IDTipoMedioDePago, @IDModalidadCredito, @DocIdentidad, @EstadoEntrega, @EstadoFacturacion, @EstadoAprobacion, @SaldoCancelado, @Credito, @FechaPago, @ClienteDescriptivo, @Direccion, @MontoDctoPromocional, @DireccionEntrega);

    -- Obtener el valor máximo actual de PKID y sumar 1 para Item (PKID independiente)
    SELECT @NuevoPKID_Item = ISNULL(MAX(PKID), 0) + 1 FROM ItemCp;

    -- Realizar el insert en Item usando el nuevo PKID y el mismo IDCp que el PKID de Cp
    INSERT INTO ItemCp (PKID, IDCp, Cantidad, Descripcion, TipoItemCp, Total, ValorUnitario)
    VALUES (@NuevoPKID_Item, @NuevoPKID, @Cantidad, @Descripcion, @TipoItemCp, @TotalItem, @ValorUnitario);

    -- Realizar el insert en ItemPedido usando el mismo PKID que en Item
    INSERT INTO ItemPedido (PKID, BalanceEntrega, BalanceFacturacion, PrecioLista, AplicaDescuentoConVale, EscalaPreferencial, DescuentoAplicado, DescuentoFijo, CantidadPedida, CantidadAEntregar, IDDefinicionBonificacion, IDDefinicionDescuento, VentaEspecial)
    VALUES (@NuevoPKID_Item, @BalanceEntrega, @BalanceFacturacion, @PrecioLista, @AplicaDescuentoConVale, @EscalaPreferencial, @DescuentoAplicado, @DescuentoFijo, @CantidadPedida, @CantidadAEntregar, @IDDefinicionBonificacion, @IDDefinicionDescuento, @VentaEspecial);

    -- Realizar el insert en ItemProducto usando el mismo PKID que en ItemPedido
    INSERT INTO ItemProducto (PKID, IDProducto, IDUnidad, Factor, CantidadBase, IDAlmacen, Agrupacion, IDLoteFabricacion, NumeroLote, Observacion, IDCentroDeCosto, Peso, Largo, Ancho, LargoB, AnchoB, IDUnidadMedidaOrigen, IDUnidadMedidaDestino, IDConversionUnidad, CantidadB, PrecioB, FactorConversion, UsarUnidadMedida, FactorUnidadMedida, IDCpInventario)
    VALUES (@NuevoPKID_Item, @IDProducto, @IDUnidad, @Factor, @CantidadBase, @IDAlmacen, @Agrupacion, @IDLoteFabricacion, @NumeroLote, @Observacion, @IDCentroDeCosto, @Peso, @Largo, @Ancho, @LargoB, @AnchoB, @IDUnidadMedidaOrigen, @IDUnidadMedidaDestino, @IDConversionUnidad, @CantidadB, @PrecioB, @FactorConversion, @UsarUnidadMedida, @FactorUnidadMedida, @IDCpInventario);
END;
