myFirstRFunc <- function(n) {
  i = 0
  sum = 0
  tryCatch(
    expr = {
      for (i in 1:n - 1) {
        if (i %% 2 == 0 || i %% 7 == 0) {
          sum = sum + i
        }
      }
      print(sum)
    },
    error = function(e) {
      print("Please enter numeric input")
    }
  )
}

myFirstRFunc(-10)
