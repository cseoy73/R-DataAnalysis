library(tm)

fruit <- c("사과 포도 망고", 
           "포도 자몽 자두", 
           "복숭아 사과 포도", 
           "오렌지 바나나 복숭아", 
           "포도 바나나 망고", 
           "포도 귤 오렌지")

cps1 <- VCorpus(VectorSource(fruit))
tdm1 <- DocumentTermMatrix(cps1, control=list(wordLengths = c(1, Inf)))
tdm1
m1 <- as.matrix(tdm1)
rownames(m1) <- c('듀크', '둘리', '또치', '도우너', '길동', '희동')
m1

# (1)
library(proxy)

dist(m1, method = "cosine")
dist(m1, method = "Euclidean")
# (또치, 듀크), (길동, 듀크)

# (2)
min(colSums(m1))
# 포도

# (3)
# 귤, 자몽

