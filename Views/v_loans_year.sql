/*****************************************************************************************************************
NAME:    dbo.v_loans_year
PURPOSE: Create the dbo.v_loans_year view
SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net
MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/11/2019   EMORALES      1. Built this view
1.1       12/12/2019   EMORALES      1. Added as SQL file
1.2       12/12/2019   EMORALES      1. Added header
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
