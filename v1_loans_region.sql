CREATE VIEW V1_loans_region
AS
     SELECT a.pri_cust_id
          , a.loan_amt
          , a.open_date
          , a.branch_id
          , b.branch_desc
          , c.region_desc
       FROM dbo.tblAccountDim AS A
            JOIN
            dbo.tblBranchDim AS b ON b.branch_id = a.branch_id
            JOIN
            dbo.tblRegionDim AS c ON c.region_id = b.region_id;