## Project Overview

**Context:** Data cleaning is a critical step in the data analysis process, as data quality issues can affect the reliability of subsequent analyses. To demonstrate common cleaning techniques, a purpose-built dataset containing several intentional errors was used. The dataset consists of transaction data collected in Iran during September 2025.

**Outcome:** Resolved key data quality issues including duplicates, missing values, inconsistent formatting, and non-unique identifiers. The final dataset was standardized, validated, and prepared for reliable exploratory and statistical analysis.

## Table of Contents

1. [General Information](#1-general-information)
2. [MySQL: Tables & Comments](#2-mysql-tables--comments)
3. [Python: Tables & Comments](#3-python-tables--comments)
4. [Key Insights](#4-key-insights)
5. [Mistakes & Future Enhancements](#5-mistakes--future-enhancements)
6. [Author](#6-author)
---

## 1. General Information

### Tools

| Category | Tool(s) Used |
|----------|-------------|
| Data Storage | CSV |
| Data Processing | MySQL, Python |

### Data Workflow

1. **Source:** Kaggle, [Iranian Transactions](https://www.kaggle.com/datasets/hosseinbadrnezhad/dirty-iranian-transactions-dataset)
2. **Cleaning:** As already mentioned, this dataset was made purposely "unclean" in order to simulate a real-world data cleaning process, which contains the following steps:
   1. Standardization issues (MasterCard vs Master Card, succeed vs success, teh@n vs Tehran)
   2. NULL values
   3. Duplicate transactions
   4. Non-unique ID field
   5. (Extreme outliers)
   6. (Negative transaction values)


### Data Model & Schema

#### Columns Overview (before)

| Index | Column Name | Data Type in MySQL | Data Type in Python | Description |  
|-------|-------------|--------------------|---------------------|-------------|
| 1 | `status` | text | ... | Indicates whether the transaction was a fail or a success. |
| 2 | `time` | text | ... | Date and time of the transaction. |
| 3 | `card_type` | text | ... | Type of the card used for the transaction. |
| 4 | `city` | text | ... | Location or where was the transaction made. |
| 5 | `amount` | double | ... | Amount of money (Iranian Rial) in the transaction. |
| 6 | `id` | int | ... | Non-unique transaction ID. |

#### Columns Overview (after)

| Index | Column Name | Data Type in MySQL | Data Type in Python | Description | 
|-------|-------------|--------------------|---------------------|-------------|
| 1 | `status` | text | ... | Indicates whether the transaction was a fail or a success. |
| 2 | `card_type` | text | ... | Type of the card used for the transaction. | 
| 3 | `city` | text | ... | Location or where was the transaction made. | 
| 4 | `amount` | decimal (15,2) | ... | Amount of money (Iranian Rial) in the transaction. | 
| 5 | `trans_date` | date | ... | Date, when the transaction was made. | 
| 6 | `trans_time` | time | ... | Time, when the transaction was made. | 
| 7 | `trans_id` | int | ... | Unique ID for each transaction, allowing future joins with other datasets. | 

**Row count:** 10.000 rows (raw data); 9.974 rows (cleaned data), 26 duplicated rows in total

**Comment:**

---

## 2. MySQL: Tables & Comments 

...

---

## 3. Python: Tables & Comments

...

---

## 4. Key Insights

**Insight 1:**

**Insight 2:**

---

## 5. Mistakes & Future Enhancements

...

---

## 6. Author

**Nikola Richev**

Currently looking for a job as (Junior) Data Analyst/Scientist (Consultant).

- 🔗 You can find me on [LinkedIn](www.linkedin.com/in/nikola-richev-1347a6443)

---

*Last updated: 16.11.2026*
