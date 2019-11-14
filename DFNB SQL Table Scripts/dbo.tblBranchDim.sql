USE [DFNB3];
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 11/13/2019 5:25:48 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblBranchDim
(branch_id     SMALLINT NOT NULL
, branch_code   VARCHAR(5) NOT NULL
, branch_desc   VARCHAR(100) NOT NULL
, branch_add_id INT NOT NULL
, region_id     INT NOT NULL
, area_id       INT NOT NULL
, CONSTRAINT PK_tblBranchDim PRIMARY KEY CLUSTERED(branch_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

ALTER TABLE dbo.tblBranchDim
WITH CHECK
ADD CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id FOREIGN KEY(area_id) REFERENCES dbo.tblAreaDim(area_id);
GO

ALTER TABLE dbo.tblBranchDim CHECK CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id;
GO

ALTER TABLE dbo.tblBranchDim
WITH CHECK
ADD CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id FOREIGN KEY(branch_add_id) REFERENCES dbo.tblAddressDim(add_id);
GO

ALTER TABLE dbo.tblBranchDim CHECK CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id;
GO

ALTER TABLE dbo.tblBranchDim
WITH CHECK
ADD CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id FOREIGN KEY(region_id) REFERENCES dbo.tblRegionDim(region_id);
GO

ALTER TABLE dbo.tblBranchDim CHECK CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id;
GO