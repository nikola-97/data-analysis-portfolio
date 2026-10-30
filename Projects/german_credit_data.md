## Project Overview

**Context:** [The business, research, or personal situation that motivated this project.]

**Problem Statement:** Which demographic and financial characteristics influence credit risk severity?

**Approach:** [In 1–2 sentences - how did you tackle it?]

**Outcome:** [What did you produce or discover?]

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

- **Primary Objective:** Analyse to what extent demographic and financial factors predict whether a credit has low or high risk.
- **Secondary Objective 1:** Measure and compare the prediction quality based on a confusion matrix.
- **Secondary Objective 2:** Test significance with interaction terms of the significant variables from both regressions.
- **Secondary Objective 3:** Test Hypothesies.
---

## 2. Project Scope & Tools

### Scope

| Dimension | Details |
|-----------|---------|
| **In Scope** | [What is included - data sources, time periods, segments] |
| **Out of Scope** | Some variables like whether the customer has a telephone number, whether she is foreigner. Because most of the variables are categorical, I wanted to include only those that are much more likely to show significant results, with focus on the topic. Additionally, I had to be careful with the number of independent variables, because of multicollinearity. |
| **Time Period** | 26.10 - 30.10.2026 |
| **Granularity** | 1000 rows, where one row represents one customer |

### Tools & Technologies

| Category | Tool(s) Used |
|----------|-------------|
| Data Storage | CSV |
| Data Processing | Python |
| Analysis | pandas, numpy, scipy |
| Visualization | matplotlib |
| Version Control | [e.g., Git / GitHub] |
| Documentation | [e.g., Markdown, Notion] |

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

### Dataset / Table: `[name]`

| Index | Column Name | Data Type | Description | Categories |
|-------|-----|-----------|-------------|---------------|
| 1 | `status` | int64 | [What this field represents] | [Non-sensitive example] |
| 2 | `duration` | int64 | [What this field represents] | [Non-sensitive example] |
| 3 | `credit_history` | int64 | [What this field represents] | [Non-sensitive example] |
| 4 | `purpose` | int64 | [What this field represents] | [Non-sensitive example] |
| 5 | `amount` | int64 | [What this field represents] | [Non-sensitive example] |
| 6 | `savings` | int64 | [What this field represents] | [Non-sensitive example] |
| 7 | `employment_duration` | int64 | [What this field represents] | [Non-sensitive example] |
| 8 | `installment_rate` | int64 | [What this field represents] | [Non-sensitive example] |
| 9 | `personal_status_sex` | int64 | [What this field represents] | [Non-sensitive example] |
| 10 | `other_deptors` | int64 | [What this field represents] | [Non-sensitive example] |
| 11 | `present_residence` | int64 | [What this field represents] | [Non-sensitive example] |
| 12 | `property` | int64 | [What this field represents] | [Non-sensitive example] |
| 13 | `age` | int64 | [What this field represents] | [Non-sensitive example] |
| 14 | `other_installment_plans` | int64 | [What this field represents] | [Non-sensitive example] |
| 15 | `housing` | int64 | [What this field represents] | [Non-sensitive example] |
| 16 | `number_credits` | int64 | [What this field represents] | [Non-sensitive example] |
| 17 | `job` | int64 | [What this field represents] | [Non-sensitive example] |
| 18 | `people_liable` | int64 | [What this field represents] | [Non-sensitive example] |
| 19 | `telephone` | int64 | [What this field represents] | [Non-sensitive example] |
| 20 | `foreign_worker` | int64 | [What this field represents] | [Non-sensitive example] |
| 21 | `credit_risk` | int64 | [What this field represents] | [Non-sensitive example] |

**Row count:** 1000 rows | **Date range:** [Start] – [End]

---

## 5. Analysis & Metrics

### Analytical Approach

[Describe how you approached the analysis. Were you exploring patterns? Testing a hypothesis? Building and validating a pipeline? Be honest about your method - exploratory work is valid, just call it that.]

### Key Metrics Defined

| Metric | Plain-Language Definition | Why It Matters |
|--------|--------------------------|----------------|
| `[Metric 1]` | [What it measures, in one sentence] | [What decision or question it answers] |
| `[Metric 2]` | [What it measures, in one sentence] | [What decision or question it answers] |
| `[Metric 3]` | [What it measures, in one sentence] | [What decision or question it answers] |

### Methods Used

- [e.g., Descriptive statistics - distribution, central tendency, outlier detection]
- [e.g., Trend analysis across [time period]]
- [e.g., Segmentation / group comparison by [dimension]]
- [e.g., Correlation analysis between [variable A] and [variable B]]
- [e.g., Custom aggregation or transformation logic in [tool]]

---

## 6. Visualization

...

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

*Last updated: 30.10.2026*
