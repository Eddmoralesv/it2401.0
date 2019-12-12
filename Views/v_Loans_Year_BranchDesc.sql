/*****************************************************************************************************************
NAME:    v_Loans_Year_BranchDesc
PURPOSE: Create the v_Loans_Year_BranchDesc view
SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       12/12/2019   EMORALES      1. Built this view

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

CREATE VIEW v_Loans_Year_BranchDesc
AS
     SELECT YEAR(tran_date) AS TransYear
          , branch_desc
          , SUM(loan_amt) AS YearTotal
       FROM dbo.tblAccountDim AS a
            JOIN
            dbo.tblTransactionFact AS b ON b.acct_id = a.acct_id
            JOIN
            dbo.tblBranchDim AS c ON c.branch_id = a.branch_id
      GROUP BY YEAR(tran_date)
             , branch_desc;