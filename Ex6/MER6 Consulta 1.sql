USE MER6;
SELECT Passatgers.DNI, Passatgers.Nom, Passatgers.Cognom, Vol.Num_Viatge, Vol.Origen, Vol.Destinacio, Reserves.Import
FROM Passatgers, Vol, Reserves
WHERE Passatgers.ID = Reserves.Passatgers_ID and Vol.ID = Reserves.Vol_ID