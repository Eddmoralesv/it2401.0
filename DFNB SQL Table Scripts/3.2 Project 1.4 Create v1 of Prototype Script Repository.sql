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

/****** Object:  Table [dbo].[tblAccountCustomerDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblAccountCustomerDim
(acct_id           INT NOT NULL, 
 cust_id           SMALLINT NOT NULL, 
 acct_cust_role_id SMALLINT NOT NULL, 
 CONSTRAINT PK_tblAccountCustomerDim PRIMARY KEY CLUSTERED(acct_id ASC, cust_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblAccountCustomerRoleDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblAccountCustomerRoleDim
(acct_cust_role_id   SMALLINT NOT NULL, 
 acct_cust_role_desc VARCHAR(50) NULL, 
 CONSTRAINT PK_tblAccountCustomerRoleDim PRIMARY KEY CLUSTERED(acct_cust_role_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblAccountDim
(acct_id         INT NOT NULL, 
 prod_id         SMALLINT NOT NULL, 
 open_date       [DATE] NOT NULL, 
 close_date      [DATE] NOT NULL, 
 open_close_code VARCHAR(1) NOT NULL, 
 branch_id       SMALLINT NOT NULL, 
 pri_cust_id     SMALLINT NOT NULL, 
 loan_amt        DECIMAL(20, 4) NOT NULL, 
 CONSTRAINT PK_tblAccountDim PRIMARY KEY CLUSTERED(acct_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblAccountFact
(as_of_date [DATE] NOT NULL, 
 acct_id    INT NOT NULL, 
 cur_bal    DECIMAL(20, 4) NOT NULL, 
 CONSTRAINT PK_tblAccountFact PRIMARY KEY CLUSTERED(as_of_date ASC, acct_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblAddressDim
(add_id   INT NOT NULL, 
 add_lat  DECIMAL(16, 12) NOT NULL, 
 add_lon  DECIMAL(16, 12) NOT NULL, 
 add_type VARCHAR(1) NOT NULL, 
 CONSTRAINT PK_tblAddressDim PRIMARY KEY CLUSTERED(add_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblAreaDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblAreaDim
(area_id   INT NOT NULL, 
 area_desc VARCHAR(50) NULL, 
 CONSTRAINT PK_tblAreaDim PRIMARY KEY CLUSTERED(area_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblBranchDim
(branch_id     SMALLINT NOT NULL, 
 branch_code   VARCHAR(5) NOT NULL, 
 branch_desc   VARCHAR(100) NOT NULL, 
 branch_add_id INT NOT NULL, 
 region_id     INT NOT NULL, 
 area_id       INT NOT NULL, 
 CONSTRAINT PK_tblBranchDim PRIMARY KEY CLUSTERED(branch_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblCustomerDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblCustomerDim
(cust_id              SMALLINT NOT NULL, 
 last_name            VARCHAR(100) NOT NULL, 
 first_name           VARCHAR(100) NOT NULL, 
 gender               VARCHAR(1) NOT NULL, 
 birth_date           [DATE] NOT NULL, 
 cust_since_date      [DATE] NOT NULL, 
 pri_branch_id        SMALLINT NOT NULL, 
 cust_pri_branch_dist DECIMAL(7, 2) NOT NULL, 
 cust_add_id          INT NOT NULL, 
 cust_lat             DECIMAL(16, 12) NOT NULL, 
 cust_lon             DECIMAL(16, 12) NOT NULL, 
 cust_rel_id          SMALLINT NOT NULL, 
 CONSTRAINT PK_tblCustomerDim PRIMARY KEY CLUSTERED(cust_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblProductDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblProductDim
(prod_id   SMALLINT NOT NULL, 
 prod_desc VARCHAR(50) NULL, 
 CONSTRAINT PK_tblProductDim PRIMARY KEY CLUSTERED(prod_id ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 11/13/2019 5:16:29 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE dbo.tblRegionDim
(region_id   INT NOT NULL, 
 region_desc VARCHAR(50) NULL, 
 CONSTRAINT PK_tblRegionDim PRIMARY KEY CLUSTERED(region_id ASC)
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
ALTER TABLE dbo.tblAccountFact
WITH CHECK
ADD CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);
GO
ALTER TABLE dbo.tblAccountFact CHECK CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id;
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
