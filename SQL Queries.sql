USE BankLoanDB

Select * from Bank_Loan_DB

Select 
	Count(id) as Total_Loan_Applications
FROM Bank_Loan_DB

Select 
	Count(id) as MTD_Loan_Applications
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 12 and Year(issue_date) = 2021

Select 
	Count(id) as PMTD_Loan_Applications
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 11 and Year(issue_date) = 2021

Select 
	SUM(loan_amount) as Total_funded_amount
FROM 
	Bank_Loan_DB

Select 
	SUM(loan_amount) as MTD_Funded_Amount
FROM 
	Bank_Loan_DB
WHERE Month(issue_date) = 12 and YEAR(issue_date) = 2021


Select 
	SUM(loan_amount) as PMTD_Funded_Amount
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 11 and YEAR(issue_date) = 2021

Select 
	SUM(total_payment) as Total_Amount_Received
FROM 
	Bank_Loan_DB

Select 
	SUM(total_payment) as MTD_Total_Amount_Received
FROM 
	Bank_Loan_DB
WHERE
	Month(issue_date) = 12 and YEAR(issue_date) = 2021

Select 
	SUM(total_payment) as PMTD_Total_Amount_Received
FROM 
	Bank_Loan_DB
WHERE
	Month(issue_date) = 11 and YEAR(issue_date) = 2021
	

Select 
	ROUND(AVG(int_rate),4) *100 as Avg_Interest_Rate
FROM 
	Bank_Loan_DB

Select 
	ROUND(AVG(int_rate),4) *100 as MTD_Avg_Interest_Rate
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 12 and YEAR(issue_date) = 2021
	
Select 
	ROUND(AVG(int_rate),4) *100 as PMTD_Avg_Interest_Rate
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 11 and YEAR(issue_date) = 2021

Select 
	ROUND(AVG(dti),4) *100 as Avg_DateToYear_Ratio
FROM 
	Bank_Loan_DB
	
Select 
	ROUND(AVG(dti),4) *100 as MTD_DateToYear_Ratio
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 12 and YEAR(issue_date) = 2021

Select 
	ROUND(AVG(dti),4) *100 as PMTD_DateToYear_Ratio
FROM 
	Bank_Loan_DB
WHERE 
	Month(issue_date) = 11 and YEAR(issue_date) = 2021

-- Good loans Status: Current or Fully paid & Bad loan Status: Charged

Select 
	Count (CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' 
THEN ID END) *100 /
	Count(id) AS Good_Loan_Percentage
FROM Bank_Loan_DB

-- Total good loan applications
Select 
	Count(id) AS Good_Loan_Application
FROM 
	Bank_Loan_DB
WHERE 
	loan_status = 'Fully Paid' OR loan_status = 'Current' 

-- Good loan funded Amount
Select 
	SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM 
	Bank_Loan_DB
WHERE 
	loan_status = 'Fully Paid' OR loan_status = 'Current' 

-- Good loan Total received Amount
Select 
	SUM(total_payment) AS Good_Loan_Received_Amt
FROM 
	Bank_Loan_DB
WHERE 
	loan_status = 'Fully Paid' OR loan_status = 'Current' 

-- Good loans Status: Current or Fully paid & Bad loan Status: Charged

-- Total bad loans issued percentage
Select 
	Count (CASE WHEN loan_status = 'Charged Off' 
THEN ID END) *100 /
	Count(id) AS Bad_Loan_Percentage
FROM Bank_Loan_DB

-- Total bad loan applications
Select 
	Count(id) AS Bad_Loan_Application
FROM 
	Bank_Loan_DB
WHERE 
	loan_status = 'Charged Off'  

-- Bad loan funded Amount
Select 
	SUM(loan_amount) AS BAD_Loan_Funded_Amount
FROM 
	Bank_Loan_DB
WHERE 
	loan_status = 'Charged Off'  

-- Bad loan Total received Amount
Select 
	SUM(total_payment) AS Bad_Loan_Received_Amt
FROM 
	Bank_Loan_DB
WHERE 
	loan_status = 'Charged Off'  
	
-- Loan status grid view
Select 
	loan_status,
	COUNT(id) as Total_Applications,
	SUM(Total_payment) AS Total_Amount_Received,
	SUM(Loan_Amount) AS Total_funded_Amount,
	ROUND(AVG(int_rate*100),4) AS Interest_rate,
	ROUND(AVG(dti), 4) *100 AS DTI
FROM 
	Bank_Loan_DB
GROUP BY 
	loan_status

Select 
	loan_status,
	COUNT(id) as MTD_Total_Applications,
	SUM(Total_payment) AS MTD_Total_Amount_Received,
	SUM(Loan_Amount) AS MTD_Total_funded_Amount,
	ROUND(AVG(int_rate*100),4) AS MTD_Interest_rate,
	ROUND(AVG(dti), 4) *100 AS MTD_DTI
FROM 
	Bank_Loan_DB
WHERE 
	MONTH(issue_date) = 12
GROUP BY 
	loan_status

Select 
	loan_status,
	COUNT(id) as MTD_Total_Applications,
	SUM(Total_payment) AS MTD_Total_Amount_Received,
	SUM(Loan_Amount) AS MTD_Total_funded_Amount,
	ROUND(AVG(int_rate*100),4) AS MTD_Interest_rate,
	ROUND(AVG(dti), 4) *100 AS MTD_DTI
FROM 
	Bank_Loan_DB
WHERE 
	MONTH(issue_date) = 12
GROUP BY 
	loan_status

-------------------------------------------------------------------------------------------------------------------

--DASHBOARD 2 KPI's

SELECT * FROM Bank_Loan_DB

SELECT 
	DATENAME(Month, issue_date) AS Month_Name,
	COUNT(id) as Total_loan_Applications,
	SUM(loan_amount) AS Total_funded_Amount,
	SUM(total_payment) AS Total_received_Amount
FROM 
	Bank_Loan_DB
GROUP BY
	Month(issue_date), DATENAME(Month, issue_date)
ORDER BY 
	Month(issue_date)

SELECT 
    address_state,
    COUNT(id) AS RegionWiseApplications,
    SUM(loan_amount) AS RegionWiseLending,
    SUM(total_payment) AS RegionWise_ReceivedAmount
FROM 
    Bank_Loan_DB
GROUP BY 
    address_state
ORDER BY RegionWiseLending DESC

SELECT 
	term,
	COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    Bank_Loan_DB
GROUP BY 
	term
ORDER BY 
	term 


SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    Bank_Loan_DB
GROUP BY 
	emp_length
ORDER BY 
	emp_length
	
SELECT 
	Purpose,
	COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    Bank_Loan_DB
GROUP BY 
	purpose
ORDER BY 
	Total_Loan_Applications

SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM 
    Bank_Loan_DB
GROUP BY 
	home_ownership
ORDER BY 
	Total_Loan_Applications DESC

SELECT @@SERVERNAME


	


	









