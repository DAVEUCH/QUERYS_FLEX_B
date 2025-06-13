Select * from vrpteVentas_DetComprobantesyProductos_Mercaderia Where Fecha Between '2024-01-08' And '2024-20-08'

select top(10)*from Cp where NumCp in('F002-0001000','F002-0001053')
select top(10)*from Cp where NumCp in('F002-0000981')

---AHORA PONERLE EL CREDITO
select top(10)*from Cp
where NumCp in('F09-0009827') and PKID=2906634
update CpCobrarPagar 
set Credito=1 where PKID=811675

select*from Cp where NumCp in('F001-0025712')--100000478
select*from Cp where NumCp in('F001-0025718')--100000478

select*from CpCobrarPagar where PKID in (802544,815916)
select*from CpCobrarPagar where PKID=2906634

select*from CpCobrarPagar where PKID=807241

update CpCobrarPagar set IDModalidadCredito= 57,Credito=1
where PKID=2906634

update CpCobrarPagar set IDModalidadCredito= 0,Credito=0
where PKID=2906634

SELECT*FROM ModalidadCredito

--select*from CpVenta where PKID in(788548,792163)

select*from MedioDePago where FechaEmision='2024-17-08'

select*from ModalidadCredito

--update cp set IDMotivoAnulacion=0 where NumCp='F002-0000862'

