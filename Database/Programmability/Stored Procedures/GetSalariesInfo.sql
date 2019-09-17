CREATE PROCEDURE [Employee].[GetSalariesInfo]
    @Kuu INT,
    @Aasta INT,
    @idPersonal INT
AS
BEGIN
    WITH [Tooaeg] AS (
            SELECT  [idPersonal],
                    MONTH([Kuupaev]) AS [Kuu],
                    YEAR([Kuupaev]) AS [Aasta],
                    SUM([Tootunnid]) AS [Tootunnid]
            FROM    [Employee].[Tooaeg]
            GROUP BY [idPersonal],
                    MONTH([Kuupaev]),
                    YEAR([Kuupaev])
            HAVING  (@Kuu IS NULL OR @Kuu = MONTH([Kuupaev]))
                AND (@Aasta IS NULL OR @Aasta = YEAR([Kuupaev]))
                AND (@idPersonal IS NULL OR @idPersonal = [idPersonal])
        )
    SELECT  DISTINCT 
            [P].[Id],
            [P].[Perekonnanimi] + ' ' + [P].[Eesnimi] AS [FullName],
            [P].[Palk],
            [T].[Tootunnid],
            CASE
                WHEN [P].[idTimeUnit] = 2 THEN [P].[Palk]
                ELSE [P].[Palk] * [T].[Tootunnid]
            END AS [CalculatedSalary]
    FROM    [Employee].[Personal] AS [P]
    LEFT JOIN   [Tooaeg] AS [T]
        ON  [T].[idPersonal] = [P].[Id]
    LEFT JOIN   [Employee].[PersonalKeeled] AS [PK]
        ON  [PK].[idPersonal] = [P].[Id]
    LEFT JOIN   [Employee].[KeeleTasud] AS [KT]
        ON  [KT].[idTase] = [PK].[idTase]
    WHERE   (@idPersonal IS NULL OR @idPersonal = [P].[Id])
        AND (@Kuu IS NULL OR @Kuu = [T].[Kuu])
        AND (@Aasta IS NULL OR @Aasta = [T].[Aasta])
END