# 1
v1 <- c('Happy', 'Birthday', 'to', 'You')
length(v1)
nchar(v1)
sum(nchar(v1))


# 2
v2 <- paste(v1, collapse = " ")
v2
length(v2)
nchar(v2)


# 3
v3 <- c(1:10)
v4 <- paste(LETTERS[1:10], v3, sep = " ")
v4
v5 <- paste(LETTERS[1:10], v3, sep = "")
v5

#case 2
paste(LETTERS[1:10], 1:10)
paste0(LETTERS[1:10], 1:10)


#4
library(stringr)
v6 <- 'Good Morning'
v7 <- str_split(v6, " ")
v8 <- list()
v8[1] <- v7[[1]][1]
v8[2] <- v7[[1]][2] 
v8

#case 2
text1 <- 'Good Morning'
split_text1 <- strsplit(text1, split = " ")[[1]]
list(split_text1[1], split_text1[2])


# 5(???)
library(KoNLP)
add_words <- c("Panda", "That's", "gift")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

v9 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
  "That's why we call it the present – from kung fu Panda")
extractNoun(v9)
gsub("[[:punct:]]", "", v9)
extractNoun(gsub("[[:punct:]]", "", v9))

#5 정답
text2 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!",  
           "That's why we call it the present – from kung fu Panda")
# (text2 <- gsub("[[:punct:]]", "", text2))
#gsub("[,-]", "", text2)
text2 <- gsub("[,–]", "", text2)
(text2 <- gsub("\\s{2}", " ", text2))
splited_text2 <- unlist(strsplit(text2 , " "))
splited_text2



# 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
s1
# (1)
r1 <- gsub("[가-힣]","",s1)
r1
# (2)
r2 <- gsub("[[:punct:]]", "", s1)
r2
# (3) ??? 주의하기!
r3 <- gsub("[가-힣]|[[:punct:]]","",s1)
r3
# (4) 
r4 <- gsub("100","백",s1)
r4

# 7
hotel_data <- readLines("output/hotel.txt")
hotel_data

hotel_word <- extractNoun(hotel_data)
un_word <- unlist(hotel_word)
un_word
un_word <- gsub("[[:punct:]]", "", un_word)
un_word2 <- Filter(function(x) {nchar(x) >= 2}, un_word)
table_word <- table(un_word2)
final2 <- sort(table_word, decreasing = T)
final3 <- head(final2,10)

df1 <- data.frame(final3)
colnames(df1) <- c("wname", "wcount")

write.csv(df1, 'output/hotel_top_word.csv ')