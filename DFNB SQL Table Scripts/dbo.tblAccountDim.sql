
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

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 11/13/2019 5:22:22 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblAccountDim
(acct_id         INT NOT NULL
, prod_id         SMALLINT NOT NULL
, open_date       [DATE] NOT NULL
, close_date      [DATE] NOT NULL
, open_close_code VARCHAR(1) NOT NULL
, branch_id       SMALLINT NOT NULL
, pri_cust_id     SMALLINT NOT NULL
, loan_amt        DECIMAL(20, 4) NOT NULL
, CONSTRAINT PK_tblAccountDim PRIMARY KEY CLUSTERED(acct_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

ALTER TABLE dbo.tblAccountDim
WITH CHECK
ADD CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id FOREIGN KEY(branch_id) REFERENCES dbo.tblBranchDim(branch_id);
GO

ALTER TABLE dbo.tblAccountDim CHECK CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;
GO

ALTER TABLE dbo.tblAccountDim
WITH CHECK
ADD CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id FOREIGN KEY(pri_cust_id) REFERENCES dbo.tblCustomerDim(cust_id);
GO

ALTER TABLE dbo.tblAccountDim CHECK CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id;
GO

ALTER TABLE dbo.tblAccountDim
WITH CHECK
ADD CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id FOREIGN KEY(prod_id) REFERENCES dbo.tblProductDim(prod_id);
GO

ALTER TABLE dbo.tblAccountDim CHECK CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id;
GO
