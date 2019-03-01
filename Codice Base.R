library(farff)
library(ggplot2)
library(dplyr)
library(mice)
library(VIM)
library(caTools)
setwd("C:/Users/Jacopo/Desktop/Tesi/Dataset")
data= readARFF("1year.arff")

data$na_count <- apply(is.na(data), 1, sum)

as.numeric(as.character(data$class))

data_01 <-filter(data, class == 1)
data_00 <-filter(data, class == 0)

set.seed(101) 
sample = sample.split(data_01, SplitRatio = .75)
train_01 = subset(data_01, sample == TRUE)
test_01  = subset(data_01, sample == FALSE)

sample = sample.split(data_00, SplitRatio = .75)
train_00 = subset(data_00, sample == TRUE)
test_00  = subset(data_00, sample == FALSE)

train = merge(train_00,train_01, all = TRUE)




