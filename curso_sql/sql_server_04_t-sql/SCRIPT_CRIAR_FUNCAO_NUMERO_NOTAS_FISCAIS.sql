CREATE FUNCTION NUMERONOTAS (@DATA DATE) RETURNS INT
AS
BEGIN
  DECLARE @NUMNOTAS INT
  SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS] 
  WHERE DATA = @DATA
  RETURN @NUMNOTAS
END

SELECT [dbo].[NUMERONOTAS]('20170202')