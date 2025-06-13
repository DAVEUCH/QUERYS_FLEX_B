select FechaCobranza, TipoDocVenta, NumeroDocVenta, Cliente, ImporteDocVenta_aDolares, 
ImporteCobrado_aDolares, Saldo_aDolares, Numero_recibo from usv_CobranzasClientesyDocs
order by FechaCobranza

select*from usv_CobranzasClientesyDocs

select top(100)*from cp 

select*from CptoOperacion where PKID in('1008','1736')

select*from CptoOperacion where Descripcion like 'cobranza%'