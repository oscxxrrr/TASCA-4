USE MER4;
SELECT Client.Nom as "Nom Client", Client.Cognom, Venedor.nom as "Nom del Venedor", Polissa.Num_Polissa, Tipus_Polissa.Nom as "Tipus Polissa"
FROM Client, Venedor,  Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.Client_DNI and Venedor.ID = Polissa.Venedor_ID and Tipus_Polissa.ID = Polissa.Tipus_Polissa_ID;

