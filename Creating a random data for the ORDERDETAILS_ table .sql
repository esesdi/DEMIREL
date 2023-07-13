DECLARE @ITEMCOUNT AS INT
DECLARE @ITEMID AS INT
DECLARE @PRICE AS FLOAT
DECLARE @AMOUNT AS INT

SET @ITEMCOUNT = 7500

-- Create a temporary table to mimic sequential numbering
CREATE TABLE #TempOrders (
    RowNum INT IDENTITY(1, 1),
    OrderID INT)

-- Populate the IDs
INSERT INTO #TempOrders (OrderID)
SELECT ID FROM ORDERS_
WHERE ID BETWEEN 1 AND @ITEMCOUNT

DECLARE @I AS INT = 0
WHILE @I < @ITEMCOUNT
BEGIN
    SET @I = @I + 1

    -- Create a new ORDERID
    DECLARE @ORDERID AS INT
    SELECT @ORDERID = OrderID
    FROM #TempOrders
    WHERE RowNum = @I

    -- Select random ITEMID, UNITPRICE, and AMOUNT values
    SELECT TOP 1 @ITEMID = ID, @PRICE = UNITPRICE
    FROM ITEMS
    ORDER BY NEWID()
    SET @AMOUNT = 1 + (RAND() * 10)
    -- Insert data into the ORDERDETAILS_ table
    INSERT INTO ORDERDETAILS_ (ORDERID, ITEMID, AMOUNT, UNITPRICE, LINETOTAL)
    VALUES (@ORDERID, @ITEMID, @AMOUNT, @PRICE, @PRICE * @AMOUNT)

    -- Update the TOTALPRICE column in the ORDERS_ table
    UPDATE ORDERS_
    SET TOTALPRICE = (
        SELECT SUM(LINETOTAL)
        FROM ORDERDETAILS_
        WHERE ORDERID = @ORDERID
    )
    WHERE ID = @ORDERID
END

-- Clean up the TempOrders table
DROP TABLE #TempOrders