#' Is string uppercase?
#'
#' Simply, test if a string is uppercase and return TRUE or FALSE
#'
#' @param string The string to evaluate
#'
#'
#' @return TRUE or FALSE if the string is all upper case
#'
#' @examples
#' strTest1 <- 'OBI'
#' strTest2 <- 'obiO'
#' isUpperCase(strTest1)
#' isUpperCase(strTest2)
#'
#'
#' @export
#'


isUpperCase <- function(string) {
  return(string == toupper(string))
}
