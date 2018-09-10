#Breaking the wine data into a test set and a training set
library(caret)
library(tidyverse)

wine = read_csv("./data/wine.csv")
wine$id = rownames(wine)

wine_test = wine[sample(nrow(wine), 10), ]

#anti join

wine_train = wine %>%
  anti_join(wine_test)

#Removing the "answers"
wine_test = wine_test %>%
  select(-varietal)


write_csv(x = wine_train, path = "./data/wine_train.csv")
write_csv(x = wine_test, path = "./data/wine_test.csv")


