-- Standard SET options for Metadata 
SET ANSI_PADDING,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS ON
GO
SET NUMERIC_ROUNDABORT OFF
GO

SET NOCOUNT ON
GO

/**************************************************************** 
Name of object: dbo.IOChannel
DateCreated:    2021-10-22
CreatedBy:      Artem Gorin
Description:    FK Script

Modifications:
Date        User      Description
2021-10-22  agorin    Creation
****************************************************************/ 

ALTER TABLE dbo.IOChannel
    ADD
        CONSTRAINT FK_IOChannel_IOModuleID_IOModule_IOModuleID
        FOREIGN KEY (IOModuleID)
        REFERENCES dbo.IOModule (IOModuleID)

/*
ALTER TABLE dbo.IOChannel
    ADD
        CONSTRAINT FK_IOChannel_IOChannelID_Tag_IOChannelID
        FOREIGN KEY (IOChannelID)
        REFERENCES dbo.Tag (IOChannelID)
*/
GO
