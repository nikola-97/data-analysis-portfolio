## Project Overview

**Context:** This project simulates a banking credit-risk assessment scenario using the German Credit dataset. The goal is to identify factors associated with customer creditworthiness and support lending decisions through data analysis. 

**Problem Statement:** To what extent do demographic and financial characteristics influence credit risk?

**Approach:** Credit risk (1 = low risk, 0 = high risk) was modeled using logistic regression. Two separate models were estimated: one using a mixture of demographic factors and some financial factors, and another using only financial factors. Model performance was evaluated through odds ratios and confusion matrices.

**Outcome:** The analysis identified several significant predictors of creditworthiness and highlighted the trade-off between risk reduction and customer acceptance at different classification thresholds. Overall, the findings align with established banking risk-management principles.

## Table of Contents

1. [Objectives](#1-objectives)
2. [Tools](#2-tools)
3. [Data Workflow](#3-data-workflow)
4. [Data Model & Schema](#4-data-model--schema)
5. [Analysis & Metrics](#5-analysis--metrics)
6. [Visualization](#6-visualization)
7. [Key Insights](#7-key-insights)
8. [What would a bank do?](#8-what-would-a-bank-do?)
9. [Limitations](#9-limitations)
10. [Future Enhancements](#10-future-enhancements)
11. [Deliverables](#11-deliverables)
12. [Author](#12-author)
---

## 1. Objectives

- **Primary Objective:** Identify the key demographic and financial factors associated with credit risk.
- **Secondary Objective 1:** Compare model performance using confusion matrices and alternative classification thresholds.
- **Secondary Objective 2:** Explain the decisions that have to be made given the results.
---

## 2. Tools

| Category | Tool(s) Used |
|----------|-------------|
| Data Storage | CSV |
| Data Processing | Python |
| Analysis | pandas, numpy, scipy |
| Visualization | matplotlib |

---

## 3. Data Workflow

1. **Source:** Kaggle, [German Credit Data](https://www.kaggle.com/datasets/jumpingdino/german-credit-dataset)
2. **Cleaning:** The dataset is clean, there are no missing values or empty rows.
3. **Analysis:** Logistic regressions, summary tables, confusion matrices, errorbar (forest diagram), predicted probability.
4. **Output:** See Section 6.

---

## 4. Data Model & Schema

### Columns Overview

| Index | Column Name | Data Type | Description | Categories |
|-------|-----|-----------|-------------|---------------|
| 1 | `status` | int64 | ordinal categorical | [1: no checking account], 2: less than 0 DM, 3: 0 to 200 DM, 4: 200 DM or more |
| 2 | `duration` | int64 | numerical | duration range: 4 - 72 (months) |
| 3 | `credit_history` | int64 | nominal categorical | [0: delay in paying off in the past], 1: critical account/other credits elsewhere, 2: no credits taken/all credits paid back duly, 3: existing credits paid back duly till now, 4: all credits at this bank paid back duly |
| 4 | `purpose` | int64 | nominal categorical | [0: others], 1: car (new), 2: car (used), 3: furniture/equipment, 4: radio/television, 5: domestic appliances, 6: repairs, 7: education, 8: vacation, 9: retraining, 10: business |
| 5 | `amount` | int64 | numerical | amount range: 250 - 18424 DM |
| 6 | `savings` | int64 | ordinal categorical | [1: unknown/no savings account], 2: less than 100 DM, 3: 100 to 500 DM, 4: 500 to 1000 DM, 5: 1000 DM or more |
| 7 | `employment_duration` | int64 | ordinal categorical | [1: unemployed], 2: less than 1 year, 3: 1 to 4 yrs, 4: 4 to 7 yrs, 5: 7 yrs or more |
| 8 | (`installment_rate`) | int64 | ordinal categorical; in % | 1: 35 or more, 2: 25 to 35, 3: 20 to 25, 4: less than 20 |
| 9 | `personal_status_sex` | int64 | nominal categorical | [1: divorced/separated male], 2: single male or non-single female, 3: married/widowed male, 4: single female |
| 10 | (`other_deptors`) | int64 | nominal categorical | 1: none, 2: co-applicant, 3: guarantor |
| 11 | `present_residence` | int64 | ordinal categorical | [1: less than 1 year], 2: 1 to 4 yrs, 3: 4 to 7 yrs, 4: 7 yrs or more |
| 12 | `property` | int64 | nominal categorical | [1: unknown/no property], 2: car or other, 3: building soc. savings agr./life insurance, 4: real estate |
| 13 | `age` | int64 | numerical | age range: 19 - 75 |
| 14 | (`other_installment_plans`) | int64 | nominal categorical | 1: bank, 2: stores, 3: none |
| 15 | `housing` | int64 | nominal categorical | [1: for free], 2: rent, 3: own |
| 16 | `number_credits` | int64 | ordinal categorical | [1: 1], 2: 2-3, 3: 4-5, 4: 6 or more |
| 17 | `job` | int64 | ordinal categorical | [1: unemployed/unskilled] - non-resident, 2: unskilled-resident, 3: skilled employee/official, 4: manager/self-employed/highly qualified employee |
| 18 | (`people_liable`) | int64 | ordinal categorical | 1: 3 or more, 2: 0 to 2 |
| 19 | (`telephone`) | int64 | nominal categorical | 1: no, 2: yes (under customer name) |
| 20 | (`foreign_worker`) | int64 | nominal categorical | 1: yes, 2: no |
| 21 | `credit_risk` | int64 | nominal categorical | 0: high, 1: low |

Columns in round brackets are not part of the analysis. Categories in the square brackets are the reference categories.  

**Row count:** 1000 rows

**Comment**: The regression models include only variables considered most relevant to creditworthiness assessment. This approach improves interpretability and reduces the risk of introducing redundant information through highly correlated predictors.

---

## 5. Analysis & Metrics

### Analytical Approach

The analysis was conducted in several stages. First, the variables were translated in english and classified as numerical, nominal categorical, or ordinal categorical variables to ensure an appropriate model specification. Logistic regression was then used to examine whether customer characteristics could predict membership in the low-risk or high-risk credit group. To better understand the practical relevance of the predictors, coefficient estimates were transformed into odds ratios and evaluated together with their 95% confidence intervals. Finally, model performance was assessed using confusion matrices and different classification thresholds in order to evaluate the trade-off between risk reduction and customer acceptance. 

Beyond coefficient and odds-ratio analysis, the effects of age and savings were visualized through predicted probability plots. These visualizations complement the regression results by demonstrating how changes in selected predictors influence the estimated probability of belonging to the low-risk credit group.

### Key Metrics Defined

| Metric | Plain-Language Definition | Why It Matters |
|--------|--------------------------|----------------|
| `reg_fin` | Measures financial factors on credit_risk. | The financial and credit-history model appears more useful for credit-risk assessment because it relies on variables that directly reflect customer solvency and repayment behavior. |
| `reg_dem` | Measures demographic factors on credit_risk | In contrast, demographic characteristics provide comparatively weaker and less consistent signals regarding creditworthiness. |

### Methods Used

- Logistic regression estimation
- Confusion Matrix
- Odds Ratios

---

## 6. Visualization

### Forest Diagrams (Error Bars)

Explore how [demographic](Visuals/Project_1/log_regr_coef.jpg) and [financial](Visuals/Project_1/log_regr_fin_coef.jpg) characteristics influence credit risk through the logistic regression coefficient visualizations. The coefficient (log-odds) plots provide insight into the direction and statistical significance of predictor effects. For substantive interpretation, the analysis focuses on odds ratios, which offer a more intuitive measure of how demographic and financial characteristics influence creditworthiness.

#### How to read those diagrams?

The blue dots represent the estimated odds ratios of the predictor variables, while the horizontal lines indicate their 95% confidence intervals. The red dashed vertical line marks an odds ratio of 1, which represents no effect on creditworthiness relative to the reference category. Variables with confidence intervals that cross the red line should be interpreted with caution, as their effects are not statistically distinguishable from zero at the 95% confidence level. Odds ratios above 1 indicate higher odds of belonging to the low-risk credit group, whereas odds ratios below 1 indicate lower odds.

<img width="700" height="500" alt="image" src="https://github.com/user-attachments/assets/a80ab3ce-f051-4abb-971e-5966f769ba59" />

Forest Diagram for reg_dem

The odds-ratio plot highlights the relative importance of the predictors included in the model. Savings-related variables exhibit the most pronounced positive effects, indicating that customers with higher savings balances are substantially more likely to belong to the low-risk credit group. Several loan-purpose categories also display elevated odds ratios, although some of these estimates are characterized by wide confidence intervals and therefore greater uncertainty. In contrast, occupational status and housing categories provide comparatively little information for distinguishing between low-risk and high-risk borrowers. 

<img width="700" height="500" alt="image" src="https://github.com/user-attachments/assets/03f526d5-9c0a-42d7-9654-87a02f42e7e2" />

Forest Diagram for reg_fin

Here, the odds-ratio analysis indicates that account status, savings behavior, and credit history are among the strongest predictors of creditworthiness. Customers with positive checking-account balances and favorable repayment histories exhibit substantially higher odds of belonging to the low-risk credit group relative to the corresponding reference categories. By contrast, property ownership and residential status contribute comparatively little additional information. Overall, the findings suggest that indicators of financial behavior and repayment capacity play a more important role in credit-risk assessment than personal or demographic characteristics. 

### Confusion Matrices

Take a moment and look at the confucion matrices by different tresholds:

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

#### Effect of Age on Creditworthiness

<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/021c526d-7572-49c6-a288-6ccc75e6df36" />
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/268e11aa-1f24-4dc1-a9ee-4fada1da95eb" />

Left: reg_dem | Right: reg_fin

As the visualizations suggest, older customers exhibit a higher predicted probability of belonging to the low-risk credit group. However, this relationship should be interpreted with caution. Considering the results from the regression estimation model, age has not shown statistical significance at the 95% confidence level. Furthermore, in the context of credits and rentability, such association between age and creditworthiness is justified through the fact that older customers tend to have more savings, longer employment histories, and more established financial behavior than younger customers. Consequently, the results do not provide sufficient evidence to conclude that age alone has a meaningful independent effect on credit risk within the scope of this dataset.

#### Effect of Savings on Creditworthiness

<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/30cc3854-7c72-4c1b-a7fc-900011fdb507" />
<img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/5c194685-64d8-4b9f-b053-dadd9b64d409" />

Left: reg_dem | Right: reg_fin

Although the predicted probabilities differ between the two model specifications, both models indicate a positive relationship between savings and creditworthiness. Customers with higher savings balances consistently exhibit a greater probability of belonging to the low-risk credit group. The stronger effect observed in the financial model suggests that savings contribute particularly valuable information when considered alongside other indicators of financial behavior. As a result, the positive association between savings and creditworthiness appears robust across different model specifications.

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

## 8. What would a bank do?

| Priority | Recommendation | Based On | Suggested Owner |
|----------|---------------|----------|-----------------|
| High | [Specific, actionable step] | [Insight it comes from] | [Who should act] |
| Medium | [Specific, actionable step] | [Insight it comes from] | [Who should act] |
| Low | [Exploratory or longer-term suggestion] | [Insight it comes from] | [Who should act] |

---

## 9. Limitations

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



---

## 12. Author

**Nikola Richev**
Currently looking for a job as (Junior) Data Analyst/Scientist (Consultant).

- 🔗 You can find me on [LinkedIn](www.linkedin.com/in/nikola-richev-1347a6443)
- 💼 [CV]()

---

*Last updated: 02.11.2026*
