/*
=================================================
Create Database and Schemas
=================================================
Script Propose:
  This scripr creates a new database named DataWarehouse after checking if it exists. 
  If so, this script will drop the older verson and recreate. Moreover, this scipt 
  sets up three schemas within the database: bronze, silver, gold.

*/


-- Create Database 'DataWarehouse'
USE master;
GO

-- Drop and recreate the DataWarehouse database if it exists 
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to DataWarehouse database
USE DataWarehouse;
GO

-- Create three schemas (layers) 
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

