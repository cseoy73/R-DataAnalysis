library(wordcloud2)

yes1 <- readLines('output/yes24.txt', encoding = 'UTF-8')
#(1)
yes2 <- unlist(extractNoun(yes1))

#(2)
yes3 <- gsub("[^가-힣]","", yes2)

#(3)
yes4 <- Filter(function(x){nchar(x) >=2 & nchar(x) <=4}, yes3)

#(4)
yes5 <- table(yes4)

#(5)
yes6 <- sort(yes5, decreasing = T)

#(6)
result <- wordcloud2(yes6, fontFamily = "휴먼옛체")

#(7)
htmltools::save_html(result,"output/yes24.html")
