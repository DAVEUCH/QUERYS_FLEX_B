Select ROW_NUMBER() OVER(ORDER BY ProductoServicio.Codigo) AS Row,           
Persona.Nombre as Proveedor,          
ProductoServicio.Codigo, Freddy.ProductoFreddy.CodigoInterno,           
ProductoServicio.DescripcionResumida as Linea,          
ltrim(c1.Descripcion+' ')+ltrim(c4.Descripcion+' ')+ltrim(c2.Descripcion+' ')+ltrim(c3.Descripcion+' ')+          
ltrim(c5.Descripcion+' ')+ltrim(c6.Descripcion+' ')+ltrim(c8.Descripcion+' ')+ltrim(c9.Descripcion+' ')+          
ltrim(c7.Descripcion+' ')+ltrim(c10.Descripcion) as Aplicacion,           
usv_Unidad_Activas.Abreviacion as Unid,         
tab_VentasPorProducto_Sum.UltVta_Fec, INVS.SEG_RFM ,  
UltCant_ingreso=isnull(tab_VentasPorProducto_Sum.UltCant_ingreso1,0),      
UltFec_Pedido= tab_VentasPorProducto_Sum.UltFec_Ped1,            
UltFec_ingreso= tab_VentasPorProducto_Sum.UltFec_ingreso1,         
MesesDemoraImpor=case tab_VentasPorProducto_Sum.DiasDemoraImport1 when 0 then 0 else round((tab_VentasPorProducto_Sum.DiasDemoraImport1/30.00),1) end,       
UltCant_PorLlegar=tab_VentasPorProducto_Sum.Cant_PorLlegar,        
Fec1er_PorLlegar=tab_VentasPorProducto_Sum.FecUltPed_PorLlegar,       
FecUlt_PorLlegar=tab_VentasPorProducto_Sum.FecUltllega_PorLlegar,       
tab_VentasPorProducto_Sum.FechaSinStock_PorLlegar,         
tab_VentasPorProducto_Sum.CantClien1,       
MesesPromeDemoraImpor=case tab_VentasPorProducto_Sum.diasPromDemoraImpor when 0 then 0 else round((tab_VentasPorProducto_Sum.diasPromDemoraImpor/30.00),1) end,       
tab_VentasPorProducto_Sum.PromCantVtasMes,       
TotVtas_2014_FRE=tab_VentasPorProducto_Sum.TotVtas_2014_FRE,  --dbo.usf_Producto_Stock_Freddy_Anio(tab_VentasPorProducto_Sum.Codigo, 2014),           
TotVtas_2015_FRE=tab_VentasPorProducto_Sum.TotVtas_2015_FRE,  --dbo.usf_Producto_Stock_Freddy_Anio(tab_VentasPorProducto_Sum.Codigo, 2015),           
TotVtas_2016_FRE=tab_VentasPorProducto_Sum.TotVtas_2016_FRE,  --dbo.usf_Producto_Stock_Freddy_Anio(tab_VentasPorProducto_Sum.Codigo, 2016),           
TotVtas_2017_FRE=tab_VentasPorProducto_Sum.TotVtas_2017_FRE,  --dbo.usf_Producto_Stock_Freddy_Anio(tab_VentasPorProducto_Sum.Codigo, 2017),           
TotVtas_2018_FRE=tab_VentasPorProducto_Sum.TotVtas_2018_FRE,        
TotVtas_2014_GCI=tab_VentasPorProducto_Sum.TotVtas_2014_GCI,           
TotVtas_2015_GCI=tab_VentasPorProducto_Sum.TotVtas_2015_GCI,           
TotVtas_2016_GCI=tab_VentasPorProducto_Sum.TotVtas_2016_GCI,           
TotVtas_2017_GCI=tab_VentasPorProducto_Sum.TotVtas_2017_GCI,           
TotVtas_2018_GCI=tab_VentasPorProducto_Sum.TotVtas_2018_GCI,           
TotVtas_Ult3Mes=  ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult3Mes/3,2),           
TotVtas_Ult6Mes=  ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult6Mes/6,2),           
TotVtas_Ult9Mes=  ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult9Mes/9,2),           
TotVtas_Ult12Mes=ROUND(tab_VentasPorProducto_Sum.TotVtas_Ult12Mes/12,2),              
Stock_GCI=CONVERT(int, tab_VentasPorProducto_Sum.Stock_GCI/usv_Unidad_Activas.factor),           
Stock_Freddy=CONVERT(int, tab_VentasPorProducto_Sum.Stock_Freddy / usv_Unidad_Activas.factor),          
StockGrupo=(tab_VentasPorProducto_Sum.Stock_GCI + tab_VentasPorProducto_Sum.Stock_Freddy / usv_Unidad_Activas.factor),           
4 as NumMesesComprar,      
MesesConStock=FLOOR(      
case tab_VentasPorProducto_Sum.PromCantVtasMes when 0 then 0       
else (tab_VentasPorProducto_Sum.Stock_Freddy + tab_VentasPorProducto_Sum.Cant_PorLlegar)/tab_VentasPorProducto_Sum.PromCantVtasMes      
end ),          
      
CantSugerida_aComprar =       
FLOOR(      
case tab_VentasPorProducto_Sum.PromCantVtasMes when 0 then 0       
else       
 case       
 when tab_VentasPorProducto_Sum.Stock_Freddy > FLOOR(tab_VentasPorProducto_Sum.PromCantVtasMes*4) then 0       
 else        
  case isnull(tab_VentasPorProducto_Sum.Cant_PorLlegar,0) when 0 then       
   FLOOR(tab_VentasPorProducto_Sum.PromCantVtasMes*4)-tab_VentasPorProducto_Sum.Stock_Freddy       
  else       
   case       
   when MesesConStock_PorLlegar > 4 then 0 else (4-MesesConStock_PorLlegar)*tab_VentasPorProducto_Sum.PromCantVtasMes end      
  end       
 end       
end )       
,       
tab_VentasPorProducto_Sum.CantAComprar_Confir,      
      
