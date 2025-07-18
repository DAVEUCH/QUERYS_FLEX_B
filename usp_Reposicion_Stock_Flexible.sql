alter PROCEDURE [dbo].[usp_Reposicion_Stock_Flexible] --aqui podriamos agregarle por marca si nombre que dices?
(
    @IDMarca INT = 0,
    --@IDProveedor INT = 0, --estoy comentando porque lo hare por separado
    @NumMesesCompra INT = 4
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ROW_NUMBER() OVER (ORDER BY ProductoServicio.Codigo) AS Row,
        Persona.Nombre AS Proveedor,
        ProductoServicio.Codigo,
        Freddy.ProductoFreddy.CodigoInterno,
        ProductoServicio.DescripcionResumida AS Linea,
        LTRIM(c1.Descripcion + ' ') + LTRIM(c4.Descripcion + ' ') + LTRIM(c2.Descripcion + ' ') + 
        LTRIM(c3.Descripcion + ' ') + LTRIM(c5.Descripcion + ' ') + LTRIM(c6.Descripcion + ' ') + 
        LTRIM(c8.Descripcion + ' ') + LTRIM(c9.Descripcion + ' ') + LTRIM(c7.Descripcion + ' ') + 
        LTRIM(c10.Descripcion) AS Aplicacion,
        usv_Unidad_Activas.Abreviacion AS Unid,
        tab_VentasPorProducto_Sum.UltVta_Fec,
        tab_VentasPorProducto_Sum.SEG_RFM,
        ISNULL(tab_VentasPorProducto_Sum.UltCant_ingreso1, 0) AS UltCant_ingreso,
        tab_VentasPorProducto_Sum.UltFec_Ped1 AS UltFec_Pedido,
        tab_VentasPorProducto_Sum.UltFec_ingreso1 AS UltFec_ingreso,
        CASE 
            WHEN tab_VentasPorProducto_Sum.DiasDemoraImport1 = 0 THEN 0 
            ELSE ROUND(tab_VentasPorProducto_Sum.DiasDemoraImport1 / 30.0, 1) 
        END AS MesesDemoraImpor,
        tab_VentasPorProducto_Sum.Cant_PorLlegar AS UltCant_PorLlegar,
        tab_VentasPorProducto_Sum.FecUltPed_PorLlegar AS Fec1er_PorLlegar,
        tab_VentasPorProducto_Sum.FecUltllega_PorLlegar AS FecUlt_PorLlegar,
        tab_VentasPorProducto_Sum.FechaSinStock_PorLlegar,
        CASE 
            WHEN tab_VentasPorProducto_Sum.diasPromDemoraImpor = 0 THEN 0 
            ELSE ROUND(tab_VentasPorProducto_Sum.diasPromDemoraImpor / 30.0, 1) 
        END AS MesesPromeDemoraImpor,
        tab_VentasPorProducto_Sum.CantClien1,
        tab_VentasPorProducto_Sum.PromCantVtasMes,
        ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult3Mes / 3.0, 2) AS TotVtas_Ult3Mes,
        ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult6Mes / 6.0, 2) AS TotVtas_Ult6Mes,
        ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult9Mes / 9.0, 2) AS TotVtas_Ult9Mes,
        ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult12Mes / 12.0, 2) AS TotVtas_Ult12Mes,
        CONVERT(INT, tab_VentasPorProducto_Sum.Stock_GCI / usv_Unidad_Activas.factor) AS Stock_GCI,
        CONVERT(INT, tab_VentasPorProducto_Sum.Stock_Freddy / usv_Unidad_Activas.factor) AS Stock_Freddy,
        (ISNULL(tab_VentasPorProducto_Sum.Stock_GCI, 0) + ISNULL(tab_VentasPorProducto_Sum.Stock_Freddy, 0)) / usv_Unidad_Activas.factor AS StockGrupo,
        @NumMesesCompra AS NumMesesComprar,
        FLOOR(
            CASE 
                WHEN tab_VentasPorProducto_Sum.PromCantVtasMes = 0 THEN 0 
                ELSE (tab_VentasPorProducto_Sum.Stock_GCI + ISNULL(tab_VentasPorProducto_Sum.Cant_PorLlegar, 0)) / tab_VentasPorProducto_Sum.PromCantVtasMes 
            END
        ) AS MesesConStock,
        FLOOR(
            CASE 
                WHEN tab_VentasPorProducto_Sum.PromCantVtasMes = 0 THEN 0 
                ELSE 
                    CASE 
                        WHEN tab_VentasPorProducto_Sum.Stock_Freddy > FLOOR(tab_VentasPorProducto_Sum.PromCantVtasMes * @NumMesesCompra) THEN 0 
                        ELSE 
                            CASE 
                                WHEN ISNULL(tab_VentasPorProducto_Sum.Cant_PorLlegar, 0) = 0 THEN
                                    FLOOR(tab_VentasPorProducto_Sum.PromCantVtasMes * @NumMesesCompra) - tab_VentasPorProducto_Sum.Stock_GCI
                                ELSE
                                    CASE 
                                        WHEN tab_VentasPorProducto_Sum.MesesConStock_PorLlegar > @NumMesesCompra THEN 0 
                                        ELSE (@NumMesesCompra - tab_VentasPorProducto_Sum.MesesConStock_PorLlegar) * tab_VentasPorProducto_Sum.PromCantVtasMes 
                                    END
                            END
                    END
            END
        ) AS CantSugerida_aComprar,
        tab_VentasPorProducto_Sum.CantAComprar_Confir,
        -- Fecha en que se debe pedir
        CASE 
            WHEN ISNULL(tab_VentasPorProducto_Sum.PromCantVtasMes, 0) = 0 THEN NULL
            WHEN ISNULL(tab_VentasPorProducto_Sum.Cant_PorLlegar, 0) = 0 THEN
                CASE 
                    WHEN ISNULL(tab_VentasPorProducto_Sum.Stock_GCI, 0) = 0 THEN GETDATE()
                    ELSE DATEADD(DAY, FLOOR((tab_VentasPorProducto_Sum.Stock_GCI / tab_VentasPorProducto_Sum.PromCantVtasMes) * 30) - tab_VentasPorProducto_Sum.DiasPromDemoraImpor, GETDATE())
                END
            ELSE DATEADD(DAY, -1 * tab_VentasPorProducto_Sum.DiasPromDemoraImpor, tab_VentasPorProducto_Sum.FechaSinStock_PorLlegar)
        END AS ProxPedido_FechaPide,
        -- Fecha en que llegaría lo pedido
        CASE 
            WHEN ISNULL(tab_VentasPorProducto_Sum.PromCantVtasMes, 0) = 0 THEN NULL
            WHEN ISNULL(tab_VentasPorProducto_Sum.Cant_PorLlegar, 0) = 0 THEN
                CASE 
                    WHEN ISNULL(tab_VentasPorProducto_Sum.Stock_GCI, 0) = 0 THEN
                        CASE 
                            WHEN ISNULL(tab_VentasPorProducto_Sum.DiasPromDemoraImpor, 0) = 0 THEN NULL
                            ELSE DATEADD(DAY, tab_VentasPorProducto_Sum.DiasPromDemoraImpor, GETDATE())
                        END
                    ELSE DATEADD(DAY, FLOOR((tab_VentasPorProducto_Sum.Stock_GCI / tab_VentasPorProducto_Sum.PromCantVtasMes) * 30) + tab_VentasPorProducto_Sum.DiasPromDemoraImpor, GETDATE())
                END
            ELSE tab_VentasPorProducto_Sum.FechaSinStock_PorLlegar
        END AS ProxPedido_llega,
        FLOOR(
            CASE 
                WHEN tab_VentasPorProducto_Sum.PromCantVtasMes = 0 THEN 0 
                ELSE tab_VentasPorProducto_Sum.PromCantVtasMes * @NumMesesCompra 
            END
        ) AS ProxPedido_Cant,
        tab_VentasPorProducto_Sum.UltFOB_ingreso,
        UtilBruta = STR(ROUND(
            CASE 
                WHEN tab_VentasPorProducto_Sum.UltCostoNacionalizado = 0 THEN 0 
                ELSE ((tab_VentasPorProducto_Sum.ValorUnitProm / tab_VentasPorProducto_Sum.UltCostoNacionalizado) - 1) * 100 
            END, 2), 10, 2) + '%'
    FROM dbo.Producto
    INNER JOIN Marca ON Producto.IDMarca = Marca.PKID
    INNER JOIN ProductoServicio ON Producto.PKID = ProductoServicio.PKID
    INNER JOIN ClaseProductoServicio ON ClaseProductoServicio.PKID = ProductoServicio.IDClaseProductoServicio
    INNER JOIN usv_Unidad_Activas ON Producto.PKID = usv_Unidad_Activas.IDProductoServicio
    LEFT JOIN Freddy.ProductoFreddy ON Freddy.ProductoFreddy.PKID = Producto.PKID
    LEFT JOIN Persona ON Producto.IDProveedor = Persona.PKID
    LEFT JOIN tab_VentasPorProducto_Sum ON tab_VentasPorProducto_Sum.IDProducto = Producto.PKID
    LEFT JOIN Caracteristica c1 ON Producto.IDCaracteristica1 = c1.PKID
    LEFT JOIN Caracteristica c2 ON Producto.IDCaracteristica2 = c2.PKID
    LEFT JOIN Caracteristica c3 ON Producto.IDCaracteristica3 = c3.PKID
    LEFT JOIN Caracteristica c4 ON Producto.IDCaracteristica4 = c4.PKID
    LEFT JOIN Caracteristica c5 ON Producto.IDCaracteristica5 = c5.PKID
    LEFT JOIN Caracteristica c6 ON Producto.IDCaracteristica6 = c6.PKID
    LEFT JOIN Caracteristica c7 ON Producto.IDCaracteristica7 = c7.PKID
    LEFT JOIN Caracteristica c8 ON Producto.IDCaracteristica8 = c8.PKID
    LEFT JOIN Caracteristica c9 ON Producto.IDCaracteristica9 = c9.PKID
    LEFT JOIN Caracteristica c10 ON Producto.IDCaracteristica10 = c10.PKID
    WHERE ProductoServicio.Activo = 1
      AND (@IDMarca = 0 OR Producto.IDMarca = @IDMarca)
      --AND (@IDProveedor = 0 OR Producto.IDProveedor = @IDProveedor)---igual comentado
    ORDER BY ProductoServicio.Codigo
END

exec usp_Reposicion_Stock_Flexible 504,4