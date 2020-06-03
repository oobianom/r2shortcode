#' Does string have special characters?
#'
#' Evaluates if a specified string contains special characters
#'
#' @param string The string to evaluate
#'
#' @export

hasSpecialCharacters <- function(string) {
  return(stringr::str_detect(string, "[[:punct:]]"))
}
