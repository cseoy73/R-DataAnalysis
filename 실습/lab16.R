emp <- read.csv('data/emp.csv')
emp

# 1
emp %>% filter(job == 'MANAGER')

# 2
emp %>% select(empno | ename | sal)

# 3
emp %>% select(-empno)

# 4
emp %>% select(ename | sal)

# 5
emp %>% 
  group_by(job) %>% 
  tally()

# 6
emp %>% 
  filter(sal >= 1000 & sal <= 3000) %>% 
  select(ename | sal | empno)

# 7
emp %>% 
  filter(job != 'ANALYST') %>% 
  select(ename | job | sal)

# 8
emp %>% 
  filter(job == 'SALESMAN' | job == 'ANALYST') %>% 
  select(ename | job)

# 9
emp %>% 
  group_by(deptno) %>% 
  summarise(sum(sal))

# 10
emp %>% 
  arrange(sal)

# 11
emp %>% 
  arrange(sal) %>% 
  head(1)

# 12
emp %>% 
  rename(salary = sal, commrate = comm) -> empnew
empnew

# 13(?)
emp %>% 
  count(deptno) -> deptnum
max(deptnum)

# 14
emp %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(nchar(ename))

# 15
emp %>% 
  filter(comm != 'NA') %>% 
  count



