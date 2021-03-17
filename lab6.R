#문제1
countEvenOdd <- function(...){
  data <- c(...)
  n_even <- 0
  n_odd <- 0
  for(i in data){
    if(is.numeric(i)){
      if(i %% 2 == 0){
        n_even = n_even + 1
      }else if(i %%2 !=0){n_odd = n_odd +1}
    }else{return()}
  }
  return(list(even = n_even, odd = n_odd))
}
countEvenOdd(10,2,55,4,3,6)
countEvenOdd(TRUE, 30, 't')
countEvenOdd('t',20)

#매개변수 1개로 풀이
countEvenOdd1 <- function(vt){
  if(!is.vector(vt)||!is.numeric(vt))
    return()
  else{
    total <- length(vt)
    odd <- 0 
    for(i in 1:total){
      if(vt[i] %%2 != 0)
        odd <- odd + 1
    }
  }
  return(list(even = total - odd, odd = odd))
}

countEvenOdd1(c(1,4,3))
countEvenOdd1(c(1,2,3,4,5))



#문제2
vmSum <- function(...){
  data <- c(...)
  sum = 0
  if(is.vector(...)){
    for(i in data){
      if(is.numeric(i)){
        sum = sum + i
      }else{
        print("숫자 벡터를 전달하숑!")
        break
        sum = 0
      }
    }
  }else{return("벡터만 전달하숑!")}
  return(sum)
}

vmSum(c(3,6,32,1))
vmSum(c("t", TRUE, 30, 21))
vmSum(factor("t", "a", "a"))

#매개변수 1개로 풀이
vmSum1 <- function(vt){
  if(!is.vector(vt) || is.list(vt))
    return("벡터만 전달하숑!")
  else if(!is.numeric(vt)){
    print("숫자 벡터를 전달하숑!")
    return(0)
  }else
   return(sum(vt)) 
}

vmSum1(c(1,4,3))
vmSum1(c(1,2,3,4,5))
vmSum1(c(1,"가"))
vmSum1(c("가","1"))
vmSum1(data.frame(1,2,3))
vmSum1(list(1,2,3))



#문제3
vmSum2 <- function(...){
  data <- c(...)
  sum <- 0
  if(is.vector(...)){
    for(i in data){
      if(is.numeric(i)){
        sum = sum + i
      }else{
        warning("숫자 벡터를 전달하숑!")
        break
        sum = 0
      }
    }
  }else{stop("벡터만 전달하숑!")}
  return(sum)
}

vmSum2(c(3,6,32,1))
vmSum2(c("t", TRUE, 30, 21))
vmSum2(factor("t", "a", "a"))

#매개변수 1개로 풀이
vmSum3 <- function(vt){
  if(!is.vector(vt) || is.list(vt))
    stop("벡터만 전달하숑!!")
  else if(!is.numeric(vt)){
    warning("숫자 벡터를 전달하숑!")
    return(0)
  }else
    return(sum(vt))
}

vmSum3(c(1,4,3))
vmSum3(c(1,"가"))
vmSum3(data.frame(1,2,3))


#문제4(?????????????)
mySum <- function(vt){
  if(!is.vector(vt)||is.list(vt))
    stop("벡터만 처리 가능!!")
  else if(any(is.na(vt))){
    warning("NA를 최저값으로 변경하여 처리함!!")
    vt[is.na(vt)] <- min(vt, na.rm = T)
    total <- length(vt)
    odd <- 0
    for(i in 1:total){
      if(i %% 2 != 0)
        odd <- odd + vt[i]
    }
    return(list(oddSum = odd, evenSum = sum(vt)-odd))
  }else if(is.null(vt))
    return()
  else{
    total <- length(vt)
    odd <- 0
    for(i in 1:total){
      if(i %% 2 != 0)
        odd <- odd + vt[i]
    }
    return(list(oddSum = odd, evenSum = sum(vt)-odd))
  }
}

mySum(c(3,6,4,9,5,2,3,4,1))
mySum(c(4,2,5,NA,10))
mySum(NULL)

#문제5
myExpr <- function(x){
  data <- sample(1:45,6)
  if(is.function(x)){
    x(data)
  }else{
    stop("수행 안할꺼임!!")
  }
}


myExpr(countEvenOdd)
myExpr(vmSum)
myExpr(vmSum2)


#문제6
createVector1 <- function(...){
  data <- c(...)
  if(is.null(data)){
    return()
  }else if(any(is.na(data))){
    return(NA)
  }else{as.vector(data)}
}

createVector1()
createVector1(NA, 3, 2)
createVector1("t", 3, TRUE)
createVector1(3,5)


#문제7
createVector2 <- function(...){
  data <- list(...)
  vec1 <- c()
  vec2 <- c()
  vec3 <- c()
  if(is.null(data)){
    return()
  }else{
    for(i in data){
      if(is.numeric(i)){
        vec1 <- append(vec1, i)
      }else if(is.character(i)){
        vec2 <- append(vec2, i)
      }else if(is.logical(i)){
        vec3 <- append(vec3, i)
      }
    }
    return(list(vec1, vec2, vec3))
  }
}

createVector2()
createVector2(3,2, FALSE)
createVector2(3,"t",FALSE,6,TRUE,"3","a")

#간단한 방법
createVector3 <- function(...){
  p <- list(...)
  if(is.null(p))
    return()
  else
    return(p)
}