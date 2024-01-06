# User Journey Analysis

### Introduction
From registering on the platform to making their first purchase, this project focuses on analyzing user journeys using a provided dataset. The dataset includes information and attributes about users and their interactions. The goal is to understand and visualize the user journeys on the platform. 

### SQL
The analysis starts with SQL queries to transform and aggregate the data. A series of Common Table Expressions (CTEs) are used to categorize pages into various sections, concatenate source and destination pages, and group the user journeys per session. The final SQL script retrieves relevant information such as user ID, session ID, first purchase date, subscription type, event date, and the aggregated user journey.

### Python Data Cleaning and Analysis
After obtaining the data using SQL, the project proceeds with data cleaning and analysis using Python and pandas. The raw data is read into a pandas DataFrame, having unnecessary columns dropped, and a cleaned dataset is created. The analysis included calculating the total page counts, page presence in user journeys, average journey length, popular page sequences, and page follow-ups.

### And?
The analysis sheds light on basic insights regarding the page patterns that may influence users to subscribe to the educational platform. Examining the contribution of specific pages, identifying popular page sequences, and understanding page follow-ups provide a foundational understanding of user journey dynamics. 
