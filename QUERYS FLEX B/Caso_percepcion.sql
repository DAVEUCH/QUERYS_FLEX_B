Select * from usv_ComprobaPercepcion_Clientes
WHERE Fecha_Percepcion BETWEEN '2024-19-08' AND '2024-22-08'

Select IDCp, PorcentajePercepcion,SUM(SubTotal) as SubTotal from itemcp
where PorcentajePercepcion>0.00   group by IDCp, PorcentajePercepcion

select top(10)*from itemcp where IDCp=2818257

CREATE TABLE #temp_consulta (
    IDCp INT,
    PorcentajePercepcion DECIMAL(18, 2),
    SubTotal DECIMAL(18, 2)
);

INSERT INTO #temp_consulta (IDCp, PorcentajePercepcion, SubTotal)
SELECT IDCp, PorcentajePercepcion, SUM(SubTotal) as SubTotal 
FROM itemcp
WHERE PorcentajePercepcion > 0.00
GROUP BY IDCp, PorcentajePercepcion;


select top(10)*from DocCobrarPagar where IDCp=5527

Select IDCp, PorcentajePercepcion,SUM(SubTotal) as SubTotal from itemcp
where PorcentajePercepcion>0.00   group by IDCp, PorcentajePercepcion


Select * from usv_ComprobaPercepcion_Clientes
WHERE Fecha_Percepcion BETWEEN '2024-19-08' AND '2024-22-08'
select*from Cp where NumCp='F02-0003427' and PKID=2818257
select top(10)*from DocCobrarPagar where IDCp=2755733 -- pkd de factura 2755733  - F02-0041958
select top(10)*from vInfoCpPercepcion_ness where ComprobanteNumCp='F02-0003427'
select*from #temp_consulta where IDCp=2755733
select pkid,NumCp,SubTotal from Cp where PKID=2755733
select*from ItemCp where IDCp=2755733



