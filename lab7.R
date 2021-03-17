library(rvest)
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"

text <- read_html(url)
text

# <h1> 태그의 컨텐츠 
h1 <- html_nodes(text, "h1")
h1_con <- html_text(h1, trim=T)
h1_con

# <a> 태그의 href 속성값  
a <- html_nodes(text, "a")
a_href <- html_attr(a, 'href')

# <img> 태그의 src 속성값
img <- html_nodes(text, 'img')
img_src <- html_attr(img, 'src')

# 첫 번째 <h2> 태그의 컨텐츠
node1 <- html_nodes(text, "h2:nth-of-type(1)")
node1_con <- html_text(node1)
node1_con

# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠(???)
li <- html_nodes(text, 'ul>li[style$="green"]')
li
li_con <- html_text(li)
li_con

# 두 번째 <h2> 태그의 컨텐츠
node2 <- html_nodes(text, "h2:nth-of-type(2)")
node2_con <- html_text(node2)
node2_con

# <ol> 태그의 모든 자식 태그들의 컨텐츠 
ol <- html_nodes(text, 'ol')
ol
ol_li <- html_text(ol, trim=T)
ol_li <- gsub("[\r\n]", " ", ol_li)
ol_li
#정답
ol_child <- html_nodes(text,'ol>*')
ol_child_con <- html_text(ol_child)
ol_child_con

# <table> 태그의 모든 자손 태그들의 컨텐츠(???)
table <- html_nodes(text, 'table *')
table
table1 <- html_text(table)
table1

# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
table2 <- html_nodes(text, '.name')
table2
table3 <- html_text(table2, trim = T)
table3 

# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
table4 <- html_nodes(text, '#target')
table4
table5 <- html_text(table4, trim = T)
table5 
