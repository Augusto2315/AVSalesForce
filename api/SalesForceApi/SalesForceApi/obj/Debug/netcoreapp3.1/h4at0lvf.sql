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

CREATE TABLE [Campos] (
    [CodEmpresa] int NOT NULL,
    [Campo] nvarchar(450) NOT NULL,
    [Tela] nvarchar(450) NOT NULL,
    [Visivel] bit NOT NULL,
    CONSTRAINT [PK_Campos] PRIMARY KEY ([CodEmpresa], [Tela], [Campo])
);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211108154905_InitialCreate', N'5.0.11');
GO

COMMIT;
GO

