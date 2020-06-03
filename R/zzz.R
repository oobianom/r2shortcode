.onLoad <- function(libname, pkgname) {
  #clear the environment of previous stores
  options(".funCNames"= c())
  options(".funCNamesPkgReference" = data.frame())
}

.onAttach <- function(libname, pkgname) {
  #deliver a welcoming message, very important
  packageStartupMessage("\nr2shortcodes: a package that shortens your other packages")
}

