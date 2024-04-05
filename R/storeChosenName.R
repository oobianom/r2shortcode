#' Store chosen name in memory
#'
#' When all else passes, store this particular name in memory
#'
#' @param name The chosen name to store
#'
#' @return store the chosen name in storage variable
#'
#' @examples
#' nameStore <- 'ObiStore1'
#' storeChosenName(nameStore)
#'
#' @export
#'

storeChosenName <- function(name) {
  if (is.null(options()$.funCNames)) options(".funCNames" = c())
  fetchFuncNames <- c(options()$.funCNames, name)
  options(".funCNames" = fetchFuncNames)
}
