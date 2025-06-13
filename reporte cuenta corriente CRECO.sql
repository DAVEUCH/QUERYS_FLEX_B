SELECT * FROM dbo.fFB_CuentaCorrienteCajaBanco_CRECO(@FechaDesde,@FechaHasta)

-- Declarar las variables para las fechas de inicio y fin
DECLARE @FechaDesde DATE = '2024-06-20';
DECLARE @FechaHasta DATE = '2024-06-20';

-- Ejecutar la función y seleccionar el resultado
SELECT * 
FROM dbo.fFB_CuentaCorrienteCajaBanco_CRECO(@FechaDesde, @FechaHasta)
where ConceptoOperacionCodigo='C009_D'
