#' Search for the existence of a name and save if unavailable
#'
#' Carries out a search on the already used shorthand function names and if the new name does not exist, it saves it
#'
#' @param withPrefix Provide the prefix to use for the function name, could use NULL
#' @param strN.complete Provide the function name to search for, and save if feasible
#' @param withSuffix Provide the suffix to use for the function name, could use NULL
#'
#' @return Concatenate of search and a boolean
#'
#' @examples
#' nameToCheck <- 'ObiObianom'
#' searchNameSaveName(strN.complete= nameToCheck)
#' searchNameSaveName(strN.complete= nameToCheck)
#'
#'
#' @export
#'

searchNameSaveName <- function(withPrefix = NULL, strN.complete, withSuffix = NULL) {
  searchName <- paste(c(withPrefix, strN.complete, withSuffix), collapse = "")
  if (!nameAlreadyExists(searchName)) {
    storeChosenName(searchName)
    return(c(searchName, TRUE))
  }
  else {
    return(c(FALSE, FALSE))
  }
}
