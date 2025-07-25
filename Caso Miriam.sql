--USE [GCI]
--GO
--/****** Object:  StoredProcedure [dbo].[pFB_Modificar_Letra]    Script Date: 29/11/2024 10:40:00 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

--ALTER PROCEDURE [dbo].[pFB_Modificar_Letra]
@IDCp int ,
@NumeroUnico varchar(100),
@Observacion varchar(100),
@FechaVencimiento date
as
update Cp 
set Observacion =@Observacion 
where PKID =@IDCp 

-- letra

update Letra 
set NumeroUnicoBanco ='68374841'
where PKID = 800585

UPDATE CpCobrarPagar
SET FechaVencimiento=@FechaVencimiento
WHERE PKID=@IDCp

select *from Cp where Observacion like 'ACEPT%' 

select PKID,NumCp,Fecha,PersonaNombre from Cp where NumCp in( '001-0133107','001-0133108','001-0133109','001-0133106',
'001-0133105','001-0133104','001-0133103','001-0133102')
select*from Letra  where PKID in (800577,800579,800580,800581,800582,800583,
800584,800585)
select PKID,FechaVencimiento from CpCobrarPagar where PKID in (800577,800579,800580,800581,800582,800583,
800584,800585)
select*from persona where DocIdentidad='20604611335'---7416
select*from usv_ClientesDatosPrincipales where DocIdentidad='20604611335'
select *from usv_cuentacorriente_cliente where
DocumentoPagoPersonaDocumentoIdentidad='20604611335'
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800577
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800579
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800580
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800581
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800582
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800583
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800584
--update Letra set IDBanco='002',EnBanco=1 where  PKID=800585
FechaVencimiento
2024-11-27 00:00:00.000
2024-12-04 00:00:00.000
2024-12-11 00:00:00.000
2024-12-25 00:00:00.000
2025-01-01 00:00:00.000
2025-01-08 00:00:00.000
2025-01-08 00:00:00.000
2025-01-08 00:00:00.000

update CpCobrarPagar set FechaVencimiento='20241127' where PKID=800577
