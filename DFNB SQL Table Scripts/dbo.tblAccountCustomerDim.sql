USE [DFNB3];
GO

/****** Object:  Table [dbo].[tblAccountCustomerDim]    Script Date: 11/13/2019 5:18:26 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblAccountCustomerDim
(acct_id           INT NOT NULL
, cust_id           SMALLINT NOT NULL
, acct_cust_role_id SMALLINT NOT NULL
, CONSTRAINT PK_tblAccountCustomerDim PRIMARY KEY CLUSTERED(acct_id ASC, cust_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

ALTER TABLE dbo.tblAccountCustomerDim
WITH CHECK
ADD CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id FOREIGN KEY(acct_cust_role_id) REFERENCES dbo.tblAccountCustomerRoleDim(acct_cust_role_id);
GO

ALTER TABLE dbo.tblAccountCustomerDim CHECK CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id;
GO

ALTER TABLE dbo.tblAccountCustomerDim
WITH CHECK
ADD CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);
GO

ALTER TABLE dbo.tblAccountCustomerDim CHECK CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id;
GO

ALTER TABLE dbo.tblAccountCustomerDim
WITH CHECK
ADD CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id FOREIGN KEY(cust_id) REFERENCES dbo.tblCustomerDim(cust_id);
GO

ALTER TABLE dbo.tblAccountCustomerDim CHECK CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id;
GO