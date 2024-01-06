SELECT 
    user_id,
    MIN(date_purchased) AS first_purchase_date,
    CASE purchase_type
        WHEN 0 THEN 'Monthly'
        WHEN 1 THEN 'Quarterly'
        ELSE 'Annualy'
    END AS subscription_type
FROM
    student_purchases
WHERE
    purchase_price <> 0
-- grouping by the user id is essential to avoid retrieving the earliest date from the whole data set as one group
GROUP BY user_id 
HAVING first_purchase_date BETWEEN '2023-01-01' AND '2023-03-30'
    ;

