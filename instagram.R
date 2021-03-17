library(RSelenium)
library(rvest) #HTML처리
library(httr) #HTML처리
library(stringr) #문자열 함수

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()


remDr$navigate("https://www.instagram.com/explore/tags/%EC%A0%9C%EC%A3%BC%EC%B9%B4%ED%8E%98/")

###제주카페 검색 시 게시물들 페이지에서
#1행1열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(1)
#1행2열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(2)
#1행3열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(3)
#2행1열
#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(2) > div:nth-child(1)

board1 <- remDr$findElement(using = 'css', '#react-root > section > main > article > div:nth-child(3) > div > div:nth-child(1) > div:nth-child(1)')
board1$clickElement()


#게시물 세부 정보 클릭 시, 본문 내용
body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > div.EtaWk > ul > div > li > div > div > div.C4VMK
body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > div.EtaWk > ul > div > li > div > div > div.C4VMK > span

content <- remDr$findElement(using = 'css', 'body > div._2dDPU.CkGkG > div.zZYga > div > article > div.eo2As > div.EtaWk > ul > div > li > div > div > div.C4VMK > span')
content$getElementText()


# 게시글 작성 시간 - 여기서 datetime만 추출이 가능할까?
# 게시글 작성 시간 추출할 필요가 있을까?
# <time class="FH9sR Nzb55" datetime="2021-03-17T06:00:08.000Z" title="2021년 3월 17일">11분</time>


# 중복? 
#  게시글 작성자(id)로만 구분할 것인가?
