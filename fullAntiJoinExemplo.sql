USE ContosoRetailDW

--VERIFICA PESSOAS QUE TEM O NOME DIFERENTE

SELECT 
	A.FirstName,
	B.FirstName

FROM DimCustomer AS A
FULL OUTER JOIN DimEmployee AS B ON A.FirstName = B.FirstName
WHERE A.FirstName IS NULL OR B.FirstName IS NULL;

--PRODUTO QUE AINDA NÃO FOI VENDIDO
SELECT
    a.ProductKey,
    a.ProductName,
    b.ProductKey

FROM DimProduct AS a
FULL OUTER JOIN FactSales AS b
ON a.ProductKey = b.ProductKey
WHERE b.ProductKey IS NULL OR a.ProductKey IS NULL;

--PRODUTO QUE AINDA NÃO FOI VENDIDO ONLINE
SELECT
    a.ProductKey,
    b.ProductKey

FROM FactOnlineSales AS a
FULL OUTER JOIN DimProduct AS b
ON a.ProductKey = b.ProductKey
WHERE b.ProductKey IS NULL OR a.ProductKey IS NULL;

--CLIENTE QUE NÃO REALIZOU NENHUMA COMPRA OU COMPRA QUE NÃO TEM NENHUM CLIENTE
SELECT
    a.CustomerKey,
    b.CustomerKey

FROM FactOnlineSales AS a
FULL OUTER JOIN DimCustomer AS b
ON a.CustomerKey = b.CustomerKey
WHERE b.CustomerKey IS NULL OR a.CustomerKey IS NULL;

--LOJA QUE NUNCA VENDEU PRODUTO ONLINE
SELECT
    a.StoreKey,
    b.StoreKey

FROM FactOnlineSales AS a
FULL OUTER JOIN DimStore AS b
ON a.StoreKey = b.StoreKey
WHERE b.StoreKey IS NULL OR a.StoreKey IS NULL;



--LOJA QUE NÃO VENDEU NENHUM PRODUTO 
SELECT
    a.StoreKey,
    b.StoreKey

FROM DimStore AS a
FULL OUTER JOIN FactSales AS b
ON a.StoreKey = b.StoreKey
WHERE b.StoreKey IS NULL OR a.StoreKey IS NULL;

--PRODUTO QUE AINDA NÃO ESTA NO INVENTARIO
SELECT
    a.ProductKey,
	a.ProductName,
    b.ProductKey

FROM DimProduct AS a
FULL OUTER JOIN FactInventory AS b
ON a.ProductKey = b.ProductKey
WHERE b.ProductKey IS NULL OR a.ProductKey IS NULL;

--PROMOÇÃO QUE NUNCA FOI USADA
SELECT
    a.PromotionKey,
    b.PromotionKey

FROM FactSales AS a
FULL OUTER JOIN DimPromotion AS b
ON a.PromotionKey = b.PromotionKey
WHERE b.PromotionKey IS NULL OR a.PromotionKey IS NULL;
--(VALOR INSERIDO DE MANEIRA ARTIFICIAL)

-- CONSULTA

SELECT * FROM DimStore
SELECT * FROM DimProduct
SELECT * FROM FactSales
SELECT * FROM DimEmployee
SELECT * FROM FactInventory
SELECT * FROM DimPromotion