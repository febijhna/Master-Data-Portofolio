
-- Data preprocessing
-- checking missing value
SELECT *
FROM customer
WHERE 
    customerid IS NULL OR 
    gender IS NULL OR
    age IS NULL OR
    "Marital Status" IS NULL OR 
    "Marital Status" = '' OR 
    income IS NULL OR 
    income = '';

-- remove missing value
DELETE FROM customer
WHERE 
    customerid IS NULL OR 
    gender IS NULL OR 
    age IS NULL OR 
    "Marital Status" IS NULL OR 
    "Marital Status" = '' OR 
    income IS NULL OR 
    income = '';

-- EDA
-- AVERAGE AGE BY GENDER
SELECT 
    gender,
    AVG(age) AS average_age
FROM 
    customer
GROUP BY 
    gender;

-- AVERAGE AGE BY MARITAL STATUS
SELECT
    "Marital Status",  -- Menggunakan tanda kutip ganda untuk kolom dengan spasi
    AVG(age) AS average_age
FROM 
    customer
GROUP BY
    "Marital Status";  -- Menggunakan tanda kutip ganda untuk pengelompokan

-- store with max qty
SELECT 
    s.storename, 
    SUM(t.qty) AS total_quantity
FROM 
    store s
JOIN 
    transaction t ON s.storeid = t.storeid
GROUP BY 
    s.storename
ORDER BY 
    total_quantity DESC
LIMIT 1;

-- product with max amount
SELECT
    p."Product Name",
    SUM(t.totalamount) AS total_amount
FROM
    product p
JOIN
    transaction t ON p.productid = t.productid
GROUP BY
    p."Product Name"
ORDER BY
    total_amount DESC
LIMIT 1;
