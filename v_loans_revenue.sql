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