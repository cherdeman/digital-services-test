# Digital Services Technical Test 
# Claire Herdeman
# Due: April 9, 2018


##### SQL Questions #####

# Question 1:

SELECT sum(pageviews) AS num_views
FROM ga_session_views
WHERE hit_timestamp > DATE_SUB(NOW(), INTERVAL 7 DAYS);

# Question 2:

SELECT count(*) as cnt
FROM ga_session_features
WHERE medium = 'organic';

# Question 3:

SELECT node_id, sum(pageviews) AS num_views
FROM ga_session_views JOIN ga_session_features ON session_id
WHERE medium = 'organic' AND hit_timestamp > DATE_SUB(NOW(), INTERVAL 30 DAYS)
GROUP BY node_id
ORDER BY num_views DESC;

# Question 4:

/*
This query finds the number of page views by device category in the past 7 days,
sorted from most to least pageviews
*/

SELECT device_category, sum(pageviews) AS num_views
FROM ga_session_views JOIN ga_session_features ON session_id
GROUP BY device_category
WHERE hit_timestamp > DATE_SUB(NOW(), INTERVAL 7 DAYS)
ORDER BY num_views DESC;

