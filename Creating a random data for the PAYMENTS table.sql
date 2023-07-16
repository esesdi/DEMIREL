DECLARE @I AS INT=0
DECLARE @ORDERID AS INT 
DECLARE @PAYMENTTYPE AS INT
DECLARE @DATE AS DATETIME
DECLARE @PAYMENTTOTAL AS FLOAT
DECLARE @APPROVECODE AS VARCHAR(15)


WHILE @I<7429 -- Loop until @I reaches 7429
BEGIN
	SET @I = @I + 1 -- Increment the loop counter by 1

	-- Select a random order ID from the ORDERS_ table
	SELECT TOP 1 @ORDERID=ID FROM DEMIREL.DBO.ORDERS_ ORDER BY NEWID()

	-- Select a random date associated with the selected order ID
	SELECT TOP 1 @DATE=DATE_ FROM ORDERS_ WHERE ID=@ORDERID ORDER BY NEWID()

	-- Select the total price of the selected order ID
	SELECT TOP 1 @PAYMENTTOTAL=TOTALPRICE FROM ORDERS_ WHERE ID=@ORDERID ORDER BY NEWID()

	-- Generate a random payment type (either 1 or 2)
	SET @PAYMENTTYPE = ABS(CHECKSUM(NEWID())) % 2 + 1

	-- Generate an approval code using the loop counter (@I)
	SET @APPROVECODE = 'APPRV' + RIGHT('000000000' + CAST(@I AS VARCHAR(10)), 10)

	-- Insert the payment details into the PAYMENTS table
	INSERT INTO PAYMENTS(ORDERID,PAYMENTTYPE,DATE_,ISOK, APPROVECODE,PAYMENTTOTAL)
		VALUES (@ORDERID,@PAYMENTTYPE,@DATE,1,@APPROVECODE,@PAYMENTTOTAL)
END

SELECT * FROM PAYMENTS
