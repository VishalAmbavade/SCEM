library(tidyverse)
library(ggplot2)
library(reshape2)
library(dplyr)

sample_x_0310 <- function(alpha, beta, n) {
  df <- data.frame(U = runif(n)) %>%
    mutate(X = case_when((0 <= U) & (U < alpha) ~ 3,
                         (alpha <= U) & (U < (alpha + beta)) ~ 10,
                         ((alpha + beta) <= U) & (U <= 1) ~ 0)) %>%
    pull(X)
  return(df)
}


temp <- data.frame(beta = seq(1/10, 9/10, 0.01))

newEx <- c()
for (i in myData$beta) {
  vals <- c(3, 10, 0)
  probs <- c(1/10, i, 1 - (0.1 + i))
  Ex <- weighted.mean(vals, probs)
  newEx <- c(newEx, Ex)
}

vals <- c(3, 10, 0)
probs <- c(1/2, 1/10, 2/5)
Ex <- weighted.mean(vals, probs)
Ex

Ex_df <- data.frame(myData$beta * Ex)

myData <- temp %>%
  mutate(sample_x = map(.x = beta, ~sample_x_0310(1/10, .x, 100)),
         samplemean = map_dbl(.x = sample_x, ~mean(.x)),
         #probs = map(.x = beta, ~rep(.x, times = 100)),
         Expectation = newEx)
         #sumCol = map_dbl(.x = sample_x, ~sum(.x)))
         #Expectation = weighted.mean(sample_x, probs))


         #Expectation = map_dbl(.x = beta, ~weighted.mean(sample_x, probs)))

zzz <- myData %>%
  unlist(sample_x)
  #sample_x <- sample_x_0310(1/10, i, 100)
  #samplemean = mean(sample_x)
  #Expectation = weighted.mean(vals, probs)

d <- gather(myData, key = "attr", value = "value", Expectation, samplemean)

ggplot(d, aes(x = beta, y = value, color = attr)) +
  geom_point()


