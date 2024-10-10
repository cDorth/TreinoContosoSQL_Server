SELECT A.FirstName,
B.FirstName
FROM DimCustomer AS A
FULL OUTER JOIN DimEmployee AS B ON A.FirstName = B.FirstName
WHERE A.FirstName IS NULL OR B.FirstName IS NULL;

SELECT * FROM DimCustomer

SELECT * FROM FactSales