CREATE TABLE [Employee].[Sugu]
(
    [Id] INT NOT NULL IDENTITY,
    [Title] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Employee.Sugu] PRIMARY KEY ([Id]),
    CONSTRAINT [CK_Employee.Sugu.Title] CHECK (LEN([Title]) > 0)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Пол работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Sugu',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор пола',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Sugu',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Наименование',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Sugu',
    @level2type = N'COLUMN',
    @level2name = N'Title'