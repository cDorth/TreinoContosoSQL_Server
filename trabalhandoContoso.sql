USE ContosoRetailDW

--exercicio 1-a tem exatamente 2517
SELECT ProductKey FROM DimProduct;

--exercicio 1-b diminuiu a quantidade
SELECT CustomerKey FROM DimCustomer;

--exercicio 2 selecionando
SELECT CustomerKey,FirstName,EmailAddress,BirthDate FROM DimCustomer;

--exercicio 2 renomeiando
SELECT CustomerKey AS 'CHAVE PRIMARIA',FirstName AS 'PRIMEIRO NOME',EmailAddress AS 'E-MAIL',BirthDate AS 'DATA DE ANIVERSARIO' FROM DimCustomer;

--exercicio 3
SELECT TOP(100) * FROM DimCustomer;

SELECT TOP(20)PERCENT * FROM DimCustomer;

SELECT TOP(100) CustomerKey,FirstName,EmailAddress,BirthDate FROM DimCustomer;

SELECT TOP(100) CustomerKey AS 'CHAVE PRIMARIA',FirstName AS 'PRIMEIRO NOME',EmailAddress AS 'E-MAIL',BirthDate AS 'DATA DE ANIVERSARIO' FROM DimCustomer;
--exercicio 4

SELECT BrandName AS FORNECEDOR FROM dimProduct;

--exercicio 5
SELECT DISTINCT ProductName FROM dimProduct;
SELECT DISTINCT ProductKey FROM FactSales;

