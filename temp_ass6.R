sample_x_0310 <- function(alpha, beta, n) {
  df <- data.frame(U = runif(n)) %>%
    mutate(X = case_when((0 <= U) & (U < alpha) ~ 3,
                         (alpha <= U) & (U < (alpha + beta)) ~ 10,
                         ((alpha + beta) <= U) & (U <= 1) ~ 0)) %>%
    pull(X)
  return(df)
}


temp <- data.frame(beta = seq(1/10, 9/10, 0.01))
vals <- c(3, 10, 0)
probs <- c(1/10, i, (1 - 1/10 - i))


myData <- temp %>%
  mutate(sample_x = map(.x = beta, ~sample_x_0310(1/10, .x, 100)),
         samplemean = mean(sample_x))
  #sample_x <- sample_x_0310(1/10, i, 100)
  #samplemean = mean(sample_x)
  #Expectation = weighted.mean(vals, probs)
} 

