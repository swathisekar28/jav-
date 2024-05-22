SELECT 
    CONCAT(Itemname, ' price is ', Itemprice) AS ItemPriceDescription
FROM 
    ITEM;
SELECT 
    Itemname
FROM 
    ITEM
WHERE 
    Itemname LIKE '%a%';
SELECT 
    Custname
FROM 
    CUSTOMER
WHERE 
    State = 'Tamil Nadu'
ORDER BY 
    Custname;
SELECT 
    TO_CHAR(Invdate, 'Month DD, YYYY') AS FormattedDate
FROM 
    INVOICE;
SELECT 
    Itemname,
    ROUND(Itemprice) AS RoundedPrice
FROM 
    ITEM;
1 Display how many different items are available for customers.
SELECT COUNT(DISTINCT Itemno) AS NumberOfDifferentItems
FROM ITEM;

2. Find the two items with the lowest quantity on hand
SELECT Itemno, Itemname, QtyOnhand
FROM ITEM
ORDER BY QtyOnhand ASC
FETCH FIRST 2 ROWS ONLY;

3. Find invoices in which three or more items are ordered.
SELECT Invno
FROM INVITEM
GROUP BY Invno
HAVING COUNT(Itemno) >= 3;

4. Display all item quantities and item prices for invoices.
SELECT i.Invno, itm.Itemname, inv.Qty, itm.Itemprice
FROM INVOICE i
JOIN INVITEM inv ON i.Invno = inv.Invno
JOIN ITEM itm ON inv.Itemno = itm.Itemno;

5. Use an outer join to display items ordered and not ordered.
SELECT itm.Itemno, itm.Itemname, inv.Invno
FROM ITEM itm
LEFT JOIN INVITEM inv ON itm.Itemno = inv.Itemno;

6. Display invoices, customer name and item names together (multiple join).
SELECT i.Invno, c.Custname, itm.Itemname
FROM INVOICE i
JOIN CUSTOMER c ON i.Custno = c.Custno
JOIN INVITEM inv ON i.Invno = inv.Invno
JOIN ITEM itm ON inv.Itemno = itm.Itemno;

Dr. A.M. Rajeswari., CSE, VCET Page 3 of 3
21CS210 / Database Management Syatems Laboratory 2024
7. Find invoices with ‘X‘ as one of the items by using sub query.
SELECT Invno
FROM INVITEM
WHERE Itemno = (SELECT Itemno FROM ITEM WHERE Itemname = 'X');

8. Find all the items that are cheaper than item ‘X’.
SELECT itm.Itemno, itm.Itemname, itm.Itemprice
FROM ITEM itm
WHERE itm.Itemprice < (SELECT Itemprice FROM ITEM WHERE Itemname = 'X');

9. Create a table INV_JAN for all invoices of the month ‘January’ based on existing INVOICE table
CREATE TABLE INV_JAN AS
SELECT *
FROM INVOICE
WHERE EXTRACT(MONTH FROM Invdate) = 1;

10. Delete from INVOICE table that are also in INV_JAN table.
DELETE FROM INVOICE
WHERE Invno IN (SELECT Invno FROM INV_JAN);

*********************
