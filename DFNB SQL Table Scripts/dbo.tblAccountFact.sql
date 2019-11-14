USE [DFNB3];
GO

/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 11/13/2019 5:22:49 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.tblAccountFact
(as_of_date [DATE] NOT NULL
, acct_id    INT NOT NULL
, cur_bal    DECIMAL(20, 4) NOT NULL
, CONSTRAINT PK_tblAccountFact PRIMARY KEY CLUSTERED(as_of_date ASC, acct_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

ALTER TABLE dbo.tblAccountFact
WITH CHECK
ADD CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);
GO

ALTER TABLE dbo.tblAccountFact CHECK CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id;
GO