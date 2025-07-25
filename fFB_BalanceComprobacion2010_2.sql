USE [GCI]
GO
/****** Object:  UserDefinedFunction [dbo].[fFB_BalanceComprobacion2010_2]    Script Date: 24/02/2025 15:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fFB_BalanceComprobacion2010_2]  

( @idPlanCuenta int,  
  @idEjercicio int,  

 @PeriodoMes varchar(2),   

 @CuentaNumeroDigitos int,  

 @CuentaNivel int  

)  

RETURNS @BalanceComprobacion TABLE   

( CuentaNumero   Varchar(50),  

 CuentaDescripcion  Varchar(200),   

 CuentaTipo    Varchar(50),  

 SaldoInicialCargo  Decimal(18,2),  

 SaldoInicialAbono  Decimal(18,2),  

 MovimientosCargo  Decimal(18,2),  

 MovimientosAbono  Decimal(18,2)  

)  

AS  

BEGIN  

 DECLARE @BalanceComprobacionSaldoInicial TABLE  

 ( CuentaNumero  Varchar(50),  

  SaldoInicialCargo Decimal(18,2),  

  SaldoInicialAbono Decimal(18,2)  

 )  

 INSERT INTO @BalanceComprobacionSaldoInicial   

 SELECT  LEFT(dbo.CuentaContable.Cuenta, @CuentaNumeroDigitos) AS CuentaNumero,   

    SUM(dbo.SaldoPeriodoCuentaContable.SaldoCargo) AS Cargo,   

    SUM(dbo.SaldoPeriodoCuentaContable.SaldoAbono)   

    AS Abono  

 FROM     dbo.SaldoPeriodoCuentaContable 

 INNER JOIN  dbo.Periodo ON dbo.SaldoPeriodoCuentaContable.IDPeriodo = dbo.Periodo.PKID 

 INNER JOIN  dbo.CuentaContable ON dbo.SaldoPeriodoCuentaContable.IDCuentaContable = dbo.CuentaContable.PKID  

 WHERE (dbo.CuentaContable.IDPlanCuentas = @idPlanCuenta) AND  (dbo.Periodo.Mes = '00') AND (dbo.Periodo.IDEjercicio = @idEjercicio)  

 GROUP BY LEFT(dbo.CuentaContable.Cuenta, @CuentaNumeroDigitos)  


 DECLARE @BalanceComprobacionMovimientos TABLE  

 ( CuentaNumero  Varchar(50),  

  MovimientosCargo Decimal(18,2),  

  MovimientosAbono Decimal(18,2)  

 )  

 INSERT INTO @BalanceComprobacionMovimientos   

 SELECT  LEFT(dbo.CuentaContable.Cuenta, @CuentaNumeroDigitos) AS CuentaNumero,   

    SUM(dbo.SaldoPeriodoCuentaContable.SaldoCargo) AS Cargo,   

    SUM(dbo.SaldoPeriodoCuentaContable.SaldoAbono)   

    AS Abono  

 FROM     dbo.SaldoPeriodoCuentaContable 
 INNER JOIN  dbo.Periodo ON dbo.SaldoPeriodoCuentaContable.IDPeriodo = dbo.Periodo.PKID 
 INNER JOIN  dbo.CuentaContable ON dbo.SaldoPeriodoCuentaContable.IDCuentaContable = dbo.CuentaContable.PKID  
 WHERE (dbo.CuentaContable.IDPlanCuentas = @idPlanCuenta) AND   (dbo.Periodo.Mes BETWEEN '01' AND @PeriodoMes) AND (dbo.Periodo.IDEjercicio = @idEjercicio)  
 GROUP BY LEFT(dbo.CuentaContable.Cuenta, @CuentaNumeroDigitos)  

 INSERT INTO @BalanceComprobacion   

 SELECT  dbo.CuentaContable.Cuenta,   
    dbo.CuentaContable.Descripcion,   
    dbo.CuentaContable.TipoCuenta,   
    ISNULL(BalanceComprobacionSaldoInicial.SaldoInicialCargo, 0),   
    ISNULL(BalanceComprobacionSaldoInicial.SaldoInicialAbono, 0),   
    ISNULL(BalanceComprobacionMovimientos.MovimientosCargo, 0),  
    ISNULL(BalanceComprobacionMovimientos.MovimientosAbono, 0)   
 FROM     dbo.CuentaContable 
 LEFT OUTER JOIN  @BalanceComprobacionSaldoInicial AS BalanceComprobacionSaldoInicial ON dbo.CuentaContable.Cuenta = BalanceComprobacionSaldoInicial.CuentaNumero 
 LEFT OUTER JOIN  @BalanceComprobacionMovimientos AS BalanceComprobacionMovimientos ON dbo.CuentaContable.Cuenta = BalanceComprobacionMovimientos.CuentaNumero  
 WHERE (dbo.CuentaContable.IDPlanCuentas = @idPlanCuenta) AND   (dbo.CuentaContable.Nivel = @CuentaNivel) AND (LEFT(dbo.CuentaContable.Cuenta, 1) > '0')  

 RETURN   

END  

