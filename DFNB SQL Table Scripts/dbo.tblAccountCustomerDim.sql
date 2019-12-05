/*****************************************************************************************************************
NAME:    dbo.v_source
PURPOSE: Create the dbo.v_source view

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       02/20/2019   JJAUSSI      1. Built this view
1.1       04/09/2019   JJAUSSI      1. Improved this view for...


RUNTIME: 
1 min

NOTES: 
The idea is that a small number of load Product Detail Codes were found in more than one source system. 
When we observe these N:N relationships during the recent past the count of Accounts is how we can resolve them.

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/
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
