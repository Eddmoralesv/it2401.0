USE [DFNB3];
GO

/****** Object:  Table [dbo].[tblAccountCustomerRoleDim]    Script Date: 11/13/2019 5:20:14 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblAccountCustomerRoleDim
(acct_cust_role_id   SMALLINT NOT NULL
, acct_cust_role_desc VARCHAR(50) NULL
, CONSTRAINT PK_tblAccountCustomerRoleDim PRIMARY KEY CLUSTERED(acct_cust_role_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO