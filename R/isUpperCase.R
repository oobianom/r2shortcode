#' Is string uppercase?
#'
#' Simply, evaluate if a string is uppercase
#'
#' @param string The string to evaluate
#'
#'
#' @export

isUpperCase <- function(string) {
  return(string == toupper(string))
}
