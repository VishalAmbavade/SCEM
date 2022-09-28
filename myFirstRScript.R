animals <- c("Tiger", "Lion", "Snake", "Ostrich", "Elephant")

num_legs <- c(4, 4, 0, 2, 4)

animals_df <- data.frame(animals, num_legs)

animals_df


#########################################################
x_vect <- seq(12, 2, by = -2)

X <- matrix(x_vect, nrow = 2, ncol = 3)

Y <- matrix(seq(1, 4), nrow = 2, ncol = 2)

Z <- matrix(seq(4, 10, by = 2), nrow = 2, ncol = 2)


Yt <- t(Y)
Zt <- t(Z)

Y_plus_Z <- Y + Z
Z_plus_Y <- Z + Y

Y_mul_Z <- Y %*% Z
Y_mul_Z

Z_mul_Y <- Z %*% Y
Z_mul_Y

Y_mul_X <- Y %*% X
Y_mul_X

X_mul_Y <- X %*% Y

Y_inv <- solve(Y)

Y_inv %*% Y
Y_inv %*% X

solve(Y) %*% X
