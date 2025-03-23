# assignment
Customer behaviour analysis 

Customer Behavior Analysis for ShopEasy
## 📌 Table of Contents  
1. [Project Overview](#project-overview)  
2. [Data Set overview](#data-sources)  
3. [Key Insights](#key-insights)  
4. [Business Recommendations](#business-recommendations)  
5. [Implementation Plan](#implementation-plan)  
6. [Future Enhancements](#future-enhancements)  


Project Overview

This project aims to analyze customer behavior on the ShopEasy platform using SQL and Python. The insights derived will help improve customer engagement, conversion rates, and marketing effectiveness.

1.Dataset Overview

The dataset consists of six CSV files, each containing structured data about customers, products, engagement, and reviews.

1. Customer Journey (customer_journey.csv)

Tracks customer interactions with the platform.

Columns: JourneyID, CustomerID, ProductID, VisitDate, Stage, Action, Duration


2. Customer Reviews (customer_reviews.csv)

Contains customer ratings and feedback on products.

Columns: ReviewID, CustomerID, ProductID, ReviewDate, Rating, ReviewText


3. Customers (customers.csv)

Includes customer demographics and location.

Columns: CustomerID, CustomerName, Email, Gender, Age, GeographyID


4. Engagement Data (engagement_data.csv)

Captures marketing and engagement metrics.

Columns: EngagementID, ContentID, ContentType, Likes, EngagementDate, Campaign, ProductID, ViewsClicksCombined


5. Geography (geography.csv)

Maps customer locations to countries and cities.

Columns: GeographyID, Country, City


6. Products (product.csv)

Contains product details such as category and price.

Columns: ProductID, ProductName, Category, Price

Key Analyses & Insights

Customer Journey Analysis

2.Identify drop-off points in the customer journey.

Track actions leading to successful conversions.

Calculate the average duration per stage to optimize engagement.

3.Sentiment Analysis on Customer Reviews

Extract and analyze customer sentiments using Natural Language Processing (NLP).

Identify highly rated vs. poorly rated products.

Correlate customer feedback with product performance.

4.Marketing Effectiveness Measurement

Calculate customer retention rate vs. churn rate.

Compare first-time vs. repeat buyers for strategic decision-making.

Identify the best-performing products by region to optimize marketing efforts.

------
Technologies Used
Database: MySQL

Programming Language: Python (pandas, MySQL-connector, SQLAlchemy)

Data Visualization: Matplotlib, Seaborn

Sentiment Analysis: NLTK, TextBlob

Development Tools: Jupyter Notebook, GitHub


1.How to Run This Project

Database Setup (SQL Execution)

Import the database into MySQL:

mysql -u root -p shopeasy < corrected.sql

2.Running the Jupyter Notebook

Open customer_behaviour_analysis.ipynb in Jupyter Notebook.

Run each cell step-by-step to visualize insights.
-----
Project Outcomes & Business Recommendations

Optimize customer journey by addressing drop-off points.

Improve marketing strategies based on engagement and purchase trends.

Enhance product offerings using sentiment insights from customer reviews
Here’s a structured way to present Solutions & Recommendations in your README.md file:


---
Customer Behavior Analysis: Recommendations & Solutions

Based on your data insights, here’s a structured breakdown of key findings, challenges, and business recommendations to improve customer engagement, conversions, and sales performance.
🔍 1. Customer Engagement Insights & Drop-offs
📌 Observations

✅ Customer Engagement by Content Type:

    Video content had the highest engagement (31), followed by Blogs (28) and Social Media (24).

    Newsletters had the lowest engagement (17).

✅ Drop-off Analysis at Checkout Stage:

    Products like Ski Boots and Volleyballs had the highest drop-off rates at checkout.

    Social Media and Video-based promotions were common sources before drop-offs.

✅ Page Interaction Rates:

    Homepage had the highest visits (54), followed by Product Pages (26), and Checkout (20).

    Customers spent an average of 182 seconds on Product Pages, 160 seconds on Homepage, and 150 seconds on Checkout.

✅ Customer Journey Drop-off Points:

    Checkout stage has the highest drop-off rate (14), followed by Product Page views (6).

    Only 6 customers moved from checkout to purchase, showing a low conversion rate.

✅ Business Recommendations & Solutions
🎯 Reduce Checkout Drop-offs & Improve Conversions

✔ Streamline the Checkout Process:

    Reduce unnecessary steps and auto-fill customer details to avoid friction.

    Offer guest checkout options to avoid mandatory sign-ups.

    Add multiple payment options and ensure mobile-friendliness.

✔ Address Abandoned Carts:

    Send automated reminders via email/SMS for incomplete purchases.

    Offer limited-time discounts or free shipping to encourage completion.

✔ Improve Social Media & Video Retargeting:

    Customers engaging via social media & video had high drop-offs—re-target them with personalized ads.

    Offer social proof (reviews, testimonials) in retargeted ads to boost trust.

🔍 2. Customer Segmentation & Retention
📌 Observations

✅ Returning Customers vs. First-Time Buyers:

    Only 19 customers were first-time buyers.

    Returning customers contributed more to purchases but at a slower growth rate.

✅ Country-Wise Purchase Insights:

    Spain had the highest sales, with Surfboards, Tennis Rackets, and Ski Boots performing well.

    Germany, Austria, and Belgium had diverse product purchases but in small quantities.

✅ Best-Selling Products by Country:

    Ski Boots sold in Spain, Austria, and Belgium.

    Boxing Gloves were popular in Austria, Belgium, and Germany.

    Surfboards had strong demand in Spain & the UK.

✅ Business Recommendations & Solutions
🎯 Improve Customer Retention & Repeat Purchases

✔ Loyalty & Rewards Programs:

    Introduce a points-based reward system for repeat customers.

    Offer exclusive discounts, early product access, and referral bonuses.

✔ Localized Marketing Strategy:

    Focus on Spain for Surfboards & Ski Boots sales expansion.

    Germany & Belgium show interest in diverse sports products—use targeted ads and bundles.

✔ Personalized Offers Based on Customer Behavior:

    Use purchase history to offer relevant product recommendations.

    Send automated discount emails to first-time buyers to encourage a second purchase.

🔍 3. Product Performance & Reviews
📌 Observations

✅ Highest-Rated Products:

    Football Helmet (5.0), Hockey Stick (4.4), Running Shoes (4.0), and Ski Boots (4.0) had top ratings.

✅ Products with Low Sentiment & Low Ratings:

    Basketball (2.66), Ice Skates (3.0), Dumbbells (3.0), and Boxing Gloves (2.0) received lower ratings.

    Negative sentiment for certain products indicates potential quality or pricing issues.

✅ Business Recommendations & Solutions
🎯 Improve Product Quality & Customer Satisfaction

✔ Analyze Negative Feedback Trends:

    Check common complaints in customer reviews (e.g., durability, comfort, price).

    Improve product descriptions & images to set clear expectations.

✔ Bundle High-Rated & Low-Rated Products Together:

    Example: Pair Football Helmets (high rating) with Basketballs (low rating) to boost sales.

    Offer free trials or discounts on low-rated products.

✔ Use High-Rated Products for Marketing Campaigns:

    Feature best-rated products prominently in ads, homepage banners, and email campaigns.

    Use customer testimonials in marketing materials.

🔍 4. Marketing & Content Strategy
📌 Observations

✅ Content Engagement Levels:

    Video & Blog content drive the most customer engagement.

    Social Media & Newsletters have lower engagement but still contribute to conversions.

✅ Estimated Sales from Content Sources:

    Social Media (228), Video (4881), Blog (231) show strong lead generation.

    Newsletters (522) are underperforming.

✅ B
usiness Recommendations & Solutions
🎯 Optimize Content for Better Engagement

✔ Increase Video-Based Promotions:

    Feature product demo videos, customer testimonials, and influencer collaborations.

    Use short-form video content on Instagram Reels & TikTok to boost engagement.

✔ Improve Blog & Newsletter Relevance:

    Write data-driven, how-to guides & sports training content to attract customers.

    Offer exclusive discounts in newsletters to increase conversions.

✔ A/B Test Social Media Strategies:

    Compare carousel ads, reels, influencer posts, and interactive polls.

    Monitor conversion rates and allocate budget accordingly.


📢 Final Takeaways & Implementation Steps
Priority	Action Plan	Expected Outcome
🟢 High	Streamline checkout & reduce drop-offs	Higher conversion rates
🟡 Medium	Implement personalized retention strategies	More repeat customers
🟢 High	Optimize content & marketing	Increased customer engagement
🟡 Medium	Improve low-rated product positioning	Better product trust & sales
