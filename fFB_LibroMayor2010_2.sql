USE [FREDDY]
GO
/****** Object:  UserDefinedFunction [dbo].[fFB_LibroMayor2010_2]    Script Date: 9/04/2025 16:42:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  

-- Author:  <Author,,Name>  

-- Create date: <Create Date,,>  

-- Description: <Description,,>  

-- =============================================  

ALTER FUNCTION [dbo].[fFB_LibroMayor2010_2]  

( 
 @idPlanCuentas int, 
 @idEjercicio int,  

 @idPeriodoInicial int,   

 @idPeriodoFinal int,  

 @cuentaInicial varchar(50),  

 @cuentaFinal varchar(50),  

 @Nivel int  

)  

RETURNS @LibroMayor TABLE   

( CCN2Numero        Varchar(50),  

 CCN2Descripcion       Varchar(200),   

 CCN3Numero        Varchar(50),  

 CCN3Descripcion       Varchar(200),   

 CCN4Numero        Varchar(50),  

 CCN4Descripcion       Varchar(200),   

 CCN5Numero        Varchar(50),  

 CCN5Descripcion       Varchar(200),   

 CCN6Numero        Varchar(50),  

 CCN6Descripcion       Varchar(200),    

 CCUNSaldoInicial      Decimal(18,2),  

 VoucherContableNumero     Varchar(40),  

 VoucherContableFecha     DateTime,   

 VoucherContableComprobanteOrigenTipo Varchar(20),  

 VoucherContableComprobanteOrigenNumero Varchar(50),  

 VoucherContableComprobanteOrigenFecha DateTime,   

 AsientoGlosa       Varchar(200),  

 CargoAbonoCuentaNumero     Varchar(50),  

 CargoAbonoCuentaDescripcion    Varchar(200),  

 CargoAbonoGlosa       Varchar(200),  

 CargoAbonoCargo       Decimal(18,4),   

 CargoAbonoAbono       Decimal(18,4),   

 CargoAbonoSaldo       Decimal(18,4),  

 CargoAbonoCargoMonedaBase    Decimal(18,2),  

 CargoAbonoAbonoMonedaBase    Decimal(18,2),  

 CargoAbonoSaldoMonedaBase    Decimal(18,2),  

 CargoAbonoMonedaID      Int,  

 CargoAbonoAuxiliarCodigo    Varchar(20),  

 CargoAbonoAuxiliarNombre    Varchar(200)  

)  

AS  

BEGIN  

  

 DECLARE @LibroMayorSaldoInicalA TABLE  

 (  

 CCUNID    int,  

 CCUNSaldoInicial decimal(18,2)  

 )  

   

 INSERT INTO @LibroMayorSaldoInicalA  

 SELECT  CCUN.PKID AS CCUNID,   

    SUM(dbo.SaldoPeriodoCuentaContable.SaldoCargo - dbo.SaldoPeriodoCuentaContable.SaldoAbono) AS SaldoInicial  

 FROM  dbo.SaldoPeriodoCuentaContable INNER JOIN  

    dbo.CuentaContable AS CCUN ON dbo.SaldoPeriodoCuentaContable.IDCuentaContable = CCUN.PKID INNER JOIN  

    dbo.Periodo ON dbo.SaldoPeriodoCuentaContable.IDPeriodo = dbo.Periodo.PKID  

 WHERE  (dbo.Periodo.IDEjercicio = @idEjercicio)   

    AND (dbo.SaldoPeriodoCuentaContable.IDPeriodo < @idPeriodoInicial)  
	AND (CCUN.IDPlanCuentas =  @idPlanCuentas)
 GROUP BY CCUN.PKID  

   

 DECLARE @LibroMayorSaldoInicialB TABLE  

 ( CCN2Numero   Varchar(50),  

  CCN2Descripcion  Varchar(200),   

  CCN3Numero   Varchar(50),  

  CCN3Descripcion  Varchar(200),   

  CCN4Numero   Varchar(50),  

  CCN4Descripcion  Varchar(200),   

  CCN5Numero   Varchar(50),  

  CCN5Descripcion  Varchar(200),     

  CCUNID    Int,  

  CCUNSaldoInicial Decimal(18,2)  

 )  

   

 INSERT INTO @LibroMayorSaldoInicialB   

 SELECT  CCN2.Cuenta AS CCN2Numero,   

    CCN2.Descripcion AS CCN2Descripcion,   

    CCN3.Cuenta AS CCN3Numero,   

    CCN3.Descripcion AS CCN3Descripcion,   

    CCN4.Cuenta AS CCN4Numero,   

    CCN4.Descripcion AS CCN4Descripcion,   

    CCN5.Cuenta AS CCN5Numero,   

    CCN5.Descripcion AS CCN5Descripcion,   

    CCN5.PKID AS CCUNID,   

    ISNULL(LibroMayorSaldoInicalA.CCUNSaldoInicial, 0)  AS SaldoInicial  

 FROM      dbo.CuentaContable AS CCN2 INNER JOIN  

    dbo.CuentaContable AS CCN3 ON CCN2.PKID = CCN3.IDCuentaContablePadre INNER JOIN  

    dbo.CuentaContable AS CCN4 ON CCN3.PKID = CCN4.IDCuentaContablePadre INNER JOIN  

    dbo.CuentaContable AS CCN5 ON CCN4.PKID = CCN5.IDCuentaContablePadre LEFT OUTER JOIN   

    @LibroMayorSaldoInicalA AS LibroMayorSaldoInicalA ON CCN5.PKID = LibroMayorSaldoInicalA.CCUNID    

 WHERE  (CCN2.Nivel = 2)   
    AND    (CCN5.IDPlanCuentas =  @idPlanCuentas)
    AND (CCN5.Cuenta BETWEEN @cuentaInicial AND @cuentaFinal)  

   

   

   

 DECLARE @LibroMayorSaldoInicialC TABLE  

 ( CCN2Numero   Varchar(50),  

  CCN2Descripcion  Varchar(200),   

  CCN3Numero   Varchar(50),  

  CCN3Descripcion  Varchar(200),   

  CCN4Numero   Varchar(50),  

  CCN4Descripcion  Varchar(200),   

  CCN5Numero   Varchar(50),  

  CCN5Descripcion  Varchar(200),   

  CCN6Numero   Varchar(50),  

  CCN6Descripcion  Varchar(200),    

  CCUNID    Int,  

  CCUNSaldoInicial Decimal(18,2)  

 )  

   

 INSERT INTO @LibroMayorSaldoInicialC   

 SELECT  CCN2.Cuenta AS CCN2Numero,   

    CCN2.Descripcion AS CCN2Descripcion,   

    CCN3.Cuenta AS CCN3Numero,   

    CCN3.Descripcion AS CCN3Descripcion,   

                CCN4.Cuenta AS CCN4Numero,   

                CCN4.Descripcion AS CCN4Descripcion,   

                CCN5.Cuenta AS CCN5Numero,   

                CCN5.Descripcion AS CCN5Descripcion,   

                CCN6.Cuenta AS CCN6Numero,  

                CCN6.Descripcion AS CCN6Descripcion,   

                CCN6.PKID AS CCUNID,  

                ISNULL(LibroMayorSaldoInicalA.CCUNSaldoInicial, 0)  AS SaldoInicial  

 FROM        dbo.CuentaContable AS CCN2 INNER JOIN  

                dbo.CuentaContable AS CCN3 ON CCN2.PKID = CCN3.IDCuentaContablePadre INNER JOIN  

                dbo.CuentaContable AS CCN4 ON CCN3.PKID = CCN4.IDCuentaContablePadre INNER JOIN  

                dbo.CuentaContable AS CCN5 ON CCN4.PKID = CCN5.IDCuentaContablePadre INNER JOIN  

                dbo.CuentaContable AS CCN6 ON CCN5.PKID = CCN6.IDCuentaContablePadre LEFT OUTER JOIN   

    @LibroMayorSaldoInicalA AS LibroMayorSaldoInicalA ON CCN6.PKID = LibroMayorSaldoInicalA.CCUNID  

WHERE     (CCN2.Nivel = 2) 
AND (CCN6.IDPlanCuentas =  @idPlanCuentas)
AND (CCN6.Cuenta BETWEEN @cuentaInicial AND @cuentaFinal)  

      

DECLARE @LibroMayorMovimientos TABLE  

 ( VoucherContableNumero     Varchar(40),  

  VoucherContableFecha     DateTime,   

  VoucherContableComprobanteOrigenTipo Varchar(20),  

  VoucherContableComprobanteOrigenNumero Varchar(50),  

  VoucherContableComprobanteOrigenFecha DateTime,   

  AsientoGlosa       Varchar(200),  

  CargoAbonoCuentaID      Int,  

  CargoAbonoCuentaNumero     Varchar(50),  

  CargoAbonoCuentaDescripcion    Varchar(200),  

  CargoAbonoGlosa       Varchar(200),  

  CargoAbonoCargo       Decimal(18,4),   

  CargoAbonoAbono       Decimal(18,4),   

  CargoAbonoSaldo       Decimal(18,4),  

  CargoAbonoCargoMonedaBase    Decimal(18,2),  

  CargoAbonoAbonoMonedaBase    Decimal(18,2),  

  CargoAbonoSaldoMonedaBase    Decimal(18,2),  

  CargoAbonoMonedaID      Int,  

  CargoAbonoAuxiliarCodigo    Varchar(20),  

  CargoAbonoAuxiliarNombre    Varchar(200)  

 )  

 INSERT INTO @LibroMayorMovimientos   

 

 SELECT  dbo.VoucherContable.NumCp AS VoucherContableNumero,   

    dbo.VoucherContable.Fecha AS VoucherContableFecha,   

    ISNULL(TipoCp_1.Abreviacion, '') AS VoucherContableComprobanteOrigenTipo,   

    ISNULL(dbo.Cp.NumCp, '') AS VoucherContableComprobanteOrigenNumero,   

    ISNULL(dbo.Cp.Fecha, dbo.VoucherContable.Fecha) AS VoucherContableComprobanteOrigenFecha,   

    dbo.Asiento.Glosa AS AsientoGlosa,   

    dbo.CargoAbono.IDCuentaContable AS CargoAbonoCuentaID,   

    dbo.CuentaContable.Cuenta AS CargoAbonoCuentaNumero,   

    dbo.CuentaContable.Descripcion AS CargoAbonoCuentaDescripcion,   

    dbo.CargoAbono.Glosa AS CargoAbonoGlosa,   

    dbo.CargoAbono.Cargo AS CargoAbonoCargo,   

    dbo.CargoAbono.Abono AS CargoAbonoAbono,   

    dbo.CargoAbono.Cargo - dbo.CargoAbono.Abono 

/*	case dbo.CuentaContable.Cuenta when '4011301' then		 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

		case isnull(dbo.CargoAbono.Cargo,0) when 0 then		 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

			dbo.CargoAbono.Cargo - dbo.CargoAbono.Abono			 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

		else												 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

			(dbo.CargoAbono.Cargo ) * -1  /*  AGREGADO POR LOS PAGOS DE PERCEPCION  en esta parte deberia restar no sumar  para que me pueda quedar el saldo igual a acreedor */

		end

	else 

		dbo.CargoAbono.Cargo - dbo.CargoAbono.Abono 

	end

