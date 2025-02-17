library(tidyverse)
#step one
load.dictionary <- function(x){
  x <- read.delim(x)
    as.vector(x$words)
}
valid_list <- load.dictionary("collins-scrabble-words-2019.txt")  
str(valid_list)
solution_test <- load.dictionary("google-10000-english-usa-no-swears.txt")
str(solution_test)
#step two
solution_list <- intersect(valid_list, solution_test)
str(solution_list)
#step three
pick.solution <- function(x){
  x <- x[nchar(x) == 5]
  x <- sample(x, 1)
  x <- strsplit(x, "")
}
solution <- pick.solution(solution_list)
str(solution)
#step four
evaluate_guess <- function(x, solution) {
  
}
play_wordle <- function(x = solution,y = valid_list, num_guesses=6){
    intro <- paste("You have", num_guesses, "chances to guess a 5 letter word")
    print(intro)
    cat("Letters left:", paste(LETTERS, collapse = " "))
    guess <- readline("Write your guess, then press <enter> ")
    guess <- toupper(guess)
    cat(ifelse(nchar(guess) != 5 | guess[guess %in% valid_list],
               "This question doesn't match the criteria. It must be a valid word and exactly 5 characters long",
               " "))
}
play_wordle()