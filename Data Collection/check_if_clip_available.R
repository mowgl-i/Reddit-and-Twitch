library(pacman)
p_load(tidyverse,rvest,RSelenium)
lsf_october <- read_csv("October_clips_thr_20th.csv")

only_clips <- lsf_october %>% arrange(desc(`Post Score`)) %>% select(`Post Title`,`Post Score`,`Created UTC`,url,domain,`Post Author`) %>% filter(domain == "clips.twitch.tv") 


clip_views <- c()
clip_vod <-c()

rd <- rsDriver(port = 4453L,verbose = F, browser = c("chrome"),chromever="86.0.4240.22")
remDr <- rd$client
remDr$open()
len = length(lsf_october$url)
pb = winProgressBar(title = "Begin Loop",min = 0, max = len)
j=0 # progress counter
for(i in only_clips$url){
  # Navigate to site
  j = j+1
  remDr$navigate(i)
  Sys.sleep(3)
  remDr$refresh() # This refresh helps with "clips that aren't available)
  Sys.sleep(5)
  
  is_clip_alb <- remDr$findElement(using = "xpath",'//*[@id="root"]')
  
  is_clip_alb<-tryCatch({is_clip_alb$getElementAttribute("data-a-page-loaded-name")[[1]]},
                        warning = function(w){is_clip_alb <- "video missing"},
                        error = function(e){is_clip_alb <-"video missing"})
  
  if(is_clip_alb == "ClipsViewPage"){
    Video_Avlb<-tryCatch({Video_Avlb<-remDr$findElement(using ="css",'.tw-inline-block .tw-core-button--primary .tw-flex-grow-0 .tw-flex-grow-0')
    Video_Avlb<-Video_Avlb$getElementText()
    Video_Avlb<-Video_Avlb[[1]][1]},
    warning = function(w){Video_Avlb <- "video missing"},
    error = function(e){Video_Avlb <-"video missing"})
    #finally ={return(clip_vod)})
    clip_vod=c(clip_vod,Video_Avlb)
    Sys.sleep(3)
    Views <- remDr$findElement(using = "xpath", '//*[@id="root"]/div/div/div/div[3]/div/div/main/div/div/div[2]/div[2]/div[2]/div/div/div/div[3]/div/div/div[1]/div[1]/span')
    Views<-Views$getElementText()
    
    Sys.sleep(3)
    
    clip_views=c(clip_views,Views[[1]][1])
    
  } else{
    
    clip_vod=c(clip_vod,"clip missing")
    clip_views=c(clip_views,"clip missing")
  }
  
  
  
  Sys.sleep(0.1) 
  setWinProgressBar(pb, j, title=paste('Progress', j, "out of", len , "done:", round(j/len)*100),"%" )
  
}
# "https://clips.twitch.tv//FamousCoweringMacaroniHeyGirl"
# This clip broke it because it has 2 shashes. Gotta check the links..

# captured 2222 clip things. 
# there is a strange delay of about 15 clips. 
# maby I need t tryCatch everything...........
remDr$close()
rd$server$stop()



clip_views<-as.data.frame(clip_views,stringsAsFactors = F)
clip_vod <- as.data.frame(clip_vod, stringsAsFactors = F)
clips_2222 <- clips_2019[1:2222,]
Clip_and_Twitch_oct <- bind_cols(only_clips,clip_views,clip_vod)
write.csv(Clip_and_Twitch_oct,"ClipscrapeV1.csv")