*/

    AS CargoAbonoSaldo,   

    dbo.CargoAbono.CargoMonedaBase AS CargoAbonoCargoMonedaBase,   

    dbo.CargoAbono.AbonoMonedaBase AS CargoAbonoAbonoMonedaBase,   

/*	case dbo.CuentaContable.Cuenta when '4011301' then		 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

		case isnull(dbo.CargoAbono.Cargo,0) when 0 then		 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

		dbo.CargoAbono.CargoMonedaBase - dbo.CargoAbono.AbonoMonedaBase			 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

		else												 /*  AGREGADO POR LOS PAGOS DE PERCEPCION */

			(dbo.CargoAbono.CargoMonedaBase ) * -1  /*  AGREGADO POR LOS PAGOS DE PERCEPCION  en esta parte deberia restar no sumar  para que me pueda quedar el saldo igual a acreedor */

		end

	else 

		dbo.CargoAbono.CargoMonedaBase - dbo.CargoAbono.AbonoMonedaBase 

	end    

*/

dbo.CargoAbono.CargoMonedaBase - dbo.CargoAbono.AbonoMonedaBase 

	AS CargoAbonoSaldoMonedaBase,

    --dbo.CargoAbono.CargoMonedaBase - dbo.CargoAbono.AbonoMonedaBase AS CargoAbonoSaldoMonedaBase,   

    dbo.CargoAbono.IDMoneda AS CargoAbonoMonedaID,   

    dbo.Sucursal.Codigo AS CargoAbonoAuxiliarCodigo,   

    dbo.Sucursal.Nombre AS CargoAbonoAuxiliarNombre  

 FROM        dbo.VoucherContable INNER JOIN  

    dbo.Asiento ON dbo.VoucherContable.PKID = dbo.Asiento.IDVoucher INNER JOIN  

    dbo.CargoAbono ON dbo.Asiento.PKID = dbo.CargoAbono.IDAsiento INNER JOIN  

    dbo.CuentaContable ON dbo.CargoAbono.IDCuentaContable = dbo.CuentaContable.PKID INNER JOIN  

    dbo.Periodo ON dbo.VoucherContable.IDPeriodo = dbo.Periodo.PKID INNER JOIN  

    dbo.TipoCp ON dbo.VoucherContable.IDTipoCp = dbo.TipoCp.PKID LEFT OUTER JOIN  

    dbo.Cp INNER JOIN  

    dbo.TipoCp AS TipoCp_1 ON dbo.Cp.IDTipoCp = TipoCp_1.PKID ON dbo.VoucherContable.IDCp = dbo.Cp.PKID LEFT OUTER JOIN  

    dbo.Sucursal ON dbo.CargoAbono.IDAuxiliar = dbo.Sucursal.PKID   



