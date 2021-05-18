--1) Przygotuj blok anonimowy, który:
---znajdzie średnią stawkę wynagrodzenia pracowników,
---wyświetli szczegóły pracowników, których stawka wynagrodzenia jest niższa niż średnia. 
BEGIN
SELECT  AVG(Rate) FROM HumanResources.EmployeePayHistory
SELECT Employee.BusinessEntityID, NationalIDNumber, JobTitle, BirthDate, MaritalStatus, Gender, HireDate, Rate 
FROM HumanResources.Employee JOIN HumanResources.EmployeePayHistory ON  Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID 
WHERE EmployeePayHistory.Rate < 17.7588
END;
--2. Utwórz funkcję, która zwróci datę wysyłki określonego zamówienia.
CREATE OR ALTER FUNCTION check_data (@id INT)
RETURNS TABLE 
AS
RETURN( SELECT OrderDate FROM Sales.SalesOrderHeader WHERE SalesOrderHeader.SalesOrderID = @id)

SELECT * FROM check_data(43722)
--3. Utwórz procedurę składowaną, która jako parametr przyjmuję nazwę produktu, a jako rezultat wyświetla jego identyfikator, numer i dostępność.
CREATE OR ALTER PROCEDURE product (@nazwa  VARCHAR(64))
AS
BEGIN
	SELECT Product.ProductID, Product.ProductNumber, ProductInventory.Quantity 
	FROM Production.Product INNER JOIN Production.ProductInventory ON Product.ProductID = ProductInventory.ProductID
	WHERE Product.Name = @nazwa
END
EXECUTE product 'Freewheel'
--4. Utwórz funkcję, która zwraca numer karty kredytowej dla konkretnego zamówienia.
CREATE OR ALTER FUNCTION credit_card (@id INT)
RETURNS TABLE 
AS
RETURN (SELECT CreditCard.CardNumber FROM Sales.CreditCard INNER JOIN Sales.SalesOrderHeader ON CreditCard.CreditCardID = SalesOrderHeader.CreditCardID
WHERE SalesOrderHeader.SalesOrderID = @id)

SELECT * FROM credit_card(43722)

--5. Utwórz procedurę składowaną, która jako parametry wejściowe przyjmuje dwie liczby, num1 i num2, a zwraca wynik ich dzielenia. 
--Ponadto wartość num1 powinna zawsze być większa niż wartość num2. 
--Jeżeli wartość num1 jest mniejsza niż num2, wygeneruj komunikat o błędzie „Niewłaściwie zdefiniowałeś dane wejściowe”.
CREATE OR ALTER PROCEDURE dzielenie (@num1 FLOAT, @num2 FLOAT)
AS
BEGIN
	IF @num1 < @num2
	BEGIN
	SELECT 'Niewłaściwie zdefiniowałeś dane wejściowe'
	RETURN
	END
	ELSE BEGIN
	SELECT @num1/@num2
	RETURN
	END
END
EXECUTE dzielenie 10.5, 2

--6. Napisz procedurę, która jako parametr przyjmie NationalIDNumber danej osoby, a zwróci stanowisko oraz liczbę dni urlopowych i chorobowych.
CREATE OR ALTER PROCEDURE info (@id INT)
AS
BEGIN
	SELECT JobTitle, CAST(VacationHours AS FLOAT)/8 as VacationDays, CAST(SickLeaveHours AS FLOAT)/8 as SickLeaveDays
	FROM HumanResources.Employee
	WHERE NationalIDNumber = @id
END
EXECUTE info 693325305
--7. Napisz procedurę będącą kalkulatorem walutowym. 
--Wykorzystaj dwie tabele: Sales.Currency oraz Sales.CurrencyRate. 
--Parametrami wejściowymi mają być: kwota, waluty oraz data (CurrencyRateDate). 
--Przyjmij, iż zawsze jedną ze stron jest dolar amerykański (USD). Zaimplementuj kalkulację obustronną, tj:1400 USD → PLN lub PLN → USD
CREATE OR ALTER PROCEDURE kalkulator (@kwota FLOAT, @waluta1 VARCHAR(32), @data DATETIME, @wsk VARCHAR(4))
AS
BEGIN
	IF @wsk = '->$'
	BEGIN
		SELECT FromCurrencyCode as Dolary, ToCurrencyCode as WybranaWaluta, CurrencyRateDate as DataStanuWaluty, @kwota/AverageRate as Przelicznik
		FROM Sales.CurrencyRate INNER JOIN Sales.Currency ON CurrencyRate.ToCurrencyCode = Currency.CurrencyCode
		WHERE Currency.Name = @waluta1 AND CurrencyRate.CurrencyRateDate = @data
	END
	IF @wsk = '$->'
	BEGIN
		SELECT FromCurrencyCode as Dolary, ToCurrencyCode as WybranaWaluta, CurrencyRateDate as DataStanuWaluty, @kwota*AverageRate as Przelicznik
		FROM Sales.CurrencyRate INNER JOIN Sales.Currency ON CurrencyRate.ToCurrencyCode = Currency.CurrencyCode
		WHERE Currency.Name = @waluta1 AND CurrencyRate.CurrencyRateDate = @data
	END
END
EXECUTE kalkulator 1200, 'EURO', '2011-07-15 00:00:00.000', '->$'