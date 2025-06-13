--USE [GCI]
--GO

--/****** Object:  View [dbo].[usv_Control_Comprobantes_VPM]    Script Date: 13/06/2025 12:26:55 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO


ALTER VIEW [dbo].[usv_Control_Comprobantes_VPM]      
AS 
Select     

/*usv_Pedido_cabecera.PedidoID, usv_Pedido_cabecera.Fecha, usv_DocVenta_cabecera.FacturaID,     
usv_GuiasSalidas_cabecera.GuiaID, usv_Consolidado_CabecerayDetalleDocs.ConsolidadoID, vFACT.IDCp , vGUIA.IDCp, */    
    
usv_Pedido_cabecera.PedidoNro, usv_Pedido_cabecera.Fecha,     
usv_Pedido_cabecera.PedidoFechaEmision, usv_Pedido_cabecera.PedidoHoraEmision,       
usv_Pedido_cabecera.PedidoEstadoAprobacion, usv_Pedido_cabecera.PedidoFechaAprobacion, usv_Pedido_cabecera.PedidoHoraAprobacion,       
usv_Pedido_cabecera.ClienteNombre, usv_Pedido_cabecera.VendedorNombre,  usv_Pedido_cabecera.ZonaReparto,    
isnull(usv_DocVenta_cabecera.FacturaNro,usv_DocVenta_cabecera2.FacturaNro) as FacturaNro, 
isnull(usv_DocVenta_cabecera.FacturaFechaEmision, usv_DocVenta_cabecera2.FacturaFechaEmision) as FacturaFechaEmision, 
isnull(usv_DocVenta_cabecera.FacturaHoraEmision, usv_DocVenta_cabecera2.FacturaHoraEmision) as FacturaHoraEmision, 
isnull(usv_DocVenta_cabecera.FacturaTotal, usv_DocVenta_cabecera2.FacturaTotal) as FacturaTotal,     
isnull(usv_GuiasSalidas_cabecera.GuiaNro,usv_GuiasSalidas_cabecera2.GuiaNro) as GuiaNro, 
isnull(usv_GuiasSalidas_cabecera.GuiaFechaEmision, usv_GuiasSalidas_cabecera2.GuiaFechaEmision) as GuiaFechaEmision, 
isnull(usv_GuiasSalidas_cabecera.GuiaHoraEmision, usv_GuiasSalidas_cabecera2.GuiaHoraEmision) as GuiaHoraEmision, 
isnull(usv_Consolidado_CabecerayDetalleDocs.ConsolidadoNro, usv_Consolidado_CabecerayDetalleDocs2.ConsolidadoNro) as ConsolidadoNro, 
isnull(usv_Consolidado_CabecerayDetalleDocs.ConsolidadoFechaEmision, usv_Consolidado_CabecerayDetalleDocs2.ConsolidadoFechaEmision) as ConsolidadoFechaEmision, 
isnull(usv_Consolidado_CabecerayDetalleDocs.ConsolidadoHoraEmision, usv_Consolidado_CabecerayDetalleDocs2.ConsolidadoHoraEmision) as ConsolidadoHoraEmision ,
usv_Pedido_cabecera.Direccion_cliente,
Departamento+'-'+Provincia+'-'+Distrito as ubigeo,
usv_Pedido_cabecera.Telefonos,
usv_Pedido_cabecera.Nombre_agencia,
usv_Pedido_cabecera.Direccion_Agencia
From usv_Pedido_cabecera      
Left outer join (SELECT DISTINCT IDCp, IDCpRelacionado FROM vCpRelacionado ) vFACT On vFACT.IDCpRelacionado = usv_Pedido_cabecera.PedidoID       
Left outer join usv_DocVenta_cabecera  On  vFACT.IDCp  = usv_DocVenta_cabecera.FacturaID      
Left outer join (SELECT DISTINCT IDCp, IDCpRelacionado FROM vCpRelacionado Where PKID_DestinoTipoCp = 4866) vGUIA On vGUIA.IDCpRelacionado = usv_DocVenta_cabecera.FacturaID       
Left outer join usv_GuiasSalidas_cabecera  On  vGUIA.IDCp  = usv_GuiasSalidas_cabecera.GuiaID      

Left outer join (SELECT DISTINCT IDCp, IDCpRelacionado FROM CpRelacionado Where IDTipoCpDestino='878') vGUIA2 On vGUIA2.IDCpRelacionado = usv_Pedido_cabecera.PedidoID        
Left outer join usv_GuiasSalidas_cabecera usv_GuiasSalidas_cabecera2  On  vGUIA2.IDCp  = usv_GuiasSalidas_cabecera2.GuiaID      

Left outer join (SELECT DISTINCT IDCp, IDCpRelacionado FROM CpRelacionado Where IDTipoCpDestino='883' ) vFACT2 On vFACT2.IDCpRelacionado = usv_GuiasSalidas_cabecera2.GuiaID       
Left outer join usv_DocVenta_cabecera usv_DocVenta_cabecera2  On  vFACT2.IDCp  = usv_DocVenta_cabecera2.FacturaID      

Left outer join usv_Consolidado_CabecerayDetalleDocs ON usv_Consolidado_CabecerayDetalleDocs.IDfactura = usv_DocVenta_cabecera.FacturaID     
Left outer join usv_Consolidado_CabecerayDetalleDocs usv_Consolidado_CabecerayDetalleDocs2 ON usv_Consolidado_CabecerayDetalleDocs2.IDfactura = usv_DocVenta_cabecera2.FacturaID     
GO


