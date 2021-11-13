IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [CadGrupo] (
    [CodEmpresa] int NOT NULL,
    [CodGrupo] int NOT NULL,
    [NomeGrupo] nvarchar(100) NOT NULL,
    CONSTRAINT [PK_CadGrupo] PRIMARY KEY ([CodEmpresa], [CodGrupo])
);
GO

CREATE TABLE [ConfiguracaoCampos] (
    [CodEmpresa] int NOT NULL,
    [Campo] nvarchar(100) NOT NULL,
    [Tela] nvarchar(100) NOT NULL,
    [Visivel] bit NOT NULL,
    CONSTRAINT [PK_ConfiguracaoCampos] PRIMARY KEY ([CodEmpresa], [Tela], [Campo])
);
GO

CREATE TABLE [CadUsuario] (
    [Usuario] nvarchar(50) NOT NULL,
    [Nome] nvarchar(250) NOT NULL,
    [Email] nvarchar(250) NOT NULL,
    [GrupoCodEmpresa] int NULL,
    [GrupoCodGrupo] int NULL,
    CONSTRAINT [PK_CadUsuario] PRIMARY KEY ([Usuario]),
    CONSTRAINT [FK_CadUsuario_CadGrupo_GrupoCodEmpresa_GrupoCodGrupo] FOREIGN KEY ([GrupoCodEmpresa], [GrupoCodGrupo]) REFERENCES [CadGrupo] ([CodEmpresa], [CodGrupo]) ON DELETE NO ACTION
);
GO

CREATE INDEX [IX_CadUsuario_GrupoCodEmpresa_GrupoCodGrupo] ON [CadUsuario] ([GrupoCodEmpresa], [GrupoCodGrupo]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211113212304_InitialCreate', N'5.0.11');
GO

COMMIT;
GO

