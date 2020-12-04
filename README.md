# Purpose

Twitch.tv is home to millions of internet communities, gamers, role-players, and athletes alike. With the emerging interest in live streaming on the internet, twitch has found itself being the largest online gaming streaming platform in history. A large proponent of twitch’s success on the internet is its live chat which gives its users the ability to interact with the broadcaster(streamer) in real-time using text and customized emojis, otherwise known to the community as emotes. These custom emotes are user-generated either by Twitch, Broadcasters, or Viewers. BetterTTV and FrankerFaceZ are important third-party features that allow these user-generated emotes to be used across Twitch. Furthermore, twitch chat and its interaction with the video characteristics of broadcasts have received no attention in live streaming literature since broadcasts can go well beyond five hours. This project aims to build upon recent work regarding emote based sentiment by including the depth of video and chat interactions by using the “Twitch Clip” tool. Twitch clips are user-generated “highlights” to capture important moments of the broadcast and commonly shared on platforms like YouTube and Reddit. Recently, twitch literature has begun characterizing twitch communities using twitch chat, viewership trends, and content but no known projects have used resources that exist outside of twitch to understand how twitch communities manifest and interact with one another. Studies that exist have predominantly used most viewed broadcasters with large communities to begin understanding twitch user behavior. It’s known that the size of communities on twitch plays a large role in how users behave in the chatroom. One way we can get insight into these differences between small and large communities is by analyzing reddit posts that feature “twitch clips”. One subreddit called LivestreamFails (LSF) is a dedicated subreddit where users share livestream and streamer related content. LSF is one way smaller streamers become noticed and is a platform that can be use to compare big and small communities. This analysis will investigate users, posts, and comments (sentiment and topic) on LSF while providing me with an intentional way of selecting clips to use. I also aim to understand how smaller streamers can become “noticed” on LSF and how to detect rising streamers via the subreddit. The results are expected to extend our understanding of twitch emotes while also qualitatively and quantitatively characterizing twitch communities to improve twitch stream recommendation systems. This analysis will benefit Twitch as a platform, and current or prospective Twitch broadcasters.


# Current stage : *idk* [publication found here](https://rpubs.com/mowgli/lsfandtwitch)
Left off with an emote2streamer network graph. 

![emote2streamer](https://i.imgur.com/qpSgow8.png)

Useful links

# Twitch chat
 - [Twitch Dev Reference](https://dev.twitch.tv/docs/api/reference#get-clips)
 - [Twitch Dowloader](https://github.com/lay295/TwitchDownloader)
   - Used to grab twitch chat from links
   - Full on app that can grab video too
   - Useful for twitch to youtube content with chat
   
 Great paper on emote sentiment. 
 -[Twitch emote sentiment for top 100 emotes on most popular streamers](https://github.com/konstantinkobs/emote-controlled)
 
 All .csv files are tracked using git lfs. This is my first time using it, so if you intend to clone this repo, please makesure you download it. Since some files are quite large. Feel free to download the html render of the document to view code used in this project. 
 
 This project leverages R, Python, Bigquery and the Pushshift dataset. 
