DECLARE @DATA DATE
DECLARE @NOTAS INT
SET @DATA = '20170102'
SELECT @NOTAS = COUNT(*) FROM [NOTAS FISCAIS]
	WHERE DATA = @DATA
IF @NOTAS > 70
	PRINT 'MUITA NOTA'
ELSE
	PRINT 'POUCA NOTA'
PRINT @NOTAS