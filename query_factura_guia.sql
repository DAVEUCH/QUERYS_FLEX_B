USE [FREDDY]
GO

/****** Object:  View [dbo].[vrpt_FacturaGuia]    Script Date: 31/10/2024 13:01:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vrpt_FacturaGuia]
AS
--SELECT     TOP (100) PERCENT dbo.Cp.PKID AS CpVentaID, Cp_1.NumCp AS GuiaNumCp
--FROM         dbo.Cp AS Cp_1 INNER JOIN
--                      dbo.CpRelacionado ON Cp_1.PKID = dbo.CpRelacionado.IDCpRelacionado RIGHT OUTER JOIN
--                      dbo.Cp INNER JOIN
--                      dbo.CpVenta ON dbo.Cp.PKID = dbo.CpVenta.PKID ON dbo.CpRelacionado.IDCp = dbo.Cp.PKID
--ORDER BY GuiaNumCp
SELECT 
    Cp.PKID AS CpVentaID,
    STUFF(
        (SELECT '/' + Cp_1.NumCp
         FROM dbo.Cp AS Cp_1
         INNER JOIN dbo.CpRelacionado ON Cp_1.PKID = dbo.CpRelacionado.IDCpRelacionado
         WHERE dbo.CpRelacionado.IDCp = Cp.PKID
         FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 
        1, 1, '') AS GuiaNumCp
FROM 
    dbo.Cp
INNER JOIN 
    dbo.CpVenta ON dbo.Cp.PKID = dbo.CpVenta.PKID
GROUP BY 
    Cp.PKID;
GO


