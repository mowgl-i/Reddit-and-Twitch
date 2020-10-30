library(tidyverse)
library(bigrquery)



# Collecting data: https://delvinso.github.io/project/2018-12-01-topic-modeling-understand-r-toronto/


## Collecting Posts

project <- 'livestreamfail'

sql <- "
SELECT title, score, url, date(timestamp_seconds(created_utc)) AS date, domain, author, permalink

FROM `fh-bigquery.reddit_posts.20*`
WHERE _TABLE_SUFFIX > '16'
AND lower(subreddit) = 'livestreamfail'
AND score > 40
 
 "

bq_auth(email = "****")



# Billed: 132.32 GB
#Downloading 39,696 rows in 4 pages.
posts <- bq_project_query(project,sql, use_legacy_sql = F) %>%
  bq_table_download(.,max_results = Inf)



posts %>% write_csv("lsf_data.csv")


## Collecting Comments


project <- 'livestreamfail'

sql <- "
SELECT body, name, link_id, created_utc AS date, author, parent_id,score,id
FROM `fh-bigquery.reddit_comments.20*`
WHERE _TABLE_SUFFIX > '16'
AND lower(subreddit) = 'livestreamfail'
AND score >5
"

bq_auth(email = "***")



# Billed: 1.12 tb took 1 min to run. 
#Downloading 1,416,071 rows in 142 pages
comments <- bq_project_query(project,sql, use_legacy_sql = F) %>%
  bq_table_download(start_index = 1,max_results = Inf)



comments %>% write_csv("lsf_data_comments.csv")



