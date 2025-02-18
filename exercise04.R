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
pick_solution <- function(x){
  x <- x[nchar(x) == 5]
  x <- sample(x, 1)
  x <- strsplit(x, "") [1]
}
solution <- pick_solution(solution_list)
str(solution)
#step four
evaluate_guess <- function(guessChr, solution) {
  wordLength <- length(solution)
  result <- rep("-",wordLength)
  for (i in 1:wordLength) {
    if (guessChr[i] == solution[i]) {
      result[i] <- "*"
      solution[i] <- "-"
    }
  }
  for (i in 1:wordLength) {
    if (result[i] != "*") {
      idx <- match(guessChr[i], solution)
      if (!is.na(idx)) {
        result[i] <- "+"
        solution[idx] <- "-"
      }
    }
  }
  result
}
play_wordle2 <- function(x = solution,y = valid_list, num_guesses=6){
    print(paste("You have", num_guesses, 
                "chances to guess a 5 letter word"))
  guess_num <- 0
  lettersLeft <- LETTERS
  print(paste(c("Letters left:", lettersLeft), collapse = " "))
  guess_num <- guess_num + 1
  guess <- readline(paste0("Write your guess, then press <enter> [You have ", 
                           7-guess_num, " guesses left]:"))
  guess <- toupper(guess)
  while (nchar(guess) != 5) {
    guess <- readline(paste0("This guess doesn't match the criteria. It must be a valid word and exactly 5 characters long: "))
    }
  guessChr <- strsplit(guess, "") [1]
  result <- evaluate_guess(guessChr, solution)
  lettersLeft <- setdiff(lettersLeft, guessChr)
  print(paste(strsplit(guess, "")[[1]], collapse = " "))
  print(paste(result, collapse = " "))
  if (all(result == "*")) {
    print("You won!")
    return(guess_num)
    }
  print("Looks like you lost! The answer was ", paste(solution, collapse = " "))
  return(guess_num)
  }
play_wordle2()

| guess[!(guess %in% valid_list)]
