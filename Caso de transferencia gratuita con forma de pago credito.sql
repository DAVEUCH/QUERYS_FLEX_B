Select * from vrpteVentas_DetComprobantesyProductos_Mercaderia Where Fecha Between '2024-01-08' And '2024-20-08'

select top(10)*from Cp where NumCp in('F002-0001000','F002-0001053')
select top(10)*from Cp where NumCp in('F001-0027431')

---AHORA PONERLE EL CREDITO
select top(10)*from Cp
where NumCp in('F09-0009827') and PKID=2906634
update CpCobrarPagar
set Credito=1 where PKID=811675

select*from Cp where NumCp in('F001-0000081')--100000478

select*from Cp where NumCp in('F001-0025931')--100000037
select*from CpCobrarPagar where PKID=815916
update CpCobrarPagar set IDModalidadCredito=57,
FechaProgramacionPago='23-01-2025', FechaPago='23-01-2025',FechaVencimiento='23-01-2025'
where PKID=815916

select*from CpCobrarPagar where PKID in (802544,815916)
select*from CpCobrarPagar where PKID=2948466

select*from CpCobrarPagar where PKID=839019

update CpCobrarPagar set IDModalidadCredito= 57,Credito=1
where PKID=2906634
----------------------------------------------
update CpCobrarPagar set IDModalidadCredito= 100000037,Credito=1
where PKID=827052

SELECT*FROM ModalidadCredito where PKID=100000037
update CpCobrarPagar set IDModalidadCredito=57, FechaProgramacionPago='23-12-2024', FechaPago='23-12-2024' where PKID=815916

--select*from CpVenta where PKID in(788548,792163)

select*from MedioDePago where FechaEmision='2024-17-08'

select*from ModalidadCredito wh

--update cp set IDMotivoAnulacion=0 where NumCp='F002-0000862'
---------------------------------------------------------------------
select top(10)*from Cp where NumCp in('F001-0027232')
select*from CpCobrarPagar where PKID=835979
SELECT*FROM ModalidadCredito where PKID=100000037

update CpCobrarPagar set IDModalidadCredito=100000036,Credito=1 where PKID=835979
