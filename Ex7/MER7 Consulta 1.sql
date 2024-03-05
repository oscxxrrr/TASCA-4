use MER7;
select Producte.Nom, Producte.Descripció,Producte.IVA,Producte.Preu_Unitari
FROM Producte
WHERE Producte.IVA= '4%';
