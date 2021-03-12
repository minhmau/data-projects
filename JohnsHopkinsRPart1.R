#Week 1
x <- c(-1, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19)
#by position
x[4] # fourth element
x[-4] # all but fourth element
x[2:4] # elements 2 to 4
x[-(2:4)] # all elements except 2 to 4
x[c(1,5)] # element one and five

#by value
x[x==10] 
x[x<0]
x[x %in% c(10, 12, 15)] # elements in the set 2, 4, 7

#function
add <- function(x,y){
  x+y
}

add(2,3)

add_and_multiply <- function(x,y){
  add <- x+y
  multiply <- x*y
  addmultiply <- c(add, multiply)
  return(addmultiply)
}

add_and_multiply(3,5)

subtract_and_divide<- function(x,y){
  x-y
  x/y
}

subtract_and_divide(4,8)

#other built in functions
v <- c(2,2,1,3,5)
sort(v)
rev(v)
table(v) #show frequency for each value
unique(v)
length(v) #how many values are there

#create data fast
seq(1,5)
seq(1,9, by=2)

#dataframe (data table stored in the R environment)

var1 <- c(1,2,3,4,5)
var2 <- c(6,7,8,9,10)

data.frame(var1, var2)

dat <- data.frame("height"=var1, "weight"=var2)
dat[1,]

home <- c("computer","calculator","scanner")
office <- c("paper","pens","pencils")

inventory <- data.frame(home,office)


#get more information about the data
dim(dat)
str(dat)
nrow(dat)
ncol(dat)
head(dat)
tail(dat)


with_missing <- c(1,2,4,NA)
sum(with_missing)
sum(with_missing, na.rm=TRUE)

dat2 <- data.frame("var1"=400:499,"var2"=500:599)
alldat<- cbind(dat, dat2)

#importing data
getwd()
#setwd(#path)
#sample <- read.csv(#path)
#write.csv(sample, #path)

#visualization

numbers <- c(1,2,31,24,34,543,5,34,123,4,5,6)

hist(numbers)
boxplot(numbers)

numbers2 <- c(21,4,5,7,2131,3,4,6,7,8,4,4,8)
boxplot(numbers, numbers2)

#bivarite statistics

#rnorm - normal dist
#rpois - poisson
#rbinom -binomial
#runif - uniform

var1 <- runif(50, 0, 100)
var2 <- runif(50, 2, 200)

dat <- data.frame(var1, var2)
plot(dat$var1, dat$var2)
plot(dat$var1, dat$var2,
     main="PLOT",
     xlab = "Variable 1",
     ylab = "Variable 2",
     ylim = c(0,150), xlim = c(0, 150))

#WEEK 2
library(tidyverse)
sample <- read_csv("Desktop/D1LYDGZLRAmS2AxmSxQJHw_244a6af25c32479990d299bf82de1a67_cces_sample_coursera.csv")
#this is tidyverse command and it's different from read.csv
# read_csv produces tibble rather than a dataframe

vignette("tibble")

cces_data <- as.data.frame(sample)
cces_tibble <- as_tibble(cces_data)

sample_data <- drop_na(sample)

women <- filter(sample_data, gender==2)

dim(sample_data)

republican_women <- filter(sample_data, gender==2 & pid7 >4)
dim(republican_women)

select(republican_women, "educ", "employ") #choose educ column and employ column

republican_women_educ_emply <- sample_data %>% filter(gender==2 & pid7 >4) %>% select("educ", "employ")
republican_women_educ_emply

#recode

party <- recode(sample_data$pid7, "1"="Democrat", "2"="Democrat","3"="Democrat", "4"="Independent", "5"="Republican","6"="Republican","7"="Republican")
sample_data$party <- party

#rename

test <- rename(sample_data, trump_approval=CC18_308a)
test$trump_approval
sample_data <- test

#reorder

sort_by_gender_and_party <- sample_data %>% arrange(gender, pid7)

sort_by_gender_and_party2 <- sample_data %>% arrange(gender, desc(pid7))

# grouping

group_gender_pid7 <- sample_data %>% group_by(gender, pid7)

summarise(sample_data, mean_pid7=mean(pid7), mean_faminc=mean(faminc_new))

group_by_gender <- sample_data %>% group_by(gender)

trial <- mutate(group_by_gender, trialcolumn=2)
trial$trialcolumn

### WEEK 3

#see r markdown


















