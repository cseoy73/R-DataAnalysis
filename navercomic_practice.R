library(rvest)

site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
page <- NULL
vsummary <- NULL
vpoint <- NULL
comic.allreview <- NULL
for(i in 1:20){
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="UTF-8")
  for(index in 1:24){
    #웹툰 제목
    node <- html_node(text, paste0("#content > div:nth-child(5) > table > tbody > tr:nth-child(", index,") > td:nth-child(1) > div.challengeInfo > h6 > a"))
    title <- html_text(node, trim = T)
    vtitle[index] <- title
    #summary
    node <- html_node(text, paste0("#content > div:nth-child(5) > table > tbody > tr:nth-child(", index,") > td:nth-child(1) > div.challengeInfo > div.summary"))
    summary1 <- html_text(node, trim = T)
    vsummary[index] <- summary1
    #웹툰 평점
    node <- html_node(text, paste0("#content > div:nth-child(5) > table > tbody > tr:nth-child(", index,") > td:nth-child(1) > div.challengeInfo > div.rating_type > strong"))
    point <- html_text(node, trim = T)
    vpoint[index] <- point
  }
  page <- data.frame(vtitle, vsummary, vpoint)
}
write.csv(page, "output/a.csv")









site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
page <- NULL
vsummary <- NULL
vpoint <- NULL
comic.allreview <- NULL
for(i in 1:20){
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="UTF-8")
  for(index in 1:24){
    #웹툰 제목
    node <- html_node(text, paste0("tr:nth-child(", index,") > td > div.challengeInfo > h6 > a"))
    title <- html_text(node, trim = T)
    vtitle[index] <- title
    #summary
    node <- html_node(text, paste0("#content > div:nth-child(5) > table > tbody > tr:nth-child(", index,") > td:nth-child(1) > div.challengeInfo > div.summary"))
    summary1 <- html_text(node, trim = T)
    vsummary[index] <- summary1
    #웹툰 평점
    node <- html_node(text, paste0("#content > div:nth-child(5) > table > tbody > tr:nth-child(", index,") > td:nth-child(1) > div.challengeInfo > div.rating_type > strong"))
    point <- html_text(node, trim = T)
    vpoint[index] <- point
  }
  page <- data.frame(vtitle, vsummary, vpoint)
}
write.csv(page, "output/a.csv")



#여기

summary <-NULL
comicName <- NULL;  comicSummary <- NULL; comicGrade <- NULL 
page <- NULL
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
navercomic <- NULL
url <- NULL
for(i in 1:20){
  url[i] <- paste(site, i, sep = "")
  text <- read_html(url[i],  encoding="UTF-8")
  for(index in 1:24){
    #웹툰 제목
    cname <- html_nodes(text, "h6 > a")
    name <- html_text(cname, trim=T)
    comicName <- name
    #summary
    csummary <- html_nodes(text, "div.summary")
    comicSummary <- html_text(csummary, trim=T)
    # comicSummary <- c(summary, comicSummary)
    #별점
    cgrade <- html_nodes(text, "div.rating_type > strong")
    grade <- html_text(cgrade)
    ggrade = grade[4]
    comicGrade <- c(comicGrade, ggrade)
  }
  page <- data.frame(comicName, comicSummary, comicGrade)
  naver.comic <- rbind(navercomic, page)
}
View(page)

write.csv(naver.comic, "output/navercomic.csv")



##연습
site <- "https://comic.naver.com/genre/bestChallenge.nhn?="
text <- read_html(site,  encoding="UTF-8")
text

#웹툰 제목
ctitle <- NULL
ctitle <- html_nodes(text, "tr > td > div.challengeInfo > h6 > a")
ctitle
title <- html_text(ctitle, trim=T)
title

#소제목
csumm <- NULL
csumm <- html_nodes(text, "tr > td > div.challengeInfo > div.summary")
csumm
summ <- html_text(csumm, trim = T)
summ

