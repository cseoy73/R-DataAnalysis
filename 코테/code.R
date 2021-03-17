df <- read.csv(
  './data/india-airquality.csv',
  encoding= "ISO-8859-1"
)
head(df)


df <- df[is.na(df[,9])==F,]


df$air_index <- NULL
for(i in 1:length(df$so2)){
  if(df$so2[i]> 158){
    df$air_index[i] = "Heavily Polluted"
  }else if(df$so2[i] > 80 & df$so2[i] <= 158){
    df$air_index[i] = "Moderately Polluted"
  }else if(df$so2[i] > 59 & df$so2[i] <= 80){
    df$air_index[i] = "Lightly Polluted"
  }else if(df$so2[i] > 38 & df$so2[i] <= 59){
    df$air_index[i] = "Slightly Polluted"
  }else if(df$so2[i] > 9.1 & df$so2[i] <= 38){
    df$air_index[i] = "Good"
  }else{df$air_index[i] = "Excellent"}
}

df$day = NULL
for(j in 1:length(df$date)){
  if(as.POSIXlt(df$date[j])$wday == 1){
    df$day[j] = "Monday"
  }else if(as.POSIXlt(df$date[j])$wday == 2){
    df$day[j] = "Tuesday"
  }else if(as.POSIXlt(df$date[j])$wday == 3){
    df$day[j] = "Wednesday"
  }else if(as.POSIXlt(df$date[j])$wday == 4){
    df$day[j] = "Thursday"
  }else if(as.POSIXlt(df$date[j])$wday == 5){
    df$day[j] = "Friday"
  }else if(as.POSIXlt(df$date[j])$wday == 6){
    df$day[j] = "Saturday"
  }else{
    df$day[j] = "Sunday"
  }
}


df <- table(df$air_index, df$day)
df <- t[c(1,2,6,4,5,3),c(2,6,7,5,1,3,4)]

write.csv(df, file='so2_of_day.csv')


install.packages("ggplot2")
library(ggplot2)
ggplot(df, aes(x=day, fill=air_index))



