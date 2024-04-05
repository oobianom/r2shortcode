#' Contains uppercase?
#'
#' Simply change if there is any uppercase letter in a string
#'
#' @param string the string to evaluate
#'
#' @return TRUE or FALSE if the string has an upper case letter
#'
#' @examples
#' strToTest1 <- 'obiWentToSchool'
#' strToTest2 <- 'obiwenttoschool'
#' hasUpperCase(strToTest1)
#' hasUpperCase(strToTest2)
#'
#'
#' @export
#'

hasUpperCase <- function(string) {
  return(!is.na(stringr::str_extract(string, "[A-Z]")))
}
