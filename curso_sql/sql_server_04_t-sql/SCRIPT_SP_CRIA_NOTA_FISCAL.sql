CREATE PROCEDURE CriaNotaFiscal 
@DATA AS DATE
AS
BEGIN

DECLARE @CLIENTE VARCHAR(12)
DECLARE @VENDEDOR VARCHAR(12)
DECLARE @PRODUTO VARCHAR(12)
DECLARE @NUMERO INT
DECLARE @IMPOSTO FLOAT
DECLARE @NUM_ITENS INT
DECLARE @CONTADOR INT
DECLARE @QUANTIDADE INT
DECLARE @PRECO FLOAT
DECLARE @LISTAPRODUTOS TABLE (PRODUTO VARCHAR(20))
DECLARE @AUXPRODUTO INT

SET @DATA = '20180521'
SET @CLIENTE = [dbo].[EntidadeAleatoria]('CLIENTE')
SET @VENDEDOR = [dbo].[EntidadeAleatoria]('VENDEDOR')
SELECT @NUMERO = MAX(NUMERO) + 1 FROM [NOTAS FISCAIS]
SET @IMPOSTO = 0.18
SET @CONTADOR = 1
SET @NUM_ITENS = [dbo].[NumeroAleatorio](2, 10)

INSERT INTO [NOTAS FISCAIS] (CPF, MATRICULA, DATA, NUMERO, IMPOSTO)
VALUES (@CLIENTE, @VENDEDOR, @DATA, @NUMERO, @IMPOSTO)

WHILE @CONTADOR <= @NUM_ITENS
BEGIN
    SET @PRODUTO = [dbo].[EntidadeAleatoria]('PRODUTO')
    SELECT @AUXPRODUTO = COUNT(*) FROM @LISTAPRODUTOS 
        WHERE PRODUTO = @PRODUTO 
    IF @AUXPRODUTO = 0
    BEGIN
        SET @QUANTIDADE = [dbo].[NumeroAleatorio](5, 100)
        SELECT @PRECO = [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS] 
            WHERE [CODIGO DO PRODUTO] = @PRODUTO
        INSERT INTO [ITENS NOTAS FISCAIS] 
            (NUMERO, [CODIGO DO PRODUTO], QUANTIDADE, PREÇO)
        VALUES (@NUMERO, @PRODUTO, @QUANTIDADE, @PRECO)
        SET @CONTADOR = @CONTADOR + 1
    END
    INSERT INTO @LISTAPRODUTOS (PRODUTO) VALUES (@PRODUTO)
END 
END;

EXEC [dbo].[CriaNotaFiscal] '20180521'
EXEC [dbo].[CriaNotaFiscal] '20180521'
EXEC [dbo].[CriaNotaFiscal] '20180521'