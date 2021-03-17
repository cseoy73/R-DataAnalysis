# 3월 15일 실습(?)
library(dplyr)
library(fmsb)

picher <- read.csv('data/picher_stats_2017.csv', encoding = 'UTF-8')
View(picher)

picher <- picher %>% 
  select('선수명', '삼진'='삼진.9', '볼넷'='볼넷.9', '홈런'='홈런.9')
picher
summary(picher)

picher_yang <- picher[3,-1]
rownames(picher_yang) <- '양현종'

picher_max <- c(22.5, 18, 9)
picher_min <- c(0, 0, 0)
ds <- rbind(picher_max, picher_min, picher_yang)


radarchart(ds,
           pcol='red',
           seg=4,  
           caxislabels=seq(0,100,25),
           title = paste(row.names(ds[3,])))