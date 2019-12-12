USE [DFNB3];
GO

/****** Object:  View [dbo].[v_loans_year]    Script Date: 12/12/2019 12:36:25 AM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW dbo.v_loans_year
AS
     SELECT YEAR(tran_date) AS TransYear
          , SUM(loan_amt) AS YearTotal
       FROM dbo.tblAccountDim AS a
            JOIN
            dbo.tblTransactionFact AS b ON b.acct_id = a.acct_id
      GROUP BY YEAR(tran_date);
GO
