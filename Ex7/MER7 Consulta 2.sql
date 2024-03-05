use MER7;
select Ticket.Num_Factura, Ticket.Data, Treballador.Nom, Treballador.Cognom
FROM Ticket, Treballador, Producte, Linia_Ticket
WHERE Producte.ID = Linia_Ticket.Producte_ID and
Ticket.Numero = Linia_Ticket.Ticket_Numero and
Treballador.ID = Ticket.Treballador_ID and
Producte.Nom = 'Coca Cola';
