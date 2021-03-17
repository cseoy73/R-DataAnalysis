#문제8
iotest1 <- scan('data/iotest1.txt')
sortA <- sort(iotest1, decreasing = T)
sortD <- sort(iotest1)
sum <- sum(iotest1)
cat("오름차순 :",sortA,"\n","내림차순 :",sortD,"\n","합 :",sum)