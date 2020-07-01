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

## Results
- Unsurprisingly, California had the most robocalls per year from 2014 to 2019, with Texas being a distant second due to California's immense population.
- I tested whether 2019 had a higher **daily mean** number of robocalls than 2015. Although 2019's mean was observed to be greater, there was not enough evidence statistically that 2019 had a higher mean than 2015.
- I also tested whether 2019 saw a greater **proportion** of robocalls to wireless users than 2015. Surprisingly, 2019 had a smaller proportion than 2015.
- Using `LinearRegression`, I predicted the number of occurrences for each method (wired, wireless, Internet VOIP) up to 2024. The first one saw a downward trend, while the latter two saw an upward trend.
- Using FBProphet for prediction, however, wireless saw a downward trend, while Internet VOIP saw a dramatic upward trend.

## Limitations
With any dataset, you can have unlimited ways of delving into it and brainstorming potential questions looming over your head. However, the main thing that limited this is the amount of time.

Organizing and cleaning the dataset was troublesome, thus taking a lot of my time. Not only there were missing values, but also there were data, especially time-based values, that had inconsistent formatting and more peculiarly, seemingly out-of-range dates.

After I have done a bit exploring through my dataset, I thought I was ready to move on. Later, questions suddenly started flooding into my head. Some of the questions regarded:
- Trends regarding locations (state, city, zip)
- Predictions based off locations (area codes in phone numbers)
- Correlation between state population and methods of robocalls (although state populations was outside of what I had in my dataset)
Hopefully, I will address them using different methods if time does not become an issue in the future.

## Deliverables
I will provide the associated code (Jupyter notebooks), papers, and presentation.
