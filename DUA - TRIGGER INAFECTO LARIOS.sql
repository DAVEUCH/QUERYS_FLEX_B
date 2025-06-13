select*from Cp where 
PKID=2970382
and
NumCpContable='1-03-2025-0000260' 
update Cp set NumCp='235-2025-28-1869002' where PKID=2970382
select*from ItemCp where IDCp=2970382
select*from cp where IDTipoCp=4870 and IDCptoOperacion in (1835,1973)
and Total<=0
order by PKID desc

update ItemCp set Total='4.5558', PorcentajeImpto='18.00',ValorAfecto='25.3100000',ValorInafecto='0.00',Inafecto=0 where PKID=9223201

select*from TipoCp where PKID=4870
select*from CptoOperacion where PKID=1835
select*from CptoOperacion where PKID=1973

select top 2*from CptoOperacion order by PKID desc

CREATE TRIGGER tr_ActualizarValoresCP_AFECTO_INAFECTO_AJUSTE
ON CP
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE CP
    SET 
        ValorInafecto = i.ValorAfecto,
        ValorAfecto = 0.000
    FROM 
        CP c
    INNER JOIN 
        inserted i ON c.PKID = i.PKID
    WHERE 
        i.IDTipoCp = 4870
        AND i.IDCptoOperacion = 1973
        AND i.Total <= 0;
END;
