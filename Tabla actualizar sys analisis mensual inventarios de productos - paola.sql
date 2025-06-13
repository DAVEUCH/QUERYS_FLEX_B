select*from dbo.tab_InventarioProductosAñoyMes_RFM_SCORE 
where Año=2024 and mes in(1,2,3,4,5,6)
order by Año asc