#문제1
L1 <- list(
  name = "scott",
  sal = 3000
)
L1
result1 <- L1[["sal"]] * 2
result1

#문제2
L2 <- list(
  "scott",
  c(100, 200, 300)
)
L2

#문제3
L3 <- list(c(3,5,7), c("A","B","C"))
L3[[2]][1] <- "Alpha"
L3

#문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]] <- L4[[1]] +10
L4

#문제5
emp <- read.csv('data/emp.csv')
L5 <- list(
  data1 = LETTERS,
  data2 = head(emp,3),
  data3 = L4
)
L5

L5[[1]][1]
L5[[2]]$ename
L5[[3]]$gamma

#문제6
L6 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
L6
mean(unlist(L6))

#문제7
grade <- sample(1:6,1)
if(grade == 1|grade == 2|grade == 3){
  cat(grade,"학년은 저학년입니다.")
}else{
    cat(grade,"학년은 고학년입니다.")
}

#문제8
choice <- sample(1:5,1)
if(choice == 1){
  result = 300+50
}else if(choice == 2){
  result = 300-50
}else if(choice == 3){
  result = 300*50
}else if(choice == 4){
  result = 300/50
}else{
  result = 300%%50
}
cat("결과값 :",result)

#문제9
count <- sample(3:10,1)
deco <- sample(1:3,1)

for(n in count){
  if(deco == 1){
    print(rep("*",n))
  }else if(deco == 2){
    print(rep("$",n))
  }else{print(rep("#",n))}
}

#문제10
score <- sample(0:100,1)
if(score>=90 & score <=100){
  level = "A 등급"
}else if(score>=80 & score<90){
  level = "B 등급"
}else if(score>=70 & score<80){
  level = "C 등급"
}else if(score>=60 & score<70){
  level = "D 등급"
}else if(score<60){
  level = "F 등급"
}
cat(score,"점은",level,"입니다.")

#문제11
alpha <- for(i in 1:24){cat(LETTERS[i],letters[i], sep = " ", "\t")}

#다른풀이
paste0(LETTERS,letters)
