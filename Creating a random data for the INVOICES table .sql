DECLARE @I AS INT = 0
DECLARE @ORDERID AS INT
DECLARE @DATE_ AS DATETIME
DECLARE @ADDRESSID AS INT
DECLARE @CARGOFICHENO AS VARCHAR(15)
DECLARE @TOTALPRICE AS FLOAT

-- Create a temporary table to store processed order IDs
CREATE TABLE #ProcessedOrders (
    ORDERID INT
	)

WHILE @I < 7429 
BEGIN
    SET @I = @I + 1  -- Increment the loop counter

    -- Select a random order ID that has not been processed before
    SELECT TOP 1 @ORDERID = ID FROM DEMIREL.DBO.ORDERS_ WHERE ID NOT IN (SELECT ORDERID FROM #ProcessedOrders) ORDER BY NEWID()

    -- Select the date associated with the selected order ID
    SELECT TOP 1 @DATE_ = DATE_ FROM ORDERS_ WHERE ID = @ORDERID ORDER BY NEWID()

    -- Select the address ID associated with the selected order ID
    SELECT TOP 1 @ADDRESSID = ADDRESSID FROM ORDERS_ WHERE ID = @ORDERID ORDER BY NEWID()

    -- Generate a cargo file number using the loop counter (@I)
    SET @CARGOFICHENO = 'CRGF' + RIGHT('000000000' + CAST(@I AS VARCHAR(10)), 10)

    -- Select the total price of the selected order ID
    SELECT TOP 1 @TOTALPRICE = TOTALPRICE FROM ORDERS_ WHERE ID = @ORDERID ORDER BY NEWID()

    -- Insert the invoice details into the INVOICES table
    INSERT INTO INVOICES (ORDERID, DATE_, ADDRESSID, CARGOFICHENO, TOTALPRICE)
		VALUES (@ORDERID, @DATE_, @ADDRESSID, @CARGOFICHENO, @TOTALPRICE)

    -- Store the processed order ID in the temporary table
    INSERT INTO #ProcessedOrders (ORDERID) VALUES (@ORDERID)
END

-- Drop the temporary table
DROP TABLE #ProcessedOrders

SELECT * FROM INVOICES

