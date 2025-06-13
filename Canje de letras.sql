select*from Cp where NumCp='003-0025666' -- 800576
select top 10 *from CanjeLetras order by PKID desc
select top 10 *from CanjeLetras where PKID=800576
select*from Letra where PKID in(
800577,
800579,
800580,
800581,
800582,
800583,
800584,
800585)
update Letra set IDBanco=0 where PKID=800577
update Letra set IDBanco=0 where PKID=800579
update Letra set IDBanco=0 where PKID=800580
update Letra set IDBanco=0 where PKID=800581
update Letra set IDBanco=0 where PKID=800582
update Letra set IDBanco=0 where PKID=800583
update Letra set IDBanco=0 where PKID=800584
update Letra set IDBanco=0 where PKID=800585
select*from ItemCanjeLetras where IDCanjeLetras=800576
update CanjeLetras set IDBanco=30 where PKID=800576
---------------------------------------------------------
select*from Cp where NumCp='003-0025668' -- 800631
select top 10 *from CanjeLetras order by PKID desc
select top 10 *from CanjeLetras where PKID=800631
select*from Letra where PKID in(
800632)
select*from ItemCanjeLetras where IDCanjeLetras=800631
