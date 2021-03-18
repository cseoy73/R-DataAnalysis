# 1

productlog <- read.table('data/product_click.log', header = F)
table(productlog)
colSums(table(productlog))

library(showtext)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")
font_families()

barplot(colSums(table(productlog)), main = '세로바 실습',
        xlab = '상품ID',
        ylab = '클릭수',
        col = terrain.colors(10),
        col.main = 'red',
        font.main=4, 
        family="dog", 
        cex.main=3
       )             # cex : 크기 설정

dev.copy(png,"output/clicklog1.png")
dev.off()

time1 <- NULL



# 2(어려움)
productlog <- read.table('data/product_click.log', header = F)
data3 <- productlog$V1
data3_hour <- substr(data3, 9, 10)
table_data3 <- table(data3_hour)
length(table_data3)

names(table_data3)

piecename <- paste(as.integer(names(table_data3)),'~', as.integer(names(table_data3))+1, sep = "")
names(table_data3) <- piecename

pie(table_data3,
    main = '파이그래프 실습',
    col.main = 'blue',
    )



# 3 (어려움)
grade <- read.table('data/성적.txt', header = T)
grade
grade2 <- grade[,3:5]
boxplot(grade2,
        col = c('red', 'green', 'blue'),
        ylim=c(2,10))
title(main="과목별 성적 분포", col.main="orange", font.main=4, family="maple", cex.main=3)




# 4
grade
grade3 <- grade[,3:5]
rownames(grade3) <- grade[,2]
grade3 <- as.matrix(grade3)

barplot(t(grade3),
        main = '학생별 점수',
        col = rainbow(3),
        legend.text = c('국어, 수학, 영어'))



