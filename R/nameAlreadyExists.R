#' Does name already exist in memory?
#'
#' Evaluates if a name has already been saved by the r2shortcode. Keep in mind that if you previously used the clear function, previously saved names will be cleared
#'
#' @param name The name to lookup
#'
#' @return TRUE or FALSE
#'
#' @examples
#' nameToCheck <- 'Obinna'
#' nameAlreadyExists(nameToCheck)
#'
#' @export
#'


nameAlreadyExists <- function(name) {
  if (is.null(options()$.funCNames)) options(".funCNames" = c())
  fetchFuncNames <- options()$.funCNames
  return(name %in% fetchFuncNames)
}