#평점
cgra <- NULL
cgra <- html_nodes(text, "tr > td > div.challengeInfo > div.rating_type > strong")
cgra
gra <- html_text(cgra, trim = T)
gra





#웹툰 제목
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div.challengeInfo > h6 > a
#content > div:nth-child(5) > table > tbody > tr:nth-child(2) > td:nth-child(1) > div.challengeInfo > h6 > a
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(3) > div.challengeInfo > h6 > a
#content > div:nth-child(5) > table > tbody > tr:nth-child(2) > td:nth-child(5) > div.challengeInfo > h6 > a
#content > div:nth-child(5) > table > tbody > tr:nth-child(3) > td:nth-child(5) > div.challengeInfo > h6 > a
#content > div:nth-child(5) > table > tbody > tr:nth-child(3) > td:nth-child(3) > div.challengeInfo > h6 > a
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div.challengeInfo > h6 > a

#summary
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div.challengeInfo > div.summary
#content > div:nth-child(5) > table > tbody > tr:nth-child(2) > td:nth-child(1) > div.challengeInfo > div.summary
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div.challengeInfo > div.summary

#별점
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div.challengeInfo > div.rating_type > strong
#content > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1) > div.challengeInfo > div.rating_type > strong
#content > div:nth-child(5) > table > tbody > tr:nth-child(2) > td:nth-child(1) > div.challengeInfo > div.rating_type

comicName <- NULL;  comicSummary <- NULL; comicGrade <- NULL 
page <- NULL
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
navercomic <- NULL
url <- NULL
for(i in 1:20){
  url <- paste(site, i, sep = "")
  text <- read_html(url,  encoding="UTF-8")
  for(index in 1:24){
    #웹툰 제목
    cname <- html_nodes(text, "h6 > a")
    name <- html_text(cname, trim=T)
    comicName[i] <- name
    #summary
    csummary <- html_nodes(text, "div.summary")
    summary <- html_text(csummary, trim=T)
    comicSummary[i] <- summary
    #별점
    cgrade <- html_nodes(text, "strong")
    grade <- html_text(cgrade)
    comicGrade[i] <- grade
  }
  #page <- data.frame(comicName, comicSummary, comicGrade)
  #naver.comic <- rbind(navercomic, page)
}
write.csv(naver.comic, "output/navercomic.csv")


page[2]
View(page)

rm(a3)
a3 <- NULL
for(j in 1:20){
  a3[j] <- paste("+", j, sep = "")
}
a3


site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
for(i in 1:20){
  url[i] <- paste(site, i, sep = "")}



site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.allreview <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")}



for(i in 1:8)
  for(j in 1:3){
    print(1:(i*j))
  }



site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
page <- NULL
comicName <- NULL;  comicSummary <- NULL; comicGrade <- NULL 
allreview <- NULL
for(i in 1:20){
  index <- 1:24
  url <- paste(site, i, sep = "")
  text <- read_html(url,  encoding="UTF-8")
  for(j in 1:8)
    for(k in 1:3){
      
      ctitle <- html_nodes(text, paste0("tr:nth-child(",i,") > td:nth-child(",j,") > div.challengeInfo > h6 > a"))
      title <- html_text(ctitle)
      comicName[index] <- title
    }
}



# 영화 예제
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
page <- NULL
vtitle <- NULL; vpoint <- NULL; vreview <- NULL
movie.allreview <- NULL
for(i in 1:3) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  for (index in 1:10) {
    # 영화제목
    #node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
    #title <- html_text(node)
    #vtitle[index] <- title
    # 영화평점
    #node11 <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
    #point <- html_text(node11)
    #vpoint <- c(vpoint, point)
    # 영화리뷰 
    node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
    node <- html_text(node, trim=TRUE)
    print(node)
    review = node[4] # 질문!!
    vreview <- append(vreview, review)
  }
  page <- data.frame(vtitle, vpoint, vreview)
  movie.review <- rbind(movie.allreview, page)
}
View(page)
View(movie.review)

