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
    front_interactions;

SELECT 
    visitor_id,
    session_id,
    event_date,
    CONCAT(event_source_page,
            '-',
            event_destination_page) as part_user_journey
FROM
    (SELECT 
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
        front_interactions) a
;

select 
	visitor_id, 
    session_id, 
    event_date,
    group_concat(part_user_journey order by session_id separator '-') as user_journey
from (SELECT 
    visitor_id,
    session_id,
    event_date,
    CONCAT(event_source_page,
            '-',
            event_destination_page) as part_user_journey
FROM
    (SELECT 
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
        front_interactions) a
) b
group by session_id;














