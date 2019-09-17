CREATE TABLE [Employee].[KeeleTasud]
(
    [Id] INT NOT NULL IDENTITY,
    [idTase] INT NOT NULL,
    [Summa] DECIMAL(18,2) NOT NULL,
    CONSTRAINT [PK_Employee.KeeleTasud] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Employee.KeeleTasud_Employee.Tase] FOREIGN KEY ([idTase]) REFERENCES [Employee].[Tase]([Id])
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Доплаты за уровни владения языками',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'KeeleTasud',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор доплаты за уровень владения языком',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'KeeleTasud',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор языка',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'KeeleTasud',
    @level2type = N'COLUMN',
    @level2name = N'idTase'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Сумма доплаты',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'KeeleTasud',
    @level2type = N'COLUMN',
    @level2name = N'Summa'