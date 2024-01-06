with
	urls as (
				SELECT 
    visitor_id,
    session_id,
    event_date,
    CASE
        WHEN event_source_url LIKE 'https://365datascience.com/' THEN 'Homepage'
        WHEN event_source_url LIKE 'https://365datascience.com/login/%' THEN 'Log in'
        WHEN event_source_url LIKE 'https://365datascience.com/signup/%' THEN 'Sign up'
        WHEN event_source_url LIKE 'https://365datascience.com/resources-center/%' THEN 'Resource center'
        WHEN event_source_url LIKE 'https://365datascience.com/courses/%' THEN 'Courses'
        WHEN event_source_url LIKE 'https://365datascience.com/career-tracks/%' THEN 'Career tracks'
        WHEN event_source_url LIKE 'https://365datascience.com/career-track-certificate/%' THEN 'Career track certificate'
        WHEN event_source_url LIKE 'https://365datascience.com/course-certificate/%' THEN 'Course certificate'
        WHEN event_source_url LIKE 'https://365datascience.com/success-stories/%' THEN 'Success stories'
        WHEN event_source_url LIKE 'https://365datascience.com/blog/%' THEN 'Blog'
        WHEN event_source_url LIKE 'https://365datascience.com/pricing/%' THEN 'Pricing'
        WHEN event_source_url LIKE 'https://365datascience.com/about-us/%' THEN 'About us'
        WHEN event_source_url LIKE 'https://365datascience.com/instructors/%' THEN 'Instructors'
        WHEN event_source_url LIKE 'https://365datascience.com/checkout/%coupon%' THEN 'Coupon'
        WHEN event_source_url LIKE 'https://365datascience.com/checkout/%' THEN 'Checkout'
        ELSE 'Other'
    END AS event_source_page,
    CASE
        WHEN event_destination_url LIKE 'https://365datascience.com/' THEN 'Homepage'
        WHEN event_destination_url LIKE 'https://365datascience.com/login/%' THEN 'Log in'
        WHEN event_destination_url LIKE 'https://365datascience.com/signup/%' THEN 'Sign up'
        WHEN event_destination_url LIKE 'https://365datascience.com/resources-center/%' THEN 'Resource center'
        WHEN event_destination_url LIKE 'https://365datascience.com/courses/%' THEN 'Courses'
        WHEN event_destination_url LIKE 'https://365datascience.com/career-tracks/%' THEN 'Career tracks'
        WHEN event_destination_url LIKE 'https://365datascience.com/career-track-certificate/%' THEN 'Career track certificate'
        WHEN event_destination_url LIKE 'https://365datascience.com/course-certificate/%' THEN 'Course certificate'
        WHEN event_destination_url LIKE 'https://365datascience.com/success-stories/%' THEN 'Success stories'
        WHEN event_destination_url LIKE 'https://365datascience.com/blog/%' THEN 'Blog'
        WHEN event_destination_url LIKE 'https://365datascience.com/pricing/%' THEN 'Pricing'
        WHEN event_destination_url LIKE 'https://365datascience.com/about-us/%' THEN 'About us'
        WHEN event_destination_url LIKE 'https://365datascience.com/instructors/%' THEN 'Instructors'
        WHEN event_destination_url LIKE 'https://365datascience.com/checkout/%coupon%' THEN 'Coupon'
        WHEN event_destination_url LIKE 'https://365datascience.com/checkout/%' THEN 'Checkout'
        ELSE 'Other'
    END AS event_destination_page
FROM
    front_interactions
    ), 
	urls_combined as(
    SELECT 
    visitor_id,
    session_id,
    event_date,
    CONCAT(event_source_page, '-', event_destination_page) as part_user_journey
	FROM urls
    ), 
    journey as( 
    select
    visitor_id, 
    session_id, 
    event_date,
    group_concat(part_user_journey order by session_id separator '-') as user_journey
    from urls_combined
    group by session_id)

SELECT 
    s.user_id,
    session_id,
	first_purchase_date,
    subscription_type,
    event_date, 
    user_journey
FROM
	journey j
    join front_visitors v on j.visitor_id = v.visitor_id
	join 
    (SELECT 
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
HAVING first_purchase_date BETWEEN '2023-01-01' AND '2023-03-30') 
		s on v.user_id = s.user_id
where event_date < first_purchase_date
order by s.user_id, session_id
;


   