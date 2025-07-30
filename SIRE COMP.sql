EXEC usp_propuesta_rce_ins '20100765790', 'REPUESTOS FREDDY SOCIEDAD ANONIMA CERRADA', '202507', '2042141321601F0010000006104', '01/07/2025', '16/07/2025', '01', 'F001', 0, 6104, '', '6',
'20421413216', 'FONDO CONSOLIDADO DE RESERVAS PREVISIONALES', 4728.81, 851.19, 0, 0, 0, 0, 0, 0, 0, 0, 5580, 'PEN', 1, '', '', '', '', '', '', '', '', '0.00', '', 'D', '', '1', 0 

EXEC usp_propuesta_rce_per_del '202507' 

select*from propuesta_rce 
where Periodo='202507'

usp_propuesta_rce_ins