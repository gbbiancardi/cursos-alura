DECLARE @TABELA TABLE (NUMERO INT)
DECLARE @CONTADOR INT
DECLARE @CONTMAXIMO INT
SET @CONTADOR = 1
SET @CONTMAXIMO = 1000
WHILE @CONTADOR <= @CONTMAXIMO
BEGIN
    INSERT INTO @TABELA (NUMERO) VALUES 
        ([dbo].[NumeroAleatorio](0,1000))
    SET @CONTADOR = @CONTADOR + 1
END
SELECT * FROM @TABELA