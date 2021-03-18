#문제1
exam1 <- function(){
  alpha <- for(i in 1:24){cat(LETTERS[i],letters[i], sep = " ", "\t")}
  return(alpha)
}
exam1()

#문제2
exam2 <- function(x){
  sum <- 0
  for(i in 1:x){
    sum <- sum + i
  }
  return(sum)
}
exam2(4)

#문제3
exam3 <- function(x,y){
  if(x>=y){result = x-y}
  else{result = y-x}
  return(result)
}
exam3(3,3)
exam3(8,2)
exam3(1,5)

#문제4
exam4 <- function(x,y,z){
  if(y == "+"){
    ans = x + z
  }else if(y == "-"){
    ans = x - z
  }else if(y == "*"){
    ans = x * z
  }else if(y == "%/%"){
    if(x == 0){ans = "오류1"}
    else if(z == 0){ans = "오류2"}
    else{ans = x %/% z}
  }else if(y == "%%"){
    if(x == 0){ans = "오류1"}
    else if(z == 0){ans = "오류2"}
    else{ans = x %% z}
  }else{
    ans = "규격의 연산자만 전달하세요"
  }
  return(ans)
}

exam4(3,"/",1)
exam4(3,"+",1)
exam4(3,"%/%",0)
exam4(0,"%%",1)

#문제5
exam5 <- function(x,y="#"){
  if(x<0){
    return(NULL)
  }else{
    print(rep(y, x)) 
  }
}
exam5(3)
exam5(6,"*")
exam5(-4,"/")

#문제6
exam6 <- function(...){
  data <- c(...)
  for(i in data){
    if(is.na(i)){
      print("NA는 처리불가")
      next
    }
    else if(i >= 85 & i <= 100){
      result = "상"
    }else if(i <= 84 & i >= 70){
      result = "중"
    }else{
      result = "하"
    }
    print(paste(i,"점은 ",result,"등급입니다."))
  }
}
exam6(80, 50, 70, 66, NA, 35)
