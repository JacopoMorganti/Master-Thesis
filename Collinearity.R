library(DataCombine)
library(corrr)
library(qgraph)
library(usdm)

bankrupt = as.numeric(as.character(train$class))
n_missing = as.numeric(as.character(train$na_count))

train = select(train, -c(class, na_count))

train = cbind(train, bankrupt, n_missing)

train <- train[,1:64]

corMat <- cor(train, use = "pairwise.complete.obs")

Graph_pcor <- qgraph(corMat, graph = "pcor", layout = "spring", threshold = "bonferroni",
                     sampleSize = nrow(train), alpha = 0.01)

Vif_test=vif(train)

