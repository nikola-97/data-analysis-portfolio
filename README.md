# Portfolio Projects

Welcome to my portfolio projects! Here you will find brief summaries of my projects. Each project includes a link to its main page, where you can explore the methodology, analysis, and results in greater detail.

## Contents

* **Python**
    + [German Credit Data](#project-1-german-credit-data)
    + [Iranian Transactions (Data Cleaning)](#project-2-iranian-transactions-data-cleaning) (coming soon)
    + [Iranian Transactions (Data Analysis)](#project-3-iranian-transactions-data-analysis) (coming soon)
* **SQL**
    + [Iranian Transactions](#project-2-iranian-transactions-data-cleaning) (coming soon)

--- 

## Project 1: German Credit Data

**Code:** [project_1.ipynb](Projects/Codes/project_1.ipynb)

**Research Question:** To what extent do demographic and financial characteristics influence credit risk?

**Description:** This project investigates whether demographic and financial characteristics can predict customer credit risk using the German Credit dataset. Logistic regression models were applied to evaluate the relationship between borrower characteristics and the probability of belonging to the low-risk or high-risk credit group. Model performance was assessed through odds ratios, confusion matrices, and threshold analysis.

**Skills:** data analysis, logistic regression, data visualization

**Technology:** Python, Pandas, Numpy, Scipy, Matplotlib 

**Results:** The odds-ratio analysis indicates that financial characteristics provide stronger information about creditworthiness than demographic characteristics. Higher savings categories exhibit substantially elevated odds of belonging to the low-risk credit group relative to the reference category. In contrast, occupational categories remain close to the no-effect threshold (Odds Ratio = 1), suggesting limited predictive value after controlling for other variables. Several loan-purpose categories display meaningful positive effects, although some estimates are accompanied by wide confidence intervals, indicating greater uncertainty.

**Project Statistics:**
* Duration:
  + dataset analysis and visualization: 13,5 hours (26.10.26 - 29.10.26)
  + interpretation and structural organization on GitHub: ~ 12 hours (30.10., 02.11.26 - 05.11.26)
* Dataset Complexity: low

**More about the Project:** [Project 1](Projects/Project_1.md)

---

## Project 2: Iranian Transactions (Data Cleaning)

**Code:**
* SQL: [ir_transactions_dc](Projects/Codes/ir_transactions_dc.sql)
* Python: 

**Description:** This project examines data cleaning procedures using SQL and Python. The dataset was deliberately designed for data cleaning practice and contains common data quality issues, including inconsistent formatting, missing values (NULLs), duplicate records, extreme transaction amount outliers, negative transaction values, and non-unique identifiers.

**Skills:** data cleaning

**Technology:** MySQL, Python (Pandas, Numpy)

**Results:** Successfully identified and corrected all major data quality issues using SQL and Python. The final dataset was standardized, free of duplicate records, contained unique identifiers, and was prepared for reliable analysis.

**Project Statistics:**
* Duration:
  + SQL: 4 hours (15.11.2026)
  + Python: 
* Dataset Complexity: beginner/advanced

**More about the Project:** [Project 2]

---

## Project 3: Iranian Transactions (Data Analysis)

**Code:**

**Description:**

**Skills:** data analysis, data visualization

**Technology:** Python, Pandas, Numpy, Matplotlib, Scipy

**Results:**

**Project Statistics:**

**More about the Project:**
