select Fecha,
IDTipoCp,
tcpp.Descripcion as tipocp,
--cpto.Descripcion as cptoop,
tcom.Codigo as cod_doc_comp_pago,
tcom.Descripcion as tipo_doc_comp_pago,
NumCp,
per.DocIdentidad,
PersonaNombre from Cp cpp
left join tipocp tcpp on tcpp.PKID=cpp.IDTipoCp
left join TipoComprobantePago tcom on tcom.PKID=tcpp.IDTipoComprobantePago
left join CptoOperacion cpto on cpto.PKID=cpp.IDCptoOperacion
left join Persona per on per.PKID=IDPersona
where NumCp in (
'F001-2014109',
'F001-2014110',
'F001-2014111',
'F001-2014112',
'FD01-1758686',
'F004-1477862',
'F004-1477863',
'F004-1477865',
'F004-1477864'
)

select*from cp where NumCp='F001-1967581'


select*from TipoCp where Codigo in('G1320','G1330')

--PKID=5219

select*from TipoComprobantePago where PKID IN (11,100000030,100000022)

DINNER 42
CIA  30 

update cp set IDTipoCp=5774 where NumCp in (
'F004-1477862',
'F004-1477863',
'F004-1477864',
'F004-1477865',
'FD01-1758686'
)