# File Discriptions


## Twitch Related Files
LSF Juypter Notebook
 - Using PRAW to grab posts and links from r/Livestreamfail. 
 - Exported csv has roughly 1000 posts with twitch clip links -> october_clips_thr_20th.csv. 
 
Check if clip is available
 - R file using selenium to navigate and scrape twitch clips for data.   
 - Return if VOD is available / Not Available / or missing. 
 - Returns Clips views at time of scrape
 - Returns CSV of original data(october_clips...)  plus returned values -> Clipscrapev1.csv
 
 
## Reddit Related Files

Data Download
 - Using bigquery to pull pushshift reddit data. 
 - Returns CSV of lsf posts with score >  40 (billed 132gb, 39k rows) -> lsf_posts.csv
 - Returns CSV of lsf comments with score > 5 (billed 1.12tb, 1.4m rows) -> lsf_comments (currently ignored, large file)
