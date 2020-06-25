# Capstone Project #1: Rising Concerns of Robocalls in the U.S.
## Overview
This project focuses on (using the word loosely to refer to unsolicited calls) robocalls, a constant nuisance of a problem Americans face daily. While the federal government is constantly fighting against them, the robocalls remain a constant problem. This project seeks to find trends and forecast the number of robocalls we can expect.

**Note:** The data used for this project was too big for Github to save. Dataset link:
https://drive.google.com/drive/folders/16gxd5FJj1SByq6hlytnAp6W4uw7MR6pf?usp=sharing
After that, put the folder into the "Python code" folder in the "Capstone Project 1" folder.

## Target Audience
- The FCC
- Phone users throughout America

## Data
I obtained data from the FCC site and from the Kaggle site. I had to determine which dataset was better to use with Python. Eventually, I decided to use the one from the FCC database site, due to the wider date range, where the dataset is updated daily:
FCC: https://opendata.fcc.gov/Consumer/CGB-Consumer-Complaints-Data/3xyp-aqkj
Kaggle: https://www.kaggle.com/fcc/robocall-complaints

The data contains over 1.5 million rows containing information dating from late-2014 to April 2020 (the time I obtained the data). Each row contains many columns of information such as the timestamp a complaint has been issued, descriptions of the complaint (form, method, issue), and location (city, state, zip code).

## Approach
1. Use the Python's Pandas library to explore each dataset and help choose which dataset to use.
2. Filter data to Phone complaints only
3. Filter out rows with many missing values and out-of-range timestamps (limit to years 2014-2020)
4. Data Visualizations using Pandas and Matplotlib
5. Use scikit-learn's `LinearRegression` to create linear models on data grouped by methods and aggregated YEARLY, MONTHLY, and WEEKLY
6. Use the linear models for each method to create linear forecasts up to the year 2024
7. Use FBProphet API to create forcasting plots for MONTHLY and WEEKLY aggregated plots
8. Compare results from #6 and #7
9. Provide recommendations on how to improve future analysis
