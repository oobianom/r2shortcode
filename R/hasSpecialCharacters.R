#' Does string have special characters?
#'
#' Evaluates if a specified string contains special characters
#'
#' @param string The string to evaluate
#'
#' @return TRUE or FALSE
#'
#' @examples
#' strToTest1 <- 'obi_%_good_^you'
#' strToTest2 <- 'obigoodyou'
#' hasSpecialCharacters(strToTest1)
#' hasSpecialCharacters(strToTest2)
#'
#' @export
#'

hasSpecialCharacters <- function(string) {
  return(stringr::str_detect(string, "[[:punct:]]"))
}
