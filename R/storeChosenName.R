#' Store chosen name in memory
#'
#' When all else passes, store this particular name in memory
#'
#' @param name The chosen name to store
#'
#' @export

storeChosenName <- function(name) {
  if (is.null(options()$.funCNames)) options(".funCNames" = c())
  fetchFuncNames <- c(options()$.funCNames, name)
  options(".funCNames" = fetchFuncNames)
}
