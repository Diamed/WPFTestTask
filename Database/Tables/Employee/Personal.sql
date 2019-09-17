CREATE TABLE [Employee].[Personal]
(
    [Id] INT NOT NULL IDENTITY,
    [Perekonnanimi] NVARCHAR(256) NOT NULL,
    [Eesnimi] NVARCHAR(256) NOT NULL,
    [idSugu] INT NOT NULL,
    [Sunnipaev] DATE NOT NULL,
    [Palk] DECIMAL(18,2) NOT NULL,
    [idTimeUnit] INT NOT NULL DEFAULT 2, 
    CONSTRAINT [PK_Employee.Personal] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Employee.Personal_Employee.Sugu] FOREIGN KEY ([idSugu]) REFERENCES [Employee].[Sugu]([Id]),
    CONSTRAINT [FK_Employee.Personal_Employee.TimeUnit] FOREIGN KEY ([idTimeUnit]) REFERENCES [Employee].[TimeUnit]([Id]),
    CONSTRAINT [CK_Employee.Personal.Sunnipaev] CHECK (YEAR([Sunnipaev]) > 1850)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Фамилия работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'Perekonnanimi'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Имя работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'Eesnimi'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор пола работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'idSugu'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Дата рождения',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'Sunnipaev'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Месячный оклад работника или почасовая оплата',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'Palk'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Данные о работниках',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор единицы измерения времени для поля оплаты. По умолчанию 0 - месяц. Или значит, что в поле оплаты задан оклад.',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Personal',
    @level2type = N'COLUMN',
    @level2name = N'idTimeUnit'