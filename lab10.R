library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

url<-'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url)


btns <- NULL
reple <- NULL
reple_v <- NULL


repeat{
  content <- remDr$findElements(using = "css selector", "div.review_ta.ng-scope > ul > li > div.review_desc > p")
  Sys.sleep(1)
  reple_v <- sapply(content, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  btns <- remDr$findElements(using='css',"div.review_ta.ng-scope > div.paginate > a.direction.next")
  remDr$executeScript("arguments[0].click();", btns)
  Sys.sleep(2)
  #curr_PageElem <- remDr$findElement(using='css','body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > span:nth-child(2) > a')
  #curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  #cat(paste(curr_PageOldNum, ':', curr_PageNewNum,'\n'))
  if(btns[[1]]$getElementAttribute("class") == "direction next disabled")  {
    cat("종료\n")
    break; 
  }
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"output/naverhotel.txt")

