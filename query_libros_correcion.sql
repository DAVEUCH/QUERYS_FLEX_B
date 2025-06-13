select*from cp where NumCp='F002-0001064' and PKID=812823
select*from VoucherContable where PKID=812823
select*from Asiento where IDVoucher=812823
SELECT*FROM DocCobrarPagar WHERE IDCp=812823
select*from cargoabono where idasiento=6090483 and IDCuentaContable=900019108
select 
CA.PKID,
IDAsiento,
IDCuentaContable,
CC.Descripcion,
CC.Cuenta,
CC.PKID AS ID_CUENTA,
IDAuxiliar,
Cargo,
Abono,
CargoMonedaBase,
AbonoMonedaBase,
Glosa,
CargoMonedaDocumento,
AbonoMonedaDocumento
from CargoAbono CA
LEFT JOIN CuentaContable CC ON CC.PKID=CA.IDCuentaContable
where IDAsiento=6090483

SELECT 
    'PKID' AS PKID,
    carg.PKID AS IDCargoAbono, 
    cpyy.PKID AS IDCp, 
    carg.IDCuentaContable,
    IDAuxiliar,
    '0.000000' AS Saldo,
    cpyy.Total, 
    cpyy.Fecha, 
    '1' AS Pagado,
    '0' AS IDCentroDeCosto, 
    'Pagar' AS TipoDocPago
FROM cp cpyy
LEFT JOIN VoucherContable vou ON vou.PKID = cpyy.PKID
LEFT JOIN Asiento asi ON asi.IDVoucher = vou.PKID
LEFT JOIN CargoAbono carg ON carg.IDAsiento = asi.PKID
WHERE (carg.IDCuentaContable = 900019107 OR carg.IDCuentaContable = 900019108)
and asi.IDLibroAuxiliar=3
  AND cpyy.PKID in(2908845,
2897062,
2904854,
2902506,
2907883,
2907854,
2897547,
2907703,
2907701,
2907674,
2899581,
2904855,
2904874,
2907695,
2899586,
2899594,
2899587,
2904879,
2899567,
2899472,
2900168,
2904882,
2902512,
2903572,
2903650,
2903656,
2904887,
2905147,
2907712,
2907705,
2907706,
2897745,
2899549,
2900663,
2900660,
2903626,
2905153,
2907715,
2907710)


--select*from CuentaContable where Cuenta=4212104

--CREATE PROCEDURE InsertarDocCobrarPagar_DMO
--    @IDCargoAbono INT,
--    @IDCp INT,
--    @IDCuentaContable INT,
--    @IDAuxiliar INT,
--    @Saldo DECIMAL(18, 6),
--    @Total DECIMAL(18, 6),
--    @FechaUltimoPago DATE,
--    @Pagado BIT,
--    @IDCentroDeCosto INT,
--    @TipoDocPago VARCHAR(50)
--AS
--BEGIN
--    SET NOCOUNT ON;

--    DECLARE @pkid INT;

--    -- Obtener el último valor de PKID e incrementar en 1
--    SELECT @pkid = ISNULL(MAX(PKID), 0) + 1 FROM DocCobrarPagar;

--    -- Insertar el nuevo registro
--    INSERT INTO DocCobrarPagar (PKID, IDCargoAbono, IDCp, IDCuentaContable, IDAuxiliar, Saldo, Total, FechaUltimoPago, Pagado, IDCentroDeCosto, TipoDocPago)
--    VALUES (@pkid, @IDCargoAbono, @IDCp, @IDCuentaContable, @IDAuxiliar, @Saldo, @Total, @FechaUltimoPago, @Pagado, @IDCentroDeCosto, @TipoDocPago);

--    -- Retornar el PKID generado (opcional)
--    SELECT @pkid AS PKIDGenerado;
--END;

--EXEC InsertarDocCobrarPagar_DMO
--    @IDCargoAbono = 17468666,
--    @IDCp = 2897062,
--    @IDCuentaContable = 900019108,
--    @IDAuxiliar = 100000205,
--    @Saldo = '0.000000',
--    @Total = '42.0000',
--    @FechaUltimoPago = '12-12-2024',
--    @Pagado = 1,
--    @IDCentroDeCosto = 0,
--    @TipoDocPago = 'Pagar';

-----EXEC InsertarDocCobrarPagar_DMO @IDCargoAbono =17468666,@IDCp =2897062,@IDCuentaContable =900019108,@IDAuxiliar =100000205,@Saldo = '0.000000 ',@Total = '42.00 ',@FechaUltimoPago = '12-12-2024 ',@Pagado =1,@IDCentroDeCosto = 0,@TipoDocPago =  'Pagar'






