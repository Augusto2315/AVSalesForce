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

CREATE TABLE [UsuariosPermissao] (
    [Usuario] nvarchar(450) NOT NULL,
    [Campo] nvarchar(max) NOT NULL,
    [CfgCampoCodEmpresa] int NULL,
    [CfgCampoTela] nvarchar(450) NULL,
    [CfgCampoCampo] nvarchar(450) NULL,
    CONSTRAINT [PK_UsuariosPermissao] PRIMARY KEY ([Usuario]),
    CONSTRAINT [FK_UsuariosPermissao_Campos_CfgCampoCodEmpresa_CfgCampoTela_CfgCampoCampo] FOREIGN KEY ([CfgCampoCodEmpresa], [CfgCampoTela], [CfgCampoCampo]) REFERENCES [Campos] ([CodEmpresa], [Tela], [Campo]) ON DELETE NO ACTION
);
GO

CREATE INDEX [IX_UsuariosPermissao_CfgCampoCodEmpresa_CfgCampoTela_CfgCampoCampo] ON [UsuariosPermissao] ([CfgCampoCodEmpresa], [CfgCampoTela], [CfgCampoCampo]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20211106103536_InitialCreate', N'5.0.11');
GO

COMMIT;
GO

