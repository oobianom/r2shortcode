# r2shortcode: An R Package that Helps Shorten Other R Package Functions

### Official site: https://r2shortcode.obi.obianom.com

[![](https://rpkg.net/pub-age/r2shortcode)](https://rpkg.net/package/r2shortcode)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/r2shortcode)](https://cran.r-project.org/package=r2shortcode) [![](https://cranlogs.r-pkg.org/badges/grand-total/r2shortcode)](https://cran.r-project.org/package=r2shortcode) 


__Have you come across packages with function names that are either too long or too similar to another frequently used function? Well, what if you can change those function names and still use the package?__

Shorten function names of packages. Make it easier to use. Write long descriptive functions in your R package. Users have the choice to use the long form of the function name or shorten the functions using the r2shortcode package.

![](http://coursewhiz.org/mainsite/img/r2shortcode.jpg)


## Quick example in R

` install.packages("r2shortcode") `

` library("r2shortcode") `

### Use this package to shorten the functions in the package "r2shortcode"

` shortenPkg("r2shortcode",addPrefix = T) `

### Index all the short forms of the functions for the package

` index("r2shortcode") `

` help("r2.gP") #OR whatis("r2.gP") `

### How to use function - In this case is the "define" function 

` r2d.d("hello") instead of  r2shortcode::define("hello") `



