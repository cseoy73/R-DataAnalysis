library(rvest)


site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
page <- NULL
comicName <- NULL;  comicSummary <- NULL; comicGrade <- NULL 
allreview <- NULL
for(i in 1:20){
  url <- paste(site, i, sep = "")
  text <- read_html(url,  encoding="UTF-8")
  for(index in 1:24){
    #웹툰 제목
    ctitle <- html_nodes(text, "tr > td > div.challengeInfo > h6 > a")
    title <- html_text(ctitle, trim=T)
    comicName <- c(comicName, title[index])
    #소제목
    csumm <- html_nodes(text, "tr > td > div.challengeInfo > div.summary")
    summ <- html_text(csumm, trim = T)
    comicSummary <- c(comicSummary, summ[index])
    #평점
    cgra <- html_nodes(text, "tr > td > div.challengeInfo > div.rating_type > strong")
    gra <- html_text(cgra, trim = T)
    comicGrade <- append(comicGrade, gra[index])
  }
  page <- data.frame(comicName, comicSummary, comicGrade)
  navercomic <- rbind(allreview, page)
}
write.csv(navercomic, "output/navercomic.csv")