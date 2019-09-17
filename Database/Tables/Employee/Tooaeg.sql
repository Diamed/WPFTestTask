CREATE TABLE [Employee].[Tooaeg]
(
    [Id] INT NOT NULL IDENTITY,
    [idPersonal] INT NOT NULL,
    [Kuupaev] DATE NOT NULL,
    [Tootunnid] DECIMAL(5,2) NOT NULL,
    CONSTRAINT [PK_Employee.Tooaeg] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Employee.Tooaeg_Employee.Personal] FOREIGN KEY ([idPersonal]) REFERENCES [Employee].[Personal]([Id]),
    CONSTRAINT [CK_Employee.Tooaeg.Kuupaev] CHECK (YEAR([Kuupaev]) > 1850),
    CONSTRAINT [CK_Employee.Tooaeg.Tootunnid] CHECK ([Tootunnid] >= 0)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Отработанное работниками время',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tooaeg',
    @level2type = NULL,
    @level2name = NULL
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор отработанного работником времени',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tooaeg',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор работника',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tooaeg',
    @level2type = N'COLUMN',
    @level2name = N'idPersonal'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Дата рабочего дня',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tooaeg',
    @level2type = N'COLUMN',
    @level2name = N'Kuupaev'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Отработанное за день время в часах',
    @level0type = N'SCHEMA',
    @level0name = N'Employee',
    @level1type = N'TABLE',
    @level1name = N'Tooaeg',
    @level2type = N'COLUMN',
    @level2name = N'Tootunnid'