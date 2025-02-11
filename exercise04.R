load.directory <- function(x){
  tmp <- read.delim(x)
}
valid_test <- load.directory("collins-scrabble-words-2019.txt")  
str(valid_test)
solution_test <- load.directory("google-10000-english-usa-no-swears.txt")
str(solution_test)
