---- what was bank level production by year?
--SELECT YEAR(tad.open_date) AS open_date_year
--     , SUM(tad.loan_amt) AS loan_amt_sum
--  FROM dbo.tblAccountDim AS tad
-- GROUP BY YEAR(tad.open_date)
-- ORDER BY 1;
 
 -- what was bank, branch, region, product, new Vs Existing level production by year?

SELECT YEAR(tad.open_date) AS open_date_year
	   ,YEAR(tcd.cust_since_date) AS cust_since_date_year
	   ,CASE 
			WHEN YEAR (tad.open_date) = YEAR (tcd.cust_since_date)
			THEN 'New'
			ELSE 'Existing'
			END as New_vs_Existing_Cust

       ,tbd.[region_id] 
       ,tbd.branch_id 
       ,tad.prod_id
       ,SUM(tad.loan_amt) AS loan_amt_sum
FROM dbo.tblAccountDim AS tad
     INNER JOIN [dbo].[tblBranchDim] AS tbd ON tad.branch_id = tbd.branch_id
     INNER JOIN [dbo].[tblBranchDim] AS trd ON tbd.region_id = trd.region_id
     INNER JOIN dbo.tblCustomerDim AS tcd ON tcd.cust_id = tad.pri_cust_id
GROUP BY YEAR(tad.open_date), 
	     YEAR(tcd.cust_since_date)
         ,tbd.[region_id] 
         ,tbd.branch_id 
         ,tad.prod_id
		 ,CASE 
			WHEN YEAR (tad.open_date) = YEAR (tcd.cust_since_date)
			THEN 'New'
			ELSE 'Existing'
			END
ORDER BY 1, 
         tbd.[region_id];