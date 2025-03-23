USE shopeasy;
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Gender ENUM('Male', 'Female', 'Other'),
    Age INT,
    GeographyID INT,
    FOREIGN KEY (GeographyID) REFERENCES geography(GeographyID)
);
CREATE TABLE customer_journey (
    JourneyID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    VisitDate DATE,
    Stage VARCHAR(50),
    Action VARCHAR(255),
    Duration INT,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES product(ProductID)
);
CREATE TABLE geography (
    GeographyID INT PRIMARY KEY,
    Country VARCHAR(100),
    City VARCHAR(100)
);
CREATE TABLE product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);
CREATE TABLE engagement_data (
    EngagementID INT PRIMARY KEY,
    ContentID INT,
    ContentType VARCHAR(50),
    Likes INT,
    EngagementDate DATE,
    Campaign VARCHAR(100),
    ProductID INT,
    ViewsClicksCombined INT,
    FOREIGN KEY (ProductID) REFERENCES product(ProductID)
);
CREATE TABLE customer_reviews (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    ReviewDate DATE,
    Rating DECIMAL(2,1),
    ReviewText TEXT,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES product(ProductID)
);
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\engagement_data.csv'
INTO TABLE engagement_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
TRUNCATE TABLE engagement_data;
ALTER TABLE engagement_data AUTO_INCREMENT = 1;


SHOW VARIABLES LIKE "secure_file_priv";
SELECT * FROM customer_journey LIMIT 5;
SELECT * FROM customer_reviews LIMIT 5;
SELECT * FROM engagement_data LIMIT 5;
SELECT * FROM geography LIMIT 5;
SELECT * FROM product LIMIT 5;
SELECT 'customer_journey' AS TableName, COUNT(*) AS RowCount FROM customer_journey  
UNION  
SELECT 'customer_reviews', COUNT(*) FROM customer_reviews  
UNION  
SELECT 'customers', COUNT(*) FROM customers  
UNION  
SELECT 'engagement_data', COUNT(*) FROM engagement_data  
UNION  
SELECT 'geography', COUNT(*) FROM geography  
UNION  
SELECT 'product', COUNT(*) FROM product;
COMMIT;
SET GLOBAL local_infile = 1;
SELECT COUNT(*) FROM engagement_data;
USE shopeasy;
SELECT * FROM engagement_data LIMIT 5;

SELECT COUNT(*) FROM customers;

SELECT COUNT(DISTINCT ProductID) FROM product;

SELECT ContentType, COUNT(*) AS TotalEngagements
FROM engagement_data
GROUP BY ContentType
ORDER BY TotalEngagements DESC;

SELECT cj.CustomerID, cj.ProductID, p.ProductName, cj.Stage, cj.Action, 
       cj.Duration, ed.ContentType, ed.ViewsClicksCombined
FROM customer_journey cj
LEFT JOIN product p ON cj.ProductID = p.ProductID
LEFT JOIN engagement_data ed ON cj.ProductID = ed.ProductID
LIMIT 10;
SELECT Stage, COUNT(*) AS DropOffs 
FROM customer_journey 
GROUP BY Stage
ORDER BY DropOffs DESC;
SELECT Stage, AVG(Duration) AS Avg_Duration 
FROM customer_journey 
GROUP BY Stage;
SELECT COUNT(DISTINCT CustomerID) AS Returning_Customers,
       (COUNT(DISTINCT CustomerID) * 100.0 / (SELECT COUNT(DISTINCT CustomerID) FROM customer_journey)) AS RetentionRate
FROM customer_journey
WHERE Stage = 'Checkout';
SELECT DISTINCT Stage FROM customer_journey;
SELECT g.Country, p.ProductName, COUNT(*) AS EstimatedSales
FROM customer_journey cj
JOIN product p ON cj.ProductID = p.ProductID
JOIN customers c ON cj.CustomerID = c.CustomerID
JOIN geography g ON c.GeographyID = g.GeographyID
WHERE cj.Stage = 'Checkout'
GROUP BY g.Country, p.ProductName
ORDER BY EstimatedSales DESC;
SELECT Stage, Action, COUNT(*) AS Frequency
FROM customer_journey
WHERE CustomerID IN (
    SELECT DISTINCT CustomerID FROM customer_journey WHERE Stage = 'Checkout'
)
GROUP BY Stage, Action
ORDER BY Frequency DESC;
SELECT p.ProductName, AVG(cr.Rating) AS Avg_Rating, COUNT(cr.ReviewID) AS Review_Count
FROM customer_reviews cr
JOIN product p ON cr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Avg_Rating DESC;
SELECT p.ProductName, cr.Sentiment_Label, COUNT(*) AS Count
FROM customer_reviews cr
JOIN product p ON cr.ProductID = p.ProductID
GROUP BY p.ProductName, cr.Sentiment_Label
ORDER BY p.ProductName, Count DESC;
SELECT 
    CASE 
        WHEN PurchaseCount > 1 THEN 'Repeat Buyer' 
        ELSE 'First-Time Buyer' 
    END AS BuyerType,
    COUNT(DISTINCT CustomerID) AS CustomerCount
FROM (
    SELECT CustomerID, COUNT(DISTINCT Stage) AS PurchaseCount
    FROM customer_journey
    WHERE Stage = 'Checkout'
    GROUP BY CustomerID
) sub
GROUP BY BuyerType;
SELECT g.Country, p.ProductName, COUNT(*) AS Sales
FROM customer_journey cj
JOIN customers c ON cj.CustomerID = c.CustomerID
JOIN geography g ON c.GeographyID = g.GeographyID
JOIN product p ON cj.ProductID = p.ProductID
WHERE cj.Stage = 'Checkout'
GROUP BY g.Country, p.ProductName
ORDER BY g.Country, Sales DESC;  


