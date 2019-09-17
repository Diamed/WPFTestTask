CREATE PROCEDURE [Employee].[GetEmployeesInfo]
    @Keel NVARCHAR(100),
    @Tase NVARCHAR(50),
    @VanusAlates INT,
    @VanusKuni INT,
    @Sugu NVARCHAR(50)
AS
BEGIN
    /* Remarks:
    Внешний запрос сделан с целью не повторять вычисление возраста
    Условия оставлены внутри запроса с целью оптимизации
    Возможно я не прав и компилятор умеет оптимизировать это и без нас
    */
    SELECT  *
    FROM
    (
        SELECT  [P].[Perekonnanimi] + ' ' + [P].[Eesnimi] AS [FullName],
                [S].[Title] AS [Sugu],
                [P].[Sunnipaev],
                DATEDIFF(YEAR, [P].[Sunnipaev], GETDATE()) AS [Vanus],
                [K].[Keel],
                [T].[Title] AS [Tase],
                [KT].[Summa]
        FROM    [Employee].[Personal] AS [P]
        JOIN    [Employee].[Sugu] AS [S]
            ON  [S].[Id] = [P].[idSugu]
        LEFT JOIN    [Employee].[PersonalKeeled] AS [PK]
            ON  [PK].[idPersonal] = [P].[Id]
        LEFT JOIN    [Employee].[Keeled] AS [K]
            ON  [K].[Id] = [PK].[idKeeled]
        LEFT JOIN    [Employee].[Tase] AS [T]
            ON  [T].[Id] = [PK].[idTase]
        LEFT JOIN    [Employee].[KeeleTasud] AS [KT]
            ON  [KT].[idTase] = [T].[Id]
        WHERE   (@Keel IS NULL OR CHARINDEX(@Keel, [K].[Keel]) > 0)
            AND (@Tase IS NULL OR CHARINDEX(@Tase, [T].[Title]) > 0)
            AND (@Sugu IS NULL OR CHARINDEX(@Sugu, [S].[Title]) > 0)
    ) AS [T]
    WHERE   (@VanusAlates IS NULL OR [Vanus] >= @VanusAlates)
        AND (@VanusKuni IS NULL OR [Vanus] <= @VanusKuni)
    OPTION (RECOMPILE)
END
