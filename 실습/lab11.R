library(RSelenium)
library(rvest) #HTML처리
library(httr) #HTML처리
library(stringr)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("http://gs25.gsretail.com/gscvs/ko/products/event-goods")

twoplusone <- remDr$findElement(using = 'css', '#TWO_TO_ONE')
twoplusone$clickElement()

#마지막 페이지로 이동
lastpage <- remDr$findElement(using = 'css','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next2')
lastpage$clickElement()

#마지막 페이지에서 시작해서 하나씩 앞 페이지로 이동하는 방식을 취할 예정


#상품명
#twoonenamenodes <- remDr$findElements(using = 'css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
#twoonename <- sapply(twoonenamenodes, function (x) {x$getElementText()})
#is.list(twoonename)


#가격
#twoonepricenodes <- remDr$findElements(using = 'css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
#twooneprice <- sapply(twoonepricenodes, function (x) {x$getElementText()})

#상품명과 가격을 데이터프레임으로
#goods <- data.frame(goodsname = unlist(twoonename), goodsprice = unlist(twooneprice))


goods <- NULL
goodsname <- NULL
goodsprice <- NULL


repeat{
  twoonenamenodes <- remDr$findElements(using = 'css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  Sys.sleep(3)
  twoonename <- sapply(twoonenamenodes, function (x) {x$getElementText()})
  Sys.sleep(3)
  
  twoonepricenodes <- remDr$findElements(using = 'css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  Sys.sleep(3)
  twooneprice <- sapply(twoonepricenodes, function (x) {x$getElementText()})
  Sys.sleep(3)
  
  goodsname <- c(goodsname,unlist(twoonename))
  Sys.sleep(3)
  goodsprice <- c(goodsname,unlist(twooneprice))
  Sys.sleep(3)
  
  #현재 페이지
  pagenodes <- remDr$findElements(using = 'css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on')
  Sys.sleep(3)
  currentpage <- sapply(pagenodes, function(x) {x$getElementText()})
  Sys.sleep(2)
  
  #이전 페이지 클릭
  beforebtn <- remDr$findElement(using = 'css', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.prev')
  Sys.sleep(2)
  beforebtn$clickElement()
  Sys.sleep(2)
  
  #맨 앞까지 왔으면 멈추기
  if(currentpage =="1")  {
    break
  }
  Sys.sleep(2)
  
  goods <- data.frame(goodsname, goodsprice)
}
write.csv(goods,"output/gs25_twotoone.csv")

