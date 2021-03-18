library(RSelenium)
library(rvest) #HTML처리
library(httr) #HTML처리
library(stringr) #문자열 함수

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

# '제주카페' 검색 페이지로 접속
remDr$navigate("https://www.instagram.com/explore/tags/%EC%A0%9C%EC%A3%BC%EC%B9%B4%ED%8E%98/")

###제주카페 검색 시 게시물들 페이지에서(최근 게시물)
#1행1열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(1)
#1행2열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(2)
#1행3열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(3)
#2행1열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(2) > div:nth-child(1)





##############

id <- NULL;txt <- NULL;date <- NULL;like <- NULL;reply <- NULL;rereply<-NULL;reply_css <- NULL;rereply_css <- NULL;like_css <- NULL;like_text <- NULL;video <- NULL;video_css <- NULL;
df <- NULL
df.insta <- NULL
for(i in 1:8){
  for(j in 1:3){
    boardcss <- paste0('#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(',i ,') > div:nth-child(',j ,') > a > div > div._9AhH0')
    board1 <- remDr$findElement(using = 'css', boardcss)
    board1$clickElement()
    Sys.sleep(2)
    # id
    id_css <- remDr$findElement(using='css selector','div.e1e1d > span > a')
    id_text <- id_css$getElementText()
    id <- c(id, unlist(id_text))
    Sys.sleep(2)
    
    # txt
    txt_css <- remDr$findElements(using='css selector','div.eo2As > div.EtaWk > ul > div > li > div > div > div.C4VMK > span')
    txt_text <- sapply(txt_css, function(x){x$getElementText()})
    if (length(txt_text) == 0){
      cat("no text ")
      txt_NA <- NA
      txt <- c(txt, unlist(txt_NA))
    }else{
      txt <- c(txt, unlist(txt_text))
      cat("is text ")
      Sys.sleep(2)
    }
  
    # date
    date_css <- remDr$findElements(using='css selector','div.C4VMK > div > div > time')
    date_text <- sapply(date_css, function(x) {x$getElementAttribute("title")})
    if (length(date_text) == 0){
      cat("no date ")
      date_NA <- NA
      date <- c(date, unlist(date_NA))
    }else{
      date <- c(date, unlist(date_text))
      cat("is date ")
      Sys.sleep(2)
    }
    
    # like (비디오가 아닐 경우 '조회수' 대신에 '좋아요'를 리턴)
    like_css <- remDr$findElements(using='css selector','section.EDfFK.ygqzn > div > div > a')
    like_text <- sapply(like_css, function(x){x$getElementText()})
    if (length(like_text) == 0){
      cat("no like ")
      like_NA <- NA
      like <- c(like, unlist(like_NA))
    }else{
      like <- c(like, unlist(like_text))
      cat("is like ")
      Sys.sleep(2)
    }
    
    # video (비디오일 경우 '좋아요' 대신에 '조회수'를 리턴)
    video_css <- remDr$findElements(using='css selector','section.EDfFK.ygqzn > div > span > span')
    video_text <- sapply(video_css, function(x){x$getElementText()})
    if (length(video_text) == 0){
      cat("no video ")
      video_NA <- NA
      video <- c(video, unlist(video_NA))
    }else{
      video <- c(video, unlist(video_text))
      cat("is video ")
      Sys.sleep(2)
    }
    
    # reply 
    reply_css <- remDr$findElements(using='css selector','ul:nth-child(2) > div > li > div > div.C7I1f > div.C4VMK > span')
    reply_text <- sapply(reply_css, function(x){x$getElementText()})
    if (length(reply_text) == 0){
      cat("no reply ")
      reply_NA <- NA
      reply <- c(reply, unlist(reply_NA))
    }else{
      reply <- c(reply, unlist(reply_text[1]))
      cat("is reply ")
      Sys.sleep(2)
    }
    
    # re-reply
    repbtn <- remDr$findElements(using='css selector', 'div.eo2As > div.EtaWk > ul > ul:nth-child(2) > li > ul > li > div > button')
    remDr$executeScript("arguments[0].click();",repbtn)
    
    rereply_css <- remDr$findElements(using='css selector', 'div.eo2As > div.EtaWk > ul > ul > li > ul > div > li > div > div.C7I1f > div.C4VMK > span')
    rereply_text <- sapply(rereply_css, function(x){x$getElementText()})
    if (length(rereply_text) == 0){
      cat("no re-reply ","\n")
      rereply_NA <- NA
      rereply <- c(rereply, unlist(rereply_NA))
    }else{
      rereply <- c(rereply, unlist(rereply_text[1]))
      cat("is re-reply ","\n")
      Sys.sleep(2)
    }

    # x 버튼
    xbtn <- remDr$findElement(using='css selector','div.Igw0E.IwRSH.eGOV_._4EzTm.BI4qX.qJPeX.fm1AK.TxciK.yiMZG > button')
    xbtn$clickElement()
    Sys.sleep(2)
  }
  df <- data.frame(id, txt, date, like, video, reply, rereply)
  insta <- rbind(df.insta, df)
}
View(insta)      



  
############## 스크롤
remDr$executeScript('window.scrollTo(0,500)')
remDr$executeScript('window.scrollTo(500,1000)')
remDr$executeScript('window.scrollTo(1000,1500)')
remDr$executeScript('window.scrollTo(1500,2000)')





##############
