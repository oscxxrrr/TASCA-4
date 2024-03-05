USE MER4;
SELECT Client.Nom, Client.Cognom, Polissa.Num_Polissa as "Numero de la polissa"
FROM Client, Polissa 
WHERE Client.DNI = Polissa.Client_DNI and Client.Nom="Carlos";
