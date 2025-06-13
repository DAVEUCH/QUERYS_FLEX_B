select top 10*from CpRelacionado where IDTipoCpRelacionado='883' and IDTipoCpDestino='818'
select top 10*from CpRelacionado_2
SELECT *
INTO CpRelacionado_2
FROM CpRelacionado
WHERE 1 = 0;

select*from Cp where PKID=27740
select*from Cp where PKID=27708

select*from TipoCp where PKID=4945
select*from TipoCp where PKID=4904

CREATE TRIGGER trg_Replica_CpRelacionado
ON CpRelacionado
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO CpRelacionado_2 (IDCp, IDCpRelacionado, IDTipoCpRelacionado, IDTipoCpDestino)
    SELECT IDCp, IDCpRelacionado, IDTipoCpRelacionado, IDTipoCpDestino
    FROM inserted
    WHERE IDTipoCpRelacionado = 883
      AND IDTipoCpDestino IN (818, 868);
END;

