
--Questão 1

--a. Faça um resumo da quantidade vendida (SalesQuantity) de acordo
--com o canal de vendas (channelkey).

SELECT channelKey, SUM(SalesQuantity) FROM FactSales GROUP BY ChannelKey

--b. Faça um agrupamento mostrando a quantidade total vendida
--(SalesQuantity) e quantidade total devolvida (Return Quantity) de
--acordo com o ID das lojas (StoreKey).

SELECT StoreKey, SUM(Salesquantity), SUM(ReturnQuantity) FROM FactSales GROUP BY StoreKey

--c. Faça um resumo do valor total vendido (SalesAmount) para cada
--canal de venda, mas apenas para o ano de 2007.

SELECT ChannelKey, SUM(SalesQuantity) FROM FactSales WHERE DateKey BETWEEN '01/01/2007' AND '31/12/2007'
GROUP BY ChannelKey

--Questão 2

--Você precisa fazer uma análise de vendas por produtos O objetivo final é
--descobrir o valor total vendido SalesAmount por produto ProductKey 

--a. A tabela final deverá estar ordenada de acordo com a quantidade vendida e,
--além disso mostrar apenas os produtos que tiveram um resultado final de vendas 
--maior do que $5.000.000.

SELECT ProductKey, SUM(SalesAmount) FROM FactSales GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000 ORDER BY SUM(SalesAmount) DESC

--b.Faça uma adaptação no exercício anterior e mostre os Top 10 produtoscom
--mais vendas . Desconsidere o filtro de $5.000.000 aplicado. 

SELECT TOP(10) ProductKey, SUM(SalesAmount) FROM FactSales GROUP BY ProductKey ORDER BY SUM (SalesAmount) DESC

--Questão 3

--a. Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual
--é o ID ( do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

SELECT TOP(1) CustomerKey, 
SUM(SalesQuantity) 
FROM FactOnlineSales 
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC


--b.Feito isso, faça um agrupamento de total vendido ( por ID do produto e descubra quais foram 
--os top 3 produtos mais comprados pelo cliente da letra a).

SELECT TOP(3) ProductKey, AS 'Produto', 
SUM(SalesQuantity) AS 'Total vendido'
FROM FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC

-- Questão 4

--a. Faça um agrupamento e descubra a quantidade total de produtos por marca.

SELECT BrandName, COUNT(*) FROM DimProduct GROUP BY BrandName

--b. Determine a média do preço unitário (UnitPrice) para cada ClassName.

SELECT ClassName, AVG(unitPrice) FROM DimProduct GROUP BY ClassName

--c. Faça um agrupamento de cores e descubra o peso total que cada cor
--de produto possui.

SELECT ColorName, SUM(Weight) FROM DimProduct GROUP BY ColorName

-- Questão 5

--Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).
--A tabela final deve considerar apenas a marca e ter os seus valores classificados em ordem decrescente

SELECT StockTypeName, SUM(Weight)
FROM DimProduct WHERE BrandName = 'Contoso'
GROUP BY StockTypeName

-- Questão 6

--Você seria capaz de confirmar se todas as marcas dos produtos possuem
--à disposição todas as 16 opções de cores?

SELECT BrandName, COUNT(DISTINCT ColorName) FROM DimProduct GROUP BY BrandName

-- Questão 7 

--Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também 
--a média salarial de acordo com o Sexo. Corrija qualquer resultado “inesperado” com 
--os seus conhecimentos em SQL.

SELECT Gender AS 'Sexo', COUNT(Gender) AS 'Total'
FROM DimCustomer WHERE Gender IS NOT NULL
GROUP BY Gender ORDER BY COUNT(Gender) DESC

-- Questão 8

--Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial 
--de acordo com o seu nível escolar. Utilize a coluna Education da tabela DimCustomer 
--para fazer esse agrupamento.

SELECT Education AS 'Nível Escolar', 
COUNT(Education) AS 'Qtd Total Escolaridade',
AVG(YearlyIncome) AS 'Média Salarial'
FROM DimCustomer WHERE Education IS NOT NULL
GROUP BY Education

-- Questão 9 

--Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo 
--com o Departamento (DepartmentName). Importante: Você deverá considerar apenas 
--os funcionários ativos.

SELECT DepartmentName, COUNT(*)
FROM DimEmployee WHERE "Status" = 'Current'
GROUP BY DepartmentName

-- Questão 10

--Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). 
--Você deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
--Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000.

SELECT Title, SUM(VacationHours) FROM DimEmployee
WHERE Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Finance', 'Engineering')
AND HireDate BETWEEN '1999/01/01' AND '2000/12/31'
GROUP BY Title