ProxPedido_FechaPide=      
case isnull(tab_VentasPorProducto_Sum.PromCantVtasMes,0) when 0 then null       
else       
 case isnull(tab_VentasPorProducto_Sum.Cant_PorLlegar,0) when 0 then --NO HAY IMPORTACION EN TRANSITO      
  case isnull(tab_VentasPorProducto_Sum.Stock_Freddy,0) when 0 then       
   GETDATE()      
  else      
   DATEADD(d, FLOOR((tab_VentasPorProducto_Sum.Stock_Freddy/tab_VentasPorProducto_Sum.PromCantVtasMes)*30)-tab_VentasPorProducto_Sum.DiasPromDemoraImpor, GETDATE() )      
  end      
 else --SI HAY IMPORTACION EN TRANSITO      
  DATEADD(d, tab_VentasPorProducto_Sum.DiasPromDemoraImpor*-1, tab_VentasPorProducto_Sum.FechaSinStock_PorLlegar)        
 end       
end      
,      
      
ProxPedido_llega=      
case isnull(tab_VentasPorProducto_Sum.PromCantVtasMes,0) when 0 then null       
else      
 case isnull(tab_VentasPorProducto_Sum.Cant_PorLlegar,0) when 0 then --NO HAY IMPORTACION EN TRANSITO      
  case isnull(tab_VentasPorProducto_Sum.Stock_Freddy,0) when 0 then       
    case isnull(tab_VentasPorProducto_Sum.DiasPromDemoraImpor,0) when 0 then       
   null      
    else      
   DATEADD(d, tab_VentasPorProducto_Sum.DiasPromDemoraImpor, GETDATE())        
    end       
  else      
  DATEADD(d, FLOOR((tab_VentasPorProducto_Sum.Stock_Freddy/tab_VentasPorProducto_Sum.PromCantVtasMes)*30)+tab_VentasPorProducto_Sum.DiasPromDemoraImpor, GETDATE())       
  end      
 else --SI HAY IMPORTACION EN TRANSITO      
  tab_VentasPorProducto_Sum.FechaSinStock_PorLlegar      
 end       
end      
,      
ProxPedido_Cant=      
  FLOOR(case tab_VentasPorProducto_Sum.PromCantVtasMes when 0 then 0 else tab_VentasPorProducto_Sum.PromCantVtasMes*4 end )       
,      
tab_VentasPorProducto_Sum.UltFOB_ingreso,      
UtilBruta=str(Round(case tab_VentasPorProducto_Sum.UltCostoNacionalizado when 0 then 0       
else ((tab_VentasPorProducto_Sum.ValorUnitProm/tab_VentasPorProducto_Sum.UltCostoNacionalizado)-1)*100 end ,2),10,2) + '%'      
From dbo.Producto                      
INNER JOIN Marca ON dbo.Producto.IDMarca = Marca.PKID                       
INNER JOIN usv_Unidad_Activas ON dbo.Producto.PKID = usv_Unidad_Activas.IDProductoServicio                       
INNER JOIN ProductoServicio ON dbo.Producto.PKID = dbo.ProductoServicio.PKID           
INNER JOIN ClaseProductoServicio ON ClaseProductoServicio.PKID = ProductoServicio.IDClaseProductoServicio               
LEFT OUTER JOIN (Select IDProducto, SEG_RFM From tab_InventarioProductosAñoyMes_RFM_SCORE  Where Año=2018 and Mes=5 ) INVS On INVS.IDProducto = Producto.PKID   
LEFT OUTER JOIN Freddy.ProductoFreddy On Freddy.ProductoFreddy.pkid = dbo.Producto.PKID            
LEFT OUTER JOIN dbo.Persona ON dbo.Producto.IDProveedor = dbo.Persona.PKID          
Left outer join Caracteristica c1 on Producto.IDCaracteristica1 = c1.PKID          
Left outer join Caracteristica c2 on Producto.IDCaracteristica2 = c2.PKID          
Left outer join Caracteristica c3 on Producto.IDCaracteristica3 = c3.PKID          
Left outer join Caracteristica c4 on Producto.IDCaracteristica4 = c4.PKID          
Left outer join Caracteristica c5 on Producto.IDCaracteristica5 = c5.PKID          
Left outer join Caracteristica c6 on Producto.IDCaracteristica6 = c6.PKID          
Left outer join Caracteristica c7 on Producto.IDCaracteristica7 = c7.PKID          
Left outer join Caracteristica c8 on Producto.IDCaracteristica8 = c8.PKID          
Left outer join Caracteristica c9 on Producto.IDCaracteristica9 = c9.PKID          
Left outer join Caracteristica c10 on Producto.IDCaracteristica10 = c10.PKID          
Left outer join tab_VentasPorProducto_Sum On tab_VentasPorProducto_Sum.IDProducto = Producto.PKID           
Where (dbo.ProductoServicio.Activo = 1)  And (ClaseProductoServicio.CodigoClase not in ('OBSE', 'CEL'))     --(dbo.ProductoServicio.Activo = 1)  And        
and dbo.Producto.IDMarca = 504           
--and dbo.Producto.IDProveedor = 70477         
Order by dbo.ProductoServicio.Codigo   

select*from Marca where Descripcion='CSF'
select*from Persona where Nombre like 'ADI%'

