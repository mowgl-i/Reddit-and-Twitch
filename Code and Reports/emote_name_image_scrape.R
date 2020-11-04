library(pacman)
p_load(tidyverse,rvest,RSelenium)

rd <- rsDriver(port = 4453L,verbose = F, browser = c("chrome"),chromever="86.0.4240.111")
remDr <- rd$client
remDr$open()

remDr$navigate("https://www.frankerfacez.com/emoticons/?q=&sort=count-desc&page=1")

emotes <- remDr$findElement(using = 'css', '.text-left > a')


test<-emotes$getElementText()

test

library(XML)


doc <- htmlParse(remDr$getPageSource()[[1]])

tabel<-readHTMLTable(doc)

library(tidyverse)
dataframe <- as.data.frame(tabel)


dataframe$NULL.V1 # this got me the table but this is for one page? need to removed the \ and keep what is on the left side. 

# would rather collect from the table myself. and scrpe 20 pages. also could use a for loop where  i = seq(1:20) or something. 
# while im at it, i should scrape the images????



