use MER5;
SELECT Client.Nom, Vehicle.Marca_Fabricant, Tipus_Vehicle.Nom, Cites.Data, Client_Vehicle.Data_Final
FROM Client, Vehicle, Tipus_Vehicle, Cites, Client_Vehicle
WHERE Client.DNI = Client_Vehicle.Client_DNI and Tipus_Vehicle_ID = Vehicle_Tipus_Vehicle_ID and
Client_Vehicle.ID = Cites.Vehicle_ID