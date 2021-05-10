CREATE PROCEDURE Fib(@liczba INT)
AS
BEGIN
	--deklaracja tabeli do zapisu wyników
	DECLARE @tabela TABLE(wartosc BIGINT)
	--deklaracja zmiennych
	DECLARE @n INT = 0, @j INT =1, @i INT=0, @k INT = 0
	--wstawienie danych pocz¹tkowych do tabeli
	INSERT INTO @tabela VALUES(@n),(@j)
	WHILE (@i<@liczba-2)
	BEGIN 			
		INSERT INTO @tabela VALUES(@j+@n)
		SET @k = @j
		SET @j = @j + @n
		SET @n = @k
		SET @i += 1
	END	
	SELECT * FROM @tabela
END

EXECUTE Fib 30
