#' Index a shortened package
#'
#' This function will provide you the list of shorthand functions created for a package
#'
#' @param pkg The package name
#'
#' @return List of long and short forms of particular functions
#'
#' @examples
#' \donttest{
#' if(interactive()){
#' pkgname <- 'qpdf'
#' shortenPkg(pkgname,TRUE)
#' index(pkgname)
#' }
#' }
#' @export
#'


index <- function(pkg = stop("Enter a package name to index")) {

  # retrieve the reference storage
  fetchPkg <- options()$.funCNamesPkgReference
  # set response to deliver at the end of the evaluation
  reply <- 0
  # prepare the package name to search for
  pkgstorethan <- paste0("package:r2shortcode_", pkg)

  # if the reference storage is available, then search for the package and its shorthand functions
  if (is.null(fetchPkg)) {
    reply <- 1
  } else {
    fetchPkgList <- fetchPkg[fetchPkg$pkgName == pkgstorethan, ]
    if (nrow(fetchPkgList)) {
      yOutput <- fetchPkgList[, c(1:2)]
      names(yOutput) <- c("Short Function", "Original Function")
      utils::head(yOutput)
      message("Use help(short-function-name) or whatis(short-function-name) to get the definitions.")
    }
    else {
      reply <- 1
    }
  }

  # deliver a harsh reply if the user did not previously shorten the package
  if (reply == 1) {
    warning(paste0("You need to first use the shortenPkg() to shorten ", pkg, " before using the index()"))
  }
}
