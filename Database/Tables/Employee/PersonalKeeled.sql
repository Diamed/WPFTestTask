CREATE TABLE [Employee].[PersonalKeeled]
(
    [Id] INT NOT NULL IDENTITY,
    [idPersonal] INT NOT NULL,
    [idKeeled] INT NOT NULL,
    [idTase] INT NOT NULL,
    CONSTRAINT [PK_Employee.PersonalKeeled] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Employee.PersonalKeeled_Employee.Personal] FOREIGN KEY ([idPersonal]) REFERENCES [Employee].[Personal]([Id]),
    CONSTRAINT [FK_Employee.PersonalKeeled_Employee.Keeled] FOREIGN KEY ([idKeeled]) REFERENCES [Employee].[Keeled]([Id]),
    CONSTRAINT [FK_Employee.PersonalKeeled_Employee.Tase] FOREIGN KEY ([idTase]) REFERENCES [Employee].[Tase]([Id]),
    CONSTRAINT [UK_Employee.PersonalKeeled.idPersonal_idKeeled] UNIQUE ([idPersonal], [idKeeled])
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Данные о работниках, владеющих языками',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'PersonalKeeled',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор записи',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'PersonalKeeled',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'PersonalKeeled',
    @level2type = N'COLUMN',
    @level2name = N'idPersonal'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор языка',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'PersonalKeeled',
    @level2type = N'COLUMN',
    @level2name = N'idKeeled'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор уровня владения языком',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'PersonalKeeled',
    @level2type = N'COLUMN',
    @level2name = N'idTase'