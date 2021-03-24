library(KoNLP)
useSejongDic()
library(tm)

library(wordcloud)
library(wordcloud2)

insta_word <- read.csv('instagram.csv')
insta_word 

############## txt
# txt 자체를 corpus로
txt.corpus <- VCorpus(VectorSource(insta_word$txt))
txt.corpus[[120]]$content
getTransformations()

#공백 제거 및 불용어 제거
mystopwords <- readLines("data/stopwords_ko.txt", encoding="UTF-8")
txt.corpus <- tm_map(txt.corpus, stripWhitespace)
txt.corpus <- tm_map(txt.corpus, removePunctuation)
txt.corpus <- tm_map(txt.corpus, removeNumbers)
txt.corpus <- tm_map(txt.corpus, removeWords, stopwords('en'))
txt.corpus <- tm_map(txt.corpus, removeWords, mystopwords)
inspect(txt.corpus)
View(txt.corpus)

# 스테밍
install.packages("SnowballC")
library(SnowballC)

txt.corpus1 <- tm_map(txt.corpus, stemDocument)

# tdm 만들기
txt.tdm <- TermDocumentMatrix(txt.corpus1)
str(txt.tdm)
dim(txt.tdm)

# dtm 만들기
txt.dtm <- DocumentTermMatrix(txt.corpus1)
str(txt.dtm)

# 단어 빈도 확인
txt.freq <- apply(txt.dtm[,], 2, sum)
str(txt.tdm)

# 높은 빈도순으로 정렬
txt.freq.sort <- sort(txt.freq, decreasing = T)
txt.freq.sort[1200:1300]



############## reply
# reply 자체를 corpus로
reply.corpus <- VCorpus(VectorSource(insta_word$reply))
reply.corpus[[4]]$content
getTransformations()

#공백 제거 및 불용어 제거
mystopwords <- readLines("data/stopwords_ko.txt", encoding="UTF-8")
reply.corpus <- tm_map(reply.corpus, stripWhitespace)
reply.corpus <- tm_map(reply.corpus, removePunctuation)
reply.corpus <- tm_map(reply.corpus, removeNumbers)
reply.corpus <- tm_map(reply.corpus, removeWords, stopwords('en'))
reply.corpus <- tm_map(reply.corpus, removeWords, mystopwords)
View(reply.corpus)

# 스테밍
reply.corpus1 <- tm_map(reply.corpus, stemDocument)
inspect(reply.corpus1[[4]])

# tdm 만들기
reply.tdm <- TermDocumentMatrix(reply.corpus1)
str(reply.tdm)

# dtm 만들기
reply.dtm <- DocumentTermMatrix(reply.corpus1)
str(reply.dtm)

# 단어 빈도 확인
reply.freq <- apply(reply.dtm[,], 2, sum)

# 높은 빈도순으로 정렬
reply.freq.sort <- sort(reply.freq, decreasing = T)
reply.freq.sort[300:400]




############## rereply
# rereply 자체를 corpus로
rereply.corpus <- VCorpus(VectorSource(insta_word$rereply))
rereply.corpus[[3]]$content
getTransformations()

#공백 제거 및 불용어 제거
mystopwords <- readLines("data/stopwords_ko.txt", encoding="UTF-8")
rereply.corpus <- tm_map(rereply.corpus, stripWhitespace)
rereply.corpus <- tm_map(rereply.corpus, removePunctuation)
rereply.corpus <- tm_map(rereply.corpus, removeNumbers)
rereply.corpus <- tm_map(rereply.corpus, removeWords, stopwords('en'))
rereply.corpus <- tm_map(rereply.corpus, removeWords, mystopwords)
View(rereply.corpus)

# 스테밍
rereply.corpus1 <- tm_map(rereply.corpus, stemDocument)
inspect(rereply.corpus1[[3]])

# tdm 만들기
rereply.tdm <- TermDocumentMatrix(rereply.corpus1)
str(rereply.tdm)

# dtm 만들기
rereply.dtm <- DocumentTermMatrix(rereply.corpus1)
str(rereply.dtm)

# 단어 빈도 확인
rereply.freq <- apply(rereply.dtm[,], 2, sum)

# 높은 빈도순으로 정렬
rereply.freq.sort <- sort(rereply.freq, decreasing = T)
rereply.freq.sort[1:100]



#############네이버 검색량과의 상관분석
searchdata <- read.csv('searchdata.csv', header = T, encoding = 'UTF-8')
head(searchdata)
cor(searchdata$X.U.FEFF.num, searchdata$pc)
cor(searchdata$X.U.FEFF.num, searchdata$mobile)
cor(searchdata$X.U.FEFF.num, searchdata$pc_mobile)
cor.test(searchdata$X.U.FEFF.num, searchdata$pc_mobile)







################ 안해도 됨(텍스트마이닝 - 장바구니분석(연관분석))
# txt.tdm 의 전치행렬
trans_txt.tdm <- as.matrix(txt.tdm, "transaction")
str(trans_txt.tdm)

install.packages("arules")
library(arules)



# tdm에서 사용 빈도가 20개 이상인 단어
findFreqTerms(txt.tdm, 20)


# 연관분석
rules.all <- apriori(trans_txt.tdm, parameter = list(supp=0.5, conf=0.5))

rules_conf <- sort (rules.all, by="confidence", decreasing=TRUE)
inspect(rules_conf)


rules_conf


# txt 단어 추출(워드클라우드 만들기)
#txt_word <- extractNoun(insta_word$txt)
#txt_word2 <- unlist(txt_word)


#undata2 <- Filter(function(x) {nchar(x) >= 2}, txt_word2)
#View(undata2)

#txt_word3 <- table(undata2)
#wordcloud2(txt_word3, size = 1)
#View(txt_word3)

#################
