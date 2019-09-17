CREATE TABLE [Employee].[TimeUnit]
(
    [Id] INT NOT NULL IDENTITY,
    [Title] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Employee.TimeUnit] PRIMARY KEY ([Id]),
    CONSTRAINT [CK_Employee.TimeUnit.Title] CHECK (LEN([Title]) > 0)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Единицы измерения времени',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'TimeUnit',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор единицы измерения времени',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'TimeUnit',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Наименование',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'TimeUnit',
    @level2type = N'COLUMN',
    @level2name = N'Title'