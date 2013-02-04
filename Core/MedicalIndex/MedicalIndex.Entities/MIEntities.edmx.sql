
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 02/04/2013 11:04:05
-- Generated from EDMX file: D:\Users\maboelmagd\Documents\MedicalIndex\Core\MedicalIndex\MedicalIndex.Entities\MIEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MedIndex];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_LocationFacility]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facilities] DROP CONSTRAINT [FK_LocationFacility];
GO
IF OBJECT_ID(N'[dbo].[FK_Clinic_inherits_Facility]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facilities_Clinic] DROP CONSTRAINT [FK_Clinic_inherits_Facility];
GO
IF OBJECT_ID(N'[dbo].[FK_Hospital_inherits_Facility]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facilities_Hospital] DROP CONSTRAINT [FK_Hospital_inherits_Facility];
GO
IF OBJECT_ID(N'[dbo].[FK_MedicalCenter_inherits_Facility]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facilities_MedicalCenter] DROP CONSTRAINT [FK_MedicalCenter_inherits_Facility];
GO
IF OBJECT_ID(N'[dbo].[FK_Pharmacy_inherits_Facility]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Facilities_Pharmacy] DROP CONSTRAINT [FK_Pharmacy_inherits_Facility];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Facilities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facilities];
GO
IF OBJECT_ID(N'[dbo].[Locations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locations];
GO
IF OBJECT_ID(N'[dbo].[Facilities_Clinic]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facilities_Clinic];
GO
IF OBJECT_ID(N'[dbo].[Facilities_Hospital]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facilities_Hospital];
GO
IF OBJECT_ID(N'[dbo].[Facilities_MedicalCenter]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facilities_MedicalCenter];
GO
IF OBJECT_ID(N'[dbo].[Facilities_Pharmacy]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Facilities_Pharmacy];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Facilities'
CREATE TABLE [dbo].[Facilities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Website] nvarchar(max)  NOT NULL,
    [Rating] decimal(18,0)  NOT NULL,
    [Location_Id] int  NOT NULL,
    [FacilityTypeEnum_Id] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Neighborhood_Id] int  NOT NULL
);
GO

-- Creating table 'ClinicalSpecialityEnums'
CREATE TABLE [dbo].[ClinicalSpecialityEnums] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Neighborhoods'
CREATE TABLE [dbo].[Neighborhoods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [City_Id] int  NOT NULL
);
GO

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [State_Id] int  NOT NULL
);
GO

-- Creating table 'States'
CREATE TABLE [dbo].[States] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Country_Id] int  NOT NULL
);
GO

-- Creating table 'Countries'
CREATE TABLE [dbo].[Countries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Phones'
CREATE TABLE [dbo].[Phones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [Facility_Id] int  NOT NULL
);
GO

-- Creating table 'FacilityTypeEnums'
CREATE TABLE [dbo].[FacilityTypeEnums] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LabModalities'
CREATE TABLE [dbo].[LabModalities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Laboratory_Id] int  NOT NULL
);
GO

-- Creating table 'Facilities_Clinic'
CREATE TABLE [dbo].[Facilities_Clinic] (
    [Id] int  NOT NULL,
    [ClinicalSpecialityEnum_Id] int  NOT NULL
);
GO

-- Creating table 'Facilities_Hospital'
CREATE TABLE [dbo].[Facilities_Hospital] (
    [NumberOfBeds] int  NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Facilities_MedicalCenter'
CREATE TABLE [dbo].[Facilities_MedicalCenter] (
    [MedicalCenterId] int IDENTITY(1,1) NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Facilities_Laboratory'
CREATE TABLE [dbo].[Facilities_Laboratory] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Facilities_Pharmacy'
CREATE TABLE [dbo].[Facilities_Pharmacy] (
    [Is24Hours] bit  NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'ClinicalSpecialityEnumHospital'
CREATE TABLE [dbo].[ClinicalSpecialityEnumHospital] (
    [ClinicalSpecialityEnum_Id] int  NOT NULL,
    [Hospitals_Id] int  NOT NULL
);
GO

-- Creating table 'ClinicalSpecialityEnumMedicalCenter'
CREATE TABLE [dbo].[ClinicalSpecialityEnumMedicalCenter] (
    [ClinicalSpecialityEnum_Id] int  NOT NULL,
    [MedicalCenters_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Facilities'
ALTER TABLE [dbo].[Facilities]
ADD CONSTRAINT [PK_Facilities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ClinicalSpecialityEnums'
ALTER TABLE [dbo].[ClinicalSpecialityEnums]
ADD CONSTRAINT [PK_ClinicalSpecialityEnums]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Neighborhoods'
ALTER TABLE [dbo].[Neighborhoods]
ADD CONSTRAINT [PK_Neighborhoods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [PK_States]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Countries'
ALTER TABLE [dbo].[Countries]
ADD CONSTRAINT [PK_Countries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Phones'
ALTER TABLE [dbo].[Phones]
ADD CONSTRAINT [PK_Phones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FacilityTypeEnums'
ALTER TABLE [dbo].[FacilityTypeEnums]
ADD CONSTRAINT [PK_FacilityTypeEnums]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LabModalities'
ALTER TABLE [dbo].[LabModalities]
ADD CONSTRAINT [PK_LabModalities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Facilities_Clinic'
ALTER TABLE [dbo].[Facilities_Clinic]
ADD CONSTRAINT [PK_Facilities_Clinic]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Facilities_Hospital'
ALTER TABLE [dbo].[Facilities_Hospital]
ADD CONSTRAINT [PK_Facilities_Hospital]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Facilities_MedicalCenter'
ALTER TABLE [dbo].[Facilities_MedicalCenter]
ADD CONSTRAINT [PK_Facilities_MedicalCenter]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Facilities_Laboratory'
ALTER TABLE [dbo].[Facilities_Laboratory]
ADD CONSTRAINT [PK_Facilities_Laboratory]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Facilities_Pharmacy'
ALTER TABLE [dbo].[Facilities_Pharmacy]
ADD CONSTRAINT [PK_Facilities_Pharmacy]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ClinicalSpecialityEnum_Id], [Hospitals_Id] in table 'ClinicalSpecialityEnumHospital'
ALTER TABLE [dbo].[ClinicalSpecialityEnumHospital]
ADD CONSTRAINT [PK_ClinicalSpecialityEnumHospital]
    PRIMARY KEY NONCLUSTERED ([ClinicalSpecialityEnum_Id], [Hospitals_Id] ASC);
GO

-- Creating primary key on [ClinicalSpecialityEnum_Id], [MedicalCenters_Id] in table 'ClinicalSpecialityEnumMedicalCenter'
ALTER TABLE [dbo].[ClinicalSpecialityEnumMedicalCenter]
ADD CONSTRAINT [PK_ClinicalSpecialityEnumMedicalCenter]
    PRIMARY KEY NONCLUSTERED ([ClinicalSpecialityEnum_Id], [MedicalCenters_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Location_Id] in table 'Facilities'
ALTER TABLE [dbo].[Facilities]
ADD CONSTRAINT [FK_LocationFacility]
    FOREIGN KEY ([Location_Id])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationFacility'
CREATE INDEX [IX_FK_LocationFacility]
ON [dbo].[Facilities]
    ([Location_Id]);
GO

-- Creating foreign key on [ClinicalSpecialityEnum_Id] in table 'Facilities_Clinic'
ALTER TABLE [dbo].[Facilities_Clinic]
ADD CONSTRAINT [FK_ClinicalSpecialityEnumClinic]
    FOREIGN KEY ([ClinicalSpecialityEnum_Id])
    REFERENCES [dbo].[ClinicalSpecialityEnums]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClinicalSpecialityEnumClinic'
CREATE INDEX [IX_FK_ClinicalSpecialityEnumClinic]
ON [dbo].[Facilities_Clinic]
    ([ClinicalSpecialityEnum_Id]);
GO

-- Creating foreign key on [ClinicalSpecialityEnum_Id] in table 'ClinicalSpecialityEnumHospital'
ALTER TABLE [dbo].[ClinicalSpecialityEnumHospital]
ADD CONSTRAINT [FK_ClinicalSpecialityEnumHospital_ClinicalSpecialityEnum]
    FOREIGN KEY ([ClinicalSpecialityEnum_Id])
    REFERENCES [dbo].[ClinicalSpecialityEnums]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Hospitals_Id] in table 'ClinicalSpecialityEnumHospital'
ALTER TABLE [dbo].[ClinicalSpecialityEnumHospital]
ADD CONSTRAINT [FK_ClinicalSpecialityEnumHospital_Hospital]
    FOREIGN KEY ([Hospitals_Id])
    REFERENCES [dbo].[Facilities_Hospital]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClinicalSpecialityEnumHospital_Hospital'
CREATE INDEX [IX_FK_ClinicalSpecialityEnumHospital_Hospital]
ON [dbo].[ClinicalSpecialityEnumHospital]
    ([Hospitals_Id]);
GO

-- Creating foreign key on [ClinicalSpecialityEnum_Id] in table 'ClinicalSpecialityEnumMedicalCenter'
ALTER TABLE [dbo].[ClinicalSpecialityEnumMedicalCenter]
ADD CONSTRAINT [FK_ClinicalSpecialityEnumMedicalCenter_ClinicalSpecialityEnum]
    FOREIGN KEY ([ClinicalSpecialityEnum_Id])
    REFERENCES [dbo].[ClinicalSpecialityEnums]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MedicalCenters_Id] in table 'ClinicalSpecialityEnumMedicalCenter'
ALTER TABLE [dbo].[ClinicalSpecialityEnumMedicalCenter]
ADD CONSTRAINT [FK_ClinicalSpecialityEnumMedicalCenter_MedicalCenter]
    FOREIGN KEY ([MedicalCenters_Id])
    REFERENCES [dbo].[Facilities_MedicalCenter]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClinicalSpecialityEnumMedicalCenter_MedicalCenter'
CREATE INDEX [IX_FK_ClinicalSpecialityEnumMedicalCenter_MedicalCenter]
ON [dbo].[ClinicalSpecialityEnumMedicalCenter]
    ([MedicalCenters_Id]);
GO

-- Creating foreign key on [Neighborhood_Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [FK_NeighborhoodLocation]
    FOREIGN KEY ([Neighborhood_Id])
    REFERENCES [dbo].[Neighborhoods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_NeighborhoodLocation'
CREATE INDEX [IX_FK_NeighborhoodLocation]
ON [dbo].[Locations]
    ([Neighborhood_Id]);
GO

-- Creating foreign key on [City_Id] in table 'Neighborhoods'
ALTER TABLE [dbo].[Neighborhoods]
ADD CONSTRAINT [FK_CityNeighborhood]
    FOREIGN KEY ([City_Id])
    REFERENCES [dbo].[Cities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CityNeighborhood'
CREATE INDEX [IX_FK_CityNeighborhood]
ON [dbo].[Neighborhoods]
    ([City_Id]);
GO

-- Creating foreign key on [State_Id] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [FK_StateCity]
    FOREIGN KEY ([State_Id])
    REFERENCES [dbo].[States]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StateCity'
CREATE INDEX [IX_FK_StateCity]
ON [dbo].[Cities]
    ([State_Id]);
GO

-- Creating foreign key on [Country_Id] in table 'States'
ALTER TABLE [dbo].[States]
ADD CONSTRAINT [FK_CountryState]
    FOREIGN KEY ([Country_Id])
    REFERENCES [dbo].[Countries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CountryState'
CREATE INDEX [IX_FK_CountryState]
ON [dbo].[States]
    ([Country_Id]);
GO

-- Creating foreign key on [Facility_Id] in table 'Phones'
ALTER TABLE [dbo].[Phones]
ADD CONSTRAINT [FK_FacilityPhone]
    FOREIGN KEY ([Facility_Id])
    REFERENCES [dbo].[Facilities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FacilityPhone'
CREATE INDEX [IX_FK_FacilityPhone]
ON [dbo].[Phones]
    ([Facility_Id]);
GO

-- Creating foreign key on [FacilityTypeEnum_Id] in table 'Facilities'
ALTER TABLE [dbo].[Facilities]
ADD CONSTRAINT [FK_FacilityTypeEnumFacility]
    FOREIGN KEY ([FacilityTypeEnum_Id])
    REFERENCES [dbo].[FacilityTypeEnums]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FacilityTypeEnumFacility'
CREATE INDEX [IX_FK_FacilityTypeEnumFacility]
ON [dbo].[Facilities]
    ([FacilityTypeEnum_Id]);
GO

-- Creating foreign key on [Laboratory_Id] in table 'LabModalities'
ALTER TABLE [dbo].[LabModalities]
ADD CONSTRAINT [FK_LaboratoryLabModalities]
    FOREIGN KEY ([Laboratory_Id])
    REFERENCES [dbo].[Facilities_Laboratory]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_LaboratoryLabModalities'
CREATE INDEX [IX_FK_LaboratoryLabModalities]
ON [dbo].[LabModalities]
    ([Laboratory_Id]);
GO

-- Creating foreign key on [Id] in table 'Facilities_Clinic'
ALTER TABLE [dbo].[Facilities_Clinic]
ADD CONSTRAINT [FK_Clinic_inherits_Facility]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Facilities]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Facilities_Hospital'
ALTER TABLE [dbo].[Facilities_Hospital]
ADD CONSTRAINT [FK_Hospital_inherits_Facility]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Facilities]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Facilities_MedicalCenter'
ALTER TABLE [dbo].[Facilities_MedicalCenter]
ADD CONSTRAINT [FK_MedicalCenter_inherits_Facility]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Facilities]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Facilities_Laboratory'
ALTER TABLE [dbo].[Facilities_Laboratory]
ADD CONSTRAINT [FK_Laboratory_inherits_Facility]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Facilities]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Facilities_Pharmacy'
ALTER TABLE [dbo].[Facilities_Pharmacy]
ADD CONSTRAINT [FK_Pharmacy_inherits_Facility]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Facilities]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------