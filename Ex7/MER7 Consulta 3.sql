use MER7;
select count(*)
FROM Linia_Ticket, Ticket, Treballador
WHERE Ticket.Numero = Linia_Ticket.Ticket_Numero and
Treballador.ID = Ticket.Treballador_ID and Treballador.ID LIKE '2';
