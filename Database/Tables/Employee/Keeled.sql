CREATE TABLE [Employee].[Keeled]
(
    [Id] INT NOT NULL IDENTITY,
    [Keel] NVARCHAR(100) NOT NULL,
    CONSTRAINT [PK_Employee.Keeled] PRIMARY KEY ([Id]),
    CONSTRAINT [CK_Employee.Keeled.Keel] CHECK (LEN([Keel]) > 0)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Справочник языков',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Keeled',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор языка',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Keeled',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Язык',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Keeled',
    @level2type = N'COLUMN',
    @level2name = N'Keel'