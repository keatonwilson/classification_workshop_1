#Breaking the wine data into a test set and a training set
library(caret)
library(tidyverse)

wine = read_csv("./data/wine.csv")
wine$id = rownames(wine)

set.seed(0)
wine_test = wine[sample(nrow(wine), 10), ]

#anti join

wine_train = wine %>%
  anti_join(wine_test)

#Removing the "answers"
wine_test = wine_test %>%
  select(-varietal)


write_csv(x = wine_train, path = "./data/wine_train.csv")
write_csv(x = wine_test, path = "./data/wine_test.csv")

wine_test = read_csv(file = "./data/wine_test.csv")


wine_final = wine %>%
  mutate(id = as.numeric(id)) %>%
  inner_join(wine_test)

write_csv(x = wine_final, path = "./data/wine_final.csv")
