## Project Overview

**Context:** This project simulates a banking credit-risk assessment scenario using the German Credit dataset. The goal is to identify factors associated with customer creditworthiness and support lending decisions through data analysis. 

**Problem Statement:** To what extent do demographic and financial characteristics influence credit risk?

**Approach:** Credit risk (1 = low risk, 0 = high risk) was modeled using logistic regression. Two separate models were estimated: one using demographic factors and another using financial factors. Model performance was evaluated through odds ratios, probability predictions, and confusion matrices.

**Outcome:** The analysis identified several significant predictors of creditworthiness and highlighted the trade-off between risk reduction and customer acceptance at different classification thresholds. Overall, the findings align with established banking risk-management principles.

## Table of Contents

1. [Objectives](#1-objectives)
2. [Project Scope & Tools](#2-project-scope--tools)
3. [Data Workflow](#3-data-workflow)
4. [Data Model & Schema](#4-data-model--schema)
5. [Analysis & Metrics](#5-analysis--metrics)
6. [Visualization](#6-visualization)
7. [Key Insights](#7-key-insights)
8. [Recommendations](#8-recommendations)
9. [Assumptions & Limitations](#9-assumptions--limitations)
10. [Future Enhancements](#10-future-enhancements)
11. [Deliverables](#11-deliverables)
12. [Author](#12-author)
---

## 1. Objectives

- **Primary Objective:** Identify the key demographic and financial factors associated with credit risk.
- **Secondary Objective 1:** Compare model performance using confusion matrices and alternative classification thresholds.
- **Secondary Objective 2:** Evaluate potential interaction effects between significant predictors.
- **Secondary Objective 3:** Test and interpret statistical hypotheses using logistic regression.
---

## 2. Project Scope & Tools

### Scope

| Dimension | Details |
|-----------|---------|
| **In Scope** | [What is included - data sources, time periods, segments] |
| **Out of Scope** | Some variables like whether the customer has a telephone number, whether she is foreigner. Because most of the variables are categorical, I wanted to include only those that are much more likely to show significant results, with focus on the topic. Additionally, I had to be careful with the number of independent variables, because of multicollinearity. |
| **Time Period** | unknown |
| **Granularity** | 1000 rows, where one row represents one customer |

### Tools & Technologies

| Category | Tool(s) Used |
|----------|-------------|
| Data Storage | CSV |
| Data Processing | Python |
| Analysis | pandas, numpy, scipy |
| Visualization | matplotlib |

---

## 3. Data Workflow

1. **Source:** Kaggle
2. **Ingestion:** [How was it brought in?]
3. **Cleaning:** The dataset is clean, there are no missing values or uncompleted rows.
4. **Transformation:** For each regression I created a data frame containing only dependent and independent variables.
5. **Analysis:** Logistic regression functions, summary tables, confusion matrix, errorbar (forest diagram), predicted probability.
6. **Output:** Results are presented in tables and visualizations.

---

## 4. Data Model & Schema

### Columns Overview

| Index | Column Name | Data Type | Description | Categories |
|-------|-----|-----------|-------------|---------------|
| 1 | `status` | int64 | ordinal categorical | 1: no checking account, 2: less than 0 DM, 3: 0 to 200 DM, 4: 200 DM or more |
| 2 | `duration` | int64 | numerical | duration range: 4 - 72 (months) |
| 3 | `credit_history` | int64 | nominal categorical | 0: delay in paying off in the past, 1: critical account/other credits elsewhere, 2: no credits taken/all credits paid back duly, 3: existing credits paid back duly till now, 4: all credits at this bank paid back duly |
| 4 | `purpose` | int64 | nominal categorical | 0: others, 1: car (new), 2: car (used), 3: furniture/equipment, 4: radio/television, 5: domestic appliances, 6: repairs, 7: education, 8: vacation, 9: retraining, 10: business |
| 5 | `amount` | int64 | numerical | amount range: 250 - 18424 DM |
| 6 | `savings` | int64 | ordinal categorical | 1: unknown/no savings account, 2: less than 100 DM, 3: 100 to 500 DM, 4: 500 to 1000 DM, 5: 1000 DM or more |
| 7 | `employment_duration` | int64 | ordinal categorical | 1: unemployed, 2: less than 1 year, 3: 1 to 4 yrs, 4: 4 to 7 yrs, 5: 7 yrs or more |
| 8 | `installment_rate` | int64 | ordinal categorical | 1: 35 or more, 2: 25 to 35, 3: 20 to 25, 4: less than 20 |
| 9 | `personal_status_sex` | int64 | nominal categorical | 1: divorced/separated male, 2: single male or non-single female, 3: married/widowed male, 4: single female |
| 10 | `other_deptors` | int64 | nominal categorical | 1: none, 2: co-applicant, 3: guarantor |
| 11 | `present_residence` | int64 | ordinal categorical | 1: less than 1 year, 2: 1 to 4 yrs, 3: 4 to 7 yrs, 4: 7 yrs or more |
| 12 | `property` | int64 | nominal categorical | 1: unknown/no property, 2: car or other, 3: building soc. savings agr./life insurance, 4: real estate |
| 13 | `age` | int64 | numerical | age range: 19 - 75 |
| 14 | `other_installment_plans` | int64 | nominal categorical | 1: bank, 2: stores, 3: none |
| 15 | `housing` | int64 | nominal categorical | 1: for free, 2: rent, 3: own |
| 16 | `number_credits` | int64 | ordinal categorical | 1: 1, 2: 2-3, 3: 4-5, 4: 6 or more |
| 17 | `job` | int64 | ordinal categorical | 1: unemployed/unskilled - non-resident, 2: unskilled-resident, 3: skilled employee/official, 4: manager/self-employed/highly qualified employee |
| 18 | `people_liable` | int64 | ordinal categorical | 1: 3 or more, 2: 0 to 2 |
| 19 | `telephone` | int64 | nominal categorical | 1: no, 2: yes (under customer name) |
| 20 | `foreign_worker` | int64 | nominal categorical | 1: yes, 2: no |
| 21 | `credit_risk` | int64 | nominal categorical | 0: high, 1: low |

**Row count:** 1000 rows

---

## 5. Analysis & Metrics

### Analytical Approach

[Describe how you approached the analysis. Were you exploring patterns? Testing a hypothesis? Building and validating a pipeline? Be honest about your method - exploratory work is valid, just call it that.]

### Key Metrics Defined

| Metric | Plain-Language Definition | Why It Matters |
|--------|--------------------------|----------------|
| `reg_dem` | Measures demographic factors on credit_risk. | [What decision or question it answers] |
| `reg_fin` | Measures financial factors on credit_risk. | [What decision or question it answers] |
| `[Metric 3]` | [What it measures, in one sentence] | [What decision or question it answers] |

### Methods Used

- Logistic regression estimation
- Confusion Matrix
- Odds Ratios

---

## 6. Visualization

### Forest Diagrams (Error Bars)

Explore how [demographic](Visuals/Project 1/log_regr_dem_coef.jpg) and [financial](log_regr_fin_coef.jpg) characteristics influence credit risk through the logistic regression coefficient visualizations.


### Confusion Matrices

<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/b4353411-0196-4672-a621-721200a63cb5" />
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/5e37dfdb-fba7-4d04-9634-32969c0fa991" />

Left: confusion matrix of reg_dem | Right: confusion matrix of reg_fin

<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/00a07919-0094-4134-8e1b-a58bb7d3e632" />
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/68fbd9e7-5387-4093-80e7-c42edfbbe3c7" />

...

<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/2b04a978-ddc3-4e71-8122-2d8a6fcabe46" />
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/d655c776-8a36-43e8-90fe-2428b872a9c6" />

...

### Creditworthiness 

---

## 7. Key Insights

**Insight 1: [Short descriptive headline]**
[What you found + what it suggests. One short paragraph.]

**Insight 2: [Short descriptive headline]**
[What you found + what it suggests.]

**Insight 3: [Short descriptive headline]**
[What you found + what it suggests.]

**Insight 4 (if applicable): [Short descriptive headline]**
[What you found + what it suggests.]

---

## 8. Recommendations

| Priority | Recommendation | Based On | Suggested Owner |
|----------|---------------|----------|-----------------|
| High | [Specific, actionable step] | [Insight it comes from] | [Who should act] |
| Medium | [Specific, actionable step] | [Insight it comes from] | [Who should act] |
| Low | [Exploratory or longer-term suggestion] | [Insight it comes from] | [Who should act] |

---

## 9. Assumptions & Limitations

### Assumptions
- [What did you treat as true without being able to verify?]
- [What simplifications did you make for scope or feasibility?]
- [What domain rules or definitions did you accept as given?]

### Limitations
- [What gaps exist in the data?]
- [What analysis was out of scope but could affect interpretation?]
- [What would a more rigorous version of this project include?]
- [Are there known biases in the data source or collection method?]

> *The goal here is pre-emptive Q&A. What would a thoughtful skeptic push back on? Document the answer here, before they ask.*

---

## 10. Future Enhancements

- [ ] [Enhancement 1 - specific and traceable to a real gap in this project]
- [ ] [Enhancement 2]
- [ ] [Enhancement 3]
- [ ] [Enhancement 4]

---

## 11. Deliverables

| Deliverable | Description | Location |
|-------------|-------------|----------|
| [Name] | [What it contains] | [`/path/to/file`] |
| [Name] | [What it contains] | [`/path/to/file`] |
| [Name] | [What it contains] | [`/path/to/file`] |

---

## 12. Author

**Nikola Richev**
Currently looking for a job in (Junior) Data Analysis/Science (Consultant).

- 🔗 You can find me on [LinkedIn](www.linkedin.com/in/nikola-richev-1347a6443)
- 💼 [Portfolio or GitHub profile URL]

---

*Last updated: 31.10.2026*
