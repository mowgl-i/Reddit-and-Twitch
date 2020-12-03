
During the data collection many streamers opted to delete VODS and clips due to the current DMCA climate on Twitch.
This interupped data collection and the end result was chat messages from 227 Clips. Also *lsf* is short for r/LivestreamFail. 

**All .csv files are stored using git lfs. I assume that you also need it installed if you plan to clone this repo.**

![ok..gotit](https://cdn.betterttv.net/emote/5e3026505ea23e51ed8c6617/3x)

# Ignore
pls ignore these things :)
 - emote photos
 - twitchapi.ipynb
 - xqc.png
 - dansgaming.png

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
 
if vod is available, then we can use [lay295's](https://github.com/lay295/TwitchDownloader) nifty twich downloader. 
 - It will grab video of VODs and Clips
 - It will grab chat of VODS and Clips
 
 
## Reddit Related Files

Data Download
 - Using bigquery to pull pushshift reddit data. 
 - Returns CSV of lsf posts with score >  40 (billed 132gb, 39k rows) -> lsf_posts.csv
 - Returns CSV of lsf comments with score > 5 (billed 1.12tb, 1.4m rows) -> lsf_comments (currently ignored, large file)
 
 
 ## Emote related files
 Scripts that scrape better twitch tv and frankerfacez. 
 - emote_name_image_scrape.R

# Exact file names and content
 - October_clips_thr_20th.csv = recent r/livestreamfail posts to follow and scrape
 - ClipscrapeV1.csv = scraped r/livestreamfail posts/twich clips which indentify which clips are scrape-able
 - chats.csv = scraped chat from clipscrapeV1.csv
 - corpus_data.csv  = chats.csv in corpus form
 - bttv_emotes.csv = emote information from *Better Twitch TV*. top 300~ ish emotes. 
 - ffz_emotes.csv = emote information from *FrankerfaceZ*. top 300~ ish emotes. 
 - lsf_data.csv = r/livestreamfail posts pulled from pushshift dataset 
 - lsf_data_comments = r/livestreamfail comments pulled from pushshift dataset 


