# 파일 읽기
ins <- read.csv('insta.csv')
View(ins)

# 첫번째 열 제거
ins <- ins[,-1]
View(ins)

# date열이 NA인 행제거
library(dplyr)

ins <- ins %>% 
  filter(!is.na(date))
View(ins)

# like에서 숫자만 남게끔
ins$like <- gsub(" ", "", ins$like)
ins$like <- gsub("[가-힣]", "", ins$like) 
View(ins)
str(ins$like)

#like를 숫자로
ins$like <- as.numeric(ins$like)
str(ins$like)
View(ins)

# video가 아닌데 like NA이면 like 숫자 0으로
for(i in 1:length(ins$like)){
  if(is.na(ins$like[i]) & is.na(ins$video[i]))
    ins$like[i] <- 0
}
View(ins)


# video 문자형를 숫자로
str(ins$video)
ins$video <- as.numeric(ins$video)
View(ins)

# like_video이라는 열(like+video) 추가
for(i in 1:length(ins$like)){
  if(is.na(ins$like[i]) & is.na(ins$video[i])){
    ins$like_video[i] = 0
  }else if(is.na(ins$like[i]) & !is.na(ins$video[i])){
    ins$like_video[i] = ins$video[i]
  }else if(!is.na(ins$like[i]) & is.na(ins$video[i])){
    ins$like_video[i] = ins$like[i]
  }else{
    ins$like_video[i] = ins$like[i] +ins$video[i]
  }
}

View(ins)
str(ins)


# ㅋㅔㅇㅣㅋㅡ 와 같은 분리된 텍스트 제거
ins$txt <- gsub("[ㄱ-ㅎㅏ-ㅣ]", "", ins$txt)
ins$reply <- gsub("[ㄱ-ㅎㅏ-ㅣ]", "", ins$reply)
ins$rereply <- gsub("[ㄱ-ㅎㅏ-ㅣ]", "", ins$rereply)
View(ins)


# < > 와 안에 있는 텍스트 제거
ins$txt <- gsub("[<].+[>]", "", ins$txt)
ins$reply <- gsub("[<].+[>]", "", ins$reply)
ins$rereply <- gsub("[<].+[>]", "", ins$rereply)
View(ins)


# 특수문자 제거
ins$txt <- gsub("[[:punct:]]", "", ins$txt)
ins$reply <- gsub("[[:punct:]]", "", ins$reply)
ins$rereply <- gsub("[[:punct:]]", "", ins$rereply)
View(ins)

# 숫자 제거
ins$txt <- gsub("[0-9]", "", ins$txt)
ins$reply <- gsub("[0-9]", "", ins$reply)
ins$rereply <- gsub("[0-9]", "", ins$rereply)
View(ins)

#영어 제거
ins$txt <- gsub("[a-zA-Z]", "", ins$txt)
ins$reply <- gsub("[a-zA-Z]", "", ins$reply)
ins$rereply <- gsub("[a-zA-Z]", "", ins$rereply)

# 두 칸 이상 공백 제거
ins$txt <- gsub("  ", "", ins$txt)
ins$reply <- gsub("  ", "", ins$reply)
ins$rereply <- gsub("  ", "", ins$rereply)
View(ins)

write.csv(ins, "instagram.csv")