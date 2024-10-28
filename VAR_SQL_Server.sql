--EXERCICIO 1

DECLARE @VAL1 INT
SET @VAL1 = 10

DECLARE @VAL2 INT
SET @VAL2 = 5

DECLARE @VAL3 INT
SET @VAL3 = 34

DECLARE @VAL4 INT
SET @VAL4 = 7

DECLARE @SOMA INT
SET @SOMA = @VAL1 + @VAL2
PRINT @SOMA

DECLARE @SUBTRACAO INT
SET @SUBTRACAO = @VAL3 - @VAL4
PRINT @SUBTRACAO

DECLARE @MULTIPLICACAO INT
SET @MULTIPLICACAO = @VAL1 * @VAL4
PRINT @MULTIPLICACAO


DECLARE @DIVISAO FLOAT
SET @DIVISAO = CAST(@VAL3 AS FLOAT) / CAST(@VAL4 AS FLOAT)
SELECT ROUND(@DIVISAO ,2) AS DIVISAO

-- EXERCICIO 2

DECLARE @PRODUTO VARCHAR(15)
SET @PRODUTO = 'CELULAR'	

DECLARE @QUANTIDADE INT
SET @QUANTIDADE = 12

DECLARE @PRECO FLOAT
SET @PRECO = 9.99

DECLARE @FATURAMENTO FLOAT
SET @FATURAMENTO = @PRECO * @QUANTIDADE

SELECT 
@PRODUTO AS PROD,
@QUANTIDADE AS QUANT,
@PRECO AS PRECO,
@FATURAMENTO AS FAT

--EXERCICIO 3


DECLARE @nome VARCHAR(15)
SET @nome = 'Andr�'

DECLARE @data_nascimento AS DATE
SET @data_nascimento = '10/02/1998'

DECLARE @num_pets INT
SET @num_pets = 2

SELECT 'MEU NOME � '+ @nome +' NASCI EM '+ CAST(@data_nascimento AS varchar(MAX))+' E TENHO '+CAST(@num_pets AS varchar(MAX))+' PETS' AS TEXTO

--EXERCICIO 4
DECLARE @LOJAS VARCHAR(MAX)
SET @LOJAS = ''
SELECT @LOJAS = @LOJAS + StoreName+', ' + CHAR(10) 
FROM DimStore 
WHERE CloseDate IS NOT NULL AND CloseDate BETWEEN '01/01/2008' AND '31/12/2008'
PRINT LEFT(@LOJAS,DATALENGTH(@LOJAS) -3)

--EXERCICIO 5

DECLARE @PRODUTOS VARCHAR(MAX)
SET @PRODUTOS = ''
SELECT @PRODUTOS = @PRODUTOS + ProductName+', ' + CHAR(10) 
FROM DimProduct
INNER JOIN DimProductSubcategory ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
WHERE ProductSubcategoryName ='Lamps'
PRINT LEFT(@PRODUTOS,DATALENGTH(@PRODUTOS) -3)




