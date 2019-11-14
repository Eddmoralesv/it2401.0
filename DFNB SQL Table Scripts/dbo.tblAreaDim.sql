USE [DFNB3];
GO

/****** Object:  Table [dbo].[tblAreaDim]    Script Date: 11/13/2019 5:23:40 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblAreaDim
(area_id   INT NOT NULL
, area_desc VARCHAR(50) NULL
, CONSTRAINT PK_tblAreaDim PRIMARY KEY CLUSTERED(area_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO