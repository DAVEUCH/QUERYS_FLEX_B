SELECT    dbo.Cp.PKID AS ID, dbo.Cp.NumCp, dbo.Cp.Fecha, dbo.Cp.Hora, dbo.Persona.Nombre AS PersonaNombre, dbo.Cp.Total, 
                      (CASE dbo.Cp.Anulado WHEN 0 THEN 'Activo' ELSE 'Anulado' END) AS Expr1, dbo.CpCompra.EstadoEntrega, dbo.Moneda.Simbolo, 
                      dbo.TipoCp.Abreviacion AS TipoCp, dbo.CpCompra.EstadoDevolucion, dbo.CpCompra.EstadoEntregaDevolucion, dbo.CpCompra.EstadoDescuento, 
                      dbo.Sucursal.Nombre AS Sucursal, dbo.CpCobrarPagar.Credito, dbo.ModalidadCredito.Descripcion AS ModalidadCredito, dbo.Cp.NumCpContable, 
                      dbo.Cp.TipoCambio, dbo.CpCobrarPagar.Saldo, CpCompra.NumeroReferencia, Cp.Observacion
FROM         dbo.Cp INNER JOIN
                      dbo.Moneda ON dbo.Cp.IDMoneda = dbo.Moneda.PKID INNER JOIN
                      dbo.Periodo ON dbo.Cp.IDPeriodo = dbo.Periodo.PKID INNER JOIN
                      dbo.TipoCp ON dbo.Cp.IDCptoOperacion = dbo.TipoCp.PKID INNER JOIN
                      dbo.CptoOperacion ON dbo.Cp.IDCptoOperacion = dbo.CptoOperacion.PKID INNER JOIN
                      dbo.Sucursal ON dbo.Cp.IDSucursal = dbo.Sucursal.PKID INNER JOIN
                      dbo.CpCompra ON dbo.Cp.PKID = dbo.CpCompra.PKID INNER JOIN
                      dbo.TipoCpCompra ON dbo.TipoCp.PKID = dbo.TipoCpCompra.PKID INNER JOIN
                      dbo.CpCobrarPagar ON dbo.Cp.PKID = dbo.CpCobrarPagar.PKID INNER JOIN
                      dbo.Persona ON dbo.Cp.IDPersona = dbo.Persona.PKID LEFT OUTER JOIN
                      dbo.ModalidadCredito ON dbo.CpCobrarPagar.IDModalidadCredito = dbo.ModalidadCredito.PKID
					  WHERE CptoOperacion.Codigo='CG031'

					  

					  select top 5*from TipoCp where Codigo='PRECOM'
					  select top 5 *from CptoOperacion where Codigo='CG031'

					select TOP 10  * from vista  where  TipoReporte.Nombre = 'PRESUPUESTO' AND Reporte.Activo = 1