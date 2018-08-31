#Breaking the wine data into a test set and a training set
library(caret)
library(tidyverse)

wine = read_csv("./data/wine.csv")
split = createDataPartition(wine$varietal, p = 0.85, list = FALSE)

wine_train = wine[split,]
wine_test = wine[-split,]

write_csv(x = wine_train, path = "./data/wine_train.csv")
write_csv(x = wine_test, path = "./data/wine_test.csv")
