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
CREATE VIEW v_loans_revenue
AS
     SELECT a.loan_amt
          , a.prod_id
          , a.pri_cust_id
          , b.cur_bal
          , c.prod_desc
          , d.first_name
          , d.last_name
          , e.acct_id
       FROM dbo.tblAccountDim AS a
            JOIN
            dbo.tblAccountFact AS b ON b.acct_id = a.acct_id
            JOIN
            dbo.tblProductDim AS c ON c.prod_id = a.prod_id
            JOIN
            dbo.tblAccountCustomerDim AS e ON e.acct_id = a.acct_id
            JOIN
            dbo.tblCustomerDim AS d ON d.cust_id = e.cust_id;
