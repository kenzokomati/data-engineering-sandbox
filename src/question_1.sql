-- Timestamp Formatting: For auditing purposes, we need a report of all sale dates. 
-- Can you list each date and format the exact event timestamp as 'Hour:Minute:Second'?

SELECT date_id, time(timestamp_utc) FROM dim_dates as time;