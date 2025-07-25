USE [FREDDY]
GO
/****** Object:  StoredProcedure [dbo].[usp_ComprobanteND_Info_Detalle_FACTUS]    Script Date: 20/12/2024 15:50:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_ComprobanteND_Info_Detalle_FACTUS]

(                                            

@PKID int                                            

)                                            

AS                                                  

Set nocount on                                                

SELECT dbo.Cp.PKID, 

CuentaContable.Cuenta as Codigo_producto, 

Replace(ItemCp.Descripcion,'"', '''') AS ProductoDescripcion,

--CuentaContable.Descripcion, 

--when '7799102 - INTERESES GANADOS POR LETRAS EN COBRANZA LIBRE' then  '01'

--when '7799103 - PENALIDAD' then  '03'

--when '7799104 - POR ENVIO DE FLETE' then  '02'

case CuentaContable.Cuenta 

when '7799102' then  '01'

when '7799103' then  '03'

when '7799104' then  '02'

end as Motivo, 

case CuentaContable.Cuenta 

when '7799102' then  'INTERESES POR MORA'

when '7799103' then  'PENALIDAD/OTROS CONCEPTOS'

when '7799104' then  'AUMENTO AL VALOR'

end as Sustento, 

CuentaContable.Cuenta as Codigo_producto, 

ItemCp.Cantidad,                                

case ItemCp.TipoItemCp                              

when 2 then 'NIU'  

when 3 then 'MON'   

END  AS UndMed,                               

  

ROUND(ItemCpVenta.PrecioLista,2) AS PrecioLista,     

ItemCpVenta.DescuentoAplicado,     

0 AS PorceDescuento,     

0 AS MontoDescuento,     

ROUND(ItemCp.Total,2) AS PrecioVenta, --Precio Total con IGV (Cant*pu)                                          

ItemCp.ValorVenta as Total_item,  --Precio Total sin IGV (Cant*pu)                                          

Round(ItemCp.ValorUnitario  / (1+(ItemCp.PorcentajeImpto/100)),2) as Precio_unitario, --Precio Unitario sin IGV                                             

Round(ItemCp.Total - ItemCp.ValorVenta,2) as totImpuesto_Unitario, ItemCp.PorcentajeImpto, ItemCp.MontoPercepcion 

FROM                                             

dbo.Cp       

LEFT OUTER JOIN dbo.ItemCp ON ItemCp.IDCp = dbo.Cp.PKID       

LEFT OUTER JOIN dbo.ItemCpVenta ON ItemCpVenta.PKID = ItemCp.PKID       

LEFT OUTER JOIN dbo.itemCuentaContable ON itemcuentacontable.PKID = ItemCp.PKID 
LEFT OUTER JOIN dbo.cuentaContable ON cuentaContable.PKID = itemcuentacontable.idCuentaContable 

WHERE Cp.PKID = @PKID 
