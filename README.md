# 🏦 Bank Loan Analysis - Power BI Dashboard

## 📊 Project Overview
This project analyzes bank loan applications using **SQL & Power BI** to gain insights into loan approvals, funding, repayment trends, and risk assessment. The goal is to help financial institutions make **data-driven lending decisions** by visualizing key metrics such as loan performance, borrower trends, and regional lending patterns.

## 🛠️ Tools & Technologies Used
- **SQL** (Data extraction & transformation)
- **Power BI** (Data visualization & reporting)
- **Bank Loan Dataset** (Structured loan application data)

## 📝 Data Analysis Process
1. **Data Extraction** - Retrieved loan data from the SQL database.
2. **Data Processing** - Used SQL queries for KPI calculations & trend analysis.
3. **Data Visualization** - Designed Power BI dashboards to present insights effectively.

## 📊 SQL Queries Used
Some key SQL queries used in the analysis:
```sql
-- Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Applications FROM Bank_Loan_DB;

-- Monthly Loan Applications (Dec 2021)
SELECT COUNT(id) AS MTD_Loan_Applications FROM Bank_Loan_DB
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Good Loan Percentage
SELECT COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN ID END) * 100 / COUNT(id) AS Good_Loan_Percentage FROM Bank_Loan_DB;
```
*(More queries are available in the `SQL_Queries` folder)*

## 🎨 Power BI Dashboard Breakdown
The project consists of **three dashboards**:
### **Dashboard 1: KPI Overview**
- Total Loan Applications
- Monthly Loan Applications (MTD & PMTD)
- Total Funded Amount & Received Amount
- Good vs. Bad Loan Ratio

### **Dashboard 2: Loan Distribution & Trends**
- Loans by Region, Term, Employment Length
- Loan Purpose Breakdown
- Home Ownership & Loan Issuance Patterns

### **Dashboard 3: Loan Status Grid**
- Loan Applications by Status
- Funded Amount & Received Amount per Loan Status
- Average Interest Rate & DTI

## 🔍 Key Insights & Takeaways
- **Good Loans (Fully Paid/Current) form the majority of issued loans** but Bad Loans still account for a significant percentage.
- **Most loans are issued for Debt Consolidation**, followed by Credit Card payments.
- **Higher employment tenure leads to higher loan approval rates**.
- **Certain regions have higher default rates**, indicating a need for stricter credit assessment.

## 🛠️ How to Access the Project
1. **Power BI File (.pbix):** [Download Here](#) *(https://github.com/kajal-1700/Bank-Loan-Analysis-SQL-PowerBI/blob/main/Power%20BI%20Dashboard.pbix)*
2. **SQL Queries:** Available in the `SQL_Queries` folder. *(https://github.com/kajal-1700/Bank-Loan-Analysis-SQL-PowerBI/blob/main/SQL%20Queries.sql
)*

## 💬 Let's Connect!
If you found this project interesting, feel free to connect with me on LinkedIn: [https://www.linkedin.com/in/kajaljaiswal1700/](#)

**Feedback & suggestions are always welcome!** 🚀