--where VoucherContable.IDPeriodo = 100000262 and dbo.CuentaContable.Cuenta='4011301'

 WHERE dbo.VoucherContable.Anulado = 0  
 AND (dbo.Periodo.IDEjercicio = @idEjercicio) 
 AND (dbo.VoucherContable.IDPeriodo BETWEEN @idPeriodoInicial AND @idPeriodoFinal)    
 AND (CuentaContable.IDPlanCuentas =  @idPlanCuentas)
 AND (dbo.CuentaContable.Cuenta BETWEEN @cuentaInicial AND @cuentaFinal)   
   

 if @Nivel=5      

 INSERT INTO @LibroMayor   

 SELECT  LibroMayorSaldoInicial.CCN2Numero,   

    LibroMayorSaldoInicial.CCN2Descripcion,   

    LibroMayorSaldoInicial.CCN3Numero,   

    LibroMayorSaldoInicial.CCN3Descripcion,   

    LibroMayorSaldoInicial.CCN4Numero,   

    LibroMayorSaldoInicial.CCN4Descripcion,   

    LibroMayorSaldoInicial.CCN5Numero,   

    LibroMayorSaldoInicial.CCN5Descripcion,   

    '',  

    '',  

    LibroMayorSaldoInicial.CCUNSaldoInicial,   

    ISNULL(LibroMayorMovimientos.VoucherContableNumero, '') AS VoucherContableNumero,   

    ISNULL(LibroMayorMovimientos.VoucherContableFecha, 0) AS VoucherContableFecha,   

    ISNULL(LibroMayorMovimientos.VoucherContableComprobanteOrigenTipo, '')AS VoucherContableComprobanteOrigenTipo,   

    ISNULL(LibroMayorMovimientos.VoucherContableComprobanteOrigenNumero, '') AS VoucherContableComprobanteOrigenNumero,   

    ISNULL(LibroMayorMovimientos.VoucherContableComprobanteOrigenFecha, 0)AS VoucherContableComprobanteOrigenFecha,   

    ISNULL(LibroMayorMovimientos.AsientoGlosa, '') AS AsientoGlosa,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCuentaNumero, '') AS CargoAbonoCuentaNumero,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCuentaDescripcion, '') AS CargoAbonoCuentaDescripcion,   

    ISNULL(LibroMayorMovimientos.CargoAbonoGlosa, '') AS CargoAbonoGlosa,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCargo, 0)AS CargoAbonoCargo,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAbono, 0) AS CargoAbonoAbono,   

    ISNULL(LibroMayorMovimientos.CargoAbonoSaldo, 0) AS CargoAbonoSaldo,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCargoMonedaBase, 0) AS CargoAbonoCargoMonedaBase,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAbonoMonedaBase, 0) AS CargoAbonoAbonoMonedaBase,   

    ISNULL(LibroMayorMovimientos.CargoAbonoSaldoMonedaBase, 0) AS CargoAbonoSaldoMonedaBase,   

    ISNULL(LibroMayorMovimientos.CargoAbonoMonedaID, 0) AS CargoAbonoMonedaID,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAuxiliarCodigo, '') AS CargoAbonoAuxiliarCodigo,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAuxiliarNombre, '') AS CargoAbonoAuxiliarNombre  

 FROM        @LibroMayorMovimientos AS LibroMayorMovimientos RIGHT OUTER JOIN  

        @LibroMayorSaldoInicialB AS LibroMayorSaldoInicial ON LibroMayorMovimientos.CargoAbonoCuentaID = LibroMayorSaldoInicial.CCUNID   

          

          

 else if @Nivel=6  

   

 INSERT INTO @LibroMayor   

 SELECT  LibroMayorSaldoInicial.CCN2Numero,   

    LibroMayorSaldoInicial.CCN2Descripcion,   

    LibroMayorSaldoInicial.CCN3Numero,   

    LibroMayorSaldoInicial.CCN3Descripcion,   

    LibroMayorSaldoInicial.CCN4Numero,   

    LibroMayorSaldoInicial.CCN4Descripcion,   

    LibroMayorSaldoInicial.CCN5Numero,   

    LibroMayorSaldoInicial.CCN5Descripcion,   

    LibroMayorSaldoInicial.CCN6Numero,   

    LibroMayorSaldoInicial.CCN6Descripcion,  

    LibroMayorSaldoInicial.CCUNSaldoInicial,   

    ISNULL(LibroMayorMovimientos.VoucherContableNumero, '') AS VoucherContableNumero,   

    ISNULL(LibroMayorMovimientos.VoucherContableFecha, 0) AS VoucherContableFecha,   

    ISNULL(LibroMayorMovimientos.VoucherContableComprobanteOrigenTipo, '')AS VoucherContableComprobanteOrigenTipo,   

    ISNULL(LibroMayorMovimientos.VoucherContableComprobanteOrigenNumero, '') AS VoucherContableComprobanteOrigenNumero,   

    ISNULL(LibroMayorMovimientos.VoucherContableComprobanteOrigenFecha, 0)AS VoucherContableComprobanteOrigenFecha,   

    ISNULL(LibroMayorMovimientos.AsientoGlosa, '') AS AsientoGlosa,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCuentaNumero, '') AS CargoAbonoCuentaNumero,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCuentaDescripcion, '') AS CargoAbonoCuentaDescripcion,   

    ISNULL(LibroMayorMovimientos.CargoAbonoGlosa, '') AS CargoAbonoGlosa,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCargo, 0)AS CargoAbonoCargo,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAbono, 0) AS CargoAbonoAbono,   

    ISNULL(LibroMayorMovimientos.CargoAbonoSaldo, 0) AS CargoAbonoSaldo,   

    ISNULL(LibroMayorMovimientos.CargoAbonoCargoMonedaBase, 0) AS CargoAbonoCargoMonedaBase,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAbonoMonedaBase, 0) AS CargoAbonoAbonoMonedaBase,   

    ISNULL(LibroMayorMovimientos.CargoAbonoSaldoMonedaBase, 0) AS CargoAbonoSaldoMonedaBase,   

    ISNULL(LibroMayorMovimientos.CargoAbonoMonedaID, 0) AS CargoAbonoMonedaID,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAuxiliarCodigo, '') AS CargoAbonoAuxiliarCodigo,   

    ISNULL(LibroMayorMovimientos.CargoAbonoAuxiliarNombre, '') AS CargoAbonoAuxiliarNombre  

 FROM        @LibroMayorMovimientos AS LibroMayorMovimientos RIGHT OUTER JOIN  

        @LibroMayorSaldoInicialC AS LibroMayorSaldoInicial ON LibroMayorMovimientos.CargoAbonoCuentaID = LibroMayorSaldoInicial.CCUNID  

   

   

 RETURN   

END  
