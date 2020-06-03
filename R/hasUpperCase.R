#' Contains uppercase?
#'
#' Simply change if there is any uppercase letter in a string
#'
#' @param string the string to evaluate
#'
#' @export

hasUpperCase <- function(string) {
  return(!is.na(stringr::str_extract(string,"[A-Z]")))
}
