
DECLARE @NOME VARCHAR(200)
DECLARE @ENDERECO VARCHAR(MAX)
DECLARE CURSOR1 CURSOR FOR 
SELECT NOME, ([ENDERECO 1] + ' - ' + BAIRRO + ' - ' + CIDADE + ' - ' + ESTADO + ' - ' + CEP) ENDCOMPLETO 
FROM [TABELA DE CLIENTES]
OPEN CURSOR1
FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO
WHILE @@FETCH_STATUS = 0
BEGIN
  PRINT @NOME + ' Endereço: ' + @ENDERECO
  FETCH NEXT FROM CURSOR1 INTO @NOME, @ENDERECO
END