# 추가실습
View(mpg)

# 1
ggplot(mpg, aes(x=cty, y=hwy), ylim=c(0,50)) + geom_point(color='blue')
ggsave('output/result1.png')


# 2
ggplot(mpg, aes(x=class, fill=drv)) + geom_bar()


# 3
click_log <- read.table('data/product_click.log')
str(click_log)

ggplot(click_log, aes(x=V2, fill = V2)) + geom_bar()


# 4(?)
str(click_log$V1)
click_log$V1 <- substr(click_log$V1, 1, 8)
click_log$V1 <- as.Date(click_log$V1, format = '%Y%m%d')
click_log <- click_log %>% mutate(day = paste0(format(V1, '%a'),'요일'))
click_log
ggplot(click_log, aes(x=day, fill=day)) + geom_bar() + labs(x='요일', y='클릭수') + theme_light()


# 5
library(treemap)
data(GNI2014) 
View(GNI2014)
treemap(GNI2014, vSize = 'population', 
        index = c('continent', 'iso3'), 
        title = '전세계 인구 정보', 
        border.col = 'green',
        fontfamily.title="maple")

# 6번은 없음!

library(dplyr)
# 7-1
mpg2 <- mpg
mpg2 <- mpg2 %>% 
  mutate(total = cty + hwy)

# 7-2
mpg2 <- mpg2 %>% 
  mutate(avg = total/2)

# 7-3
mpg2 %>% arrange(avg) %>% 
  head(3)

# 7-4
mpg %>% mutate(total = cty + hwy) %>% 
  mutate(avg = total/2) %>% 
  arrange(avg) %>% 
  head(3)


# 8-1
mpg %>% 
  group_by(class) %>% 
  summarise(cty_mean = mean(cty))

# 8-2
mpg %>% 
  group_by(class) %>% 
  summarise(cty_mean = mean(cty)) %>% 
  arrange(desc(cty_mean))

# 8-3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(hwy_mean = mean(hwy)) %>% 
  head(3)

# 8-4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == 'compact') %>% 
  count


# 9
fuel <- data.frame(fl = c('c', 'd', 'e', 'p', 'r'),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

# 9-1
mpg3 <- merge(mpg, fuel)
mpg3 %>% select(model, fl, price_fl) %>% 
  head(5)


# 10-1
head(midwest)
midwest %>% mutate(percentage1 = (total-popadults)/total*100)

# 10-2
midwest2 <- midwest %>% mutate(percentage1 = (total-popadults)/total*100) %>% 
  select(county, percentage1) %>% 
  head(5)

# 10-3(?)
View(midwest2)
count(midwest)
midwest2$classification <- NULL

for(i in range(1:437)){
  if(midwest2$percentage1[i] >= 40)
    {midwest2$classification[i] = 'large'}
  else if(midwest2$percentage1[i] >= 30 & midwest2$percentage1[i] < 40)
    {midwest2$classification[i] = 'middle'}
  else
    {midwest2$classification[i] = 'small'}
}
head(midwest2$classification)

midwest2 %>% group_by(classification) %>% 
  count

# 10-4
midwest %>% mutate(percentage3 = asian/total*100) %>% 
  select(state, county, percentage3) %>% 
  arrange(percentage3)


# 11-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), 'hwy'] <- NA

mpg %>% filter(is.na(drv)) %>% 
  count
mpg %>% filter(is.na(hwy)) %>% 
  count

# 11-2
mpg %>% filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean(hwy))


# 12-1
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), 'drv'] <- 'k'
mpg[c(29, 43, 129, 203), 'cty'] <- c(3, 4, 39, 42)
# 이상치 확인하기
table(mpg$drv)
# 이상치를 결측값으로
mpg$drv <- ifelse(mpg$drv %in% 'k', NA, mpg$drv)
table(mpg$drv)

# 12-2
boxplot(mpg$cty)
boxplot(mpg$cty)$stats 
# 9~26 벗어나면 결측처리
mpg$cty <- ifelse(mpg$cty > 26 | mpg$cty < 9, NA, mpg$cty)
boxplot(mpg$cty)

# 12-3
mpg %>% group_by(drv) %>% 
  summarise(mean(cty))