SELECT DISTINCT dbo.Aranceles.Id_Arancel, dbo.Aranceles.Descripcion, dbo.Aranceles.Detalle, dbo.CuentasporCobrar.FechaVencimiento
FROM            dbo.Aranceles LEFT OUTER JOIN
                         dbo.CuentasporCobrar ON dbo.Aranceles.Id_Arancel = dbo.CuentasporCobrar.Id_Arancel
WHERE        (dbo.Aranceles.Detalle LIKE '%2021-1%') 
				AND (dbo.Aranceles.Descripcion LIKE '%CUOTA%')
				AND (dbo.Aranceles.Descripcion NOT LIKE '%SAIA%')
ORDER BY dbo.Aranceles.Id_Arancel


SELECT * FROM CuentasporCobrar 
WHERE Id_Arancel = 1735 AND FechaVencimiento = '2021-06-09'--CAST('17/05/2021' as datetime)

UPDATE CuentasporCobrar SET FechaVencimiento = CAST('17/07/2021' as datetime)
	WHERE Id_Arancel = 1737