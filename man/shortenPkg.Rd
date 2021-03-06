% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shortenPkg.R
\name{shortenPkg}
\alias{shortenPkg}
\title{Shorten the package}
\usage{
shortenPkg(pkg, addPrefix = T, silent = F, num.prefix = 3)
}
\arguments{
\item{pkg}{package name}

\item{addPrefix}{should prefix be added to the new names, TRUE or FALSE. Prefix will by default be first 3 letters of the package name}

\item{silent}{return messages at the end of evaluation, TRUE or FALSE}

\item{num.prefix}{if you specify to addPrefix, how many letters will you like to add?}
}
\description{
This will create shorthand functions for functions in a package. This function brings together most functions in this package.
}
