
SELECT CONVERT(VARCHAR, GETDATE(), 101)

SELECT CONVERT(VARCHAR, GETDATE(), 113)

SELECT CONVERT(VARCHAR, GETDATE(), 130)

SELECT CONVERT(decimal(10,5), 193.57)

SELECT * FROM [TABELA DE PRODUTOS]

SELECT 'O pre�o do produto ' + [NOME DO PRODUTO] + ' � ' +  [PRE�O DE LISTA] 
from [TABELA DE PRODUTOS]

SELECT 'O pre�o do produto ' + [NOME DO PRODUTO] + ' � ' +  CONVERT(VARCHAR, [PRE�O DE LISTA]) 
from [TABELA DE PRODUTOS]

SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CONVERT(VARCHAR, CONVERT(DECIMAL(15,2), SUM(INF.QUANTIDADE * INF.[PRE�O]))), ' no ano ',   CONVERT(VARCHAR, YEAR(NF.DATA))) AS SENTENCA FROM [NOTAS FISCAIS] NF
INNER JOIN [ITENS NOTAS FISCAIS] INF ON NF.NUMERO = INF.NUMERO
INNER JOIN [TABELA DE CLIENTES] TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA) = 2016
GROUP BY TC.NOME, YEAR(DATA)