library(rvest)
newstitle <- NULL; newspapername <- NULL 
url <- "http://media.daum.net/ranking/popular/"
text <- read_html(url,  encoding="UTF-8")
text


#mArticle > div.rank_news > ul.list_news2 > li:nth-child(1) > div.cont_thumb > strong > a
#mArticle > div.rank_news > ul.list_news2 > li:nth-child(1) > div.cont_thumb > strong > span

for(i in 1:50){
  #뉴스 제목
  ntitle <- html_nodes(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", i,") > div.cont_thumb > strong > a"))
  title <- html_text(ntitle)
  newstitle[i] <- title
  #신문사 명칭
  nname <- html_nodes(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", i,") > div.cont_thumb > strong > span"))
  name <- html_text(nname)
  newspapername[i] <- name
}
newstitle
newspapername

page <- data.frame(newstitle, newspapername)
write.csv(page, 'output/news_ranking.csv')




#신문사 명칭