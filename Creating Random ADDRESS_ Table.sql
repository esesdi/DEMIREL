DECLARE @I AS INT = 0
DECLARE @COUNTRYID AS INT
DECLARE @USERID AS INT
DECLARE @CITYID AS INT
DECLARE @TOWNID AS INT
DECLARE @ID AS INT

-- Create temporary table
CREATE TABLE #SelectedIDs (
    ID INT
)

WHILE @I < 2000
BEGIN
    SET @I = @I + 1

    -- Choosing a random USERID
    SELECT TOP 1 @USERID = ID FROM DEMIREL.DBO.USERS WHERE ID NOT IN (SELECT ID FROM #SelectedIDs) ORDER BY NEWID()

    -- Terminate the loop when all USERIDs are used
    IF @USERID IS NULL
        BREAK

    -- Choosing a random COUNTRYID
    SELECT TOP 1 @COUNTRYID = COUNTRYID FROM CITIES ORDER BY NEWID()

    -- Choosing a random CITYID
	SELECT TOP 1 @CITYID=CITYID FROM TOWNS ORDER BY NEWID()

    -- Choosing a random TOWNID
    SELECT TOP 1 @TOWNID = ID FROM TOWNS WHERE CITYID = @CITYID ORDER BY NEWID()

    -- Add selected ID to temporary table
    INSERT INTO #SelectedIDs (ID) VALUES (@USERID)

    -- INSERT the record
    INSERT INTO ADDRESS_ (USERID, COUNTRYID, CITYID, TOWNID)
    VALUES (@USERID, @COUNTRYID, @CITYID, @TOWNID)

    SET @ID = SCOPE_IDENTITY()

    PRINT 'Inserted ID: ' + CONVERT(VARCHAR(10), @ID)
END

-- Drop temporary table
DROP TABLE #SelectedIDs

SELECT * FROM ADDRESS_
