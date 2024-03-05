USE MER4;
SELECT Polissa.Num_Polissa as "Numero de la polissa", Tipus_Polissa_ID as "Nom Polissa", Client_DNI, Client.Nom as "Nom Client", Client.Cognom as "Cognom del Client"
FROM Client, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.Client_DNI and Tipus_Polissa_ID = Polissa.Tipus_Polissa_ID and Tipus_Polissa.Nom = "Viatge";
