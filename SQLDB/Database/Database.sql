SET ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS ON
GO

SET NUMERIC_ROUNDABORT OFF
GO

SET NOCOUNT ON
GO

/****************************************************************
Name of object: Metrology
DateCreated:    2021-09-20
CreatedBy:      Artem Gorin
Description:    Database script

Modifications:
Date        User      Description
2021-09-20  agorin    Initial version.
****************************************************************/

DECLARE @DbName    NVARCHAR(9) = 'Metrology'
DECLARE @SqlScript NVARCHAR(MAX)

SET @SqlScript =
N'CREATE DATABASE ' + @DbName +
'	CONTAINMENT = NONE
	ON PRIMARY (
		NAME = N''' + @DbName + ''', FILENAME = N''C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\' + @DbName + '.mdf'', SIZE = 64MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8MB
	)
	LOG ON (
		NAME = N''' + @DbName + '_log'', FILENAME = N''C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\' + @DbName + '_log.ldf'', SIZE = 64MB, MAXSIZE = UNLIMITED, FILEGROWTH = 8MB
	)

ALTER DATABASE ' + @DbName + ' SET ANSI_NULL_DEFAULT OFF
ALTER DATABASE ' + @DbName + ' SET ANSI_NULLS ON
ALTER DATABASE ' + @DbName + ' SET ANSI_PADDING ON
ALTER DATABASE ' + @DbName + ' SET ANSI_WARNINGS ON
ALTER DATABASE ' + @DbName + ' SET ARITHABORT ON
ALTER DATABASE ' + @DbName + ' SET AUTO_CLOSE OFF
ALTER DATABASE ' + @DbName + ' SET AUTO_SHRINK OFF
ALTER DATABASE ' + @DbName + ' SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
ALTER DATABASE ' + @DbName + ' SET AUTO_UPDATE_STATISTICS ON
ALTER DATABASE ' + @DbName + ' SET CURSOR_CLOSE_ON_COMMIT OFF
ALTER DATABASE ' + @DbName + ' SET CURSOR_DEFAULT  GLOBAL
ALTER DATABASE ' + @DbName + ' SET CONCAT_NULL_YIELDS_NULL ON
ALTER DATABASE ' + @DbName + ' SET NUMERIC_ROUNDABORT OFF
ALTER DATABASE ' + @DbName + ' SET QUOTED_IDENTIFIER ON
ALTER DATABASE ' + @DbName + ' SET RECURSIVE_TRIGGERS OFF
ALTER DATABASE ' + @DbName + ' SET DISABLE_BROKER
ALTER DATABASE ' + @DbName + ' SET AUTO_UPDATE_STATISTICS_ASYNC OFF
ALTER DATABASE ' + @DbName + ' SET DATE_CORRELATION_OPTIMIZATION OFF
ALTER DATABASE ' + @DbName + ' SET PARAMETERIZATION SIMPLE
ALTER DATABASE ' + @DbName + ' SET READ_COMMITTED_SNAPSHOT OFF
ALTER DATABASE ' + @DbName + ' SET READ_WRITE
ALTER DATABASE ' + @DbName + ' SET RECOVERY SIMPLE
ALTER DATABASE ' + @DbName + ' SET MULTI_USER
ALTER DATABASE ' + @DbName + ' SET PAGE_VERIFY CHECKSUM
ALTER DATABASE ' + @DbName + ' SET DELAYED_DURABILITY = DISABLED
'

EXEC sp_executesql @SqlScript

/*
USE @DbName
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE @DbName
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE @DbName MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
*/