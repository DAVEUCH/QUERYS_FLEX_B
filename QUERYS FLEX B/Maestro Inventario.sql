select top 5 *from Cp order by PKID desc
select top 5 *from TipoCpInvent order by PKID desc
select top 5 *from ItemCpInventario order by PKID desc
select top 5 *from eItemCpInventarioSalida order by PKID desc
select top 5*from CpInventarioSalida order by PKID desc
select top 5 *from CpInventario order by PKID desc
SELECT
cpv.PKID,
cpv.NumCp,
cpV.FechaEmision,
per.Codigo,
tcpv.Codigo as codigodoc,
tcpv.TipoCp,
invsa.DocIdentidad,
per.Codigo,
cpv.PersonaNombre,
invsa.DireccionEntrega,
cpv.Anulado
FROM CP cpv
left join Persona per on per.PKID= cpv.IDPersona
left join Empleado emp on emp.PKID=PER.PKID
left join TipoCp tcpv on tcpv.PKID=cpv.IDTipoCp
left join CpInventarioSalida invsa on invsa.PKID=cpv.PKID
left join CpInventario cpinv on cpinv.IDCp=cpv.PKID
left join Almacen al on al.PKID=cpinv.IDAlmacen
--left join ItemCpInventario icpinv on icpinv.PKID
where
cpv.NumCp='T002-00000081'
