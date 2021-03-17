library(ggplot2)
library(dplyr)

# 1-1
mpg %>% str

# 1-2
mpg %>% nrow
mpg %>% ncol

# 1-3
mpg %>% head(10)

# 1-4
mpg %>% tail(10)

# 1-5
mpg %>% View

# 1-6(?)
mpg %>% summary

# 1-7
mpg %>% 
  group_by(manufacturer) %>% 
  count

# 1-8
mpg %>% 
  group_by(manufacturer, model) %>% 
  count


# 2-1
mpgnew <- mpg %>% 
  rename(city = cty, highway = hwy)

# 2-2
mpgnew %>% head


# 3-1
midwest %>% as.data.frame %>% str

# 3-2
midwest <- midwest %>% 
  rename(total = poptotal, asian = popasian)

# 3-3
midwest <- midwest %>% 
  mutate(percentage = asian/total*100)

# 3-4
midwest %>% 
  mutate(size = ifelse(percentage > mean(percentage), 'large', 'small'))


# 4-1(?)
head(mpg)
mpg %>% 
  mutate(classification = ifelse(displ <= 4, '4 이하', '5 이상')) %>% 
  group_by(classification) %>% 
  summarise(mean_hwy = mean(hwy))

# 4-2
mpg %>% 
  filter(manufacturer == 'audi' | manufacturer == 'toyota') %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty))

# 4-3
mpg %>% 
  filter(manufacturer == 'chevrolet' | manufacturer == 'ford' | manufacturer == 'fonda') %>% 
  summarise(mean_hwy = mean(hwy))


# 5-1
mpg_new <- mpg %>% 
  select(class, cty)

head(mpg_new)

# 5-2
mpg_new %>% 
  filter(class == 'suv' | class == 'compact') %>% 
  group_by(class) %>% 
  summarise(max_cty = max(cty)) %>% 
  arrange(desc(max_cty))

# 6
mpg %>% 
  filter(manufacturer == 'audi') %>% 
  arrange(desc(hwy)) %>% 
  head(5)






