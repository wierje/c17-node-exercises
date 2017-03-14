--1 Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT c.firstname ||' '||  c.lastname AS name, c.customerid, c.country FROM customer c WHERE c.country IS NOT 'USA';
--2 Provide a query only showing the Customers from Brazil.
SELECT c.firstname ||' '||  c.lastname AS name, c.customerid, c.country FROM customer c WHERE c.country = 'Brazil';
--3 Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT c.firstname ||' '||  c.lastname AS Name, inv.customerid AS InvoiceId, inv.invoicedate AS InvoiceDate, c.country AS Country
FROM customer c LEFT JOIN invoice inv WHERE c.country = 'Brazil'

--4 Provide a query showing only the Employees who are Sales Agents.
SELECT firstname || ' ' || lastname AS Sales_agents FROM employee WHERE title = 'Sales Support Agent'

--5 Provide a query showing a unique list of billing countries from the Invoice table.
SELECT DISTINCT billingcountry  as Country FROM invoice ORDER BY invoiceid

--6 Provide a query showing the invoices of customers who are from Brazil.
SELECT inv.invoiceid AS InvoiceId, c.country AS Country FROM invoice inv LEFT JOIN customer c WHERE country = 'Brazil'

--7 Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT e.firstname || ' ' || e.lastname AS Sales_Agent, inv.invoiceid FROM employee e LEFT JOIN invoice inv
 WHERE e.title = 'Sales Support Agent'

--8 Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT 
inv.total AS Invoice_Total,
c.firstname || ' ' || c.lastname AS Customer_name,
c.country AS Country,
e.firstname|| ' ' || e.lastname AS Sales_Agent 
FROM invoice inv  
INNER JOIN employee e INNER JOIN customer c ON c.supportrepid = e.employeeid
WHERE e.title = 'Sales Support Agent'
ORDER BY c.customerid

--9 How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
SELECT COUNT (invoiceid) from invoice WHERE invoicedate LIKE '2009%' 
SELECT COUNT (invoiceid) from invoice WHERE invoicedate LIKE '2011%'
SELECT SUM (invoiceid) FROM invoice WHERE invoicedate LIKE '2009%'
SELECT SUM (invoiceid) FROM invoice WHERE invoicedate LIKE '2011%'

--10 Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT (*) FROM invoiceline WHERE invoiceid = 37;

--11 Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT count (*) AS Line_Count FROM invoiceline GROUP BY invoiceid;

--12 Provide a query that includes the track name with each invoice line item.
SELECT t.name as Track, il.invoicelineid as Line_Id 
FROM track t INNER JOIN invoiceline il WHERE t.trackid = il.trackid;
--13 Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT t.name as Track, a.name AS Artist, il.invoicelineid as Line_Id 
FROM track t
 INNER JOIN invoiceline il WHERE t.trackid = il.trackid
 INNER JOIN album al WHERE al.albumid = t.albumid
 INNER JOIN artist a WHERE al.artistid = a.artistid
--14 Provide a query that shows the # of invoices per country. HINT: GROUP BY
--15 Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
--16 Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
--17 Provide a query that shows all Invoices but includes the # of invoice line items.
--18 Provide a query that shows total sales made by each sales agent.
--19 Which sales agent made the most in sales in 2009?
--20 Which sales agent made the most in sales in 2010?
--21 Which sales agent made the most in sales over all?
--22 Provide a query that shows the # of customers assigned to each sales agent.
--23 Provide a query that shows the total sales per country. Which country's customers spent the most?
--24 Provide a query that shows the most purchased track of 2013.
--25 Provide a query that shows the top 5 most purchased tracks over all.
--26 Provide a query that shows the top 3 best selling artists.
--27 Provide a query that shows the most purchased Media Type.

