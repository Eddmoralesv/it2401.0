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

/****** Object:  Table [dbo].[tblCustomerDim]    Script Date: 11/13/2019 5:26:16 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblCustomerDim
(cust_id              SMALLINT NOT NULL
, last_name            VARCHAR(100) NOT NULL
, first_name           VARCHAR(100) NOT NULL
, gender               VARCHAR(1) NOT NULL
, birth_date           [DATE] NOT NULL
, cust_since_date      [DATE] NOT NULL
, pri_branch_id        SMALLINT NOT NULL
, cust_pri_branch_dist DECIMAL(7, 2) NOT NULL
, cust_add_id          INT NOT NULL
, cust_lat             DECIMAL(16, 12) NOT NULL
, cust_lon             DECIMAL(16, 12) NOT NULL
, cust_rel_id          SMALLINT NOT NULL
, CONSTRAINT PK_tblCustomerDim PRIMARY KEY CLUSTERED(cust_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

ALTER TABLE dbo.tblCustomerDim
WITH CHECK
ADD CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id FOREIGN KEY(cust_add_id) REFERENCES dbo.tblAddressDim(add_id);
GO

ALTER TABLE dbo.tblCustomerDim CHECK CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id;
GO

ALTER TABLE dbo.tblCustomerDim
WITH CHECK
ADD CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id FOREIGN KEY(pri_branch_id) REFERENCES dbo.tblBranchDim(branch_id);
GO

ALTER TABLE dbo.tblCustomerDim CHECK CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id;
GO
