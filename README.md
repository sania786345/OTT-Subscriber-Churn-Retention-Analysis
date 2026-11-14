# 📺 OTT Subscriber Churn & Retention Analysis

## 📌 Project Overview

Why do OTT subscribers cancel their subscriptions, and which customer segments should a streaming business investigate to improve retention?

The **OTT Subscriber Churn & Retention Analysis** project is an end-to-end data analytics project developed using Python, MySQL, Excel, and Power BI.

The main objective of this project is to analyze subscriber behaviour, identify churn patterns, and understand which customer segments have higher cancellation rates.
Python was used for data preparation and exploratory data analysis, MySQL for database management and business queries, Excel for supporting data analysis, and Power BI for creating interactive dashboards.
This project focuses on converting raw subscriber data into meaningful business insights that can help an OTT platform understand customer churn and explore possible retention strategies.

**Note:** This is a Netflix-themed OTT case study using sample data. It is not an official analysis and does not use confidential Netflix or ZEE5 data.

## 🎯 Business Questions

- What is the overall subscriber churn rate?
- How does churn differ between Basic and Premium subscribers?
- Which payment methods have higher subscriber churn?
- How does subscriber viewing engagement relate to churn?
- Which device segments show higher churn?
- What is the estimated monthly subscription-fee value associated with churned subscribers?
- What business strategies could help improve subscriber retention?

## 🛠️ Tools & Technologies Used

| Tool | Purpose |
|---|---|
| Python | Data preparation and exploratory data analysis |
| Pandas | Data manipulation and transformation |
| NumPy | Numerical calculations |
| MySQL | Database creation, data storage, SQL queries, and business analysis |
| Excel | Supporting data review and analysis |
| Power BI | Interactive dashboards and data visualization |

## 🔄 Project Workflow

```text
OTT Subscriber Dataset
          ↓
Data Inspection & Preparation
          ↓
Python Exploratory Data Analysis
          ↓
MySQL Database & SQL Analysis
          ↓
Excel Data Review
          ↓
Power BI Dashboard Development
          ↓
Business Insights & Recommendations
```

## 📈 Key Findings

The analysis of **5,000 subscriber records** identified the following results:

| Metric | Finding |
|---|---:|
| Total Subscriber Records | 5,000 |
| Overall Churn Rate | 50.3% |
| Basic Plan Churn Rate | 61.83% |
| Premium Plan Churn Rate | 43.71% |

### Key Business Insights

- The Basic subscription plan has a higher churn rate compared to the Premium plan.
- Premium subscribers show a comparatively lower churn rate.
- Payment methods provide another dimension for understanding subscriber cancellation patterns.
- Viewing engagement can help investigate the relationship between subscriber activity and churn.
- Subscriber segmentation helps identify customer groups that may need retention-focused attention.

These findings represent patterns in the sample dataset and do not establish that any particular factor causes churn.

## 💡 Business Recommendations

Based on the analysis, an OTT business could consider the following recommendations:

1. **Focus on Basic Plan Subscribers:** Investigate pricing, subscription value, content preferences, and renewal behaviour to understand the higher churn rate.

2. **Improve Subscriber Engagement:** Explore personalised content recommendations and engagement campaigns for subscribers with lower viewing activity.

3. **Analyze Payment Methods:** Investigate payment failures, renewal issues, and payment-related cancellation patterns.

4. **Customer Retention Strategies:** Test targeted offers, renewal reminders, and personalised recommendations to encourage subscribers to continue their subscriptions.

5. **Monitor Churn Regularly:** Track churn across different subscription plans, payment methods, and customer segments over time.

6. **Understand Subscriber Behaviour:** Use viewing activity and subscription patterns to identify areas where further analysis could improve customer retention.

These recommendations are opportunities for further investigation and testing, not guaranteed solutions.

## ⚠️ Data Quality & Limitations

- The project uses sample data and should not be considered representative of all OTT subscribers.
- Ten records were identified with viewing times exceeding 24 hours per day. These records require validation before interpreting viewing behaviour.
- A single dataset snapshot may not be sufficient to understand long-term subscriber retention.
- The analysis identifies patterns and relationships but does not establish causation.
- Estimated monthly subscription-fee exposure is not necessarily equal to actual revenue lost.

Understanding these limitations is important for making reliable business decisions.

## 📁 Repository Structure

```text
OTT-Subscriber-Churn-Retention-Analysis/
│
├── Dashboards/
│   └── Dashboard screenshots
│
├── dataset/
│   └── OTT subscriber dataset
│
├── python-analysis/
│   └── Python analysis notebook
│
├── sql-analysis/
│   └── MySQL queries and analysis
│
└── README.md
```

## 🚀 How to Explore the Project

1. Open the `Dashboards/` folder to explore the Power BI dashboard screenshots.
2. Check the `python-analysis/` folder to understand the data preparation and exploratory analysis.
3. Explore the `sql-analysis/` folder to review MySQL queries and business analysis.
4. Visit the `dataset/` folder to access the sample subscriber dataset, if included.

## 📝 Conclusion

This project demonstrates an end-to-end data analytics approach to understanding OTT subscriber churn and retention patterns.

By combining Python, MySQL, Excel, and Power BI, the project transforms raw subscriber data into meaningful business insights through data preparation, SQL analysis, exploratory analysis, and interactive dashboards.

The analysis highlights important subscriber segments, identifies churn patterns, and provides recommendations that an OTT business could investigate to improve customer retention.

---

**Project Type:** End-to-End Data Analytics Project  
**Domain:** OTT / Media & Entertainment  
**Tools:** Python, Pandas, NumPy, MySQL, Excel, Power BI
