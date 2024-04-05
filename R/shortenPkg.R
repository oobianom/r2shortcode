#' Shorten the package
#'
#' This will create shorthand functions for functions in a package. This function brings together most functions in this package.
#'
#' @param pkg package name
#' @param addPrefix should prefix be added to the new names, TRUE or FALSE. Prefix will by default be first 3 letters of the package name
#' @param silent return messages at the end of evaluation, TRUE or FALSE
#' @param num.prefix if you specify to addPrefix, how many letters will you like to add?
#'
#' @return short function names for all the functions in the package
#'
#' @examples
#' \donttest{
#' pkg <- 'qpdf'
#' shortenPkg(pkg,FALSE,TRUE)
#' }
#'
#' @export
#'


shortenPkg <- function(pkg, addPrefix = TRUE, silent = FALSE, num.prefix = 3) {
  # disallow shortening r2shortcode, there is no point to do this
  if (pkg == "r2shortcode") stop("Sorry, you cannot shorten a shortener")

  # prepare the prefix name to include based on the value of addPrefix
  if (addPrefix) addPrefix <- paste0(substr(pkg, 1, num.prefix), ".") else addPrefix <- NULL
  if (is.null(options()$.funCNamesPkgReference)) options(".funCNamesPkgReference" = data.frame())
  if (!is.environment(".spkg")) .spkg <- new.env(parent = .GlobalEnv)
  # load the package
  librarypkg <- paste0("library(", pkg, ")")
  suppressWarnings(suppressMessages(eval(parse(text = as.character(librarypkg)))))

  # if it loaded properly, extract the function and rename them
  if (length(grep(sprintf("package:%s", pkg), search()))) {
    functionlist <- ls(sprintf("package:%s", pkg))
    pkgstorethan <- paste0("package:r2shortcode_", pkg)
    prepDTforRef00 <- function() {
      return(options()$.funCNamesPkgReference)
    }
    # detach if it already exists
    discardShortcodes(pkg = pkg, reflib = prepDTforRef00(), response = FALSE)

    # recraft new shortcodes
    for (i in functionlist) {
      newShortName <- chooseShortName(i, withPrefix = addPrefix)
      if (!is.null(newShortName)) {
        # if a short name is derived, save it. else, do not.
        prepDTforRef0 <- prepDTforRef00()
        prepDTforRef <- data.frame(shortFunc = newShortName, origFunc = paste0(pkg, "::", i), pkgName = pkgstorethan)
        options(".funCNamesPkgReference" = (if (is.null(prepDTforRef0)) prepDTforRef else rbind(prepDTforRef0, prepDTforRef)))
        try(assign(newShortName, eval(parse(text = as.character(i))), envir = .spkg), silent = TRUE)
      }
      else {
        if (!silent) message(paste0("short name found for ", pkg, "::", i, "\n"))
      }
    }
    # attach the function pack created
    finallisttoattach <- paste0("suppressWarnings(suppressMessages(attach(.spkg, name = pkgstorethan)))")
    eval(parse(text = as.character(finallisttoattach)))

    # if silence is not requested, shout out the good news
    if (!silent) message(paste0("Successfully shortened ", pkg, '. To view the functions and their equivalence, enter index("', pkg, '")\n'))
  }
  else {
    # if the package has not been installed, shout at the user
    stop(sprintf("%s is not a valid package name.\n", pkg))
  }
}
