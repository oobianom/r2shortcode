#' Help for all functions
#'
#' Access help for all functions including any newly created shorthand functions
#'
#' @param functionName function name to search for
#' @param package package name containing the function. Leave unentered if this is a shorthand function
#'
#'
#' @return Documentation for function
#'
#' @examples
#' \donttest{
#' pkgname <- 'qpdf' #pacakge name
#' shortenPkg(pkgname,TRUE) #shorten the package
#' index(pkgname) #index the package functions shortened
#' help('qpd.pl') #choose a function name and find help
#' }
#'
#' @export
#'


help <- function(functionName, package = NULL) {

  # check if the functionName is a shorthand. If it is, then reroute to the original function.
  fetchPkg <- options()$.funCNamesPkgReference
  if (!is.null(fetchPkg)) {
    if (is.list(fetchPkg)) {
      if (nrow(fetchPkg) & ncol(fetchPkg)) {
        fetchPkgList <- fetchPkg[fetchPkg$shortFunc == functionName, ]
        if (nrow(fetchPkgList)) {
          fetchPkgList.cont <- strsplit(as.character(fetchPkgList$origFunc[1]), "::")[[1]]
          package <- as.character(fetchPkgList.cont[1])
          functionName <- as.character(fetchPkgList.cont[2])
        }
      }
    }
  }

  # call help from the utils package, help!!!
  whatToEval <- paste0("utils::help(topic=", functionName, ",package=", package, ")")
  eval(parse(text = as.character(whatToEval)))
}

#' Help for all functions
#'
#' Access help for all functions including any newly created shorthand functions
#'
#' @inheritParams help
#'
#' @return help for the particular function
#'
#' @examples
#' \donttest{
#' pkgname <- 'qpdf' #pacakge name
#' shortenPkg(pkgname,TRUE) #shorten the package
#' index(pkgname) #index the package functions shortened
#' whatis('qpd.pl') #choose a function name and find help
#' }
#'
#' @export

whatis <- help
