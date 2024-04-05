#' Short algorithm to choose a short name based on a given long name
#'
#' A very simple and short algorithm to choose a short name based on a given name
#'
#' @param fullname The name you intend to shorten
#' @param withPrefix Prefix to include in front of the new short name
#' @param withSuffix Suffix to include in front of the new short name
#' @param envir The environment where to store the name
#' @param silent Return response at the end of evaluations?
#'
#' @return Short forms of functions
#'
#' @examples
#' long_function_name <- 'longFunctionCall'
#' short_function_name <- chooseShortName(long_function_name)
#' short_function_name # the result should "lFC"
#'
#' @export
#'
#'

chooseShortName <- function(fullname = stop("Invalid string name entered."), withPrefix = NULL, withSuffix = NULL, envir = NULL, silent = FALSE) {

  # package  fullname set to another variable, and if its a three letter word - just split it back out because there is no need to shorten such
  strN <- fullname
  if (nchar(gsub("[[:punct:]]", "", strN)) <= 3) {
    return(paste0(withPrefix, strN, withSuffix))
  }

  # prepare the name prior to running algorithm tests of choosing
  strSpl <- "__"
  strN.complete <- NULL
  strN.firstletter <- substr(strN, 1, 1)
  selectedN <- TRUE
  checkFirstLetterUppercase <- isUpperCase(strN.firstletter)
  checkIfAnyUpperCase <- hasUpperCase(strN)
  checkIfAnySpecialChar <- hasSpecialCharacters(strN)
  getUpperCaseOccurence <- stringr::str_extract_all(strN, "[A-Z]")[[1]]
  doNotSkip1And2 <- TRUE
  if (checkFirstLetterUppercase) {
    strN.complete <- getUpperCaseOccurence
    if (length(strN.complete) == 1) doNotSkip1And2 <- FALSE
  } else {
    if (checkIfAnyUpperCase) {
      strN.complete <- c(strN.firstletter, getUpperCaseOccurence)
    }
    else {
      if (checkIfAnySpecialChar) {
        strN.complete <- substr(strsplit(strN, "[[:punct:]]")[[1]], 1, 1)
      } else {
        doNotSkip1And2 <- FALSE
      }
    }
  }

  if (doNotSkip1And2) {

    # Test 1
    xrandsave <- searchNameSaveName(withPrefix, strN.complete, withSuffix)
    if (xrandsave[2]) {
      return(xrandsave[1])
    }


    # Test 2
    strN.complete1 <- c()
    if (checkIfAnyUpperCase) {
      strN.complete1 <- strsplit(strN, "[A-Z]")[[1]][-(1)]
    }
    else {
      strN.complete1 <- strsplit(strN, "[[:punct:]]")[[1]][-(1)]
    }
    strN.complete1.size <- length(strN.complete1)
    strN2.complete <- strN.complete
    if (strN.complete1.size) {
      strN.numChar <- nchar(strN.complete1)
      strN.numChar <- strN.numChar[order(strN.numChar, decreasing = TRUE)[1]]
      i <- 1
      origStartNrn <- origStartNrn0 <- if (checkFirstLetterUppercase) 1 else 2
      while (i <= strN.numChar) {
        strN.firstArrChar <- substr(strN.complete1, 1, i)
        for (j in 1:strN.complete1.size) {
          strN2.complete[origStartNrn] <- paste0(strN2.complete[origStartNrn], substr(strN.complete1[j], i, i))

          if (origStartNrn == length(strN2.complete)) {
            origStartNrn <- origStartNrn0
          } else {
            origStartNrn <- origStartNrn + 1
          }
          xrandsave <- searchNameSaveName(withPrefix, strN2.complete, withSuffix)
          if (xrandsave[2]) {
            return(xrandsave[1])
          }
        }
        i <- i + 1
      }
    }
  }
  # Test 3
  strN.complete <- stringr::str_extract_all(gsub("[[:punct:]]", "", strN), ".")[[1]]
  strN.complete.comb <- c()
  for (ij in strN.complete) {
    strN.complete.comb <- c(strN.complete.comb, ij)
    xrandsave <- searchNameSaveName(withPrefix, strN.complete.comb, withSuffix)
    if (xrandsave[2]) {
      return(xrandsave[1])
    }
  }

  # Test 4
  useTest5 <- paste(c(withPrefix, strN.complete, substr(format(Sys.time(), "%s"), 6, 12), withSuffix), collapse = "")
  return(useTest5)
}


#' Clears previously stored names
#'
#' Beware that by clearing all stored names, you may inadventently duplicate new shortnames
#'
#' @param w what to clear
#'
#' @return empty stores for chosen name
#'
#' @examples
#' nametostore = "ujuo"
#' storeChosenName(nametostore) #store the chosen name
#' nameAlreadyExists(nametostore) #check if the chosen name now exists in store
#' clearStoredNames("all") #clear storage of all names
#' nameAlreadyExists(nametostore) #check if the chosen name now exists in store, it should not
#'
#' @export
#'
clearStoredNames <- function(w = "all") {
  if(w == "all"){
   oldoptions <- options(".funCNames" = c())
  }
}
