 EXEC usp_GC_M_Colectores_ins 'FREDDY', 'ALM05', '11', 'MP.68084456AA', 2, '17/06/2025 04:11:50' 


select top 10*from GC_M_Colectores where Producto='GB.GWHY-44AH' and pkid=1
--update GC_M_Colectores set Fecha='17/06/2025 04:11:50' where pkid=37381 and Producto='MP.68084456AA'--17/06/2025 04:11:50

--SELECT top 20* FROM GC_M_Colectores WHERE CONVERT(datetime, Fecha) > GETDATE()
---REPORTE DATOS DE COLECTOR
EXEC usp_GC_M_Colectores_show_Almacen_Fechas 7, '05/01/2010', '05/01/2010'

EXEC usp_GC_M_Colectores_show_Almacen_Fechas 5, '20200101', '20250617'

---REPORTE RESULTADO STOCK DEL COLECTOR
 EXEC usp_repInv_diferencias_AlmacenColector 5, '17/06/2025', '17/06/2025'

 --reporte no inventariados
  EXEC usp_repInv_PendientesLeer_Almacen_Fechas 5, '17/06/2025', '17/06/2025'

   --EXEC usp_repInv_diferencias_AlmacenALLProd 3, '14/07/2025' , '14/07/2025' 

 ---reporete de productos con codigos no enconyrados
  EXEC usp_GC_M_Colectores_NO_Encontrados_show_Almacen_Fechas 5, '17/06/2025', '17/06/2025'

SELECT TOP 20 * FROM Almacen
SELECT TOP 20 * FROM Marca where Descripcion='2D'

exec usp_Reposicion_Stock_Marca3 1,5
 EXEC usp_Reposicion_Stock_Proveedor 70477, 4

 exec usp_Reposicion_Stock_Marca3 504,4

  EXEC usp_Reposicion_Stock 1

 select*from Marca where PKID=504

 select 
 per.PKID,
  per.DocIdentidad,
 per.Nombre
 from Proveedor pro
 inner join Persona per on per.PKID=pro.PKID
 order by  per.Nombre asc


 drop procedure [dbo].[usp_GC_M_Colectores_show_Almacen_Fechas_1]  
(  
@IDAlmacen	int,
@Fecha_Ini	date,
@Fecha_Fin	date
)  
as  
set nocount on  
Declare @CODAlmacen varchar(10)  
Set @CODAlmacen = dbo.usf_Almacen_info_Cod(@IDAlmacen)  
Select Empresa, Almacen, Ubicacion, Producto, Cantidad, Fecha  
From GC_M_Colectores  
Where Almacen = @CODAlmacen  
--And   left(Fecha,10) between @Fecha_Ini and @Fecha_Fin
And   TRY_CAST(LEFT(Fecha,10) AS DATE) between @Fecha_Ini and @Fecha_Fin
Order by Producto, Ubicacion, Fecha

EXEC usp_GC_M_Colectores_show_Almacen_Fechas 5, '2020-01-01', '2020-01-01'


 

