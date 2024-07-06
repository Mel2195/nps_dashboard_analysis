# nps_dashboard_analysis

SQL queries and analysis for creating a Net Promoter Score (NPS) dashboard. Uses FACT_NPS_Score, DIM_Date, and DIM_Customer datasets to provide insights into customer satisfaction trends and improvement areas. Helps CS leadership make data-driven decisions to enhance customer loyalty and address issues.

# NPS Dashboard Analysis 🚀

Welcome to the NPS Dashboard Analysis project! This repository contains SQL queries to analyze customer satisfaction using Net Promoter Score (NPS) data. The project leverages three key datasets: `FACT_NPS_Score`, `DIM_Date`, and `DIM_Customer`.

## Datasets Overview 📊

**`FACT_NPS_Score` Table** 📋
- **Key Fields:** `ID`, `CREATED_DATE`, `SCORE`, `DOMAIN`, `NPS`
- **Description:** Contains NPS scores for customer feedback.

**`DIM_Date` Table** 📅
- **Key Fields:** `DATE_ACTUAL`
- **Description:** Contains date information for linking with the `FACT_NPS_Score` table.

**`DIM_Customer` Table** 👥
- **Key Fields:** `NAME`, `TIER`, `CUSTOMER_SINCE`, `ARR`, `TEAM_SIZE`
- **Description:** Contains customer details including tier, annual recurring revenue (ARR), and team size.

