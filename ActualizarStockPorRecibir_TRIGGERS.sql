CREATE TRIGGER ActualizarStockPorRecibir
ON ProductoAlmacen
AFTER INSERT, UPDATE
AS
BEGIN
    -- Actualizar StockPorRecibir con el valor de StockFisico multiplicado por 2
    UPDATE pa
    SET pa.StockPorRecibir = CASE
                                WHEN pa.StockFisico * 2 >= 0 THEN pa.StockFisico * 2
                                ELSE 0 -- Si el valor es negativo, se pone 0
                              END
    FROM ProductoAlmacen pa
    WHERE pa.StockPorRecibir < 0;
END;
