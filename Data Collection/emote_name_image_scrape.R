library(pacman)
p_load(tidyverse,rvest,RSelenium,XML)

setwd("~/MSIA-19/Git/Reddit-and-Twitch/Data Collection")


########## FFZ EMOTES ################
# This will only grab the emote name and image link. 
# I could have grabbed the number of times it has been used. 

data = NULL
emote_name = NULL
emote_link = NULL

for(i in c(1:13)){
  url = "https://www.frankerfacez.com/emoticons/?q=&sort=count-desc&page="
  url = paste0(url,i)
  page = read_html(url)
  tabel = html_nodes(page,"table")
  for(i in c(1:50)){
    emote_name = c(emote_name,xml_attrs(xml_child(xml_child(xml_child(xml_child(tabel[[1]], 2), i), 3), 1))[["title"]])
    emote_link_temp <-xml_attrs(xml_child(xml_child(xml_child(xml_child(tabel[[1]], 2), i), 3), 1))[["srcset"]]%>% strsplit(",")
    emote_link_1x = emote_link_temp[[1]][1]
    emote_link_1x=substr(emote_link_1x,1,nchar(emote_link_1x)-3)
    emote_link<- c(emote_link,emote_link_1x)
  }
  Sys.sleep(10)
}
emote_data <- data.frame(emote_name,emote_link)

emote_data %>% write.csv("ffz_emotes.csv")

############################################



####### BTTV EMOTES ##########


rd <- rsDriver(port = 4453L,verbose = F, browser = c("chrome"),chromever="86.0.4240.22")
remDr <- rd$client
remDr$open()
remDr$setWindowSize(width = 800,height = 1800)
remDr$navigate("https://betterttv.com/emotes/top")

# Repeat loop to scroll 5 times - does eval at end rather than beginning. 

x = 0
repeat{
  x <- x+1
  remDr$executeScript("window.scrollTo(0,document.body.scrollHeight);")
  Sys.sleep(3)
  
  if (x > 4){
    break
  }
}



find_emote = remDr$findElements(using = 'css', '.EmoteCards_emoteCardCode__2Ro8G')
find_emote_image = remDr$findElements(using = 'css', '.EmoteCards_emoteCardImage__3AjVX')


emote_name = NULL

for(el in find_emote){
  emote_name_temp<-el$getElementText()[[1]]
  emote_name = c(emote_name,emote_name_temp)
}

emote_name %>% as.data.frame()

emote_image = NULL
for(el in find_emote_image){
  emote_image_temp = el$getElementAttribute('src')[[1]]
  emote_image = c(emote_image, emote_image_temp)
}

emote_image %>% as.data.frame()

bttv_emotes <- data.frame(emote_name,emote_image)
bttv_emotes %>% write.csv("bttv_emotes.csv")


remDr$close()
rd$server$stop()