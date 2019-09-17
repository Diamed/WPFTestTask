CREATE TABLE [Employee].[Tase]
(
    [Id] INT NOT NULL IDENTITY,
    [Title] NVARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Employee.Tase] PRIMARY KEY ([Id]),
    CONSTRAINT [CK_Employee.Tase.Title] CHECK (LEN([Title]) > 0)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Справочник уровней владения языком',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tase',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор уровня владения языком',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tase',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Наименование уровня владения языком',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tase',
    @level2type = N'COLUMN',
    @level2name = N'Title'